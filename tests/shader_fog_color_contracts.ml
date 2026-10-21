import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
function require(ok,text) if not ok then return error(7715,"shader fog color: "+text) end if;return 1 end function
function stage(blend) return materials.RuntimeStage([],[],[],0.0,[],blend,materials.ALPHA_TEST_NONE,"texture","identity",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[]) end function
function main(args)
  count=0;opaque=stage(materials.BLEND_OPAQUE);add=stage(materials.BLEND_ADD);alpha=stage(materials.BLEND_ALPHA);mark=stage(materials.BLEND_MARK);premult=stage(materials.BLEND_PREMULTIPLIED_ALPHA)
  count=count+require(materials.fogAdjustment(opaque,add)=="none","opaque first stage relies on the final fog pass")
  count=count+require(materials.fogAdjustment(add,add)=="rgb","additive-only shader modulates RGB")
  count=count+require(materials.fogAdjustment(alpha,alpha)=="alpha","strict blended shader modulates alpha")
  count=count+require(materials.fogAdjustment(mark,mark)=="rgb","inverse-source mark modulates RGB")
  count=count+require(materials.fogAdjustment(premult,premult)=="rgba","premultiplied alpha modulates RGBA")
  count=count+require(materials.modulateForFog([200,150,100,50],0.25,"rgb")==[150,112,75,50],"RGB uses byte-truncated inverse density")
  count=count+require(materials.modulateForFog([200,150,100,50],0.25,"alpha")==[200,150,100,37],"alpha uses byte-truncated inverse density")
  count=count+require(materials.modulateForFog([200,150,100,50],0.25,"rgba")==[150,112,75,37],"RGBA modulation covers premultiplied policy")
  count=count+require(materials.modulateForFog([1,2,3,4],-1.0,"rgb")==[1,2,3,4] and materials.modulateForFog([1,2,3,4],2.0,"rgba")==[0,0,0,0],"density clamps before modulation")
  parsed=shaderParser.parseText("{\n{\nmap textures/mark.tga\nblendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR\n}\n}","mark")
  count=count+require(materials.stageBlend(parsed.stages[0])==materials.BLEND_MARK,"mark blend reaches native raster mode")
  premultParsed=shaderParser.parseText("{\n{\nmap textures/premult.tga\nblendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA\n}\n}","premult")
  count=count+require(materials.stageBlend(premultParsed.stages[0])==materials.BLEND_PREMULTIPLIED_ALPHA,"premultiplied blend reaches native raster mode")
  print("PASS: "+str(count)+" shader fog-color contracts");return 0
end function
