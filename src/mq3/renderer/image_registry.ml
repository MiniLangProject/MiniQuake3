// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side image lookup, creation and Upload32 preparation from renderer/tr_image.c.
package mq3.renderer.image_registry
import mq3.renderer.tga as tga
import mq3.renderer.image_processing as processing

/// Number of buckets in the image-name hash table.
const FILE_HASH_SIZE=1024
/// Maximum number of images retained by the renderer's image registry.
const MAX_DRAWIMAGES=2048
/// Capacity of a Quake virtual-path buffer, including the terminating byte in the native ABI.
const MAX_QPATH=64
/// First texture-object identifier reserved for registered renderer images.
const TEXNUM_BASE=1024
/// Texture-compression mode indicating that textures remain uncompressed.
const TC_NONE=0
/// Texture-compression mode using the S3TC extension.
const TC_S3TC=1
/// OpenGL internal texture format with five bits per red, green, and blue component.
const GL_RGB5=0x8050
/// OpenGL internal texture format with eight bits per red, green, and blue component.
const GL_RGB8=0x8051
/// OpenGL internal texture format with four bits per red, green, blue, and alpha component.
const GL_RGBA4=0x8056
/// OpenGL internal texture format with eight bits per red, green, blue, and alpha component.
const GL_RGBA8=0x8058
/// OpenGL legacy RGB4_S3TC compressed RGB texture-format selector.
const GL_RGB4_S3TC=0x83a1

/// Data record for `mq3.renderer.image_registry.Source`; groups `width`, `height`, `pixels`.
struct Source
  /// Width in pixels of the source image supplied before texture resizing and mip generation.
  width
  /// Height in pixels of the source image supplied before texture resizing and mip generation.
  height
  /// Decoded pixel data for the image or upload.
  pixels
end struct
/// Data record for `mq3.renderer.image_registry.UploadConfig`; groups `roundImagesDown`, `picmip`, `maxTextureSize`, `textureBits`, `textureCompression`, `simpleMipMaps`, and 3 further fields.
struct UploadConfig
  /// Whether non-power-of-two images round down when resized for upload.
  roundImagesDown
  /// Global mip-level reduction applied to eligible textures.
  picmip
  /// Largest supported texture dimension reported by the graphics driver.
  maxTextureSize
  /// Requested color precision for uploaded textures.
  textureBits
  /// Selected texture-compression capability or mode.
  textureCompression
  /// Whether mip levels use the simple downsampling filter.
  simpleMipMaps
  /// Whether the display supports hardware gamma-ramp updates.
  deviceSupportsGamma
  /// Lookup table used to apply gamma correction to color samples.
  gammaTable
  /// Lookup table used to scale texture intensity.
  intensityTable
end struct
/// Data record for `mq3.renderer.image_registry.UploadLevel`; groups `width`, `height`, `pixels`.
struct UploadLevel
  /// Width in pixels of this mip level of the texture upload.
  width
  /// Height in pixels of this mip level of the texture upload.
  height
  /// Decoded pixel data for the image or upload.
  pixels
end struct
/// Data record for `mq3.renderer.image_registry.UploadPlan`; groups `uploadWidth`, `uploadHeight`, `internalFormat`, `samples`, `lightMap`, `levels`.
struct UploadPlan
  /// Width in pixels of the image submitted to the graphics driver.
  uploadWidth
  /// Height in pixels of the image submitted to the graphics driver.
  uploadHeight
  /// Graphics-driver format selected for the uploaded texture.
  internalFormat
  /// Number of color components retained in the uploaded image format.
  samples
  /// Baked-lighting texture coordinates or resource associated with this vertex or patch.
  lightMap
  /// Image levels generated for the texture's mipmap chain.
  levels
