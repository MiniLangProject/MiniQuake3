import mq3.compat.numeric as n
import mq3.renderer.bsp_render_data as render
import mq3.renderer.tr_bsp_runtime as tr

function makeVertex(x,y,z) return render.RenderVertex([x,y,z],[0.0,0.0],[0.0,0.0],[0.0,0.0,1.0],[255,255,255,255],[255,255,255,255],[0.0,0.0],0.0,-1) end function
function rounded(value) return n.trunc32(value*1000000.0+0.5) end function
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  inputs=[[0.0,1.0,0.5],[0.1,1.0,0.5],[0.2,0.5,0.75],[0.6,1.0,1.0],[1.0,1.0,0.5]]
  for each input in inputs rgb=tr.HSVtoRGB(input[0],input[1],input[2]);print("H "+str(rounded(rgb[0]))+" "+str(rounded(rgb[1]))+" "+str(rounded(rgb[2]))) end for
  colors=[[1,2,3,4],[200,100,50,77],[255,255,255,128],[0,128,255,9]]
  for shift=0 to 2 for each input in colors shifted=tr.R_ColorShiftLightingBytes(input,shift);print("C "+str(shifted[0])+" "+str(shifted[1])+" "+str(shifted[2])+" "+str(shifted[3])) end for end for
  verts=[makeVertex(0.0,0.0,0.0),makeVertex(1.0,0.0,0.0),makeVertex(2.0,0.0,0.0),makeVertex(0.0,1.0,0.0),makeVertex(1.0,1.0,0.0),makeVertex(2.0,1.0,0.0),makeVertex(0.0,2.0,0.0),makeVertex(1.0,2.0,0.0),makeVertex(2.0,2.0,0.0)]
  grid=tr.Grid(verts,3,3,array(3,0.0),array(3,0.0),[0.0,0.0,0.0],0.0,false,false);print("M "+str(bit(tr.R_MergedWidthPoints(grid,0)))+" "+str(bit(tr.R_MergedHeightPoints(grid,0))))
  verts[2]=makeVertex(1.05,0.0,0.0);verts[6]=makeVertex(0.0,1.05,0.0);print("M "+str(bit(tr.R_MergedWidthPoints(grid,0)))+" "+str(bit(tr.R_MergedHeightPoints(grid,0))));return 0
end function
