import mq3.renderer.shader_parser as shaders
function main(args)
  af=["GT0","lt128","Ge128","invalid"];for i=0 to len(af)-1 print("A|"+af[i]+"|"+str(shaders.nameToAFunc(af[i]))) end for
  src=["GL_ONE","GL_ZERO","GL_DST_COLOR","GL_ONE_MINUS_DST_COLOR","GL_SRC_ALPHA","GL_ONE_MINUS_SRC_ALPHA","GL_DST_ALPHA","GL_ONE_MINUS_DST_ALPHA","GL_SRC_ALPHA_SATURATE","invalid"]
  for i=0 to len(src)-1 print("S|"+src[i]+"|"+str(shaders.nameToSrcBlendMode(src[i]))) end for
  dst=["GL_ONE","GL_ZERO","GL_SRC_ALPHA","GL_ONE_MINUS_SRC_ALPHA","GL_DST_ALPHA","GL_ONE_MINUS_DST_ALPHA","GL_SRC_COLOR","GL_ONE_MINUS_SRC_COLOR","invalid"]
  for i=0 to len(dst)-1 print("D|"+dst[i]+"|"+str(shaders.nameToDstBlendMode(dst[i]))) end for
  gen=["sin","SQUARE","triangle","sawtooth","inverseSawTooth","noise","invalid"]
  for i=0 to len(gen)-1 print("G|"+gen[i]+"|"+str(shaders.nameToGenFunc(gen[i]))) end for
  return 0
end function
