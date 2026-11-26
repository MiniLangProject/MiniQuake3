// SPDX-License-Identifier: GPL-2.0-or-later
// Small Windows Imaging Component adapter for JPEG assets used by the preview.
package mq3.platform.playable_jpeg
import mq3.compat.numeric as n

/// Reads JPEG dimensions through the native WIC decoder.
/// @param data Read-only encoded JPEG bytes.
/// @param size Encoded JPEG length in bytes.
/// @param metadata Writable eight-byte buffer receiving little-endian 32-bit width and height.
/// @returns 1 when width and height are written; 0 when the image or output is invalid.
extern function jpegInfoNative(data as ptr,size as i32,metadata as ptr) from "playable_window.dll" symbol "playable_window_jpeg_info" returns i32
/// Decodes JPEG input into caller-owned RGBA pixel storage.
/// @param data Read-only encoded JPEG bytes.
/// @param size Encoded JPEG length in bytes.
/// @param rgba Writable destination for decoded RGBA pixels.
/// @param capacity Capacity of the RGBA destination in bytes.
/// @returns 1 on successful decoding; 0 on invalid input, insufficient storage, or decoder failure.
extern function jpegDecodeNative(data as ptr,size as i32,rgba as ptr,capacity as i32) from "playable_window.dll" symbol "playable_window_decode_jpeg" returns i32

/// Largest image width or height accepted by the decoder.
const MAX_DIMENSION=4096
/// Maximum decoded pixel count accepted by the image loader.
const MAX_PIXELS=16777216

/// Data record for `mq3.platform.playable_jpeg.Image`; groups `width`, `height`, `pixels`.
struct Image
  /// Width in pixels of the JPEG image returned by the native decoder.
  width
  /// Height in pixels of the JPEG image returned by the native decoder.
  height
  /// Decoded pixel data for the image or upload.
  pixels
end struct

/// Builds `mq3.platform.playable_jpeg.Image` for `mq3.platform.playable_jpeg.decode`.
/// @param data Input tested by `data==void or typeof(data)!="bytes" or len(data)<4`.
function decode(data)
  if data==void or typeof(data)!="bytes" or len(data)<4 then return error(7485,"JPEG: truncated input") end if
  metadata=bytes(8,0)
  if jpegInfoNative(nativeBytesPtr(data),len(data),nativeBytesPtr(metadata))==0 then return error(7485,"JPEG: Windows decoder rejected input") end if
  width=n.readU32(metadata,0);height=n.readU32(metadata,4)
  if width<1 or height<1 or width>MAX_DIMENSION or height>MAX_DIMENSION or width*height>MAX_PIXELS then return error(7485,"JPEG: invalid dimensions") end if
  pixels=bytes(width*height*4,0)
  if jpegDecodeNative(nativeBytesPtr(data),len(data),nativeBytesPtr(pixels),len(pixels))==0 then return error(7485,"JPEG: pixel decode failed") end if
  return Image(width,height,pixels)
end function
