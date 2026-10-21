import mq3.renderer.noise as noise
import mq3.compat.numeric as numeric

function rounded(value)
  if value>=0.0 then return numeric.trunc32(value*1000000.0+0.5) end if
  return numeric.trunc32(value*1000000.0-0.5)
end function

function main(args)
  state=noise.create()
  cases=[[0.0,0.0,0.0,0.0],[0.25,0.5,0.75,1.0],[-0.25,-0.5,-0.75,-1.0],[255.9,256.1,511.5,12.75],[-256.125,1024.875,-511.25,7.5],[3.1415927,2.7182817,1.4142135,0.5772157],[100.125,200.25,300.5,400.75],[-1000.75,0.03125,64.5,-32.25]]
  index=0
  for each item in cases
    print(str(index)+"|"+str(rounded(noise.get4f(state,item[0],item[1],item[2],item[3]))))
    index=index+1
  end for
  return 0
end function
