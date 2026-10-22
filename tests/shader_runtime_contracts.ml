import mq3.renderer.shader_runtime as runtime
import mq3.renderer.shader_parser as shaders
import mq3.shared.parser as tokens

struct Context fixes imageLoads end struct
function image(context,name,mip) context.imageLoads=context.imageLoads+1;if name=="textures/implicit" or name=="ui/icon" then return "image:"+name end if;return void end function
function fix(context,index) context.fixes=context.fixes+[index];return 1 end function
function require(ok,text) if not ok then return error(7650,text) end if;return 1 end function

function main(args)
  checks=0;context=Context([],0);state=runtime.create(context,image,fix)
  checks=checks+require(runtime.generateHashValue("A/B.tga",2048)==runtime.generateHashValue("a\\b.jpg",2048),"hash normalization")
  checks=checks+require(runtime.nameToAFunc("GE128")==shaders.GLS_ATEST_GE_80,"alpha function facade")
  checks=checks+require(runtime.nameToSrcBlendMode("GL_SRC_ALPHA")==shaders.GLS_SRCBLEND_SRC_ALPHA,"source blend facade")
  checks=checks+require(runtime.nameToDstBlendMode("GL_ONE_MINUS_SRC_ALPHA")==shaders.GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA,"destination blend facade")
  checks=checks+require(runtime.nameToGenFunc("sawtooth")==4,"wave function facade")
  vector=runtime.parseVector(tokens.create("( 1 -2 3 )"),3);checks=checks+require(vector==[1.0,-2.0,3.0],"vector facade")
  wave=runtime.parseWaveForm(tokens.create("triangle 1 2 3 4"));checks=checks+require(wave.func==3 and wave.frequency==4.0,"wave facade")
  mod=runtime.parseTexMod(["scroll",".25","-.5"]);checks=checks+require(mod.kind=="scroll" and mod.values[1]==-0.5,"texmod facade")
  deform=runtime.parseDeform(tokens.create("bulge 1 2 3"));checks=checks+require(deform.bulgeHeight==2.0,"deform facade")
  stage=runtime.parseStage(tokens.create("map x blendFunc blend rgbGen vertex }"));checks=checks+require(stage.images[0]=="x" and stage.alphaGen=="vertex","stage facade")
  sky=runtime.parseSkyParms("env/space",512.0,"-");checks=checks+require(sky.cloudHeight==512.0 and sky.outerBox=="env/space","sky parameters")
  sources=[runtime.ShaderSource("first.shader","textures/dupe { { map first } }\ntextures/sky { surfaceparm sky { map cloud } }\n"),runtime.ShaderSource("last.shader","textures/dupe { { map last } }\ntextures/detail { { map base rgbGen identity } { map detail blendFunc filter rgbGen identity } }\n")]
  checks=checks+require(runtime.scanAndLoadShaderFiles(state,sources)==4,"combined shader scan")
  checks=checks+require(runtime.findShaderInShaderText(state,"TEXTURES/DUPE")!=void,"indexed lookup")
  parsed=runtime.parseShader("{ surfaceparm metalsteps sort decal { map x } }","x");checks=checks+require(parsed.sort==4.0 and parsed.surfaceParms[0]=="metalsteps","full parse facade")
  runtime.parseSort(parsed,"additive");runtime.parseSurfaceParm(parsed,"NONSOLID");checks=checks+require(parsed.sort==10.0 and parsed.surfaceParms[1]=="nonsolid","sort and surface mutation")
  checks=checks+require(runtime.valid(parsed),"valid parsed shader")
  checks=checks+require(len(runtime.modes())==5,"collapse mode table")
  detail=shaders.parseIndexed(state.index,"textures/detail");collapse=runtime.collapseMultitexture(detail,true,true);checks=checks+require(collapse.collapsed and collapse.environment=="modulate","multitexture collapse")
  state.multitexture=false;checks=checks+require(not runtime.collapseMultitexture(detail,state.multitexture,true).collapsed,"multitexture capability gate");state.multitexture=true
  finished=runtime.finishShader(state,detail,0,true,void,true);checks=checks+require(finished.passes==1 and finished.explicitlyDefined,"finish and pass collapse")
  skyShader=shaders.parseIndexed(state.index,"textures/sky");skyFinished=runtime.finishShader(state,skyShader,runtime.LIGHTMAP_NONE,true,void,true);checks=checks+require(skyFinished.shader.sort==runtime.SS_ENVIRONMENT and skyFinished.iteratorName=="sky","sky finish iterator")
  runtime.createInternalShaders(state,"image:<default>");checks=checks+require(len(state.shaders)==2 and state.shaders[0].handle==0 and state.shaders[1].internal,"internal shaders")
  runtime.scanAndLoadShaderFiles(state,sources)
  dupe=runtime.r_FindShader(state,"textures/dupe.tga",runtime.LIGHTMAP_NONE,true);checks=checks+require(dupe.explicitlyDefined and dupe.shader.stages[0].images[0]=="last","reverse script precedence")
  implicit=runtime.r_FindShader(state,"textures/implicit",runtime.LIGHTMAP_NONE,true);checks=checks+require(not implicit.defaultShader and implicit.image=="image:textures/implicit" and implicit.shader.stages[0].rgbGen=="lightingdiffuse","implicit entity shader")
  gui=runtime.re_RegisterShaderNoMip(state,"ui/icon");checks=checks+require(gui>0 and state.shaders[gui].shader.stages[0].alphaGen=="vertex" and not state.shaders[gui].mipRawImage,"no-mip 2D registration")
  missing=runtime.r_FindShader(state,"textures/missing",runtime.LIGHTMAP_NONE,true);checks=checks+require(missing.defaultShader,"missing image is retained as defaulted shader")
  checks=checks+require(runtime.r_FindShaderByName(state,"textures/implicit.jpg").handle==implicit.handle,"extensionless name lookup")
  fromImage=runtime.re_RegisterShaderFromImage(state,"direct",runtime.LIGHTMAP_BY_VERTEX,"direct-image",true);checks=checks+require(fromImage>0 and state.shaders[fromImage].shader.stages[0].rgbGen=="exactvertex","register from image")
  before=state.sorted[0].shader.sort;checks=checks+require(before<=state.sorted[len(state.sorted)-1].shader.sort and len(context.fixes)>0,"stable sort and command fix callback")
  changed=runtime.r_RemapShader(state,"textures/implicit","textures/dupe","1.25");checks=checks+require(changed==1 and implicit.remappedName=="textures/dupe" and implicit.timeOffset=="1.25","stable handle shader remap")
  lines=runtime.r_ShaderList_f(state,true);checks=checks+require(len(lines)==len(state.shaders) and len(lines)>5,"sorted shader listing")
  extBefore=len(state.shaders);checks=checks+require(runtime.createExternalShaders(state)==3 and len(state.shaders)>=extBefore,"external shaders")
  initState=runtime.create(context,image,fix);count=runtime.r_InitShaders(initState,sources,"image:<default>");checks=checks+require(count==4 and initState.initialized and len(initState.shaders)>=5,"complete shader initialization")
  vertex=shaders.parseText("{ { map $lightmap } { map diffuse } }","vertex");vertex.sort=runtime.SS_OPAQUE;chosen=runtime.vertexLightingCollapse(vertex,runtime.LIGHTMAP_NONE);checks=checks+require(len(vertex.stages)==1 and chosen.images[0]=="diffuse" and chosen.rgbGen=="lightingdiffuse","vertex lighting collapse rank")
  checks=checks+require(runtime.computeStageIteratorFunc(vertex,runtime.CollapseResult(false,"",0,void,void),false)=="vertexLitTexture","vertex-lit fast path")
  print("PASS: "+str(checks)+" complete tr_shader runtime contracts")
  return 0
end function
