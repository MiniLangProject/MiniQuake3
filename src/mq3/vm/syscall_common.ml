// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared, memory-safe QVM syscall boundary for qagame, cgame and UI.
package mq3.vm.syscall_common
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as command

/// ABI selector for the server game VM.
const ABI_QAGAME = 0
/// ABI selector for the client game VM.
const ABI_CGAME = 1
/// ABI selector for the user-interface VM.
const ABI_UI = 2
/// Maximum number of VM bytes inspected for a string, including its required zero terminator.
const MAX_VM_STRING = 8192
/// Legacy vmCvar_t size: four 32-bit header fields followed by 256 bytes of zero-terminated string storage.
const VM_CVAR_SIZE = 272

/// Round down to the greatest integral double no larger than the input.
/// @param value Floating-point operand.
/// @returns The integral double rounded toward negative infinity.
extern function floor(value as double) from "ucrtbase.dll" returns double
/// Round up to the least integral double no smaller than the input.
/// @param value Floating-point operand.
/// @returns The integral double rounded toward positive infinity.
extern function ceil(value as double) from "ucrtbase.dll" returns double
/// Compute the inverse cosine in radians.
/// @param value Floating-point operand.
/// @returns The principal angle in radians, with C-runtime domain handling outside [-1, 1].
extern function acos(value as double) from "ucrtbase.dll" returns double

/// Shared QVM host services; callbacks receive the stored context rather than the Services record.
struct Services
  /// Host cvar registry used by QVM registration, lookup, mutation, and vmCvar_t synchronization.
  cvars
  /// Command-buffer state whose currently tokenized command supplies argc, argv, and args traps.
  commands
  /// Opaque caller-supplied context available to shared QVM console, clock, and file-system services.
  context
  /// Optional callback `(context, text)` for ordinary console output; its return value is ignored.
  printFn
  /// Optional callback `(context, text)` for VM error reporting; the trap returns zero if the callback returns.
  errorFn
  /// Optional callback `(context)` returning the host millisecond clock.
  millisecondsFn
  /// Optional callback `(context, executionMode, text)` for a console command; its return value is ignored.
  consoleFn
  /// Optional callback `(context, path, mode)` returning OpenResult(handle, length), or `void` for failure.
  openFn
  /// Optional callback `(context, handle, count)` returning at least `count` bytes; short results fail the trap.
  readFn
  /// Optional callback `(context, handle, data)` receiving the requested byte slice; its return value is ignored.
  writeFn
  /// Optional callback `(context, handle)` releasing a file handle; its return value is ignored.
  closeFn
end struct

/// Host file-open result copied into the QVM handle slot and returned as the open trap result.
struct OpenResult
  /// Host file handle returned by the open operation.
  handle
  /// File length or mode-specific status returned by the host; an absent open result becomes -1.
  length
end struct

/// Create shared QVM services with all host callbacks initially unset.
/// @param registry Host cvar registry used by cvar traps, or `void` until configured.
/// @param commands Command-buffer state supplying the current tokenized command, or `void` until configured.
/// @param context Opaque value passed unchanged as the first argument to host callbacks.
function services(registry,commands,context)
  return Services(registry,commands,context,void,void,void,void,void,void,void,void)
end function

/// Create the vm.syscall_common error for `fail` with 3420 and the supplied diagnostic text.
/// @param message Message used in `("QVM syscall: " + message)` and `error(3420, ("QVM syscall: " + message))`.
function fail(message) return error(3420,"QVM syscall: "+message) end function

/// Read one signed little-endian 32-bit slot from a QVM syscall argument vector.
/// Slot zero contains the trap number; subsequent slots contain arguments. Rejects negative offsets or
/// indexes, address overflow, and reads beyond VM data memory. The argument-vector address is not masked.
/// @param vm VM exposing its data-memory byte buffer.
/// @param address Byte offset of the first argument-vector slot in VM memory.
/// @param index Zero-based slot index, with each slot occupying four bytes.
function argument(vm,address as int,index as int)
  at=address+index*4
  if address<0 or index<0 or at<address or at+4>len(vm.data) then return fail("argument vector outside VM memory") end if
  return n.readI32(vm.data,at)
