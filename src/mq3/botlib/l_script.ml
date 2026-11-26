// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete MiniLang port of code/botlib/l_script.c. Script owns a pc.Source
// directly so the lexer and l_precomp/pc_parser adapters share one cursor.
package mq3.botlib.l_script

import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n

/// Maximum character capacity reserved for a scanner token spelling.
const MAX_TOKEN=1024
/// Scanner flag suppressing error diagnostics.
const SCFL_NOERRORS=0x0001
/// Scanner flag suppressing warning diagnostics.
const SCFL_NOWARNINGS=0x0002
/// Scanner flag preventing whitespace-separated string literals from being joined.
const SCFL_NOSTRINGWHITESPACES=0x0004
/// Scanner flag disabling escape-sequence interpretation inside string literals.
const SCFL_NOSTRINGESCAPECHARS=0x0008
/// Scanner flag selecting primitive tokenization rules.
const SCFL_PRIMITIVE=0x0010
/// Scanner flag disabling binary-number literal syntax.
const SCFL_NOBINARYNUMBERS=0x0020
/// Scanner flag preventing numeric token values from being calculated.
const SCFL_NONUMBERVALUES=0x0040

/// Token-kind identifier for a quoted string literal.
const TT_STRING=1
/// Token-kind identifier for a quoted character literal.
const TT_LITERAL=2
/// Token-kind identifier for a numeric literal.
const TT_NUMBER=3
/// Token-kind identifier for an identifier or unquoted name.
const TT_NAME=4
/// Token-kind identifier for an operator or punctuation spelling.
const TT_PUNCTUATION=5
/// Numeric-token subtype flag for decimal notation.
const TT_DECIMAL=0x0008
/// Numeric-token subtype flag for hexadecimal notation.
const TT_HEX=0x0100
/// Numeric-token subtype flag for octal notation.
const TT_OCTAL=0x0200
/// Numeric-token subtype flag for binary notation.
const TT_BINARY=0x0400
/// Numeric-token subtype flag for a floating-point value.
const TT_FLOAT=0x0800
/// Numeric-token subtype flag for an integer value.
const TT_INTEGER=0x1000
/// Numeric-token subtype flag for an integer with a long suffix.
const TT_LONG=0x2000
/// Numeric-token subtype flag for an unsigned integer.
const TT_UNSIGNED=0x4000

/// Scanner punctuation identifier for `>>=`.
const P_RSHIFT_ASSIGN=1
/// Scanner punctuation identifier for `<<=`.
const P_LSHIFT_ASSIGN=2
/// Scanner punctuation identifier for `...`.
const P_PARMS=3
/// Scanner punctuation identifier for `##`.
const P_PRECOMPMERGE=4
/// Scanner punctuation identifier for `&&`.
const P_LOGIC_AND=5
/// Scanner punctuation identifier for `||`.
const P_LOGIC_OR=6
/// Scanner punctuation identifier for `>=`.
const P_LOGIC_GEQ=7
/// Scanner punctuation identifier for `<=`.
const P_LOGIC_LEQ=8
/// Scanner punctuation identifier for `==`.
const P_LOGIC_EQ=9
/// Scanner punctuation identifier for `!=`.
const P_LOGIC_UNEQ=10
/// Scanner punctuation identifier for `*=`.
const P_MUL_ASSIGN=11
/// Scanner punctuation identifier for `/=`.
const P_DIV_ASSIGN=12
/// Scanner punctuation identifier for `%=`.
const P_MOD_ASSIGN=13
/// Scanner punctuation identifier for `+=`.
const P_ADD_ASSIGN=14
/// Scanner punctuation identifier for `-=`.
const P_SUB_ASSIGN=15
/// Scanner punctuation identifier for `++`.
const P_INC=16
/// Scanner punctuation identifier for `--`.
const P_DEC=17
/// Scanner punctuation identifier for `&=`.
const P_BIN_AND_ASSIGN=18
/// Scanner punctuation identifier for `|=`.
const P_BIN_OR_ASSIGN=19
/// Scanner punctuation identifier for `^=`.
const P_BIN_XOR_ASSIGN=20
/// Scanner punctuation identifier for `>>`.
const P_RSHIFT=21
/// Scanner punctuation identifier for `<<`.
const P_LSHIFT=22
/// Scanner punctuation identifier for `->`.
const P_POINTERREF=23
/// Scanner punctuation identifier for `::`.
const P_CPP1=24
/// Scanner punctuation identifier for `.*`.
const P_CPP2=25
/// Scanner punctuation identifier for `*`.
const P_MUL=26
/// Scanner punctuation identifier for `/`.
const P_DIV=27
/// Scanner punctuation identifier for `%`.
const P_MOD=28
/// Scanner punctuation identifier for `+`.
const P_ADD=29
/// Scanner punctuation identifier for `-`.
const P_SUB=30
/// Scanner punctuation identifier for `=`.
const P_ASSIGN=31
/// Scanner punctuation identifier for `&`.
const P_BIN_AND=32
/// Scanner punctuation identifier for `|`.
const P_BIN_OR=33
/// Scanner punctuation identifier for `^`.
const P_BIN_XOR=34
/// Scanner punctuation identifier for `~`.
const P_BIN_NOT=35
/// Scanner punctuation identifier for `!`.
const P_LOGIC_NOT=36
/// Scanner punctuation identifier for `>`.
const P_LOGIC_GREATER=37
/// Scanner punctuation identifier for `<`.
const P_LOGIC_LESS=38
/// Scanner punctuation identifier for `.`.
const P_REF=39
/// Scanner punctuation identifier for `,`.
const P_COMMA=40
/// Scanner punctuation identifier for `;`.
const P_SEMICOLON=41
/// Scanner punctuation identifier for `:`.
const P_COLON=42
/// Scanner punctuation identifier for `?`.
const P_QUESTIONMARK=43
/// Scanner punctuation identifier for `(`.
const P_PARENTHESESOPEN=44
/// Scanner punctuation identifier for `)`.
const P_PARENTHESESCLOSE=45
/// Scanner punctuation identifier for `{`.
const P_BRACEOPEN=46
/// Scanner punctuation identifier for `}`.
const P_BRACECLOSE=47
/// Scanner punctuation identifier for `[`.
const P_SQBRACKETOPEN=48
/// Scanner punctuation identifier for `]`.
const P_SQBRACKETCLOSE=49
/// Scanner punctuation identifier for `\\`.
const P_BACKSLASH=50
/// Scanner punctuation identifier for `#`.
const P_PRECOMP=51
/// Scanner punctuation identifier for `$`.
const P_DOLLAR=52