end struct
/// Data record for `mq3.renderer.image_registry.Image`; groups `texnum`, `imgName`, `width`, `height`, `uploadWidth`, `uploadHeight`, and 7 further fields.
struct Image
  /// Graphics-driver texture object identifier.
  texnum
  /// Virtual asset name used to register and cache the image.
  imgName
  /// Width in pixels of the registered image before upload-specific resizing.
  width
  /// Height in pixels of the registered image before upload-specific resizing.
  height
  /// Width in pixels of the image submitted to the graphics driver.
  uploadWidth
  /// Height in pixels of the image submitted to the graphics driver.
  uploadHeight
  /// Whether mip levels are generated or used for this image.
  mipmap
  /// Whether the global picmip reduction may downscale this image.
  allowPicmip
  /// Texture address mode selected at the image edges.
  wrapClampMode
  /// Texture unit on which the image is bound or managed.
  TMU
  /// Graphics-driver format selected for the uploaded texture.
  internalFormat
  /// Prepared pixel levels and format used to upload the image.
  upload
  /// Most recent renderer frame in which this image was used.
  frameUsed
end struct
/// Callback table for `mq3.renderer.image_registry.Services`; exposes `loadFn`, `releaseFn`, `submitFn`, `diagnosticFn`, `context`.
struct Services
  /// Host callback used to perform load operations for this subsystem.
  loadFn
  /// Host callback used to perform release operations for this subsystem.
  releaseFn
  /// Host callback used to perform submit operations for this subsystem.
  submitFn
  /// Host callback used to perform diagnostic operations for this subsystem.
  diagnosticFn
  /// Image-loader and graphics-host state passed to resource loading, release, and upload callbacks.
  context
end struct
/// Data record for `mq3.renderer.image_registry.Registry`; groups `images`, `buckets`, `config`, `services`, `activeTexture`.
struct Registry
  /// Image resources or image-animation frames retained by the record.
  images
  /// Hash-table buckets used to locate entries by name.
  buckets
  /// Configuration values used to initialize or drive this subsystem.
  config
  /// Injected host operations used by this subsystem.
  services
  /// Currently selected texture unit for image operations.
  activeTexture
end struct

/// Creates error `7170` with message `"image registry: "+message`.
/// @param message Input used in the result expression `error(7170,"image registry: "+message)`.
function fail(message) return error(7170,"image registry: "+message) end function

/// Builds `table[i]` in `mq3.renderer.image_registry.identityTable`; returns `table`.
function identityTable()
  table=bytes(256,0);for i=0 to 255 table[i]=i end for;return table
end function

/// Builds `mq3.renderer.image_registry.UploadConfig` for `mq3.renderer.image_registry.uploadConfig`.
function uploadConfig()
  identity=identityTable()
  return UploadConfig(false,0,2048,0,TC_NONE,true,false,identity,identity)
end function

/// Constructs `mq3.renderer.image_registry.Services` with `loadFn` = `void`, `releaseFn` = `void`, `submitFn` = `void`, `diagnosticFn` = `void` and the supplied remaining values.
function services() return Services(void,void,void,void,void) end function

/// Builds `mq3.renderer.image_registry.Registry` for `mq3.renderer.image_registry.create`.
/// @param config Initial value for `mq3.renderer.image_registry.Registry.config`.
/// @param host Initial value for `mq3.renderer.image_registry.Registry.services`.
/// @param activeTexture Initial value for `mq3.renderer.image_registry.Registry.activeTexture`.
function create(config,host,activeTexture)
  if config==void then config=uploadConfig() end if
  if host==void then host=services() end if
  if config.maxTextureSize<1 then return fail("invalid maximum texture size") end if
  return Registry([],array(FILE_HASH_SIZE,void),config,host,activeTexture)
end function

// Exact generateHashValue spelling rules: ASCII case fold, slash fold, extension omitted.
/// @param name Argument 1 supplied to `bytes`.
function hashValue(name)
  if name==void then return 0 end if
  data=bytes(name);hash=0;index=0
  while index<len(data)
    letter=data[index]
    if letter>=65 and letter<=90 then letter=letter+32 end if
    if letter==46 then break end if
    if letter==92 then letter=47 end if
    hash=hash+letter*(index+119);index=index+1
  end while
  return hash&(FILE_HASH_SIZE-1)
end function

/// Returns `decode(slice(bytes(name),0,9))=="*lightmap"` from `mq3.renderer.image_registry.startsLightmap`; earlier branches return `false`.
/// @param name Argument 1 supplied to `bytes`.
function startsLightmap(name)
  if len(name)<9 then return false end if
  return decode(slice(bytes(name),0,9))=="*lightmap"