end function

/// Convert a nonzero QVM pointer value to a checked byte offset for a contiguous memory span.
/// Applies `value & vm.mask` before checking the span against VM data memory. Rejects a zero original
/// pointer, negative size, or an out-of-bounds span; a zero-length request still requires a nonzero pointer.
/// @param vm VM supplying the data buffer and its address mask.
/// @param value QVM pointer value to mask and validate, not a native host address.
/// @param size Required contiguous span length in bytes.
/// @param label Name of the accessed value, included in validation diagnostics.
function pointer(vm,value,size,label)
  if value==0 then return fail(label+" is NULL") end if
  if size<0 then return fail(label+" has negative size") end if
  at=value & vm.mask
  if at<0 or at>len(vm.data) or size>len(vm.data)-at then return fail(label+" outside VM memory") end if
  return at
end function

/// Decode a zero-terminated string from QVM memory.
/// The terminator must occur within the first MAX_VM_STRING bytes or before the end of VM memory,
/// whichever comes first. A missing terminator or invalid pointer produces a syscall error.
/// @param vm VM whose data-memory buffer contains the string.
/// @param value Nonzero QVM pointer value for the first string byte; masked by the VM address mask.
function readString(vm,value)
  at=pointer(vm,value,1,"string");limit=at+MAX_VM_STRING
  if limit>len(vm.data) then limit=len(vm.data) end if
  stop=at
  while stop<limit and vm.data[stop]!=0 stop=stop+1 end while
  if stop==limit then return fail("unterminated VM string") end if
  return decode(slice(vm.data,at,stop-at))
end function

/// Write a bounded zero-terminated byte string to QVM memory and return its payload byte count.
/// Copies at most `capacity - 1` bytes and appends a zero byte. Zero capacity returns zero without
/// accessing or validating the pointer; negative capacity and invalid positive-capacity spans fail.
/// Truncation is byte-based and may split a multibyte encoded character.
/// @param vm VM whose data memory receives the string and terminator.
/// @param value Destination QVM pointer value, validated only when capacity is positive.
/// @param capacity Total destination capacity in bytes, including space for the zero terminator.
/// @param data Value converted by `bytes(data)` before copying, typically text or a byte buffer.
/// @param label Destination name included in validation diagnostics.
function writeBuffer(vm,value,capacity,data,label)
  if capacity<0 then return fail(label+" has negative capacity") end if
  if capacity==0 then return 0 end if
  at=pointer(vm,value,capacity,label);source=bytes(data);count=len(source)
  if count>=capacity then count=capacity-1 end if
  copyBytes(vm.data,at,source,0,count);vm.data[at+count]=0
  return count
end function

/// Copy exactly `count` bytes into QVM memory without appending a terminator.
/// Returns `void` on success. Rejects negative lengths, invalid destinations, and source buffers shorter
/// than the requested count. A zero count still validates the destination pointer.
/// @param vm VM whose data memory receives the raw bytes.
/// @param value Nonzero destination QVM pointer value, masked and checked for the requested span.
/// @param data Source byte buffer containing at least `count` bytes.
/// @param count Number of source bytes to copy.
/// @param label Output name included in pointer and short-source diagnostics.
function writeRaw(vm,value,data,count,label)
  if count<0 then return fail(label+" has negative length") end if
  at=pointer(vm,value,count,label)
  if len(data)<count then return fail(label+" service returned too few bytes") end if
  if count>0 then copyBytes(vm.data,at,data,0,count) end if
  return void
end function

/// Compute require cvars in vm.syscall_common; the normal completion returns `host.cvars`.
/// @param host Record exposing `cvars`.
function requireCvars(host)
  if host.cvars==void then return fail("cvar service unavailable") end if
  return host.cvars
