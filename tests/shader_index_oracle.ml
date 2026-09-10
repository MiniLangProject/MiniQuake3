import mq3.renderer.shader_index as shaders

function main(args)
  script="// deterministic shader fixture\ntextures/base/wall { { map textures/base/a.tga } }\nTextures\\Mixed\\Path.JPG { surfaceparm metalsteps { map $lightmap } }\ntextures/duplicate { { map first } }\ntextures/duplicate { { map second } }\ntextures/deep { { { map nested } } deformVertexes wave 1 sin 0 1 0 1 }\n"
  index=shaders.build(script)
  hashes=["textures/base/wall","Textures\\Mixed\\Path.JPG","A.B","a/b","a\\b"]
  for i=0 to len(hashes)-1 print("H|"+hashes[i]+"|"+str(shaders.hashValue(hashes[i],2048))) end for
  lookups=["TEXTURES/BASE/WALL","textures\\mixed\\path.jpg","textures/duplicate","textures/deep","missing"]
  for i=0 to len(lookups)-1
    found=shaders.find(index,lookups[i]);offset=-1;if found!=void then offset=found.bodyOffset end if
    print("F|"+lookups[i]+"|"+str(offset))
  end for
  return 0
end function
