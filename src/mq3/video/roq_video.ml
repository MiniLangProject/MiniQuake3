// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3-compatible 32-bit RoQ codebook/VQ video decoder.
package mq3.video.roq_video

import mq3.format.roq as roq
import mq3.compat.numeric as numeric

/// Upper bound on dimension represented by mq3.video.roq_video.
const MAX_DIMENSION=1024
/// Frame record for video.roq_video, containing `width`, `height`, `pixels`, `number`.
struct Frame
  /// Image/frame width in pixels.
  width
  /// Image/frame height in pixels.
  height
  /// Decoded image/frame pixel data.
  pixels
  /// Sequence number of this decoded video frame.
  number
end struct
/// Decoder record for video.roq_video, containing `width`, `height`, `q2`, `q4`, `q8`, `buffers`, and 2 further fields.
struct Decoder
  /// Image/frame width in pixels.
  width
  /// Image/frame height in pixels.
  height
  /// RoQ codebook entries containing decoded 2-by-2 pixel blocks.
  q2
  /// RoQ codebook entries containing assembled 4-by-4 pixel blocks.
  q4
  /// RoQ codebook entries containing expanded 8-by-8 pixel blocks.
  q8
  /// Frame buffers retained for RoQ motion compensation and frame output.
  buffers
  /// Number of video frames decoded so far.
  frameCount
  /// Most recently decoded output frame.
  latest
end struct
/// Reader record for video.roq_video, containing `data`, `offset`, `limit`, `control`, `remaining`.
struct Reader
  /// Bytes of the current RoQ input chunk.
  data
  /// Byte cursor of the next unread RoQ chunk byte.
  offset
  /// Exclusive byte boundary of the current RoQ chunk reader.
  limit
  /// Packed RoQ block-control word currently being consumed.
  control
  /// Number of block-control codes still available in the current control word.
  remaining
end struct

/// Create the video.roq_video error for `fail` with 7691 and the supplied diagnostic text.
/// @param message Message used in `("RoQ video: " + message)` and `error(7691, ("RoQ video: " + message))`.
function fail(message) return error(7691,"RoQ video: "+message) end function
/// Create `mq3.video.roq_video.Decoder` with width=0; height=0; q2=array(256, void); q4=array(256, void); q8=array(256, void); buffers=[void, void]; frameCount=0; latest=void.
function create() return Decoder(0,0,array(256,void),array(256,void),array(256,void),[void,void],0,void) end function
/// Clamp 8 in video.roq_video; the normal completion returns `value`.
/// @param value Value used in `(value < 0)` and `(value > 255)`.
function clamp8(value) if value<0 then return 0 end if;if value>255 then return 255 end if;return value end function
/// Compute yuv in video.roq_video; the normal completion returns `[clamp8(((yy + vr) >> 6)), clamp8((((yy + ug) + vg) >> 6)), clamp8(((yy + ub) >> 6)), 255]`.
/// @param y Y used in `(y << 6)` and `(y >> 2)`.
/// @param u U used in `(2 * u)` and `((2 * u) - 255)`.
/// @param v V used in `(2 * v)` and `((2 * v) - 255)`.
function yuv(y,u,v)
  xU=2*u-255;xV=2*v-255;yy=(y<<6)|(y>>2)
  ub=numeric.trunc32(((1.772/2.0)*64.0+0.5)*xU+32.0);vr=numeric.trunc32(((1.402/2.0)*64.0+0.5)*xV+32.0)
  ug=numeric.trunc32((0.0-((0.34414/2.0)*64.0+0.5))*xU);vg=numeric.trunc32((0.0-((0.71414/2.0)*64.0+0.5))*xV+32.0)
  return [clamp8((yy+vr)>>6),clamp8((yy+ug+vg)>>6),clamp8((yy+ub)>>6),255]
end function
/// Compute video.roq_video.pixelCopy as `[value[0], value[1], value[2], value[3]]`.
/// @param value Value used in `value[0]` and `value[1]`.
function pixelCopy(value) return [value[0],value[1],value[2],value[3]] end function

/// Compute video.roq_video.build4 as `[a[0], a[1], b[0], b[1], a[2], a[3], b[2], b[3], c[0], c[1], d[0], d[1], c[2], c[3], d[2], d[3]]`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
/// @param c C used in `c[0]` and `c[1]`.
/// @param d D used in `d[0]` and `d[1]`.
function build4(a,b,c,d)
  return [a[0],a[1],b[0],b[1],a[2],a[3],b[2],b[3],c[0],c[1],d[0],d[1],c[2],c[3],d[2],d[3]]
