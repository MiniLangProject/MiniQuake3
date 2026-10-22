import mq3.client.ui_main as u
function main(args)
  state=u.create(true);state.fullscreenResult=7;state.consoleResult=42
  for command=0 to 11 before=len(state.actions);value=u.vmMain(state,command,[100+command,200+command]);called=-1;a0=-1;a1=-1;if len(state.actions)>before then called=command;action=state.actions[len(state.actions)-1];if len(action.args)>0 then a0=action.args[0] end if;if len(action.args)>1 then a1=action.args[1] end if end if;print(str(command)+"|"+str(value.value)+"|"+str(called)+"|"+str(a0)+"|"+str(a1)) end for;return 0
end function
