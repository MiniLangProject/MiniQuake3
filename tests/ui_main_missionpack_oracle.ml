// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.ui_main_missionpack as ui
function size(value) print("size:"+str(value)+"="+ui.UI_ReadableSize(value)) end function
function time(value) print("time:"+str(value)+"="+ui.UI_PrintTime(value)) end function
function scalar(value) if typeof(value)=="bool" then if value then return 1 end if;return 0 end if;return value end function
function vm(state,command,args,event) value=ui.vmMain(state,command,args);print("vm:"+str(command)+"="+str(scalar(value.value))+":"+event) end function
function main(args)
  for each value in [1024,1025,1048576,1048577,1073741824,1073741825,1610612736] size(value) end for
  for each value in [60000,61000,3600000,3601000] time(value) end for
  print("find:sarge="+str(ui.stristr("AlphaSARGEomega","sarge")));print("find:missing="+str(ui.stristr("AlphaSARGEomega","missing")));print("find:empty="+str(ui.stristr("AlphaSARGEomega","")))
  state=ui.create(false);vm(state,0,[],"");vm(state,1,[1],"init:1");vm(state,3,[13,1],"key:13:1");vm(state,4,[-2,4],"mouse:-2:4");vm(state,5,[99],"refresh:99");vm(state,6,[],"full");vm(state,7,[4],"menu:4");vm(state,8,[77,"ui_report"],"console:77");vm(state,9,[1],"connect:1");vm(state,10,[],"");vm(state,99,[],"");return 0
end function
