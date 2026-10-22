// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Safe semantic port of code/botlib/l_struct.c.
package mq3.botlib.l_struct

import mq3.vm.pc_parser as pc
import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as textnumbers

const MAX_STRINGFIELD=80
const FT_CHAR=1
const FT_INT=2
const FT_FLOAT=3
const FT_STRING=4
const FT_STRUCT=6
const FT_TYPE=0x00ff
const FT_ARRAY=0x0100
const FT_BOUNDED=0x0200
const FT_UNSIGNED=0x0400

struct FieldDef name offset type maxarray floatmin floatmax substruct end struct
struct StructDef size fields end struct
struct FieldValue definition values end struct
struct Structure definition fields end struct
// A reader can consume either a raw pc_parser Source or a precompiled handle.
// pending is local because l_struct.c needs exactly one-token pushback.
struct Reader source registry sourceHandle pending diagnostics end struct

function fail(reader,message)
  if reader!=void then reader.diagnostics=reader.diagnostics+[message] end if
  return error(7902,"l_struct: "+message)
end function
function field(name,offset,type,maxarray,floatmin,floatmax,substruct) return FieldDef(name,offset,type,maxarray,floatmin,floatmax,substruct) end function
function definition(size,fields) return StructDef(size,fields) end function
function sourceReader(name,text) return Reader(pc.Source(name,bytes(text),0,1,0),void,0,void,[]) end function
function precompilerReader(registry,sourceHandle) return Reader(void,registry,sourceHandle,void,[]) end function
function nextToken(reader)
  if reader.pending!=void then token=reader.pending;reader.pending=void;return token end if
  if reader.registry!=void then return pc.read(reader.registry,reader.sourceHandle) end if
  if reader.source==void then return void end if
  return pc.sourceTake(reader.source)
end function
function unreadToken(reader,token) if token!=void then reader.pending=token end if;return void end function
function expectToken(reader,text)
  token=nextToken(reader);if token==void then return fail(reader,"expected "+text+", found end of source") end if;if token is error then return token end if
  if token.text!=text then return fail(reader,"expected "+text+", found "+token.text) end if;return token
end function
function checkToken(reader,text)
  token=nextToken(reader);if token==void then return false end if;if token is error then return token end if
  if token.text==text then return true end if;unreadToken(reader,token);return false
end function

// FindField
function FindField(defs,name)
  if defs==void then return void end if
  for each candidate in defs if candidate.name==name then return candidate end if end for
  return void
end function

function scalarDefault(fd)
  kind=fd.type&FT_TYPE
  if kind==FT_FLOAT then return 0.0 end if
  if kind==FT_STRING then return "" end if
  if kind==FT_STRUCT then if fd.substruct==void then return void end if;return createStructure(fd.substruct) end if
  return 0
end function
function createFieldValue(fd)
  count=1;if (fd.type&FT_ARRAY)!=0 then count=fd.maxarray end if;if count<0 then count=0 end if
  values=[];if count>0 then for index=0 to count-1 values=values+[scalarDefault(fd)] end for end if
  return FieldValue(fd,values)
end function
function createStructure(def)
  if def==void then return void end if;values=[]
  if def.fields!=void then for each fd in def.fields values=values+[createFieldValue(fd)] end for end if
  return Structure(def,values)
end function
function valueIndex(structure,name)
  if structure==void or structure.fields==void then return -1 end if
  for index=0 to len(structure.fields)-1 if structure.fields[index].definition.name==name then return index end if end for
  return -1
end function
function fieldValue(structure,name) index=valueIndex(structure,name);if index<0 then return void end if;return structure.fields[index] end function
function value(structure,name,index)
  stored=fieldValue(structure,name);if stored==void or index<0 or index>=len(stored.values) then return void end if;return stored.values[index]
end function
function setValue(structure,name,index,newValue)
  stored=fieldValue(structure,name);if stored==void or index<0 or index>=len(stored.values) then return false end if;stored.values[index]=newValue;return true
