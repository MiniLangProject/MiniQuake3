// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete MiniLang port of code/botlib/l_script.c. Script owns a pc.Source
// directly so the lexer and l_precomp/pc_parser adapters share one cursor.
package mq3.botlib.l_script

import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n

const MAX_TOKEN=1024
const SCFL_NOERRORS=0x0001
const SCFL_NOWARNINGS=0x0002
const SCFL_NOSTRINGWHITESPACES=0x0004
const SCFL_NOSTRINGESCAPECHARS=0x0008
const SCFL_PRIMITIVE=0x0010
const SCFL_NOBINARYNUMBERS=0x0020
const SCFL_NONUMBERVALUES=0x0040

const TT_STRING=1
const TT_LITERAL=2
const TT_NUMBER=3
const TT_NAME=4
const TT_PUNCTUATION=5
const TT_DECIMAL=0x0008
const TT_HEX=0x0100
const TT_OCTAL=0x0200
const TT_BINARY=0x0400
const TT_FLOAT=0x0800
const TT_INTEGER=0x1000
const TT_LONG=0x2000
const TT_UNSIGNED=0x4000

const P_RSHIFT_ASSIGN=1
const P_LSHIFT_ASSIGN=2
const P_PARMS=3
const P_PRECOMPMERGE=4
const P_LOGIC_AND=5
const P_LOGIC_OR=6
const P_LOGIC_GEQ=7
const P_LOGIC_LEQ=8
const P_LOGIC_EQ=9
const P_LOGIC_UNEQ=10
const P_MUL_ASSIGN=11
const P_DIV_ASSIGN=12
const P_MOD_ASSIGN=13
const P_ADD_ASSIGN=14
const P_SUB_ASSIGN=15
const P_INC=16
const P_DEC=17
const P_BIN_AND_ASSIGN=18
const P_BIN_OR_ASSIGN=19
const P_BIN_XOR_ASSIGN=20
const P_RSHIFT=21
const P_LSHIFT=22
const P_POINTERREF=23
const P_CPP1=24
const P_CPP2=25
const P_MUL=26
const P_DIV=27
const P_MOD=28
const P_ADD=29
const P_SUB=30
const P_ASSIGN=31
const P_BIN_AND=32
const P_BIN_OR=33
const P_BIN_XOR=34
const P_BIN_NOT=35
const P_LOGIC_NOT=36
const P_LOGIC_GREATER=37
const P_LOGIC_LESS=38
const P_REF=39
const P_COMMA=40
const P_SEMICOLON=41
const P_COLON=42
const P_QUESTIONMARK=43
const P_PARENTHESESOPEN=44
const P_PARENTHESESCLOSE=45
const P_BRACEOPEN=46
const P_BRACECLOSE=47
const P_SQBRACKETOPEN=48
const P_SQBRACKETCLOSE=49
const P_BACKSLASH=50
const P_PRECOMP=51
const P_DOLLAR=52

struct Punctuation p n end struct
struct Token string type subtype intValue floatValue whitespaceStart whitespaceEnd line linescrossed next end struct
struct ScriptHost loadFn actionFn context end struct
struct Runtime host baseFolder end struct
struct Script runtime source lastOffset lastLine whitespaceStart whitespaceEnd tokenAvailable flags punctuations token freed end struct

function host() return ScriptHost(void,void,void) end function
function create(hostValue) if hostValue==void then hostValue=host() end if;return Runtime(hostValue,"") end function
function defaultPunctuations()
  return [Punctuation(">>=",1),Punctuation("<<=",2),Punctuation("...",3),Punctuation("##",4),Punctuation("&&",5),Punctuation("||",6),Punctuation(">=",7),Punctuation("<=",8),Punctuation("==",9),Punctuation("!=",10),Punctuation("*=",11),Punctuation("/=",12),Punctuation("%=",13),Punctuation("+=",14),Punctuation("-=",15),Punctuation("++",16),Punctuation("--",17),Punctuation("&=",18),Punctuation("|=",19),Punctuation("^=",20),Punctuation(">>",21),Punctuation("<<",22),Punctuation("->",23),Punctuation("::",24),Punctuation(".*",25),Punctuation("*",26),Punctuation("/",27),Punctuation("%",28),Punctuation("+",29),Punctuation("-",30),Punctuation("=",31),Punctuation("&",32),Punctuation("|",33),Punctuation("^",34),Punctuation("~",35),Punctuation("!",36),Punctuation(">",37),Punctuation("<",38),Punctuation(".",39),Punctuation(",",40),Punctuation(";",41),Punctuation(":",42),Punctuation("?",43),Punctuation("(",44),Punctuation(")",45),Punctuation("{",46),Punctuation("}",47),Punctuation("[",48),Punctuation("]",49),Punctuation("\\",50),Punctuation("#",51),Punctuation("$",52)]
