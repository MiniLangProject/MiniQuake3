// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.key_binding_dispatch as oracleBindingDispatch

function hexNibble(value) digits="0123456789abcdef";return decode(slice(bytes(digits),value,1)) end function
function dump(label,commands)
  text="";for each command in commands text=text+command.text end for;raw=bytes(text);encoded=""
  for each value in raw encoded=encoded+hexNibble(value>>4)+hexNibble(value&15) end for
  print(label+" "+encoded)
end function
function show(label,binding,down,time) expanded=oracleBindingDispatch.commands(binding,119,down,time);if expanded is error then return expanded end if;dump(label,expanded);return void end function
function main(args)
  show("forward-down","+forward",true,100);show("forward-up","+forward",false,140)
  show("compound-down","+attack; say fire; +moveup",true,200);show("compound-up","+attack; say fire; +moveup",false,260)
  show("plain-down","weapnext; say untouched",true,300);show("plain-up","weapnext; say untouched",false,320)
  return 0
end function
