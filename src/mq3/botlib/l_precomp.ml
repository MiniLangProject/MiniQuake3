// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native ownership adapter for botlib/l_precomp.c. The lexer,
// macro expander and conditional evaluator are shared with the productive QVM
// parser so game, cgame and UI traps observe one preprocessor implementation.
package mq3.botlib.l_precomp

import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n
import std.string as strings

const DEFINEHASHSIZE=1024
const INDENT_IF=0
const INDENT_ELSE=1
const INDENT_ELIF=2
const INDENT_IFDEF=3
const INDENT_IFNDEF=4

const P_LOGIC_AND=5
const P_LOGIC_OR=6
const P_LOGIC_GEQ=7
const P_LOGIC_LEQ=8
const P_LOGIC_EQ=9
const P_LOGIC_UNEQ=10
const P_RSHIFT=21
const P_LSHIFT=22
const P_MUL=26
const P_DIV=27
const P_MOD=28
const P_ADD=29
const P_SUB=30
const P_BIN_AND=32
const P_BIN_OR=33
const P_BIN_XOR=34
const P_BIN_NOT=35
const P_LOGIC_NOT=36
const P_LOGIC_GREATER=37
const P_LOGIC_LESS=38
const P_COLON=42
const P_QUESTIONMARK=43

struct Action kind message file line dispatched end struct
struct Host loadFn actionFn context end struct
struct Runtime registry host baseFolder globalDefines actions retailActive tokenHeapInitialized end struct
struct Source runtime handle includePath punctuations lastToken indents scripts end struct
struct Indent type skip end struct

function host() return Host(void,void,void) end function
function loadFile(runtime,name)
  path=PC_ConvertPath(name);candidate=path
  if runtime.baseFolder!="" and strings.indexOf(path,runtime.baseFolder,0)!=0 then candidate=runtime.baseFolder+path end if
  data=runtime.host.loadFn(runtime.host.context,candidate)
  if (data==void or data is error) and candidate!=path then data=runtime.host.loadFn(runtime.host.context,path) end if
  return data
end function
function create(hostValue)
  if hostValue==void or hostValue.loadFn==void then return error(7740,"l_precomp: missing file loader") end if
  registry=pc.create(void,loadFile);runtime=Runtime(registry,hostValue,"",[],[],false,false);registry.context=runtime;return runtime
end function
function emit(runtime,kind,message,file,line)
  dispatched=not runtime.retailActive;value=Action(kind,message,file,line,dispatched);runtime.actions=runtime.actions+[value]
  if dispatched and runtime.host.actionFn!=void then runtime.host.actionFn(runtime.host.context,runtime,value) end if;return value
end function
function sourceEntry(source) if source==void or source.handle<1 or source.handle>=pc.MAX_SOURCEFILES then return void end if;return source.runtime.registry.sources[source.handle] end function
function sourceLocation(source) value=pc.location(source.runtime.registry,source.handle);if value==void then return ["",0] end if;return value end function

function SourceError(source,message) where=sourceLocation(source);emit(source.runtime,"error",message,where[0],where[1]);return error(7741,where[0]+":"+str(where[1])+": "+message) end function
function SourceWarning(source,message) where=sourceLocation(source);emit(source.runtime,"warning",message,where[0],where[1]);return false end function

function PC_PushIndent(source,type,skip) source.indents=source.indents+[Indent(type,skip)];return len(source.indents) end function
function PC_PopIndent(source,typeOut,skipOut)
  if len(source.indents)==0 then return false end if;value=source.indents[len(source.indents)-1];if typeOut!=void then typeOut[0]=value.type end if;if skipOut!=void then skipOut[0]=value.skip end if
  if len(source.indents)==1 then source.indents=[] else next=array(len(source.indents)-1,void);for i=0 to len(next)-1 next[i]=source.indents[i] end for;source.indents=next end if;return true
end function
function PC_PushScript(source,script) source.scripts=source.scripts+[script];return len(source.scripts) end function
function PC_InitTokenHeap(runtime) runtime.tokenHeapInitialized=true;return true end function
function PC_CopyToken(token) if token==void then return void end if;return pc.Token(token.type,token.subtype,token.intValue,token.floatValue,token.text,token.line,token.leadingSpace) end function
function PC_FreeToken(token) return token!=void end function

