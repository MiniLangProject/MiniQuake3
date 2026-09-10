import mq3.client.cgame_vm as cgameVm
function main(args)
  print str(cgameVm.CG_INIT)+"|"+str(cgameVm.CG_SHUTDOWN)+"|"+str(cgameVm.CG_CONSOLE_COMMAND)+"|"+str(cgameVm.CG_DRAW_ACTIVE_FRAME)+"|"+str(cgameVm.CG_CROSSHAIR_PLAYER)+"|"+str(cgameVm.CG_LAST_ATTACKER)+"|"+str(cgameVm.CG_KEY_EVENT)+"|"+str(cgameVm.CG_MOUSE_EVENT)+"|"+str(cgameVm.CG_EVENT_HANDLING)+"|"+str(cgameVm.CA_LOADING)+"|"+str(cgameVm.CA_PRIMED)+"|"+str(cgameVm.KEYCATCH_CGAME)
  return 0
end function
