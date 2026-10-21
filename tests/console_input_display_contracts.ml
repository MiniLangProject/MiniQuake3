// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.console_input as input
import mq3.client.console_input_display as display

function req(value,label) if not value then return error(7741,"console display: "+label) end if;return 1 end function
function main(args)
  count=0;state=input.create(6,input.services(void));view=display.present(state,0);count=count+req(not view.active,"inactive")
  input.toggleConsole(state);view=display.present(state,0);count=count+req(view.active and view.kind=="console" and view.text=="]_","console toggle")
  input.charEvent(state,state.console,97);input.charEvent(state,state.console,98);input.charEvent(state,state.console,99);view=display.present(state,0);count=count+req(view.text=="]abc_","console cursor")
  view=display.present(state,256);count=count+req(view.text=="]abc","cursor blink")
  state.console.text="abcdefgh";state.console.cursor=8;state.console.scroll=2;view=display.present(state,0);count=count+req(view.text=="]cdefgh_","horizontal scroll")
  input.toggleConsole(state);input.beginMessage(state,true,-1);state.chat.text="go";state.chat.cursor=2;view=display.present(state,0);count=count+req(view.kind=="message" and view.text=="say_team: go_","team prompt")
  state.chatPlayerNum=4;view=display.present(state,0);count=count+req(view.text=="tell 4: go_","tell prompt")
  input.beginMessage(state,false,-1);view=display.present(state,0);count=count+req(not view.active,"message toggle close")
  print("PASS: "+str(count)+" console display contracts");return 0
end function
