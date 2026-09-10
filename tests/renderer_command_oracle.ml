import mq3.renderer.command_queue as commands
import mq3.compat.numeric as n

function shader(context,handle) return handle+100 end function
function valuesText(values,scale)
  text="["
  if len(values)>0 then
    for i=0 to len(values)-1
      if i>0 then text=text+", " end if
      value=values[i];if scale then value=n.trunc32(value*1000.0) end if
      text=text+str(value)
    end for
  end if
  return text+"]"
end function
function printCommand(name,queue,index)
  command=queue.commands[index]
  scale=command.id==commands.RC_SET_COLOR or command.id==commands.RC_STRETCH_PIC
  print(name+"|"+str(queue.used)+"|"+str(command.id)+"|"+valuesText(command.values,scale)+"|"+str(command.shader))
end function
function main(args)
  q=commands.create(shader,void)
  commands.setColor(q,void);printCommand("white",q,0)
  commands.setColor(q,[0.5,0.25,0.75,1.0]);printCommand("color",q,1)
  commands.stretchPic(q,1.0,2.0,3.0,4.0,0.0,0.1,0.9,1.0,7);printCommand("pic",q,2)
  commands.drawBuffer(q,1029);printCommand("buffer",q,3)
  commands.swapBuffers(q);printCommand("swap",q,4)
  q.used=commands.MAX_RENDER_COMMANDS-commands.END_COMMAND_BYTES
  print("drop|"+str(commands.swapBuffers(q))+"|"+str(q.used)+"|"+str(len(q.commands)))
  q2=commands.create(void,void);q2.used=commands.MAX_RENDER_COMMANDS-commands.END_COMMAND_BYTES-commands.SWAP_BUFFERS_BYTES
  print("edge|"+str(commands.swapBuffers(q2))+"|"+str(q2.used)+"|"+str(len(q2.commands)))
  return 0
end function
