// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Safe native semantic port of code/botlib/l_memory.c.
package mq3.botlib.l_memory

const MEM_ID=305419896
const HUNK_ID=2271560481

/// `MemoryBlock` record for l memory, containing `id`, `handle`, `size`, `payloadSize` and `data` and related fields.
struct MemoryBlock id handle size payloadSize data cleared label file line end struct
/// `Action` record for l memory, containing `boundary`, `kind`, `handle`, `size` and `message` and related fields.
struct Action boundary kind handle size message dispatched end struct
/// `State` record for l memory, containing `blocks`, `nextHandle`, `headerSize`, `allocatedmemory` and `totalmemorysize` and related fields.
struct State blocks nextHandle headerSize allocatedmemory totalmemorysize numblocks availableBytes actions diagnostics memoryManager end struct

/// Create a `mq3.botlib.l_memory.State` record, initializing `nextHandle` as `1`, `headerSize` as `20` and `availableBytes` from `availableBytes`.
/// @param availableBytes Initial value stored in `mq3.botlib.l_memory.State.availableBytes`.
/// @param memoryManager Initial value stored in `mq3.botlib.l_memory.State.memoryManager`.
function create(availableBytes,memoryManager) return State([],1,20,0,0,0,availableBytes,[],[],memoryManager) end function
/// Set `state.actions` to `state.actions+[value]` in `mq3.botlib.l_memory.emit`.
/// @param state L memory state; accesses `actions`. May update `state.actions` in place.
/// @param boundary Initial value stored in `mq3.botlib.l_memory.Action.boundary`.
/// @param kind Initial value stored in `mq3.botlib.l_memory.Action.kind`.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param size Size or capacity supplied to the buffer operation.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function emit(state,boundary,kind,handle,size,message,retailActive) value=Action(boundary,kind,handle,size,message,not retailActive);state.actions=state.actions+[value];return value end function
/// Find the allocation-table index matching a memory handle, returning -1 when absent.
/// @param state L memory state; accesses `blocks`.
/// @param handle Resource handle resolved by the owning pool or host service.
function indexOf(state,handle) if len(state.blocks)>0 then for i=0 to len(state.blocks)-1 if state.blocks[i].handle==handle then return i end if end for end if;return -1 end function
/// Record or dispatch `"memory"` actions in `allocate`. Return paths include `handle`.
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param id Initial value stored in `mq3.botlib.l_memory.MemoryBlock.id`.
/// @param cleared Initial value stored in `mq3.botlib.l_memory.MemoryBlock.cleared`.
/// @param label Label retained with the diagnostic or action record.
/// @param file Source filename attached to the diagnostic.
/// @param line Source line number attached to the diagnostic.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function allocate(state,size,id,cleared,label,file,line,retailActive)
  if size<0 then return error(7900,"negative botlib allocation") end if;handle=state.nextHandle;state.nextHandle=handle+1;blockSize=size+state.headerSize;data=bytes(size,0);block=MemoryBlock(id,handle,blockSize,size,data,cleared,label,file,line);LinkMemoryBlock(state,block);state.allocatedmemory=state.allocatedmemory+blockSize;state.totalmemorysize=state.totalmemorysize+blockSize+state.headerSize;state.numblocks=state.numblocks+1;kind="heap-alloc";if id==HUNK_ID then kind="hunk-alloc" end if;emit(state,"memory",kind,handle,blockSize,label,retailActive);return handle
end function

// LinkMemoryBlock
/// @param state L memory state; accesses `blocks`. May update `state.blocks` in place.
/// @param block Operand used to evaluate the returned expression `block`.
function LinkMemoryBlock(state,block) state.blocks=[block]+state.blocks;return block end function
// UnlinkMemoryBlock
/// @param state L memory state; accesses `blocks`. May update `state.blocks` in place.
/// @param block Block record; accesses `handle`.
function UnlinkMemoryBlock(state,block)
  result=[];for each value in state.blocks if value.handle!=block.handle then result=result+[value] end if end for;state.blocks=result;return block
end function
// GetMemory
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetMemory(state,size,retailActive) return allocate(state,size,MEM_ID,false,"","",0,retailActive) end function
// GetClearedMemory
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetClearedMemory(state,size,retailActive) return allocate(state,size,MEM_ID,true,"","",0,retailActive) end function
// GetHunkMemory
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetHunkMemory(state,size,retailActive) return allocate(state,size,HUNK_ID,false,"","",0,retailActive) end function
// GetClearedHunkMemory
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetClearedHunkMemory(state,size,retailActive) return allocate(state,size,HUNK_ID,true,"","",0,retailActive) end function
/// Forward `GetMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param label Label retained with the diagnostic or action record.
/// @param file Source filename attached to the diagnostic.
/// @param line Source line number attached to the diagnostic.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,MEM_ID,false,label,file,line,retailActive) end function
/// Forward `GetClearedMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param label Label retained with the diagnostic or action record.
/// @param file Source filename attached to the diagnostic.
/// @param line Source line number attached to the diagnostic.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetClearedMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,MEM_ID,true,label,file,line,retailActive) end function
/// Forward `GetHunkMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param label Label retained with the diagnostic or action record.
/// @param file Source filename attached to the diagnostic.
/// @param line Source line number attached to the diagnostic.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetHunkMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,HUNK_ID,false,label,file,line,retailActive) end function
/// Forward `GetClearedHunkMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param size Size or capacity supplied to the buffer operation.
/// @param label Label retained with the diagnostic or action record.
/// @param file Source filename attached to the diagnostic.
/// @param line Source line number attached to the diagnostic.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function GetClearedHunkMemoryDebug(state,size,label,file,line,retailActive) return allocate(state,size,HUNK_ID,true,label,file,line,retailActive) end function

