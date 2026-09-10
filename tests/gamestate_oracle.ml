import mq3.client.gamestate as gamestate
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate
struct Context hooks restart end struct
function systemInfo(state) state.context.hooks=state.context.hooks+"S";return void end function
function restart(state,feed) state.context.restart=feed;state.context.hooks=state.context.hooks+"F";return void end function
function downloads(state) state.context.hooks=state.context.hooks+"D";return void end function
function pause(state,value) state.context.hooks=state.context.hooks+"P";return void end function
function close(state) state.context.hooks=state.context.hooks+"C";return void end function
function main(args)
 state=gamestate.create();state.connectPacketCount=9;state.context=Context("",0);state.closeFn=close;state.systemInfoFn=systemInfo;state.restartFn=restart;state.downloadsFn=downloads;state.pauseFn=pause
 large="";for i=0 to 1098 large=large+"a" end for;large=large+"z"
 zero=entitystate.create();e=entitystate.copy(zero);e.number=7;e.eType=9;e.pos.trTime=123;m=message.init(24000);message.writeLong(m,77);message.writeByte(m,gamestate.SVC_CONFIGSTRING);message.writeShort(m,1);message.writeBigString(m,"\\sv_serverid\\42%done");message.writeByte(m,gamestate.SVC_CONFIGSTRING);message.writeShort(m,5);message.writeBigString(m,large);message.writeByte(m,gamestate.SVC_BASELINE);delta.writeDeltaEntity(m,zero,e,true);message.writeByte(m,gamestate.SVC_EOF);message.writeLong(m,3);message.writeLong(m,0x12345678);message.beginReading(m);gamestate.parse(state,m)
 b=state.baselines[7];longText=gamestate.configString(state,5);raw=bytes(longText);first=decode(bytes([raw[0]]));last=decode(bytes([raw[1099]]));print "state|seq="+str(state.serverCommandSequence)+"|client="+str(state.clientNum)+"|feed="+str(state.checksumFeed)+"|count="+str(state.dataCount)+"|off="+str(state.stringOffsets[1])+","+str(state.stringOffsets[5])+"|c1="+gamestate.configString(state,1)+"|long="+str(len(longText))+","+first+","+last+"|base="+str(b.number)+","+str(b.eType)+","+str(b.pos.trTime)+"|connect="+str(state.connectPacketCount)+"|paused="+str(state.paused)+"|hooks="+state.context.hooks+"|restart="+str(state.context.restart);return 0
end function
