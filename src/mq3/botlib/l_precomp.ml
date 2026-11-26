// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native ownership adapter for botlib/l_precomp.c. The lexer,
// macro expander and conditional evaluator are shared with the productive QVM
// parser so game, cgame and UI traps observe one preprocessor implementation.
package mq3.botlib.l_precomp

import mq3.botlib.internal_headers as botlibHeaders
import mq3.vm.pc_parser as pc
import mq3.botlib.l_script as lex
import mq3.compat.numeric as n
import std.string as strings

const DEFINEHASHSIZE=1024
const INDENT_IF=botlibHeaders.INDENT_IF
const INDENT_ELSE=botlibHeaders.INDENT_ELSE
const INDENT_ELIF=botlibHeaders.INDENT_ELIF
const INDENT_IFDEF=botlibHeaders.INDENT_IFDEF
const INDENT_IFNDEF=botlibHeaders.INDENT_IFNDEF

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

/// `Action` record for l precomp, containing `kind`, `message`, `file`, `line` and `dispatched`.
struct Action kind message file line dispatched end struct
/// `PrecompHost` record for l precomp, containing `loadFn`, `actionFn` and `context`.
struct PrecompHost loadFn actionFn context end struct
/// `Runtime` record for l precomp, containing `registry`, `host`, `baseFolder`, `globalDefines` and `actions` and related fields.
struct Runtime registry host baseFolder globalDefines actions retailActive tokenHeapInitialized end struct
/// `Source` record for l precomp, containing `runtime`, `handle`, `includePath`, `punctuations` and `lastToken` and related fields.
struct Source runtime handle includePath punctuations lastToken indents scripts end struct
/// `Indent` record for l precomp, containing `type` and `skip`.
struct Indent type skip end struct

/// Create a `mq3.botlib.l_precomp.PrecompHost` record with the declared empty defaults.
function host() return PrecompHost(void,void,void) end function
/// Load a normalized preprocessor path, trying the configured base folder before the original path.
/// @param runtime L precomp runtime; accesses `baseFolder` and `host`.
/// @param name Name used to identify the requested entry.
function loadFile(runtime,name)
  path=PC_ConvertPath(name);candidate=path
  if runtime.baseFolder!="" and strings.indexOf(path,runtime.baseFolder,0)!=0 then candidate=runtime.baseFolder+path end if
  data=runtime.host.loadFn(runtime.host.context,candidate)
  if (data==void or data is error) and candidate!=path then data=runtime.host.loadFn(runtime.host.context,path) end if
  return data
end function
/// Apply `mq3.vm.pc_parser.create` while evaluating `create`. Return paths include `runtime`.
/// @param hostValue Host value record; accesses `loadFn`.
function create(hostValue)
  if hostValue==void or hostValue.loadFn==void then return error(7740,"l_precomp: missing file loader") end if
  registry=pc.create(void,loadFile);runtime=Runtime(registry,hostValue,"",[],[],false,false);registry.context=runtime;return runtime
end function
/// Set `runtime.actions` to `runtime.actions+[value]` in `mq3.botlib.l_precomp.emit`.
/// @param runtime L precomp runtime; accesses `retailActive`, `actions` and `host`. May update `runtime.actions` in place.
/// @param kind Initial value stored in `mq3.botlib.l_precomp.Action.kind`.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param file Source filename attached to the diagnostic.
/// @param line Source line number attached to the diagnostic.
function emit(runtime,kind,message,file,line)
  dispatched=not runtime.retailActive;value=Action(kind,message,file,line,dispatched);runtime.actions=runtime.actions+[value]
  if dispatched and runtime.host.actionFn!=void then runtime.host.actionFn(runtime.host.context,runtime,value) end if;return value
end function
/// Resolve a valid preprocessor source handle to its shared registry entry, returning void for an invalid handle.
/// @param source Parser source state; accesses `handle` and `runtime`.
function sourceEntry(source) if source==void or source.handle<1 or source.handle>=pc.MAX_SOURCEFILES then return void end if;return source.runtime.registry.sources[source.handle] end function
/// Apply `mq3.vm.pc_parser.location` while evaluating `sourceLocation`.
/// @param source Parser source state; accesses `runtime` and `handle`.
function sourceLocation(source) value=pc.location(source.runtime.registry,source.handle);if value==void then return ["",0] end if;return value end function
// Expose the original l_script API over the active preprocessor input without
// copying its cursor or line state. This is used by native botlib readers that
// sit below l_precomp in the original engine.
/// @param source Parser source state; accesses `handle` and `runtime`.
function PC_LexerView(source)
  entry=sourceEntry(source);if entry==void or len(entry[1])==0 then return void end if;active=entry[1][len(entry[1])-1];return lex.WrapPCSource(lex.create(lex.host()),active)
end function

/// Emit a source-located preprocessor diagnostic and construct error 7741 with the filename and line number.
/// @param source Parser source state; accesses `runtime`.
/// @param message Message text supplied to the diagnostic or chat operation.
function SourceError(source,message) where=sourceLocation(source);emit(source.runtime,"error",message,where[0],where[1]);return error(7741,where[0]+":"+str(where[1])+": "+message) end function
/// Emit a source-located preprocessor warning and return false.
/// @param source Parser source state; accesses `runtime`.
/// @param message Message text supplied to the diagnostic or chat operation.
function SourceWarning(source,message) where=sourceLocation(source);emit(source.runtime,"warning",message,where[0],where[1]);return false end function

