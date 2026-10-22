// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete state adapter for code/renderer/tr_image.c.
package mq3.renderer.tr_image_runtime

import mq3.renderer.image_registry as registry
import mq3.renderer.image_processing as processing
import mq3.renderer.tga as tga
import mq3.renderer.player_skins as skinParser
import mq3.platform.playable_jpeg as jpeg
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import std.string as strings

const GL_REPEAT=10497
const GL_CLAMP=10496
const FOG_TABLE_SIZE=256
const MAX_SKINS=1024
struct Services skinLoadFn writeJpegFn deleteTextureFn gammaFn diagnosticFn context end struct
struct SkinRecord name skin surfaces end struct
struct Destination bytes capacity used end struct
struct State images services skins fogTable gammaTable intensityTable overbrightBits identityLight identityLightByte filterName filterMin filterMax defaultImage whiteImage identityLightImage scratchImages dlightImage fogImage end struct

function services() return Services(void,void,void,void,void,void) end function
function create(imageRegistry,host) if imageRegistry==void then imageRegistry=registry.create(void,void,false) end if;if host==void then host=services() end if;return State(imageRegistry,host,[],[],registry.identityTable(),registry.identityTable(),0,1.0,255,"GL_LINEAR_MIPMAP_NEAREST",9985,9729,void,void,void,[],void,void) end function
function warn(state,text) if state!=void and state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,text) end if;return void end function
function lower(value) return strings.toLowerAscii(value) end function
function u16(data,at) if at<0 or at+2>len(data) then return -1 end if;return data[at]|(data[at+1]<<8) end function
function u32(data,at) if at<0 or at+4>len(data) then return -1 end if;return n.i32(data[at]|(data[at+1]<<8)|(data[at+2]<<16)|(data[at+3]<<24)) end function
function cloneByteData(data) output=bytes(len(data),0);for i=0 to len(data)-1 output[i]=data[i] end for;return output end function

function LoadTGA(data) decoded=tga.decode(data);if decoded is error then return decoded end if;return registry.Source(decoded.width,decoded.height,decoded.pixels) end function
function LoadJPG(data) decoded=jpeg.decode(data);if decoded is error then return decoded end if;return registry.Source(decoded.width,decoded.height,decoded.pixels) end function
function LoadBMP(data)
 if data==void or typeof(data)!="bytes" or len(data)<54 or data[0]!=66 or data[1]!=77 then return error(7178,"BMP: invalid header") end if
 offset=u32(data,10);width=u32(data,18);height=u32(data,22);bits=u16(data,28);compression=u32(data,30)
 if width<1 or height==0 or bits!=24 or compression!=0 then return error(7178,"BMP: unsupported format") end if
 topDown=false;if height<0 then topDown=true;height=0-height end if;stride=n.quotient(width*3+3,4)*4
 if offset<0 or offset+stride*height>len(data) then return error(7178,"BMP: truncated pixels") end if
 output=bytes(width*height*4,0)
 for y=0 to height-1 sourceY=y;if not topDown then sourceY=height-1-y end if;for x=0 to width-1 source=offset+sourceY*stride+x*3;target=(y*width+x)*4;output[target]=data[source+2];output[target+1]=data[source+1];output[target+2]=data[source];output[target+3]=255 end for end for
 return registry.Source(width,height,output)
end function
function LoadPCX(data)
 if data==void or typeof(data)!="bytes" or len(data)<897 or data[0]!=10 or data[2]!=1 or data[3]!=8 then return error(7178,"PCX: invalid header") end if
 xmin=u16(data,4);ymin=u16(data,6);xmax=u16(data,8);ymax=u16(data,10);width=xmax-xmin+1;height=ymax-ymin+1;planes=data[65];lineBytes=u16(data,66)
 if width<1 or height<1 or planes!=1 or lineBytes<width or data[len(data)-769]!=12 then return error(7178,"PCX: unsupported format") end if
 indexes=bytes(lineBytes*height,0);source=128;target=0
 while target<len(indexes)
  if source>=len(data)-769 then return error(7178,"PCX: truncated pixels") end if;value=data[source];source=source+1;count=1
  if (value&192)==192 then count=value&63;if source>=len(data)-769 then return error(7178,"PCX: truncated run") end if;value=data[source];source=source+1 end if
  for i=0 to count-1 if target>=len(indexes) then break end if;indexes[target]=value;target=target+1 end for
 end while
 paletteAt=len(data)-768;output=bytes(width*height*4,0)
 for y=0 to height-1 for x=0 to width-1 index=indexes[y*lineBytes+x];dst=(y*width+x)*4;output[dst]=data[paletteAt+index*3];output[dst+1]=data[paletteAt+index*3+1];output[dst+2]=data[paletteAt+index*3+2];output[dst+3]=255 end for end for
 return registry.Source(width,height,output)
