// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// TGA pixel path from renderer/tr_image.c LoadTGA, with checked byte access.
package mq3.renderer.tga
extern function decodePixels(input as bytes,inputBytes as i32,offset as i32,width as i32,height as i32,pixelBytes as i32,rle as i32,output as bytes,outputBytes as i32) from "playable_window.dll" symbol "playable_decode_tga_pixels" returns i32

const TYPE_TRUECOLOR=2
const TYPE_GRAYSCALE=3
const TYPE_RLE_TRUECOLOR=10
const MAX_DIMENSION=16384
const MAX_PIXELS=67108864

struct Image width height pixels topDownDeclared end struct

function fail(message)
  return error(7120,"TGA: "+message)
end function

function u16(data,offset)
  return data[offset]|(data[offset+1]<<8)
end function

function pixelBytes(pixelSize)
  if pixelSize==8 then return 1 end if
  if pixelSize==24 then return 3 end if
  if pixelSize==32 then return 4 end if
  return 0
end function

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