end function

/// Serialize a host cvar into the 272-byte legacy vmCvar_t layout and return `void`.
/// Writes the index, modification count, float32 value bits, and integer at byte offsets 0, 4, 8, and 12.
/// The following 256 bytes contain the string with zero padding; encoded string payloads above 255 bytes
/// fail validation after the four header fields have already been written.
/// @param vm VM whose data memory contains the destination structure.
/// @param address Nonzero QVM pointer to at least VM_CVAR_SIZE writable bytes.
/// @param variable Host cvar exposing index, modificationCount, value, integer, and string.
function writeVmCvar(vm,address,variable)
  at=pointer(vm,address,VM_CVAR_SIZE,"vmCvar_t")
  n.writeU32(vm.data,at,variable.index);n.writeU32(vm.data,at+4,variable.modificationCount)
  n.writeU32(vm.data,at+8,n.floatBits(variable.value));n.writeU32(vm.data,at+12,variable.integer)
  data=bytes(variable.string);if len(data)>255 then return fail("cvar string exceeds vmCvar_t") end if
  for index=0 to 255 vm.data[at+16+index]=0 end for
  if len(data)>0 then copyBytes(vm.data,at+16,data,0,len(data)) end if
  return void
end function

/// Register cvar in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function registerCvar(vm,base,host)
  registry=requireCvars(host);target=argument(vm,base,1)
  variable=cvar.get(registry,readString(vm,argument(vm,base,2)),readString(vm,argument(vm,base,3)),argument(vm,base,4))
  if target!=0 then writeVmCvar(vm,target,variable) end if
  return 0
end function

/// Update cvar in vm.syscall_common; the normal completion returns `0`.
/// @param vm Record exposing `data`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function updateCvar(vm,base,host)
  registry=requireCvars(host);target=argument(vm,base,1);at=pointer(vm,target,VM_CVAR_SIZE,"vmCvar_t")
  handle=n.readI32(vm.data,at)
  if handle<0 or handle>=registry.numIndexes then return fail("vmCvar_t handle out of range") end if
  variable=registry.indexes[handle]
  if n.readI32(vm.data,at+4)!=variable.modificationCount then writeVmCvar(vm,target,variable) end if
  return 0
end function

/// Compute cvar set in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarSet(vm,base,host)
  cvar.set(requireCvars(host),readString(vm,argument(vm,base,1)),readString(vm,argument(vm,base,2)));return 0
end function

/// Return `mq3.qcommon.cvar.variableIntegerValue(requireCvars(host), readString(vm, argument(vm, base, 1)))` from `vm.syscall_common.cvarInteger`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarInteger(vm,base,host)
  return cvar.variableIntegerValue(requireCvars(host),readString(vm,argument(vm,base,1)))
end function

/// Return `mq3.compat.numeric.i32(n.floatBits(cvar.variableValue(requireCvars(host), readString(vm, argument(vm, base, 1)))))` from `vm.syscall_common.cvarValueBits`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarValueBits(vm,base,host)
  return n.i32(n.floatBits(cvar.variableValue(requireCvars(host),readString(vm,argument(vm,base,1)))))
end function

/// Compute cvar string in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarString(vm,base,host)
  text=cvar.variableString(requireCvars(host),readString(vm,argument(vm,base,1)))
  writeBuffer(vm,argument(vm,base,2),argument(vm,base,3),text,"cvar output");return 0
end function

/// Compute cvar set value in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarSetValue(vm,base,host)
  cvar.setValue(requireCvars(host),readString(vm,argument(vm,base,1)),n.bitsFloat(argument(vm,base,2)));return 0
end function
/// Compute cvar reset in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarReset(vm,base,host)
  cvar.reset(requireCvars(host),readString(vm,argument(vm,base,1)));return 0