/// `Punctuation` record for l script, containing `p` and `n`.
struct Punctuation
  /// Operator or punctuation spelling recognized by the scanner.
  p
  /// Token identifier assigned to the recognized punctuation spelling.
  n
end struct
/// `Token` record for l script, containing `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields.
struct Token
  /// Token spelling copied from the script source.
  string
  /// Last read token type.
  type
  /// Last read token sub type.
  subtype
  /// Integer interpretation of a numeric or character token.
  intValue
  /// Floating point value.
  floatValue
  /// Source offset at the beginning of whitespace preceding the token.
  whitespaceStart
  /// Source offset immediately after whitespace preceding the token.
  whitespaceEnd
  /// Source-line number associated with the token, diagnostic, or allocation.
  line
  /// Lines crossed in white space.
  linescrossed
  /// Next token in a retained token chain.
  next
end struct
/// `ScriptHost` record for l script, containing `loadFn`, `actionFn` and `context`.
struct ScriptHost
  /// Host callback that loads the requested resource through the host interface.
  loadFn
  /// Host callback that dispatches a recorded subsystem action to the host.
  actionFn
  /// Caller-supplied data associated with lexical source loading and scanner diagnostics.
  context
end struct
/// `Runtime` record for l script, containing `host` and `baseFolder`.
struct Runtime
  /// Host callback interface supplying external services to this runtime.
  host
  /// Base folder prepended when resolving bot script paths.
  baseFolder
end struct
/// `Script` record for l script, containing `runtime`, `source`, `lastOffset`, `lastLine` and `whitespaceStart` and related fields.
struct Script
  /// Owning scanner runtime providing source services and diagnostic callbacks.
  runtime
  /// Source text and scanner state consumed by this script reader.
  source
  /// Source offset retained so the most recently read token can be unread.
  lastOffset
  /// Line before reading token.
  lastLine
  /// Source offset at the beginning of whitespace preceding the token.
  whitespaceStart
  /// Source offset immediately after whitespace preceding the token.
  whitespaceEnd
  /// True when the last token has been unread and will be returned again.
  tokenAvailable
  /// Scanner options controlling accepted syntax and diagnostics.
  flags
  /// The punctuations used in the script.
  punctuations
  /// Most recently scanned token retained for unread or lookahead operations.
  token
  /// True after this managed resource has been released.
  freed
end struct

/// Create a `mq3.botlib.l_script.ScriptHost` record with the declared empty defaults.
function host() return ScriptHost(void,void,void) end function
/// Build the `mq3.botlib.l_script.Runtime` result for `create`. Return paths include `Runtime(hostValue,"")`.
/// @param hostValue Initial value stored in `mq3.botlib.l_script.Runtime.host`.
function create(hostValue) if hostValue==void then hostValue=host() end if;return Runtime(hostValue,"") end function
/// Return the ordered default punctuations table for l script: 52 entries beginning with `Punctuation(">>=",1)` and `Punctuation("<<=",2)`.
function defaultPunctuations()
  return [Punctuation(">>=",1),Punctuation("<<=",2),Punctuation("...",3),Punctuation("##",4),Punctuation("&&",5),Punctuation("||",6),Punctuation(">=",7),Punctuation("<=",8),Punctuation("==",9),Punctuation("!=",10),Punctuation("*=",11),Punctuation("/=",12),Punctuation("%=",13),Punctuation("+=",14),Punctuation("-=",15),Punctuation("++",16),Punctuation("--",17),Punctuation("&=",18),Punctuation("|=",19),Punctuation("^=",20),Punctuation(">>",21),Punctuation("<<",22),Punctuation("->",23),Punctuation("::",24),Punctuation(".*",25),Punctuation("*",26),Punctuation("/",27),Punctuation("%",28),Punctuation("+",29),Punctuation("-",30),Punctuation("=",31),Punctuation("&",32),Punctuation("|",33),Punctuation("^",34),Punctuation("~",35),Punctuation("!",36),Punctuation(">",37),Punctuation("<",38),Punctuation(".",39),Punctuation(",",40),Punctuation(";",41),Punctuation(":",42),Punctuation("?",43),Punctuation("(",44),Punctuation(")",45),Punctuation("{",46),Punctuation("}",47),Punctuation("[",48),Punctuation("]",49),Punctuation("\\",50),Punctuation("#",51),Punctuation("$",52)]
