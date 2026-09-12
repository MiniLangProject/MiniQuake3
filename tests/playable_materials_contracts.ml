import mq3.format.bsp as bsp
import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.playable_materials as materials
import mq3.platform.playable_multitexture as multitexture

struct Point x y depth end struct

function require(ok,label) if not ok then return error(7487,"playable materials contract: "+label) end if;return 1 end function
function putName(data,offset,name) source=bytes(name);for index=0 to len(source)-1 data[offset+index]=source[index] end for;return void end function
function mapFixture()
  data=bytes(216,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  offsets[1]=0;lengths[1]=216;counts[1]=3
  putName(data,0,"textures/gothic/a");putName(data,72,"textures/gothic/b.jpg");putName(data,144,"textures/common/caulk")
  return bsp.BSP(data,offsets,lengths,counts)
end function
function tgaPixel()
  data=bytes(21,0);data[2]=2;data[12]=1;data[14]=1;data[16]=24;data[18]=7;data[19]=11;data[20]=19;return data
end function

function main(args)
  count=0;map=mapFixture()
  count=count+require(materials.shaderName(map,0)=="textures/gothic/a","first BSP shader")
  count=count+require(materials.shaderName(map,1)=="textures/gothic/b.jpg","second BSP shader")
  count=count+require(materials.shaderName(map,2)=="textures/common/caulk","third BSP shader")
  count=count+require(try(materials.shaderName(map,-1)) is error,"negative shader index")
  count=count+require(try(materials.shaderName(map,3)) is error,"high shader index")
  count=count+require(materials.candidates("textures/a")==["textures/a.tga","textures/a.jpg","textures/a.jpeg"],"extension candidates")
  count=count+require(materials.candidates("textures/a.TGA")==["textures/a.TGA"],"TGA extension retained")
  count=count+require(materials.candidates("textures/a.JpG")==["textures/a.JpG"],"JPEG extension retained")
  count=count+require(materials.candidates("")==[],"empty candidate list")
  source="textures/a { { map $lightmap } { map textures/a_d.tga } } textures/b { { clampMap textures/b.jpg } } textures/c { { animMap 2 textures/c1.tga textures/c2.tga } } textures/d { { map $whiteimage } }"
  index=shaderIndex.build(source)
  count=count+require(materials.mappedImageName(index,"textures/a")=="textures/a_d.tga","lightmap skipped")
  count=count+require(materials.mappedImageName(index,"TEXTURES/B")=="textures/b.jpg","case-insensitive clamp map")
  count=count+require(materials.mappedImageName(index,"textures/c")=="textures/c1.tga","first animation frame")
  count=count+require(materials.mappedImageName(index,"textures/d")==void,"white image skipped")
  count=count+require(materials.mappedImageName(index,"textures/missing")==void,"missing shader")
  decoded=materials.decodeAsset("textures/pixel.tga",tgaPixel())
  count=count+require(decoded.width==1 and decoded.height==1,"TGA dimensions")
  count=count+require(decoded.pixels==bytes([19,11,7,255]),"TGA RGBA conversion")
  count=count+require(try(materials.decodeAsset("textures/a.png",bytes(1,0))) is error,"unsupported extension")
  runtime=materials.RuntimeStage(["a","b","c"],[decoded,decoded,decoded],[70,71,72],2.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"identitylighting",shaderParser.blankWave())
  count=count+require(materials.frameIndex(runtime,0)==0 and materials.frameIndex(runtime,499)==0,"animMap initial frame")
  count=count+require(materials.frameIndex(runtime,500)==1 and materials.frameIndex(runtime,1500)==0,"animMap frequency and wrap")
  count=count+require(materials.slotAt(runtime,1000)==72,"animMap slot selection")
  saw=shaderParser.Wave(4,0.0,1.0,0.0,2.0);inverse=shaderParser.Wave(5,0.0,1.0,0.0,2.0)
  count=count+require(materials.waveValue(saw,125)==0.25 and materials.waveValue(inverse,125)==0.75,"saw wave generators")
  count=count+require(materials.waveValue(saw,1)==0.001953125,"wave uses original 1024-entry lookup phase")
  count=count+require(materials.waveValue(saw,500)==0.0 and materials.waveValue(inverse,500)==1.0,"wave phase wraps")
  count=count+require(materials.waveValue(shaderParser.Wave(4,0.9,0.5,0.0,1.0),500)==1.0 and materials.waveValue(shaderParser.Wave(4,-1.0,0.5,0.0,1.0),500)==0.0,"wave colors clamp")
  identityStage=materials.RuntimeStage(["a"],[decoded],[70],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"identity",shaderParser.blankWave())
  inverseVertexStage=materials.RuntimeStage(["a"],[decoded],[70],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"oneminusvertex",shaderParser.blankWave())
  count=count+require(materials.stageLight(identityStage,0.25,0)==1.0 and materials.stageLight(inverseVertexStage,0.25,0)==0.75,"static rgb generators")
  waveStage=materials.RuntimeStage(["a"],[decoded],[70],0.0,[],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"wave",inverse)
  count=count+require(materials.stageLight(waveStage,0.25,125)==191/255.0,"wave stage byte quantization")
  parsed=shaderParser.parseText("{\n{\nmap textures/a.tga\nblendFunc add\ntcMod scroll 0.25 -0.5\ntcMod rotate 90\n}\n}","fx")
  mods=materials.stageMods(parsed.stages[0])
  count=count+require(materials.stageBlend(parsed.stages[0])==materials.BLEND_ADD,"additive blend classification")
  count=count+require(len(mods)==2 and mods[0].kind=="scroll" and mods[1].kind=="rotate","tcMod order retained")
  alpha=shaderParser.parseText("{\n{\nmap textures/a.tga\nblendFunc blend\n}\n}","alpha")
  count=count+require(materials.stageBlend(alpha.stages[0])==materials.BLEND_ALPHA,"alpha blend classification")
  cutout=shaderParser.parseText("{\n{\nmap textures/a.tga\nalphaFunc GE128\n}\n}","cutout")
  count=count+require(materials.stageAlphaTest(cutout.stages[0])==materials.ALPHA_TEST_GE128,"GE128 alpha-test classification")
  scroll=materials.RuntimeStage(["a"],[decoded],[70],0.0,[materials.UvMod("scroll",0.25,-0.5)],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"identitylighting",shaderParser.blankWave())
  count=count+require(materials.transformUV(scroll,[0.1,0.2],1000)==[0.35,0.7],"scroll wraps negative offset")
  rotate=materials.RuntimeStage(["a"],[decoded],[70],0.0,[materials.UvMod("rotate",90.0,0.0)],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"identitylighting",shaderParser.blankWave())
  rotated=materials.transformUV(rotate,[1.0,0.5],1000)
  count=count+require(rotated[0]>0.499 and rotated[0]<0.501 and rotated[1]>-0.001 and rotated[1]<0.001,"clockwise center rotation")
  count=count+require(try(materials.transformUV(void,[0.0,0.0],0)) is error,"UV transform validation")
  catalog=materials.Catalog([materials.Material(2,"shader","image",decoded,67,[runtime])],0,1,1,3,1,0)
  count=count+require(materials.slotFor(catalog,2)==67,"material slot lookup")
  count=count+require(materials.slotFor(catalog,1)==-1 and materials.slotFor(void,2)==-1,"missing slot lookup")
  multitexture.draw(-1,-1,Point(0.0,0.0,1.0),[0.0,0.0],[0.0,0.0],1.0,Point(1.0,0.0,1.0),[1.0,0.0],[1.0,0.0],1.0,Point(0.0,1.0,1.0),[0.0,1.0],[0.0,1.0],1.0,255,255,255)
  multitexture.setState(multitexture.BLEND_ADD,true,false);multitexture.setAlphaTest(multitexture.ALPHA_TEST_GE128);multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setState(multitexture.BLEND_OPAQUE,false,true)
  count=count+require(true,"multitexture FFI safe before window creation")
  print("PASS: "+str(count)+" playable material contracts")
  return 0
end function
