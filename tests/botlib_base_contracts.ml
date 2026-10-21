import mq3.botlib.crc16 as crc
import mq3.botlib.lib_variables as vars
import mq3.botlib.lifecycle_runtime as runtime
import mq3.compat.numeric as n

struct Holder variables end struct
function require(ok,label) if not ok then return error(7590,"botlib base contract: "+label) end if;return 1 end function
function main(args)
  checks=0
  checks=checks+require(crc.init()==65535 and crc.value(crc.init())==65535,"CRC init/value")
  checks=checks+require(crc.processString("123456789")==0x29b1,"standard CRC vector")
  data=bytes([0,255,128,1,2]);whole=crc.processSpan(data,0,5);partial=crc.continueSpan(crc.init(),data,0,2);partial=crc.continueSpan(partial,data,2,3)
  checks=checks+require(whole==partial,"continued CRC equals whole span")
  checks=checks+require(crc.processSpan(data,1,3)==crc.continueSpan(crc.init(),data,1,3),"CRC offset/count")
  checks=checks+require(vars.stringValue("")==0.0 and vars.stringValue("0")==0.0 and vars.stringValue("123")==123.0,"decimal integers")
  checks=checks+require(n.floatBits(vars.stringValue("12.5"))==n.floatBits(12.5) and n.floatBits(vars.stringValue(".5"))==n.floatBits(0.5),"decimal fractions")
  checks=checks+require(vars.stringValue("-1")==0.0 and vars.stringValue("1.2.3")==0.0 and vars.stringValue("2x")==0.0,"invalid values rejected")
  state=Holder([]);a=vars.variable(state,"alpha","1.25");b=vars.variable(state,"ALPHA","9")
  checks=checks+require(a==b and len(state.variables)==1 and vars.getString(state,"alpha")=="1.25","case-insensitive default is create-once")
  checks=checks+require(vars.changed(state,"ALPHA") and n.floatBits(vars.getValue(state,"alpha"))==n.floatBits(1.25),"value and modified state")
  vars.setNotModified(state,"alpha");checks=checks+require(not vars.changed(state,"ALPHA"),"clear modified")
  vars.set(state,"Alpha","7.75");checks=checks+require(vars.changed(state,"alpha") and vars.getString(state,"ALPHA")=="7.75","set replaces case-insensitive value")
  second=vars.variable(state,"beta","2");checks=checks+require(state.variables[0]==second and state.variables[1]==a,"new variables prepend like linked list")
  vars.deAlloc(state,second);checks=checks+require(len(state.variables)==1 and vars.get(state,"beta")==void,"individual deallocation")
  vars.deAllocAll(state);checks=checks+require(len(state.variables)==0 and vars.getString(state,"none")=="" and vars.getValue(state,"none")==0.0,"deallocate all and missing defaults")
  live=runtime.create();runtime.varDefault(live,"maxclients","8");runtime.varSet(live,"MAXCLIENTS","12");checks=checks+require(runtime.varGet(live,"maxclients")=="12" and runtime.varGetValue(live,"MAXCLIENTS")==12.0,"productive lifecycle uses libvar layer")
  runtime.varSetNotModified(live,"maxclients");checks=checks+require(not runtime.varChanged(live,"MAXCLIENTS"),"productive modified state")
  runtime.setup(live);checks=checks+require(live.maxclients==12,"productive setup consumes libvar")
  runtime.shutdown(live);checks=checks+require(len(live.variables)==0,"productive shutdown deallocates variables")
  print("PASS: "+str(checks)+" botlib base contracts");return 0
end function