// BlockFromPointer
/// @param state L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param operation Value used by `BlockFromPointer` in `if handle==void or handle==0 then message=operation+": NULL pointer"`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function BlockFromPointer(state,handle,operation,retailActive)
  if handle==void or handle==0 then message=operation+": NULL pointer";state.diagnostics=state.diagnostics+[message];emit(state,"botlib","fatal",0,0,message,retailActive);return void end if;index=indexOf(state,handle);if index<0 then message=operation+": invalid memory block";state.diagnostics=state.diagnostics+[message];emit(state,"botlib","fatal",handle,0,message,retailActive);return void end if;block=state.blocks[index];if block.id!=MEM_ID and block.id!=HUNK_ID then message=operation+": invalid memory block";state.diagnostics=state.diagnostics+[message];emit(state,"botlib","fatal",handle,0,message,retailActive);return void end if;return block
end function

// FreeMemory
/// @param state L memory state; accesses `allocatedmemory`, `totalmemorysize`, `headerSize` and `numblocks`. May update `state.allocatedmemory`, `state.totalmemorysize` and `state.numblocks` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function FreeMemory(state,handle,retailActive)
  block=BlockFromPointer(state,handle,"FreeMemory",retailActive);if block==void then return false end if;UnlinkMemoryBlock(state,block);state.allocatedmemory=state.allocatedmemory-block.size;state.totalmemorysize=state.totalmemorysize-block.size-state.headerSize;state.numblocks=state.numblocks-1;if block.id==MEM_ID then emit(state,"memory","heap-free",handle,block.size,"",retailActive) else emit(state,"memory","hunk-release",handle,block.size,"logical unlink; host hunk lifetime is retained",retailActive) end if;return true
end function

// AvailableMemory
/// @param state L memory state; accesses `availableBytes`.
function AvailableMemory(state) return state.availableBytes end function
// MemoryByteSize
/// @param state L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function MemoryByteSize(state,handle,retailActive) block=BlockFromPointer(state,handle,"MemoryByteSize",retailActive);if block==void then return 0 end if;return block.size end function
// PrintUsedMemorySize
/// @param state L memory state; accesses `allocatedmemory`, `totalmemorysize` and `numblocks`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function PrintUsedMemorySize(state,retailActive) rows=["total allocated memory: "+str(state.allocatedmemory>>10)+" KB","total botlib memory: "+str(state.totalmemorysize>>10)+" KB","total memory blocks: "+str(state.numblocks)];for each row in rows emit(state,"botlib","print",0,0,row,retailActive) end for;return rows end function
// PrintMemoryLabels
/// @param state L memory state; accesses `blocks`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function PrintMemoryLabels(state,retailActive)
  rows=PrintUsedMemorySize(state,retailActive)+["============= Botlib memory log ==============",""];i=0;for each block in state.blocks kind="heap";if block.id==HUNK_ID then kind="hunk" end if;row=str(i)+", "+kind+" "+str(block.handle)+", "+str(block.size)+": "+block.file+" line "+str(block.line)+": "+block.label;rows=rows+[row];emit(state,"log","memory-label",block.handle,block.size,row,retailActive);i=i+1 end for;return rows
end function
// DumpMemory
/// @param state L memory state; accesses `blocks`, `totalmemorysize` and `allocatedmemory`. May update `state.totalmemorysize` and `state.allocatedmemory` in place.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function DumpMemory(state,retailActive) while len(state.blocks)>0 handle=state.blocks[0].handle;FreeMemory(state,handle,retailActive) end while;state.totalmemorysize=0;state.allocatedmemory=0;return void end function

/// Apply `mq3.botlib.l_memory.BlockFromPointer` while evaluating `writeBytes`.
/// @param state L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param data Sequence whose length bounds the iteration or lookup in `writeBytes`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function writeBytes(state,handle,offset,data,retailActive) block=BlockFromPointer(state,handle,"writeBytes",retailActive);if block==void then return false end if;if offset<0 or offset+len(data)>block.payloadSize then return error(7900,"botlib memory write outside allocation") end if;if len(data)>0 then copyBytes(block.data,offset,data,0,len(data)) end if;return true end function
/// Apply `mq3.botlib.l_memory.BlockFromPointer` while evaluating `readBytes`. Return paths include `slice(block.data,offset,count)`.
/// @param state L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param count Number of entries or bytes processed by this call.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function readBytes(state,handle,offset,count,retailActive) block=BlockFromPointer(state,handle,"readBytes",retailActive);if block==void then return void end if;if offset<0 or count<0 or offset+count>block.payloadSize then return error(7900,"botlib memory read outside allocation") end if;if count==0 then return bytes(0,0) end if;return slice(block.data,offset,count) end function
/// Apply `mq3.botlib.l_memory.GetMemory` and `mq3.botlib.l_memory.writeBytes` while evaluating `CopyString`. Return paths include `handle`.
/// @param state L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place.
/// @param text Text to parse, format or deliver.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function CopyString(state,text,retailActive) data=bytes(text);handle=GetMemory(state,len(data)+1,retailActive);writeBytes(state,handle,0,data,retailActive);return handle end function
