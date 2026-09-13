// SPDX-License-Identifier: GPL-2.0-or-later
// QVM-facing subset of the botlib precompiler handle API used by UI menus/HUDs.
package mq3.vm.pc_parser

import mq3.compat.numeric as n

const MAX_SOURCEFILES=64
const MAX_TOKENLENGTH=1024
const TOKEN_SIZE=1040
const TT_STRING=1
const TT_LITERAL=2
const TT_NUMBER=3
const TT_NAME=4
const TT_PUNCTUATION=5
const TT_DECIMAL=0x0008
const TT_HEX=0x0100
const TT_OCTAL=0x0200
const TT_FLOAT=0x0800
const TT_INTEGER=0x1000
const P_PRECOMP=51

struct Token type subtype intValue floatValue text line end struct
struct Source name data offset line end struct
struct Define name tokens end struct
struct Registry context loadFn sources defines end struct

function fail(message) return error(7691,"PC parser: "+message) end function
function create(context,loadFn) return Registry(context,loadFn,array(MAX_SOURCEFILES,0),[]) end function
function at(source,index) if index<0 or index>=len(source.data) then return 0 end if;return source.data[index] end function
function isNameStart(value) return value==95 or value>=65 and value<=90 or value>=97 and value<=122 end function
function isName(value) return isNameStart(value) or value>=48 and value<=57 end function
function isDigit(value) return value>=48 and value<=57 end function
function punctuationStrings() return [">>=","<<=","...","##","&&","||",">=","<=","==","!=","*=","/=","%=","+=","-=","++","--","&=","|=","^=",">>","<<","->","::",".*","*","/","%","+","-","=","&","|","^","~","!",">","<",".",",",";",":","?","(",")","{","}","[","]","\\","#","$"] end function
function punctuationNumber(index) return index+1 end function
function skip(source)
  while true
    value=at(source,source.offset)
    while value>0 and value<=32 if value==10 then source.line=source.line+1 end if;source.offset=source.offset+1;value=at(source,source.offset) end while
    if value==47 and at(source,source.offset+1)==47 then while at(source,source.offset)!=0 and at(source,source.offset)!=10 source.offset=source.offset+1 end while
    else if value==47 and at(source,source.offset+1)==42 then
      source.offset=source.offset+2;while at(source,source.offset)!=0 and not (at(source,source.offset)==42 and at(source,source.offset+1)==47) if at(source,source.offset)==10 then source.line=source.line+1 end if;source.offset=source.offset+1 end while;if at(source,source.offset)!=0 then source.offset=source.offset+2 end if
    else return value end if
  end while
end function
function escaped(value) if value==110 then return 10 else if value==114 then return 13 else if value==116 then return 9 end if;return value end function
function readString(source,quote)
  started=source.line;source.offset=source.offset+1;result=bytes(MAX_TOKENLENGTH,0);count=0
  while at(source,source.offset)!=0 and at(source,source.offset)!=quote and at(source,source.offset)!=10
    value=at(source,source.offset);source.offset=source.offset+1
    if value==92 and at(source,source.offset)!=0 then value=escaped(at(source,source.offset));source.offset=source.offset+1 end if
    if count>=MAX_TOKENLENGTH-1 then return fail("string token too long") end if;result[count]=value;count=count+1
  end while
  if at(source,source.offset)!=quote then return fail("unterminated string") end if;source.offset=source.offset+1
  type=TT_STRING;if quote==39 then type=TT_LITERAL end if;subtype=count+2;if type==TT_LITERAL and count>0 then subtype=result[0] end if
  return Token(type,subtype,0,0.0,decode(slice(result,0,count)),started)
end function
function digitValue(value) if value>=48 and value<=57 then return value-48 else if value>=65 and value<=70 then return value-55 else return value-87 end if end function
function integerValue(text,base,start)
  data=bytes(text);value=0;for index=start to len(data)-1 value=value*base+digitValue(data[index]) end for;return value
end function
function readNumber(source)
  started=source.line;begin=source.offset;subtype=0;base=10;dot=false
  if at(source,begin)==48 and (at(source,begin+1)==120 or at(source,begin+1)==88) then
    source.offset=source.offset+2;base=16;subtype=TT_HEX
    while isDigit(at(source,source.offset)) or at(source,source.offset)>=65 and at(source,source.offset)<=70 or at(source,source.offset)>=97 and at(source,source.offset)<=102 source.offset=source.offset+1 end while
  else
    if at(source,begin)==48 then base=8 end if
    while isDigit(at(source,source.offset)) or at(source,source.offset)==46 if at(source,source.offset)==46 then dot=true end if;if at(source,source.offset)==56 or at(source,source.offset)==57 then base=10 end if;source.offset=source.offset+1 end while
    if dot then subtype=TT_DECIMAL|TT_FLOAT;base=10 else if base==8 then subtype=TT_OCTAL|TT_INTEGER else subtype=TT_DECIMAL|TT_INTEGER end if
  end if
  if (subtype&TT_FLOAT)==0 then subtype=subtype|TT_INTEGER end if
  text=decode(slice(source.data,begin,source.offset-begin));intValue=0;floatValue=0.0
  if base==16 then intValue=integerValue(text,16,2);floatValue=intValue else if base==8 and len(bytes(text))>1 then intValue=integerValue(text,8,1);floatValue=intValue else floatValue=toNumber(text);intValue=n.trunc32(floatValue) end if
  return Token(TT_NUMBER,subtype,intValue,floatValue,text,started)
