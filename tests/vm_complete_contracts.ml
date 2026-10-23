// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.vm.runtime as runtime
import mq3.compat.numeric as n

struct Context image cvars commands diagnostics logs loads end struct
function fixture()
  code=bytes([3,64,0,0,0,8,42,0,0,0,4,64,0,0,0]);image=bytes(51,0)
  n.writeU32(image,0,0x12721444);n.writeU32(image,4,3);n.writeU32(image,8,32);n.writeU32(image,12,15);n.writeU32(image,16,47);n.writeU32(image,20,4);n.writeU32(image,24,0);n.writeU32(image,28,65532);copyBytes(image,32,code,0,len(code));n.writeU32(image,47,7);return image
end function
function loader(host,path) host.context.loads=host.context.loads+1;if path=="vm/missing.qvm" then return void end if;return host.context.image end function
function symbolLoader(host,path) if path=="vm/auto.map" then return "0 00000000 auto_start 0 00000001 auto_next" end if;return void end function
function developerEnabled(host) return true end function
function diagnostic(host,kind,name) host.context.diagnostics=host.context.diagnostics+[[kind,name]];return void end function
function registerCvar(host,name,value,flags) host.context.cvars=host.context.cvars+[[name,value,flags]];return void end function
function addCommand(host,name,machineRuntime) host.context.commands=host.context.commands+[name];return machineRuntime!=void end function
function logRow(host,row) host.context.logs=host.context.logs+[row];return void end function
function syscall(machine,address) return n.readI32(machine.data,address)+n.readI32(machine.data,address+4) end function
function req(ok,label) if not ok then return error(3418,"complete VM contract: "+label) end if;return 1 end function

function host(context)
  service=runtime.services();service.context=context;service.loadFn=loader;service.diagnosticFn=diagnostic;service.registerCvarFn=registerCvar;service.addCommandFn=addCommand;service.logFn=logRow;return service
