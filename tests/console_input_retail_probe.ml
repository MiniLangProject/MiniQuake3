// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.key_bindings_config as config
import mq3.vm.cgame_key_traps as keys
import mq3.qcommon.command_buffer as command
import std.fs as fs

function main(args)
  if len(args)!=1 then print("usage: console_input_retail_probe <q3config.cfg>");return 2 end if
  raw=fs.readAllBytes(args[0]);if raw is error then return raw end if
  keyState=keys.create();commandState=command.create();command.initCommands(commandState);state=config.create(keyState)
  installed=config.install(state,commandState);if installed is error then return installed end if
  loaded=config.loadText(state,commandState,decode(raw));if loaded is error then return loaded end if
  output=config.bindingText(state);if len(bytes(output))<10 or decode(slice(bytes(output),0,10))!="unbindall\n" then return error(7740,"retail config did not produce binding preamble") end if
  print("PASS: retail q3config parsed bytes="+str(len(raw)));return 0
end function