end function
function raw(source)
  value=skip(source);if value==0 then return void end if;started=source.line
  if value==34 or value==39 then return readString(source,value) end if
  if isDigit(value) or value==46 and isDigit(at(source,source.offset+1)) then return readNumber(source) end if
  if isNameStart(value) then begin=source.offset;while isName(at(source,source.offset)) source.offset=source.offset+1 end while;text=decode(slice(source.data,begin,source.offset-begin));return Token(TT_NAME,len(bytes(text)),0,0.0,text,started) end if
  values=punctuationStrings();for index=0 to len(values)-1 candidate=bytes(values[index]);matches=true;for cursor=0 to len(candidate)-1 if at(source,source.offset+cursor)!=candidate[cursor] then matches=false;break end if end for;if matches then source.offset=source.offset+len(candidate);return Token(TT_PUNCTUATION,punctuationNumber(index),0,0.0,values[index],started) end if end for
  return fail("unrecognized token at "+source.name+":"+str(source.line))
end function
function defineIndex(registry,name) if len(registry.defines)==0 then return -1 end if;for index=0 to len(registry.defines)-1 if registry.defines[index].name==name then return index end if end for;return -1 end function
function addDefine(registry,text)
  source=Source("<global define>",bytes(text),0,1);name=raw(source);if name==void or name is error or name.type!=TT_NAME then return 0 end if
  tokens=[];while true token=raw(source);if token==void then break end if;if token is error then return 0 end if;tokens=tokens+[token] end while
  index=defineIndex(registry,name.text);value=Define(name.text,tokens);if index<0 then registry.defines=registry.defines+[value] else registry.defines[index]=value end if;return 1
end function
function load(registry,name)
  if registry==void or registry.loadFn==void or name=="" then return 0 end if
  slot=1;while slot<MAX_SOURCEFILES and registry.sources[slot]!=0 slot=slot+1 end while;if slot>=MAX_SOURCEFILES then return 0 end if
  data=try(registry.loadFn(registry.context,name));if data is error or data==void then return 0 end if;if typeof(data)=="string" then data=bytes(data) end if
  inputs=[];inputs=inputs+[Source(name,data,0,1)];registry.sources[slot]=[name,inputs,0];return slot
end function
function free(registry,handle) if handle<1 or handle>=MAX_SOURCEFILES or registry.sources[handle]==0 then return 0 end if;registry.sources[handle]=0;return 1 end function
function pushInclude(registry,entry,name)
  data=try(registry.loadFn(registry.context,name));if data is error or data==void then return false end if;if typeof(data)=="string" then data=bytes(data) end if
  entry[1]=entry[1]+[Source(name,data,0,1)];return true
end function
function pcNextRaw(entry)
  inputs=entry[1]
  while len(inputs)>0
    last=len(inputs)-1
    source=inputs[last]
    token=raw(source)
    if token!=void then return token end if
    if last==0 then return void end if
    remaining=array(last,void)
    for index=0 to last-1 remaining[index]=inputs[index] end for
    inputs=remaining
    entry[1]=inputs
  end while
  return void
end function
function read(registry,sourceHandle)
  if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if;entry=registry.sources[sourceHandle]
  token=void
  if entry[2]!=0 then token=entry[2][0];if len(entry[2])==1 then entry[2]=0 else entry[2]=slice(entry[2],1,len(entry[2])-1) end if
  else token=pcNextRaw(entry) end if
  if token==void or token is error then return token end if
  if token.type==TT_PUNCTUATION and token.subtype==P_PRECOMP then
    directive=pcNextRaw(entry);if directive==void or directive is error then return directive end if
    if directive.text=="include" then path=pcNextRaw(entry);if path==void or path is error or not pushInclude(registry,entry,path.text) then return void end if;return read(registry,sourceHandle)
    else if directive.text=="define" then
      name=pcNextRaw(entry);tokens=[]
      if name!=void and not (name is error) and name.type==TT_NAME then
        while true
          value=pcNextRaw(entry);if value==void or value is error then break end if
          if value.line!=name.line then if entry[2]==0 then entry[2]=[value] else entry[2]=[value]+entry[2] end if;break end if
          tokens=tokens+[value]
        end while
        index=defineIndex(registry,name.text);definition=Define(name.text,tokens);if index<0 then registry.defines=registry.defines+[definition] else registry.defines[index]=definition end if
      end if
      return read(registry,sourceHandle)
    end if
  end if
  if token.type==TT_NAME then
    index=defineIndex(registry,token.text)
    if index>=0 and len(registry.defines[index].tokens)>0 then
      replacement=registry.defines[index].tokens;token=replacement[0]
      if len(replacement)>1 then
        tail=array(len(replacement)-1,0);for cursor=1 to len(replacement)-1 tail[cursor-1]=replacement[cursor] end for
        if entry[2]==0 then entry[2]=tail else entry[2]=tail+entry[2] end if
      end if
    end if
  end if
  return token
end function
function location(registry,handle)
  if handle<1 or handle>=MAX_SOURCEFILES or registry.sources[handle]==0 then return void end if;entry=registry.sources[handle];if len(entry[1])==0 then return [entry[0],0] end if;source=entry[1][len(entry[1])-1];return [entry[0],source.line]
end function
function encode(token)
  if token==void then return fail("token is required") end if;data=bytes(TOKEN_SIZE,0);n.writeU32(data,0,token.type);n.writeU32(data,4,token.subtype);n.writeU32(data,8,token.intValue);n.writeU32(data,12,n.floatBits(token.floatValue));encoded=bytes(token.text);count=len(encoded);if count>=MAX_TOKENLENGTH then count=MAX_TOKENLENGTH-1 end if;if count>0 then copyBytes(data,16,encoded,0,count) end if;return data
end function