function PC_ReadSourceToken(source)
  entry=sourceEntry(source);if entry==void then return void end if;token=pc.pcNextRaw(entry);if token!=void and not (token is error) then source.lastToken=token end if;return token
end function
function PC_UnreadSourceToken(source,token) entry=sourceEntry(source);if entry==void then return false end if;pc.unread(entry,token);return true end function
function PC_ReadDefineParms(source,define,maxparms)
  entry=sourceEntry(source);if entry==void then return void end if;first=pc.take(entry);if first==void or first is error or first.text!="(" then if first!=void then pc.unread(entry,first) end if;return void end if
  tokens=[first];depth=0;while true token=pc.take(entry);if token==void or token is error then return void end if;tokens=tokens+[token];if token.text=="(" then depth=depth+1 else if token.text==")" then if depth==0 then break end if;depth=depth-1 end if end while
  count=pc.parameterCount(define);if count>maxparms then return void end if;result=pc.parseArguments(tokens,0,count);if not result.valid then return void end if;return result.arguments
end function
function PC_StringizeTokens(tokens,token) line=1;if token!=void then line=token.line end if;return pc.stringized(tokens,line) end function
function PC_MergeTokens(t1,t2) return pc.mergedToken(t1,t2) end function
function PC_PrintDefine(runtime,define) text=define.name;if define.tokens!=0 then for each token in define.tokens text=text+" "+token.text end for end if;emit(runtime,"define",text,"",0);return text end function
function PC_PrintDefineHashTable(runtime,table) count=0;for each bucket in table if bucket!=0 then for each define in bucket PC_PrintDefine(runtime,define);count=count+1 end for end if end for;return count end function

function PC_NameHash(name)
  hash=0;raw=bytes(name);if len(raw)>0 then for i=0 to len(raw)-1 hash=hash+raw[i]*(119+i) end for end if;return (hash^(hash>>10)^(hash>>20))&(DEFINEHASHSIZE-1)
end function
function PC_AddDefineToHash(define,table) hash=PC_NameHash(define.name);if table[hash]==0 then table[hash]=[define] else table[hash]=[define]+table[hash] end if;return define end function
function PC_FindHashedDefine(table,name) bucket=table[PC_NameHash(name)];if bucket!=0 then for each define in bucket if define.name==name then return define end if end for end if;return void end function
function PC_FindDefine(defines,name) if defines!=0 and defines!=void then for each define in defines if define.name==name then return define end if end for end if;return void end function
function PC_FindDefineParm(define,name) return pc.parameterIndex(define,name) end function
function PC_FreeDefine(define) return define!=void end function
function PC_AddBuiltinDefines(source) return source!=void end function
function PC_ExpandBuiltinDefine(source,deftoken,defineToken)
  entry=sourceEntry(source);if entry==void then return void end if;return pc.builtinToken(entry,deftoken)
end function
function PC_ExpandDefine(source,deftoken,define,parms) if define.functionLike then return pc.substituteMacro(define,parms,deftoken.line) end if;return define.tokens end function
function PC_ExpandDefineIntoSource(source,deftoken,define)
  entry=sourceEntry(source);if entry==void then return false end if;expansion=pc.sourceMacroExpansion(entry,define,deftoken.line);if expansion is error or not expansion.valid then return false end if;if expansion.tokens!=0 then pc.queueFront(entry,expansion.tokens) end if;return expansion.invoked
end function

function PC_ConvertPath(path)
  raw=bytes(path);result="";previous=false
  for each value in raw separator=value==47 or value==92;if separator then if not previous then result=result+"/" end if else result=result+decode(bytes([value])) end if;previous=separator end for
  return result
end function
function PC_Directive_include(source) return PC_ReadDirective(source,"include") end function
function PC_ReadLine(source) entry=sourceEntry(source);if entry==void then return [] end if;where=sourceLocation(source);return pc.lineTokens(entry,where[1]) end function
function PC_WhiteSpaceBeforeToken(token) return token!=void and token.leadingSpace end function
function PC_ClearTokenWhiteSpace(token) if token!=void then token.leadingSpace=false end if;return void end function

