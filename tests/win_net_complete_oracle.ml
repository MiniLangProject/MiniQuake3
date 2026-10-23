// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.win_net_runtime as win
import mq3.platform.udp as udp
import mq3.qcommon.netchan as net
function main(args)
  winState=win.create()
  print("E|"+win.NET_ErrorString(10004)+"|"+win.NET_ErrorString(10035)+"|"+win.NET_ErrorString(10053)+"|"+win.NET_ErrorString(10054)+"|"+win.NET_ErrorString(10048)+"|"+win.NET_ErrorString(11001)+"|"+win.NET_ErrorString(12345))
  source=net.Address(win.NA_IP,[1,2,3,4],27960);round=win.SockadrToNetadr(win.NetadrToSockadr(source));print("A|"+str(round.type)+"|"+str(round.ip[0])+"."+str(round.ip[1])+"."+str(round.ip[2])+"."+str(round.ip[3])+"|"+str(round.port))
  broad=win.NetadrToSockadr(net.Address(win.NA_BROADCAST,[0,0,0,0],27961));print("B|"+str(broad.family)+"|ffffffff|"+str(broad.port))
  winState.localIPs=[udp.ipv4(10,9,8,7),udp.ipv4(172,20,1,2),udp.ipv4(192,168,7,9)]
  loopAdr=net.Address(win.NA_LOOPBACK,[],0);ipx=net.Address(win.NA_IPX,array(10,0),0);bad=net.Address(win.NA_BAD,[],0)
  line="L|"+bit(win.Sys_IsLANAddress(winState,loopAdr))+bit(win.Sys_IsLANAddress(winState,ipx))+bit(win.Sys_IsLANAddress(winState,bad))
  values=[[127,0,0,1],[10,22,1,1],[172,30,4,5],[192,168,99,1],[8,8,8,8]];for each value in values line=line+bit(win.Sys_IsLANAddress(winState,net.Address(win.NA_IP,value,1))) end for;print(line);return 0
end function
function bit(value) if value then return "1" end if;return "0" end function