end function
/// Build 8 in video.roq_video; the normal completion returns `result`.
/// @param a A operand used by `build8`; its reads are shown in the implementation.
/// @param b B operand used by `build8`; its reads are shown in the implementation.
/// @param c C operand used by `build8`; its reads are shown in the implementation.
/// @param d D operand used by `build8`; its reads are shown in the implementation.
function build8(a,b,c,d)
  result=array(64,void);sources=[a,b,c,d]
  for quadrant=0 to 3
    source=sources[quadrant];baseX=(quadrant&1)*4;baseY=(quadrant>>1)*4
    for y=0 to 3 for x=0 to 3 pixel=source[(y>>1)*2+(x>>1)];outX=baseX+x;outY=baseY+y;result[outY*8+outX]=pixel end for end for
  end for
  return result
end function

/// Decode codebook in video.roq_video; the normal completion returns `(two + four)`.
/// @param decoder Record exposing `q2`, `q4`, `q8`.
/// @param movie Record exposing `data`.
/// @param chunk Record exposing `flags`, `size`, `dataOffset`.
function decodeCodebook(decoder,movie,chunk)
  two=chunk.flags>>8;if two==0 then two=256 end if;four=chunk.flags&255;if chunk.flags==0 then four=256 end if
  if two*6>chunk.size then return fail("truncated codebook") end if
  availableFour=(chunk.size-two*6)/4;if four>availableFour then four=availableFour end if;offset=chunk.dataOffset
  for index=0 to two-1
    y0=movie.data[offset];y1=movie.data[offset+1];y2=movie.data[offset+2];y3=movie.data[offset+3];u=movie.data[offset+4];v=movie.data[offset+5];offset=offset+6
    decoder.q2[index]=[yuv(y0,u,v),yuv(y1,u,v),yuv(y2,u,v),yuv(y3,u,v)]
  end for
  for index=0 to four-1
    a=movie.data[offset];b=movie.data[offset+1];c=movie.data[offset+2];d=movie.data[offset+3];offset=offset+4
    if decoder.q2[a]==void or decoder.q2[b]==void or decoder.q2[c]==void or decoder.q2[d]==void then return fail("codebook references missing cell") end if
    decoder.q4[index]=build4(decoder.q2[a],decoder.q2[b],decoder.q2[c],decoder.q2[d]);decoder.q8[index]=build8(decoder.q2[a],decoder.q2[b],decoder.q2[c],decoder.q2[d])
  end for
  return two+four
end function

/// Set info in video.roq_video; the normal completion returns `[width, height]`.
///
/// Direct state writes: `decoder.width`, `decoder.height`, `decoder.buffers`, `decoder.frameCount`, `decoder.latest`.
/// @param decoder Updated in place: `width`, `height`, `buffers`, `frameCount`, `latest`.
/// @param movie Record exposing `data`.
/// @param chunk Record exposing `size`, `dataOffset`.
function setInfo(decoder,movie,chunk)
  if chunk.size<8 then return fail("short quad info") end if;at=chunk.dataOffset;width=roq.u16(movie.data,at);height=roq.u16(movie.data,at+2);maximum=roq.u16(movie.data,at+4);minimum=roq.u16(movie.data,at+6)
  if width<1 or height<1 or width>MAX_DIMENSION or height>MAX_DIMENSION or width%16!=0 or height%16!=0 then return fail("invalid dimensions") end if
  if maximum!=8 or minimum!=4 then return fail("unsupported block dimensions") end if
  decoder.width=width;decoder.height=height;decoder.buffers=[bytes(width*height*4,0),bytes(width*height*4,0)];decoder.frameCount=0;decoder.latest=void;return [width,height]
end function

