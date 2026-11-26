// SPDX-License-Identifier: GPL-2.0-or-later
// Byte-exact renderer fontInfo_t loader used by cgame and Team Arena UI QVMs.
package mq3.vm.font_abi

import mq3.format.pk3 as pk3
import mq3.compat.numeric as n

const GLYPHS_PER_FONT=256
const GLYPH_SIZE=80
const GLYPH_HANDLE_OFFSET=44
const GLYPH_SHADER_OFFSET=48
const GLYPH_SHADER_BYTES=32
const GLYPH_SCALE_OFFSET=20480
const FONT_NAME_OFFSET=20484
const FONT_NAME_BYTES=64
const FONT_INFO_SIZE=20548

/// Cached record for vm.font_abi, containing `pointSize`, `data`, `registeredGlyphs`, `path`.
struct Cached pointSize data registeredGlyphs path end struct
/// Registry record for vm.font_abi, containing `archive`, `fonts`.
struct Registry archive fonts end struct
/// Result record for vm.font_abi, containing `found`, `data`, `registeredGlyphs`, `path`.
struct Result found data registeredGlyphs path end struct

/// Create the vm.font_abi error for `fail` with 7690 and the supplied diagnostic text.
/// @param message Message used in `("font ABI: " + message)` and `error(7690, ("font ABI: " + message))`.
function fail(message) return error(7690,"font ABI: "+message) end function
/// Create `mq3.vm.font_abi.Registry` with archive=archive; fonts=[].
/// @param archive Initial `archive` field stored in the returned or constructed `mq3.vm.font_abi.Registry` record.
function create(archive) return Registry(archive,[]) end function
/// Compute path for in vm.font_abi; the normal completion returns `(("fonts/fontImage_" + str(pointSize)) + ".dat")`.
/// @param pointSize Point size used in `str(pointSize)` and `(pointSize <= 0)`.
function pathFor(pointSize) if pointSize<=0 then pointSize=12 end if;return "fonts/fontImage_"+str(pointSize)+".dat" end function
/// Compute c string in vm.font_abi; the normal completion returns `decode(slice(data, offset, count))`.
/// @param data Data used in `data[(offset + count)]` and `slice(data, offset, count)`.
/// @param offset Offset used in `(offset + count)` and `data[(offset + count)]`.
/// @param capacity Capacity used in `(count < capacity)` and `((count < capacity) and (data[(offset + count)] != 0))`.
function cString(data,offset,capacity)
  count=0;while count<capacity and data[offset+count]!=0 count=count+1 end while
  return decode(slice(data,offset,count))
end function
/// Compute cached in vm.font_abi.
/// @param registry Record exposing `fonts`.
/// @param pointSize Point size used in `(item.pointSize == pointSize)`.
function cached(registry,pointSize)
  if len(registry.fonts)==0 then return void end if
  for each item in registry.fonts if item.pointSize==pointSize then return item end if end for
  return void
end function
/// Write name in vm.font_abi; updates `data entries`.
///
/// Direct state writes: `data elements`.
/// @param data Mutable sequence written at `(FONT_NAME_OFFSET + index)`.
/// @param name Name used in `bytes(name)`.
function writeName(data,name)
  encoded=bytes(name);limit=len(encoded);if limit>=FONT_NAME_BYTES then limit=FONT_NAME_BYTES-1 end if
  for index=0 to FONT_NAME_BYTES-1 data[FONT_NAME_OFFSET+index]=0 end for
  if limit>0 then copyBytes(data,FONT_NAME_OFFSET,encoded,0,limit) end if
  return void
end function
/// Load font abi in vm.font_abi; the normal completion returns `Result(true, data, registered, path)`.
///
/// Direct state writes: `registry.fonts`.
/// @param registry Record exposing `archive`, `fonts`. Updated in place: `fonts`.
/// @param shaderContext Shader context used in `registerShaderFn(shaderContext, shader)`.
/// @param registerShaderFn Callback invoked for register shader; the call sites below define the callback arguments.
/// @param fontName Reserved argument; this implementation does not read its value.
/// @param pointSize Point size passed as `pointSize` to `mq3.vm.font_abi.cached`.
function load(registry,shaderContext,registerShaderFn,fontName,pointSize)
  if registry==void or registry.archive==void or registerShaderFn==void then return fail("registry and shader callback are required") end if
  if pointSize<=0 then pointSize=12 end if
  previous=cached(registry,pointSize);if previous!=void then return Result(true,previous.data,previous.registeredGlyphs,previous.path) end if
  path=pathFor(pointSize);source=try(pk3.read(registry.archive,path));if source is error then return Result(false,void,0,path) end if
  if len(source)!=FONT_INFO_SIZE then return fail("invalid "+path+" size "+str(len(source))) end if
  data=slice(source,0,len(source));registered=0
  // tr_font.c intentionally re-registers glyphs 0..254 from cached .dat files.
  for glyph=0 to GLYPHS_PER_FONT-2
    offset=glyph*GLYPH_SIZE;shader=cString(data,offset+GLYPH_SHADER_OFFSET,GLYPH_SHADER_BYTES)
    handle=0;if shader!="" then handle=registerShaderFn(shaderContext,shader);registered=registered+1 end if
    n.writeU32(data,offset+GLYPH_HANDLE_OFFSET,handle)
  end for
  writeName(data,path);entry=Cached(pointSize,data,registered,path);registry.fonts=registry.fonts+[entry]
  return Result(true,data,registered,path)
end function