end function
function main(args)
  count=0;context=Context(fixture(),[],[],[],[],0);state=runtime.create(host(context));probe=runtime.load(state,"probe",syscall)
  count=count+req(probe.active and probe.codeLength==15 and probe.tableLength==12 and not probe.compiled,"VM_Create interpreted")
  count=count+req(runtime.load(state,"PROBE",syscall)==probe and context.loads==1,"case-insensitive VM reuse")
  runtime.debug(state,3);count=count+req(state.debugLevel==3 and runtime.vm2c(123,999)==123,"VM_Debug and VM_VM2C")
  count=count+req(runtime.parseHex("1aF")==431 and runtime.parseHex("z1-2")==18 and runtime.parseHex("FFFFFFFF")==-1,"ParseHex exact accumulation")
  count=count+req(runtime.loadSymbols(probe,"0 00000000 start 0 00000001 middle 1 00000002 data 0 00000002 end",false)==0,"developer symbol gate")
  count=count+req(runtime.loadSymbols(probe,"0 00000000 start 0 00000001 middle 1 00000002 data 0 00000002 end",true)==3,"code-only map symbols")
  count=count+req(probe.symbols[0].value==0 and probe.symbols[1].value==5 and probe.symbols[2].value==10,"instruction-to-code conversion")
  count=count+req(runtime.loadSymbols(probe,"",false)==3 and probe.symbols[1].name=="middle","disabled developer loading preserves symbols")
  count=count+req(runtime.valueToSymbol(probe,7)=="middle+2" and runtime.valueToSymbol(runtime.emptySlot(),7)=="NO SYMBOLS","VM_ValueToSymbol")
  count=count+req(runtime.valueToFunctionSymbol(probe,9).name=="middle" and runtime.valueToFunctionSymbol(runtime.emptySlot(),9).value==0,"VM_ValueToFunctionSymbol")
  count=count+req(runtime.symbolToValue(probe,"end")==10 and runtime.symbolToValue(probe,"END")==0,"case-sensitive VM_SymbolToValue")
  probe.symbols=[runtime.Symbol(0,"start",0),runtime.Symbol(1,"middle",0)];count=count+req(runtime.symbolForCompiledPointer(probe,-1)=="Before code block" and runtime.symbolForCompiledPointer(probe,6)=="middle" and runtime.symbolForCompiledPointer(probe,15)=="After code block","compiled pointer symbols")
  state.current=void;count=count+req(runtime.argPtr(state,3)==void,"VM_ArgPtr missing current")
  state.current=probe;probe.native=true;count=count+req(runtime.argPtr(state,35)==35 and runtime.explicitArgPtr(state,probe,34)==34,"native argument pointers")
  probe.native=false;count=count+req(runtime.argPtr(state,65539)==3 and runtime.explicitArgPtr(state,probe,65538)==2,"interpreted argument mask")
  result=runtime.call(state,probe,[0]);count=count+req(result==42 and state.current==probe and state.last==probe,"VM_Call context and result")
  count=count+req(runtime.dllSyscall(state,[7,8])==15,"VM_DllSyscall forwards contiguous words")
  before=probe.machine;probe.machine.data[0]=99;runtime.restart(state,probe);count=count+req(probe.machine==before and n.readI32(probe.machine.data,0)==7 and probe.generation==2,"VM_Restart reloads data in place")
  compiled=runtime.loadMode(state,"compiled",syscall,runtime.VMI_COMPILED);count=count+req(compiled.compiled and runtime.callCompiled(compiled,[0])==42,"VM_Compile and VM_CallCompiled behavior")
  nativeFallback=runtime.loadMode(state,"native-fallback",syscall,runtime.VMI_NATIVE);count=count+req(nativeFallback.compiled and not nativeFallback.native and runtime.call(state,nativeFallback,[0])==42,"VMI_NATIVE falls back to compiled QVM")
  compiled.symbols=[runtime.Symbol(0,"cold",10),runtime.Symbol(5,"hot",30)];state.last=compiled;report=runtime.profile(state)
  count=count+req(report[1]==40 and report[0][0]==[25,10,"cold"] and report[0][1]==[75,30,"hot"],"VM_VmProfile sort and percentages")
  count=count+req(compiled.symbols[0].profileCount==0 and compiled.symbols[1].profileCount==0,"profile counters reset")
  listing=runtime.info(state);count=count+req(len(listing)==3 and listing[0][0]=="probe" and listing[1][1]=="compiled on load" and listing[2][1]=="compiled on load","VM_VmInfo")
  row=runtime.logSyscalls(state,123,[9,8,7]);count=count+req(row==[1,123,9,8,7,0,0] and context.logs[0]==row,"VM_LogSyscalls")
  runtime.free(state,compiled);count=count+req(not compiled.active and state.current==void and state.last==void,"VM_Free clears globals")
  autoService=host(context);autoService.symbolFn=symbolLoader;autoService.developerFn=developerEnabled;autoState=runtime.create(autoService);autoSlot=runtime.load(autoState,"auto",syscall)
  count=count+req(autoSlot.numSymbols==2 and autoSlot.symbols[1].name=="auto_next" and autoSlot.symbols[1].value==5,"VM_Create loads developer map symbols")
  runtime.init(state);count=count+req(context.cvars==[["vm_cgame","2",1],["vm_game","2",1],["vm_ui","2",1]] and context.commands==["vmprofile","vminfo"],"VM_Init registrations")
  count=count+req(runtime.find(state,"probe")==void and state.debugLevel==0 and state.syscallCount==0,"VM_Init clears table and debug state")
  runtime.load(state,"one",syscall);runtime.load(state,"two",syscall);runtime.clear(state);count=count+req(runtime.find(state,"one")==void and state.current==void and state.last==void,"VM_Clear")
  count=count+req(try(runtime.load(state,"missing",syscall)) is error,"missing image rejected")
  count=count+req(try(runtime.call(state,void,[])) is error and try(runtime.restart(state,void)) is error,"invalid lifecycle targets")
  print "PASS: "+str(count)+" complete VM contracts";return 0
end function
