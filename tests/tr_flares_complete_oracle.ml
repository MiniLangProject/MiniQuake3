import mq3.renderer.tr_flares_runtime as flares
import mq3.client.playable_viewer as viewer
import mq3.compat.numeric as n
struct Area x y width height end struct
function main(args)
 projection=viewer.Projection([0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],[1.0,0.0,0.0],320.0,240.0,320.0,1.0);state=flares.create(projection,Area(0,0,640,480),void);print("clear|1|"+str(len(state.inactive))+"|"+str(state.inactive[0])+","+str(state.inactive[1]))
 f=flares.Flare(0,0,false,0,"x",0,0,false,0.0,320,240,-100.0,[1.0,1.0,1.0],[100.0,0.0,0.0],void);state.time=1000;state.finishCalled=true;flares.RB_TestFlare(state,f,100.0);print("visible|1|"+str(f.fadeTime)+"|"+str(n.trunc32(f.drawIntensity*1000000.0))+"|0")
 state.time=1200;flares.RB_TestFlare(state,f,2.0);print("hidden|0|"+str(f.fadeTime)+"|"+str(n.trunc32(f.drawIntensity*1000000.0)))
 f=flares.Flare(0,0,false,0,"x",3,0,false,0.5,320,240,-100.0,[0.5,0.25,1.0],[100.0,0.0,0.0],void);quad=flares.RB_RenderFlare(state,f);print("render|4|6|"+str(quad.color[0])+","+str(quad.color[1])+","+str(quad.color[2])+"|"+str(n.trunc32(quad.positions[0][0]*10))+","+str(n.trunc32(quad.positions[0][1]*10))+"|0,1,2,0,2,3");return 0
end function