function removeDefine(registry,name)
  index=pc.defineIndex(registry,name);if index<0 or pc.isBuiltin(name) then return false end if;registry.defines[index]=pc.Define("",0,0,false);return true
end function
function PC_Directive_undef(source) values=PC_ReadLine(source);if len(values)!=1 or values[0].type!=pc.TT_NAME then return SourceError(source,"undef without name") end if;removeDefine(source.runtime.registry,values[0].text);return true end function
function PC_Directive_define(source)
  values=PC_ReadLine(source);if len(values)==0 then return SourceError(source,"define without name") end if;define=pc.definition(values);if define is error or pc.isBuiltin(define.name) then return SourceError(source,"invalid define") end if;index=pc.defineIndex(source.runtime.registry,define.name);if index<0 then source.runtime.registry.defines=source.runtime.registry.defines+[define] else source.runtime.registry.defines[index]=define end if;return true
end function
function PC_DefineFromString(runtime,string)
  before=len(runtime.registry.defines);if pc.addDefine(runtime.registry,string)==0 then return void end if;nameSource=pc.Source("<define>",bytes(string),0,1,0);first=pc.raw(nameSource);if first==void or first is error then return void end if;return runtime.registry.defines[pc.defineIndex(runtime.registry,first.text)]
end function
function PC_AddDefine(source,string) return pc.addDefine(source.runtime.registry,string) end function
function PC_AddGlobalDefine(runtime,string) result=pc.addDefine(runtime.registry,string);if result!=0 then runtime.globalDefines=runtime.globalDefines+[string] end if;return result end function
function PC_RemoveGlobalDefine(runtime,name) return removeDefine(runtime.registry,name) end function
function PC_RemoveAllGlobalDefines(runtime) pc.clearDefines(runtime.registry);runtime.globalDefines=[];return void end function
function PC_CopyDefine(source,define) tokens=0;if define.tokens!=0 then tokens=[];for each token in define.tokens tokens=tokens+[PC_CopyToken(token)] end for end if;parameters=define.parameters;if parameters!=0 then copy=[];for each name in parameters copy=copy+[name] end for;parameters=copy end if;return pc.Define(define.name,parameters,tokens,define.functionLike) end function
function PC_AddGlobalDefinesToSource(source) return len(source.runtime.globalDefines) end function

function conditional(source,name) entry=sourceEntry(source);if entry==void then return false end if;where=sourceLocation(source);return pc.conditionalDirective(source.runtime.registry,entry,name,where[1]) end function
function PC_Directive_if_def(source,type) if type==INDENT_IFDEF then return conditional(source,"ifdef") end if;return conditional(source,"ifndef") end function
function PC_Directive_ifdef(source) return conditional(source,"ifdef") end function
function PC_Directive_ifndef(source) return conditional(source,"ifndef") end function
function PC_Directive_else(source) return conditional(source,"else") end function
function PC_Directive_endif(source) return conditional(source,"endif") end function
function PC_Directive_elif(source) return conditional(source,"elif") end function
function PC_Directive_if(source) return conditional(source,"if") end function

function PC_OperatorPriority(op)
  if op==P_MUL or op==P_DIV or op==P_MOD then return 15 end if;if op==P_ADD or op==P_SUB then return 14 end if
  if op==P_RSHIFT or op==P_LSHIFT then return 13 end if;if op==P_LOGIC_GEQ or op==P_LOGIC_LEQ or op==P_LOGIC_GREATER or op==P_LOGIC_LESS then return 12 end if
  if op==P_LOGIC_EQ or op==P_LOGIC_UNEQ then return 11 end if;if op==P_BIN_AND then return 10 end if;if op==P_BIN_XOR then return 9 end if;if op==P_BIN_OR then return 8 end if
  if op==P_LOGIC_AND then return 7 end if;if op==P_LOGIC_OR then return 6 end if;if op==P_LOGIC_NOT or op==P_BIN_NOT then return 16 end if;if op==P_COLON or op==P_QUESTIONMARK then return 5 end if;return 0