end function

// ReadNumber
function ReadNumber(reader,fd)
  token=nextToken(reader);if token==void then return fail(reader,"expected number, found end of source") end if;if token is error then return token end if
  negative=false
  if token.type==pc.TT_PUNCTUATION then
    if (fd.type&FT_UNSIGNED)!=0 then return fail(reader,"expected unsigned value, found "+token.text) end if
    if token.text!="-" then return fail(reader,"unexpected punctuation "+token.text) end if
    negative=true;token=nextToken(reader);if token==void then return fail(reader,"expected number, found end of source") end if;if token is error then return token end if
  end if
  if token.type!=pc.TT_NUMBER then return fail(reader,"expected number, found "+token.text) end if
  kind=fd.type&FT_TYPE
  if (token.subtype&pc.TT_FLOAT)!=0 then
    if kind!=FT_FLOAT then return fail(reader,"unexpected float") end if
    result=token.floatValue;if negative then result=0.0-result end if;result=numeric.f32(result)
    if (fd.type&FT_BOUNDED)!=0 and (result<fd.floatmin or result>fd.floatmax) then return fail(reader,"float out of range ["+str(fd.floatmin)+", "+str(fd.floatmax)+"]") end if
    return result
  end if
  result=token.intValue;if negative then result=0-result end if
  if kind==FT_CHAR or kind==FT_INT then
    minimum=-128;maximum=127
    if kind==FT_INT then minimum=-32768;maximum=32767 end if
    if (fd.type&FT_UNSIGNED)!=0 then minimum=0;if kind==FT_CHAR then maximum=255 else maximum=65535 end if end if
    if (fd.type&FT_BOUNDED)!=0 then
      boundedMin=numeric.trunc32(fd.floatmin);boundedMax=numeric.trunc32(fd.floatmax)
      if boundedMin>minimum then minimum=boundedMin end if;if boundedMax<maximum then maximum=boundedMax end if
    end if
    if result<minimum or result>maximum then return fail(reader,"value "+str(result)+" out of range ["+str(minimum)+", "+str(maximum)+"]") end if
    return result
  end if
  if kind==FT_FLOAT then
    converted=numeric.f32(result);if (fd.type&FT_BOUNDED)!=0 and (result<fd.floatmin or result>fd.floatmax) then return fail(reader,"value "+str(result)+" out of range ["+str(fd.floatmin)+", "+str(fd.floatmax)+"]") end if;return converted
  end if
  return fail(reader,"unsupported numeric field type "+str(kind))
end function

// ReadChar
function ReadChar(reader,fd)
  token=nextToken(reader);if token==void then return fail(reader,"expected character, found end of source") end if;if token is error then return token end if
  if token.type==pc.TT_LITERAL then data=bytes(token.text);if len(data)==0 then return 0 end if;return data[0] end if
  unreadToken(reader,token);return ReadNumber(reader,fd)
end function

// ReadString
function ReadString(reader,fd)
  token=nextToken(reader);if token==void then return fail(reader,"expected string, found end of source") end if;if token is error then return token end if
  if token.type!=pc.TT_STRING then return fail(reader,"expected string, found "+token.text) end if
  data=bytes(token.text);if len(data)<MAX_STRINGFIELD then return token.text end if;return decode(slice(data,0,MAX_STRINGFIELD-1))
end function

function readFieldScalar(reader,fd)
  kind=fd.type&FT_TYPE
  if kind==FT_CHAR then return ReadChar(reader,fd) end if
  if kind==FT_INT or kind==FT_FLOAT then return ReadNumber(reader,fd) end if
  if kind==FT_STRING then return ReadString(reader,fd) end if
  if kind==FT_STRUCT then
    if fd.substruct==void then return fail(reader,"BUG: no sub structure defined") end if
    nested=createStructure(fd.substruct);parsed=ReadStructure(reader,fd.substruct,nested);if parsed is error then return parsed end if;return nested
  end if
  return fail(reader,"unsupported structure field type "+str(kind))