end function
/// Create a `mq3.botlib.l_script.Token` record with the declared empty defaults.
function emptyToken() return Token("",0,0,0,0.0,0,0,0,0,void) end function
/// Build the `mq3.botlib.l_script.Token` result for `copyToken`.
/// @param value Value record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields.
function copyToken(value) if value==void then return void end if;return Token(value.string,value.type,value.subtype,value.intValue,value.floatValue,value.whitespaceStart,value.whitespaceEnd,value.line,value.linescrossed,value.next) end function
/// Forward `at` to `mq3.vm.pc_parser.at` and return the delegated result.
/// @param script Lexical script state; accesses `source`.
/// @param index Index of the entry to access.
function at(script,index) return pc.at(script.source,index) end function
/// Return the result of `decode(bytes([value]))` for `charText`.
/// @param value Operand used to evaluate the returned expression `decode(bytes([value]))`.
function charText(value) return decode(bytes([value])) end function
/// Decode a byte range from the lexical source, returning an empty string for a nonpositive length.
/// @param script Lexical script state; accesses `source`.
/// @param start Value passed as argument 2 to `slice`.
/// @param count Number of entries or bytes processed by this call.
function span(script,start,count) if count<=0 then return "" end if;return decode(slice(script.source.data,start,count)) end function
/// Use `script.runtime.host.actionFn` to perform `emit`.
/// @param script Lexical script state; accesses `flags`, `runtime` and `source`.
/// @param kind Value passed as argument 2 to `script.runtime.host.actionFn`.
/// @param message Message text supplied to the diagnostic or chat operation.
function emit(script,kind,message)
  if script==void then return false end if
  if kind=="error" and (script.flags&SCFL_NOERRORS)!=0 then return false end if
  if kind=="warning" and (script.flags&SCFL_NOWARNINGS)!=0 then return false end if
  if script.runtime!=void and script.runtime.host!=void and script.runtime.host.actionFn!=void then script.runtime.host.actionFn(script.runtime.host.context,kind,script.source.name,script.source.line,message) end if
  return false
end function
/// Forward `ScriptError` to `mq3.botlib.l_script.emit` and return the delegated result.
/// @param script Lexical script state; accesses `flags`, `runtime` and `source`.
/// @param str Message text supplied to the diagnostic or chat operation.
function ScriptError(script,str) return emit(script,"error",str) end function
/// Forward `ScriptWarning` to `mq3.botlib.l_script.emit` and return the delegated result.
/// @param script Lexical script state; accesses `flags`, `runtime` and `source`.
/// @param str Message text supplied to the diagnostic or chat operation.
function ScriptWarning(script,str) return emit(script,"warning",str) end function

/// Set `script.punctuations` to `sorted` in `mq3.botlib.l_script.PS_CreatePunctuationTable`. Return paths include `sorted`.
/// @param script Lexical script state; accesses `punctuations`. May update `script.punctuations` in place.
/// @param punctuations Value used by `PS_CreatePunctuationTable` in `if punctuations==void then punctuations=defaultPunctuations() end if`.
function PS_CreatePunctuationTable(script,punctuations)
  if punctuations==void then punctuations=defaultPunctuations() end if
  sorted=[]
  for each value in punctuations
    placed=false;next=[]
    for each current in sorted
      if not placed and bytes(value.p)[0]==bytes(current.p)[0] and len(bytes(value.p))>len(bytes(current.p)) then next=next+[value];placed=true end if
      next=next+[current]
    end for
    if not placed then next=next+[value] end if;sorted=next
  end for
  script.punctuations=sorted;return sorted
end function
/// Forward `SetScriptPunctuations` to `mq3.botlib.l_script.PS_CreatePunctuationTable` and return the delegated result.
/// @param script Lexical script state; accesses `punctuations`. May update `script.punctuations` in place.
/// @param p Value used by `PS_CreatePunctuationTable` in `if punctuations==void then punctuations=defaultPunctuations() end if`.
function SetScriptPunctuations(script,p) return PS_CreatePunctuationTable(script,p) end function
/// Find the spelling of a punctuation code, retaining the released unknown-punctuation fallback text.
/// @param script Lexical script state; accesses `punctuations`.
/// @param num Value used by `PunctuationFromNum` in `for each value in script.punctuations if value.n==num then return value.p end if end for`.
function PunctuationFromNum(script,num) for each value in script.punctuations if value.n==num then return value.p end if end for;return "unkown punctuation" end function

/// Set `script.source.line` to `script.source.line+1` and `script.source.offset` to `script.source.offset+1` in `mq3.botlib.l_script.PS_ReadWhiteSpace`.
/// @param script Lexical script state; accesses `source`. May update `script.source.line` and `script.source.offset` in place.
function PS_ReadWhiteSpace(script)
  while true
    value=at(script,script.source.offset)
    while value<=32
      if value==0 then return false end if
      if value==10 then script.source.line=script.source.line+1 end if
      script.source.offset=script.source.offset+1;value=at(script,script.source.offset)
    end while
    if value==47 and at(script,script.source.offset+1)==47 then
      script.source.offset=script.source.offset+1
      while true script.source.offset=script.source.offset+1;value=at(script,script.source.offset);if value==0 then return false end if;if value==10 then break end if end while
      script.source.line=script.source.line+1;script.source.offset=script.source.offset+1;if at(script,script.source.offset)==0 then return false end if
    else if value==47 and at(script,script.source.offset+1)==42 then
      script.source.offset=script.source.offset+1
      while true script.source.offset=script.source.offset+1;value=at(script,script.source.offset);if value==0 then return false end if;if value==10 then script.source.line=script.source.line+1 end if;if value==42 and at(script,script.source.offset+1)==47 then break end if end while
      script.source.offset=script.source.offset+1;if at(script,script.source.offset)==0 then return false end if;script.source.offset=script.source.offset+1;if at(script,script.source.offset)==0 then return false end if
    else return true end if
  end while
end function

