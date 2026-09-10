// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.netchan as clientNet
import mq3.qcommon.netchan as net
import mq3.qcommon.message as msg
struct Context packets end struct
function send(runtime,sock,data,address) runtime.context.packets=runtime.context.packets+[data];return void end function
function req(v,s) if not v then return error(6930,"client netchan: "+s) end if;return 1 end function
function setup() t=net.init(4321);t.context=Context([]);t.sendPacketFn=send;c=clientNet.createConnection();c.challenge=123456;r=clientNet.Runtime(t,c,0);return [r,c] end function
function base(c) m=msg.init(4096);msg.writeLong(m,11);msg.writeLong(m,22);msg.writeLong(m,1);for i=0 to 19 msg.writeByte(m,33+i) end for;c.serverCommands[1]="abc";return m end function
function copy(data) result=bytes(len(data),0);if len(data)>0 then for i=0 to len(data)-1 result[i]=data[i] end for end if;return result end function
function equal(a,b) if len(a)!=len(b) then return false end if;if len(a)>0 then for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for end if;return true end function
function main(args)
 n=0;x=setup();r=x[0];c=x[1];m=base(c);before=copy(slice(m.data,0,m.cursize));rc=m.readcount;b=m.bit;o=m.oob;clientNet.encode(c,m);n=n+req(m.readcount==rc and m.bit==b and m.oob==o,"encode restores cursor");n=n+req(equal(slice(m.data,0,12),slice(before,0,12)),"encode preserves prefix");n=n+req(not equal(slice(m.data,12,m.cursize-12),slice(before,12,m.cursize-12)),"encode changes suffix");clientNet.encode(c,m);n=n+req(equal(slice(m.data,0,m.cursize),before),"xor is reversible")
 short=msg.init(32);msg.writeLong(short,1);clientNet.encode(c,short);n=n+req(short.cursize<=clientNet.CL_ENCODE_START,"short encode no-op")
 address=net.Address(2,[127,0,0,1],27960);ch=net.setup(net.NS_CLIENT,address,0);m=base(c);old=m.cursize;p=clientNet.transmit(r,ch,m);n=n+req(m.cursize>old,"EOF appended");n=n+req(len(p)==m.cursize+6,"client header emitted");n=n+req(ch.outgoingSequence==2,"transmit advances sequence");n=n+req(len(r.transport.context.packets)==1,"transport service called")
 big=msg.init(4096);msg.writeLong(big,1);msg.writeLong(big,2);msg.writeLong(big,0);for i=0 to 1500 msg.writeByte(big,i&255) end for;ch=net.setup(net.NS_CLIENT,address,0);clientNet.transmit(r,ch,big);n=n+req(ch.unsentFragments,"large message fragments");start=ch.unsentFragmentStart;n=n+req(start==net.FRAGMENT_SIZE,"first fragment size")
 clientNet.transmitNextFragment(r,ch);n=n+req(ch.unsentFragmentStart>start,"next fragment forwarded");n=n+req(not ch.unsentFragments and ch.outgoingSequence==2,"fragment completion state")
 rr=setup()[0];receiver=net.setup(net.NS_CLIENT,address,0);bad=msg.initStorage(bytes([1,0,0]),3,false);bad.cursize=3;n=n+req(not clientNet.process(rr,receiver,bad),"short packet rejected");n=n+req(rr.newsize==0,"rejection not counted")
 n=n+req(len(c.reliableCommands)==clientNet.MAX_RELIABLE_COMMANDS and len(c.serverCommands)==clientNet.MAX_RELIABLE_COMMANDS,"command rings sized");n=n+req(clientNet.CLC_EOF==5,"protocol EOF value");n=n+req(try(clientNet.transmit(clientNet.Runtime(net.init(1),c,0),net.setup(net.NS_CLIENT,address,0),base(c))) is error,"missing send service rejected")
 print "PASS: "+str(n)+" client netchan contracts";return 0
end function
