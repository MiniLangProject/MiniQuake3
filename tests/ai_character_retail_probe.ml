import mq3.format.pk3 as pk3
import mq3.botlib.ai_characters as chars
import mq3.botlib.ai_character_syscalls as traps
import mq3.compat.numeric as n

struct Context archive reads end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7557,"Sarge character: "+label) end if;return 1 end function
function close(a,b) difference=a-b;if difference<0 then difference=0-difference end if;return difference<0.00001 end function
function readFile(c,path) c.reads=c.reads+1;return pk3.read(c.archive,path) end function
function putString(vm,at,text) value=bytes(text);copyBytes(vm.data,at,value,0,len(value));vm.data[at+len(value)]=0 end function
function textAt(vm,at) stop=at;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,at,stop-at)) end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return traps.dispatch(state,vm,base,values[0]) end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;c=Context(archive,0);state=chars.create(16,c,readFile);checks=0
  handle=chars.loadCharacter(state,"bots/sarge_c.c",3.0);checks=checks+require(handle==5 and close(chars.characterAt(state,handle).skill,3.0),"skill 3 interpolation and handles")
  checks=checks+require(chars.characteristicString(state,handle,0)=="Sarge" and chars.characteristicString(state,handle,1)=="male","retail identity")
  checks=checks+require(chars.characteristicString(state,handle,3)=="bots/sarge_w.c" and chars.characteristicString(state,handle,21)=="bots/sarge_t.c","retail resource strings")
  checks=checks+require(close(chars.characteristicFloat(state,handle,2),0.6666667) and close(chars.characteristicFloat(state,handle,16),0.5833333),"retail interpolated combat skills")
  checks=checks+require(close(chars.characteristicFloat(state,handle,6),1.3333333) and chars.characteristicInteger(state,handle,23)==400,"retail reaction and integer")
  checks=checks+require(chars.characteristicFloat(state,handle,48)==0.0,"default-only walker inherited")
  reads=state.fileReads;checks=checks+require(chars.loadCharacter(state,"bots/sarge_c.c",3.0)==handle and state.fileReads==reads,"retail interpolated cache")
  vm=Machine(bytes(1024,0),1023);base=900;putString(vm,100,"bots/sarge_c.c");exact=invoke(state,vm,base,[chars.OP_LOAD_CHARACTER,100,n.floatBits(5.0)]);invoke(state,vm,base,[chars.OP_CHARACTERISTIC_STRING,exact,0,200,16])
  checks=checks+require(textAt(vm,200)=="Sarge" and n.bitsFloat(invoke(state,vm,base,[chars.OP_CHARACTERISTIC_BFLOAT,exact,7,n.floatBits(0.0),n.floatBits(0.5)]))==0.5,"retail QVM marshalling")
  print("PASS: retail Sarge character checks="+str(checks)+" handle="+str(handle)+" files="+str(state.fileReads)+" attack="+str(chars.characteristicFloat(state,handle,2))+" reaction="+str(chars.characteristicFloat(state,handle,6)));return 0
end function
