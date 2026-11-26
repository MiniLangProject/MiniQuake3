// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shader text hashing/indexing from renderer/tr_shader.c.
package mq3.renderer.shader_index
import mq3.compat.numeric as n
import mq3.shared.parser as parser
import std.string as strings
import std.ds.list as lists

const MAX_SHADERTEXT_HASH=2048

/// Data record for `mq3.renderer.shader_index.Entry`; groups `name`, `hash`, `bodyOffset`, `endOffset`.
struct Entry name hash bodyOffset endOffset end struct
/// Data record for `mq3.renderer.shader_index.Index`; groups `text`, `entries`, `buckets`.
struct Index text entries buckets end struct

/// Computes `hashValue` from `hash&(size-1)` using `or`, `mq3.compat.numeric.i32`.
/// @param name Argument 1 supplied to `bytes`.
/// @param size Input tested by `size<=0 or (size&(size-1))!=0`.
function hashValue(name,size)
  if size<=0 or (size&(size-1))!=0 then return error(7100,"shader hash size must be a power of two") end if
  data=bytes(name);hash=0;index=0
  while index<len(data)
    letter=data[index]
    if letter>=65 and letter<=90 then letter=letter+32 end if
    if letter==46 then break end if
    if letter==92 then letter=47 end if
    hash=n.i32(hash+letter*(index+119));index=index+1
  end while
  hash=n.i32(hash^(hash>>10)^(hash>>20))
  return hash&(size-1)
end function

/// Computes `skipBracedSection` from `depth==0` using `mq3.shared.parser.parseExt`.
/// @param state Record providing `state.offset`.
function skipBracedSection(state)
  depth=0
  while true
    token=parser.parseExt(state,true)
    if len(token)==1 then
      if token=="{" then depth=depth+1
      else if token=="}" then depth=depth-1
      end if
    end if
    if depth==0 or state.offset<0 then break end if
  end while
  return depth==0
end function

/// Builds `mq3.renderer.shader_index.Index` after updating `buckets[hash]`.
/// @param text Initial value for `mq3.renderer.shader_index.Index.text`.
function build(text)
  state=parser.create(text);entryList=lists.List.withCapacity(1024);buckets=array(MAX_SHADERTEXT_HASH,void)
  while true
    name=parser.parseExt(state,true)
    if name=="" then break end if
    bodyOffset=state.offset
    hash=hashValue(name,MAX_SHADERTEXT_HASH)
    if not skipBracedSection(state) then return error(7101,"unterminated shader definition: "+name) end if
    entry=Entry(name,hash,bodyOffset,state.offset)
    entryList.add(entry)
    if buckets[hash]==void then buckets[hash]=[] end if
    buckets[hash]=buckets[hash]+[entryList.len()-1]
  end while
  return Index(text,entryList.toArray(),buckets)
end function

/// Looks up a shader by case-insensitive name within its shader-text hash bucket.
/// @param index Record providing `index.buckets`, `index.entries`.
/// @param name Value forwarded as `name` to `mq3.renderer.shader_index.hashValue`.
function find(index,name)
  hash=hashValue(name,MAX_SHADERTEXT_HASH);bucket=index.buckets[hash]
  if bucket==void then return void end if
  wanted=strings.toLowerAscii(name)
  for position=0 to len(bucket)-1
    entry=index.entries[bucket[position]]
    if strings.toLowerAscii(entry.name)==wanted then return entry end if
  end for
  return void
end function