end function

/// Builds `mq3.renderer.image_registry.Source` using `mq3.renderer.tga.decode`.
/// @param data Argument 1 supplied to `mq3.renderer.tga.decode`.
function sourceFromTga(data)
  decoded=tga.decode(data)
  return Source(decoded.width,decoded.height,decoded.pixels)
end function

/// Returns `result` from `mq3.renderer.image_registry.nextPower`.
/// @param value Input used by `while result<value result=result<<1`.
function nextPower(value)
  result=1;while result<value result=result<<1 end while;return result
end function

/// Builds `output[i]` in `mq3.renderer.image_registry.copyPixels`; returns `output`.
/// @param pixels Indexed input read at `i`.
/// @param count Argument 1 supplied to `bytes`.
function copyPixels(pixels,count)
  output=bytes(count,0);for i=0 to count-1 output[i]=pixels[i] end for;return output
end function

/// Computes `internalFormat` from `[4,4]`.
/// @param pixels Indexed input read at `i*4+3`.
/// @param width Input used by `for i=0 to width*height-1`.
/// @param height Input used by `for i=0 to width*height-1`.
/// @param lightMap Input tested by `lightMap`.
/// @param textureBits Input tested by `textureBits==16`.
/// @param textureCompression Input tested by `textureCompression==TC_S3TC`.
function internalFormat(pixels,width,height,lightMap,textureBits,textureCompression)
  if lightMap then return [3,3] end if
  samples=3
  for i=0 to width*height-1
    if pixels[i*4+3]!=255 then samples=4;break end if
  end for
  if samples==3 then
    if textureCompression==TC_S3TC then return [GL_RGB4_S3TC,3] end if
    if textureBits==16 then return [GL_RGB5,3] end if
    if textureBits==32 then return [GL_RGB8,3] end if
    return [3,3]
  end if
  if textureBits==16 then return [GL_RGBA4,4] end if
  if textureBits==32 then return [GL_RGBA8,4] end if
  return [4,4]
end function

/// Returns `processing.mipMapFiltered(pixels,width,height)` from `mq3.renderer.image_registry.downsample`; earlier branches return `processing.mipMapSimple(pixels,width,height)`.
/// @param pixels Argument 1 supplied to `mq3.renderer.image_processing.mipMapSimple`.
/// @param width Argument 2 supplied to `mq3.renderer.image_processing.mipMapSimple`.
/// @param height Argument 3 supplied to `mq3.renderer.image_processing.mipMapSimple`.
/// @param simple Input tested by `simple or width<2 or height<2`.
function downsample(pixels,width,height,simple)
  if simple or width<2 or height<2 then return processing.mipMapSimple(pixels,width,height) end if
  return processing.mipMapFiltered(pixels,width,height)
end function

