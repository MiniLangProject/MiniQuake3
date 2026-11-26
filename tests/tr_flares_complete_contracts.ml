import mq3.renderer.tr_flares_runtime as flares
import mq3.renderer.playable_fog as fog
import mq3.client.playable_viewer as viewer
struct Area x y width height end struct
function req(ok,message) if not ok then return error(7741,message) end if;return 1 end function
function near(a,b) return a-b<0.0002 and b-a<0.0002 end function
function makeState()
  projection=viewer.Projection([0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],[1.0,0.0,0.0],320.0,240.0,320.0,1.0,320.0);volume=fog.Fog("fog",[0.5,0.5,0.5,1.0],100.0,0.00125,[[-10.0,-10.0,-10.0],[10.0,10.0,10.0]],[0.0,0.0,0.0,0.0],false);return flares.create(projection,Area(0,0,640,480),fog.Catalog([void,volume],-1,void))
end function
function main(args)
  count=0;state=makeState();count=count+req(len(state.slots)==flares.MAX_FLARES and len(state.inactive)==128 and state.active==[],"R_ClearFlares pool")
  count=count+req(state.inactive[0]==127 and state.inactive[127]==0,"inactive LIFO order")
  state.time=1000;state.frameCount=1;state.frameSceneNum=2
  count=count+req(flares.RB_AddFlare(state,"behind",0,[-10.0,0.0,0.0],[1.0,1.0,1.0],void)==void and len(state.active)==0,"offscreen flare rejected")
  added=flares.RB_AddFlare(state,"surface",0,[100.0,0.0,0.0],[1.0,0.5,0.25],[-1.0,0.0,0.0]);count=count+req(added!=void and len(state.active)==1,"RB_AddFlare allocates")
  count=count+req(added.slot==127 and added.windowX==320 and added.windowY==240 and near(added.eyeZ,-100.0),"flare projection")
  count=count+req(near(added.color[0],1.0) and near(added.color[1],0.5),"normal facing attenuation")
  count=count+req(not added.visible and added.fadeTime==-1000 and added.addedFrame==1,"new sequence fade reset")
  reused=flares.RB_AddFlare(state,"surface",3,[100.0,0.0,0.0],[0.2,0.3,0.4],void);count=count+req(reused==added and len(state.active)==1 and reused.fogNum==3,"surface scene view identity reuse")
  state.isPortal=true;portal=flares.RB_AddFlare(state,"surface",0,[100.0,0.0,0.0],[1.0,1.0,1.0],void);count=count+req(portal!=added and len(state.active)==2,"portal owns independent state")
  state.isPortal=false;state.frameSceneNum=3;scene=flares.RB_AddFlare(state,"surface",0,[100.0,0.0,0.0],[1.0,1.0,1.0],void);count=count+req(scene!=added and len(state.active)==3,"scene owns independent state")
  test=flares.Flare(0,0,false,0,"test",0,0,false,0.0,320,240,-100.0,[1.0,1.0,1.0],[100.0,0.0,0.0],void);state.time=2000;state.finishCalled=true;value=flares.RB_TestFlare(state,test,100.0)
  count=count+req(near(value,0.007) and test.visible and test.fadeTime==1999,"RB_TestFlare visible fade")
  count=count+req(not state.finishCalled and state.tests==1,"depth read clears finish state")
  state.time=2200;value=flares.RB_TestFlare(state,test,2.0);count=count+req(near(value,0.993) and not test.visible and test.fadeTime==2199,"RB_TestFlare hidden fade")
  state.time=2500;count=count+req(near(flares.RB_TestFlare(state,test,2.0),0.0),"RB_TestFlare clamps zero")
  render=flares.Flare(0,0,false,0,"render",0,0,false,0.5,320,240,-100.0,[0.5,0.25,1.0],[100.0,0.0,0.0],void);quad=flares.RB_RenderFlare(state,render)
  count=count+req(quad.positions[0][0]<320 and quad.positions[2][0]>320 and quad.positions[0][1]<240 and quad.positions[2][1]>240,"RB_RenderFlare quad")
  count=count+req(quad.texCoords==[[0.0,0.0],[0.0,1.0],[1.0,1.0],[1.0,0.0]] and quad.indexes==[0,1,2,0,2,3],"flare UV and indexes")
  count=count+req(quad.color==[63,31,127,255] and state.renders==1,"flare color truncation")
  count=count+req(near(320-quad.positions[0][0],91.2),"flare viewport size formula")
  inside=flares.Light([5.0,0.0,0.0],[1.0,0.0,0.0]);outside=flares.Light([100.0,0.0,0.0],[0.0,1.0,0.0]);state.frameSceneNum=4;state.frameCount=2;state.time=3000;before=len(state.active);lights=flares.RB_AddDlightFlares(state,[inside,outside]);count=count+req(lights==2 and len(state.active)==before+2,"RB_AddDlightFlares")
  newest=state.slots[state.active[0]];next=state.slots[state.active[1]];count=count+req((newest.fogNum==0 and next.fogNum==1) or (newest.fogNum==1 and next.fogNum==0),"dynamic light fog assignment")
  state.enabled=false;count=count+req(flares.RB_AddDlightFlares(state,[inside])==0,"r_flares disables dlights");state.enabled=true
  renderState=makeState();renderState.frameCount=1;renderState.frameSceneNum=0;renderState.time=1000;visible=flares.RB_AddFlare(renderState,"visible",0,[100.0,0.0,0.0],[1.0,1.0,1.0],void);depths=array(128,0.0);depths[visible.slot]=100.0;drawn=flares.RB_RenderFlares(renderState,depths)
  count=count+req(len(drawn)==1 and renderState.tests==1 and renderState.renders==1,"RB_RenderFlares draws visible view")
  renderState.frameCount=3;drawn=flares.RB_RenderFlares(renderState,depths);count=count+req(drawn==[] and len(renderState.active)==0 and len(renderState.inactive)==128,"stale flare retirement")
  full=makeState();full.frameCount=1;full.time=1;for index=0 to 127 flares.RB_AddFlare(full,"s"+str(index),0,[100.0,(index%16)-8.0,0.0],[1.0,1.0,1.0],void) end for
  count=count+req(len(full.active)==128 and len(full.inactive)==0,"pool reaches MAX_FLARES")
  count=count+req(flares.RB_AddFlare(full,"overflow",0,[100.0,0.0,0.0],[1.0,1.0,1.0],void)==void and len(full.active)==128,"full pool drops allocation")
  flares.R_ClearFlares(full);count=count+req(len(full.active)==0 and len(full.inactive)==128 and full.slots[127].surface==void,"R_ClearFlares resets records")
  print("PASS: "+str(count)+" complete tr_flares contracts");return 0
end function
