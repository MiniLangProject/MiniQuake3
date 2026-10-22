import mq3.renderer.tr_model_runtime as tr
import mq3.renderer.md4_animation as animation
import mq3.compat.numeric as n
import mq3.format.md3 as md3

function require(ok,text) if not ok then return error(7791,text) end if;return 1 end function
function w16(data,at,value) data[at]=value&255;data[at+1]=(value>>8)&255;return void end function
function w32(data,at,value) n.writeU32(data,at,value);return void end function
function wf(data,at,value) w32(data,at,n.floatBits(value));return void end function
function text(data,at,value,capacity) raw=bytes(value);limit=len(raw);if limit>capacity then limit=capacity end if;for index=0 to limit-1 data[at+index]=raw[index] end for;return void end function
function md3Fixture()
  data=bytes(512,0);w32(data,0,md3.MD3_IDENT);w32(data,4,md3.MD3_VERSION);text(data,8,"unit.md3",64);w32(data,76,1);w32(data,80,1);w32(data,84,1);w32(data,92,108);w32(data,96,164);w32(data,100,276);w32(data,104,512)
  wf(data,108,-2.0);wf(data,112,-3.0);wf(data,116,-4.0);wf(data,120,5.0);wf(data,124,6.0);wf(data,128,7.0);text(data,164,"tag_weapon",64);wf(data,228,4.0);wf(data,232,5.0);wf(data,236,6.0);for axis=0 to 2 for component=0 to 2 value=0.0;if axis==component then value=1.0 end if;wf(data,240+axis*12+component*4,value) end for end for
  s=276;w32(data,s,md3.MD3_IDENT);text(data,s+4,"Gun_1",64);w32(data,s+72,1);w32(data,s+76,1);w32(data,s+80,3);w32(data,s+84,1);w32(data,s+88,108);w32(data,s+92,120);w32(data,s+96,188);w32(data,s+100,212);w32(data,s+104,236);w32(data,s+108,0);w32(data,s+112,1);w32(data,s+116,2);text(data,s+120,"models/test",64)
  wf(data,s+188,0.0);wf(data,s+192,0.0);wf(data,s+196,1.0);wf(data,s+200,0.0);wf(data,s+204,0.0);wf(data,s+208,1.0);w16(data,s+212,64);w16(data,s+220,64);w16(data,s+228,64);return data
end function
function md4Fixture()
  data=bytes(412,0);w32(data,0,tr.MD4_IDENT);w32(data,4,tr.MD4_VERSION);text(data,8,"unit.md4",64);w32(data,72,1);w32(data,76,1);w32(data,84,100);w32(data,88,1);w32(data,92,188);w32(data,96,412)
  wf(data,100,-1.0);wf(data,104,-2.0);wf(data,108,-3.0);wf(data,112,4.0);wf(data,116,5.0);wf(data,120,6.0);wf(data,136,7.0)
  for row=0 to 2 for column=0 to 3 value=0.0;if row==column then value=1.0 end if;wf(data,140+row*16+column*4,value) end for end for
  w32(data,188,1);w32(data,192,12);w32(data,196,224);s=200;text(data,s+4,"body",64);text(data,s+68,"models/body",64);w32(data,s+140,1);w32(data,s+144,168);w32(data,s+148,0);w32(data,s+152,168);w32(data,s+156,1);w32(data,s+164,212)
  v=368;wf(data,v+8,1.0);w32(data,v+20,1);w32(data,v+24,0);wf(data,v+28,1.0);wf(data,v+32,2.0);wf(data,v+36,3.0);wf(data,v+40,4.0);return data
end function
function main(args)
  count=0;state=tr.createState([],"unit-config")
  count=count+require(state.numModels==1 and state.models[0].type==tr.MOD_BAD,"R_ModelInit null slot")
  model=tr.R_AllocModel(state);count=count+require(model.index==1 and state.numModels==2,"R_AllocModel")
  loaded=tr.R_LoadMD3(model,0,md3Fixture(),"unit.md3");count=count+require(loaded and model.type==tr.MOD_MESH and model.dataSize==512,"R_LoadMD3")
  count=count+require(model.md3[0].surfaces[0].name=="gun","MD3 surface lowercase suffix stripping")
  count=count+require(tr.R_GetModelByHandle(state,1)==model and tr.R_GetModelByHandle(state,99)==state.models[0],"R_GetModelByHandle")
  tag=tr.R_GetTag(model,0,"tag_weapon");count=count+require(tag.origin==[4.0,5.0,6.0],"R_GetTag")
  orientation=tr.R_LerpTag(state,1,0,0,0.5,"tag_weapon");count=count+require(orientation.found and orientation.origin==[4.0,5.0,6.0],"R_LerpTag")
  count=count+require(tr.R_ModelBounds(state,1)==[[-2.0,-3.0,-4.0],[5.0,6.0,7.0]],"R_ModelBounds MD3 first frame")
  model.brushBounds=[[-9.0,-8.0,-7.0],[9.0,8.0,7.0]];count=count+require(tr.R_ModelBounds(state,1)==model.brushBounds,"brush bounds override");model.brushBounds=void
  listing=tr.R_Modellist_f(state);count=count+require(len(listing.entries)==1 and listing.total==512 and listing.entries[0].lods==1,"R_Modellist_f")
  config=tr.RE_BeginRegistration(state);count=count+require(config=="unit-config" and state.registered and state.viewCluster==-1,"RE_BeginRegistration state")
  count=count+require(state.initCount==1 and state.syncCount==1 and state.flareClears==1 and state.sceneClears==1 and state.stretchPrimes==1,"registration side effects")
  animated=tr.R_AllocModel(state);count=count+require(tr.R_LoadMD4(animated,md4Fixture(),"unit.md4"),"R_LoadMD4")
  count=count+require(animated.type==tr.MOD_MD4 and animated.md4.numFrames==1 and animated.md4.numBones==1 and len(animated.md4.lods)==1,"MD4 header")
  surface=animated.md4.lods[0].surfaces[0];count=count+require(len(surface.vertices)==1 and surface.vertices[0].weights[0].offset==[2.0,3.0,4.0],"MD4 vertex weights")
  skinned=animation.surfaceAnim(surface,animated.md4.frames[0],animated.md4.frames[0],0.0,0,0,16,48);count=count+require(skinned.positions[0]==[2.0,3.0,4.0],"productive MD4 animation")
  count=count+require(tr.R_ModelBounds(state,animated.index)==[[0.0,0.0,0.0],[0.0,0.0,0.0]],"original MD4 bounds ABI")
  missing=tr.RE_RegisterModel(state,"missing.md3");count=count+require(missing==0 and state.models[state.numModels-1].type==tr.MOD_BAD,"failed registration retained")
  before=state.numModels;count=count+require(tr.RE_RegisterModel(state,"missing.md3")==0 and state.numModels==before,"failed registration cached")
  count=count+require(tr.RE_RegisterModel(state,"")==0 and tr.RE_RegisterModel(state,"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijkl.md3")==0,"registration name validation")
  bad=md3Fixture();w32(bad,4,14);fresh=tr.R_AllocModel(state);count=count+require(try(tr.R_LoadMD3(fresh,0,bad,"bad.md3")) is error,"wrong MD3 version")
  bad4=md4Fixture();w32(bad4,4,2);count=count+require(try(tr.R_LoadMD4(fresh,bad4,"bad.md4")) is error,"wrong MD4 version")
  count=count+require(not tr.R_LerpTag(state,0,0,0,0.0,"tag").found,"default model tag miss")
  print("PASS: "+str(count)+" complete tr_model contracts");return 0
end function