/// Set `source.indents` to `source.indents+[Indent(type,skip)]` in `mq3.botlib.l_precomp.PC_PushIndent`. Return paths include `len(source.indents)`.
/// @param source Parser source state; accesses `indents`. May update `source.indents` in place.
/// @param type Initial value stored in `mq3.botlib.l_precomp.Indent.type`.
/// @param skip Initial value stored in `mq3.botlib.l_precomp.Indent.skip`.
function PC_PushIndent(source,type,skip) source.indents=source.indents+[Indent(type,skip)];return len(source.indents) end function
/// Pop a conditional-compilation indent and write its type and skip flag into optional output slots.
/// @param source Parser source state; accesses `indents`. May update `source.indents` in place.
/// @param typeOut Array or byte sequence accessed at `0`. Entries are written in place.
/// @param skipOut Array or byte sequence accessed at `0`. Entries are written in place.
function PC_PopIndent(source,typeOut,skipOut)
  if len(source.indents)==0 then return false end if;value=source.indents[len(source.indents)-1];if typeOut!=void then typeOut[0]=value.type end if;if skipOut!=void then skipOut[0]=value.skip end if
  if len(source.indents)==1 then source.indents=[] else next=array(len(source.indents)-1,void);for i=0 to len(next)-1 next[i]=source.indents[i] end for;source.indents=next end if;return true
end function
/// Set `source.scripts` to `source.scripts+[script]` in `mq3.botlib.l_precomp.PC_PushScript`. Return paths include `len(source.scripts)`.
/// @param source Parser source state; accesses `scripts`. May update `source.scripts` in place.
/// @param script Value used by `PC_PushScript` in `source.scripts=source.scripts+[script]`.
function PC_PushScript(source,script) source.scripts=source.scripts+[script];return len(source.scripts) end function
/// Set `runtime.tokenHeapInitialized` to `true` in `mq3.botlib.l_precomp.PC_InitTokenHeap`.
/// @param runtime L precomp runtime; accesses `tokenHeapInitialized`. May update `runtime.tokenHeapInitialized` in place.
function PC_InitTokenHeap(runtime) runtime.tokenHeapInitialized=true;return true end function
/// Build the `mq3.vm.pc_parser.Token` result for `PC_CopyToken`.
/// @param token Parsed token; accesses `type`, `subtype`, `intValue`, `floatValue` and `text` and related fields.
function PC_CopyToken(token) if token==void then return void end if;return pc.Token(token.type,token.subtype,token.intValue,token.floatValue,token.text,token.line,token.leadingSpace) end function
/// Test `token!=void` as the condition for `PC_FreeToken`.
/// @param token Operand used to evaluate the returned expression `token!=void`.
function PC_FreeToken(token) return token!=void end function

/// Read the next raw preprocessor token and retain a successful token for subsequent source operations.
/// @param source Parser source state; accesses `lastToken`. May update `source.lastToken` in place.
function PC_ReadSourceToken(source)
  entry=sourceEntry(source);if entry==void then return void end if;token=pc.pcNextRaw(entry);if token!=void and not (token is error) then source.lastToken=token end if;return token
end function
/// Apply `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.unread` while evaluating `PC_UnreadSourceToken`.
/// @param source Parser source state; accesses `handle` and `runtime`.
/// @param token Value used by `unread` in `if token==void then return void end if`.
function PC_UnreadSourceToken(source,token) entry=sourceEntry(source);if entry==void then return false end if;pc.unread(entry,token);return true end function
/// Read balanced macro invocation parentheses, enforce the parameter limit, and return parsed argument token lists.
/// @param source Parser source state; accesses `handle` and `runtime`.
/// @param define Value record; accesses `parameters`.
/// @param maxparms Value used by `PC_ReadDefineParms` in `if count>maxparms then return void end if`.
function PC_ReadDefineParms(source,define,maxparms)
  entry=sourceEntry(source);if entry==void then return void end if;first=pc.take(entry);if first==void or first is error or first.text!="(" then if first!=void then pc.unread(entry,first) end if;return void end if
  tokens=[first];depth=0;while true token=pc.take(entry);if token==void or token is error then return void end if;tokens=tokens+[token];if token.text=="(" then depth=depth+1 else if token.text==")" then if depth==0 then break end if;depth=depth-1 end if end while
  count=pc.parameterCount(define);if count>maxparms then return void end if;result=pc.parseArguments(tokens,0,count);if not result.valid then return void end if;return result.arguments
end function
/// Apply `mq3.vm.pc_parser.stringized` while evaluating `PC_StringizeTokens`. Return paths include `pc.stringized(tokens,line)`.
/// @param tokens Value used by `stringized` in `if argument!=0 then for each token in argument if token.type==TT_STRING then text=text+"\""+token.text+"\"" else...`.
/// @param token Parsed token; accesses `line`.
function PC_StringizeTokens(tokens,token) line=1;if token!=void then line=token.line end if;return pc.stringized(tokens,line) end function
/// Forward `PC_MergeTokens` to `mq3.vm.pc_parser.mergedToken` and return the delegated result.
/// @param t1 Left record; accesses `type`, `text`, `line` and `leadingSpace`.
/// @param t2 Right record; accesses `type` and `text`.
function PC_MergeTokens(t1,t2) return pc.mergedToken(t1,t2) end function
/// Record or dispatch `"define"` actions in `PC_PrintDefine`. Return paths include `text`.
/// @param runtime L precomp runtime; accesses `retailActive`, `actions` and `host`. May update `runtime.actions` in place.
/// @param define Define record; accesses `name` and `tokens`.
function PC_PrintDefine(runtime,define) text=define.name;if define.tokens!=0 then for each token in define.tokens text=text+" "+token.text end for end if;emit(runtime,"define",text,"",0);return text end function
/// Apply `mq3.botlib.l_precomp.PC_PrintDefine` while evaluating `PC_PrintDefineHashTable`. Return paths include `count`.
/// @param runtime L precomp runtime; accesses `retailActive`, `actions` and `host`. May update `runtime.actions` in place.
/// @param table Value used by `PC_PrintDefineHashTable` in `for each bucket in table if bucket!=0 then for each define in bucket PC_PrintDefine(runtime,define)`.
function PC_PrintDefineHashTable(runtime,table) count=0;for each bucket in table if bucket!=0 then for each define in bucket PC_PrintDefine(runtime,define);count=count+1 end for end if end for;return count end function

