import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.qvm_scene_materials as sceneMaterials
import mq3.renderer.qvm_scene_batch as sceneBatch
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.platform.playable_window as window

const TRIANGLES=1728
const FRAMES=20

function sourceTriangle(index)
  x=(index%48)*3.0;y=(index/48)*2.0;color=[128+index%128,255,192,255]
  return sceneGeometry.Triangle([[x,y,0.0],[x+2.0,y,0.0],[x,y+1.5,0.0]],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0]],[color,color,color],color,[0.0,0.0],0.0,0,0,1,"fx","surface",index,0,0,[[0.0,0.0],[0.0,0.0],[0.0,0.0]],-1,-1,false,void,void,void)
end function
function main(args)
  image=materials.Image(1,1,bytes([255,255,255,255]))
  stage=materials.RuntimeStage(["fx"],[image],[336],0.0,[],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  material=sceneMaterials.Material(0,"fx","fx",image,336,[stage],[],false,3.0,false,false,0.0,0.0)
  resolved=array(TRIANGLES,void)
  for index=0 to TRIANGLES-1 resolved[index]=sceneMaterials.ResolvedTriangle(sourceTriangle(index),0) end for
  catalog=sceneMaterials.Catalog(resolved,[material],[],void,0,[],[],TRIANGLES,0,337,void,void)
  started=window.milliseconds();fresh=void
  for frame=0 to FRAMES-1 fresh=sceneBatch.build(catalog);if fresh is error then return fresh end if end for
  freshMs=window.milliseconds()-started
  retained=sceneBatch.build(catalog);if retained is error then return retained end if
  started=window.milliseconds()
  for frame=0 to FRAMES-1 retained=sceneBatch.refresh(retained,catalog);if retained is error then return retained end if end for
  refreshMs=window.milliseconds()-started
  if retained.batch.base.data!=fresh.batch.base.data or len(retained.batch.passes)!=len(fresh.batch.passes) or retained.batch.passes[0].commands.data!=fresh.batch.passes[0].commands.data then return error(7685,"retained scene batch changed output") end if
  print("QVM scene batch benchmark: triangles="+str(TRIANGLES)+" frames="+str(FRAMES)+" fresh_ms="+str(freshMs)+" refresh_ms="+str(refreshMs)+" speedup_x100="+str(freshMs*100/refreshMs));return 0
end function
