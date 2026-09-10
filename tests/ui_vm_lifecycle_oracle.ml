import mq3.client.ui_vm as uiVm
function main(args)
  print str(uiVm.UI_GETAPIVERSION)+"|"+str(uiVm.UI_INIT)+"|"+str(uiVm.UI_SHUTDOWN)+"|"+str(uiVm.UI_KEY_EVENT)+"|"+str(uiVm.UI_MOUSE_EVENT)+"|"+str(uiVm.UI_REFRESH)+"|"+str(uiVm.UI_IS_FULLSCREEN)+"|"+str(uiVm.UI_SET_ACTIVE_MENU)+"|"+str(uiVm.UI_CONSOLE_COMMAND)+"|"+str(uiVm.UI_DRAW_CONNECT_SCREEN)+"|"+str(uiVm.UI_HASUNIQUECDKEY)+"|"+str(uiVm.KEYCATCH_UI)+"|"+str(uiVm.CA_AUTHORIZING)+"|"+str(uiVm.CA_ACTIVE)
  return 0
end function