/// Convert an ASCII digit or letter to its numeric digit value, returning -1 for unsupported characters.
/// @param value Operand used to evaluate the returned expression `value-48`.
function hexDigit(value) if value>=48 and value<=57 then return value-48 end if;if value>=65 and value<=90 then return value-55 end if;if value>=97 and value<=122 then return value-87 end if;return -1 end function
/// Update `script.source.offset` and `ch[0]` during `PS_ReadEscapeCharacter`.
/// @param script Lexical script state; accesses `source`. May update `script.source.offset` in place.
/// @param ch Array or byte sequence accessed at `0`. Entries are written in place.
function PS_ReadEscapeCharacter(script,ch)
  script.source.offset=script.source.offset+1;value=at(script,script.source.offset);result=value
  if value==92 then result=92 else if value==110 then result=10 else if value==114 then result=13 else if value==116 then result=9 else if value==118 then result=11 else if value==98 then result=8 else if value==102 then result=12 else if value==97 then result=7 else if value==39 then result=39 else if value==34 then result=34 else if value==63 then result=63
  else if value==120 then
    script.source.offset=script.source.offset+1;result=0
    while true digit=hexDigit(at(script,script.source.offset));if digit<0 then break end if;result=(result<<4)+digit;script.source.offset=script.source.offset+1 end while
    script.source.offset=script.source.offset-1;if result>255 then ScriptWarning(script,"too large value in escape character");result=255 end if
  else
    if value<48 or value>57 then ScriptError(script,"unknown escape char");result=0
    else result=0;while at(script,script.source.offset)>=48 and at(script,script.source.offset)<=57 result=result*10+at(script,script.source.offset)-48;script.source.offset=script.source.offset+1 end while;script.source.offset=script.source.offset-1;if result>255 then ScriptWarning(script,"too large value in escape character");result=255 end if end if
  end if
  script.source.offset=script.source.offset+1;if ch!=void then ch[0]=result end if;return true
end function

/// Update `script.source.offset`, `script.source.line`, `token.string` and `token.type` and related state during `PS_ReadString`.
/// @param script Lexical script state; accesses `source` and `flags`. May update `script.source.offset` and `script.source.line` in place.
/// @param token Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place.
/// @param quote Value used by `PS_ReadString` in `if quote==34 then type=TT_STRING end if`.
function PS_ReadString(script,token,quote)
  type=TT_LITERAL;if quote==34 then type=TT_STRING end if;result=bytes(MAX_TOKEN,0);count=0;result[count]=at(script,script.source.offset);count=count+1;script.source.offset=script.source.offset+1
  while true
    if count>=MAX_TOKEN-2 then return ScriptError(script,"string longer than MAX_TOKEN = 1024") end if
    value=at(script,script.source.offset)
    if value==92 and (script.flags&SCFL_NOSTRINGESCAPECHARS)==0 then escapedOut=[0];PS_ReadEscapeCharacter(script,escapedOut);result[count]=escapedOut[0];count=count+1
    else if value==quote then
      script.source.offset=script.source.offset+1
      if (script.flags&SCFL_NOSTRINGWHITESPACES)!=0 then break end if
      saved=script.source.offset;savedLine=script.source.line
      if not PS_ReadWhiteSpace(script) or at(script,script.source.offset)!=quote then script.source.offset=saved;script.source.line=savedLine;break end if
      script.source.offset=script.source.offset+1
    else
      if value==0 then return ScriptError(script,"missing trailing quote") end if
      if value==10 then return ScriptError(script,"newline inside string "+decode(slice(result,0,count))) end if
      result[count]=value;count=count+1;script.source.offset=script.source.offset+1
    end if
  end while
  result[count]=quote;count=count+1;token.string=decode(slice(result,0,count));token.type=type;token.subtype=count;return true
end function
/// Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` during `PS_ReadLiteral`.
/// @param script Lexical script state; accesses `source`. May update `script.source.offset` in place.
/// @param token Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place.
function PS_ReadLiteral(script,token)
  quote=at(script,script.source.offset);script.source.offset=script.source.offset+1;if at(script,script.source.offset)==0 then return ScriptError(script,"end of file before trailing quote") end if
  value=at(script,script.source.offset);if value==92 then escapedOut=[0];PS_ReadEscapeCharacter(script,escapedOut);value=escapedOut[0] else script.source.offset=script.source.offset+1 end if
  if at(script,script.source.offset)!=39 then ScriptWarning(script,"too many characters in literal, ignored");while at(script,script.source.offset)!=0 and at(script,script.source.offset)!=39 and at(script,script.source.offset)!=10 script.source.offset=script.source.offset+1 end while;if at(script,script.source.offset)==39 then script.source.offset=script.source.offset+1 end if end if
  third=at(script,script.source.offset);script.source.offset=script.source.offset+1;token.string=charText(quote)+charText(value)+charText(third);token.type=TT_LITERAL;token.subtype=value;return true
end function
/// Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` during `PS_ReadName`.
/// @param script Lexical script state; accesses `source`. May update `script.source.offset` in place.
/// @param token Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place.
function PS_ReadName(script,token)
  start=script.source.offset;while pc.isName(at(script,script.source.offset)) script.source.offset=script.source.offset+1;if script.source.offset-start>=MAX_TOKEN then return ScriptError(script,"name longer than MAX_TOKEN = 1024") end if end while
  token.string=span(script,start,script.source.offset-start);token.type=TT_NAME;token.subtype=script.source.offset-start;return true
end function

/// Apply `mq3.botlib.l_script.hexDigit` while evaluating `integerValue`.
/// @param text Text to parse, format or deliver.
/// @param base Value used by `integerValue` in `if len(data)>start then for index=start to len(data)-1 result=result*base+hexDigit(data[index]) end for end if`.
/// @param start Value used by `integerValue` in `if len(data)>start then for index=start to len(data)-1 result=result*base+hexDigit(data[index]) end for end if`.
function integerValue(text,base,start)
  data=bytes(text);result=0;if len(data)>start then for index=start to len(data)-1 result=result*base+hexDigit(data[index]) end for end if;return result