end function
function LoadPCX32(data) return LoadPCX(data) end function
function R_LoadImage(data,name) extension=lower(name);if strings.endsWith(extension,".tga") then return LoadTGA(data) end if;if strings.endsWith(extension,".jpg") or strings.endsWith(extension,".jpeg") then return LoadJPG(data) end if;if strings.endsWith(extension,".pcx") then return LoadPCX32(data) end if;if strings.endsWith(extension,".bmp") then return LoadBMP(data) end if;return void end function

function generateHashValue(name) return registry.hashValue(name) end function
function ResampleTexture(data,inWidth,inHeight,outWidth,outHeight) return processing.resample(data,inWidth,inHeight,outWidth,outHeight) end function
function R_LightScaleTexture(state,data,width,height,onlyGamma) return processing.lightScale(data,width,height,onlyGamma,state.images.config.deviceSupportsGamma,state.gammaTable,state.intensityTable) end function
function R_MipMap(data,width,height) return processing.mipMapSimple(data,width,height) end function
function R_MipMap2(data,width,height) return processing.mipMapFiltered(data,width,height) end function
function R_BlendOverTexture(data,pixelCount,blend)
 if data==void or blend==void or len(data)<pixelCount*4 or len(blend)<4 then return error(7178,"blend input truncated") end if;inverse=255-blend[3]
 for pixel=0 to pixelCount-1 at=pixel*4;data[at]=(data[at]*inverse+blend[0]*blend[3])>>9;data[at+1]=(data[at+1]*inverse+blend[1]*blend[3])>>9;data[at+2]=(data[at+2]*inverse+blend[2]*blend[3])>>9 end for;return data
end function
function Upload32(state,data,width,height,mipmap,allowPicmip,lightMap) return registry.prepareUpload(data,width,height,mipmap,allowPicmip,lightMap,state.images.config) end function
function R_CreateImage(state,name,data,width,height,mipmap,allowPicmip,wrapClampMode) return registry.createImage(state.images,name,data,width,height,mipmap,allowPicmip,wrapClampMode) end function
function R_FindImageFile(state,name,mipmap,allowPicmip,wrapClampMode) return registry.findImageFile(state.images,name,mipmap,allowPicmip,wrapClampMode) end function
function R_GammaCorrect(state,data) output=cloneByteData(data);for i=0 to len(output)-1 output[i]=state.gammaTable[output[i]] end for;return output end function

function GL_TextureMode(state,name)
 modes=[["GL_NEAREST",9728,9728],["GL_LINEAR",9729,9729],["GL_NEAREST_MIPMAP_NEAREST",9984,9728],["GL_LINEAR_MIPMAP_NEAREST",9985,9729],["GL_NEAREST_MIPMAP_LINEAR",9986,9728],["GL_LINEAR_MIPMAP_LINEAR",9987,9729]]
 for each mode in modes if lower(mode[0])==lower(name) then state.filterName=mode[0];state.filterMin=mode[1];state.filterMax=mode[2];return true end if end for;warn(state,"bad filter name");return false
end function
function R_SumOfUsedImages(state,frameCount) total=0;for each image in state.images.images if image.frameUsed==frameCount then total=total+image.uploadWidth*image.uploadHeight end if end for;return total end function
function R_ImageList_f(state) result=[];for each image in state.images.images result=result+[[image.texnum,image.uploadWidth,image.uploadHeight,image.mipmap,image.TMU,image.internalFormat,image.wrapClampMode,image.imgName]] end for;return result end function