/// Create `mq3.video.roq_video.Reader` with data=data; offset=offset; limit=(offset + size); control=0; remaining=0.
/// @param data Initial `data` field stored in the returned or constructed `mq3.video.roq_video.Reader` record.
/// @param offset Initial `offset` field stored in the returned or constructed `mq3.video.roq_video.Reader` record.
/// @param size Size used in `(offset + size)` and `Reader(data, offset, (offset + size), 0, 0)`.
function reader(data,offset,size) return Reader(data,offset,offset+size,0,0) end function
/// Update `value.control`, `value.offset`, `value.remaining` in video.roq_video; the normal completion returns `code`.
///
/// Direct state writes: `value.control`, `value.offset`, `value.remaining`.
/// @param value Record exposing `remaining`, `offset`, `limit`, `data`, `control`. Updated in place: `control`, `offset`, `remaining`.
function nextCode(value)
  if value.remaining==0 then if value.offset+2>value.limit then return fail("truncated VQ control word") end if;value.control=value.data[value.offset]|(value.data[value.offset+1]<<8);value.offset=value.offset+2;value.remaining=8 end if
  code=(value.control>>14)&3;value.control=(value.control<<2)&65535;value.remaining=value.remaining-1;return code
end function
/// Update `value.offset` in video.roq_video; the normal completion returns `result`.
///
/// Direct state writes: `value.offset`.
/// @param value Record exposing `offset`, `limit`, `data`. Updated in place: `offset`.
function nextByte(value) if value.offset>=value.limit then return fail("truncated VQ data") end if;result=value.data[value.offset];value.offset=value.offset+1;return result end function

/// Write block in video.roq_video; updates `buffer entries`.
///
/// Direct state writes: `buffer elements`.
/// @param buffer Mutable sequence written at `at`, `(at + 1)`, `(at + 2)`.
/// @param width Width used in `((y + row) * width)` and `((x + size) > width)`.
/// @param height Height used in `((y + size) > height)` and `((((x < 0) or (y < 0)) or ((x + size) > width)) or ((y + size) > height))`.
/// @param x X used in `(x < 0)` and `(x + size)`.
/// @param y Y used in `(y < 0)` and `(y + row)`.
/// @param size Size used in `(x + size)` and `(y + size)`.
/// @param pixels Pixels used in `len(pixels)` and `(pixels == void)`.
function writeBlock(buffer,width,height,x,y,size,pixels)
  if pixels==void or len(pixels)!=size*size then return fail("missing VQ cell") end if
  if x<0 or y<0 or x+size>width or y+size>height then return fail("VQ block outside frame") end if
  for row=0 to size-1 for column=0 to size-1 pixel=pixels[row*size+column];at=((y+row)*width+x+column)*4;buffer[at]=pixel[0];buffer[at+1]=pixel[1];buffer[at+2]=pixel[2];buffer[at+3]=pixel[3] end for end for
  return void
end function
/// Copy motion in video.roq_video; updates `destination entries`.
///
/// Direct state writes: `destination elements`.
/// @param destination Mutable sequence written at `(target + channel)`.
/// @param previous Previous used in `previous[(source + channel)]` and `fail("motion vector outside previous frame")`.
/// @param width Width used in `((y + row) * width)` and `((sourceY + row) * width)`.
/// @param height Height used in `((sourceY + size) > height)` and `((((sourceX < 0) or (sourceY < 0)) or ((sourceX + size) > width)) or ((sourceY + size) > height))`.
/// @param x X used in `(x + dx)` and `(((y + row) * width) + x)`.
/// @param y Y used in `(y + dy)` and `(y + row)`.
/// @param size Size used in `(size - 1)` and `(sourceX + size)`.
/// @param vector Vector used in `(vector >> 4)` and `(vector & 15)`.
/// @param xoff Xoff used in `((8 - ((vector >> 4) & 15)) - xoff)`.
/// @param yoff Yoff used in `((8 - (vector & 15)) - yoff)`.
function copyMotion(destination,previous,width,height,x,y,size,vector,xoff,yoff)
  dx=8-((vector>>4)&15)-xoff;dy=8-(vector&15)-yoff;sourceX=x+dx;sourceY=y+dy
  if sourceX<0 or sourceY<0 or sourceX+size>width or sourceY+size>height then return fail("motion vector outside previous frame") end if
  for row=0 to size-1 for column=0 to size-1 source=((sourceY+row)*width+sourceX+column)*4;target=((y+row)*width+x+column)*4;for channel=0 to 3 destination[target+channel]=previous[source+channel] end for end for end for
  return void
end function

