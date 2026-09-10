import mq3.qcommon.message as message
import mq3.server.snapshot_delta as snapshot
import mq3.game.entitystate as es
function encodeHex(data,count) d=bytes("0123456789abcdef");s="";if count>0 then for i=0 to count-1 v=data[i];s=s+decode(bytes([d[(v>>4)&15],d[v&15]])) end for end if;return s end function
function state(number,value) e=es.create();e.number=number;e.eType=value;e.pos.trTime=value*101;e.origin[0]=value;return e end function
function baseline(number) e=es.create();e.number=number;return e end function
function run(name,ring,capacity,oldFrame,newFrame,baselines)
  m=message.init(4096);count=snapshot.emitPacketEntities(m,oldFrame,newFrame,ring,capacity,baselines)
  print name+"|"+str(count)+"|"+str(m.cursize)+"|"+str(m.bit)+"|"+encodeHex(m.data,m.cursize)
  return void
end function
function main(args)
  run("add",[state(2,7)],1,void,snapshot.frame(0,1),[baseline(2)])
  run("remove",[state(3,4)],1,snapshot.frame(0,1),snapshot.frame(1,0),[])
  same=state(4,9);run("unchanged",[same,same],2,snapshot.frame(0,1),snapshot.frame(1,1),[])
  run("changed",[state(5,1),state(5,8)],2,snapshot.frame(0,1),snapshot.frame(1,1),[])
  // Old [1,3,5], new [0,1,2,3,6]: add, unchanged, add, change, remove, add.
  ring=[state(1,1),state(3,3),state(5,5),state(0,6),state(1,1),state(2,2),state(3,7),state(6,6)]
  run("merge",ring,8,snapshot.frame(0,3),snapshot.frame(3,5),[baseline(0),baseline(2),baseline(6)])
  // Same merge mechanics across the circular-buffer boundary.
  ring=[state(3,7),state(6,6),state(1,1),state(3,3),state(5,5),state(0,6),state(1,1),state(2,2)]
  run("wrapped",ring,8,snapshot.frame(2,3),snapshot.frame(5,5),[baseline(0),baseline(2),baseline(6)])
  return 0
end function
