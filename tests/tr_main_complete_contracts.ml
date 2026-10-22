import mq3.renderer.tr_main_runtime as tr
import mq3.renderer.view_math as vm
import mq3.renderer.draw_surfs as ds

struct Surface kind plane vertices indexes end struct
struct Entity reType renderfx origin radius axis nonNormalizedAxes end struct
struct World origin axis viewOrigin modelMatrix end struct
struct LocalView world origin axis end struct

struct TestState failures checks end struct
function check(state,ok,label) state.checks=state.checks+1;if not ok then state.failures=state.failures+1;print("FAIL: "+label+"\n") end if;return void end function
function near(a,b) return a-b<0.0002 and b-a<0.0002 end function
function vec3(a,b) return near(a[0],b[0]) and near(a[1],b[1]) and near(a[2],b[2]) end function

function main(args)
state=TestState(0,0)
id=tr.identityMatrix();product=tr.myGlMultMatrix(id,[2.0,0.0,0.0,0.0,0.0,3.0,0.0,0.0,0.0,0.0,4.0,0.0,5.0,6.0,7.0,1.0])
check(state,product[0]==2.0 and product[5]==3.0 and product[10]==4.0 and product[12]==5.0,"myGlMultMatrix identity")

viewer=tr.R_RotateForViewer([10.0,20.0,30.0],tr.identityAxis())
check(state,vec3(viewer.viewOrigin,[10.0,20.0,30.0]),"R_RotateForViewer origin")
check(state,near(viewer.modelMatrix[12],20.0) and near(viewer.modelMatrix[13],-30.0) and near(viewer.modelMatrix[14],10.0),"R_RotateForViewer flip matrix")

world=World([0.0,0.0,0.0],tr.identityAxis(),[0.0,0.0,0.0],id);view=LocalView(world,[12.0,2.0,3.0],tr.identityAxis())
model=Entity(tr.RT_MODEL,0,[10.0,0.0,0.0],0.0,tr.identityAxis(),false);rot=tr.R_RotateForEntity(model,view)
check(state,vec3(rot.origin,[10.0,0.0,0.0]) and vec3(rot.viewOrigin,[2.0,2.0,3.0]),"R_RotateForEntity local eye")
sprite=Entity(tr.RT_SPRITE,0,[1.0,2.0,3.0],2.0,tr.identityAxis(),false);check(state,tr.R_RotateForEntity(sprite,view)==world,"non-model uses world orientation")

check(state,near(tr.SetFarClip(true,void,[0.0,0.0,0.0]),2048.0),"SetFarClip noworld")
check(state,near(tr.SetFarClip(false,[[-3.0,-4.0,0.0],[3.0,4.0,0.0]],[0.0,0.0,0.0]),5.0),"SetFarClip world bounds")
projection=tr.R_SetupProjection(90.0,90.0,1.0,101.0)
check(state,near(projection[0],1.0) and near(projection[5],1.0) and near(projection[10],-1.02) and near(projection[14],-2.02) and projection[11]==-1.0,"R_SetupProjection")

fallback=tr.R_PlaneForSurface(void);check(state,vec3(fallback.normal,[1.0,0.0,0.0]) and fallback.dist==0.0,"R_PlaneForSurface fallback")
face=Surface(tr.SF_FACE,vm.plane([0.0,0.0,1.0],7.0),void,void);p=tr.R_PlaneForSurface(face);check(state,vec3(p.normal,[0.0,0.0,1.0]) and p.dist==7.0,"R_PlaneForSurface face")
poly=Surface(tr.SF_POLY,void,[[0.0,0.0,0.0],[0.0,1.0,0.0],[1.0,0.0,0.0]],void);p=tr.R_PlaneForSurface(poly);check(state,near(p.dist,0.0) and near(p.normal[2],1.0),"R_PlaneForSurface polygon")

