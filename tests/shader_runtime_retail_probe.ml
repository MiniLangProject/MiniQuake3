import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaders
import mq3.renderer.shader_runtime as runtime

function require(ok,text) if not ok then return error(7651,text) end if;return 1 end function
function main(args)
  if len(args)!=1 then print("usage: shader_runtime_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if;index=scripts[0];scriptFiles=scripts[1]
  state=runtime.create(void,void,void);state.index=index;state.text=index.text
  checks=0;checks=checks+require(scriptFiles>20 and len(index.entries)>500,"retail shader catalog")
  names=["textures/skies/tim_hell","textures/skies/toxicskytim_blue","textures/skies/xtoxicsky_dm9"]
  for each name in names shader=shaders.parseIndexed(index,name);checks=checks+require(shader!=void and len(shader.stages)>=2 and runtime.valid(shader),"retail sky shader "+name);record=runtime.finishShader(state,shader,runtime.LIGHTMAP_NONE,true,void,true);checks=checks+require(record.iteratorName=="sky" and record.shader.sort==runtime.SS_ENVIRONMENT,"retail sky finish "+name) end for
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  explicit=0;limit=map.counts[1];if limit>256 then limit=256 end if
  for number=0 to limit-1 name=materials.shaderName(map,number);if runtime.findShaderInShaderText(state,name)!=void then explicit=explicit+1 end if end for
  checks=checks+require(explicit>20,"q3dm1 explicit shader coverage")
  print("PASS: "+str(checks)+" retail tr_shader probes files="+str(scriptFiles)+" definitions="+str(len(index.entries))+" q3dm1Explicit="+str(explicit));return 0
end function
