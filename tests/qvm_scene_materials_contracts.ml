import mq3.renderer.qvm_scene_materials as qvmMaterials
import mq3.renderer.shader_remap as shaderRemap

struct Triangle shaderHandle customSkin shaderName surfaceName end struct
struct ShadowTriangle shaderHandle customSkin shaderName surfaceName fogIndex entityIndex surfaceIndex end struct
function require(value,message) if not value then return error(7684,"QVM scene materials: "+message) end if;return 1 end function

function main(args)
  count=0;first=qvmMaterials.Binding(1,0,"models/first","body",3);second=qvmMaterials.Binding(2,7,"models/second","head",9)
  catalog=qvmMaterials.Catalog([],[],[],void,0,[],[first,second],0,0,64,void,void)
  triangle=Triangle(2,7,"models/second","head")
  count=count+require(qvmMaterials.sameBinding(second,triangle),"matching binding recognized")
  count=count+require(not qvmMaterials.sameBinding(void,triangle) and not qvmMaterials.sameBinding(first,triangle),"missing and different bindings rejected")
  count=count+require(qvmMaterials.cachedBinding(catalog,triangle)==9 and catalog.recentBinding==second,"first lookup populates recent binding")
  catalog.bindings=[];count=count+require(qvmMaterials.cachedBinding(catalog,triangle)==9,"recent binding avoids the full binding table")
  unknown=Triangle(3,0,"models/missing","tag");count=count+require(qvmMaterials.cachedBinding(catalog,unknown)== -2,"unknown binding retains miss sentinel")
  triangle.shaderName="models/SECOND";count=count+require(qvmMaterials.cachedBinding(catalog,triangle)== -2,"binding keys remain byte-exact after initial shader resolution")
  remapBinding=qvmMaterials.Binding(1,0,"models/first","body",0);remapCatalog=qvmMaterials.Catalog([],[qvmMaterials.Material(0,"textures/old","",void,-1,[],[],false,3.0,false,false,0.0,0.0)],[],void,0,[],[remapBinding],0,0,64,remapBinding,void)
  remapTriangle=Triangle(1,0,"models/first","body");assets=["textures/old"];kinds=["shader"]
  count=count+require(qvmMaterials.bindingMatchesRegistry(remapCatalog,0,remapTriangle,assets,kinds),"cached binding matches original registered shader")
  assets[0]="textures/new";count=count+require(not qvmMaterials.bindingMatchesRegistry(remapCatalog,0,remapTriangle,assets,kinds),"shader remap invalidates material binding")
  qvmMaterials.storeBinding(remapCatalog,remapTriangle,7);count=count+require(len(remapCatalog.bindings)==1 and remapCatalog.bindings[0].materialIndex==7,"remapped binding updates without cache growth")
  sameAssets=["textures/old"];sameKinds=["shader"];sameRemaps=shaderRemap.create();shaderRemap.apply(sameRemaps,sameAssets,sameKinds,"textures/old","textures/old","0.75");sameBinding=qvmMaterials.Binding(1,0,"models/first","body",0);sameCatalog=qvmMaterials.Catalog(array(1,void),[qvmMaterials.Material(0,"textures/old","",void,-1,[],[],false,3.0,false,false,0.0,0.0)],[],void,0,[],[sameBinding],0,0,64,sameBinding,sameRemaps)
  qvmMaterials.bindTriangle(sameCatalog,remapTriangle,0,void,sameAssets,sameKinds,64);count=count+require(sameCatalog.materials[0].timeOffset==0.75 and sameCatalog.triangles[0].materialIndex==0,"same-name runtime remap updates the stable QVM material clock")
  beamCatalog=qvmMaterials.Catalog([],[],[],void,0,[],[],0,0,80,void,void);beamIndex=qvmMaterials.addBeamMaterial(beamCatalog,82)
  count=count+require(beamIndex==0 and len(beamCatalog.materials)==1 and len(beamCatalog.textures)==1,"built-in beam material and texture created")
  count=count+require(beamCatalog.materials[0].shaderName==qvmMaterials.BUILTIN_BEAM and beamCatalog.materials[0].twoSided and beamCatalog.materials[0].noMipMaps,"beam material identity and flags")
  count=count+require(beamCatalog.materials[0].stages[0].blend==2 and beamCatalog.materials[0].stages[0].rgbGen=="vertex","beam uses additive vertex-color stage")
  count=count+require(beamCatalog.textures[0].slot==80 and beamCatalog.textures[0].image.width==1 and beamCatalog.textures[0].image.height==1 and beamCatalog.textures[0].image.pixels==bytes(4,255),"beam uploads one white texel")
  count=count+require(qvmMaterials.addBeamMaterial(beamCatalog,82)==0 and len(beamCatalog.materials)==1 and beamCatalog.nextTextureSlot==81,"beam material reused")
  full=qvmMaterials.Catalog([],[],[],void,0,[],[],0,0,90,void,void);count=count+require(qvmMaterials.addBeamMaterial(full,90)== -1 and len(full.materials)==0,"beam material respects texture capacity")
  shadowCatalog=qvmMaterials.Catalog([],[],[],void,0,[],[],0,0,100,void,void);shadowIndex=qvmMaterials.addProjectionShadowMaterial(shadowCatalog,102)
  count=count+require(shadowIndex==0 and shadowCatalog.materials[0].shaderName==qvmMaterials.BUILTIN_PROJECTION_SHADOW,"built-in projection shadow material created")
  count=count+require(shadowCatalog.materials[0].sort==4.0 and shadowCatalog.materials[0].polygonOffset and shadowCatalog.materials[0].twoSided,"projection shadow uses decal ordering and polygon offset")
  count=count+require(shadowCatalog.materials[0].stages[0].blend==1 and shadowCatalog.materials[0].stages[0].rgbGen=="vertex" and shadowCatalog.materials[0].stages[0].alphaGen=="vertex","projection shadow blends submitted black alpha")
  opaque=qvmMaterials.Material(0,"opaque","",void,-1,[],[],false,3.0,false,false,0.0,0.0);source=ShadowTriangle(0,0,"opaque","body",-1,7,2);shadow=ShadowTriangle(0,0,qvmMaterials.BUILTIN_PROJECTION_SHADOW,"",-1,7,2)
  policy=qvmMaterials.Catalog(array(2,void),[opaque],[],void,0,[],[],0,0,110,void,void);policy.triangles[0]=qvmMaterials.ResolvedTriangle(source,0)
  count=count+require(qvmMaterials.projectionShadowEligible(policy,shadow,1),"opaque unfogged MD3 source admits projection shadow")
  policy.materials[0].sort=9.0;count=count+require(not qvmMaterials.projectionShadowEligible(policy,shadow,1),"blended MD3 source rejects projection shadow like R_AddMD3Surfaces")
  qvmMaterials.bindTriangle(policy,shadow,1,void,[],[],112);count=count+require(policy.triangles[1].materialIndex== -1 and len(policy.materials)==1,"rejected projection shadow cannot enter the productive material batch")
  print("PASS: "+str(count)+" QVM scene material contracts");return 0
end function