/// Hash a macro name into the 1024-entry define table using the released position-weighted byte algorithm.
/// @param name Name used to identify the requested entry.
function PC_NameHash(name)
  hash=0;raw=bytes(name);if len(raw)>0 then for i=0 to len(raw)-1 hash=hash+raw[i]*(119+i) end for end if;return (hash^(hash>>10)^(hash>>20))&(DEFINEHASHSIZE-1)
end function
/// Set `table[hash]` to `[define]` and `table[hash]` to `[define]+table[hash]` in `mq3.botlib.l_precomp.PC_AddDefineToHash`. Return paths include `define`.
/// @param define Define record; accesses `name`.
/// @param table Array or byte sequence accessed at `hash`. Entries are written in place.
function PC_AddDefineToHash(define,table) hash=PC_NameHash(define.name);if table[hash]==0 then table[hash]=[define] else table[hash]=[define]+table[hash] end if;return define end function
/// Find a macro by exact name in its hash bucket and return void when the definition is absent.
/// @param table Array or byte sequence accessed at `PC_NameHash(name)`.
/// @param name Lookup text matched against `define.name`.
function PC_FindHashedDefine(table,name) bucket=table[PC_NameHash(name)];if bucket!=0 then for each define in bucket if define.name==name then return define end if end for end if;return void end function
/// Find a macro by exact name in a definition list and return void when the list has no match.
/// @param defines Value used by `PC_FindDefine` in `if defines!=0 and defines!=void then for each define in defines if define.name==name then return define end if e...`.
/// @param name Lookup text matched against `define.name`.
function PC_FindDefine(defines,name) if defines!=0 and defines!=void then for each define in defines if define.name==name then return define end if end for end if;return void end function
/// Forward `PC_FindDefineParm` to `mq3.vm.pc_parser.parameterIndex` and return the delegated result.
/// @param define Definition record; accesses `parameters`.
/// @param name Name used to identify the requested entry.
function PC_FindDefineParm(define,name) return pc.parameterIndex(define,name) end function
/// Test `define!=void` as the condition for `PC_FreeDefine`.
/// @param define Operand used to evaluate the returned expression `define!=void`.
function PC_FreeDefine(define) return define!=void end function
/// Test `source!=void` as the condition for `PC_AddBuiltinDefines`.
/// @param source Operand used to evaluate the returned expression `source!=void`.
function PC_AddBuiltinDefines(source) return source!=void end function
/// Apply `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.builtinToken` while evaluating `PC_ExpandBuiltinDefine`. Return paths include `pc.builtinToken(entry,deftoken)`.
/// @param source Parser source state; accesses `handle` and `runtime`.
/// @param deftoken Parsed token; accesses `text`, `line` and `leadingSpace`.
/// @param defineToken Not read by this implementation; retained in the `PC_ExpandBuiltinDefine` signature.
function PC_ExpandBuiltinDefine(source,deftoken,defineToken)
  entry=sourceEntry(source);if entry==void then return void end if;return pc.builtinToken(entry,deftoken)
end function
/// Apply `mq3.vm.pc_parser.substituteMacro` while evaluating `PC_ExpandDefine`. Return paths include `define.tokens`.
/// @param source Not read by this implementation; retained in the `PC_ExpandDefine` signature.
/// @param deftoken Deftoken record; accesses `line`.
/// @param define Define record; accesses `functionLike` and `tokens`.
/// @param parms Ordered arguments consumed by the call or formatter.
function PC_ExpandDefine(source,deftoken,define,parms) if define.functionLike then return pc.substituteMacro(define,parms,deftoken.line) end if;return define.tokens end function
/// Expand a source macro, prepend its tokens to the input queue, and report whether the macro was invoked.
/// @param source Parser source state; accesses `handle` and `runtime`.
/// @param deftoken Deftoken record; accesses `line`.
/// @param define Value record; accesses `functionLike`, `tokens` and `name`.
function PC_ExpandDefineIntoSource(source,deftoken,define)
  entry=sourceEntry(source);if entry==void then return false end if;expansion=pc.sourceMacroExpansion(entry,define,deftoken.line);if expansion is error or not expansion.valid then return false end if;if expansion.tokens!=0 then pc.queueFront(entry,expansion.tokens) end if;return expansion.invoked
end function

/// Normalize slash and backslash separators into single forward slashes.
/// @param path Resource path supplied to the file or parser operation.
function PC_ConvertPath(path)
  raw=bytes(path);result="";previous=false
  for each value in raw separator=value==47 or value==92;if separator then if not previous then result=result+"/" end if else result=result+decode(bytes([value])) end if;previous=separator end for
  return result
