// Isolate the repeated Cgame-mark triangle expansion seen late in q3dm1.
import mq3.renderer.qvm_scene_geometry as geometry
import mq3.renderer.scene_queue as scene
import std.time as time

const POLYS=250
const FRAMES=1000

function main(args)
  if len(args)!=1 or (args[0]!="old" and args[0]!="direct") then return error(7680,"usage: qvm_poly_geometry_benchmark old|direct") end if
  polygons=array(POLYS,void)
  for index=0 to POLYS-1
    vertices=[scene.PolyVert([index*1.0,0.0,0.0],[0.0,0.0],[255,40,20,255]),scene.PolyVert([index*1.0+1.0,0.0,0.0],[1.0,0.0],[255,40,20,255]),scene.PolyVert([index*1.0,1.0,0.0],[0.0,1.0],[255,40,20,255])]
    polygons[index]=scene.Poly(7,vertices,0)
  end for
  output=geometry.Geometry(array(POLYS,void),0,0,0,0,0,0,0,0,[],0,[],0)
  startGc=gc_stat(0);started=time.ticks()
  for frame=0 to FRAMES-1
    output.triangleCount=0;output.polySurfaces=0
    for index=0 to POLYS-1
      poly=polygons[index];a=poly.verts[0];b=poly.verts[1];c=poly.verts[2]
      result=void
      if args[0]=="direct" then result=geometry.appendPolyTriangle(output,poly,a,b,c)
      else
        value=geometry.triangle([a.xyz,b.xyz,c.xyz],[a.st,b.st,c.st],[geometry.normal(),geometry.normal(),geometry.normal()],[a.modulate,b.modulate,c.modulate],[255,255,255,255],[0.0,0.0],0.0,0,0,poly.hShader,"","",-1,output.polySurfaces,0)
        result=geometry.appendTriangle(output,value)
      end if
      if result is error then return result end if
      output.polySurfaces=output.polySurfaces+1
    end for
  end for
  elapsed=time.ticks()-started
  if output.triangleCount!=POLYS or output.triangles[POLYS-1].positions[0][0]!=(POLYS-1)*1.0 then return error(7681,"polygon benchmark output changed") end if
  print("QVM poly expansion: mode="+args[0]+" triangles="+str(POLYS*FRAMES)+" elapsed_ms="+str(elapsed)+" gc_cycles="+str(gc_stat(0)-startGc))
  return 0
end function