// Produces every byte payload which Upload32 would hand to qglTexImage2D.
/// @param pixels Value forwarded as `pixels` to `mq3.renderer.image_registry.internalFormat`.
/// @param width Value forwarded as `value` to `mq3.renderer.image_registry.nextPower`.
/// @param height Value forwarded as `value` to `mq3.renderer.image_registry.nextPower`.
/// @param mipmap Input tested by `scaledWidth==workWidth and scaledHeight==workHeight and not mipmap`.
/// @param allowPicmip Input tested by `allowPicmip`.
/// @param lightMap Initial value for `mq3.renderer.image_registry.UploadPlan.lightMap`.
/// @param config Record providing `config.maxTextureSize`, `config.picmip`, `config.roundImagesDown`, `config.textureBits`, `config.textureCompression`, `config.simpleMipMaps`.
function prepareUpload(pixels,width,height,mipmap,allowPicmip,lightMap,config)
  if pixels==void or width<1 or height<1 or len(pixels)<width*height*4 then return fail("invalid source image") end if
  if config==void or config.maxTextureSize<1 or config.picmip<0 then return fail("invalid upload configuration") end if
  scaledWidth=nextPower(width);scaledHeight=nextPower(height)
  if config.roundImagesDown and scaledWidth>width then scaledWidth=scaledWidth>>1 end if
  if config.roundImagesDown and scaledHeight>height then scaledHeight=scaledHeight>>1 end if
  data=pixels;workWidth=width;workHeight=height
  if scaledWidth!=width or scaledHeight!=height then
    data=processing.resample(data,width,height,scaledWidth,scaledHeight);workWidth=scaledWidth;workHeight=scaledHeight
  end if
  if allowPicmip then scaledWidth=scaledWidth>>config.picmip;scaledHeight=scaledHeight>>config.picmip end if
  if scaledWidth<1 then scaledWidth=1 end if;if scaledHeight<1 then scaledHeight=1 end if
  while scaledWidth>config.maxTextureSize or scaledHeight>config.maxTextureSize
    scaledWidth=scaledWidth>>1;scaledHeight=scaledHeight>>1
    if scaledWidth<1 then scaledWidth=1 end if;if scaledHeight<1 then scaledHeight=1 end if
  end while
  format=internalFormat(pixels,width,height,lightMap,config.textureBits,config.textureCompression)
  if scaledWidth==workWidth and scaledHeight==workHeight and not mipmap then
    base=copyPixels(data,scaledWidth*scaledHeight*4)
    return UploadPlan(scaledWidth,scaledHeight,format[0],format[1],lightMap,[UploadLevel(scaledWidth,scaledHeight,base)])
  end if
  while workWidth>scaledWidth or workHeight>scaledHeight
    data=downsample(data,workWidth,workHeight,config.simpleMipMaps)
    workWidth=workWidth>>1;workHeight=workHeight>>1
    if workWidth<1 then workWidth=1 end if;if workHeight<1 then workHeight=1 end if
  end while
  base=copyPixels(data,scaledWidth*scaledHeight*4)
  base=processing.lightScale(base,scaledWidth,scaledHeight,not mipmap,config.deviceSupportsGamma,config.gammaTable,config.intensityTable)
  levels=[UploadLevel(scaledWidth,scaledHeight,base)]
  if mipmap then
    levelPixels=base;levelWidth=scaledWidth;levelHeight=scaledHeight
    while levelWidth>1 or levelHeight>1
      levelPixels=downsample(levelPixels,levelWidth,levelHeight,config.simpleMipMaps)
      levelWidth=levelWidth>>1;levelHeight=levelHeight>>1
      if levelWidth<1 then levelWidth=1 end if;if levelHeight<1 then levelHeight=1 end if
      levels=levels+[UploadLevel(levelWidth,levelHeight,copyPixels(levelPixels,levelWidth*levelHeight*4))]
    end while
  end if
  return UploadPlan(scaledWidth,scaledHeight,format[0],format[1],lightMap,levels)
end function

/// Updates `registry.images`, `registry.buckets[hash]` in `mq3.renderer.image_registry.createImage`; returns `image`.
/// @param registry Mutable record or buffer; this call updates `registry.images`, `registry.buckets[hash]`.
/// @param name Argument 1 supplied to `bytes`.
/// @param pixels Value forwarded as `pixels` to `mq3.renderer.image_registry.prepareUpload`.
/// @param width Value forwarded as `width` to `mq3.renderer.image_registry.prepareUpload`.
/// @param height Value forwarded as `height` to `mq3.renderer.image_registry.prepareUpload`.
/// @param mipmap Value forwarded as `mipmap` to `mq3.renderer.image_registry.prepareUpload`.
/// @param allowPicmip Value forwarded as `allowPicmip` to `mq3.renderer.image_registry.prepareUpload`.
/// @param wrapClampMode Value used for `mq3.renderer.image_registry.Image.wrapClampMode`.
function createImage(registry,name,pixels,width,height,mipmap,allowPicmip,wrapClampMode)
  if registry==void or name==void then return fail("missing registry or name") end if
  if len(bytes(name))>=MAX_QPATH then return fail("image name is too long") end if
  if len(registry.images)>=MAX_DRAWIMAGES then return fail("MAX_DRAWIMAGES hit") end if
  lightMap=startsLightmap(name)
  upload=prepareUpload(pixels,width,height,mipmap,allowPicmip,lightMap,registry.config)
  tmu=0;if registry.activeTexture and lightMap then tmu=1 end if
  image=Image(TEXNUM_BASE+len(registry.images),name,width,height,upload.uploadWidth,upload.uploadHeight,mipmap,allowPicmip,wrapClampMode,tmu,upload.internalFormat,upload,0)
  registry.images=registry.images+[image]
  hash=hashValue(name);if registry.buckets[hash]==void then registry.buckets[hash]=[] end if
  registry.buckets[hash]=[image]+registry.buckets[hash]
  if registry.services.submitFn!=void then registry.services.submitFn(registry.services.context,image,upload) end if
  return image