end function
/// Forward `PC_Directive_include` to `mq3.botlib.l_precomp.PC_ReadDirective` and return the delegated result.
/// @param source Parser source state; accesses `includePath` and `runtime`.
function PC_Directive_include(source) return PC_ReadDirective(source,"include") end function
/// Apply `mq3.botlib.l_precomp.sourceEntry`, `mq3.botlib.l_precomp.sourceLocation` and `mq3.vm.pc_parser.lineTokens` while evaluating `PC_ReadLine`. Return paths include `pc.lineTokens(entry,where[1])`.
/// @param source Parser source state; accesses `handle` and `runtime`.
function PC_ReadLine(source) entry=sourceEntry(source);if entry==void then return [] end if;where=sourceLocation(source);return pc.lineTokens(entry,where[1]) end function
/// Test `token!=void and token.leadingSpace` as the condition for `PC_WhiteSpaceBeforeToken`.
/// @param token Parsed token; accesses `leadingSpace`.
function PC_WhiteSpaceBeforeToken(token) return token!=void and token.leadingSpace end function
/// Set `token.leadingSpace` to `false` in `mq3.botlib.l_precomp.PC_ClearTokenWhiteSpace`.
/// @param token Parsed token; accesses `leadingSpace`. May update `token.leadingSpace` in place.
function PC_ClearTokenWhiteSpace(token) if token!=void then token.leadingSpace=false end if;return void end function

/// Remove a non-builtin macro from the shared definition table, returning false for missing or builtin names.
/// @param registry Registry record; accesses `defines`. May update `registry.defines[index]` in place.
/// @param name Name used to identify the requested entry.
function removeDefine(registry,name)
  index=pc.defineIndex(registry,name);if index<0 or pc.isBuiltin(name) then return false end if;registry.defines[index]=pc.Define("",0,0,false);return true
end function
/// Apply `mq3.botlib.l_precomp.PC_ReadLine`, `mq3.botlib.l_precomp.SourceError` and `mq3.botlib.l_precomp.removeDefine` while evaluating `PC_Directive_undef`.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_undef(source) values=PC_ReadLine(source);if len(values)!=1 or values[0].type!=pc.TT_NAME then return SourceError(source,"undef without name") end if;removeDefine(source.runtime.registry,values[0].text);return true end function
/// Set `source.runtime.registry.defines` to `source.runtime.registry.defines+[define]` and `source.runtime.registry.defines[index]` to `define` in `mq3.botlib.l_precomp.PC_Directive_define`.
/// @param source Parser source state; accesses `runtime`. May update `source.runtime.registry.defines` and `source.runtime.registry.defines[index]` in place.
function PC_Directive_define(source)
  values=PC_ReadLine(source);if len(values)==0 then return SourceError(source,"define without name") end if;define=pc.definition(values);if define is error or pc.isBuiltin(define.name) then return SourceError(source,"invalid define") end if;index=pc.defineIndex(source.runtime.registry,define.name);if index<0 then source.runtime.registry.defines=source.runtime.registry.defines+[define] else source.runtime.registry.defines[index]=define end if;return true
end function
/// Apply `mq3.vm.pc_parser.addDefine`, `mq3.vm.pc_parser.raw` and `mq3.vm.pc_parser.defineIndex` while evaluating `PC_DefineFromString`. Return paths include `runtime.registry.defines[pc.defineIndex(runtime.registry,first.text)]`.
/// @param runtime L precomp runtime; accesses `registry`.
/// @param string Text to parse, format or deliver.
function PC_DefineFromString(runtime,string)
  before=len(runtime.registry.defines);if pc.addDefine(runtime.registry,string)==0 then return void end if;nameSource=pc.Source("<define>",bytes(string),0,1,0);first=pc.raw(nameSource);if first==void or first is error then return void end if;return runtime.registry.defines[pc.defineIndex(runtime.registry,first.text)]
end function
/// Forward `PC_AddDefine` to `mq3.vm.pc_parser.addDefine` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
/// @param string Text to parse, format or deliver.
function PC_AddDefine(source,string) return pc.addDefine(source.runtime.registry,string) end function
/// Set `runtime.globalDefines` to `runtime.globalDefines+[string]` in `mq3.botlib.l_precomp.PC_AddGlobalDefine`.
/// @param runtime L precomp runtime; accesses `registry` and `globalDefines`. May update `runtime.globalDefines` in place.
/// @param string Text to parse, format or deliver.
function PC_AddGlobalDefine(runtime,string) result=pc.addDefine(runtime.registry,string);if result!=0 then runtime.globalDefines=runtime.globalDefines+[string] end if;return result end function
/// Forward `PC_RemoveGlobalDefine` to `mq3.botlib.l_precomp.removeDefine` and return the delegated result.
/// @param runtime L precomp runtime; accesses `registry`.
/// @param name Name used to identify the requested entry.
function PC_RemoveGlobalDefine(runtime,name) return removeDefine(runtime.registry,name) end function
/// Set `runtime.globalDefines` to `[]` in `mq3.botlib.l_precomp.PC_RemoveAllGlobalDefines`.
/// @param runtime L precomp runtime; accesses `registry` and `globalDefines`. May update `runtime.globalDefines` in place.
function PC_RemoveAllGlobalDefines(runtime) pc.clearDefines(runtime.registry);runtime.globalDefines=[];return void end function
/// Build the `mq3.vm.pc_parser.Define` result for `PC_CopyDefine`. Return paths include `pc.Define(define.name,parameters,tokens,define.functionLike)`.
/// @param source Not read by this implementation; retained in the `PC_CopyDefine` signature.
/// @param define Define record; accesses `tokens`, `parameters`, `name` and `functionLike`.
function PC_CopyDefine(source,define) tokens=0;if define.tokens!=0 then tokens=[];for each token in define.tokens tokens=tokens+[PC_CopyToken(token)] end for end if;parameters=define.parameters;if parameters!=0 then copy=[];for each name in parameters copy=copy+[name] end for;parameters=copy end if;return pc.Define(define.name,parameters,tokens,define.functionLike) end function
/// Return the number of entries in `source.runtime.globalDefines` for `PC_AddGlobalDefinesToSource`.
/// @param source Parser source state; accesses `runtime`.
function PC_AddGlobalDefinesToSource(source) return len(source.runtime.globalDefines) end function

