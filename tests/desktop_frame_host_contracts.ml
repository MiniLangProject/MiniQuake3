// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.udp as udp
import mq3.platform.desktop_frame_host as host

struct Capture events opens closes nextSocket pumpCount failSecondOpen end struct
function req(value,label) if not value then return error(499,"desktop frame host: "+label) end if;return 1 end function
function event(s,text) s.context.events=s.context.events+[text];return void end function
function startup(s) return event(s,"startup") end function
function openSocket(s) s.context.opens=s.context.opens+1;event(s,"open:"+str(s.context.opens));if s.context.failSecondOpen and s.context.opens==2 then return error(499,"open failure") end if;s.context.nextSocket=s.context.nextSocket+1;return s.context.nextSocket end function
function bindSocket(s,socket,endpoint) event(s,"bind:"+str(socket)+":"+str(endpoint.port));return udp.Endpoint(endpoint.address,endpoint.port+socket) end function
function closeSocket(s,socket) s.context.closes=s.context.closes+1;return event(s,"close:"+str(socket)) end function
function cleanup(s) return event(s,"cleanup") end function
function makePump(s,client,server,capacity) event(s,"pump:"+str(client)+":"+str(server)+":"+str(capacity));return [client,server] end function
function setTime(s,time) return event(s,"time:"+str(time)) end function
function drain(s,pump,budget) event(s,"drain:"+str(budget));return s.context.pumpCount end function
function serverFrame(s,time,msec) return event(s,"server:"+str(time)+":"+str(msec)) end function
function clientFrame(s,time,msec) return event(s,"client:"+str(time)+":"+str(msec)) end function
function services(c) return host.Services(startup,openSocket,bindSocket,closeSocket,cleanup,makePump,setTime,drain,serverFrame,clientFrame,c) end function
function same(a,b) if len(a)!=len(b) then return false end if;if len(a)>0 then for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for end if;return true end function

function main(args)
  n=0;loopback=udp.ipv4(127,0,0,1);cfg=host.config(udp.Endpoint(loopback,0),udp.Endpoint(loopback,27960),1400,3,200)
  c=Capture([],0,0,100,2,false);r=host.start(cfg,services(c),1000)
  n=n+req(r.active and r.clientSocket==101 and r.serverSocket==102,"owns two sockets")
  n=n+req(r.clientEndpoint.port==101 and r.serverEndpoint.port==28062,"records bound endpoints")
  n=n+req(same(c.events,["startup","open:1","open:2","bind:101:0","bind:102:27960","pump:101:102:1400"]),"startup order")
  c.events=[];f=host.frame(r,1016)
  n=n+req(f.number==1 and f.time==1016 and f.msec==16 and f.packets==2,"frame result")
  n=n+req(same(c.events,["time:1016","drain:3","server:1016:16","client:1016:16"]),"event then server then client")
  c.events=[];f=host.frame(r,1516)
  n=n+req(f.msec==200 and r.time==1516,"stall cap advances wall clock")
  n=n+req(r.frameNumber==2 and r.packetCount==4,"frame accounting")
  n=n+req(try(host.frame(r,1515)) is error and r.frameNumber==2,"backward time rejected")
  n=n+req(try(host.frame(r,1.5)) is error,"integer time required")
  c.events=[];host.shutdown(r)
  n=n+req(same(c.events,["close:101","close:102","cleanup"]),"ordered cleanup")
  n=n+req(not r.active and not r.udpStarted and r.clientSocket==void and r.serverSocket==void,"ownership cleared")
  c.events=[];host.shutdown(r);n=n+req(len(c.events)==0,"shutdown idempotent")
  n=n+req(try(host.frame(r,1600)) is error,"closed frame rejected")
  bad=Capture([],0,0,200,0,true);caught=try(host.start(cfg,services(bad),0))
  n=n+req(caught is error,"startup failure propagated")
  n=n+req(same(bad.events,["startup","open:1","open:2","close:201","cleanup"]),"partial startup rollback")
  n=n+req(bad.closes==1,"only acquired socket closed")
  n=n+req(try(host.start(host.config(udp.Endpoint(loopback,0),udp.Endpoint(loopback,0),0,1,10),services(c),0)) is error,"capacity validation")
  n=n+req(try(host.start(host.config(udp.Endpoint(loopback,0),udp.Endpoint(loopback,0),100,-1,10),services(c),0)) is error,"budget validation")
  c=Capture([],0,0,300,4,false);r=host.start(host.config(udp.Endpoint(loopback,0),udp.Endpoint(loopback,0),100,3,10),services(c),0)
  n=n+req(try(host.frame(r,1)) is error and r.frameNumber==0,"pump count guarded");host.shutdown(r)
  print "PASS: "+str(n)+" desktop frame host contracts";return 0
end function