end function
function emptyToken() return Token("",0,0,0,0.0,0,0,0,0,void) end function
function copyToken(value) if value==void then return void end if;return Token(value.string,value.type,value.subtype,value.intValue,value.floatValue,value.whitespaceStart,value.whitespaceEnd,value.line,value.linescrossed,value.next) end function
function at(script,index) return pc.at(script.source,index) end function
function charText(value) return decode(bytes([value])) end function
function span(script,start,count) if count<=0 then return "" end if;return decode(slice(script.source.data,start,count)) end function
function emit(script,kind,message)
  if script==void then return false end if
  if kind=="error" and (script.flags&SCFL_NOERRORS)!=0 then return false end if
  if kind=="warning" and (script.flags&SCFL_NOWARNINGS)!=0 then return false end if
  if script.runtime!=void and script.runtime.host!=void and script.runtime.host.actionFn!=void then script.runtime.host.actionFn(script.runtime.host.context,kind,script.source.name,script.source.line,message) end if
  return false
end function
function ScriptError(script,str) return emit(script,"error",str) end function
function ScriptWarning(script,str) return emit(script,"warning",str) end function

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
function SetScriptPunctuations(script,p) return PS_CreatePunctuationTable(script,p) end function
function PunctuationFromNum(script,num) for each value in script.punctuations if value.n==num then return value.p end if end for;return "unkown punctuation" end function

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

function hexDigit(value) if value>=48 and value<=57 then return value-48 end if;if value>=65 and value<=90 then return value-55 end if;if value>=97 and value<=122 then return value-87 end if;return -1 end function
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
function PS_ReadLiteral(script,token)
  quote=at(script,script.source.offset);script.source.offset=script.source.offset+1;if at(script,script.source.offset)==0 then return ScriptError(script,"end of file before trailing quote") end if
  value=at(script,script.source.offset);if value==92 then escapedOut=[0];PS_ReadEscapeCharacter(script,escapedOut);value=escapedOut[0] else script.source.offset=script.source.offset+1 end if
  if at(script,script.source.offset)!=39 then ScriptWarning(script,"too many characters in literal, ignored");while at(script,script.source.offset)!=0 and at(script,script.source.offset)!=39 and at(script,script.source.offset)!=10 script.source.offset=script.source.offset+1 end while;if at(script,script.source.offset)==39 then script.source.offset=script.source.offset+1 end if end if
  third=at(script,script.source.offset);script.source.offset=script.source.offset+1;token.string=charText(quote)+charText(value)+charText(third);token.type=TT_LITERAL;token.subtype=value;return true
end function
function PS_ReadName(script,token)
  start=script.source.offset;while pc.isName(at(script,script.source.offset)) script.source.offset=script.source.offset+1;if script.source.offset-start>=MAX_TOKEN then return ScriptError(script,"name longer than MAX_TOKEN = 1024") end if end while
  token.string=span(script,start,script.source.offset-start);token.type=TT_NAME;token.subtype=script.source.offset-start;return true
end function

function integerValue(text,base,start)
  data=bytes(text);result=0;if len(data)>start then for index=start to len(data)-1 result=result*base+hexDigit(data[index]) end for end if;return result
