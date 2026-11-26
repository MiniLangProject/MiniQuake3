import std.fs as fs
import mq3.format.bsp as bsp
import mq3.renderer.playable_flares as playable
import mq3.renderer.tr_flares_runtime as flares
import mq3.client.playable_viewer as viewer
struct Area x y width height end struct
function main(args)
  if len(args)!=1 then return error(7742,"expected retail BSP path") end if;map=bsp.load(fs.readAllBytes(args[0]));if map is error then return map end if;retained=playable.parse(map);if retained is error then return retained end if
  if len(retained)==0 then return error(7743,"retail map has no flare surfaces") end if
  first=retained[0];position=[first.origin[0]-100.0,first.origin[1],first.origin[2]];projection=viewer.Projection(position,[0.0,1.0,0.0],[0.0,0.0,1.0],[1.0,0.0,0.0],320.0,240.0,320.0,1.0,320.0);state=flares.create(projection,Area(0,0,640,480),void);state.frameCount=1;state.frameSceneNum=0;state.time=1000
  admitted=0
  for index=0 to len(retained)-1
    source=retained[index];state.projection.position=[source.origin[0]-100.0,source.origin[1],source.origin[2]];value=flares.RB_AddFlare(state,source.faceIndex,source.fogIndex,source.origin,source.color,void);if value!=void then admitted=admitted+1 end if
  end for
  depths=array(flares.MAX_FLARES,0.0);for each index in state.active depths[index]=100.0 end for;drawn=flares.RB_RenderFlares(state,depths)
  if admitted<=0 or admitted!=len(state.active) or len(drawn)!=admitted then return error(7744,"retail flare pool/render mismatch") end if
  print("PASS: retail tr_flares surfaces="+str(len(retained))+" admitted="+str(admitted)+" quads="+str(len(drawn))+" shaderFaces="+str(map.counts[13]));return 0
end function
