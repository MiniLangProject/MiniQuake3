import mq3.client.cgame_draw as hud
function emit(values) for each value in values print("pic|"+str(value.x)+"|"+str(value.y)+"|"+str(value.width)+"|"+str(value.height)+"|"+value.shader) end for end function
function main(args)
  state=hud.state();emit(hud.drawField(state,10,20,1,15,false));emit(hud.drawField(state,10,20,2,-20,false));emit(hud.drawField(state,10,20,3,-7,false));emit(hud.drawField(state,10,20,4,12345,false));emit(hud.drawField(state,10,20,6,-99999,false));emit(hud.drawField(state,10,20,0,5,false));return 0
end function