end function
function NumberValue(string,subtype,intvalue,floatvalue)
  iv=0;fv=0.0
  if (subtype&TT_FLOAT)!=0 then fv=toNumber(string);iv=n.trunc32(fv)
  else if (subtype&TT_DECIMAL)!=0 then iv=integerValue(string,10,0);fv=toFloat(iv)
  else if (subtype&TT_HEX)!=0 then iv=integerValue(string,16,2);fv=toFloat(iv)
  else if (subtype&TT_OCTAL)!=0 then iv=integerValue(string,8,1);fv=toFloat(iv)
  else if (subtype&TT_BINARY)!=0 then iv=integerValue(string,2,2);fv=toFloat(iv) end if
  if intvalue!=void then intvalue[0]=iv end if;if floatvalue!=void then floatvalue[0]=fv end if;return [iv,fv]
end function
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
function PS_ReadPunctuation(script,token)
  for each punctuation in script.punctuations
    candidate=bytes(punctuation.p);matches=script.source.offset+len(candidate)<=len(script.source.data)
    if matches then for index=0 to len(candidate)-1 if at(script,script.source.offset+index)!=candidate[index] then matches=false;break end if end for end if
    if matches then script.source.offset=script.source.offset+len(candidate);token.string=punctuation.p;token.type=TT_PUNCTUATION;token.subtype=punctuation.n;return true end if
  end for;return false
end function
function PS_ReadPrimitive(script,token)
  start=script.source.offset;while at(script,script.source.offset)>32 and at(script,script.source.offset)!=59 script.source.offset=script.source.offset+1;if script.source.offset-start>=MAX_TOKEN then return ScriptError(script,"primitive token longer than MAX_TOKEN = 1024") end if end while
  token.string=span(script,start,script.source.offset-start);script.token=copyToken(token);return true
end function

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

function PS_ExpectTokenString(script,string) token=emptyToken();if not PS_ReadToken(script,token) then return ScriptError(script,"couldn't find expected "+string) end if;if token.string!=string then return ScriptError(script,"expected "+string+", found "+token.string) end if;return true end function
function copyInto(target,value) target.string=value.string;target.type=value.type;target.subtype=value.subtype;target.intValue=value.intValue;target.floatValue=value.floatValue;target.whitespaceStart=value.whitespaceStart;target.whitespaceEnd=value.whitespaceEnd;target.line=value.line;target.linescrossed=value.linescrossed;return target end function
function PS_ExpectTokenType(script,type,subtype,token)
  if not PS_ReadToken(script,token) then return ScriptError(script,"couldn't read expected token") end if
  if token.type!=type then return ScriptError(script,"unexpected token type for "+token.string) end if
  if type==TT_NUMBER and (token.subtype&subtype)!=subtype then return ScriptError(script,"unexpected number subtype for "+token.string) end if
  if type==TT_PUNCTUATION and token.subtype!=subtype then return ScriptError(script,"unexpected punctuation subtype for "+token.string) end if;return true