/// Apply `mq3.botlib.l_precomp.sourceEntry`, `mq3.botlib.l_precomp.sourceLocation` and `mq3.vm.pc_parser.conditionalDirective` while evaluating `conditional`. Return paths include `pc.conditionalDirective(source.runtime.registry,entry,name,where[1])`.
/// @param source Parser source state; accesses `runtime`.
/// @param name Name used to identify the requested entry.
function conditional(source,name) entry=sourceEntry(source);if entry==void then return false end if;where=sourceLocation(source);return pc.conditionalDirective(source.runtime.registry,entry,name,where[1]) end function
/// Apply `mq3.botlib.l_precomp.conditional` while evaluating `PC_Directive_if_def`. Return paths include `conditional(source,"ifndef")`.
/// @param source Parser source state; accesses `runtime`.
/// @param type Value used by `PC_Directive_if_def` in `if type==INDENT_IFDEF then return conditional(source,"ifdef") end if`.
function PC_Directive_if_def(source,type) if type==INDENT_IFDEF then return conditional(source,"ifdef") end if;return conditional(source,"ifndef") end function
/// Forward `PC_Directive_ifdef` to `mq3.botlib.l_precomp.conditional` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_ifdef(source) return conditional(source,"ifdef") end function
/// Forward `PC_Directive_ifndef` to `mq3.botlib.l_precomp.conditional` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_ifndef(source) return conditional(source,"ifndef") end function
/// Forward `PC_Directive_else` to `mq3.botlib.l_precomp.conditional` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_else(source) return conditional(source,"else") end function
/// Forward `PC_Directive_endif` to `mq3.botlib.l_precomp.conditional` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_endif(source) return conditional(source,"endif") end function
/// Forward `PC_Directive_elif` to `mq3.botlib.l_precomp.conditional` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_elif(source) return conditional(source,"elif") end function
/// Forward `PC_Directive_if` to `mq3.botlib.l_precomp.conditional` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_if(source) return conditional(source,"if") end function

/// Map a preprocessor operator code to its original arithmetic, comparison or logical precedence.
/// @param op Numeric syscall operation identifier.
function PC_OperatorPriority(op)
  if op==P_MUL or op==P_DIV or op==P_MOD then return 15 end if;if op==P_ADD or op==P_SUB then return 14 end if
  if op==P_RSHIFT or op==P_LSHIFT then return 13 end if;if op==P_LOGIC_GEQ or op==P_LOGIC_LEQ or op==P_LOGIC_GREATER or op==P_LOGIC_LESS then return 12 end if
  if op==P_LOGIC_EQ or op==P_LOGIC_UNEQ then return 11 end if;if op==P_BIN_AND then return 10 end if;if op==P_BIN_XOR then return 9 end if;if op==P_BIN_OR then return 8 end if
  if op==P_LOGIC_AND then return 7 end if;if op==P_LOGIC_OR then return 6 end if;if op==P_LOGIC_NOT or op==P_BIN_NOT then return 16 end if;if op==P_COLON or op==P_QUESTIONMARK then return 5 end if;return 0
end function
/// Set `intvalue[0]` to `result[1]` and `floatvalue[0]` to `result[1]*1.0` in `mq3.botlib.l_precomp.PC_EvaluateTokens`.
/// @param source Parser source state; accesses `runtime`.
/// @param tokens Array or byte sequence accessed at `openIndex` and `index`.
/// @param intvalue Array or byte sequence accessed at `0`. Entries are written in place.
/// @param floatvalue Array or byte sequence accessed at `0`. Entries are written in place.
/// @param integer Not read by this implementation; retained in the `PC_EvaluateTokens` signature.
function PC_EvaluateTokens(source,tokens,intvalue,floatvalue,integer)
  result=pc.evaluateExpression(source.runtime.registry,tokens);if not result[0] then return false end if;if intvalue!=void then intvalue[0]=result[1] end if;if floatvalue!=void then floatvalue[0]=result[1]*1.0 end if;return true
