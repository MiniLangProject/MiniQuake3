// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// TGA pixel path from renderer/tr_image.c LoadTGA, with checked byte access.
package mq3.renderer.tga
import mq3.compat.numeric as n

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

function putSourcePixel(output,sourceIndex,width,height,red,green,blue,alpha)
  sourceRow=n.quotient(sourceIndex,width)
  column=sourceIndex-sourceRow*width
  target=((height-1-sourceRow)*width+column)*4
  output[target]=red;output[target+1]=green;output[target+2]=blue;output[target+3]=alpha
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
  red=0;green=0;blue=0;alpha=255

  if imageType==TYPE_TRUECOLOR or imageType==TYPE_GRAYSCALE then
    needed=count*bytesPerPixel
    if needed>len(data)-offset then return fail("truncated pixel data") end if
    for sourceIndex=0 to count-1
      if pixelSize==8 then
        blue=data[offset];green=blue;red=blue;alpha=255
      else if pixelSize==24 then
        blue=data[offset];green=data[offset+1];red=data[offset+2];alpha=255
      else
        blue=data[offset];green=data[offset+1];red=data[offset+2];alpha=data[offset+3]
      end if
      offset=offset+bytesPerPixel
      putSourcePixel(output,sourceIndex,width,height,red,green,blue,alpha)
    end for
  else
    sourceIndex=0
    while sourceIndex<count
      if offset>=len(data) then return fail("truncated RLE packet header") end if
      packetHeader=data[offset];offset=offset+1
      packetSize=1+(packetHeader&127)
      if packetSize>count-sourceIndex then return fail("RLE packet exceeds image") end if
      if (packetHeader&128)!=0 then
        if bytesPerPixel>len(data)-offset then return fail("truncated RLE run pixel") end if
        blue=data[offset];green=data[offset+1];red=data[offset+2];alpha=255
        if pixelSize==32 then alpha=data[offset+3] end if
        offset=offset+bytesPerPixel
        for packetIndex=0 to packetSize-1
          putSourcePixel(output,sourceIndex,width,height,red,green,blue,alpha);sourceIndex=sourceIndex+1
        end for
      else
        needed=packetSize*bytesPerPixel
        if needed>len(data)-offset then return fail("truncated RLE raw packet") end if
        for packetIndex=0 to packetSize-1
          blue=data[offset];green=data[offset+1];red=data[offset+2];alpha=255
          if pixelSize==32 then alpha=data[offset+3] end if
          offset=offset+bytesPerPixel
          putSourcePixel(output,sourceIndex,width,height,red,green,blue,alpha);sourceIndex=sourceIndex+1
        end for
      end if
    end while
  end if
  return Image(width,height,output,(attributes&32)!=0)
end function