end function
/// Compute cvar create in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarCreate(vm,base,host)
  cvar.get(requireCvars(host),readString(vm,argument(vm,base,1)),readString(vm,argument(vm,base,2)),argument(vm,base,3));return 0
end function
/// Compute cvar info string in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Host passed as `host` to `mq3.vm.syscall_common.requireCvars`.
function cvarInfoString(vm,base,host)
  text=cvar.infoString(requireCvars(host),argument(vm,base,1))
  writeBuffer(vm,argument(vm,base,2),argument(vm,base,3),text,"cvar info output");return 0
end function

/// Compute argc in vm.syscall_common; the normal completion returns `command.argc(host.commands)`.
/// @param host Record exposing `commands`.
function argc(host)
  if host.commands==void then return fail("command service unavailable") end if
  return command.argc(host.commands)
end function

/// Compute argv in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Record exposing `commands`.
function argv(vm,base,host)
  if host.commands==void then return fail("command service unavailable") end if
  text=command.argv(host.commands,argument(vm,base,1))
  writeBuffer(vm,argument(vm,base,2),argument(vm,base,3),text,"argv output");return 0
end function

/// Compute args text in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.writeBuffer`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Record exposing `commands`.
function argsText(vm,base,host)
  if host.commands==void then return fail("command service unavailable") end if
  writeBuffer(vm,argument(vm,base,1),argument(vm,base,2),command.args(host.commands),"args output");return 0
end function

/// Open a host file and return the callback's length/status result to the VM.
/// Reads argument slots 1..3 as path pointer, optional handle-output pointer, and open mode.
/// A `void` callback result becomes handle 0 and result -1. With no handle-output pointer, a nonzero
/// opened handle is closed when `closeFn` is available; the length/status result is still returned.
/// @param vm VM providing the path string and an optional writable four-byte handle slot.
/// @param base Byte offset of the syscall argument vector, whose slot zero holds the trap number.
/// @param host Services with `openFn(context, path, mode)` and optional `closeFn(context, handle)`.
function fsOpen(vm,base,host)
  if host.openFn==void then return fail("file open service unavailable") end if
  target=argument(vm,base,2);if target!=0 then pointer(vm,target,4,"file handle output") end if
  result=host.openFn(host.context,readString(vm,argument(vm,base,1)),argument(vm,base,3))
  if result==void then result=OpenResult(0,-1) end if
  if target!=0 then
    n.writeU32(vm.data,target & vm.mask,result.handle)
  else
    if result.handle!=0 and host.closeFn!=void then host.closeFn(host.context,result.handle) end if
  end if
  return result.length
end function

/// Read an exact byte count from a host file into VM memory and return zero.
/// Argument slots 1..3 contain destination pointer, requested byte count, and file handle.
/// The callback must return at least the requested count; a short result is a syscall error.
/// @param vm VM containing the writable destination span and syscall argument vector.
/// @param base Byte offset of the syscall argument vector.
/// @param host Services with `readFn(context, handle, count)` returning source bytes.
function fsRead(vm,base,host)
  if host.readFn==void then return fail("file read service unavailable") end if
  count=argument(vm,base,2);data=host.readFn(host.context,argument(vm,base,3),count)
  writeRaw(vm,argument(vm,base,1),data,count,"file read output");return 0
end function

/// Pass a checked byte slice from VM memory to the host file writer and return zero.
/// Argument slots 1..3 contain source pointer, byte count, and file handle. The callback's return value
/// is ignored; this trap does not return a partial-write count.
/// @param vm VM containing the source byte span and syscall argument vector.
/// @param base Byte offset of the syscall argument vector.
/// @param host Services with `writeFn(context, handle, data)` handling the outgoing bytes.
function fsWrite(vm,base,host)
  if host.writeFn==void then return fail("file write service unavailable") end if
  count=argument(vm,base,2);at=pointer(vm,argument(vm,base,1),count,"file write input")
  host.writeFn(host.context,argument(vm,base,3),slice(vm.data,at,count));return 0
