import mq3.client.ui_controls as controls
import mq3.vm.cgame_key_traps as keys

function row(state,name,command) result=controls.getKeyAssignment(state,command);print(name+"|"+str(result[0])+"|"+str(result[1]));return void end function
function main(args)
  state=controls.create(true);keys.setBinding(state.keyState,9,"+scores");keys.setBinding(state.keyState,32,"+MOVEUP");keys.setBinding(state.keyState,90,"+moveup");keys.setBinding(state.keyState,132,"+moveup");keys.setBinding(state.keyState,180,"+button3")
  row(state,"single","+scores");row(state,"first-two","+moveup");row(state,"case","+MoVeUp");row(state,"mouse","+button3");row(state,"missing","+zoom");row(state,"empty","");return 0
end function
