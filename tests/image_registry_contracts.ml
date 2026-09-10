import mq3.renderer.image_registry as images

struct Context loads releases submits diagnostics requested source end struct
function req(ok,text) if not ok then return error(7171,text) end if;return 1 end function
function identity() table=bytes(256,0);for i=0 to 255 table[i]=i end for;return table end function
function pixels(width,height,alpha) data=bytes(width*height*4,0);for i=0 to width*height-1 data[i*4]=i;data[i*4+1]=i+1;data[i*4+2]=i+2;data[i*4+3]=alpha end for;return data end function
function load(context,name) context.loads=context.loads+1;context.requested=context.requested+[name];if name=="textures/fallback.TGA" then return context.source end if;return void end function
function release(context,source) context.releases=context.releases+1 end function
function submit(context,image,upload) context.submits=context.submits+1 end function
function diagnostic(context,message) context.diagnostics=context.diagnostics+[message] end function
function host(context) return images.Services(load,release,submit,diagnostic,context) end function

function main(args)
  count=0;id=identity();cfg=images.UploadConfig(false,0,2048,0,images.TC_NONE,true,false,id,id)
  count=count+req(images.hashValue("textures/a.tga")==images.hashValue("TEXTURES\\A.JPG"),"hash folds case slash and extension")
  count=count+req(images.hashValue("a.b.c")==images.hashValue("a.zzz"),"hash stops at first dot")
  count=count+req(images.upperExtension("textures/a.tga")=="textures/a.TGA","extension fallback")
  decoded=images.sourceFromTga(bytes([0,0,2,0,0,0,0,0,0,0,0,0,1,0,1,0,24,0,1,2,3]))
  count=count+req(decoded.width==1 and decoded.height==1 and decoded.pixels==bytes([3,2,1,255]),"TGA loader adapter")
  opaque=images.prepareUpload(pixels(2,2,255),2,2,false,false,false,cfg)
  count=count+req(opaque.uploadWidth==2 and opaque.uploadHeight==2 and opaque.samples==3 and opaque.internalFormat==3,"opaque direct upload")
  count=count+req(len(opaque.levels)==1 and opaque.levels[0].pixels==pixels(2,2,255),"non-mipmap direct path is unscaled")
  alpha=images.prepareUpload(pixels(2,2,128),2,2,false,false,false,cfg)
  count=count+req(alpha.samples==4 and alpha.internalFormat==4,"alpha selects RGBA")
  cfg16=images.UploadConfig(false,0,2048,16,images.TC_NONE,true,false,id,id)
  count=count+req(images.prepareUpload(pixels(1,1,255),1,1,false,false,false,cfg16).internalFormat==images.GL_RGB5,"16-bit RGB format")
  count=count+req(images.prepareUpload(pixels(1,1,1),1,1,false,false,false,cfg16).internalFormat==images.GL_RGBA4,"16-bit RGBA format")
  cfg32=images.UploadConfig(false,0,2048,32,images.TC_NONE,true,false,id,id)
  count=count+req(images.prepareUpload(pixels(1,1,255),1,1,false,false,false,cfg32).internalFormat==images.GL_RGB8,"32-bit RGB format")
  count=count+req(images.prepareUpload(pixels(1,1,1),1,1,false,false,false,cfg32).internalFormat==images.GL_RGBA8,"32-bit RGBA format")
  s3=images.UploadConfig(false,0,2048,0,images.TC_S3TC,true,false,id,id)
  count=count+req(images.prepareUpload(pixels(1,1,255),1,1,false,false,false,s3).internalFormat==images.GL_RGB4_S3TC,"S3TC RGB format")
  light=images.prepareUpload(pixels(1,1,2),1,1,false,false,true,cfg32)
  count=count+req(light.lightMap and light.samples==3 and light.internalFormat==3,"lightmap format")
  round=images.UploadConfig(true,1,2,0,images.TC_NONE,true,false,id,id)
  plan=images.prepareUpload(pixels(5,3,255),5,3,true,true,false,round)
  count=count+req(plan.uploadWidth==2 and plan.uploadHeight==1,"round-down picmip and texture limit")
  count=count+req(len(plan.levels)==2 and plan.levels[1].width==1 and plan.levels[1].height==1,"complete mip chain")
  up=images.prepareUpload(pixels(3,2,255),3,2,true,false,false,cfg)
  count=count+req(up.uploadWidth==4 and up.uploadHeight==2 and len(up.levels)==3,"power-of-two resample and mips")
  context=Context(0,0,0,[],[],images.Source(2,1,pixels(2,1,255)));registry=images.create(cfg,host(context),true)
  created=images.createImage(registry,"*lightmap0",pixels(2,2,255),2,2,true,false,10497)
  count=count+req(created.texnum==1024 and created.TMU==1 and context.submits==1,"create assigns texnum TMU and submits")
  regular=images.createImage(registry,"textures/a.tga",pixels(1,1,255),1,1,false,true,10497)
  count=count+req(regular.texnum==1025 and regular.TMU==0 and len(registry.images)==2,"sequential image creation")
  reused=images.findImageFile(registry,"textures/a.tga",true,false,33071)
  count=count+req(reused==regular and context.loads==0 and len(context.diagnostics)==3,"cache reuse warns for mismatched flags")
  white=images.createImage(registry,"*white",pixels(1,1,255),1,1,false,false,10497)
  images.findImageFile(registry,"*white",true,true,33071)
  count=count+req(len(context.diagnostics)==3,"white image accepts any flags")
  loaded=images.findImageFile(registry,"textures/fallback.tga",false,false,10497)
  count=count+req(loaded!=void and loaded.imgName=="textures/fallback.tga" and context.loads==2,"uppercase extension fallback")
  count=count+req(context.requested==["textures/fallback.tga","textures/fallback.TGA"],"loader request order")
  count=count+req(context.releases==1 and context.submits==4,"loaded source released after submit")
  count=count+req(images.findImageFile(registry,"missing.jpg",false,false,10497)==void and context.loads==4,"missing source returns void")
  sameHashUpper=images.findImageFile(registry,"TEXTURES/A.JPG",false,false,10497)
  count=count+req(sameHashUpper==void,"cache names remain case-sensitive")
  count=count+req(try(images.createImage(registry,"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijkl",pixels(1,1,255),1,1,false,false,0)) is error,"MAX_QPATH enforced")
  count=count+req(try(images.prepareUpload(bytes(3,0),1,1,false,false,false,cfg)) is error,"truncated image rejected")
  count=count+req(try(images.prepareUpload(pixels(1,1,255),1,1,false,false,false,images.UploadConfig(false,-1,2,0,0,true,false,id,id))) is error,"negative picmip rejected")
  count=count+req(try(images.findImageFile(images.create(cfg,images.services(),false),"a.tga",false,false,0)) is error,"missing loader boundary")
  print("PASS: "+str(count)+" image-registry contracts")
  return 0
end function