end function

/// Close the host file handle in argument slot one and return zero.
/// A missing close callback produces a syscall error.
/// @param vm VM containing the syscall argument vector.
/// @param base Byte offset of the syscall argument vector.
/// @param host Services with `closeFn(context, handle)`; its result is ignored.
function fsClose(vm,base,host)
  if host.closeFn==void then return fail("file close service unavailable") end if
  host.closeFn(host.context,argument(vm,base,1));return 0
end function

/// Emit print in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Record exposing `printFn`, `errorFn`, `context`.
/// @param isError Is error operand used by `emitPrint`; its reads are shown in the implementation.
function emitPrint(vm,base,host,isError)
  text=readString(vm,argument(vm,base,1));callback=host.printFn
  if isError then callback=host.errorFn end if
  if callback==void then return fail("console service unavailable") end if
  callback(host.context,text);return 0
end function

/// Execute console in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param host Record exposing `consoleFn`, `context`.
function executeConsole(vm,base,host)
  if host.consoleFn==void then return fail("console command service unavailable") end if
  host.consoleFn(host.context,argument(vm,base,1),readString(vm,argument(vm,base,2)));return 0
end function

/// Fill a checked VM memory span with the low eight bits of the requested value.
/// Argument slots 1..3 contain destination pointer, fill value, and byte count. Returns the original
/// destination pointer value; even a zero count requires a valid nonzero pointer.
/// @param vm VM whose data-memory bytes are modified.
/// @param base Byte offset of the memset syscall argument vector.
function libcMemset(vm,base)
  destination=argument(vm,base,1);value=argument(vm,base,2)&255;count=argument(vm,base,3)
  at=pointer(vm,destination,count,"memset destination")
  if count>0 then for index=0 to count-1 vm.data[at+index]=value end for end if
  return destination
end function

/// Copy a checked VM memory span through a temporary byte buffer, preserving overlapping-source data.
/// Argument slots 1..3 contain destination pointer, source pointer, and byte count. Returns the original
/// destination pointer value after copying exactly the requested number of bytes.
/// @param vm VM containing both memory spans.
/// @param base Byte offset of the memcpy syscall argument vector.
function libcMemcpy(vm,base)
  destination=argument(vm,base,1);source=argument(vm,base,2);count=argument(vm,base,3)
  target=pointer(vm,destination,count,"memcpy destination");sourceAt=pointer(vm,source,count,"memcpy source")
  // Keep the host boundary deterministic even when a module passes overlapping spans.
  temporary=slice(vm.data,sourceAt,count)
  if count>0 then copyBytes(vm.data,target,temporary,0,count) end if
  return destination
end function

/// Copy up to a fixed number of bytes from a VM string, zero-padding after the first terminator.
/// Argument slots 1..3 contain destination pointer, source pointer, and byte count. Returns the original
/// destination pointer. If no zero byte occurs within the count, the output has no added terminator.
/// Both pointers are validated even when the count is zero; the source is checked as each byte is read.
/// @param vm VM containing the source string and destination span.
/// @param base Byte offset of the strncpy syscall argument vector.
function libcStrncpy(vm,base)
  destination=argument(vm,base,1);source=argument(vm,base,2);count=argument(vm,base,3)
  target=pointer(vm,destination,count,"strncpy destination");sourceAt=pointer(vm,source,1,"strncpy source")
  terminated=false
  if count>0 then for index=0 to count-1
    value=0
    if not terminated then
      if sourceAt+index>=len(vm.data) then return fail("strncpy source outside VM memory") end if
      value=vm.data[sourceAt+index];if value==0 then terminated=true end if
    end if
    vm.data[target+index]=value
  end for end if
  return destination
end function

/// Return `mq3.compat.numeric.i32(n.floatBits(value))` from `vm.syscall_common.floatResult`.
/// @param value Floating-point value to narrow and reinterpret.
function floatResult(value) return n.i32(n.floatBits(value)) end function