end function

/// Forwards an image-registry diagnostic to the optional host callback.
/// @param registry Record providing `registry.services`.
/// @param text Argument 2 supplied to `registry.services.diagnosticFn`.
function warn(registry,text)
  if registry.services.diagnosticFn!=void then registry.services.diagnosticFn(registry.services.context,text) end if
end function

/// Finds an image by exact name in its hash bucket and warns when cached mipmap/picmip/wrap settings differ.
/// @param registry Record providing `registry.buckets`.
/// @param name Value forwarded as `name` to `mq3.renderer.image_registry.hashValue`.
/// @param mipmap Input tested by `image.mipmap!=mipmap`.
/// @param allowPicmip Input tested by `image.allowPicmip!=allowPicmip`.
/// @param wrapClampMode Input tested by `image.wrapClampMode!=wrapClampMode`.
function cached(registry,name,mipmap,allowPicmip,wrapClampMode)
  bucket=registry.buckets[hashValue(name)];if bucket==void then return void end if
  for i=0 to len(bucket)-1
    image=bucket[i]
    if image.imgName==name then
      if name!="*white" then
        if image.mipmap!=mipmap then warn(registry,"mixed mipmap: "+name) end if
        if image.allowPicmip!=allowPicmip then warn(registry,"mixed allowPicmip: "+name) end if
        if image.wrapClampMode!=wrapClampMode then warn(registry,"mixed wrapClampMode: "+name) end if
      end if
      return image
    end if
  end for
  return void
end function

/// Builds `data[i]` in `mq3.renderer.image_registry.upperExtension`; returns `decode(data)`.
/// @param name Argument 1 supplied to `bytes`.
function upperExtension(name)
  data=bytes(name);if len(data)<3 then return name end if
  for i=len(data)-3 to len(data)-1 if data[i]>=97 and data[i]<=122 then data[i]=data[i]-32 end if end for
  return decode(data)
end function

/// Computes `findImageFile` from `cached(registry,name,mipmap,allowPicmip,wrapClampMode)` using `mq3.renderer.image_registry.cached`, `registry.services.loadFn`, `mq3.renderer.image_registry.upperExtension`.
/// @param registry Record providing `registry.services`.
/// @param name Value forwarded as `name` to `mq3.renderer.image_registry.cached`.
/// @param mipmap Value forwarded as `mipmap` to `mq3.renderer.image_registry.cached`.
/// @param allowPicmip Value forwarded as `allowPicmip` to `mq3.renderer.image_registry.cached`.
/// @param wrapClampMode Value forwarded as `wrapClampMode` to `mq3.renderer.image_registry.cached`.
function findImageFile(registry,name,mipmap,allowPicmip,wrapClampMode)
  if registry==void or name==void then return void end if
  image=cached(registry,name,mipmap,allowPicmip,wrapClampMode);if image!=void then return image end if
  if registry.services.loadFn==void then return fail("image loader service unavailable") end if
  source=registry.services.loadFn(registry.services.context,name)
  if source==void then source=registry.services.loadFn(registry.services.context,upperExtension(name)) end if
  if source==void then return void end if
  image=createImage(registry,name,source.pixels,source.width,source.height,mipmap,allowPicmip,wrapClampMode)
  if registry.services.releaseFn!=void then registry.services.releaseFn(registry.services.context,source) end if
  return image
end function
