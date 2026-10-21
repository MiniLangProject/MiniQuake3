// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.command_ring as contractCommandRing

function req(value,label) if not value then return error(7731,"client command ring: "+label) end if;return 1 end function

function main(args)
  count=0;commands=contractCommandRing.create()
  count=count+req(len(commands)==64,"capacity")
  result=contractCommandRing.advance(5,300,100,7);count=count+req(not result.created and result.commandNumber==7 and result.oldFrameTime==100,"connected guard")
  result=contractCommandRing.advance(7,300,0,0);count=count+req(result.created and result.frameMsec==200 and result.commandNumber==1 and result.slot==1,"hitch clamp")
  result=contractCommandRing.advance(7,250,300,63);count=count+req(result.frameMsec== -50 and result.commandNumber==64 and result.slot==0,"signed delta and wrap")
  for number=1 to 70 contractCommandRing.store(commands,number,number*10) end for
  count=count+req(contractCommandRing.get(commands,70,70)==700,"latest")
  count=count+req(contractCommandRing.get(commands,70,7)==70,"oldest retained")
  count=count+req(contractCommandRing.get(commands,70,6)==void,"wrapped command")
  count=count+req(try(contractCommandRing.get(commands,70,71)) is error,"future command")
  count=count+req(try(contractCommandRing.get([],0,0)) is error,"invalid storage get")
  count=count+req(try(contractCommandRing.store([],0,0)) is error,"invalid storage store")
  contractCommandRing.clear(commands);count=count+req(contractCommandRing.get(commands,70,70)==void and contractCommandRing.get(commands,70,7)==void,"clear")
  print("PASS: "+str(count)+" client command-ring contracts");return 0
end function