end function
function PC_EvaluateTokens(source,tokens,intvalue,floatvalue,integer)
  result=pc.evaluateExpression(source.runtime.registry,tokens);if not result[0] then return false end if;if intvalue!=void then intvalue[0]=result[1] end if;if floatvalue!=void then floatvalue[0]=result[1]*1.0 end if;return true
end function
function PC_Evaluate(source,intvalue,floatvalue,integer) return PC_EvaluateTokens(source,PC_ReadLine(source),intvalue,floatvalue,integer) end function
function PC_DollarEvaluate(source,intvalue,floatvalue,integer) return PC_Evaluate(source,intvalue,floatvalue,integer) end function
function PC_Directive_line(source) values=PC_ReadLine(source);if len(values)<1 or values[0].type!=pc.TT_NUMBER then return SourceError(source,"line without number") end if;entry=sourceEntry(source);active=entry[1][len(entry[1])-1];active.line=values[0].intValue;return true end function
function PC_Directive_error(source) values=PC_ReadLine(source);message="";for each token in values if message!="" then message=message+" " end if;message=message+token.text end for;return SourceError(source,message) end function
function PC_Directive_pragma(source) PC_ReadLine(source);return true end function
function UnreadSignToken(source) if source.lastToken!=void and (source.lastToken.text=="-" or source.lastToken.text=="+") then return PC_UnreadSourceToken(source,source.lastToken) end if;return false end function
function evaluationToken(value,line) return pc.Token(pc.TT_NUMBER,pc.TT_DECIMAL|pc.TT_INTEGER,value,value*1.0,str(value),line,false) end function
function PC_Directive_eval(source) valueOut=[0];if not PC_Evaluate(source,valueOut,void,true) then return false end if;entry=sourceEntry(source);pc.queueFront(entry,[evaluationToken(valueOut[0],sourceLocation(source)[1])]);return true end function
function PC_Directive_evalfloat(source) valueOut=[0];if not PC_Evaluate(source,valueOut,void,false) then return false end if;entry=sourceEntry(source);pc.queueFront(entry,[evaluationToken(valueOut[0],sourceLocation(source)[1])]);return true end function

function PC_ReadDirective(source,name)
  if name=="include" then values=PC_ReadLine(source);if len(values)!=1 then return SourceError(source,"include without file name") end if;entry=sourceEntry(source);includeName=values[0].text;if source.includePath!="" then includeName=source.includePath+includeName end if;return pc.pushInclude(source.runtime.registry,entry,PC_ConvertPath(includeName)) end if
  if name=="define" then return PC_Directive_define(source) end if;if name=="undef" then return PC_Directive_undef(source) end if;if name=="if" then return PC_Directive_if(source) end if;if name=="ifdef" then return PC_Directive_ifdef(source) end if;if name=="ifndef" then return PC_Directive_ifndef(source) end if;if name=="elif" then return PC_Directive_elif(source) end if;if name=="else" then return PC_Directive_else(source) end if;if name=="endif" then return PC_Directive_endif(source) end if;if name=="line" then return PC_Directive_line(source) end if;if name=="error" then return PC_Directive_error(source) end if;if name=="pragma" then return PC_Directive_pragma(source) end if;if name=="eval" then return PC_Directive_eval(source) end if;if name=="evalfloat" then return PC_Directive_evalfloat(source) end if;return SourceError(source,"unknown precompiler directive "+name)
end function
function PC_DollarDirective_evalint(source) return PC_Directive_eval(source) end function
function PC_DollarDirective_evalfloat(source) return PC_Directive_evalfloat(source) end function
function PC_ReadDollarDirective(source,name) if name=="evalint" then return PC_DollarDirective_evalint(source) end if;if name=="evalfloat" then return PC_DollarDirective_evalfloat(source) end if;return SourceError(source,"unknown dollar directive "+name) end function
function BuiltinFunction(source) token=PC_ReadSourceToken(source);if token==void then return false end if;PC_UnreadSourceToken(source,token);return token.type==pc.TT_NUMBER end function
function QuakeCMacro(source) token=PC_ReadSourceToken(source);if token==void then return true end if;PC_UnreadSourceToken(source,token);return token.type!=pc.TT_NAME or (token.text!="evalint" and token.text!="evalfloat") end function

