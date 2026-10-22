import mq3.renderer.tr_curve_runtime as curve
import mq3.renderer.bsp_render_data as render
import mq3.compat.numeric as n
function makeVertex(x,y,z,c) return render.RenderVertex([x,y,z],[x*0.1,y*0.1],[x*0.2,y*0.2],[0.0,0.0,1.0],[c,c+1,c+2,255],[255,255,255,255],[0.0,0.0],0.0,-1) end function
function emitv(name,v) print(name+"|"+str(n.trunc32(v.position[0]*100))+","+str(n.trunc32(v.position[1]*100))+","+str(n.trunc32(v.position[2]*100))+"|"+str(n.trunc32(v.baseUV[0]*1000))+","+str(n.trunc32(v.baseUV[1]*1000))+"|"+str(v.color[0])+","+str(v.color[1])+","+str(v.color[2])+","+str(v.color[3])) end function
function main(args)
 emitv("lerp",curve.LerpDrawVert(makeVertex(0.0,2.0,4.0,10),makeVertex(2.0,4.0,6.0,20)))
 ctrl=[];for row=0 to 1 for column=0 to 2 ctrl=ctrl+[makeVertex(column+10*row,row,0,1)] end for end for;t=curve.Transpose(3,2,ctrl);print("transpose|"+str(n.trunc32(t[0].position[0]))+","+str(n.trunc32(t[1].position[0]))+","+str(n.trunc32(t[2].position[0]))+","+str(n.trunc32(t[3].position[0]))+","+str(n.trunc32(t[4].position[0]))+","+str(n.trunc32(t[5].position[0])))
 i=curve.InvertCtrl(3,2,ctrl);print("invert|"+str(n.trunc32(i[0].position[0]))+","+str(n.trunc32(i[1].position[0]))+","+str(n.trunc32(i[2].position[0]))+"|"+str(n.trunc32(i[3].position[0]))+","+str(n.trunc32(i[4].position[0]))+","+str(n.trunc32(i[5].position[0])))
 errors=curve.InvertErrorTable([[1.0,2.0,3.0],[10.0,20.0,30.0,40.0]],3,4);print("errors|"+str(n.trunc32(errors[0][0]))+","+str(n.trunc32(errors[0][1]))+","+str(n.trunc32(errors[0][2]))+","+str(n.trunc32(errors[0][3]))+"|"+str(n.trunc32(errors[1][0]))+","+str(n.trunc32(errors[1][1]))+","+str(n.trunc32(errors[1][2])))
 ctrl=[];for row=0 to 2 for column=0 to 2 z=0;if row==1 and column==1 then z=8 end if;ctrl=ctrl+[makeVertex(column*2,row*2,z,10+row*3+column)] end for end for;emitv("curve",curve.PutPointsOnCurve(ctrl,3,3)[4]);return 0
end function
