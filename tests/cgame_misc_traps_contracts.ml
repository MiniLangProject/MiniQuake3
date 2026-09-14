import std.time as time
import mq3.compat.numeric as n
import mq3.vm.cgame_misc_traps as traps

struct Vm data mask end struct

function require(condition,message) if not condition then return error(7485,message) end if;return 1 end function
function f32(vm,address,value) n.writeU32(vm.data,address,n.floatBits(value));return void end function
function field(data,index) return n.readI32(data,index*4) end function

function main(args)
  count=0;vm=Vm(bytes(512,0),511)
  date=time.Date(2024,2,29);clock=time.Time(23,58,57,999);encoded=traps.encodeQtime(time.DateTime(date,clock),1)
  count=count+require(len(encoded)==36,"qtime_t occupies nine QVM ints")
  count=count+require([field(encoded,0),field(encoded,1),field(encoded,2),field(encoded,3)]==[57,58,23,29],"qtime clock/day field order")
  count=count+require([field(encoded,4),field(encoded,5),field(encoded,6),field(encoded,7),field(encoded,8)]==[1,124,4,59,1],"qtime C month/year/weekday/yearday/DST conventions")
  sample=traps.RealTimeValue(1709251137,encoded)
  count=count+require(traps.realTime(vm,64,sample)==1709251137 and slice(vm.data,64,36)==encoded,"CG_REAL_TIME returns epoch and writes qtime_t")
  before=slice(vm.data,0,len(vm.data));count=count+require(traps.realTime(vm,0,sample)==1709251137 and vm.data==before,"CG_REAL_TIME accepts NULL qtime_t")
  count=count+require(try(traps.realTime(vm,490,sample)) is error,"CG_REAL_TIME validates the full output span")
  live=traps.sampleRealTime();count=count+require(not (live is error) and typeof(live.epoch)=="int" and live.epoch>1600000000 and len(live.data)==36,"portable wall clock supplies QVM-compatible epoch and layout")
  f32(vm,128,1.5);f32(vm,132,2.5);f32(vm,136,-1.5);count=count+require(traps.snapVector(vm,128)==0,"CG_SNAPVECTOR returns zero")
  count=count+require([n.bitsFloat(n.readU32(vm.data,128)),n.bitsFloat(n.readU32(vm.data,132)),n.bitsFloat(n.readU32(vm.data,136))]==[2.0,2.0,-2.0],"CG_SNAPVECTOR uses Win32 ties-to-even rounding")
  f32(vm,88,-2.5);f32(vm,92,3.5);f32(vm,96,4.49);traps.snapVector(vm,600)
  count=count+require([n.bitsFloat(n.readU32(vm.data,88)),n.bitsFloat(n.readU32(vm.data,92)),n.bitsFloat(n.readU32(vm.data,96))]==[-2.0,4.0,4.0],"CG_SNAPVECTOR honors masked VM pointers")
  count=count+require(try(traps.snapVector(vm,508)) is error,"CG_SNAPVECTOR validates vec3 span")
  tokens=traps.createEntityTokens("{ \"classname\" \"worldspawn\" }")
  count=count+require(traps.entityToken(vm,200,16,tokens)==1 and decode(slice(vm.data,200,1))=="{","CG_GET_ENTITY_TOKEN writes first token")
  count=count+require(traps.entityToken(vm,200,6,tokens)==1 and decode(slice(vm.data,200,5))=="class","CG_GET_ENTITY_TOKEN truncates with terminator")
  traps.entityToken(vm,200,16,tokens);traps.entityToken(vm,200,16,tokens)
  count=count+require(traps.entityToken(vm,200,16,tokens)==0 and vm.data[200]==0,"CG_GET_ENTITY_TOKEN clears output and returns false at EOF")
  count=count+require(traps.entityToken(vm,200,16,tokens)==1 and vm.data[200]==123,"entity parser restarts after EOF like R_GetEntityToken")
  count=count+require(try(traps.entityToken(vm,200,0,tokens)) is error,"entity-token buffer requires positive capacity")
  count=count+require(try(traps.entityToken(vm,510,8,tokens)) is error,"entity-token buffer span is validated before parsing")
  print("PASS: "+str(count)+" cgame misc-trap contracts");return 0
end function