function PC_ReadToken(source) token=pc.read(source.runtime.registry,source.handle);if token!=void and not (token is error) then source.lastToken=token end if;return token end function
function PC_ExpectTokenString(source,string) token=PC_ReadToken(source);if token==void or token is error or token.text!=string then return SourceError(source,"expected "+string) end if;return token end function
function PC_ExpectTokenType(source,type,subtype) token=PC_ReadToken(source);if token==void or token is error or token.type!=type or subtype!=0 and (token.subtype&subtype)==0 then return SourceError(source,"unexpected token type") end if;return token end function
function PC_ExpectAnyToken(source) token=PC_ReadToken(source);if token==void then return SourceError(source,"couldn't read expected token") end if;return token end function
function PC_CheckTokenString(source,string) token=PC_ReadToken(source);if token==void or token is error then return false end if;if token.text==string then return true end if;PC_UnreadToken(source,token);return false end function
function PC_CheckTokenType(source,type,subtype) token=PC_ReadToken(source);if token==void or token is error then return void end if;if token.type==type and (subtype==0 or (token.subtype&subtype)!=0) then return token end if;PC_UnreadToken(source,token);return void end function
function PC_SkipUntilString(source,string) while true token=PC_ReadToken(source);if token==void or token is error then return false end if;if token.text==string then return true end if end while end function
function PC_UnreadLastToken(source) if source.lastToken==void then return false end if;return PC_UnreadToken(source,source.lastToken) end function
function PC_UnreadToken(source,token) return PC_UnreadSourceToken(source,token) end function
function PC_SetIncludePath(source,path) source.includePath=PC_ConvertPath(path);if source.includePath!="" and bytes(source.includePath)[len(bytes(source.includePath))-1]!=47 then source.includePath=source.includePath+"/" end if;return source.includePath end function
function PC_SetPunctuations(source,p) source.punctuations=p;return p end function

function wrap(runtime,handle) if handle==0 then return void end if;return Source(runtime,handle,"",void,void,[],[]) end function
function LoadSourceFile(runtime,filename) return wrap(runtime,pc.load(runtime.registry,PC_ConvertPath(runtime.baseFolder+filename))) end function
function LoadSourceMemory(runtime,ptr,length,name)
  slot=1;while slot<pc.MAX_SOURCEFILES and runtime.registry.sources[slot]!=0 slot=slot+1 end while;if slot>=pc.MAX_SOURCEFILES then return void end if;data=ptr;if typeof(data)=="string" then data=bytes(data) end if;if length<len(data) then data=slice(data,0,length) end if
  runtime.registry.sources[slot]=[name,[pc.Source(name,data,0,1,0)],0,0];return wrap(runtime,slot)
end function
function FreeSource(source) if source==void then return false end if;return pc.free(source.runtime.registry,source.handle)!=0 end function
function PC_LoadSourceHandle(runtime,filename) return pc.load(runtime.registry,PC_ConvertPath(runtime.baseFolder+filename)) end function
function PC_FreeSourceHandle(runtime,handle) return pc.free(runtime.registry,handle) end function
function PC_ReadTokenHandle(runtime,handle) return pc.read(runtime.registry,handle) end function
function PC_SourceFileAndLine(runtime,handle) return pc.location(runtime.registry,handle) end function
function PC_SetBaseFolder(runtime,path) runtime.baseFolder=PC_ConvertPath(path);if runtime.baseFolder!="" and bytes(runtime.baseFolder)[len(bytes(runtime.baseFolder))-1]!=47 then runtime.baseFolder=runtime.baseFolder+"/" end if;return runtime.baseFolder end function
function PC_CheckOpenSourceHandles(runtime) count=0;for i=1 to pc.MAX_SOURCEFILES-1 if runtime.registry.sources[i]!=0 then count=count+1;emit(runtime,"open-source",pc.location(runtime.registry,i)[0],pc.location(runtime.registry,i)[0],pc.location(runtime.registry,i)[1]) end if end for;return count end function