end function
/// Forward `PC_Evaluate` to `mq3.botlib.l_precomp.PC_EvaluateTokens` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
/// @param intvalue Array or byte sequence accessed at `0`. Entries are written in place.
/// @param floatvalue Array or byte sequence accessed at `0`. Entries are written in place.
/// @param integer Value passed as argument 5 to `mq3.botlib.l_precomp.PC_EvaluateTokens`.
function PC_Evaluate(source,intvalue,floatvalue,integer) return PC_EvaluateTokens(source,PC_ReadLine(source),intvalue,floatvalue,integer) end function
/// Forward `PC_DollarEvaluate` to `mq3.botlib.l_precomp.PC_Evaluate` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
/// @param intvalue Array or byte sequence accessed at `0`. Entries are written in place.
/// @param floatvalue Array or byte sequence accessed at `0`. Entries are written in place.
/// @param integer Value passed as argument 5 to `mq3.botlib.l_precomp.PC_EvaluateTokens`.
function PC_DollarEvaluate(source,intvalue,floatvalue,integer) return PC_Evaluate(source,intvalue,floatvalue,integer) end function
/// Apply `mq3.botlib.l_precomp.PC_ReadLine`, `mq3.botlib.l_precomp.SourceError` and `mq3.botlib.l_precomp.sourceEntry` while evaluating `PC_Directive_line`.
/// @param source Parser source state; accesses `handle` and `runtime`.
function PC_Directive_line(source) values=PC_ReadLine(source);if len(values)<1 or values[0].type!=pc.TT_NUMBER then return SourceError(source,"line without number") end if;entry=sourceEntry(source);active=entry[1][len(entry[1])-1];active.line=values[0].intValue;return true end function
/// Apply `mq3.botlib.l_precomp.PC_ReadLine` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_Directive_error`. Return paths include `SourceError(source,message)`.
/// @param source Parser source state; accesses `handle` and `runtime`.
function PC_Directive_error(source) values=PC_ReadLine(source);message="";for each token in values if message!="" then message=message+" " end if;message=message+token.text end for;return SourceError(source,message) end function
/// Apply `mq3.botlib.l_precomp.PC_ReadLine` while evaluating `PC_Directive_pragma`.
/// @param source Parser source state; accesses `handle` and `runtime`.
function PC_Directive_pragma(source) PC_ReadLine(source);return true end function
/// Apply `mq3.botlib.l_precomp.PC_UnreadSourceToken` while evaluating `UnreadSignToken`.
/// @param source Parser source state; accesses `lastToken`.
function UnreadSignToken(source) if source.lastToken!=void and (source.lastToken.text=="-" or source.lastToken.text=="+") then return PC_UnreadSourceToken(source,source.lastToken) end if;return false end function
/// Create a `mq3.vm.pc_parser.Token` record, initializing `type` as `pc.TT_NUMBER`, `subtype` as `pc.TT_DECIMAL|pc.TT_INTEGER` and `intValue` from `value`.
/// @param value Initial value stored in `mq3.vm.pc_parser.Token.intValue`.
/// @param line Source line number attached to the diagnostic.
function evaluationToken(value,line) return pc.Token(pc.TT_NUMBER,pc.TT_DECIMAL|pc.TT_INTEGER,value,value*1.0,str(value),line,false) end function
/// Apply `mq3.botlib.l_precomp.PC_Evaluate`, `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.queueFront` while evaluating `PC_Directive_eval`.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_eval(source) valueOut=[0];if not PC_Evaluate(source,valueOut,void,true) then return false end if;entry=sourceEntry(source);pc.queueFront(entry,[evaluationToken(valueOut[0],sourceLocation(source)[1])]);return true end function
/// Apply `mq3.botlib.l_precomp.PC_Evaluate`, `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.queueFront` while evaluating `PC_Directive_evalfloat`.
/// @param source Parser source state; accesses `runtime`.
function PC_Directive_evalfloat(source) valueOut=[0];if not PC_Evaluate(source,valueOut,void,false) then return false end if;entry=sourceEntry(source);pc.queueFront(entry,[evaluationToken(valueOut[0],sourceLocation(source)[1])]);return true end function

/// Apply `mq3.botlib.l_precomp.PC_ReadLine`, `mq3.botlib.l_precomp.SourceError` and `mq3.botlib.l_precomp.sourceEntry` while evaluating `PC_ReadDirective`. Return paths include `SourceError(source,"unknown precompiler directive "+name)`.
/// @param source Parser source state; accesses `includePath` and `runtime`.
/// @param name Name used to identify the requested entry.
function PC_ReadDirective(source,name)
  if name=="include" then values=PC_ReadLine(source);if len(values)!=1 then return SourceError(source,"include without file name") end if;entry=sourceEntry(source);includeName=values[0].text;if source.includePath!="" then includeName=source.includePath+includeName end if;return pc.pushInclude(source.runtime.registry,entry,PC_ConvertPath(includeName)) end if
  if name=="define" then return PC_Directive_define(source) end if;if name=="undef" then return PC_Directive_undef(source) end if;if name=="if" then return PC_Directive_if(source) end if;if name=="ifdef" then return PC_Directive_ifdef(source) end if;if name=="ifndef" then return PC_Directive_ifndef(source) end if;if name=="elif" then return PC_Directive_elif(source) end if;if name=="else" then return PC_Directive_else(source) end if;if name=="endif" then return PC_Directive_endif(source) end if;if name=="line" then return PC_Directive_line(source) end if;if name=="error" then return PC_Directive_error(source) end if;if name=="pragma" then return PC_Directive_pragma(source) end if;if name=="eval" then return PC_Directive_eval(source) end if;if name=="evalfloat" then return PC_Directive_evalfloat(source) end if;return SourceError(source,"unknown precompiler directive "+name)
