import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.compat.numeric as numeric

function makeStage(slots,speed)
  return materials.RuntimeStage([],[],slots,speed,[],materials.BLEND_OPAQUE,materials.ALPHA_TEST_NONE,"texture","identity",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
end function
function emit(name,stage,nowMilliseconds,shaderTime) print(name+"|"+str(materials.slotAtEntity(stage,nowMilliseconds,shaderTime)));return 1 end function
function hex32(value) digits="0123456789abcdef";textValue="";for i=0 to 7 textValue=digits[(value>>(i*4))&15]+textValue end for;return textValue end function
function emitBegin(name,now,timeOffset,clampTime) value=materials.shaderSeconds(now*1000.0,0.0,timeOffset,clampTime);print("begin-"+name+"|"+hex32(numeric.floatBits(value))+",1");return 1 end function
function main(args)
  one=makeStage([10],99.0);four=makeStage([10,11,12,13],2.0)
  emit("single",one,123000.0,0.0)
  emit("zero",four,0.0,0.0)
  emit("before-boundary",four,490.0,0.0)
  emit("boundary",four,500.0,0.0)
  emit("wrap",four,2000.0,0.0)
  emit("negative",four,0.0,0.5)
  emit("entity-offset",four,1500.0,0.25)
  emitBegin("plain",1.5,0.0,0.0)
  emitBegin("offset",1.5,0.25,0.0)
  emitBegin("clamp",1.5,0.0,0.75)
  emitBegin("offset-clamp",1.5,0.25,1.0)
  emitBegin("negative",0.1,0.5,1.0)
  emitBegin("remapped",2.0,0.5,1.0)
  return 0
end function
