// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side RGBA processing from renderer/tr_image.c.
package mq3.renderer.image_processing
import mq3.compat.numeric as n

const MAX_RESAMPLE_WIDTH=2048

/// Creates error `7160` with message `"image processing: "+message`.
/// @param message Input used in the result expression `error(7160,"image processing: "+message)`.
function fail(message)
  return error(7160,"image processing: "+message)
end function

/// Validates positive RGBA image dimensions, overflow limits, and the available pixel-buffer length.
/// @param pixels Input tested by `pixels==void`.
/// @param width Input tested by `width<1 or height<1`.
/// @param height Input tested by `width<1 or height<1`.
function checkedPixels(pixels,width,height)
  if pixels==void then return fail("missing pixels") end if
  if width<1 or height<1 then return fail("invalid dimensions") end if
  if width*height>n.quotient(0x3fffffff,4) then return fail("image is too large") end if
  if len(pixels)<width*height*4 then return fail("truncated RGBA data") end if
  return 1
end function

/// Builds `output[i]` in `mq3.renderer.image_processing.copyPixels`; returns `output`.
/// @param pixels Indexed input read at `i`.
/// @param count Argument 1 supplied to `bytes`.
function copyPixels(pixels,count)
  output=bytes(count,0)
  for i=0 to count-1 output[i]=pixels[i] end for
  return output
end function

// Exact fixed-point sample positions and four-tap average from ResampleTexture.
/// @param pixels Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`.
/// @param inWidth Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`.
/// @param inHeight Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`.
/// @param outWidth Argument 2 supplied to `mq3.compat.numeric.quotient`.
/// @param outHeight Input tested by `outWidth<1 or outHeight<1`.
function resample(pixels,inWidth,inHeight,outWidth,outHeight)
  checkedPixels(pixels,inWidth,inHeight)
  if outWidth<1 or outHeight<1 then return fail("invalid output dimensions") end if
  if outWidth>MAX_RESAMPLE_WIDTH then return fail("maximum output width is 2048") end if
  fracStep=n.quotient(inWidth*0x10000,outWidth)
  p1=[];p2=[];frac=fracStep>>2
  for x=0 to outWidth-1 p1=p1+[frac>>16];frac=frac+fracStep end for
  frac=3*(fracStep>>2)
  for x=0 to outWidth-1 p2=p2+[frac>>16];frac=frac+fracStep end for
  output=bytes(outWidth*outHeight*4,0)
  for y=0 to outHeight-1
    row1=n.quotient((4*y+1)*inHeight,4*outHeight)*inWidth
    row2=n.quotient((4*y+3)*inHeight,4*outHeight)*inWidth
    for x=0 to outWidth-1
      a=(row1+p1[x])*4;b=(row1+p2[x])*4;c=(row2+p1[x])*4;d=(row2+p2[x])*4
      target=(y*outWidth+x)*4
      for channel=0 to 3
        output[target+channel]=(pixels[a+channel]+pixels[b+channel]+pixels[c+channel]+pixels[d+channel])>>2
      end for
    end for
  end for
  return output
end function

// R_LightScaleTexture with tables supplied by the renderer color-mapping owner.
/// @param pixels Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`.
/// @param width Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`.
/// @param height Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`.
/// @param onlyGamma Input tested by `onlyGamma`.
/// @param deviceSupportsGamma Input tested by `not deviceSupportsGamma`.
/// @param gammaTable Indexed input read at `value`.
/// @param intensityTable Indexed input read at `value`.
function lightScale(pixels,width,height,onlyGamma,deviceSupportsGamma,gammaTable,intensityTable)
  checkedPixels(pixels,width,height)
  if len(gammaTable)<256 or len(intensityTable)<256 then return fail("color table is truncated") end if
  output=copyPixels(pixels,width*height*4)
  for pixel=0 to width*height-1
    at=pixel*4
    for channel=0 to 2
      value=output[at+channel]
      if onlyGamma then
        if not deviceSupportsGamma then value=gammaTable[value] end if
      else
        value=intensityTable[value]
        if not deviceSupportsGamma then value=gammaTable[value] end if
      end if
      output[at+channel]=value
    end for
  end for
  return output
end function

// Simple R_MipMap path. The one-dimensional case follows its adjacent-pixel rule.
/// @param pixels Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`.
/// @param width Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`.
/// @param height Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`.
function mipMapSimple(pixels,width,height)
  checkedPixels(pixels,width,height)
  if width==1 and height==1 then return copyPixels(pixels,4) end if
  outWidth=width>>1;outHeight=height>>1
  if outWidth==0 or outHeight==0 then
    count=outWidth+outHeight;output=bytes(count*4,0)
    for i=0 to count-1
      source=i*8;target=i*4
      for channel=0 to 3 output[target+channel]=(pixels[source+channel]+pixels[source+4+channel])>>1 end for
    end for
    return output
  end if
  output=bytes(outWidth*outHeight*4,0);row=width*4
  for y=0 to outHeight-1
    for x=0 to outWidth-1
      source=y*2*row+x*8;target=(y*outWidth+x)*4
      for channel=0 to 3
        output[target+channel]=(pixels[source+channel]+pixels[source+4+channel]+pixels[source+row+channel]+pixels[source+row+4+channel])>>2
      end for
    end for
  end for
  return output
end function

/// Computes `value>0 and (value&(value-1))==0` for `mq3.renderer.image_processing.isPowerOfTwo`.
/// @param value Input used in the result expression `value>0 and (value&(value-1))==0`.
function isPowerOfTwo(value)
  return value>0 and (value&(value-1))==0
end function

// Proper linear R_MipMap2 filter with the original power-of-two wrapping masks.
/// @param pixels Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`.
/// @param width Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`.
/// @param height Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`.
function mipMapFiltered(pixels,width,height)
  checkedPixels(pixels,width,height)
  if width<2 or height<2 or not isPowerOfTwo(width) or not isPowerOfTwo(height) then return fail("filtered mipmaps require power-of-two dimensions of at least 2") end if
  outWidth=width>>1;outHeight=height>>1;output=bytes(outWidth*outHeight*4,0)
  weights=[1,2,2,1,2,4,4,2,2,4,4,2,1,2,2,1]
  for y=0 to outHeight-1
    for x=0 to outWidth-1
      target=(y*outWidth+x)*4
      for channel=0 to 3
        total=0;weightIndex=0
        for yy=-1 to 2
          sourceY=(y*2+yy)&(height-1)
          for xx=-1 to 2
            sourceX=(x*2+xx)&(width-1)
            total=total+weights[weightIndex]*pixels[(sourceY*width+sourceX)*4+channel]
            weightIndex=weightIndex+1
          end for
        end for
        output[target+channel]=n.quotient(total,36)
      end for
    end for
  end for
  return output
end function