end function
/// Set `intvalue[0]` to `iv` and `floatvalue[0]` to `fv` in `mq3.botlib.l_script.NumberValue`. Return paths include `[iv,fv]`.
/// @param string Text to parse, format or deliver.
/// @param subtype Value used by `NumberValue` in `if (subtype&TT_FLOAT)!=0 then fv=toNumber(string)`.
/// @param intvalue Array or byte sequence accessed at `0`. Entries are written in place.
/// @param floatvalue Array or byte sequence accessed at `0`. Entries are written in place.
function NumberValue(string,subtype,intvalue,floatvalue)
  iv=0;fv=0.0
  if (subtype&TT_FLOAT)!=0 then fv=toNumber(string);iv=n.trunc32(fv)
  else if (subtype&TT_DECIMAL)!=0 then iv=integerValue(string,10,0);fv=toFloat(iv)
  else if (subtype&TT_HEX)!=0 then iv=integerValue(string,16,2);fv=toFloat(iv)
  else if (subtype&TT_OCTAL)!=0 then iv=integerValue(string,8,1);fv=toFloat(iv)
  else if (subtype&TT_BINARY)!=0 then iv=integerValue(string,2,2);fv=toFloat(iv) end if
  if intvalue!=void then intvalue[0]=iv end if;if floatvalue!=void then floatvalue[0]=fv end if;return [iv,fv]
end function
/// Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` and related state during `PS_ReadNumber`.
/// @param script Lexical script state; accesses `source`. May update `script.source.offset` in place.
/// @param token Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue`. May update `token.string`, `token.type` and `token.subtype` and additional fields in place.
function PS_ReadNumber(script,token)
  start=script.source.offset;subtype=0
  if at(script,start)==48 and (at(script,start+1)==120 or at(script,start+1)==88) then
    script.source.offset=script.source.offset+2
    while true value=at(script,script.source.offset);if not (pc.isDigit(value) or value>=97 and value<=102 or value==65) then break end if;script.source.offset=script.source.offset+1;if script.source.offset-start>=MAX_TOKEN then return ScriptError(script,"hexadecimal number longer than MAX_TOKEN = 1024") end if end while;subtype=TT_HEX
  else if at(script,start)==48 and (at(script,start+1)==98 or at(script,start+1)==66) then
    script.source.offset=script.source.offset+2;while at(script,script.source.offset)==48 or at(script,script.source.offset)==49 script.source.offset=script.source.offset+1;if script.source.offset-start>=MAX_TOKEN then return ScriptError(script,"binary number longer than MAX_TOKEN = 1024") end if end while;subtype=TT_BINARY
  else
    octal=at(script,start)==48;dot=false
    while true value=at(script,script.source.offset);if value==46 then dot=true else if value==56 or value==57 then octal=false else if value<48 or value>57 then break end if;script.source.offset=script.source.offset+1;if script.source.offset-start>=MAX_TOKEN-1 then return ScriptError(script,"number longer than MAX_TOKEN = 1024") end if end while
    if octal then subtype=TT_OCTAL else subtype=TT_DECIMAL end if;if dot then subtype=subtype|TT_FLOAT end if
  end if
  text=span(script,start,script.source.offset-start)
  for ignored=0 to 1 value=at(script,script.source.offset);if (value==108 or value==76) and (subtype&TT_LONG)==0 then script.source.offset=script.source.offset+1;subtype=subtype|TT_LONG else if (value==117 or value==85) and (subtype&(TT_UNSIGNED|TT_FLOAT))==0 then script.source.offset=script.source.offset+1;subtype=subtype|TT_UNSIGNED end if end for
  iv=[0];fv=[0.0];NumberValue(text,subtype,iv,fv);if (subtype&TT_FLOAT)==0 then subtype=subtype|TT_INTEGER end if
  token.string=text;token.type=TT_NUMBER;token.subtype=subtype;token.intValue=iv[0];token.floatValue=fv[0];return true
end function
/// Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` during `PS_ReadPunctuation`.
/// @param script Lexical script state; accesses `punctuations` and `source`. May update `script.source.offset` in place.
/// @param token Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place.
function PS_ReadPunctuation(script,token)
  for each punctuation in script.punctuations
    candidate=bytes(punctuation.p);matches=script.source.offset+len(candidate)<=len(script.source.data)
    if matches then for index=0 to len(candidate)-1 if at(script,script.source.offset+index)!=candidate[index] then matches=false;break end if end for end if
    if matches then script.source.offset=script.source.offset+len(candidate);token.string=punctuation.p;token.type=TT_PUNCTUATION;token.subtype=punctuation.n;return true end if
  end for;return false
end function
/// Update `script.source.offset`, `token.string` and `script.token` during `PS_ReadPrimitive`.
/// @param script Lexical script state; accesses `source` and `token`. May update `script.source.offset` and `script.token` in place.
/// @param token Parsed token; accesses `string`. May update `token.string` in place.
function PS_ReadPrimitive(script,token)
  start=script.source.offset;while at(script,script.source.offset)>32 and at(script,script.source.offset)!=59 script.source.offset=script.source.offset+1;if script.source.offset-start>=MAX_TOKEN then return ScriptError(script,"primitive token longer than MAX_TOKEN = 1024") end if end while
  token.string=span(script,start,script.source.offset-start);script.token=copyToken(token);return true
end function

/// Update `script.tokenAvailable`, `token.string`, `token.type` and `token.subtype` and related state during `PS_ReadToken`. Return paths include `ok`.
/// @param script Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place.
/// @param token Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `token.string`, `token.type` and `token.subtype` and additional fields in place.
function PS_ReadToken(script,token)
  if script==void or script.freed then return false end if
  if script.tokenAvailable then script.tokenAvailable=false;value=copyToken(script.token);token.string=value.string;token.type=value.type;token.subtype=value.subtype;token.intValue=value.intValue;token.floatValue=value.floatValue;token.whitespaceStart=value.whitespaceStart;token.whitespaceEnd=value.whitespaceEnd;token.line=value.line;token.linescrossed=value.linescrossed;return true end if
  script.lastOffset=script.source.offset;script.lastLine=script.source.line;token.string="";token.type=0;token.subtype=0;token.intValue=0;token.floatValue=0.0;token.next=void
  script.whitespaceStart=script.source.offset;token.whitespaceStart=script.source.offset;if not PS_ReadWhiteSpace(script) then return false end if
  script.whitespaceEnd=script.source.offset;token.whitespaceEnd=script.source.offset;token.line=script.source.line;token.linescrossed=script.source.line-script.lastLine
  value=at(script,script.source.offset);ok=false
  if value==34 or value==39 then ok=PS_ReadString(script,token,value)
  else if pc.isDigit(value) or value==46 and pc.isDigit(at(script,script.source.offset+1)) then ok=PS_ReadNumber(script,token)
  else if (script.flags&SCFL_PRIMITIVE)!=0 then ok=PS_ReadPrimitive(script,token)
  else if pc.isNameStart(value) then ok=PS_ReadName(script,token)
  else ok=PS_ReadPunctuation(script,token);if not ok then ScriptError(script,"can't read token") end if end if
  if ok then script.token=copyToken(token) end if;return ok
