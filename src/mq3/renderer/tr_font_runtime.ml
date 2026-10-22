// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for renderer/tr_font.c.
package mq3.renderer.tr_font_runtime
import mq3.compat.numeric as n
import mq3.vm.font_abi as fontAbi
import mq3.format.pk3 as pk3
import std.fs as fs

const MAX_FONTS=6
const FT_OUTLINE=1
const PIXEL_MODE_MONO=1
const PIXEL_MODE_GRAY=2

struct Cursor data offset end struct
struct Metrics horiBearingX width horiBearingY height horiAdvance end struct
struct GlyphBounds left right width top bottom height pitch end struct
struct Bitmap width rows pitch pixelMode buffer numGrays end struct
struct GlyphInfo height top bottom pitch xSkip imageWidth imageHeight s t s2 t2 glyph shaderName end struct
struct Rendered bitmap glyph end struct
struct Constructed glyph x y maxHeight placed end struct
struct Raster metrics format coverage pixelMode end struct
struct FreeTypeBackend context rasterizeFn createImageFn saveFontData outputRoot end struct
struct Lifecycle registry registeredFontCount freeTypeInitialized backend end struct

function fail(message) return error(7798,"tr_font: "+message) end function
function createCursor(data) return Cursor(data,0) end function
function readInt(cursor)
  if cursor==void or cursor.offset<0 or cursor.offset+4>len(cursor.data) then return fail("truncated integer") end if
  value=n.readI32(cursor.data,cursor.offset);cursor.offset=cursor.offset+4;return value
end function
function readFloat(cursor)
  if cursor==void or cursor.offset<0 or cursor.offset+4>len(cursor.data) then return fail("truncated float") end if
  value=n.bitsFloat(n.readU32(cursor.data,cursor.offset));cursor.offset=cursor.offset+4;return value
end function

function R_GetGlyphInfo(metrics)
  left=metrics.horiBearingX&(-64);right=(metrics.horiBearingX+metrics.width+63)&(-64);width=(right-left)>>6
  top=(metrics.horiBearingY+63)&(-64);bottom=(metrics.horiBearingY-metrics.height)&(-64);height=(top-bottom)>>6;pitch=(width+3)&(-4)
  return GlyphBounds(left,right,width,top,bottom,height,pitch)
end function
function blankGlyph() return GlyphInfo(0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,0,"") end function

// FreeType performs the outline scan conversion. The facade consumes that
// exact coverage buffer and retains all of tr_font.c's metric/lifetime rules.
function R_RenderGlyph(metrics,format,coverage,pixelMode)
  glyph=blankGlyph();if format!=FT_OUTLINE then return Rendered(void,glyph) end if
  bounds=R_GetGlyphInfo(metrics);size=bounds.pitch*bounds.height;if coverage==void or len(coverage)!=size then return fail("outline coverage size differs from glyph bounds") end if
  bitmap=Bitmap(bounds.width,bounds.height,bounds.pitch,pixelMode,slice(coverage,0,len(coverage)),256)
  glyph.height=bounds.height;glyph.pitch=bounds.pitch;glyph.top=(metrics.horiBearingY>>6)+1;glyph.bottom=bounds.bottom
  return Rendered(bitmap,glyph)
end function

function RE_ConstructGlyphInfo(imageOut,x,y,maxHeight,metrics,format,coverage,pixelMode,calcHeight)
  rendered=R_RenderGlyph(metrics,format,coverage,pixelMode);if rendered is error then return rendered end if;glyph=rendered.glyph;bitmap=rendered.bitmap
  if bitmap==void then return Constructed(glyph,x,y,maxHeight,false) end if;if glyph.height>maxHeight then maxHeight=glyph.height end if
  glyph.xSkip=(metrics.horiAdvance>>6)+1
  if calcHeight then return Constructed(glyph,x,y,maxHeight,false) end if
  width=glyph.pitch;height=glyph.height
  if x+width+1>=255 then if y+maxHeight+1>=255 then return Constructed(glyph,-1,-1,maxHeight,false) else x=0;y=y+maxHeight+1 end if
  else if y+maxHeight+1>=255 then return Constructed(glyph,-1,-1,maxHeight,false) end if
  if imageOut==void or len(imageOut)<256*256 then return fail("glyph atlas is smaller than 256x256") end if
  if pixelMode==PIXEL_MODE_MONO then
    for row=0 to glyph.height-1 source=row*glyph.pitch;destination=y*256+x+row*256;mask=128;value=0;sourceIndex=source
      for column=0 to glyph.pitch-1 if mask==128 then value=bitmap.buffer[sourceIndex];sourceIndex=sourceIndex+1 end if;if (value&mask)!=0 then imageOut[destination+column]=255 end if;mask=mask>>1;if mask==0 then mask=128 end if end for
    end for
  else
    for row=0 to glyph.height-1 copyBytes(imageOut,(y+row)*256+x,bitmap.buffer,row*glyph.pitch,glyph.pitch) end for
  end if
  glyph.imageHeight=height;glyph.imageWidth=width;glyph.s=x/256.0;glyph.t=y/256.0;glyph.s2=glyph.s+width/256.0;glyph.t2=glyph.t+height/256.0
  return Constructed(glyph,x+width+1,y,maxHeight,true)
