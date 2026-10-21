import mq3.vm.cgame_pc_traps as pcTraps
import mq3.vm.pc_parser as pcParser
import mq3.vm.syscall_cgame as cgame
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commandBuffer
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Fixture calls token location end struct
struct Files end struct

function require(value,label) if not value then return error(7491,"cgame PC traps: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function invoke(host,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return pcTraps.dispatch(host,vm,base) end function
function invokeCgame(host,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return cgame.dispatch(host,vm,base) end function
function addDefine(fixture,text) fixture.calls=fixture.calls+[["define",text]];return 1 end function
function loadSource(fixture,text) fixture.calls=fixture.calls+[["load",text]];return 17 end function
function freeSource(fixture,handle) fixture.calls=fixture.calls+[["free",handle]];if handle==17 then return 1 else return 0 end if end function
function fixtureRead(fixture,handle) fixture.calls=fixture.calls+[["read",handle]];return fixture.token end function
function fixtureLocation(fixture,handle) fixture.calls=fixture.calls+[["line",handle]];return fixture.location end function
function loadFile(files,name) if name=="hud.menu" then return bytes("VALUE") end if;return void end function

function main(args)
  vm=Machine(bytes(4096,0),4095);base=3900;count=0;fixture=Fixture([],void,void);host=pcTraps.services(fixture)
  host.addDefineFn=addDefine;host.loadSourceFn=loadSource;host.freeSourceFn=freeSource;host.readTokenFn=fixtureRead;host.sourceLineFn=fixtureLocation
  put(vm,64,"VALUE 42");put(vm,96,"hud.menu")
  count=count+require(invoke(host,vm,base,[64,64])==1 and fixture.calls[0]==["define","VALUE 42"],"global define callback")
  count=count+require(invoke(host,vm,base,[65,96])==17 and fixture.calls[1]==["load","hud.menu"],"source load callback")
  count=count+require(invoke(host,vm,base,[66,17])==1 and invoke(host,vm,base,[66,2])==0,"source free result")
  put(vm,160,"hud.menu");count=count+require(invoke(host,vm,base,[65,4256])==17,"masked source-name pointer")
  token=pcParser.encode(pcParser.Token(pcParser.TT_NAME,5,0,0.0,"VALUE",3,false));fixture.token=pcTraps.TokenResult(true,token)
  count=count+require(invoke(host,vm,base,[67,17,512])==1 and slice(vm.data,512,1040)==token,"pc_token_t exact output")
  count=count+require(fixture.calls[len(fixture.calls)-1]==["read",17],"read token handle forwarding")
  fixture.token=pcTraps.TokenResult(false,void);before=slice(vm.data,512,1040);count=count+require(invoke(host,vm,base,[67,17,512])==0 and slice(vm.data,512,1040)==before,"token EOF leaves output untouched")
  fixture.token=pcTraps.TokenResult(true,bytes(12,0));count=count+require(try(invoke(host,vm,base,[67,17,512])) is error,"reject malformed pc_token_t")
  fixture.token=pcTraps.TokenResult(true,token);count=count+require(try(invoke(host,vm,base,[67,17,3600])) is error,"validate full pc_token_t output span")
  fixture.location=pcTraps.SourceLocation(true,"menus/hud.menu",27)
  count=count+require(invoke(host,vm,base,[68,17,1700,1800])==1 and decode(slice(vm.data,1700,14))=="menus/hud.menu" and n.readI32(vm.data,1800)==27,"source filename and line output")
  count=count+require(vm.data[1714]==0 and fixture.calls[len(fixture.calls)-1]==["line",17],"source filename NUL termination")
  fixture.location=pcTraps.SourceLocation(false,"",0);before=slice(vm.data,1700,64);count=count+require(invoke(host,vm,base,[68,99,1700,1800])==0 and slice(vm.data,1700,64)==before,"invalid source handle leaves outputs untouched")
  fixture.location=pcTraps.SourceLocation(true,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-long",9)
  count=count+require(invoke(host,vm,base,[68,17,1700,1800])==1 and vm.data[1763]==0,"source name bounded to MAX_QPATH")
  count=count+require(try(invoke(host,vm,base,[68,17,4070,1800])) is error,"validate filename output span")
  count=count+require(try(invoke(host,vm,base,[68,17,1700,4094])) is error,"validate line output span")
  empty=pcTraps.services(fixture)
  count=count+require(try(invoke(empty,vm,base,[64,64])) is error,"missing define service")
  count=count+require(try(invoke(empty,vm,base,[65,96])) is error,"missing load service")
  count=count+require(try(invoke(empty,vm,base,[66,17])) is error,"missing free service")
  count=count+require(try(invoke(empty,vm,base,[67,17,512])) is error,"missing read service")
  count=count+require(try(invoke(empty,vm,base,[68,17,1700,1800])) is error,"missing location service")
  count=count+require(try(invoke(host,vm,base,[63])) is error,"unrelated trap rejected")
  count=count+require(try(pcTraps.dispatch(void,vm,base)) is error,"invalid host rejected")
  vm.data[4095]=65;count=count+require(try(invoke(host,vm,base,[64,4095])) is error,"unterminated define rejected");vm.data[4095]=0
  registry=pcParser.create(Files(),loadFile);registryHost=pcTraps.registryServices(registry);put(vm,96,"hud.menu")
  handle=invoke(registryHost,vm,base,[65,96]);count=count+require(handle==1,"registry adapter loads source")
  count=count+require(invoke(registryHost,vm,base,[67,handle,512])==1 and decode(slice(vm.data,528,5))=="VALUE","registry adapter encodes token")
  count=count+require(invoke(registryHost,vm,base,[68,handle,1700,1800])==1 and decode(slice(vm.data,1700,8))=="hud.menu" and n.readI32(vm.data,1800)==1,"registry adapter source location")
  count=count+require(invoke(registryHost,vm,base,[66,handle])==1 and invoke(registryHost,vm,base,[67,handle,512])==0,"registry adapter frees source")
  shared=common.services(cvar.create(),commandBuffer.create(),fixture);client=cgame.services(shared,fixture);client.pcServices=host;fixture.token=pcTraps.TokenResult(true,token)
  count=count+require(invokeCgame(client,vm,base,[67,17,512])==1 and slice(vm.data,512,1040)==token,"central cgame dispatcher routes PC trap")
  client.pcServices=void;fallbackCalls=[];client.extendedFn=function(context,machine,at,op) => op+1000
  count=count+require(invokeCgame(client,vm,base,[64,64])==1064,"central dispatcher preserves extended fallback")
  print("PASS: "+str(count)+" cgame PC-trap contracts");return 0
end function
