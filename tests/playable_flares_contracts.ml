import mq3.compat.numeric as n
import mq3.format.bsp as bsp
import mq3.renderer.playable_flares as flares
import mq3.renderer.playable_fog as fog

function require(ok,text) if not ok then return error(7697,text) end if;return 1 end function
function near(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.0001 end function
function putI(data,offset,value) n.writeU32(data,offset,value);return void end function
function putF(data,offset,value) n.writeU32(data,offset,n.floatBits(value));return void end function
function fixture()
  data=bytes(280,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  offsets[1]=0;lengths[1]=72;counts[1]=1
  offsets[13]=72;lengths[13]=208;counts[13]=2
  flare=72;putI(data,flare,0);putI(data,flare+4,2);putI(data,flare+8,4)
  values=[10.0,20.0,30.0,0.25,0.5,1.0,0.0,1.0,0.0]
  positions=[48,52,56,60,64,68,84,88,92]
  for index=0 to len(values)-1 putF(data,flare+positions[index],values[index]) end for
  putI(data,176+8,1)
  return bsp.BSP(data,offsets,lengths,counts)
end function

function main(args)
  count=0;parsed=flares.parse(fixture());if parsed is error then return parsed end if
  count=count+require(len(parsed)==1,"only MST_FLARE surfaces are parsed")
  flare=parsed[0];count=count+require(flare.faceIndex==0 and flare.textureIndex==0 and flare.fogIndex==3,"ParseFlare provenance and fog offset")
  count=count+require(flare.origin==[10.0,20.0,30.0],"ParseFlare lightmapOrigin")
  count=count+require(flare.color==[0.25,0.5,1.0],"ParseFlare lightmapVecs[0] color")
  count=count+require(flare.normal==[0.0,1.0,0.0],"ParseFlare lightmapVecs[2] normal")
  state=flares.State(false,0,0.0);first=flares.updateState(state,true,1000,7.0);count=count+require(near(first,0.007) and state.visible and state.fadeTime==999,"newly visible flare starts at now minus one")
  full=flares.updateState(state,true,1200,7.0);count=count+require(near(full,1.0),"visible flare fade clamps to one")
  falling=flares.updateState(state,false,1300,7.0);count=count+require(near(falling,0.993) and not state.visible,"occluded flare starts a linear fade down")
  gone=flares.updateState(state,false,1500,7.0);count=count+require(near(gone,0.0),"occluded flare fade clamps to zero")
  count=count+require(flares.visibleAtDepth(100.0,76.01) and not flares.visibleAtDepth(100.0,76.0),"RB_TestFlare uses strict 24-unit depth tolerance")
  count=count+require(near(flares.flareSize(1280,128.0,40.0),160.0),"RB_RenderFlare screen size formula")
  count=count+require(near(flares.facing([0.0,10.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0]),1.0),"RB_AddFlare normal facing attenuation")
  fogVolume=fog.Fog("textures/fog",[0.5,0.5,0.5,1.0],1.0,0.125,[[-2.0,-2.0,-2.0],[2.0,2.0,2.0]],[0.0,0.0,0.0,0.0],false)
  fogCatalog=fog.Catalog([void,fogVolume],-1,void);fogFlare=flares.Flare(0,0,1,[1.0,0.0,0.0],[1.0,1.0,1.0],[1.0,0.0,0.0])
  count=count+require(flares.foggedColor(fogFlare,[192,128,64,255],fogCatalog,[0.0,0.0,0.0],[1.0,0.0,0.0])==[0,0,0,255],"RB_RenderFlare applies additive shader RGB fog modulation")
  clearFlare=flares.Flare(0,0,0,[1.0,0.0,0.0],[1.0,1.0,1.0],[1.0,0.0,0.0]);count=count+require(flares.foggedColor(clearFlare,[192,128,64,255],fogCatalog,[0.0,0.0,0.0],[1.0,0.0,0.0])==[192,128,64,255],"fog zero leaves flare color unchanged")
  bad=fixture();putI(bad.data,72,1);count=count+require(try(flares.parse(bad)) is error,"flare shader index is bounds checked")
  count=count+require(try(flares.parse(void)) is error,"invalid BSP is rejected")
  count=count+require(try(flares.updateState(state,true,1,-1.0)) is error,"negative fade rate is rejected")
  print("PASS: "+str(count)+" playable flare contracts");return 0
end function
