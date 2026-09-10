// SPDX-License-Identifier: GPL-2.0-or-later
// Small Windows Imaging Component adapter for JPEG assets used by the preview.
package mq3.platform.playable_jpeg
import mq3.compat.numeric as n

extern function jpegInfoNative(data as ptr,size as i32,metadata as ptr) from "playable_window.dll" symbol "playable_window_jpeg_info" returns i32
extern function jpegDecodeNative(data as ptr,size as i32,rgba as ptr,capacity as i32) from "playable_window.dll" symbol "playable_window_decode_jpeg" returns i32

const MAX_DIMENSION=4096
const MAX_PIXELS=16777216

struct Image width height pixels end struct

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