/// Read consecutive little-endian float32 values from VM memory into a MiniLang numeric array.
/// The checked memory span occupies `count * 4` bytes.
/// @param vm VM whose data memory contains the packed float32 values.
/// @param address Nonzero QVM pointer to the first component.
/// @param count Number of float32 components to read, not a byte count.
/// @param label Vector name included in memory-validation diagnostics.
function readFloatVector(vm,address,count,label)
  at=pointer(vm,address,count*4,label);result=array(count,0.0)
  index=0
  while index<count
    result[index]=n.bitsFloat(n.readU32(vm.data,at+index*4));index=index+1
  end while
  return result
end function
/// Write a numeric array as consecutive little-endian float32 values and return `void`.
/// An address of zero intentionally skips the write, allowing optional vector outputs such as AngleVectors.
/// Otherwise the destination must hold four bytes per input component.
/// @param vm VM whose data-memory buffer receives the packed components.
/// @param address Optional output QVM pointer; zero means no output requested.
/// @param values Numeric components narrowed to float32 before serialization.
/// @param label Vector name included in memory-validation diagnostics.
function writeFloatVector(vm,address,values,label)
  if address==0 then return void end if
  at=pointer(vm,address,len(values)*4,label);for index=0 to len(values)-1 n.writeU32(vm.data,at+index*4,n.floatBits(values[index])) end for;return void
end function

/// Compute matrix multiply in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function matrixMultiply(vm,base)
  left=readFloatVector(vm,argument(vm,base,1),9,"matrix left");right=readFloatVector(vm,argument(vm,base,2),9,"matrix right");values=[]
  for row=0 to 2 for column=0 to 2
    values=values+[left[row*3]*right[column]+left[row*3+1]*right[3+column]+left[row*3+2]*right[6+column]]
  end for end for
  writeFloatVector(vm,argument(vm,base,3),values,"matrix output");return 0
end function
/// Compute angle vectors in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function angleVectors(vm,base)
  vectors=qmath.AngleVectors(readFloatVector(vm,argument(vm,base,1),3,"angles"))
  writeFloatVector(vm,argument(vm,base,2),vectors[0],"forward");writeFloatVector(vm,argument(vm,base,3),vectors[1],"right");writeFloatVector(vm,argument(vm,base,4),vectors[2],"up");return 0
end function
/// Compute perpendicular vector in vm.syscall_common; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function perpendicularVector(vm,base)
  source=readFloatVector(vm,argument(vm,base,2),3,"perpendicular source");axis=0
  if source[1]*source[1]<source[axis]*source[axis] then axis=1 end if;if source[2]*source[2]<source[axis]*source[axis] then axis=2 end if
  seed=[0.0,0.0,0.0];seed[axis]=1.0;dot=seed[0]*source[0]+seed[1]*source[1]+seed[2]*source[2]
  values=[seed[0]-dot*source[0],seed[1]-dot*source[1],seed[2]-dot*source[2]];length=trans.sqrt(values[0]*values[0]+values[1]*values[1]+values[2]*values[2])
  if length!=0.0 then values=[values[0]/length,values[1]/length,values[2]/length] end if;writeFloatVector(vm,argument(vm,base,1),values,"perpendicular output");return 0
end function

