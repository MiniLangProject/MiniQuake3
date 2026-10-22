import mq3.renderer.tr_surface_runtime as tr
import mq3.renderer.surface_polychain as poly
import mq3.renderer.surface_mesh as mesh
import mq3.renderer.surface_grid as grid
import mq3.renderer.surface_md3 as md3

struct ListSurface listNum end struct
function require(ok,text) if not ok then return error(7781,text) end if;return 1 end function
function axis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
function entity(kind) return tr.EntityInput(kind,[10.0,20.0,30.0],[20.0,20.0,30.0],2.0,0.0,[11,22,33,255]) end function
function view() return tr.ViewInput([0.0,0.0,0.0],axis(),false) end function
function gv(x,y) return grid.vertex([x,y,0.0],[0.0,0.0,1.0],[x,y],[x*0.5,y*0.5],[1,2,3,255]) end function
function main(args)
  count=0
  buffer=poly.create(16,48);count=count+require(not tr.RB_CheckOverflow(buffer,4,6),"overflow fitting")
  buffer.numVertexes=12;count=count+require(tr.RB_CheckOverflow(buffer,4,6) and buffer.flushes==1,"overflow sentinel flush")
  sprite=tr.RB_SurfaceEntity(entity(tr.RT_SPRITE),view(),0,0,16,48,32.0,16.0,6.0);count=count+require(len(sprite.vertices)==4 and sprite.indexes==[0,1,3,3,1,2],"sprite dispatch")
  beam=tr.RB_SurfaceEntity(entity(tr.RT_BEAM),view(),0,0,16,48,32.0,16.0,6.0);count=count+require(len(beam.vertices)==14 and len(beam.indexes)==36,"beam dispatch")
  rail=tr.RB_SurfaceEntity(entity(tr.RT_RAIL_CORE),view(),0,0,16,48,32.0,16.0,6.0);count=count+require(len(rail.vertices)==4 and len(rail.indexes)==6,"rail core dispatch")
  rings=tr.RB_SurfaceEntity(entity(tr.RT_RAIL_RINGS),view(),0,0,16,48,4.0,16.0,6.0);count=count+require(len(rings.vertices)>0 and len(rings.indexes)>0,"rail ring dispatch")
  lightning=tr.RB_SurfaceEntity(entity(tr.RT_LIGHTNING),view(),0,0,16,48,32.0,16.0,6.0);count=count+require(len(lightning.vertices)==16 and len(lightning.indexes)==24,"lightning dispatch")
  axes=tr.RB_SurfaceEntity(entity(999),view(),0,0,16,48,32.0,16.0,6.0);count=count+require(len(axes.lines)==3 and axes.lines[2].finish==[0.0,0.0,16.0],"axis diagnostic")
  lod=tr.LodErrorForVolume([0.0,0.0,0.0],2.0,8.0,[12.0,0.0,0.0],axis(),[0.0,0.0,0.0],[1.0,0.0,0.0]);count=count+require(lod>0.799 and lod<0.801,"LOD distance")
  count=count+require(tr.LodErrorForVolume([0.0,0.0,0.0],20.0,8.0,[12.0,0.0,0.0],axis(),[0.0,0.0,0.0],[1.0,0.0,0.0])==8.0,"LOD minimum distance")
  count=count+require(tr.LodErrorForVolume([0.0,0.0,0.0],2.0,-1.0,[12.0,0.0,0.0],axis(),[0.0,0.0,0.0],[1.0,0.0,0.0])==0.0,"negative LOD cvar")
  surface=grid.grid(3,2,[0.0,1.0,0.0],[0.0,0.0],[gv(0.0,0.0),gv(1.0,0.0),gv(2.0,0.0),gv(0.0,1.0),gv(1.0,1.0),gv(2.0,1.0)])
  submitted=tr.RB_SurfaceGrid(surface,[0.0,0.0,0.0],0.0,2.0,[10.0,0.0,0.0],axis(),[0.0,0.0,0.0],[1.0,0.0,0.0],64,128,true,7);count=count+require(submitted.widthTable==[0,2] and submitted.numIndexes==6,"grid LOD facade")
  v=mesh.vertex([1.0,2.0,3.0],[0.0,0.0,1.0],[0.0,0.0],[0.5,0.5],[1,2,3,4]);tri=mesh.triangles([v,v,v],[0,1,2],[3,5]);ts=tr.RB_SurfaceTriangles(tri,1,true,0,0,16,48,1);count=count+require(ts.dlightBits==5 and ts.indexes==[0,1,2],"triangle facade")
  count=count+require(tr.RB_SurfaceTriangles(tri,1,true,13,0,16,48,1).flushed,"triangle equality sentinel")
  face=mesh.face([0.0,1.0,0.0],[v,v,v],[0,1,2],[4,8]);fs=tr.RB_SurfaceFace(face,0,true,0,0,16,48,2);count=count+require(fs.normals[0]==[0.0,1.0,0.0] and fs.dlightBits==6,"face facade")
  p=poly.create(16,48);tr.RB_SurfacePolychain(p,[poly.vertex(0.0,0.0,0.0,0.0,0.0,1,2,3,4),poly.vertex(1.0,0.0,0.0,1.0,0.0,1,2,3,4),poly.vertex(0.0,1.0,0.0,0.0,1.0,1,2,3,4)]);count=count+require(p.indexes==[0,1,2],"polychain facade")
  normals=tr.VectorArrayNormalize([[2.0,0.0,0.0],[0.0,3.0,0.0]],2);count=count+require(normals[0][0]>0.99 and normals[1][1]>0.99,"normal array")
  packed=md3.vertex(64,0,0,0);m=md3.surface(1,3,1,[0,1,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[packed,packed,packed]])
  lerped=tr.LerpMeshVertexes(m,0,0,0.0);count=count+require(lerped[0][0][0]==1.0,"MD3 lerp facade")
  ms=tr.RB_SurfaceMesh(m,0,0,0.0,0,0,16,48,9);count=count+require(ms.indexes==[0,1,2] and ms.dlightBits==9,"MD3 submit facade")
  count=count+require(tr.RB_SurfaceMesh(m,0,0,0.0,13,0,16,48,9).flushed,"MD3 equality sentinel")
  core=tr.DoRailCore([0.0,0.0,0.0],[8.0,0.0,0.0],[0.0,1.0,0.0],8,2.0,[255,0,0,255]);count=count+require(core.indexes==[0,1,2,2,1,3],"DoRailCore facade")
  discs=tr.DoRailDiscs(2,[0.0,0.0,0.0],[8.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],8.0,[255,0,0,255]);count=count+require(len(discs.vertices)==4,"DoRailDiscs facade")
  quad=tr.RB_AddQuadStamp([0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[255,255,255,255],[0.0,0.0,1.0],0,0,16,48);count=count+require(quad.vertices[0].xyz==[1.0,1.0,0.0],"quad facade")
  ext=tr.RB_AddQuadStampExt([0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[255,255,255,255],[0.0,0.0,1.0],0.2,0.3,0.8,0.9,0,0,16,48);count=count+require(ext.vertices[2].tex0[0]>0.799 and ext.vertices[2].tex0[0]<0.801 and ext.vertices[2].tex0[1]>0.899 and ext.vertices[2].tex0[1]<0.901,"extended quad facade")
  count=count+require(tr.RB_SurfaceFlare(void)==void and tr.RB_SurfaceSkip(void)==void,"original no-op surfaces")
  call=tr.RB_SurfaceDisplayList(ListSurface(42));count=count+require(call.listNum==42,"display-list command")
  count=count+require(try(tr.RB_SurfaceBad(void)) is error,"bad surface reports error")
  count=count+require(try(tr.RB_SurfaceDisplayList(ListSurface(-1))) is error,"invalid display list")
  print("PASS: "+str(count)+" complete tr_surface contracts");return 0
end function
