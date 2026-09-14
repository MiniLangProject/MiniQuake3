import mq3.renderer.qvm_scene_materials as qvmMaterials

struct Triangle shaderHandle customSkin shaderName surfaceName end struct
function require(value,message) if not value then return error(7684,"QVM scene materials: "+message) end if;return 1 end function

function main(args)
  count=0;first=qvmMaterials.Binding(1,0,"models/first","body",3);second=qvmMaterials.Binding(2,7,"models/second","head",9)
  catalog=qvmMaterials.Catalog([],[],[],void,0,[],[first,second],0,0,64,void)
  triangle=Triangle(2,7,"models/second","head")
  count=count+require(qvmMaterials.sameBinding(second,triangle),"matching binding recognized")
  count=count+require(not qvmMaterials.sameBinding(void,triangle) and not qvmMaterials.sameBinding(first,triangle),"missing and different bindings rejected")
  count=count+require(qvmMaterials.cachedBinding(catalog,triangle)==9 and catalog.recentBinding==second,"first lookup populates recent binding")
  catalog.bindings=[];count=count+require(qvmMaterials.cachedBinding(catalog,triangle)==9,"recent binding avoids the full binding table")
  unknown=Triangle(3,0,"models/missing","tag");count=count+require(qvmMaterials.cachedBinding(catalog,unknown)== -2,"unknown binding retains miss sentinel")
  triangle.shaderName="models/SECOND";count=count+require(qvmMaterials.cachedBinding(catalog,triangle)== -2,"binding keys remain byte-exact after initial shader resolution")
  remapBinding=qvmMaterials.Binding(1,0,"models/first","body",0);remapCatalog=qvmMaterials.Catalog([],[qvmMaterials.Material(0,"textures/old","",void,-1,[],[],false,3.0,false,false)],[],void,0,[],[remapBinding],0,0,64,remapBinding)
  remapTriangle=Triangle(1,0,"models/first","body");assets=["textures/old"];kinds=["shader"]
  count=count+require(qvmMaterials.bindingMatchesRegistry(remapCatalog,0,remapTriangle,assets,kinds),"cached binding matches original registered shader")
  assets[0]="textures/new";count=count+require(not qvmMaterials.bindingMatchesRegistry(remapCatalog,0,remapTriangle,assets,kinds),"shader remap invalidates material binding")
  qvmMaterials.storeBinding(remapCatalog,remapTriangle,7);count=count+require(len(remapCatalog.bindings)==1 and remapCatalog.bindings[0].materialIndex==7,"remapped binding updates without cache growth")
  print("PASS: "+str(count)+" QVM scene material contracts");return 0
end function
