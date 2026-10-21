// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Mutable shader-handle remaps matching R_RemapShader's name semantics.
package mq3.renderer.shader_remap
import mq3.compat.textnumbers as numbers

struct Entry oldName newName timeOffset handles end struct
struct State entries revision end struct

function create() return State([],0) end function

// R_FindShader stores extensionless names and R_RemapShader compares those
// names case-insensitively after COM_StripExtension.
function stripped(name)
  if name==void then return "" end if
  data=bytes(name);count=0
  while count<len(data) and data[count]!=46 count=count+1 end while
  return decode(slice(data,0,count))
end function

function sameName(a,b) return stringEqualsIgnoreCaseAscii(stripped(a),stripped(b)) end function

function find(state,oldName)
  if state==void then return void end if
  for each entry in state.entries if sameName(entry.oldName,oldName) then return entry end if end for
  return void
end function

function resolve(state,name)
  entry=find(state,name);if entry==void or sameName(entry.oldName,entry.newName) then return name end if
  return entry.newName
end function

function timeOffset(state,name)
  entry=find(state,name);if entry==void then return "" end if;return entry.timeOffset
end function

function timeOffsetForHandle(state,handle)
  if state==void or handle<=0 then return void end if
  index=handle-1
  for each entry in state.entries if contains(entry.handles,index) then return numbers.atof32(entry.timeOffset) end if end for
  return void
end function

function contains(values,value) for each current in values if current==value then return true end if end for;return false end function

// Return the stable renderer handle previously associated with this source
// shader. Registration after a remap must not allocate a disconnected object.
function handle(state,kinds,kind,name)
  entry=find(state,name);if entry==void then return 0 end if
  for each index in entry.handles if index>=0 and index<len(kinds) and kinds[index]==kind then return index+1 end if end for
  return 0
end function

// Asset handles are the renderer's stable shader objects in MiniQuake3. By
// replacing their resolved names in place, existing cgame/UI handles reach the
// replacement in both the scene and 2D material resolvers without re-registering.
function apply(state,assets,kinds,oldName,newName,offset)
  if state==void or assets==void or kinds==void or len(assets)!=len(kinds) then return error(7472,"invalid shader remap registry") end if
  if oldName==void or newName==void or oldName=="" or newName=="" then return error(7473,"empty shader remap name") end if
  entry=find(state,oldName)
  if entry==void then entry=Entry(stripped(oldName),newName,offset,[]);state.entries=state.entries+[entry]
  else entry.newName=newName;entry.timeOffset=offset end if
  changed=0
  for index=0 to len(assets)-1
    shaderKind=kinds[index]=="shader" or kinds[index]=="shaderNoMip"
    if shaderKind and (contains(entry.handles,index) or sameName(assets[index],oldName)) then
      if not contains(entry.handles,index) then entry.handles=entry.handles+[index] end if
      assets[index]=newName;changed=changed+1
    end if
  end for
  state.revision=state.revision+1
  return changed
end function
