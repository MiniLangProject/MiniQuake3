// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// TGA pixel path from renderer/tr_image.c LoadTGA, with checked byte access.
package mq3.renderer.tga
/// Decodes bounded TGA pixel packets into RGBA output, including RLE and orientation handling.
/// @param input Read-only encoded TGA image bytes.
/// @param inputBytes Encoded input-buffer length in bytes.
/// @param offset Byte offset where TGA pixel data begins.
/// @param width Width of the image, surface, or viewport in pixels.
/// @param height Height of the image, surface, or viewport in pixels.
/// @param pixelBytes Bytes per encoded source pixel.
/// @param rle Nonzero selects TGA run-length packet decoding.
/// @param output Writable RGBA8 pixel buffer.
/// @param outputBytes Capacity of the native output buffer in bytes.
/// @returns 1 on success; negative codes identify invalid bounds, unsupported pixels, output overflow, or truncated packets.
extern function decodePixels(input as bytes,inputBytes as i32,offset as i32,width as i32,height as i32,pixelBytes as i32,rle as i32,output as bytes,outputBytes as i32) from "playable_window.dll" symbol "playable_decode_tga_pixels" returns i32

/// TGA image type for uncompressed true-color pixels.
const TYPE_TRUECOLOR=2
/// TGA image type for uncompressed grayscale pixels.
const TYPE_GRAYSCALE=3
/// TGA image type for run-length-encoded true-color pixels.
const TYPE_RLE_TRUECOLOR=10
/// Largest image width or height accepted by the decoder.
const MAX_DIMENSION=16384
/// Maximum decoded pixel count accepted by the image loader.
const MAX_PIXELS=67108864

/// Data record for `mq3.renderer.tga.Image`; groups `width`, `height`, `pixels`, `topDownDeclared`.
struct Image
  /// Width in pixels of the decoded TGA pixel array.
  width
  /// Height in pixels of the decoded TGA pixel array.
  height
  /// Decoded pixel data for the image or upload.
  pixels
  /// Whether the image header declares a top-to-bottom pixel order.
  topDownDeclared
end struct

/// Creates error `7120` with message `"TGA: "+message`.
/// @param message Input used in the result expression `error(7120,"TGA: "+message)`.
function fail(message)
  return error(7120,"TGA: "+message)
end function

/// Computes `data[offset]|(data[offset+1]<<8)` for `mq3.renderer.tga.u16`.
/// @param data Indexed input read at `offset`, `offset+1`.
/// @param offset Input used in the result expression `data[offset]|(data[offset+1]<<8)`.
function u16(data,offset)
  return data[offset]|(data[offset+1]<<8)
end function

/// Returns `0` from `mq3.renderer.tga.pixelBytes`; earlier branches return `1`, `3`, `4`.
/// @param pixelSize Input tested by `pixelSize==8`.
function pixelBytes(pixelSize)
  if pixelSize==8 then return 1 end if
  if pixelSize==24 then return 3 end if
  if pixelSize==32 then return 4 end if
  return 0
end function

/// Builds `mq3.renderer.tga.Image` for `mq3.renderer.tga.decode`.
/// @param data Value forwarded as `data` to `mq3.renderer.tga.u16`.
function decode(data)
  if data==void or len(data)<18 then return fail("truncated header") end if
  idLength=data[0];colorMapType=data[1];imageType=data[2]
  width=u16(data,12);height=u16(data,14);pixelSize=data[16];attributes=data[17]
  if imageType!=TYPE_TRUECOLOR and imageType!=TYPE_GRAYSCALE and imageType!=TYPE_RLE_TRUECOLOR then return fail("unsupported image type") end if
  if colorMapType!=0 then return fail("colormaps are not supported") end if
  bytesPerPixel=pixelBytes(pixelSize)
  if imageType==TYPE_GRAYSCALE then
    if bytesPerPixel==0 then return fail("unsupported grayscale pixel size") end if
  else
    if pixelSize!=24 and pixelSize!=32 then return fail("truecolor images require 24 or 32 bits") end if
  end if
  if width<1 or height<1 or width>MAX_DIMENSION or height>MAX_DIMENSION then return fail("invalid dimensions") end if
  count=width*height
  if count>MAX_PIXELS then return fail("image is too large") end if
  offset=18+idLength
  if offset>len(data) then return fail("truncated image id") end if
  output=bytes(count*4,0)
  rle=0;if imageType==TYPE_RLE_TRUECOLOR then rle=1 end if
  status=decodePixels(data,len(data),offset,width,height,bytesPerPixel,rle,output,len(output))
  if status==-2 then return fail("truncated RLE packet header") end if
  if status==-3 then return fail("RLE packet exceeds image") end if
  if status==-4 then return fail("truncated RLE run pixel") end if
  if status==-5 then return fail("truncated RLE raw packet") end if
  if status==-6 then return fail("truncated pixel data") end if
  if status!=1 then return fail("invalid pixel buffers") end if
  return Image(width,height,output,(attributes&32)!=0)
end function
