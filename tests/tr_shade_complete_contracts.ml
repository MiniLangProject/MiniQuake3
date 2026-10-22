import mq3.renderer.tr_shade_runtime as shade
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_dynamic_lights as dlights
import mq3.renderer.playable_fog as fogRuntime
import mq3.renderer.shader_parser as shaderParser

function req(ok,label) if not ok then return error(7792,"tr_shade contract: "+label) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.001 end function
function stage(slots,speed,tcGen,rgb,alpha,mods)
  return materials.RuntimeStage([],[],slots,speed,mods,materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,tcGen,rgb,shaderParser.blankWave(),alpha,shaderParser.blankWave(),[20,40,60,80],false,false,true,false,256.0,[[1.0,0.0,0.0],[0.0,1.0,0.0]])
end function
function shader(name,timeOffset,clampTime,passes,sort,remap)
  return shade.ShaderState(name,remap,timeOffset,clampTime,sort,1,false,0,passes,"generic")
end function

function main(args)
  count=0
  positions=[[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[1.0,1.0,0.0]];colors=[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]];uv0=[[0.0,0.0],[1.0,0.0],[0.0,1.0],[1.0,1.0]];uv1=[[0.1,0.2],[0.3,0.4],[0.5,0.6],[0.7,0.8]]
  vertex=shade.R_ArrayElementDiscrete(1,positions,colors,uv0,uv1,1);count=count+req(vertex.position==positions[1] and vertex.color==colors[1] and vertex.texture1==uv1[1],"discrete multitexture element")
  vertex0=shade.R_ArrayElementDiscrete(0,positions,colors,uv0,uv1,0);count=count+req(vertex0.texture1==void,"discrete single texture element")
  strip=shade.R_DrawStripElements([0,1,2,2,1,3]);count=count+req(strip.begins==1 and strip.vertexes==4 and strip.strips==[[0,1,2,3]],"odd strip continuation")
  strip2=shade.R_DrawStripElements([0,1,2,2,1,3,2,3,4]);count=count+req(strip2.begins==1 and strip2.vertexes==5 and strip2.strips==[[0,1,2,3,4]],"even strip continuation")
  split=shade.R_DrawStripElements([0,1,2,4,5,6]);count=count+req(split.begins==2 and split.vertexes==6,"strip restart")
  empty=shade.R_DrawStripElements([]);count=count+req(empty.begins==1 and empty.vertexes==0,"empty strip keeps begin counter")
  count=count+req(shade.R_DrawElements([0,1,2],0,true).mode=="triangles" and shade.R_DrawElements([0,1,2],0,false).mode=="strip-array","automatic primitive selection")
  count=count+req(shade.R_DrawElements([0,1,2],3,false).mode=="strip-discrete" and shade.R_DrawElements([0,1,2],9,false).mode=="none","explicit primitive selection")
  count=count+req(shade.R_BindAnimatedImage(false,[7],2.0,5.0)==7 and shade.R_BindAnimatedImage(true,[7],2.0,5.0)==-2,"static and cinematic binding")
  count=count+req(shade.R_BindAnimatedImage(false,[10,11,12],2.0,0.75)==11 and shade.R_BindAnimatedImage(false,[10,11],2.0,-1.0)==10,"animated image clock clamp and wrap")
  normals=shade.DrawNormals([[1.0,2.0,3.0]],[[0.5,-1.0,2.0]]);count=count+req(normals.vertices==[[1.0,2.0,3.0],[2.0,0.0,7.0]],"normal debug line")
  count=count+req(shade.DrawTris([2,1,0]).indexes==[2,1,0],"triangle debug indexes")
  original=shader("old",0.0,0.0,1,3.0,void);mapped=shader("mapped",1.5,2.0,2,3.0,void);original.remappedShader=mapped;surface=shade.RB_BeginSurface(original,4,10.0);count=count+req(surface.shader.name=="mapped" and surface.fogNum==4 and surface.shaderTime==2.0 and surface.numPasses==2,"surface remap, reset and clock clamp")
  animated=stage([20,21],2.0,"texture","identity","identity",[]);lightmap=stage([3],0.0,"lightmap","identity","identity",[]);surface.numIndexes=6;multi=shade.DrawMultitextured(surface,[animated,lightmap],false,true);count=count+req(multi.texture0==20 and multi.texture1==3 and multi.environment=="modulate" and multi.portalFill,"multitexture binding and portal workaround")
  multiReplace=shade.DrawMultitextured(surface,[animated,lightmap],true,false);count=count+req(multiReplace.environment=="replace","lightmap debug texture environment")
  light=dlights.Light([0.0,0.0,0.0],2.0,[1.0,0.5,0.25],false);passes=shade.ProjectDlightTexture(positions,[0,1,2,2,1,3],1,[light]);count=count+req(len(passes)==1 and passes[0].indexes==[0,1,2,2,1,3] and passes[0].colors[0]==[255,127,63,255],"projected dynamic light vertices and indexes")
  rejected=shade.ProjectDlightTexture([[10.0,10.0,0.0],[11.0,10.0,0.0],[10.0,11.0,0.0]],[0,1,2],1,[light]);count=count+req(len(rejected)==0,"projected light common clip rejection")
  skipped=shade.ProjectDlightTexture(positions,[0,1,2],0,[light]);count=count+req(len(skipped)==0,"dynamic light mask")
  fog=fogRuntime.Fog("f",[0.25,0.5,0.75],64.0,1.0/512.0,[[-2.0,-2.0,-2.0],[2.0,2.0,2.0]],[0.0,0.0,1.0,0.0],false);fogPass=shade.RB_FogPass([positions[0],positions[1]],[0,1,0],fog,[0.0,0.0,0.0],[1.0,0.0,0.0],true);count=count+req(fogPass.colors==[[63,127,191,255],[63,127,191,255]] and fogPass.depthEqual and len(fogPass.uvs)==2,"fog overlay color, coordinates and depth mode")
  constStage=stage([1],0.0,"texture","const","const",[]);computed=shade.ComputeColors(constStage,[[200,100,50,25]],[4,5,6,7],[[0.0,0.0,0.0]],[0.0,0.0,8.0],0,void,"none");count=count+req(computed==[[20,40,60,80]],"stage color generators")
  fogged=shade.ComputeColors(stage([1],0.0,"texture","exactvertex","vertex",[]),[[200,100,50,25]],[4,5,6,7],[[0.0,0.0,0.0]],[0.0,0.0,8.0],0,[1.0],"rgba");count=count+req(fogged==[[0,0,0,0]],"stage fog color adjustment")
  allNormals=[[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0]]
  identity=shade.ComputeTexCoords(stage([1],0.0,"texture","identity","identity",[]),uv0,uv1,positions,allNormals,[0.0,0.0,8.0],[0.0,0.0],0,void,[1.0,0.0,0.0]);count=count+req(identity==uv0,"texture coordinate generation")
  vectors=shade.ComputeTexCoords(stage([1],0.0,"vector","identity","identity",[]),uv0,uv1,positions,allNormals,[0.0,0.0,8.0],[0.0,0.0],0,void,[1.0,0.0,0.0]);count=count+req(vectors==[[0.0,0.0],[1.0,0.0],[0.0,1.0],[1.0,1.0]],"vector texture coordinate generation")
  fogCoords=shade.ComputeTexCoords(stage([1],0.0,"fog","identity","identity",[]),uv0,uv1,positions,allNormals,[0.0,0.0,0.0],[0.0,0.0],0,fog,[1.0,0.0,0.0]);count=count+req(len(fogCoords)==4 and near(fogCoords[1][0],1.0/512.0+1.0/512.0),"fog texture coordinate generation")
  counters=shade.EndCounters(2,10,12,24);surface.numPasses=2;ended=shade.RB_EndSurface(surface,[0,1,2],positions,[[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0]],counters,0,false,17,true,true);count=count+req(ended.counters.shaders==3 and ended.counters.vertexes==14 and ended.counters.indexes==15 and ended.counters.totalIndexes==30 and ended.iteratorResult==17 and ended.debugTris!=void and ended.debugNormals!=void,"end-surface counters, iterator and diagnostics")
  emptyEnd=shade.RB_EndSurface(surface,[],[],[],counters,0,false,99,false,false);count=count+req(emptyEnd.skipped and emptyEnd.counters==counters,"empty end surface")
  shadowEnd=shade.RB_EndSurface(surface,[0,1,2],positions,[],counters,0,true,44,false,false);count=count+req(shadowEnd.shadow and shadowEnd.iteratorResult==44,"shadow surface delegation")
  debugEnd=shade.RB_EndSurface(surface,[0,1,2],positions,[],counters,2,false,44,false,false);count=count+req(debugEnd.skipped,"debug sort cutoff")
  print("PASS: "+str(count)+" complete tr_shade contracts");return 0
end function
