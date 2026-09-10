// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.demo as demo
import mq3.compat.numeric as numeric
import mq3.qcommon.message as message
import mq3.client.gamestate as gamestate
import mq3.game.entitystate as entitystate
function req(value,label) if not value then return error(499,"demo: "+label) end if;return 1 end function
function main(args)
  count=0;packet=bytes(10,0);for i=0 to 9 packet[i]=i+1 end for
  encoded=demo.encodeMessage(0x12345678,packet,4)
  count=count+req(len(encoded)==14,"record size")
  count=count+req(numeric.readI32(encoded,0)==0x12345678 and numeric.readI32(encoded,4)==6,"little endian header")
  count=count+req(encoded[8]==5 and encoded[13]==10,"transport header omitted")
  decoded=demo.decodeMessage(encoded,0)
  count=count+req(not decoded.completed and not decoded.truncated,"record decoded")
  count=count+req(decoded.sequence==0x12345678 and decoded.payload==bytes([5,6,7,8,9,10]),"record values")
  count=count+req(decoded.nextOffset==len(encoded),"next offset")
  empty=demo.encodeMessage(-7,bytes(4,0),4);decoded=demo.decodeMessage(empty,0)
  count=count+req(decoded.sequence==-7 and len(decoded.payload)==0,"empty payload")
  endRecord=demo.decodeMessage(demo.encodeEnd(),0)
  count=count+req(endRecord.completed and not endRecord.truncated,"end marker")
  count=count+req(demo.decodeMessage(bytes(0,0),0).completed,"clean physical eof")
  count=count+req(demo.decodeMessage(bytes(3,0),0).truncated,"partial sequence")
  count=count+req(demo.decodeMessage(bytes(6,0),0).truncated,"partial length")
  short=bytes(10,0);demo.writeLong(short,0,1);demo.writeLong(short,4,5)
  count=count+req(demo.decodeMessage(short,0).truncated,"partial payload")
  oversized=bytes(8,0);demo.writeLong(oversized,4,demo.MAX_MSGLEN+1)
  count=count+req(try(demo.decodeMessage(oversized,0)) is error,"oversized rejected")
  negative=bytes(8,0);demo.writeLong(negative,4,-2)
  count=count+req(try(demo.decodeMessage(negative,0)) is error,"negative rejected")
  count=count+req(try(demo.encodeMessage(1,packet,11)) is error,"bad header rejected")
  count=count+req(demo.demoFilename(0)=="demo0000" and demo.demoFilename(42)=="demo0042" and demo.demoFilename(9999)=="demo9999","numbered names")
  count=count+req(demo.demoFilename(-1)=="demo9999.tga" and demo.demoFilename(10000)=="demo9999.tga","name range")
  both=demo.encodeMessage(3,bytes([9]),0)+demo.encodeEnd();first=demo.decodeMessage(both,0);last=demo.decodeMessage(both,first.nextOffset)
  count=count+req(first.payload==bytes([9]) and last.completed,"sequential records")
  source=gamestate.create();raw=bytes("sv_hostname\\MiniQuake");source.stringOffsets[1]=1;for i=0 to len(raw)-1 source.stringData[i+1]=raw[i] end for;source.dataCount=len(raw)+2
  baseline=entitystate.create();baseline.number=64;baseline.eType=7;source.baselines[64]=baseline
  initial=demo.decodeMessage(demo.encodeInitialGamestate(22,9,13,source,2,0x13572468),0)
  count=count+req(initial.sequence==21,"initial sequence")
  reader=message.initStorage(initial.payload,len(initial.payload),false);reader.cursize=len(initial.payload);message.beginReading(reader)
  count=count+req(message.readI32(reader)==9 and message.readU8(reader)==demo.SVC_GAMESTATE,"initial envelope")
  parsed=gamestate.create();gamestate.parse(parsed,reader)
  count=count+req(parsed.serverCommandSequence==13 and parsed.clientNum==2 and parsed.checksumFeed==0x13572468,"initial trailer")
  count=count+req(gamestate.configString(parsed,1)=="sv_hostname\\MiniQuake","initial configstring")
  count=count+req(parsed.baselines[64].number==64 and parsed.baselines[64].eType==7,"initial baseline")
  count=count+req(message.readU8(reader)==demo.SVC_EOF,"initial outer eof")
  playback=demo.playback();payload=demo.readDemoMessage(playback,encoded,777)
  count=count+req(payload==bytes([5,6,7,8,9,10]) and playback.serverMessageSequence==0x12345678 and playback.lastPacketTime==777 and playback.offset==len(encoded),"read transition")
  playback=demo.playback();count=count+req(demo.readDemoMessage(playback,demo.encodeEnd(),99)==void and playback.completed and not playback.truncated,"playback completion")
  count=count+req(try(demo.readDemoMessage(void,encoded,0)) is error,"playback state required")
  print "PASS: "+str(count)+" demo framing contracts";return 0
end function