/// Dispatch a QVM memory, scalar-math, or vector-math compatibility trap.
/// Opcodes 100..106 share the memory/trigonometry mappings. Later opcodes depend on the selected ABI;
/// floating results are returned as signed int32 containers of float32 bits. Unsupported combinations fail.
/// @param abi ABI_QAGAME, ABI_CGAME, or ABI_UI, selecting the ABI-specific tail of the trap table.
/// @param vm VM whose argument vector and memory spans are consumed by the selected trap.
/// @param base Byte offset of the syscall argument vector.
/// @param op Trap number already read from argument slot zero.
function dispatchLibc(abi,vm,base,op)
  switch op
    case 100 return libcMemset(vm,base) end case
    case 101 return libcMemcpy(vm,base) end case
    case 102 return libcStrncpy(vm,base) end case
    case 103 return floatResult(trans.sin(n.bitsFloat(argument(vm,base,1)))) end case
    case 104 return floatResult(trans.cos(n.bitsFloat(argument(vm,base,1)))) end case
    case 105 return floatResult(trans.atan2(n.bitsFloat(argument(vm,base,1)),n.bitsFloat(argument(vm,base,2)))) end case
    case 106 return floatResult(trans.sqrt(n.bitsFloat(argument(vm,base,1)))) end case
  end switch
  if abi==ABI_QAGAME then
    if op==107 then return matrixMultiply(vm,base) end if;if op==108 then return angleVectors(vm,base) end if;if op==109 then return perpendicularVector(vm,base) end if
    if op==110 then return floatResult(floor(n.bitsFloat(argument(vm,base,1)))) end if;if op==111 then return floatResult(ceil(n.bitsFloat(argument(vm,base,1)))) end if
    if op==112 or op==113 then return 0 end if
  else
    if op==107 then return floatResult(floor(n.bitsFloat(argument(vm,base,1)))) end if;if op==108 then return floatResult(ceil(n.bitsFloat(argument(vm,base,1)))) end if
    if op==109 or op==110 then return 0 end if
    if op==111 and abi==ABI_CGAME then return floatResult(acos(n.bitsFloat(argument(vm,base,1)))) end if
  end if
  return fail("unsupported VM libc trap "+str(op))
end function

/// Dispatch a shared server-game console, cvar, command, clock, or file-system trap.
/// Returns the selected service's ABI result: zero for side-effect traps, an integer/bit-pattern value,
/// or a file-open length/status result. Unknown trap numbers produce a subsystem-specific syscall error.
/// @param vm VM containing the argument vector and any input/output memory spans.
/// @param base Byte offset of the syscall argument vector.
/// @param host Shared Services providing the registry, command parser, and callbacks needed by the trap.
/// @param op Server-game trap number already read from argument slot zero.
function dispatchQagame(vm,base,host,op)
  switch op
    case 0 return emitPrint(vm,base,host,false) end case
    case 1 return emitPrint(vm,base,host,true) end case
    case 2 if host.millisecondsFn==void then return fail("clock service unavailable") end if;return host.millisecondsFn(host.context) end case
    case 3 return registerCvar(vm,base,host) end case
    case 4 return updateCvar(vm,base,host) end case
    case 5 return cvarSet(vm,base,host) end case
    case 6 return cvarInteger(vm,base,host) end case
    case 7 return cvarString(vm,base,host) end case
    case 8 return argc(host) end case
    case 9 return argv(vm,base,host) end case
    case 10 return fsOpen(vm,base,host) end case
    case 11 return fsRead(vm,base,host) end case
    case 12 return fsWrite(vm,base,host) end case
    case 13 return fsClose(vm,base,host) end case
    case 14 return executeConsole(vm,base,host) end case
  end switch
  return fail("unsupported qagame trap "+str(op))
end function

/// Dispatch a shared client-game console, cvar, command, clock, or file-system trap.
/// Returns the selected service's ABI result: zero for side-effect traps, an integer/bit-pattern value,
/// or a file-open length/status result. Unknown trap numbers produce a subsystem-specific syscall error.
/// @param vm VM containing the argument vector and any input/output memory spans.
/// @param base Byte offset of the syscall argument vector.
/// @param host Shared Services providing the registry, command parser, and callbacks needed by the trap.
/// @param op Client-game trap number already read from argument slot zero.
function dispatchCgame(vm,base,host,op)
  if op<=5 then return dispatchQagame(vm,base,host,op) end if
  switch op
    case 6 return cvarString(vm,base,host) end case
    case 7 return argc(host) end case
    case 8 return argv(vm,base,host) end case
    case 9 return argsText(vm,base,host) end case
    case 10 return fsOpen(vm,base,host) end case
    case 11 return fsRead(vm,base,host) end case
    case 12 return fsWrite(vm,base,host) end case
    case 13 return fsClose(vm,base,host) end case
    case 14 return executeConsole(vm,base,host) end case
  end switch
  return fail("unsupported cgame trap "+str(op))