end function

/// Apply `mq3.botlib.l_script.emptyToken`, `mq3.botlib.l_script.PS_ReadToken` and `mq3.botlib.l_script.ScriptError` while evaluating `PS_ExpectTokenString`.
/// @param script Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place.
/// @param string Operand used to evaluate the returned expression `ScriptError(script,"couldn't find expected "+string)`.
function PS_ExpectTokenString(script,string) token=emptyToken();if not PS_ReadToken(script,token) then return ScriptError(script,"couldn't find expected "+string) end if;if token.string!=string then return ScriptError(script,"expected "+string+", found "+token.string) end if;return true end function
/// Update `target.string`, `target.type`, `target.subtype` and `target.intValue` and related state during `copyInto`. Return paths include `target`.
/// @param target Target record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `target.string`, `target.type` and `target.subtype` and additional fields in place.
/// @param value Value record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields.
function copyInto(target,value) target.string=value.string;target.type=value.type;target.subtype=value.subtype;target.intValue=value.intValue;target.floatValue=value.floatValue;target.whitespaceStart=value.whitespaceStart;target.whitespaceEnd=value.whitespaceEnd;target.line=value.line;target.linescrossed=value.linescrossed;return target end function
/// Apply `mq3.botlib.l_script.PS_ReadToken` and `mq3.botlib.l_script.ScriptError` while evaluating `PS_ExpectTokenType`.
/// @param script Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place.
/// @param type Value used by `PS_ExpectTokenType` in `if token.type!=type then return ScriptError(script,"unexpected token type for "+token.string) end if`.
/// @param subtype Value used by `PS_ExpectTokenType` in `if type==TT_NUMBER and (token.subtype&subtype)!=subtype then return ScriptError(script,"unexpected number subtyp...`.
/// @param token Parsed token; accesses `type`, `string` and `subtype`.
function PS_ExpectTokenType(script,type,subtype,token)
  if not PS_ReadToken(script,token) then return ScriptError(script,"couldn't read expected token") end if
  if token.type!=type then return ScriptError(script,"unexpected token type for "+token.string) end if
  if type==TT_NUMBER and (token.subtype&subtype)!=subtype then return ScriptError(script,"unexpected number subtype for "+token.string) end if
  if type==TT_PUNCTUATION and token.subtype!=subtype then return ScriptError(script,"unexpected punctuation subtype for "+token.string) end if;return true
