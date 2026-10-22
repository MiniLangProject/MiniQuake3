import mq3.renderer.tr_light_runtime as tr
import mq3.renderer.playable_light_grid as grid
import mq3.compat.numeric as n

function req(ok,text) if not ok then return error(7796,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.002 end function
function fixture()
  data=bytes(64,0);for cell=0 to 7 at=cell*8;data[at]=10;data[at+1]=20;data[at+2]=30;data[at+3]=40;data[at+4]=50;data[at+5]=60;data[at+6]=0;data[at+7]=0 end for
  return grid.Grid(data,0,64,[0.0,0.0,0.0],[10.0,10.0,10.0],[0.1,0.1,0.1],[2,2,2],true,[])
end function
function main(args)
  count=0;axis=tr.identityAxis();orient=tr.orientation([10.0,20.0,30.0],[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]);lights=[tr.dlight([7.0,22.0,35.0],2.0,[1.0,0.5,0.25])]
  tr.R_TransformDlights(1,lights,orient);count=count+req(lights[0].transformed==[2.0,3.0,5.0],"R_TransformDlights")
  surfaces=[tr.Surface(tr.SF_FACE,[0,0]),tr.Surface(tr.SF_GRID,[0,0]),tr.Surface(tr.SF_TRIANGLES,[0,0]),tr.Surface(99,[7,8])];model=tr.Bmodel([[-1.0,-1.0,-1.0],[1.0,1.0,1.0]],surfaces);owner=tr.entity([0.0,0.0,0.0]);localLights=[tr.dlight([2.0,0.0,0.0],1.0,[1.0,1.0,1.0]),tr.dlight([2.01,0.0,0.0],1.0,[1.0,1.0,1.0])]
  mask=tr.R_DlightBmodel(model,localLights,tr.orientation([0.0,0.0,0.0],axis),1,owner);count=count+req(mask==1 and owner.needDlights,"R_DlightBmodel expanded bounds")
  count=count+req(surfaces[0].dlightBits[1]==1 and surfaces[1].dlightBits[1]==1 and surfaces[2].dlightBits[1]==1,"R_DlightBmodel surface masks")
  count=count+req(surfaces[3].dlightBits==[7,8],"R_DlightBmodel ignores non-lit surface types")
  world=fixture();ent=tr.entity([5.0,5.0,5.0]);tr.R_SetupEntityLightingGrid(world,ent,0.5,0.25);count=count+req(ent.ambientLight==[20.0,40.0,60.0] and ent.directedLight==[40.0,50.0,60.0],"R_SetupEntityLightingGrid scaling")
  count=count+req(near(ent.lightDir[2],1.0),"R_SetupEntityLightingGrid direction")
  ent.renderfx=tr.RF_LIGHTING_ORIGIN;ent.lightingOrigin=[0.0,0.0,0.0];tr.R_SetupEntityLightingGrid(world,ent,1.0,1.0);count=count+req(ent.ambientLight==[40.0,80.0,120.0],"RF_LIGHTING_ORIGIN")
  ent.renderfx=tr.RF_FIRST_PERSON;ent.ambientLight=[9.0,10.0,99.0];ent.directedLight=[4.0,5.0,88.0];count=count+req(tr.LogLight(ent)=="amb:10  dir:5\n","LogLight preserves Baseq3 else-if")
  ent.renderfx=0;count=count+req(tr.LogLight(ent)==void,"LogLight first-person filter")
  lit=tr.entity([0.0,0.0,0.0]);refdef=tr.Refdef(0,[tr.dlight([16.0,0.0,0.0],16.0,[1.0,0.5,0.25])]);tr.R_SetupEntityLighting(refdef,world,lit,1.0,255.0,[0.0,0.0,1.0],1.0,1.0,false)
  count=count+req(lit.lightingCalculated and lit.ambientLight==[72.0,112.0,152.0],"R_SetupEntityLighting grid and minimum")
  count=count+req(lit.directedLight==[176.0,208.0,244.0],"R_SetupEntityLighting dynamic light")
  count=count+req(lit.ambientLightInt==(72|(112<<8)|(152<<16)|(255<<24)),"ambientLightInt RGBA packing")
  before=[lit.directedLight[0],lit.directedLight[1],lit.directedLight[2]];tr.R_SetupEntityLighting(refdef,world,lit,1.0,255.0,[0.0,0.0,1.0],1.0,1.0,false);count=count+req(lit.directedLight==before,"lightingCalculated cache")
  menu=tr.entity([0.0,0.0,0.0]);tr.R_SetupEntityLighting(tr.Refdef(tr.RDF_NOWORLDMODEL,[]),world,menu,1.0,255.0,[0.0,0.0,1.0],1.0,1.0,false);count=count+req(menu.ambientLight==[182.0,182.0,182.0] and menu.directedLight==[150.0,150.0,150.0],"RDF_NOWORLDMODEL fallback")
  rotated=tr.entity([0.0,0.0,0.0]);rotated.axis=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]];tr.R_SetupEntityLighting(tr.Refdef(tr.RDF_NOWORLDMODEL,[]),world,rotated,1.0,255.0,[1.0,0.0,0.0],1.0,1.0,false);count=count+req(rotated.lightDir==[0.0,-1.0,0.0],"entity-local light direction")
  point=tr.R_LightForPoint(world,[5.0,5.0,5.0],1.0,1.0);count=count+req(point.found and point.ambientLight==[40.0,80.0,120.0] and point.directedLight==[160.0,200.0,240.0],"R_LightForPoint")
  invalid=grid.Grid(bytes(1,0),0,1,[0.0,0.0,0.0],[1.0,1.0,1.0],[1.0,1.0,1.0],[1,1,1],false,[]);count=count+req(not tr.R_LightForPoint(invalid,[0.0,0.0,0.0],1.0,1.0).found,"R_LightForPoint no grid")
  dark=fixture();for index=0 to len(dark.data)-1 dark.data[index]=0 end for;darkResult=tr.R_LightForPoint(dark,[5.0,5.0,5.0],1.0,1.0);count=count+req(darkResult.found and darkResult.lightDir==[0.0,0.0,0.0],"black grid preserves VectorNormalize2 zero direction")
  outside=tr.R_LightForPoint(world,[-5.0,5.0,5.0],1.0,1.0);count=count+req(outside.found and outside.ambientLight==[40.0,80.0,120.0],"unclamped interpolation fraction follows Baseq3")
  print("PASS: "+str(count)+" complete tr_light contracts");return 0
end function
