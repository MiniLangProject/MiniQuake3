import mq3.botlib.ai_chat_matches as matches
import mq3.botlib.ai_chat_match_syscalls as traps
import mq3.compat.numeric as n

struct Context paths texts reads end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7599,"AI chat match: "+label) end if;return 1 end function
function readFile(context,path) context.reads=context.reads+1;for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return error(7599,"missing "+path) end function
function fixture()
  source="#define CTX 4\n#define KIND 7\n#define SUB 9\nCTX { \"(\", 0, \")\", 1, \" attack \"|\" defend \", 2 = (KIND, SUB); \"ping\" = (8, 0); }\n2 { \"hello \"|\"hi \", 0 = (3, 1); }\n"
  return Context(["botfiles/match.c"],[source],0)
end function
function put(vm,address,value) data=bytes(value);copyBytes(vm.data,address,data,0,len(data));vm.data[address+len(data)]=0;return void end function
function arg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function qvmString(vm,address) stop=address;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,address,stop-address)) end function

function main(args)
  checks=0;checks=checks+require(matches.stringContains("AbCdEf","cde",false)==2 and matches.stringContains("AbCdEf","cde",true)==-1 and matches.stringContains("abc","",true)==0,"op517 original substring semantics")
  context=fixture();state=matches.create(context,readFile);checks=checks+require(matches.ensureLoaded(state)==3 and context.reads==1,"match.c templates and macro expansion")
  match=matches.findMatch(state,"(Ranger) Atrium attack Sarge\n",4);checks=checks+require(match!=void and match.type==7 and match.subtype==9,"first context template and trailing newline")
  checks=checks+require(matches.matchVariable(match,0,256)=="Ranger" and matches.matchVariable(match,1,256)==" Atrium" and matches.matchVariable(match,2,256)=="Sarge","three exact captures")
  alternative=matches.findMatch(state,"(Xaero) Base defend Visor",4);checks=checks+require(alternative!=void and matches.matchVariable(alternative,2,4)=="Vis","alternative and bounded extraction")
  checks=checks+require(matches.findMatch(state,"ping suffix",4)==void and matches.findMatch(state,"hello Bob",4)==void,"full consumption and context mask")
  checks=checks+require(matches.findMatch(state,"hi Bob",2).type==3 and matches.matchVariable(matches.findMatch(state,"hi Bob",2),0,256)=="Bob","second context")
  checks=checks+require(matches.ensureLoaded(state)==3 and context.reads==1,"template cache")

  vm=Machine(bytes(1024,0),1023);base=900;put(vm,20,"(Ranger) Atrium attack Sarge");put(vm,80,"ATRIUM");arg(vm,base,1,20);arg(vm,base,2,80);arg(vm,base,3,0)
  checks=checks+require(traps.dispatch(state,vm,base,matches.OP_STRING_CONTAINS)==9,"op517 QVM arguments")
  arg(vm,base,1,20);arg(vm,base,2,200);arg(vm,base,3,4);checks=checks+require(traps.dispatch(state,vm,base,matches.OP_FIND_MATCH)==1 and n.readI32(vm.data,456)==7 and n.readI32(vm.data,460)==9,"op518 328-byte QVM layout")
  checks=checks+require(vm.data[464]==1 and n.readI32(vm.data,468)==6 and vm.data[472]==8 and n.readI32(vm.data,476)==7,"bot_matchvariable_t char padding ABI")
  arg(vm,base,1,200);arg(vm,base,2,1);arg(vm,base,3,600);arg(vm,base,4,5);checks=checks+require(traps.dispatch(state,vm,base,matches.OP_MATCH_VARIABLE)==0 and qvmString(vm,600)==" Atr","op519 QVM bounded output")
  print("PASS: "+str(checks)+" AI chat-match contracts");return 0
end function