end function
/// Forward `PC_DollarDirective_evalint` to `mq3.botlib.l_precomp.PC_Directive_eval` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_DollarDirective_evalint(source) return PC_Directive_eval(source) end function
/// Forward `PC_DollarDirective_evalfloat` to `mq3.botlib.l_precomp.PC_Directive_evalfloat` and return the delegated result.
/// @param source Parser source state; accesses `runtime`.
function PC_DollarDirective_evalfloat(source) return PC_Directive_evalfloat(source) end function
/// Apply `mq3.botlib.l_precomp.PC_DollarDirective_evalint`, `mq3.botlib.l_precomp.PC_DollarDirective_evalfloat` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ReadDollarDirective`. Return paths include `SourceError(source,"unknown dollar directive "+name)`.
/// @param source Parser source state; accesses `runtime`.
/// @param name Name used to identify the requested entry.
function PC_ReadDollarDirective(source,name) if name=="evalint" then return PC_DollarDirective_evalint(source) end if;if name=="evalfloat" then return PC_DollarDirective_evalfloat(source) end if;return SourceError(source,"unknown dollar directive "+name) end function
/// Apply `mq3.botlib.l_precomp.PC_ReadSourceToken` and `mq3.botlib.l_precomp.PC_UnreadSourceToken` while evaluating `BuiltinFunction`. Return paths include `token.type==pc.TT_NUMBER`.
/// @param source Parser source state; accesses `lastToken`. May update `source.lastToken` in place.
function BuiltinFunction(source) token=PC_ReadSourceToken(source);if token==void then return false end if;PC_UnreadSourceToken(source,token);return token.type==pc.TT_NUMBER end function
/// Apply `mq3.botlib.l_precomp.PC_ReadSourceToken` and `mq3.botlib.l_precomp.PC_UnreadSourceToken` while evaluating `QuakeCMacro`. Return paths include `token.type!=pc.TT_NAME or (token.text!="evalint" and token.text!="evalfloat")`.
/// @param source Parser source state; accesses `lastToken`. May update `source.lastToken` in place.
function QuakeCMacro(source) token=PC_ReadSourceToken(source);if token==void then return true end if;PC_UnreadSourceToken(source,token);return token.type!=pc.TT_NAME or (token.text!="evalint" and token.text!="evalfloat") end function

/// Set `source.lastToken` to `token` in `mq3.botlib.l_precomp.PC_ReadToken`. Return paths include `token`.
/// @param source Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place.
function PC_ReadToken(source) token=pc.read(source.runtime.registry,source.handle);if token!=void and not (token is error) then source.lastToken=token end if;return token end function
/// Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ExpectTokenString`. Return paths include `token`.
/// @param source Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place.
/// @param string Operand used to evaluate the returned expression `SourceError(source,"expected "+string)`.
function PC_ExpectTokenString(source,string) token=PC_ReadToken(source);if token==void or token is error or token.text!=string then return SourceError(source,"expected "+string) end if;return token end function
/// Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ExpectTokenType`. Return paths include `token`.
/// @param source Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place.
/// @param type Value used by `PC_ExpectTokenType` in `if token==void or token is error or token.type!=type or subtype!=0 and (token.subtype&subtype)==0 then return So...`.
/// @param subtype Value used by `PC_ExpectTokenType` in `if token==void or token is error or token.type!=type or subtype!=0 and (token.subtype&subtype)==0 then return So...`.
function PC_ExpectTokenType(source,type,subtype) token=PC_ReadToken(source);if token==void or token is error or token.type!=type or subtype!=0 and (token.subtype&subtype)==0 then return SourceError(source,"unexpected token type") end if;return token end function
/// Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ExpectAnyToken`. Return paths include `token`.
/// @param source Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place.
function PC_ExpectAnyToken(source) token=PC_ReadToken(source);if token==void then return SourceError(source,"couldn't read expected token") end if;return token end function
/// Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.PC_UnreadToken` while evaluating `PC_CheckTokenString`.
/// @param source Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place.
/// @param string Value used by `PC_CheckTokenString` in `if token.text==string then return true end if`.
function PC_CheckTokenString(source,string) token=PC_ReadToken(source);if token==void or token is error then return false end if;if token.text==string then return true end if;PC_UnreadToken(source,token);return false end function
/// Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.PC_UnreadToken` while evaluating `PC_CheckTokenType`.
/// @param source Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place.
/// @param type Value used by `PC_CheckTokenType` in `if token.type==type and (subtype==0 or (token.subtype&subtype)!=0) then return token end if`.
/// @param subtype Value used by `PC_CheckTokenType` in `if token.type==type and (subtype==0 or (token.subtype&subtype)!=0) then return token end if`.
function PC_CheckTokenType(source,type,subtype) token=PC_ReadToken(source);if token==void or token is error then return void end if;if token.type==type and (subtype==0 or (token.subtype&subtype)!=0) then return token end if;PC_UnreadToken(source,token);return void end function
/// Apply `mq3.botlib.l_precomp.PC_ReadToken` while evaluating `PC_SkipUntilString`.
/// @param source Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place.
/// @param string Value used by `PC_SkipUntilString` in `if token.text==string then return true end if end while`.
function PC_SkipUntilString(source,string) while true token=PC_ReadToken(source);if token==void or token is error then return false end if;if token.text==string then return true end if end while end function
/// Apply `mq3.botlib.l_precomp.PC_UnreadToken` while evaluating `PC_UnreadLastToken`. Return paths include `PC_UnreadToken(source,source.lastToken)`.
/// @param source Parser source state; accesses `lastToken`.
function PC_UnreadLastToken(source) if source.lastToken==void then return false end if;return PC_UnreadToken(source,source.lastToken) end function
/// Forward `PC_UnreadToken` to `mq3.botlib.l_precomp.PC_UnreadSourceToken` and return the delegated result.
/// @param source Parser source state; accesses `handle` and `runtime`.
/// @param token Value used by `unread` in `if token==void then return void end if`.
function PC_UnreadToken(source,token) return PC_UnreadSourceToken(source,token) end function
/// Set `source.includePath` to `PC_ConvertPath(path)` and `source.includePath` to `source.includePath+"/"` in `mq3.botlib.l_precomp.PC_SetIncludePath`. Return paths include `source.includePath`.
/// @param source Parser source state; accesses `includePath`. May update `source.includePath` in place.
/// @param path Resource path supplied to the file or parser operation.
function PC_SetIncludePath(source,path) source.includePath=PC_ConvertPath(path);if source.includePath!="" and bytes(source.includePath)[len(bytes(source.includePath))-1]!=47 then source.includePath=source.includePath+"/" end if;return source.includePath end function
/// Set `source.punctuations` to `p` in `mq3.botlib.l_precomp.PC_SetPunctuations`. Return paths include `p`.
/// @param source Parser source state; accesses `punctuations`. May update `source.punctuations` in place.
/// @param p Operand used to evaluate the returned expression `p`.
function PC_SetPunctuations(source,p) source.punctuations=p;return p end function