function R_InitFogTable(state) table=[];for i=0 to FOG_TABLE_SIZE-1 table=table+[trans.sqrt(i/(FOG_TABLE_SIZE-1.0))] end for;state.fogTable=table;return table end function
function R_FogFactor(state,s,t) s=s-1.0/512.0;if s<0.0 or t<1.0/32.0 then return 0.0 end if;if t<31.0/32.0 then s=s*(t-1.0/32.0)/(30.0/32.0) end if;s=s*8.0;if s>1.0 then s=1.0 end if;index=n.trunc32(s*(FOG_TABLE_SIZE-1));return state.fogTable[index] end function
function R_CreateDefaultImage(state) data=bytes(16*16*4,32);for x=0 to 15 for each pixel in [x,15*16+x,x*16,x*16+15] for c=0 to 3 data[pixel*4+c]=255 end for end for end for;state.defaultImage=R_CreateImage(state,"*default",data,16,16,true,false,GL_REPEAT);return state.defaultImage end function
function R_CreateDlightImage(state) size=16;data=bytes(size*size*4,0);for y=0 to size-1 for x=0 to size-1 d=(x-7.5)*(x-7.5)+(y-7.5)*(y-7.5);value=0;if d<64.0 then value=n.trunc32(255.0*(1.0-d/64.0)) end if;at=(y*size+x)*4;data[at]=value;data[at+1]=value;data[at+2]=value;data[at+3]=255 end for end for;state.dlightImage=R_CreateImage(state,"*dlight",data,size,size,false,false,GL_CLAMP);return state.dlightImage end function
function R_CreateFogImage(state) data=bytes(256*32*4,0);for y=0 to 31 for x=0 to 255 alpha=n.trunc32(255.0*R_FogFactor(state,(x+0.5)/256.0,(y+0.5)/32.0));at=(y*256+x)*4;data[at]=255;data[at+1]=255;data[at+2]=255;data[at+3]=alpha end for end for;state.fogImage=R_CreateImage(state,"*fog",data,256,32,false,false,GL_CLAMP);return state.fogImage end function
function R_CreateBuiltinImages(state) R_CreateDefaultImage(state);white=bytes(16*16*4,255);state.whiteImage=R_CreateImage(state,"*white",white,8,8,false,false,GL_REPEAT);identity=bytes(16*16*4,255);for pixel=0 to 255 identity[pixel*4]=state.identityLightByte;identity[pixel*4+1]=state.identityLightByte;identity[pixel*4+2]=state.identityLightByte end for;state.identityLightImage=R_CreateImage(state,"*identityLight",identity,8,8,false,false,GL_REPEAT);state.scratchImages=[];for i=0 to 31 state.scratchImages=state.scratchImages+[R_CreateImage(state,"*scratch"+str(i),identity,16,16,false,true,GL_CLAMP)] end for;R_CreateDlightImage(state);R_CreateFogImage(state);return true end function
function R_SetColorMappings(state,overbright,gamma,intensity,fullscreen,colorBits)
 if not state.images.config.deviceSupportsGamma or not fullscreen then overbright=0 end if;if colorBits>16 and overbright>2 then overbright=2 end if;if colorBits<=16 and overbright>1 then overbright=1 end if;if overbright<0 then overbright=0 end if
 if gamma<0.5 then gamma=0.5 end if;if gamma>3.0 then gamma=3.0 end if;if intensity<1.0 then intensity=1.0 end if
 state.overbrightBits=overbright;state.identityLight=1.0/(1<<overbright);state.identityLightByte=n.trunc32(255.0*state.identityLight);state.gammaTable=bytes(256,0);state.intensityTable=bytes(256,0)
 for i=0 to 255 value=i;if state.services.gammaFn!=void then value=state.services.gammaFn(state.services.context,i,gamma) end if;value=value<<overbright;if value>255 then value=255 end if;if value<0 then value=0 end if;state.gammaTable[i]=value;scaled=n.trunc32(i*intensity);if scaled>255 then scaled=255 end if;state.intensityTable[i]=scaled end for
 state.images.config.gammaTable=state.gammaTable;state.images.config.intensityTable=state.intensityTable;if state.services.gammaFn!=void and state.images.config.deviceSupportsGamma then state.services.gammaFn(state.services.context,state.gammaTable,-1.0) end if;return true
