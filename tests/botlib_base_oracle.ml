import mq3.botlib.crc16 as crc
import mq3.botlib.lib_variables as vars
import mq3.compat.numeric as n

struct State variables end struct
function flag(value) if value then return 1 end if;return 0 end function
function crcRecord(name,data)
  whole=crc.processSpan(data,0,len(data));pivot=len(data)>>1;split=crc.init();split=crc.continueSpan(split,data,0,pivot);split=crc.continueSpan(split,data,pivot,len(data)-pivot)
  print("C|"+name+"|"+str(whole)+"|"+str(crc.value(split)))
end function
function valueRecord(text) print("V|"+text+"|"+str(n.floatBits(vars.stringValue(text)))) end function
function main(args)
  crcRecord("empty",bytes(""));crcRecord("digits",bytes("123456789"));crcRecord("quake",bytes("Quake III Arena"));crcRecord("binary",bytes([0,1,2,3,63,64,126,127]))
  partial=crc.processByte(crc.processByte(crc.init(),65),66);print("B|"+str(partial)+"|"+str(crc.value(partial)))
  for each text in ["","0","1","123","12.5","0.125",".5","1.2.3","-1","12x"] valueRecord(text) end for
  state=State([]);first=vars.variable(state,"MaxClients","8");same=vars.variable(state,"maxclients","99")
  print("L|first|"+first.name+"|"+first.value+"|"+str(n.floatBits(first.numericValue))+"|"+str(flag(first.modified))+"|"+str(flag(first==same)))
  vars.setNotModified(state,"MAXCLIENTS");print("L|clean|"+str(flag(vars.changed(state,"maxclients"))))
  vars.set(state,"maxclients","12.25");print("L|set|"+vars.getString(state,"MAXCLIENTS")+"|"+str(n.floatBits(vars.getValue(state,"MaxClients")))+"|"+str(flag(vars.changed(state,"maxclients"))))
  second=vars.variable(state,"developer","1");print("L|order|"+state.variables[0].name+"|"+state.variables[1].name+"|"+str(flag(second==state.variables[0])))
  print("L|missing|"+vars.getString(state,"missing")+"|"+str(n.floatBits(vars.getValue(state,"missing")))+"|"+str(flag(vars.changed(state,"missing"))))
  vars.deAllocAll(state);print("L|clear|"+str(flag(len(state.variables)==0)));return 0
end function