end function
/// Apply `mq3.botlib.l_script.PS_ReadToken` and `mq3.botlib.l_script.ScriptError` while evaluating `PS_ExpectAnyToken`.
/// @param script Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place.
/// @param token Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `token.string`, `token.type` and `token.subtype` and additional fields in place.
function PS_ExpectAnyToken(script,token) if not PS_ReadToken(script,token) then return ScriptError(script,"couldn't read expected token") end if;return true end function
/// Set `script.source.offset` to `script.lastOffset` in `mq3.botlib.l_script.PS_CheckTokenString`.
/// @param script Lexical script state; accesses `source` and `lastOffset`. May update `script.source.offset` in place.
/// @param string Value used by `PS_CheckTokenString` in `if token.string==string then return true end if`.
function PS_CheckTokenString(script,string) token=emptyToken();if not PS_ReadToken(script,token) then return false end if;if token.string==string then return true end if;script.source.offset=script.lastOffset;return false end function
/// Set `script.source.offset` to `script.lastOffset` in `mq3.botlib.l_script.PS_CheckTokenType`.
/// @param script Lexical script state; accesses `source` and `lastOffset`. May update `script.source.offset` in place.
/// @param type Value used by `PS_CheckTokenType` in `if value.type==type and (value.subtype&subtype)==subtype then copyInto(token,value)`.
/// @param subtype Value used by `PS_CheckTokenType` in `if value.type==type and (value.subtype&subtype)==subtype then copyInto(token,value)`.
/// @param token Target record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `token.string`, `token.type` and `token.subtype` and additional fields in place.
function PS_CheckTokenType(script,type,subtype,token) value=emptyToken();if not PS_ReadToken(script,value) then return false end if;if value.type==type and (value.subtype&subtype)==subtype then copyInto(token,value);return true end if;script.source.offset=script.lastOffset;return false end function
/// Apply `mq3.botlib.l_script.emptyToken` and `mq3.botlib.l_script.PS_ReadToken` while evaluating `PS_SkipUntilString`.
/// @param script Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place.
/// @param string Value used by `PS_SkipUntilString` in `while PS_ReadToken(script,token) if token.string==string then return true end if end while`.
function PS_SkipUntilString(script,string) token=emptyToken();while PS_ReadToken(script,token) if token.string==string then return true end if end while;return false end function
/// Set `script.tokenAvailable` to `true` in `mq3.botlib.l_script.PS_UnreadLastToken`.
/// @param script Lexical script state; accesses `tokenAvailable`. May update `script.tokenAvailable` in place.
function PS_UnreadLastToken(script) script.tokenAvailable=true;return void end function
/// Set `script.token` to `copyToken(token)` and `script.tokenAvailable` to `true` in `mq3.botlib.l_script.PS_UnreadToken`.
/// @param script Lexical script state; accesses `token` and `tokenAvailable`. May update `script.token` and `script.tokenAvailable` in place.
/// @param token Value record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields.
function PS_UnreadToken(script,token) script.token=copyToken(token);script.tokenAvailable=true;return void end function
/// Set `script.whitespaceStart` to `script.whitespaceStart+1` in `mq3.botlib.l_script.PS_NextWhiteSpaceChar`.
/// @param script Lexical script state; accesses `whitespaceStart` and `whitespaceEnd`. May update `script.whitespaceStart` in place.
function PS_NextWhiteSpaceChar(script) if script.whitespaceStart<script.whitespaceEnd then value=at(script,script.whitespaceStart);script.whitespaceStart=script.whitespaceStart+1;return value end if;return 0 end function
/// Remove an optional leading and trailing double quote from lexical string text.
/// @param string Value passed as argument 1 to `bytes`.
function StripDoubleQuotes(string) data=bytes(string);start=0;count=len(data);if count>0 and data[0]==34 then start=1;count=count-1 end if;if count>0 and data[start+count-1]==34 then count=count-1 end if;return decode(slice(data,start,count)) end function
/// Remove an optional leading and trailing single quote from lexical literal text.
/// @param string Value passed as argument 1 to `bytes`.
function StripSingleQuotes(string) data=bytes(string);start=0;count=len(data);if count>0 and data[0]==39 then start=1;count=count-1 end if;if count>0 and data[start+count-1]==39 then count=count-1 end if;return decode(slice(data,start,count)) end function
/// Apply `mq3.botlib.l_script.emptyToken`, `mq3.botlib.l_script.PS_ExpectAnyToken` and `mq3.botlib.l_script.PS_ExpectTokenType` while evaluating `ReadSignedFloat`. Return paths include `sign*token.floatValue`.
/// @param script Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place.
function ReadSignedFloat(script) token=emptyToken();if not PS_ExpectAnyToken(script,token) then return 0.0 end if;sign=1.0;if token.string=="-" then sign=-1.0;if not PS_ExpectTokenType(script,TT_NUMBER,0,token) then return 0.0 end if else if token.type!=TT_NUMBER then ScriptError(script,"expected float value, found "+token.string) end if;return sign*token.floatValue end function
/// Apply `mq3.botlib.l_script.emptyToken`, `mq3.botlib.l_script.PS_ExpectAnyToken` and `mq3.botlib.l_script.PS_ExpectTokenType` while evaluating `ReadSignedInt`. Return paths include `sign*token.intValue`.
/// @param script Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place.
function ReadSignedInt(script) token=emptyToken();if not PS_ExpectAnyToken(script,token) then return 0 end if;sign=1;if token.string=="-" then sign=-1;if not PS_ExpectTokenType(script,TT_NUMBER,TT_INTEGER,token) then return 0 end if else if token.type!=TT_NUMBER or token.subtype==TT_FLOAT then ScriptError(script,"expected integer value, found "+token.string) end if;return sign*token.intValue end function
/// Set `script.flags` to `flags` in `mq3.botlib.l_script.SetScriptFlags`.
/// @param script Lexical script state; accesses `flags`. May update `script.flags` in place.
/// @param flags Value used by `SetScriptFlags` in `script.flags=flags`.
function SetScriptFlags(script,flags) script.flags=flags;return void end function
/// Return `script.flags` for `GetScriptFlags`.
/// @param script Lexical script state; accesses `flags`.
function GetScriptFlags(script) return script.flags end function
/// Update `script.source.offset`, `script.source.line`, `script.source.pending` and `script.lastOffset` and related state during `ResetScript`.
/// @param script Lexical script state; accesses `source`, `lastOffset`, `lastLine`, `whitespaceStart` and `whitespaceEnd` and related fields. May update `script.source.offset`, `script.source.line` and `script.source.pending` and additional fields in place.
function ResetScript(script) script.source.offset=0;script.source.line=1;script.source.pending=0;script.lastOffset=0;script.lastLine=1;script.whitespaceStart=0;script.whitespaceEnd=0;script.tokenAvailable=false;script.token=emptyToken();return void end function
/// Test `script.source.offset>=len(script.source.data)` as the condition for `EndOfScript`.
/// @param script Lexical script state; accesses `source`.
function EndOfScript(script) return script.source.offset>=len(script.source.data) end function
/// Return `script.source.line-script.lastLine` for `NumLinesCrossed`.
/// @param script Lexical script state; accesses `source` and `lastLine`.
function NumLinesCrossed(script) return script.source.line-script.lastLine end function
/// Set `script.source.offset` to `script.source.offset+1` in `mq3.botlib.l_script.ScriptSkipTo`.
/// @param script Lexical script state; accesses `source`. May update `script.source.offset` in place.
/// @param value Value passed as argument 1 to `bytes`.
function ScriptSkipTo(script,value)
  pattern=bytes(value);if len(pattern)==0 then return true end if
  while true if not PS_ReadWhiteSpace(script) then return false end if;if at(script,script.source.offset)==pattern[0] then matches=true;for index=0 to len(pattern)-1 if at(script,script.source.offset+index)!=pattern[index] then matches=false;break end if end for;if matches then return true end if end if;script.source.offset=script.source.offset+1 end while
end function
/// Return the byte length of text or the length of a supplied data buffer, using zero for void.
/// @param fp Sequence whose length bounds the iteration or lookup in `FileLength`.
function FileLength(fp) if fp==void then return 0 end if;if typeof(fp)=="string" then return len(bytes(fp)) end if;return len(fp) end function

