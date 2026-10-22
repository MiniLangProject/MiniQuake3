import mq3.renderer.tr_image_runtime as image
import mq3.renderer.image_registry as registry

function req(ok,message) if not ok then return error(7666,message) end if;return 1 end function
function bmp()
 data=bytes(58,0);data[0]=66;data[1]=77;data[10]=54;data[14]=40;data[18]=1;data[22]=1;data[26]=1;data[28]=24;data[54]=3;data[55]=2;data[56]=1;return data
end function
function pcx()
 data=bytes(898,0);data[0]=10;data[2]=1;data[3]=8;data[65]=1;data[66]=1;data[128]=5;data[129]=12;data[130+15]=11;data[130+16]=22;data[130+17]=33;return data
end function
function main(args)
 count=0;config=registry.uploadConfig();config.maxTextureSize=1024;state=image.create(registry.create(config,void,false),void)
 count=count+req(image.generateHashValue("A/B.TGA")==image.generateHashValue("a\\b.jpg"),"hash")
 count=count+req(image.GL_TextureMode(state,"gl_linear_mipmap_linear") and state.filterMin==9987,"texture mode")
 pixels=bytes([10,20,30,255,40,50,60,255,70,80,90,255,100,110,120,255])
 blended=image.R_BlendOverTexture(pixels,1,[255,0,0,128]);count=count+req(blended[0]==66 and blended[1]==4 and blended[2]==7,"blend")
 count=count+req(len(image.ResampleTexture(pixels,2,2,1,1))==4,"resample")
 count=count+req(len(image.R_MipMap(pixels,2,2))==4 and len(image.R_MipMap2(pixels,2,2))==4,"mipmaps")
 decoded=image.LoadBMP(bmp());count=count+req(decoded.width==1 and decoded.pixels==bytes([1,2,3,255]),"BMP decode")
 decoded=image.LoadPCX32(pcx());count=count+req(decoded.width==1 and decoded.pixels==bytes([11,22,33,255]),"PCX decode")
 image.R_InitFogTable(state);count=count+req(len(state.fogTable)==256 and image.R_FogFactor(state,0.0,1.0)==0.0 and image.R_FogFactor(state,1.0,1.0)==1.0,"fog")
 image.R_SetColorMappings(state,2,1.0,2.0,true,32);count=count+req(state.overbrightBits==0 and state.intensityTable[200]==255,"color mappings without hardware gamma")
 created=image.R_CreateImage(state,"textures/a",pixels,2,2,true,true,image.GL_REPEAT);count=count+req(created.uploadWidth==2 and len(created.upload.levels)==2,"image upload")
 count=count+req(image.R_ImageList_f(state)[0][7]=="textures/a" and image.R_SumOfUsedImages(state,0)==4,"image diagnostics")
 created.frameUsed=7;count=count+req(image.R_SumOfUsedImages(state,0)==0 and image.R_SumOfUsedImages(state,7)==4,"per-frame image accounting")
 parsed=image.CommaParse(" //x\n torso,models/sarge ",0);count=count+req(parsed[0]=="torso","comma parser")
 image.R_InitSkins(state);handle=image.RE_RegisterSkin(state,"models/testshader");count=count+req(handle==1 and image.R_GetSkinByHandle(state,handle).name=="models/testshader","single-shader skin")
 count=count+req(image.R_GetSkinByHandle(state,999).name=="<default skin>" and len(image.R_SkinList_f(state))==2,"skin fallback/list")
 dest=image.jpegDest(16);count=count+req(image.init_destination(dest)==16 and image.empty_output_buffer(dest) and image.term_destination(dest,7)==7,"jpeg destination")
 image.R_DeleteTextures(state);count=count+req(len(state.images.images)==0,"delete textures")
 image.R_InitImages(state,0,1.0,1.0,false,32);count=count+req(len(state.images.images)==37 and state.defaultImage!=void and state.fogImage!=void,"builtin images")
 corrected=image.R_GammaCorrect(state,bytes([0,127,255]));count=count+req(corrected==bytes([0,127,255]),"gamma correction")
 print("PASS: "+str(count)+" tr_image runtime contracts");return 0
end function