end function

/// Dispatch a shared user-interface console, cvar, command, clock, or file-system trap.
/// Returns the selected service's ABI result: zero for side-effect traps, an integer/bit-pattern value,
/// or a file-open length/status result. Unknown trap numbers produce a subsystem-specific syscall error.
/// @param vm VM containing the argument vector and any input/output memory spans.
/// @param base Byte offset of the syscall argument vector.
/// @param host Shared Services providing the registry, command parser, and callbacks needed by the trap.
/// @param op User-interface trap number already read from argument slot zero.
function dispatchUi(vm,base,host,op)
  switch op
    case 0 return emitPrint(vm,base,host,true) end case
    case 1 return emitPrint(vm,base,host,false) end case
    case 2 if host.millisecondsFn==void then return fail("clock service unavailable") end if;return host.millisecondsFn(host.context) end case
    case 3 return cvarSet(vm,base,host) end case
    case 4 return cvarValueBits(vm,base,host) end case
    case 5 return cvarString(vm,base,host) end case
    case 6 return cvarSetValue(vm,base,host) end case
    case 7 return cvarReset(vm,base,host) end case
    case 8 return cvarCreate(vm,base,host) end case
    case 9 return cvarInfoString(vm,base,host) end case
    case 10 return argc(host) end case
    case 11 return argv(vm,base,host) end case
    case 12 return executeConsole(vm,base,host) end case
    case 13 return fsOpen(vm,base,host) end case
    case 14 return fsRead(vm,base,host) end case
    case 15 return fsWrite(vm,base,host) end case
    case 16 return fsClose(vm,base,host) end case
    case 50 return registerCvar(vm,base,host) end case
    case 51 return updateCvar(vm,base,host) end case
  end switch
  return fail("unsupported UI trap "+str(op))
end function

/// Read a QVM trap number and route it to the shared libc or selected subsystem dispatcher.
/// Validates the host/VM context and argument-vector access first. Opcodes 100..113 use the libc table;
/// other opcodes use the selected server-game, client-game, or UI table. Returns that trap's ABI result
/// or a syscall error for missing services, invalid memory, or unsupported dispatch.
/// @param abi ABI selector expected to be ABI_QAGAME, ABI_CGAME, or ABI_UI.
/// @param host Shared Services whose callbacks receive `host.context` as their first argument.
/// @param vm VM exposing a data-memory byte buffer and pointer mask.
/// @param base Byte offset of the syscall vector; slot zero is the trap number, followed by four-byte arguments.
function dispatch(abi,host,vm,base)
  if host==void or vm==void or typeof(vm.data)!="bytes" then return fail("invalid dispatcher context") end if
  op=argument(vm,base,0)
  if op>=100 and op<=113 then return dispatchLibc(abi,vm,base,op) end if
  if abi==ABI_QAGAME then return dispatchQagame(vm,base,host,op) end if
  if abi==ABI_CGAME then return dispatchCgame(vm,base,host,op) end if
  if abi==ABI_UI then return dispatchUi(vm,base,host,op) end if
  return fail("unknown ABI")
end function

/// Capture an ABI and service bundle in a VM-compatible syscall callback.
/// Returns a function `(vm, base)` that forwards to `dispatch`; `base` is a byte offset inside VM memory.
/// @param abi ABI_QAGAME, ABI_CGAME, or ABI_UI for the loaded module.
/// @param host Shared Services retained by the returned callback.
function callback(abi,host)
  return function(vm,base) => dispatch(abi,host,vm,base)
end function