end function

function tgaBytes(data,width,height)
  if width<=0 or height<=0 or data==void or len(data)!=width*height*4 then return fail("invalid RGBA image") end if
  output=bytes(width*height*4+18,0);output[2]=2;output[12]=width&255;output[13]=(width>>8)&255;output[14]=height&255;output[15]=(height>>8)&255;output[16]=32
  for pixel=0 to width*height-1 source=pixel*4;target=18+source;output[target]=data[source+2];output[target+1]=data[source+1];output[target+2]=data[source];output[target+3]=data[source+3] end for
  return output
end function
function WriteTGA(filename,data,width,height)
  encoded=tgaBytes(data,width,height);if encoded is error then return encoded end if;written=try(fs.writeAllBytes(filename,encoded));if written is error then return written end if;return len(encoded)
end function

function writeCString(data,offset,capacity,value)
  encoded=bytes(value);count=len(encoded);if count>=capacity then count=capacity-1 end if;for index=0 to capacity-1 data[offset+index]=0 end for;if count>0 then copyBytes(data,offset,encoded,0,count) end if;return void
end function
function writeGlyph(data,index,glyph)
  if typeof(glyph.height)!="int" or typeof(glyph.top)!="int" or typeof(glyph.bottom)!="int" or typeof(glyph.pitch)!="int" or typeof(glyph.xSkip)!="int" or typeof(glyph.imageWidth)!="int" or typeof(glyph.imageHeight)!="int" or typeof(glyph.glyph)!="int" or typeof(glyph.shaderName)!="string" then return fail("incomplete glyph "+str(index)) end if
  offset=index*fontAbi.GLYPH_SIZE;n.writeU32(data,offset,glyph.height);n.writeU32(data,offset+4,glyph.top);n.writeU32(data,offset+8,glyph.bottom);n.writeU32(data,offset+12,glyph.pitch);n.writeU32(data,offset+16,glyph.xSkip);n.writeU32(data,offset+20,glyph.imageWidth);n.writeU32(data,offset+24,glyph.imageHeight);n.writeU32(data,offset+28,n.floatBits(glyph.s));n.writeU32(data,offset+32,n.floatBits(glyph.t));n.writeU32(data,offset+36,n.floatBits(glyph.s2));n.writeU32(data,offset+40,n.floatBits(glyph.t2));n.writeU32(data,offset+44,glyph.glyph);writeCString(data,offset+48,32,glyph.shaderName);return void
end function
function alphaImage(atlas)
  maximum=0;for index=0 to 256*256-1 if atlas[index]>maximum then maximum=atlas[index] end if end for;rgba=bytes(256*256*4,255)
  scale=0.0;if maximum>0 then scale=n.fdiv(255.0,maximum) end if
  for index=0 to 256*256-1 alpha=0;if maximum>0 then alpha=n.trunc32(n.fmul(atlas[index],scale)) end if;rgba[index*4+3]=alpha end for;return rgba
