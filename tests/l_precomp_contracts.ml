import mq3.botlib.l_precomp as pre
import mq3.vm.pc_parser as pc
import mq3.vm.cgame_pc_traps as pcTraps

struct Files values calls actions end struct
function req(ok,label) if not ok then return error(499,"l_precomp contract: "+label) end if;return 1 end function
function load(files,name)
  files.calls=files.calls+1
  for each pair in files.values if pair[0]==name then return bytes(pair[1]) end if end for
  return void
end function
function action(files,runtime,value) files.actions=files.actions+1;return void end function
function make(values) files=Files(values,0,0);h=pre.host();h.context=files;h.loadFn=load;h.actionFn=action;return [pre.create(h),files] end function
function collectHandle(runtime,handle)
  values=[];while true token=pre.PC_ReadTokenHandle(runtime,handle);if token==void then return values end if;if token is error then return token end if;values=values+[token.text] end while
end function
function rawTokens(source)
  values=[];while true token=pre.PC_ReadSourceToken(source);if token==void then return values end if;if token is error then return token end if;values=values+[token] end while
end function
function contracts()
  count=0;x=make([["base/main.menu","#define VALUE 3\n#if VALUE == 3\nyes\n#else\nno\n#endif\n#include \"inc.menu\"\nCAT(foo,bar) STR(hello world) __FILE__"],["base/inc.menu","inside"]]);r=x[0];files=x[1]
  count=count+req(pre.PC_InitTokenHeap(r) and r.tokenHeapInitialized,"token heap")
  count=count+req(pre.PC_NameHash("test")==pre.PC_NameHash("test") and pre.PC_NameHash("test")>=0 and pre.PC_NameHash("test")<1024,"name hash")
  count=count+req(pre.PC_OperatorPriority(pre.P_MUL)==15 and pre.PC_OperatorPriority(pre.P_ADD)==14 and pre.PC_OperatorPriority(pre.P_LSHIFT)==13,"arithmetic priorities")
  count=count+req(pre.PC_OperatorPriority(pre.P_LOGIC_GEQ)==12 and pre.PC_OperatorPriority(pre.P_LOGIC_EQ)==11 and pre.PC_OperatorPriority(pre.P_BIN_AND)==10,"comparison priorities")
  count=count+req(pre.PC_OperatorPriority(pre.P_BIN_XOR)==9 and pre.PC_OperatorPriority(pre.P_BIN_OR)==8 and pre.PC_OperatorPriority(pre.P_LOGIC_AND)==7 and pre.PC_OperatorPriority(pre.P_LOGIC_OR)==6,"bit/logical priorities")
  count=count+req(pre.PC_OperatorPriority(pre.P_LOGIC_NOT)==16 and pre.PC_OperatorPriority(pre.P_QUESTIONMARK)==5 and pre.PC_OperatorPriority(999)==0,"unary/ternary priorities")
  count=count+req(pre.PC_ConvertPath("a//b\\\\c/")=="a/b/c/","path normalization")
  pre.PC_SetBaseFolder(r,"base");count=count+req(r.baseFolder=="base/","base folder")
  bridge=pcTraps.precompServices(r);count=count+req(bridge.addDefineFn(bridge.context,"BRIDGE 1")==1,"QVM bridge global define")
  bridgeHandle=bridge.loadSourceFn(bridge.context,"main.menu");count=count+req(bridgeHandle>0,"QVM bridge source load");bridgeToken=bridge.readTokenFn(bridge.context,bridgeHandle);count=count+req(bridgeToken.found and len(bridgeToken.data)==pc.TOKEN_SIZE,"QVM bridge token ABI");count=count+req(bridge.freeSourceFn(bridge.context,bridgeHandle)==1,"QVM bridge source free")
  count=count+req(pre.PC_AddGlobalDefine(r,"CAT(a,b) a ## b")==1 and pre.PC_AddGlobalDefine(r,"STR(x) # x")==1,"global macros")
  count=count+req(pre.PC_AddGlobalDefine(r,"GLOBAL 9")==1 and len(r.globalDefines)==4,"global define registry")
  d=pre.PC_DefineFromString(r,"PAIR(x,y) x y");count=count+req(d!=void and d.name=="PAIR" and pre.PC_FindDefineParm(d,"y")==1,"define from string")
  copy=pre.PC_CopyDefine(void,d);count=count+req(copy!=d and copy.name=="PAIR" and len(copy.parameters)==2,"deep define copy")
  table=array(pre.DEFINEHASHSIZE,0);pre.PC_AddDefineToHash(d,table);count=count+req(pre.PC_FindHashedDefine(table,"PAIR")==d and pre.PC_FindHashedDefine(table,"MISS")==void,"define hash table")
  count=count+req(pre.PC_FindDefine(r.registry.defines,"GLOBAL").name=="GLOBAL","linear define lookup")
  count=count+req(pre.PC_RemoveGlobalDefine(r,"GLOBAL") and pc.defineIndex(r.registry,"GLOBAL")<0,"remove global define")
  handle=pre.PC_LoadSourceHandle(r,"main.menu");count=count+req(handle>0 and pre.PC_CheckOpenSourceHandles(r)==1,"file handle load")
  values=collectHandle(r,handle);count=count+req(not (values is error),"preprocessed file")
  count=count+req(values==["yes","inside","foobar","helloworld","base/main.menu"],"condition include paste stringize builtins")
  location=pre.PC_SourceFileAndLine(r,handle);count=count+req(location[0]=="base/main.menu" and location[1]>=1,"source location")
  count=count+req(pre.PC_FreeSourceHandle(r,handle)==1 and pre.PC_CheckOpenSourceHandles(r)==0,"handle free")
  source=pre.LoadSourceMemory(r," alpha 12 + beta ; omega",24,"memory");count=count+req(source!=void,"memory source")
  token=pre.PC_ReadSourceToken(source);count=count+req(token.text=="alpha" and pre.PC_WhiteSpaceBeforeToken(token),"raw token whitespace")
  copied=pre.PC_CopyToken(token);count=count+req(copied!=token and copied.text=="alpha","copy token")
  pre.PC_ClearTokenWhiteSpace(copied);count=count+req(not pre.PC_WhiteSpaceBeforeToken(copied),"clear whitespace")
  count=count+req(pre.PC_UnreadSourceToken(source,token) and pre.PC_ReadSourceToken(source).text=="alpha","unread source token")
  count=count+req(pre.PC_ExpectTokenType(source,pc.TT_NUMBER,pc.TT_INTEGER).intValue==12,"expect token type")
  count=count+req(pre.PC_CheckTokenString(source,"+") and pre.PC_CheckTokenType(source,pc.TT_NAME,0).text=="beta","check token helpers")
  count=count+req(pre.PC_SkipUntilString(source,"omega"),"skip until")
  count=count+req(pre.FreeSource(source),"free source")
  evalSource=pre.LoadSourceMemory(r,"1 + 2 * 3",9,"expression");tokens=rawTokens(evalSource);iv=[0];fv=[0.0];count=count+req(pre.PC_EvaluateTokens(evalSource,tokens,iv,fv,true) and iv[0]==7,"expression evaluation");pre.FreeSource(evalSource)
  left=pc.Token(pc.TT_NAME,3,0,0.0,"foo",1,false);right=pc.Token(pc.TT_NAME,3,0,0.0,"bar",1,false);merged=pre.PC_MergeTokens(left,right);count=count+req(merged.text=="foobar" and merged.type==pc.TT_NAME,"merge name tokens")
  stringToken=pre.PC_StringizeTokens([left,right],left);count=count+req(stringToken.type==pc.TT_STRING and stringToken.text=="foobar","stringize tokens")
  source=pre.LoadSourceMemory(r,"x",1,"indent");count=count+req(pre.PC_PushIndent(source,pre.INDENT_IF,2)==1,"push indent");type=[0];skip=[0];count=count+req(pre.PC_PopIndent(source,type,skip) and type[0]==pre.INDENT_IF and skip[0]==2,"pop indent")
  count=count+req(pre.PC_PushScript(source,"included")==1,"push script")
  count=count+req(pre.PC_AddBuiltinDefines(source),"builtin definitions")
  count=count+req(pre.PC_AddDefine(source,"LOCAL 4")==1 and pre.PC_AddGlobalDefinesToSource(source)>=2,"source/global defines")
  numSource=pre.LoadSourceMemory(r,"7",1,"number");count=count+req(pre.BuiltinFunction(numSource),"quake builtin function number");pre.FreeSource(numSource)
  nameSource=pre.LoadSourceMemory(r,"name",4,"name");count=count+req(pre.QuakeCMacro(nameSource),"quake macro ordinary name");pre.FreeSource(nameSource)
  warnBefore=files.actions;pre.SourceWarning(source,"warning");count=count+req(files.actions==warnBefore+1,"typed warning action")
  r.retailActive=true;pre.SourceWarning(source,"owned");count=count+req(files.actions==warnBefore+1 and not r.actions[len(r.actions)-1].dispatched,"retail diagnostics suppressed");r.retailActive=false
  pre.PC_RemoveAllGlobalDefines(r);count=count+req(len(r.registry.defines)==0 and len(r.globalDefines)==0,"remove all defines")
  count=count+req(pre.PC_SetIncludePath(source,"menus//hud")=="menus/hud/","include path")
  punct=["@"] ;count=count+req(pre.PC_SetPunctuations(source,punct)==punct,"custom punctuation ownership")
  count=count+req(pre.PC_FreeToken(copied) and pre.PC_FreeDefine(copy),"safe free contracts")
  pre.FreeSource(source)
  return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" l_precomp native contracts\n");return 0 end function