/// Build the `mq3.botlib.l_precomp.Source` result for `wrap`. Return paths include `Source(runtime,handle,"",void,void,[],[])`.
/// @param runtime Initial value stored in `mq3.botlib.l_precomp.Source.runtime`.
/// @param handle Handle identifying the allocated preprocessor source.
function wrap(runtime,handle) if handle==0 then return void end if;return Source(runtime,handle,"",void,void,[],[]) end function
/// Forward `LoadSourceFile` to `mq3.botlib.l_precomp.wrap` and return the delegated result.
/// @param runtime L precomp runtime; accesses `registry` and `baseFolder`.
/// @param filename Filename supplied to the configured loader or file service.
function LoadSourceFile(runtime,filename) return wrap(runtime,pc.load(runtime.registry,PC_ConvertPath(runtime.baseFolder+filename))) end function
/// Set `runtime.registry.sources[slot]` to `[name,[pc.Source(name,data,0,1,0)],0,0]` in `mq3.botlib.l_precomp.LoadSourceMemory`. Return paths include `wrap(runtime,slot)`.
/// @param runtime L precomp runtime; accesses `registry`. May update `runtime.registry.sources[slot]` in place.
/// @param ptr Value used by `LoadSourceMemory` in `data=ptr`.
/// @param length Value passed as argument 3 to `slice`.
/// @param name Name used to identify the requested entry.
function LoadSourceMemory(runtime,ptr,length,name)
  slot=1;while slot<pc.MAX_SOURCEFILES and runtime.registry.sources[slot]!=0 slot=slot+1 end while;if slot>=pc.MAX_SOURCEFILES then return void end if;data=ptr;if typeof(data)=="string" then data=bytes(data) end if;if length<len(data) then data=slice(data,0,length) end if
  runtime.registry.sources[slot]=[name,[pc.Source(name,data,0,1,0)],0,0];return wrap(runtime,slot)
end function
/// Apply `mq3.vm.pc_parser.free` while evaluating `FreeSource`. Return paths include `pc.free(source.runtime.registry,source.handle)!=0`.
/// @param source Parser source state; accesses `runtime` and `handle`.
function FreeSource(source) if source==void then return false end if;return pc.free(source.runtime.registry,source.handle)!=0 end function
/// Forward `PC_LoadSourceHandle` to `mq3.vm.pc_parser.load` and return the delegated result.
/// @param runtime L precomp runtime; accesses `registry` and `baseFolder`.
/// @param filename Filename supplied to the configured loader or file service.
function PC_LoadSourceHandle(runtime,filename) return pc.load(runtime.registry,PC_ConvertPath(runtime.baseFolder+filename)) end function
/// Forward `PC_FreeSourceHandle` to `mq3.vm.pc_parser.free` and return the delegated result.
/// @param runtime L precomp runtime; accesses `registry`.
/// @param handle Handle identifying the allocated preprocessor source.
function PC_FreeSourceHandle(runtime,handle) return pc.free(runtime.registry,handle) end function
/// Forward `PC_ReadTokenHandle` to `mq3.vm.pc_parser.read` and return the delegated result.
/// @param runtime L precomp runtime; accesses `registry`.
/// @param handle Resource handle resolved by the owning pool or host service.
function PC_ReadTokenHandle(runtime,handle) return pc.read(runtime.registry,handle) end function
/// Forward `PC_SourceFileAndLine` to `mq3.vm.pc_parser.location` and return the delegated result.
/// @param runtime L precomp runtime; accesses `registry`.
/// @param handle Handle identifying the allocated preprocessor source.
function PC_SourceFileAndLine(runtime,handle) return pc.location(runtime.registry,handle) end function
/// Set `runtime.baseFolder` to `PC_ConvertPath(path)` and `runtime.baseFolder` to `runtime.baseFolder+"/"` in `mq3.botlib.l_precomp.PC_SetBaseFolder`. Return paths include `runtime.baseFolder`.
/// @param runtime L precomp runtime; accesses `baseFolder`. May update `runtime.baseFolder` in place.
/// @param path Resource path supplied to the file or parser operation.
function PC_SetBaseFolder(runtime,path) runtime.baseFolder=PC_ConvertPath(path);if runtime.baseFolder!="" and bytes(runtime.baseFolder)[len(bytes(runtime.baseFolder))-1]!=47 then runtime.baseFolder=runtime.baseFolder+"/" end if;return runtime.baseFolder end function
/// Record or dispatch `"open-source"` actions in `PC_CheckOpenSourceHandles`. Return paths include `count`.
/// @param runtime L precomp runtime; accesses `registry`.
function PC_CheckOpenSourceHandles(runtime) count=0;for i=1 to pc.MAX_SOURCEFILES-1 if runtime.registry.sources[i]!=0 then count=count+1;emit(runtime,"open-source",pc.location(runtime.registry,i)[0],pc.location(runtime.registry,i)[0],pc.location(runtime.registry,i)[1]) end if end for;return count end function
