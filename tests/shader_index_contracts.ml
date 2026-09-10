import mq3.renderer.shader_index as shaders

function require(ok,text) if not ok then return error(7110,text) end if;return 1 end function
function main(args)
  count=0
  count=count+require(shaders.hashValue("A/B",2048)==shaders.hashValue("a\\b",2048),"case and slash normalization")
  count=count+require(shaders.hashValue("path.tga",2048)==shaders.hashValue("PATH.jpg",2048),"extension ignored")
  count=count+require(try(shaders.hashValue("x",2000)) is error,"non-power-of-two hash rejected")
  text="one { { map x } } two { deformVertexes wave 1 sin 0 1 0 1 } one { map later }"
  index=shaders.build(text)
  count=count+require(len(index.entries)==3,"all definitions indexed")
  count=count+require(index.entries[0].name=="one" and index.entries[1].name=="two","source order retained")
  count=count+require(index.entries[0].endOffset<index.entries[1].bodyOffset,"nested braces skipped")
  count=count+require(shaders.find(index,"ONE").bodyOffset==index.entries[0].bodyOffset,"case-insensitive first duplicate")
  count=count+require(shaders.find(index,"missing")==void,"missing shader")
  empty=shaders.build("// only a comment\n")
  count=count+require(len(empty.entries)==0,"comment-only script")
  count=count+require(try(shaders.build("broken { { map x }")) is error,"unterminated definition rejected")
  print("PASS: "+str(count)+" shader-index contracts")
  return 0
end function
