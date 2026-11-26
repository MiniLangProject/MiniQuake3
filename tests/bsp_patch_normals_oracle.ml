import mq3.compat.numeric as n
import mq3.renderer.bsp_render_data as render

function quantized(value) if value>=0.0 then return n.trunc32(value*1000000.0+0.5) end if;return n.trunc32(value*1000000.0-0.5) end function
function emit(name,v) print(name+"|"+str(quantized(v[0]))+"|"+str(quantized(v[1]))+"|"+str(quantized(v[2]))) end function
function emitPatch(curved)
  points=array(25,void)
  for y=0 to 4
    for x=0 to 4
      index=y*5+x
      height=0.0
      if curved==1 and x==3 and y==3 then height=32.0 end if
      points[index]=render.RenderVertex([x*1.0,y*1.0,height],[index*1.0,0.0],[0.0,0.0],[0.0,0.0,0.0],[10+index,0,0,0],[255,255,255,255],[0.0,0.0],0.0,index)
    end for
  end for
  mesh=render.subdividePatch(points,5,5,4.0)
  print("G"+str(curved)+"|"+str(mesh[1])+"|"+str(mesh[2]))
  for each point in mesh[0]
    p=point.position
    print("P"+str(curved)+"|"+str(quantized(p[0]))+"|"+str(quantized(p[1]))+"|"+str(quantized(p[2]))+"|"+str(quantized(point.baseUV[0]))+"|"+str(point.color[0]))
  end for
end function
function main(args)
  grid=[]
  for y=0 to 4
    for x=0 to 4
      u=x*0.25;v=y*0.25;position=[u*2.0,v*2.0,32.0*(2.0*u*(1.0-u))*(2.0*v*(1.0-v))]
      grid=grid+[render.RenderVertex(position,[0.0,0.0],[0.0,0.0],[0.0,0.0,0.0],[255,255,255,255],[255,255,255,255],[0.0,0.0],0.0,-1)]
    end for
  end for
  grid=render.makeGridNormals(grid,5,5)
  for y=0 to 4 for x=0 to 4 emit("N"+str(y)+str(x),grid[y*5+x].normal) end for end for
  circleX=[1.0,0.0,-1.0,0.0,1.0];circleZ=[0.0,1.0,0.0,-1.0,0.0];grid=[]
  for y=0 to 4 for x=0 to 4 grid=grid+[render.RenderVertex([circleX[x],y*1.0,circleZ[x]],[0.0,0.0],[0.0,0.0],[0.0,0.0,0.0],[255,255,255,255],[255,255,255,255],[0.0,0.0],0.0,-1)] end for end for
  grid=render.makeGridNormals(grid,5,5);for y=0 to 4 for x=0 to 4 emit("W"+str(y)+str(x),grid[y*5+x].normal) end for end for
  positions=[0.0,0.0,1.0,2.0,2.0];grid=[]
  for y=0 to 4 for x=0 to 4 grid=grid+[render.RenderVertex([positions[x],positions[y],0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0,0.0],[255,255,255,255],[255,255,255,255],[0.0,0.0],0.0,-1)] end for end for
  grid=render.makeGridNormals(grid,5,5);for y=0 to 4 for x=0 to 4 emit("D"+str(y)+str(x),grid[y*5+x].normal) end for end for
  emitPatch(0)
  emitPatch(1)
  return 0
end function