end function
function R_InitImages(state,overbright,gamma,intensity,fullscreen,colorBits) state.images.images=[];state.images.buckets=array(registry.FILE_HASH_SIZE,void);R_SetColorMappings(state,overbright,gamma,intensity,fullscreen,colorBits);R_InitFogTable(state);return R_CreateBuiltinImages(state) end function
function R_DeleteTextures(state) for each image in state.images.images if state.services.deleteTextureFn!=void then state.services.deleteTextureFn(state.services.context,image.texnum) end if end for;state.images.images=[];state.images.buckets=array(registry.FILE_HASH_SIZE,void);return true end function

function CommaParse(text,offset)
 if text==void then return ["",offset] end if;data=bytes(text);if offset<0 then offset=0 end if
 skipped=true
 while skipped
  skipped=false
  while offset<len(data) and data[offset]<=32 offset=offset+1 end while
  if offset+1<len(data) and data[offset]==47 and data[offset+1]==47 then
   while offset<len(data) and data[offset]!=10 offset=offset+1 end while;skipped=true
  else
   if offset+1<len(data) and data[offset]==47 and data[offset+1]==42 then
    offset=offset+2
    while offset+1<len(data) and not (data[offset]==42 and data[offset+1]==47) offset=offset+1 end while
    if offset+1<len(data) then offset=offset+2 end if;skipped=true
   end if
  end if
 end while
 if offset>=len(data) then return ["",offset] end if;token=bytes(0,0)
 if data[offset]==34 then offset=offset+1;start=offset;while offset<len(data) and data[offset]!=34 offset=offset+1 end while;token=slice(data,start,offset-start);if offset<len(data) then offset=offset+1 end if;return [decode(token),offset] end if
 start=offset;while offset<len(data) and data[offset]>32 and data[offset]!=44 offset=offset+1 end while;return [decode(slice(data,start,offset-start)),offset]
end function
function R_InitSkins(state) state.skins=[SkinRecord("<default skin>",void,[["","default"]])];return true end function
function RE_RegisterSkin(state,name)
 if state==void or name==void or name=="" or len(bytes(name))>=64 then return 0 end if
 if len(state.skins)>1 then for i=1 to len(state.skins)-1 if lower(state.skins[i].name)==lower(name) then if len(state.skins[i].surfaces)==0 then return 0 end if;return i end if end for end if
 if len(state.skins)>=MAX_SKINS then return 0 end if
 record=void
 if not strings.endsWith(lower(name),".skin") then record=SkinRecord(name,void,[["",name]])
 else data=void;if state.services.skinLoadFn!=void then data=state.services.skinLoadFn(state.services.context,name) end if;if data==void then state.skins=state.skins+[SkinRecord(name,void,[])];return 0 end if;parsed=skinParser.parse(data);if parsed is error then state.skins=state.skins+[SkinRecord(name,void,[])];return 0 end if;surfaces=[];for each mapping in parsed.mappings surfaces=surfaces+[[lower(mapping.surface),mapping.shaderName]] end for;record=SkinRecord(name,parsed,surfaces) end if
 state.skins=state.skins+[record];if len(record.surfaces)==0 then return 0 end if;return len(state.skins)-1
end function
function R_GetSkinByHandle(state,handle) if handle<1 or handle>=len(state.skins) then return state.skins[0] end if;return state.skins[handle] end function
function R_SkinList_f(state) result=[];for i=0 to len(state.skins)-1 result=result+[[i,state.skins[i].name,state.skins[i].surfaces]] end for;return result end function

function jpegDest(capacity) if capacity<0 then capacity=0 end if;return Destination(bytes(capacity,0),capacity,0) end function
function init_destination(destination) destination.used=0;return destination.capacity end function
function empty_output_buffer(destination) return destination!=void and destination.used<destination.capacity end function
function term_destination(destination,used) if used<0 then used=0 end if;if used>destination.capacity then used=destination.capacity end if;destination.used=used;return used end function
function SaveJPG(state,filename,quality,width,height,pixels) if state.services.writeJpegFn==void then return false end if;return state.services.writeJpegFn(state.services.context,filename,quality,width,height,pixels) end function
