import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_fog as fog
import mq3.renderer.shader_parser as shaderParser

struct Vertex position baseUV lightmapUV normal color entityColor entityTexCoord shaderTime sourceIndex end struct
struct Triangle vertices textureIndex lightmapIndex fogIndex end struct
struct RenderData triangles end struct
function require(ok,text) if not ok then return error(7716,"playable fog stage: "+text) end if;return 1 end function
function makePointVertex(x,y,z,index) return Vertex([x,y,z],[0.0,0.0],[0.0,0.0],[0.0,1.0,0.0],[255,255,255,255],[255,255,255,255],[0.0,0.0],0.0,index) end function
function stage(blend) return materials.RuntimeStage(["fog-stage"],[materials.Image(1,1,bytes([255,255,255,255]))],[101],0.0,[],blend,materials.ALPHA_TEST_NONE,"texture","const",shaderParser.blankWave(),"const",shaderParser.blankWave(),[200,150,100,200],false,false,false,false,256.0,[]) end function
function build(blend,triangle)
  active=stage(blend);material=materials.Material(1,"fog-stage","fog-stage",active.images[0],101,[active],[],false,9.0,false,false,0.0,0.0)
  return worldBatch.buildMaterials(RenderData([triangle]),materials.Catalog([material],0,1,1,1,0,1),[false,false])
end function
function main(args)
  count=0;a=makePointVertex(25.0,0.0,0.0,1);b=makePointVertex(25.0,1.0,0.0,2);c=makePointVertex(25.0,0.0,1.0,3);triangle=Triangle([a,b,c],1,-1,1)
  volume=fog.Fog("fog",[0.25,0.5,0.75],100.0,1.0/800.0,[[-10.0,-10.0,-10.0],[30.0,10.0,10.0]],[0.0,0.0,0.0,0.0],false);fogCatalog=fog.Catalog([void,volume],319,fog.textureImage())
  additive=build(materials.BLEND_ADD,triangle);count=count+require(additive.passes[0].fogAdjustment=="rgb","additive-only material receives RGB fog policy")
  attached=worldBatch.attachFog(additive,RenderData([triangle]),fogCatalog);count=count+require(attached==1 and additive.passes[0].fogIndexes==[1],"fog attachment retains each pass triangle's fog index")
  worldBatch.updatePassAxesFog(additive.passes[0],[0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],0,fogCatalog);density=fog.density(volume,a.position,[0.0,0.0,0.0],[1.0,0.0,0.0]);expected=materials.modulateForFog([200,150,100,200],density,"rgb")
  count=count+require(additive.passes[0].commands.data[116]==expected[0] and additive.passes[0].commands.data[117]==expected[1] and additive.passes[0].commands.data[118]==expected[2] and additive.passes[0].commands.data[119]==200,"additive vertex RGB fades before the final fog overlay")
  alpha=build(materials.BLEND_ALPHA,triangle);worldBatch.attachFog(alpha,RenderData([triangle]),fogCatalog);worldBatch.updatePassAxesFog(alpha.passes[0],[0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],0,fogCatalog);alphaExpected=materials.modulateForFog([200,150,100,200],density,"alpha")
  count=count+require(alpha.passes[0].commands.data[116]==200 and alpha.passes[0].commands.data[119]==alphaExpected[3],"strict blend fades alpha before the final fog overlay")
  premult=build(materials.BLEND_PREMULTIPLIED_ALPHA,triangle);worldBatch.attachFog(premult,RenderData([triangle]),fogCatalog);worldBatch.updatePassAxesFog(premult.passes[0],[0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],0,fogCatalog);premultExpected=materials.modulateForFog([200,150,100,200],density,"rgba")
  count=count+require(premult.passes[0].commands.data[116]==premultExpected[0] and premult.passes[0].commands.data[117]==premultExpected[1] and premult.passes[0].commands.data[118]==premultExpected[2] and premult.passes[0].commands.data[119]==premultExpected[3],"premultiplied blend fades RGBA before the final fog overlay")
  opaqueFirst=stage(materials.BLEND_OPAQUE);addSecond=stage(materials.BLEND_ADD);mixedMaterial=materials.Material(1,"mixed","mixed",opaqueFirst.images[0],101,[opaqueFirst,addSecond],[],false,3.0,false,false,0.0,0.0);mixed=worldBatch.buildMaterials(RenderData([triangle]),materials.Catalog([mixedMaterial],0,1,1,1,0,1),[false,false])
  count=count+require(len(mixed.passes)==2 and mixed.passes[1].fogAdjustment=="none","opaque first stage leaves later stage to the final fog pass")
  noFog=build(materials.BLEND_ADD,triangle);worldBatch.updatePassAxesFog(noFog.passes[0],[0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],0,void);count=count+require(noFog.passes[0].commands.data[116]==200 and noFog.passes[0].commands.data[119]==200,"unattached stages retain their generated color")
  print("PASS: "+str(count)+" playable fog-stage contracts");return 0
end function
