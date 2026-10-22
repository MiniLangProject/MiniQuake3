import std.fs as fs
import mq3.format.bsp as bsp
import mq3.renderer.bsp_render_data as render
import mq3.renderer.tr_curve_runtime as curve
function main(args)
  if len(args)!=1 then return error(7732,"expected retail BSP path") end if
  map=bsp.load(fs.readAllBytes(args[0]));if map is error then return map end if
  patches=0;vertices=0;triangles=0;largestWidth=0;largestHeight=0
  for face=0 to map.counts[13]-1
    offset=map.offsets[13]+face*render.FACE_STRIDE;kind=render.i32(map,offset+8)
    if kind==render.MST_PATCH then
      first=render.i32(map,offset+12);count=render.i32(map,offset+16);width=render.i32(map,offset+96);height=render.i32(map,offset+100);control=[]
      for index=0 to count-1 value=render.vertex(map,first+index);if value is error then return value end if;control=control+[value] end for
      grid=curve.R_SubdividePatchToGrid(width,height,control,render.DEFAULT_PATCH_ERROR);if grid is error then return grid end if
      if grid.width<2 or grid.height<2 or len(grid.verts)!=grid.width*grid.height or len(grid.widthLodError)!=grid.width or len(grid.heightLodError)!=grid.height then return error(7733,"invalid retained retail patch grid") end if
      patches=patches+1;vertices=vertices+len(grid.verts);triangles=triangles+(grid.width-1)*(grid.height-1)*2;if grid.width>largestWidth then largestWidth=grid.width end if;if grid.height>largestHeight then largestHeight=grid.height end if
    end if
  end for
  if patches<=0 or vertices<=0 or triangles<=0 then return error(7734,"retail map has no patch curves") end if
  print("PASS: retail tr_curve patches="+str(patches)+" vertices="+str(vertices)+" triangles="+str(triangles)+" largest="+str(largestWidth)+"x"+str(largestHeight));return 0
end function
