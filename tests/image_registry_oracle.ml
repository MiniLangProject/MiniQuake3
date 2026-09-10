import mq3.renderer.image_registry as images

function fixture(width,height,alpha)
  data=bytes(width*height*4,0);for i=0 to width*height-1 data[i*4]=i*17+3;data[i*4+1]=i*7+5;data[i*4+2]=i*3+9;data[i*4+3]=alpha end for;return data
end function

function main(args)
  names=["textures/base_wall/concrete.tga","TEXTURES\\BASE_WALL\\CONCRETE.JPG","*white","no_extension","a.b.c"]
  for i=0 to len(names)-1 print("H|"+names[i]+"|"+str(images.hashValue(names[i]))) end for
  registry=images.create(images.uploadConfig(),images.services(),true)
  first=images.createImage(registry,"*lightmap0",fixture(3,2,255),3,2,true,false,10497)
  print("C|"+str(first.texnum)+"|"+str(first.TMU)+"|"+str(first.width)+"|"+str(first.height)+"|"+str(first.uploadWidth)+"|"+str(first.uploadHeight)+"|"+str(first.internalFormat))
  second=images.createImage(registry,"textures/a.tga",fixture(2,2,128),2,2,false,true,10497)
  print("C|"+str(second.texnum)+"|"+str(second.TMU)+"|"+str(second.width)+"|"+str(second.height)+"|"+str(second.uploadWidth)+"|"+str(second.uploadHeight)+"|"+str(second.internalFormat))
  found=images.findImageFile(registry,"textures/a.tga",true,false,33071)
  print("F|"+str(found.texnum)+"|"+str(len(registry.images)))
  return 0
end function