end function
function PS_ExpectAnyToken(script,token) if not PS_ReadToken(script,token) then return ScriptError(script,"couldn't read expected token") end if;return true end function
function PS_CheckTokenString(script,string) token=emptyToken();if not PS_ReadToken(script,token) then return false end if;if token.string==string then return true end if;script.source.offset=script.lastOffset;return false end function
function PS_CheckTokenType(script,type,subtype,token) value=emptyToken();if not PS_ReadToken(script,value) then return false end if;if value.type==type and (value.subtype&subtype)==subtype then copyInto(token,value);return true end if;script.source.offset=script.lastOffset;return false end function
function PS_SkipUntilString(script,string) token=emptyToken();while PS_ReadToken(script,token) if token.string==string then return true end if end while;return false end function
function PS_UnreadLastToken(script) script.tokenAvailable=true;return void end function
function PS_UnreadToken(script,token) script.token=copyToken(token);script.tokenAvailable=true;return void end function
function PS_NextWhiteSpaceChar(script) if script.whitespaceStart<script.whitespaceEnd then value=at(script,script.whitespaceStart);script.whitespaceStart=script.whitespaceStart+1;return value end if;return 0 end function
function StripDoubleQuotes(string) data=bytes(string);start=0;count=len(data);if count>0 and data[0]==34 then start=1;count=count-1 end if;if count>0 and data[start+count-1]==34 then count=count-1 end if;return decode(slice(data,start,count)) end function
function StripSingleQuotes(string) data=bytes(string);start=0;count=len(data);if count>0 and data[0]==39 then start=1;count=count-1 end if;if count>0 and data[start+count-1]==39 then count=count-1 end if;return decode(slice(data,start,count)) end function
function ReadSignedFloat(script) token=emptyToken();if not PS_ExpectAnyToken(script,token) then return 0.0 end if;sign=1.0;if token.string=="-" then sign=-1.0;if not PS_ExpectTokenType(script,TT_NUMBER,0,token) then return 0.0 end if else if token.type!=TT_NUMBER then ScriptError(script,"expected float value, found "+token.string) end if;return sign*token.floatValue end function
function ReadSignedInt(script) token=emptyToken();if not PS_ExpectAnyToken(script,token) then return 0 end if;sign=1;if token.string=="-" then sign=-1;if not PS_ExpectTokenType(script,TT_NUMBER,TT_INTEGER,token) then return 0 end if else if token.type!=TT_NUMBER or token.subtype==TT_FLOAT then ScriptError(script,"expected integer value, found "+token.string) end if;return sign*token.intValue end function
function SetScriptFlags(script,flags) script.flags=flags;return void end function
function GetScriptFlags(script) return script.flags end function
function ResetScript(script) script.source.offset=0;script.source.line=1;script.source.pending=0;script.lastOffset=0;script.lastLine=1;script.whitespaceStart=0;script.whitespaceEnd=0;script.tokenAvailable=false;script.token=emptyToken();return void end function
function EndOfScript(script) return script.source.offset>=len(script.source.data) end function
function NumLinesCrossed(script) return script.source.line-script.lastLine end function
function ScriptSkipTo(script,value)
  pattern=bytes(value);if len(pattern)==0 then return true end if
  while true if not PS_ReadWhiteSpace(script) then return false end if;if at(script,script.source.offset)==pattern[0] then matches=true;for index=0 to len(pattern)-1 if at(script,script.source.offset+index)!=pattern[index] then matches=false;break end if end for;if matches then return true end if end if;script.source.offset=script.source.offset+1 end while
end function
function FileLength(fp) if fp==void then return 0 end if;if typeof(fp)=="string" then return len(bytes(fp)) end if;return len(fp) end function

function scriptFromSource(runtime,source)
  value=Script(runtime,source,source.offset,source.line,source.offset,source.offset,false,0,[],emptyToken(),false);SetScriptPunctuations(value,void);return value
end function
function LoadScriptMemory(runtime,ptr,length,name)
  data=ptr;if typeof(data)=="string" then data=bytes(data) end if;if length<0 then length=0 end if;if length<len(data) then data=slice(data,0,length) end if;return scriptFromSource(runtime,pc.Source(name,data,0,1,0))
end function
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
function LoadScriptFile(runtime,filename)
  if runtime==void or runtime.host==void or runtime.host.loadFn==void then return void end if;path=filename;if runtime.baseFolder!="" then path=runtime.baseFolder+"/"+filename end if;data=runtime.host.loadFn(runtime.host.context,path);if data==void or data is error then return void end if;if typeof(data)=="string" then data=bytes(data) end if;data=compressFile(data);return LoadScriptMemory(runtime,data,len(data),filename)
end function
function FreeScript(script) if script==void or script.freed then return false end if;script.freed=true;script.source.data=[];script.source.pending=0;return true end function
function PS_SetBaseFolder(runtime,path) runtime.baseFolder=path;return path end function

// Explicit adapters used when a productive pc_parser source must be consumed
// through the original botlib API. The cursor and line remain shared.
function WrapPCSource(runtime,source) return scriptFromSource(runtime,source) end function
function ToPCToken(token) text=token.string;if token.type==TT_STRING or token.type==TT_LITERAL then text=StripDoubleQuotes(text);if token.type==TT_LITERAL then text=StripSingleQuotes(token.string) end if end if;return pc.Token(token.type,token.subtype,token.intValue,token.floatValue,text,token.line,token.whitespaceEnd>token.whitespaceStart) end function
function FromPCToken(token) if token==void then return void end if;text=token.text;if token.type==TT_STRING then text="\""+text+"\"" else if token.type==TT_LITERAL then text="'"+text+"'" end if;return Token(text,token.type,token.subtype,token.intValue,token.floatValue,0,0,token.line,0,void) end function