end function
function generatedFont(state,fontName,pointSize)
  backend=state.backend;if backend==void or backend.rasterizeFn==void or backend.createImageFn==void then return fontAbi.Result(false,void,0,fontAbi.pathFor(pointSize)) end if
  source=try(pk3.read(state.registry.archive,fontName));if source is error or len(source)==0 then return fontAbi.Result(false,void,0,fontAbi.pathFor(pointSize)) end if
  maxHeight=0
  for index=0 to fontAbi.GLYPHS_PER_FONT-2 raster=backend.rasterizeFn(backend.context,source,pointSize,index);if raster is error then return raster end if;measured=RE_ConstructGlyphInfo(void,0,0,maxHeight,raster.metrics,raster.format,raster.coverage,raster.pixelMode,true);if measured is error then return measured end if;maxHeight=measured.maxHeight end for
  data=bytes(fontAbi.FONT_INFO_SIZE,0);atlas=bytes(256*256,0);glyphs=[];for index=0 to fontAbi.GLYPHS_PER_FONT-1 glyphs=glyphs+[blankGlyph()] end for
  x=0;y=0;pageStart=0;page=0;index=0
  while index<fontAbi.GLYPHS_PER_FONT-1
    raster=backend.rasterizeFn(backend.context,source,pointSize,index);if raster is error then return raster end if;built=RE_ConstructGlyphInfo(atlas,x,y,maxHeight,raster.metrics,raster.format,raster.coverage,raster.pixelMode,false);if built is error then return built end if
    flush=not built.placed
    if built.placed then glyphs[index]=built.glyph;x=built.x;y=built.y;index=index+1 end if
    if flush or index==fontAbi.GLYPHS_PER_FONT-1 then
      if index==pageStart then return fail("glyph cannot fit a 256x256 font atlas") end if
      name="fonts/fontImage_"+str(page)+"_"+str(pointSize)+".tga";rgba=alphaImage(atlas);handle=backend.createImageFn(backend.context,name,rgba,256,256);if handle is error then return handle end if
      if backend.saveFontData then target=name;if backend.outputRoot!="" then target=backend.outputRoot+"/"+name end if;saved=WriteTGA(target,rgba,256,256);if saved is error then return saved end if end if
      for assigned=pageStart to index-1 glyphs[assigned].glyph=handle;glyphs[assigned].shaderName=name end for
      page=page+1;pageStart=index;atlas=bytes(256*256,0);x=0;y=0
    end if
  end while
  for index=0 to fontAbi.GLYPHS_PER_FONT-1 encoded=writeGlyph(data,index,glyphs[index]);if encoded is error then return encoded end if end for;n.writeU32(data,fontAbi.GLYPH_SCALE_OFFSET,n.floatBits(48.0/pointSize));path=fontAbi.pathFor(pointSize);fontAbi.writeName(data,path)
  if backend.saveFontData then target=path;if backend.outputRoot!="" then target=backend.outputRoot+"/"+path end if;written=try(fs.writeAllBytes(target,data));if written is error then return written end if end if
  state.registry.fonts=state.registry.fonts+[fontAbi.Cached(pointSize,data,fontAbi.GLYPHS_PER_FONT-1,path)];return fontAbi.Result(true,data,fontAbi.GLYPHS_PER_FONT-1,path)
end function

function create(archive) return Lifecycle(fontAbi.create(archive),0,false,void) end function
function createBackend(context,rasterizeFn,createImageFn,saveFontData,outputRoot) return FreeTypeBackend(context,rasterizeFn,createImageFn,saveFontData,outputRoot) end function
function R_InitFreeType(state,backend) if state==void then return fail("missing font lifecycle") end if;state.backend=backend;state.freeTypeInitialized=backend!=void and backend!=false;state.registeredFontCount=0;state.registry.fonts=[];return state.freeTypeInitialized end function
function R_DoneFreeType(state) if state==void then return void end if;state.freeTypeInitialized=false;state.backend=void;state.registeredFontCount=0;state.registry.fonts=[];return void end function
function RE_RegisterFont(state,shaderContext,registerShaderFn,fontName,pointSize)
  if state==void or state.registry==void then return fail("missing font lifecycle") end if;if pointSize<=0 then pointSize=12 end if;if state.registeredFontCount>=MAX_FONTS then return fontAbi.Result(false,void,0,fontAbi.pathFor(pointSize)) end if
  previous=fontAbi.cached(state.registry,pointSize);result=fontAbi.load(state.registry,shaderContext,registerShaderFn,fontName,pointSize);if result is error then return result end if;if not result.found and state.freeTypeInitialized then result=generatedFont(state,fontName,pointSize) end if
  if result.found and previous==void then state.registeredFontCount=state.registeredFontCount+1 end if;return result
end function
