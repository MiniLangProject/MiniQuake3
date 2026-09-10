import mq3.client.snapshot_command as command
import mq3.client.snapshot_parse as parse
import mq3.server.snapshot_delta as server
import mq3.qcommon.message as message
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
function ent(number,value) e=entitystate.create();e.number=number;e.eType=value;return e end function
function ps(time,health) p=playerstate.create();p.commandTime=time;p.stats[0]=health;return p end function
function payload(oldFrame,newFrame,ring,baselines,time,last,flags) msg=message.init(4096);server.writeSnapshotPayload(msg,oldFrame,newFrame,ring,len(ring),baselines,time,last,flags);message.beginReading(msg);message.readU8(msg);return msg end function
function dump(tag,state)
 s=state.snap;valid=0;if s.valid then valid=1 end if;text=tag+"|snap="+str(valid)+","+str(s.messageNum)+","+str(s.deltaNum)+","+str(s.snapFlags)+","+str(s.ping)+","+str(s.serverCommandNum)+"|ps="+str(s.playerState.commandTime)+","+str(s.playerState.stats[0])+"|area="
 if len(s.areaMask)>0 then for i=0 to len(s.areaMask)-1 if s.areaMask[i]!=0 then text=text+str(i)+":"+str(s.areaMask[i])+"," end if end for end if
 text=text+"|ring="+str(state.entityState.parseEntitiesNum)+"|ents="
 if s.numEntities>0 then for i=0 to s.numEntities-1 e=parse.parsedEntity(state.entityState,s.parseEntitiesNum+i);text=text+str(e.number)+":"+str(e.eType)+"," end for end if
 text=text+"|slots=";for i=0 to command.PACKET_BACKUP-1 if state.snapshots[i].valid then text=text+str(i)+":"+str(state.snapshots[i].messageNum)+"," end if end for
 fresh=0;demo=0;if state.newSnapshots then fresh=1 end if;if state.demoWaiting then demo=1 end if;print text+"|new="+str(fresh)+"|demo="+str(demo);return void
end function
function main(args)
 base=[ent(1,0),ent(2,0),ent(3,0),ent(4,0)];state=command.create();for each e in base state.entityState.entityBaselines[e.number]=e end for
 p0=ps(0,0);p1=ps(1000,75);ring=[ent(1,4),ent(2,7)];f1=server.packetFrame(0,2,bytes([5,9]),p1)
 state.serverMessageSequence=7;state.serverCommandSequence=3;state.outgoingSequence=4;state.realtime=1400;state.outPackets[3].serverTime=900;state.outPackets[3].realtime=1200;command.parseSnapshot(state,payload(void,f1,ring,base,1234,0,2));dump("full",state)
 p2=ps(1100,60);ring=ring+[ent(1,8),ent(3,6)];f2=server.packetFrame(2,2,bytes([1]),p2);state.serverMessageSequence=9;state.serverCommandSequence=4;state.outgoingSequence=5;state.realtime=1400;state.outPackets[4].serverTime=1050;state.outPackets[4].realtime=1300;command.parseSnapshot(state,payload(f1,f2,ring,base,1300,2,1));dump("delta",state)
 state.newSnapshots=false;state.serverMessageSequence=12;state.snapshots[10].valid=false;badOld=server.packetFrame(0,0,bytes(0,0),p0);badNew=server.packetFrame(0,1,bytes(0,0),p0);badRing=[ent(4,9)];command.parseSnapshot(state,payload(badOld,badNew,badRing,base,1500,2,0));dump("invalid",state)
 state.newSnapshots=false;state.serverMessageSequence=20;state.snapshots[18]=command.emptySnapshot();state.snapshots[18].valid=true;state.snapshots[18].messageNum=18;state.snapshots[18].parseEntitiesNum=0;state.entityState.parseEntitiesNum=parse.MAX_PARSE_ENTITIES-127;old=server.packetFrame(0,0,bytes(0,0),state.snapshots[18].playerState);command.parseSnapshot(state,payload(old,server.packetFrame(0,0,bytes(0,0),state.snapshots[18].playerState),[],base,1600,2,0));dump("aged",state);return 0
end function
