import mq3.client.gamestate as gamestate
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate
function req(ok,text) if not ok then return error(6910,text) end if;return 1 end function
function parseBasic(index,text)
 m=message.init(20000);message.writeLong(m,4);message.writeByte(m,gamestate.SVC_CONFIGSTRING);message.writeShort(m,index);message.writeBigString(m,text);message.writeByte(m,gamestate.SVC_EOF);message.writeLong(m,2);message.writeLong(m,3);message.beginReading(m);state=gamestate.create();gamestate.parse(state,m);return state
end function
function main(args)
 count=0;state=parseBasic(4,"alpha%beta")
 count=count+req(state.serverCommandSequence==4 and state.clientNum==2 and state.checksumFeed==3,"header and trailer")
 count=count+req(gamestate.configString(state,4)=="alpha.beta" and state.stringOffsets[4]==1,"configstring storage")
 count=count+req(state.dataCount==12 and state.stringData[state.dataCount-1]==0,"nul and data count")
 count=count+req(state.connectPacketCount==0 and state.paused==0,"completion state")
 count=count+req(gamestate.configString(state,9)=="","missing configstring")
 large="";for i=0 to 1099 large=large+"x" end for;state=parseBasic(5,large);count=count+req(len(gamestate.configString(state,5))==1100,"big configstring")
  zero=entitystate.create();e=entitystate.copy(zero);e.number=7;e.eType=9;m=message.init(2048);message.writeLong(m,1);message.writeByte(m,gamestate.SVC_BASELINE);delta.writeDeltaEntity(m,zero,e,true);message.writeByte(m,gamestate.SVC_EOF);message.writeLong(m,0);message.writeLong(m,0);message.beginReading(m);state=gamestate.create();gamestate.parse(state,m);count=count+req(state.baselines[7].number==7 and state.baselines[7].eType==9,"baseline delta")
 bad=message.init(64);message.writeLong(bad,0);message.writeByte(bad,gamestate.SVC_CONFIGSTRING);message.writeShort(bad,1024);message.beginReading(bad);count=count+req(try(gamestate.parse(gamestate.create(),bad)) is error,"config index bound")
 bad=message.init(64);message.writeLong(bad,0);message.writeByte(bad,99);message.beginReading(bad);count=count+req(try(gamestate.parse(gamestate.create(),bad)) is error,"bad command")
 bad=message.init(64);message.writeLong(bad,0);message.writeByte(bad,gamestate.SVC_EOF);message.beginReading(bad);count=count+req(try(gamestate.parse(gamestate.create(),bad)) is error,"truncated trailer")
  huge="";for i=0 to 7999 huge=huge+"q" end for;m=message.init(30000);message.writeLong(m,0);message.writeByte(m,gamestate.SVC_CONFIGSTRING);message.writeShort(m,1);message.writeBigString(m,huge);message.writeByte(m,gamestate.SVC_CONFIGSTRING);message.writeShort(m,2);message.writeBigString(m,huge);message.writeByte(m,gamestate.SVC_EOF);message.writeLong(m,0);message.writeLong(m,0);message.beginReading(m);count=count+req(try(gamestate.parse(gamestate.create(),m)) is error,"string storage bound")
 state=gamestate.create();state.stringOffsets[3]=12;state.stringData[12]=65;state.baselines[3]=e;m=message.init(64);message.writeLong(m,8);message.writeByte(m,gamestate.SVC_EOF);message.writeLong(m,1);message.writeLong(m,2);message.beginReading(m);gamestate.parse(state,m);count=count+req(gamestate.configString(state,3)=="" and state.baselines[3]==void,"clear prior gamestate")
 print "PASS: "+str(count)+" gamestate contracts";return 0
end function