/// Apply `mq3.botlib.l_script.emptyToken` and `mq3.botlib.l_script.SetScriptPunctuations` while evaluating `scriptFromSource`.
/// @param runtime Initial value stored in `mq3.botlib.l_script.Script.runtime`.
/// @param source Parser source state; accesses `offset` and `line`.
function scriptFromSource(runtime,source)
  value=Script(runtime,source,source.offset,source.line,source.offset,source.offset,false,0,[],emptyToken(),false);SetScriptPunctuations(value,void);return value
end function
/// Apply `mq3.botlib.l_script.scriptFromSource` while evaluating `LoadScriptMemory`. Return paths include `scriptFromSource(runtime,pc.Source(name,data,0,1,0))`.
/// @param runtime Initial value stored in `mq3.botlib.l_script.Script.runtime`.
/// @param ptr Value used by `LoadScriptMemory` in `data=ptr`.
/// @param length Value passed as argument 3 to `slice`.
/// @param name Name used to identify the requested entry.
function LoadScriptMemory(runtime,ptr,length,name)
  data=ptr;if typeof(data)=="string" then data=bytes(data) end if;if length<0 then length=0 end if;if length<len(data) then data=slice(data,0,length) end if;return scriptFromSource(runtime,pc.Source(name,data,0,1,0))
end function
/// Remove lexical comments and collapse whitespace while retaining quoted source text.
/// @param data Array or byte sequence accessed at `readAt` and `readAt+1`.
function compressFile(data)
  result=bytes(len(data),0);readAt=0;writeAt=0;newline=false;whitespace=false
  while readAt<len(data)
    value=data[readAt]
    if value==47 and readAt+1<len(data) and data[readAt+1]==47 then while readAt<len(data) and data[readAt]!=10 readAt=readAt+1 end while
    else if value==47 and readAt+1<len(data) and data[readAt+1]==42 then readAt=readAt+2;while readAt<len(data) and not (data[readAt]==42 and readAt+1<len(data) and data[readAt+1]==47) readAt=readAt+1 end while;if readAt<len(data) then readAt=readAt+2 end if
    else if value==10 or value==13 then newline=true;readAt=readAt+1
    else if value==32 or value==9 then whitespace=true;readAt=readAt+1
    else
      if newline then result[writeAt]=10;writeAt=writeAt+1;newline=false;whitespace=false end if;if whitespace then result[writeAt]=32;writeAt=writeAt+1;whitespace=false end if
      if value==34 then result[writeAt]=value;writeAt=writeAt+1;readAt=readAt+1;while readAt<len(data) and data[readAt]!=34 result[writeAt]=data[readAt];writeAt=writeAt+1;readAt=readAt+1 end while;if readAt<len(data) then result[writeAt]=34;writeAt=writeAt+1;readAt=readAt+1 end if
      else result[writeAt]=value;writeAt=writeAt+1;readAt=readAt+1 end if
    end if
  end while
  return slice(result,0,writeAt)
end function
/// Use `runtime.host.loadFn` to perform `LoadScriptFile`. Return paths include `LoadScriptMemory(runtime,data,len(data),filename)`.
/// @param runtime L script runtime; accesses `host` and `baseFolder`.
/// @param filename Filename supplied to the configured loader or file service.
function LoadScriptFile(runtime,filename)
  if runtime==void or runtime.host==void or runtime.host.loadFn==void then return void end if;path=filename;if runtime.baseFolder!="" then path=runtime.baseFolder+"/"+filename end if;data=runtime.host.loadFn(runtime.host.context,path);if data==void or data is error then return void end if;if typeof(data)=="string" then data=bytes(data) end if;data=compressFile(data);return LoadScriptMemory(runtime,data,len(data),filename)
end function
/// Update `script.freed`, `script.source.data` and `script.source.pending` during `FreeScript`.
/// @param script Lexical script state; accesses `freed` and `source`. May update `script.freed`, `script.source.data` and `script.source.pending` in place.
function FreeScript(script) if script==void or script.freed then return false end if;script.freed=true;script.source.data=[];script.source.pending=0;return true end function
/// Set `runtime.baseFolder` to `path` in `mq3.botlib.l_script.PS_SetBaseFolder`. Return paths include `path`.
/// @param runtime L script runtime; accesses `baseFolder`. May update `runtime.baseFolder` in place.
/// @param path Resource path supplied to the file or parser operation.
function PS_SetBaseFolder(runtime,path) runtime.baseFolder=path;return path end function

// Explicit adapters used when a productive pc_parser source must be consumed
// through the original botlib API. The cursor and line remain shared.
/// @param runtime Initial value stored in `mq3.botlib.l_script.Script.runtime`.
/// @param source Parser source state; accesses `offset` and `line`.
function WrapPCSource(runtime,source) return scriptFromSource(runtime,source) end function
/// Build the `mq3.vm.pc_parser.Token` result for `ToPCToken`.
/// @param token Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields.
function ToPCToken(token) text=token.string;if token.type==TT_STRING or token.type==TT_LITERAL then text=StripDoubleQuotes(text);if token.type==TT_LITERAL then text=StripSingleQuotes(token.string) end if end if;return pc.Token(token.type,token.subtype,token.intValue,token.floatValue,text,token.line,token.whitespaceEnd>token.whitespaceStart) end function
/// Build the `mq3.botlib.l_script.Token` result for `FromPCToken`. Return paths include `Token(text,token.type,token.subtype,token.intValue,token.floatValue,0,0,token.line,0,void)`.
/// @param token Parsed token; accesses `text`, `type`, `subtype`, `intValue` and `floatValue` and related fields.
function FromPCToken(token) if token==void then return void end if;text=token.text;if token.type==TT_STRING then text="\""+text+"\"" else if token.type==TT_LITERAL then text="'"+text+"'" end if;return Token(text,token.type,token.subtype,token.intValue,token.floatValue,0,0,token.line,0,void) end function
