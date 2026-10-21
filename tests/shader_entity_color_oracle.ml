import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser

function stage(rgb,alpha) return materials.RuntimeStage([],[],[],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture",rgb,shaderParser.blankWave(),alpha,shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[]) end function
function emit(name,value) line=name;for each color in value line=line+"|"+str(color[0])+","+str(color[1])+","+str(color[2])+","+str(color[3]) end for;print(line) end function
function main(args)
  entity=[17,63,129,201];seed=[[3,7,11,15],[19,23,29,31],[37,41,43,47]]
  emit("entity",[materials.stageColorEntity(stage("entity","skip"),seed[0],entity,0),materials.stageColorEntity(stage("entity","skip"),seed[1],entity,0),materials.stageColorEntity(stage("entity","skip"),seed[2],entity,0)])
  emit("inverse",[materials.stageColorEntity(stage("oneminusentity","skip"),seed[0],entity,0),materials.stageColorEntity(stage("oneminusentity","skip"),seed[1],entity,0),materials.stageColorEntity(stage("oneminusentity","skip"),seed[2],entity,0)])
  emit("alpha",[materials.stageColorEntity(stage("vertex","entity"),seed[0],entity,0),materials.stageColorEntity(stage("vertex","entity"),seed[1],entity,0),materials.stageColorEntity(stage("vertex","entity"),seed[2],entity,0)])
  emit("inverse-alpha",[materials.stageColorEntity(stage("vertex","oneminusentity"),seed[0],entity,0),materials.stageColorEntity(stage("vertex","oneminusentity"),seed[1],entity,0),materials.stageColorEntity(stage("vertex","oneminusentity"),seed[2],entity,0)])
  return 0
end function
