import mq3.renderer.bsp_render_data as render

function emit(shift,red,green,blue,alpha)
  shifted=render.colorShiftLighting(red,green,blue,shift)
  print(str(shift)+"|"+str(red)+","+str(green)+","+str(blue)+","+str(alpha)+"|"+str(shifted[0])+","+str(shifted[1])+","+str(shifted[2])+","+str(alpha))
  return 1
end function

function main(args)
  emit(0,1,2,3,4)
  emit(1,10,20,30,40)
  emit(2,10,20,30,41)
  emit(2,64,64,64,42)
  emit(2,200,100,50,43)
  emit(2,251,252,253,44)
  emit(1,0,255,127,45)
  return 0
end function
