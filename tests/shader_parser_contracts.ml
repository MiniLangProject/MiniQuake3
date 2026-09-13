import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaders

function require(ok,text) if not ok then return error(7150,text) end if;return 1 end function
function main(args)
  count=0
  source="textures/demo/full {\n surfaceparm metalsteps\n surfaceparm noimpact\n cull none\n sort additive\n nomipmaps\n polygonOffset\n deformVertexes wave 100 sin 0 3 0 .7\n deformVertexes wave 0 sawtooth 1 2 .25 0\n {\n  clampmap textures/demo/a.tga\n  blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA\n  rgbGen wave sin 0.5 0.5 0 2\n  alphaGen portal 128\n  tcGen vector ( 1 0 0 ) ( 0 1 0 )\n  tcMod scroll 0.25 -0.5\n  tcMod rotate 45\n  alphaFunc GE128\n  depthFunc equal\n  depthWrite\n  detail\n }\n {\n  animMap 4 textures/a.tga textures/b.tga textures/c.tga\n  blendFunc filter\n  rgbGen vertex\n  tcGen lightmap\n }\n}\n"
  index=shaderIndex.build(source);shader=shaders.parseIndexed(index,"TEXTURES/DEMO/FULL")
  count=count+require(shader.name=="textures/demo/full","indexed definition name")
  count=count+require(len(shader.stages)==2,"two stages")
  count=count+require(shader.cull=="twoSided","two-sided cull")
  count=count+require(shader.sort==10.0,"named additive sort")
  count=count+require(shader.noMipMaps and shader.noPicMip,"nomipmaps coupling")
  count=count+require(shader.polygonOffset,"polygon offset")
  count=count+require(len(shader.surfaceParms)==2 and shader.surfaceParms[0]=="metalsteps","surface parameters")
  count=count+require(len(shader.deforms)==2 and shader.deforms[0].kind=="wave","wave deformations retained")
  count=count+require(shader.deforms[0].spread==0.01 and shader.deforms[0].wave.amplitude==3.0 and shader.deforms[1].spread==100.0,"deformation spread follows Baseq3 reciprocal and zero fallback")
  moving=shaders.parseText("{ deformVertexes move 1 -2 3 sawtooth 0 2 .25 .5 deformVertexes bulge 4 5 6 { map x } }","moving")
  count=count+require(len(moving.deforms)==2 and moving.deforms[0].kind=="move" and moving.deforms[0].vector==[1.0,-2.0,3.0] and moving.deforms[0].wave.func==4,"move deformation vector and waveform retained")
  count=count+require(moving.deforms[1].kind=="bulge" and moving.deforms[1].bulgeWidth==4.0 and moving.deforms[1].bulgeHeight==5.0 and moving.deforms[1].bulgeSpeed==6.0,"bulge deformation parameters retained")
  first=shader.stages[0]
  count=count+require(first.mapMode=="clamp" and first.images[0]=="textures/demo/a.tga","clamp map")
  count=count+require(first.blendSrc==shaders.GLS_SRCBLEND_SRC_ALPHA and first.blendDst==shaders.GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA,"explicit blend")
  count=count+require(first.rgbGen=="wave" and first.rgbWave.func==1 and first.rgbWave.frequency==2.0,"rgb waveform")
  count=count+require(first.alphaGen=="portal" and first.portalRange==128.0,"portal alpha range")
  count=count+require(shader.portalRange==128.0,"portal range propagated to shader")
  count=count+require(first.tcGen=="vector" and len(first.tcGenVectors)==2,"vector tcGen")
  count=count+require(len(first.texMods)==2 and first.texMods[0].kind=="scroll" and first.texMods[1].kind=="rotate","tcMod list")
  count=count+require(first.texMods[0].values[1]==-0.5 and first.texMods[1].values[0]==45.0,"tcMod values")
  count=count+require(first.alphaFunc==shaders.GLS_ATEST_GE_80 and first.depthFunc==shaders.GLS_DEPTHFUNC_EQUAL,"alpha and depth tests")
  count=count+require(first.depthWrite and first.depthExplicit and first.detail,"explicit depth write and detail")
  count=count+require((first.stateBits&shaders.GLS_DEPTHMASK_TRUE)!=0,"state bits include depth mask")
  second=shader.stages[1]
  count=count+require(second.animationSpeed==4.0 and len(second.images)==3,"animMap images")
  count=count+require(second.blendSrc==shaders.GLS_SRCBLEND_DST_COLOR and second.blendDst==shaders.GLS_DSTBLEND_ZERO,"filter blend")
  count=count+require(not second.depthWrite,"blend clears implicit depth mask")
  count=count+require(second.rgbGen=="vertex" and second.alphaGen=="vertex","vertex rgb implies vertex alpha")
  count=count+require(second.tcGen=="lightmap","lightmap tcGen")
  opaque=shaders.parseText("{ { map $whiteimage blendFunc GL_ONE GL_ZERO } }","opaque")
  count=count+require(opaque.stages[0].blendSrc==0 and opaque.stages[0].blendDst==0,"one-zero disables blending")
  count=count+require(opaque.stages[0].depthWrite,"one-zero restores depth mask")
  count=count+require(opaque.stages[0].rgbGen=="identitylighting","implicit rgbGen")
  base=shaders.parseText("{ nopicmip entityMergable clampTime 2.5 cull back { map $lightmap tcGen base } }","base")
  count=count+require(base.noPicMip and not base.noMipMaps and base.entityMergable,"general flags")
  count=count+require(base.clampTime==2.5 and base.cull=="back","clampTime and back cull")
  count=count+require(base.stages[0].isLightmap and base.stages[0].tcGen=="texture","lightmap marker and base alias")
  count=count+require(shaders.parseIndexed(index,"missing")==void,"missing indexed shader")
  count=count+require(try(shaders.parseText("{ { map } }","broken")) is error,"missing map rejected")
  count=count+require(try(shaders.parseText("{ { map x mystery y } }","broken")) is error,"unknown stage directive rejected")
  print("PASS: "+str(count)+" shader-parser contracts")
  return 0
end function
