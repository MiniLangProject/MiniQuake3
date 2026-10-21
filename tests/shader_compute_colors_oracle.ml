import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.playable_world_batch as worldBatch

function stage(rgb,alpha)
  return materials.RuntimeStage([],[],[],0.0,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture",rgb,shaderParser.Wave(1,0.25,0.0,0.0,0.0),alpha,shaderParser.Wave(1,0.5,0.0,0.0,0.0),[20,40,60,80],false,false,false,false,128.0,[])
end function
function show(name,value) print(name+"|"+str(value[0])+","+str(value[1])+","+str(value[2])+","+str(value[3])) end function
function spec(name,position,normal,viewOrigin) print(name+"|"+str(worldBatch.specularAlpha(position,normal,viewOrigin))) end function
function color(rgb,alpha,identity) return materials.stageColorEntityIdentity(stage(rgb,alpha),[8,16,32,64],[17,63,129,201],0,identity) end function
function main(args)
  show("identity",color("identity","identity",1.0));show("identity-light",color("identitylighting","identity",0.5))
  show("entity-identity",color("entity","identity",1.0));show("inverse-identity",color("oneminusentity","identity",1.0));show("entity-alpha",color("entity","entity",1.0))
  show("const-identity",color("const","identity",1.0));show("const-alpha",color("const","const",1.0))
  show("vertex-full",color("vertex","identity",1.0));show("vertex-half",color("vertex","identity",0.5));show("inverse-vertex",color("oneminusvertex","vertex",0.5))
  show("exact-identity",color("exactvertex","identity",1.0));show("diffuse-entity",color("lightingdiffuse","entity",1.0))
  show("wave-alpha",color("wave","wave",0.5));show("portal",materials.stageColorAtEntity(stage("identity","portal"),[8,16,32,64],[17,63,129,201],[64.0,0.0,0.0],[0.0,0.0,0.0],0))
  specColor=materials.stageColorEntityIdentity(stage("identity","identity"),[8,16,32,64],[17,63,129,201],0,1.0);specColor[3]=worldBatch.specularAlpha([64.0,0.0,0.0],[0.0,0.0,1.0],[0.0,0.0,64.0]);show("specular",specColor)
  spec("spec-forward",[-960.0,0.0,96.0],[0.0,1.0,0.0],[-960.0,100.0,96.0]);spec("spec-back",[-960.0,0.0,96.0],[0.0,1.0,0.0],[-960.0,-100.0,96.0])
  spec("spec-oblique",[10.0,-2.0,-44.0],[0.26726124,0.53452248,0.80178373],[100.0,100.0,100.0]);spec("spec-side",[64.0,32.0,16.0],[1.0,0.0,0.0],[320.0,-20.0,48.0])
  spec("spec-diagonal",[-128.0,256.0,32.0],[0.70710677,0.70710677,0.0],[400.0,-300.0,256.0]);spec("spec-down",[0.0,0.0,64.0],[0.0,0.0,-1.0],[16.0,32.0,-128.0])
  return 0
end function
