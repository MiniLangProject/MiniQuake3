import mq3.client.cl_keys_runtime as cl
import mq3.client.console_input as console
import mq3.client.key_bindings_config as config
import mq3.format.pk3 as pk3
function main(args)
  if len(args)!=1 then return error(7802,"pak path required") end if;archive=pk3.open(args[0]);if archive is error then return archive end if;raw=pk3.read(archive,"default.cfg");if raw is error then return raw end if;text=decode(raw);state=cl.create(78,console.services(void));ready=cl.CL_InitKeyCommands(state);if ready is error then return ready end if;loaded=config.loadText(state.bindingState,state.commandState,text);if loaded is error then return loaded end if
  if cl.Key_GetBinding(state,119)!="+forward" or cl.Key_GetBinding(state,178)!="+attack" or cl.Key_GetBinding(state,9)!="+scores" or not state.archiveModified then return error(7803,"Retail default.cfg bindings missing") end if
  serialized=cl.Key_WriteBindings(state);if len(bytes(serialized))<300 then return error(7804,"Retail bindings did not serialize") end if
  print("PASS: retail cl_keys default.cfg bytes="+str(len(raw))+" binds="+str(cl.Key_Bindlist_f(state,["bindlist"])));return 0
end function
