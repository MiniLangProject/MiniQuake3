import mq3.compat.numeric as n
import mq3.renderer.bsp_render_data as render

function quantized(value) if value>=0.0 then return n.trunc32(value*1000000.0+0.5) end if;return n.trunc32(value*1000000.0-0.5) end function
function emit(name,v) print(name+"|"+str(quantized(v[0]))+"|"+str(quantized(v[1]))+"|"+str(quantized(v[2]))) end function
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
  return 0
end function
