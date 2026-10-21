import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.playable_world_batch as worldBatch

function require(condition,message) if not condition then return error(7714,"shader ComputeColors: "+message) end if;return 1 end function
function stage(rgb,alpha,color) return materials.RuntimeStage([],[],[],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture",rgb,shaderParser.blankWave(),alpha,shaderParser.blankWave(),color,false,false,false,false,128.0,[]) end function
function main(args)
  count=0;vertex=[8,16,32,64];entity=[17,63,129,201]
  count=count+require(materials.stageColorEntityIdentity(stage("identitylighting","identity",[255,255,255,255]),vertex,entity,0,0.5)==[127,127,127,255],"identityLighting uses overbright byte then identity alpha")
  count=count+require(materials.stageColorEntity(stage("entity","identity",[255,255,255,255]),vertex,entity,0)==[17,63,129,255],"identity alpha replaces rgbGen entity alpha")
  count=count+require(materials.stageColorEntity(stage("oneminusentity","identity",[255,255,255,255]),vertex,entity,0)==[238,192,126,255],"identity alpha replaces inverse entity alpha")
  count=count+require(materials.stageColorEntity(stage("entity","entity",[255,255,255,255]),vertex,entity,0)==entity,"explicit entity alpha survives")
  count=count+require(materials.stageColorEntity(stage("const","identity",[20,40,60,80]),vertex,entity,0)==[20,40,60,255],"identity alpha replaces rgbGen const alpha")
  count=count+require(materials.stageColorEntity(stage("const","const",[20,40,60,80]),vertex,entity,0)==[20,40,60,80],"matching const generators share RGBA")
  count=count+require(materials.stageColorEntityIdentity(stage("vertex","identity",[255,255,255,255]),vertex,entity,0,1.0)==vertex,"full identity vertex preserves alpha")
  count=count+require(materials.stageColorEntityIdentity(stage("vertex","identity",[255,255,255,255]),vertex,entity,0,0.5)==[4,8,16,255],"overbright vertex scales RGB and resets alpha")
  count=count+require(materials.stageColorEntityIdentity(stage("oneminusvertex","vertex",[255,255,255,255]),vertex,entity,0,0.5)==[123,119,111,64],"inverse vertex applies identity scale before vertex alpha")
  count=count+require(materials.stageColorEntity(stage("exactvertex","identity",[255,255,255,255]),vertex,entity,0)==[8,16,32,255],"exactVertex identity alpha follows backend order")
  count=count+require(materials.stageColorEntity(stage("lightingdiffuse","entity",[255,255,255,255]),vertex,entity,0)==[8,16,32,201],"precomputed diffuse RGB accepts entity alpha")
  count=count+require(materials.stageColorAtEntity(stage("identity","portal",[255,255,255,255]),vertex,entity,[64.0,0.0,0.0],[0.0,0.0,0.0],0)==[255,255,255,127],"portal alpha runs after RGB and identity setup")
  count=count+require(worldBatch.specularAlpha([-960.0,0.0,96.0],[0.0,1.0,0.0],[-960.0,100.0,96.0])==251,"lightingSpecular preserves the original fast-normalized peak")
  count=count+require(worldBatch.specularAlpha([-960.0,0.0,96.0],[0.0,1.0,0.0],[-960.0,-100.0,96.0])==0,"lightingSpecular rejects a reflected direction behind the viewer")
  print("PASS: "+str(count)+" shader ComputeColors contracts");return 0
end function