/// Decode small in video.roq_video.
/// @param decoder Record exposing `width`, `height`, `q4`, `q2`.
/// @param input Value passed as `value` to `mq3.video.roq_video.nextCode`.
/// @param destination Destination passed as `destination` to `mq3.video.roq_video.copyMotion`.
/// @param previous Previous passed as `previous` to `mq3.video.roq_video.copyMotion`.
/// @param x X passed as `x` to `mq3.video.roq_video.copyMotion`.
/// @param y Y passed as `y` to `mq3.video.roq_video.copyMotion`.
/// @param xoff Xoff passed as `xoff` to `mq3.video.roq_video.copyMotion`.
/// @param yoff Yoff passed as `yoff` to `mq3.video.roq_video.copyMotion`.
function decodeSmall(decoder,input,destination,previous,x,y,xoff,yoff)
  code=nextCode(input);if code is error then return code end if
  if code==0 then return void end if
  if code==1 then vector=nextByte(input);if vector is error then return vector end if;return copyMotion(destination,previous,decoder.width,decoder.height,x,y,4,vector,xoff,yoff) end if
  if code==2 then index=nextByte(input);if index is error then return index end if;return writeBlock(destination,decoder.width,decoder.height,x,y,4,decoder.q4[index]) end if
  for subY=0 to 1 for subX=0 to 1 index=nextByte(input);if index is error then return index end if;written=writeBlock(destination,decoder.width,decoder.height,x+subX*2,y+subY*2,2,decoder.q2[index]);if written is error then return written end if end for end for
  return void
end function

/// Decode vq in video.roq_video; the normal completion returns `decoder.latest`.
///
/// Direct state writes: `decoder.frameCount`, `decoder.latest`.
/// @param decoder Record exposing `width`, `buffers`, `frameCount`, `height`, `q8`, `latest`. Updated in place: `frameCount`, `latest`.
/// @param movie Record exposing `data`.
/// @param chunk Record exposing `dataOffset`, `size`, `flags`.
function decodeVq(decoder,movie,chunk)
  if decoder.width==0 or decoder.buffers[0]==void then return fail("VQ frame precedes quad info") end if
  target=decoder.frameCount&1;previousIndex=1-target;destination=decoder.buffers[target];previous=decoder.buffers[previousIndex];input=reader(movie.data,chunk.dataOffset,chunk.size)
  xoff=chunk.flags>>8;if xoff>=128 then xoff=xoff-256 end if;yoff=chunk.flags&255;if yoff>=128 then yoff=yoff-256 end if
  macroY=0
  while macroY<decoder.height
    macroX=0
    while macroX<decoder.width
      for partY=0 to 1 for partX=0 to 1
        x=macroX+partX*8;y=macroY+partY*8;code=nextCode(input);if code is error then return code end if
        if code==1 then vector=nextByte(input);if vector is error then return vector end if;copied=copyMotion(destination,previous,decoder.width,decoder.height,x,y,8,vector,xoff,yoff);if copied is error then return copied end if
        else if code==2 then index=nextByte(input);if index is error then return index end if;written=writeBlock(destination,decoder.width,decoder.height,x,y,8,decoder.q8[index]);if written is error then return written end if
        else if code==3 then for smallY=0 to 1 for smallX=0 to 1 decoded=decodeSmall(decoder,input,destination,previous,x+smallX*4,y+smallY*4,xoff,yoff);if decoded is error then return decoded end if end for end for
        end if
      end for end for
      macroX=macroX+16
    end while
    macroY=macroY+16
  end while
  if decoder.frameCount==0 then for index=0 to len(destination)-1 previous[index]=destination[index] end for end if
  decoder.frameCount=decoder.frameCount+1;decoder.latest=Frame(decoder.width,decoder.height,destination,decoder.frameCount);return decoder.latest
end function

/// Process roq video in video.roq_video.
/// @param decoder Decoder passed as `decoder` to `mq3.video.roq_video.setInfo`.
/// @param movie Movie passed as `movie` to `mq3.video.roq_video.setInfo`.
/// @param chunk Record exposing `id`.
function process(decoder,movie,chunk)
  if decoder==void or movie==void or chunk==void then return fail("decoder, movie and chunk are required") end if
  if chunk.id==roq.QUAD_INFO then return setInfo(decoder,movie,chunk) end if
  if chunk.id==roq.CODEBOOK then return decodeCodebook(decoder,movie,chunk) end if
  if chunk.id==roq.QUAD_VQ then return decodeVq(decoder,movie,chunk) end if
  if chunk.id==roq.QUAD_HANG or chunk.id==roq.QUAD_JPEG or chunk.id==roq.PACKET then return void end if
  return void
end function