fogs=[void,[[-5.0,-5.0,-5.0],[5.0,5.0,5.0]],[[10.0,10.0,10.0],[20.0,20.0,20.0]]]
check(state,tr.R_SpriteFogNum([0.0,0.0,0.0],1.0,fogs,false)==1,"R_SpriteFogNum overlap")
check(state,tr.R_SpriteFogNum([5.0,0.0,0.0],0.0,fogs,false)==0,"R_SpriteFogNum strict edge")
check(state,tr.R_SpriteFogNum([0.0,0.0,0.0],1.0,fogs,true)==0,"R_SpriteFogNum noworld")

queue=ds.create(8);tr.R_AddDrawSurf(queue,"b",2,4,1,0);tr.R_AddDrawSurf(queue,"a",1,4,1,0);sorted=tr.R_SortDrawSurfs(queue)
check(state,sorted[0].surface=="a" and sorted[1].surface=="b","draw-surface facade")
fields=tr.R_DecomposeSort(sorted[0].sort);check(state,fields.shaderIndex==1 and fields.entityNum==4 and fields.fogNum==1,"R_DecomposeSort facade")

entities=[Entity(tr.RT_PORTALSURFACE,0,[0.0,0.0,0.0],0.0,tr.identityAxis(),false),Entity(tr.RT_SPRITE,0,[0.0,0.0,0.0],1.0,tr.identityAxis(),false),Entity(tr.RT_MODEL,2,[0.0,0.0,0.0],1.0,tr.identityAxis(),false),Entity(tr.RT_SPRITE,2,[0.0,0.0,0.0],1.0,tr.identityAxis(),false),Entity(tr.RT_MODEL,4,[0.0,0.0,0.0],1.0,tr.identityAxis(),false)]
selected=tr.R_AddEntitySurfaces(entities,false,fogs,false,true);check(state,len(selected)==3 and selected[0].entityIndex==1 and selected[0].fogNum==1 and selected[1].entityIndex==2 and selected[2].entityIndex==4,"R_AddEntitySurfaces main-view policy")
portalSelected=tr.R_AddEntitySurfaces(entities,true,fogs,false,true);check(state,len(portalSelected)==3 and portalSelected[0].entityIndex==1 and portalSelected[1].entityIndex==2 and portalSelected[2].entityIndex==3,"R_AddEntitySurfaces portal-view policy")
beamSelected=tr.R_AddEntitySurfaces([Entity(tr.RT_BEAM,0,[0.0,0.0,0.0],1.0,tr.identityAxis(),false)],false,fogs,false,true);check(state,beamSelected[0].fogNum==1,"generated entity fog")
check(state,len(tr.R_AddEntitySurfaces(entities,false,fogs,false,false))==0,"R_AddEntitySurfaces disabled")

debug=tr.R_DebugPolygon(5,[[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0]])
check(state,debug.solid.color==[1,0,1] and not debug.solid.wireframe and debug.outline.wireframe and debug.outline.depthMax==0.0,"R_DebugPolygon passes")

verts=[[-1.0,-1.0,-4.0],[1.0,-1.0,-4.0],[0.0,1.0,-4.0]];normals=[[0.0,0.0,1.0],[0.0,0.0,1.0],[0.0,0.0,1.0]];indexes=[0,1,2]
perspective=[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,-1.0,0.0,0.0,0.0,0.0]
check(state,not tr.SurfIsOffscreen(verts,normals,indexes,id,perspective,[0.0,0.0,0.0],100.0,true,false),"SurfIsOffscreen visible mirror")
check(state,tr.SurfIsOffscreen(verts,normals,indexes,id,perspective,[0.0,0.0,0.0],1.0,false,false),"SurfIsOffscreen portal range")
check(state,not tr.SurfIsOffscreen(verts,normals,indexes,id,perspective,[0.0,0.0,0.0],1.0,false,true),"SurfIsOffscreen SMP conservative")

if state.failures==0 then print("PASS: "+str(state.checks)+" complete tr_main contracts\n") else print("FAILURES: "+str(state.failures)+" / "+str(state.checks)+"\n");return 1 end if
return 0
end function