end function

// ReadStructure
function ReadStructure(reader,def,structure)
  if def==void then return fail(reader,"missing structure definition") end if;if structure==void then structure=createStructure(def) end if
  opened=expectToken(reader,"{");if opened is error then return opened end if
  while true
    token=nextToken(reader);if token==void then return fail(reader,"unterminated structure") end if;if token is error then return token end if;if token.text=="}" then break end if
    fd=FindField(def.fields,token.text);if fd==void then return fail(reader,"unknown structure field "+token.text) end if
    stored=fieldValue(structure,fd.name);if stored==void then return fail(reader,"structure storage misses field "+fd.name) end if
    count=1;if (fd.type&FT_ARRAY)!=0 then count=fd.maxarray;opened=expectToken(reader,"{");if opened is error then return opened end if end if
    cursor=0
    while cursor<count
      if (fd.type&FT_ARRAY)!=0 then closed=checkToken(reader,"}");if closed is error then return closed end if;if closed then break end if end if
      parsed=readFieldScalar(reader,fd);if parsed is error then return parsed end if;stored.values[cursor]=parsed;cursor=cursor+1
      if (fd.type&FT_ARRAY)!=0 then
        separator=nextToken(reader);if separator==void then return fail(reader,"unterminated array "+fd.name) end if;if separator is error then return separator end if
        if separator.text=="}" then break end if;if separator.text!="," then return fail(reader,"expected a comma, found "+separator.text) end if
      end if
    end while
  end while
  return structure
end function

// WriteIndent
function WriteIndent(indent)
  text="";while indent>0 text=text+"\t";indent=indent-1 end while;return text
end function

// WriteFloat
function WriteFloat(value)
  text=textnumbers.fixed6(numeric.f32(value));if text is error then return text end if;data=bytes(text);count=len(data)
  while count>1 and data[count-1]==48 count=count-1 end while
  if count>1 and data[count-1]==46 then count=count-1 end if
  if count==len(data) then return text end if;if count<=0 then return "" end if;return decode(slice(data,0,count))
end function
function writeScalar(fd,stored,index,indent)
  if index<0 or index>=len(stored.values) then return fail(void,"field storage outside array") end if;item=stored.values[index];kind=fd.type&FT_TYPE
  if kind==FT_CHAR then if (fd.type&FT_UNSIGNED)!=0 and item>=128 then return str(item-256) end if;return str(item) end if
  if kind==FT_INT then return str(item) end if
  if kind==FT_FLOAT then return WriteFloat(item) end if
  if kind==FT_STRING then return "\""+item+"\"" end if
  if kind==FT_STRUCT then if item==void or fd.substruct==void then return fail(void,"missing sub structure "+fd.name) end if;return WriteStructWithIndent(fd.substruct,item,indent) end if
  return fail(void,"unsupported structure field type "+str(kind))
end function

// WriteStructWithIndent
function WriteStructWithIndent(def,structure,indent)
  if def==void or structure==void then return fail(void,"missing structure for write") end if
  text=WriteIndent(indent)+"{\r\n";childIndent=indent+1
  if def.fields!=void then for each fd in def.fields
    stored=fieldValue(structure,fd.name);if stored==void then return fail(void,"structure storage misses field "+fd.name) end if
    text=text+WriteIndent(childIndent)+fd.name+"\t";count=1
    if (fd.type&FT_ARRAY)!=0 then count=fd.maxarray;text=text+"{" end if
    if count>0 then for index=0 to count-1 rendered=writeScalar(fd,stored,index,childIndent);if rendered is error then return rendered end if;text=text+rendered;if (fd.type&FT_ARRAY)!=0 then if index+1<count then text=text+"," else text=text+"}" end if end if end for end if
    text=text+"\r\n"
  end for end if
  return text+WriteIndent(indent)+"}\r\n"
end function

// WriteStructure
function WriteStructure(def,structure) return WriteStructWithIndent(def,structure,0) end function
