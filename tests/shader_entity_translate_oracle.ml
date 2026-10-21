import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.compat.numeric as numeric
function hex32(value) digits="0123456789abcdef";textValue="";for i=0 to 7 textValue=digits[(value>>(i*4))&15]+textValue end for;return textValue end function
function emit(name,time,s,t,u,v)
  stage=materials.RuntimeStage([],[],[],0.0,[materials.UvMod("entitytranslate",0.0,0.0,0.0,0.0,0.0,0.0,shaderParser.blankWave())],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identity",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
  value=materials.transformUVEntityAt(stage,[u,v],[0.0,0.0,0.0],[s,t],0.0,time*1000.0)
  print(name+"|"+hex32(numeric.floatBits(value[0]))+","+hex32(numeric.floatBits(value[1])));return 1
end function
function main(args)
  emit("positive-negative",2.0,0.25,-0.125,0.0,0.0)
  emit("both-wrap",0.5,-1.5,2.25,0.25,0.5)
  emit("zero-time",0.0,99.0,-77.0,0.125,0.875)
  return 0
end function
