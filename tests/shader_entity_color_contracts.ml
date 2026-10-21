import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.qvm_scene_materials as sceneMaterials
import mq3.renderer.qvm_scene_batch as sceneBatch
import mq3.renderer.playable_world_batch as worldBatch
import mq3.compat.numeric as numeric

function require(condition,message) if not condition then return error(7710,"shader entity color: "+message) end if;return 1 end function
function stage(rgb,alpha) return materials.RuntimeStage(["fx"],[materials.Image(1,1,bytes([255,255,255,255]))],[336],0.0,[],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture",rgb,shaderParser.blankWave(),alpha,shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[]) end function
function main(args)
  count=0;vertex=[8,16,32,64];entity=[17,63,129,201]
  count=count+require(materials.stageColorEntity(stage("entity","skip"),vertex,entity,0)==entity,"raw rgbGen entity copies RGBA")
  count=count+require(materials.stageColorEntity(stage("oneminusentity","skip"),vertex,entity,0)==[238,192,126,54],"raw rgbGen oneMinusEntity inverts RGBA")
  count=count+require(materials.stageColorEntity(stage("vertex","entity"),vertex,entity,0)==[8,16,32,201],"alphaGen entity preserves generated RGB")
  count=count+require(materials.stageColorEntity(stage("vertex","oneminusentity"),vertex,entity,0)==[8,16,32,54],"alphaGen oneMinusEntity preserves generated RGB")
  count=count+require(materials.stageColor(stage("entity","identity"),entity,0)==[17,63,129,255],"identity alpha completes entity ComputeColors")
  count=count+require(materials.stageColorAtEntity(stage("entity","entity"),vertex,entity,[1.0,2.0,3.0],[0.0,0.0,0.0],0)==entity,"position-aware generator accepts entity color")
  triangle=sceneGeometry.Triangle([[1.0,0.0,0.0],[1.0,1.0,0.0],[1.0,0.0,1.0]],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[1.0,0.0,0.0],[1.0,0.0,0.0],[1.0,0.0,0.0]],[vertex,vertex,vertex],entity,[0.0,0.0],0.0,0,0,1,"fx","surface",0,0,0,[[0.0,0.0],[0.0,0.0],[0.0,0.0]],-1,-1,false,void,void,void)
  runtimeStage=stage("entity","identity");material=sceneMaterials.Material(0,"fx","fx",runtimeStage.images[0],336,[runtimeStage],[],false,3.0,false,false,0.0,0.0);catalog=sceneMaterials.Catalog([sceneMaterials.ResolvedTriangle(triangle,0)],[material],[],void,0,[],[],1,0,336,void,void)
  prepared=sceneBatch.build(catalog);if prepared is error then return prepared end if;pass=prepared.batch.passes[0]
  count=count+require(pass.sourceColors[0][0]==vertex and pass.sourceEntityColors[0][0]==entity,"QVM batch preserves lighting and entity color separately")
  worldBatch.updatePass(pass,0)
  count=count+require(pass.commands.data[116]==17 and pass.commands.data[117]==63 and pass.commands.data[118]==129 and pass.commands.data[119]==255,"productive retained pass applies identity alpha after entity RGB")
  print("PASS: "+str(count)+" shader entity-color contracts");return 0
end function
