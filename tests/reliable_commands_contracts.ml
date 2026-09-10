import mq3.qcommon.message as message
import mq3.server.reliable_commands as reliable
function req(value,label) if not value then return error(499,"reliable commands: "+label) end if;return 1 end function
function main(args)
  n=0;c=reliable.create()
  n=n+req(len(c.reliableCommands)==64 and c.reliableSequence==0 and c.reliableAcknowledge==0 and c.reliableSent==0,"initial state")
  n=n+req(reliable.pending(c)==0,"initial pending")
  n=n+req(reliable.add(c,"one") and c.reliableSequence==1 and reliable.pending(c)==1,"first insertion")
  n=n+req(reliable.commandAt(c,1)=="one","first lookup")
  for i=2 to 64 reliable.add(c,"v"+str(i)) end for
  n=n+req(c.reliableSequence==64 and reliable.pending(c)==64,"full ring")
  n=n+req(reliable.commandAt(c,64)=="v64" and reliable.commandAt(c,63)=="v63","ring edge")
  n=n+req(not reliable.add(c,"overflow") and c.reliableSequence==65,"original overflow sequence advance")
  n=n+req(reliable.commandAt(c,65)=="one","overflow does not overwrite slot")
  n=n+req(reliable.acknowledge(c,2) and c.reliableAcknowledge==2,"valid acknowledgement")
  n=n+req(reliable.add(c,"wrap") and reliable.commandAt(c,66)=="wrap","wrapped insertion")
  n=n+req(not reliable.acknowledge(c,1) and c.reliableAcknowledge==c.reliableSequence,"stale acknowledgement repaired")
  n=n+req(reliable.acknowledge(c,c.reliableSequence+3) and reliable.pending(c)==0,"future acknowledgement retained")
  c=reliable.create();reliable.add(c,"a");reliable.add(c,"b");m=message.init(256);reliable.updateServerCommandsToClient(c,m)
  n=n+req(c.reliableSent==2 and m.cursize>0 and m.bit>0,"update sends and advances sent")
  first=m.data[0];m2=message.init(256);reliable.updateServerCommandsToClient(c,m2)
  n=n+req(m2.cursize==m.cursize and m2.bit==m.bit and m2.data[0]==first,"unacknowledged commands resend")
  reliable.acknowledge(c,2);m=message.init(256);reliable.updateServerCommandsToClient(c,m)
  n=n+req(m.cursize==0 and m.bit==0 and c.reliableSent==2,"acknowledged commands omitted")
  c.reliableCommands=[]
  n=n+req(try(reliable.commandAt(c,0)) is error,"invalid ring lookup rejected")
  n=n+req(try(reliable.updateServerCommandsToClient(c,message.init(64))) is error,"invalid ring update rejected")
  n=n+req(try(reliable.add(c,"x")) is error,"invalid ring insertion rejected")
  n=n+req(try(reliable.acknowledge(c,0)) is error,"invalid ring acknowledgement rejected")
  print "PASS: "+str(n)+" reliable-command contracts";return 0
end function
