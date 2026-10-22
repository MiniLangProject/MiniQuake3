// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Safe native semantic port of code/botlib/l_memory.c.
package mq3.botlib.l_memory

const MEM_ID=305419896
const HUNK_ID=2271560481

struct MemoryBlock id handle size payloadSize data cleared label file line end struct
struct Action boundary kind handle size message dispatched end struct
struct State blocks nextHandle headerSize allocatedmemory totalmemorysize numblocks availableBytes actions diagnostics memoryManager end struct

function create(availableBytes,memoryManager) return State([],1,20,0,0,0,availableBytes,[],[],memoryManager) end function
function emit(state,boundary,kind,handle,size,message,retailActive) value=Action(boundary,kind,handle,size,message,not retailActive);state.actions=state.actions+[value];return value end function
function indexOf(state,handle) if len(state.blocks)>0 then for i=0 to len(state.blocks)-1 if state.blocks[i].handle==handle then return i end if end for end if;return -1 end function
function allocate(state,size,id,cleared,label,file,line,retailActive)
  if size<0 then return error(7900,"negative botlib allocation") end if;handle=state.nextHandle;state.nextHandle=handle+1;blockSize=size+state.headerSize;data=bytes(size,0);block=MemoryBlock(id,handle,blockSize,size,data,cleared,label,file,line);LinkMemoryBlock(state,block);state.allocatedmemory=state.allocatedmemory+blockSize;state.totalmemorysize=state.totalmemorysize+blockSize+state.headerSize;state.numblocks=state.numblocks+1;kind="heap-alloc";if id==HUNK_ID then kind="hunk-alloc" end if;emit(state,"memory",kind,handle,blockSize,label,retailActive);return handle
end function

// LinkMemoryBlock
function LinkMemoryBlock(state,block) state.blocks=[block]+state.blocks;return block end function
// UnlinkMemoryBlock
function UnlinkMemoryBlock(state,block)
  result=[];for each value in state.blocks if value.handle!=block.handle then result=result+[value] end if end for;state.blocks=result;return block
end function
// GetMemory
function GetMemory(state,size,retailActive) return allocate(state,size,MEM_ID,false,"","",0,retailActive) end function
// GetClearedMemory
function GetClearedMemory(state,size,retailActive) return allocate(state,size,MEM_ID,true,"","",0,retailActive) end function
// GetHunkMemory
function GetHunkMemory(state,size,retailActive) return allocate(state,size,HUNK_ID,false,"","",0,retailActive) end function
// GetClearedHunkMemory
function GetClearedHunkMemory(state,size,retailActive) return allocate(state,size,HUNK_ID,true,"","",0,retailActive) end function
function GetMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,MEM_ID,false,label,file,line,retailActive) end function
function GetClearedMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,MEM_ID,true,label,file,line,retailActive) end function
function GetHunkMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,HUNK_ID,false,label,file,line,retailActive) end function
function GetClearedHunkMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,HUNK_ID,true,label,file,line,retailActive) end function

// BlockFromPointer
function BlockFromPointer(state,handle,operation,retailActive)
  if handle==void or handle==0 then message=operation+": NULL pointer";state.diagnostics=state.diagnostics+[message];emit(state,"botlib","fatal",0,0,message,retailActive);return void end if;index=indexOf(state,handle);if index<0 then message=operation+": invalid memory block";state.diagnostics=state.diagnostics+[message];emit(state,"botlib","fatal",handle,0,message,retailActive);return void end if;block=state.blocks[index];if block.id!=MEM_ID and block.id!=HUNK_ID then message=operation+": invalid memory block";state.diagnostics=state.diagnostics+[message];emit(state,"botlib","fatal",handle,0,message,retailActive);return void end if;return block
end function

// FreeMemory
function FreeMemory(state,handle,retailActive)
  block=BlockFromPointer(state,handle,"FreeMemory",retailActive);if block==void then return false end if;UnlinkMemoryBlock(state,block);state.allocatedmemory=state.allocatedmemory-block.size;state.totalmemorysize=state.totalmemorysize-block.size-state.headerSize;state.numblocks=state.numblocks-1;if block.id==MEM_ID then emit(state,"memory","heap-free",handle,block.size,"",retailActive) else emit(state,"memory","hunk-release",handle,block.size,"logical unlink; host hunk lifetime is retained",retailActive) end if;return true
end function

// AvailableMemory
function AvailableMemory(state) return state.availableBytes end function
// MemoryByteSize
function MemoryByteSize(state,handle,retailActive) block=BlockFromPointer(state,handle,"MemoryByteSize",retailActive);if block==void then return 0 end if;return block.size end function
// PrintUsedMemorySize
function PrintUsedMemorySize(state,retailActive) rows=["total allocated memory: "+str(state.allocatedmemory>>10)+" KB","total botlib memory: "+str(state.totalmemorysize>>10)+" KB","total memory blocks: "+str(state.numblocks)];for each row in rows emit(state,"botlib","print",0,0,row,retailActive) end for;return rows end function
// PrintMemoryLabels
function PrintMemoryLabels(state,retailActive)
  rows=PrintUsedMemorySize(state,retailActive)+["============= Botlib memory log ==============",""];i=0;for each block in state.blocks kind="heap";if block.id==HUNK_ID then kind="hunk" end if;row=str(i)+", "+kind+" "+str(block.handle)+", "+str(block.size)+": "+block.file+" line "+str(block.line)+": "+block.label;rows=rows+[row];emit(state,"log","memory-label",block.handle,block.size,row,retailActive);i=i+1 end for;return rows
end function
// DumpMemory
function DumpMemory(state,retailActive) while len(state.blocks)>0 handle=state.blocks[0].handle;FreeMemory(state,handle,retailActive) end while;state.totalmemorysize=0;state.allocatedmemory=0;return void end function

function writeBytes(state,handle,offset,data,retailActive) block=BlockFromPointer(state,handle,"writeBytes",retailActive);if block==void then return false end if;if offset<0 or offset+len(data)>block.payloadSize then return error(7900,"botlib memory write outside allocation") end if;if len(data)>0 then copyBytes(block.data,offset,data,0,len(data)) end if;return true end function
function readBytes(state,handle,offset,count,retailActive) block=BlockFromPointer(state,handle,"readBytes",retailActive);if block==void then return void end if;if offset<0 or count<0 or offset+count>block.payloadSize then return error(7900,"botlib memory read outside allocation") end if;if count==0 then return bytes(0,0) end if;return slice(block.data,offset,count) end function
function CopyString(state,text,retailActive) data=bytes(text);handle=GetMemory(state,len(data)+1,retailActive);writeBytes(state,handle,0,data,retailActive);return handle end function
