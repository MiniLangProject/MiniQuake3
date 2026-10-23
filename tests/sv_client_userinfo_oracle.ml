// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.client_lifecycle as lifecycle
function run(label,text,local,dedicated,force)
  client=lifecycle.createClient();client.userinfo=text;client.lan=local;client.local=local;client.addressText="1.2.3.4:27960";lifecycle.userinfoChanged(client,dedicated,force)
  print(label+"|"+client.name+"|"+str(client.rate)+"|"+str(client.snapshotMsec)+"|"+client.userinfo);return void
end function
function main(args)
  run("defaults","\\name\\Ranger",false,0,1)
  run("clamps","\\name\\ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789\\rate\\999999\\snaps\\99\\handicap\\-2",false,2,1)
  run("low","\\name\\Sarge\\rate\\2\\snaps\\0\\handicap\\100",false,0,1)
  run("lan","\\name\\LAN\\rate\\1200\\snaps\\20",true,1,1)
  run("dedicated","\\name\\Net\\rate\\1200\\snaps\\20",true,2,1)
  run("ip-kept","\\name\\Keep\\ip\\9.8.7.6\\rate\\25000\\snaps\\30",false,0,1)
  return 0
end function
