import std.fs as fs
import mq3.compat.numeric as n
import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_cache as cache

function req(value,label) if not value then return error(7699,"UI LAN cache: "+label) end if;return 1 end function
function sameBytes(a,b) if len(a)!=len(b) then return false end if;for index=0 to len(a)-1 if a[index]!=b[index] then return false end if end for;return true end function

struct Memory data reads writes name end struct
function memoryRead(context,name) context.reads=context.reads+1;context.name=name;return context.data end function
function memoryWrite(context,name,data) context.writes=context.writes+1;context.name=name;context.data=data;return true end function

function populate()
  state=lan.create();lan.add(state,lan.AS_GLOBAL,"Alpha","1.2.3.4:27960");a=lan.at(state,lan.AS_GLOBAL,0);a.mapName="q3dm1";a.game="baseq3";a.netType=1;a.gameType=0;a.clients=3;a.maxClients=8;a.minPing=5;a.maxPing=250;a.ping=42;a.visible=false;a.punkbuster=1
  lan.add(state,lan.AS_GLOBAL,"Beta","10.20.30.40:27961");lan.add(state,lan.AS_MPLAYER,"Legacy","localhost:27962");lan.add(state,lan.AS_FAVORITES,"Favorite","255.255.255.255:27963");return state
end function

function main(args)
  count=0;state=populate();data=cache.encode(state)
  count=count+req(cache.NETADR_SIZE==20 and cache.SERVER_INFO_SIZE==152,"Baseq3 ABI sizes")
  count=count+req(cache.PAYLOAD_SIZE==661504 and cache.CACHE_SIZE==661520 and len(data)==cache.CACHE_SIZE,"fixed array size")
  count=count+req(n.readI32(data,0)==2 and n.readI32(data,4)==1 and n.readI32(data,8)==1 and n.readI32(data,12)==cache.PAYLOAD_SIZE,"header order")
  count=count+req(n.readI32(data,16)==cache.NA_IP and data[20]==1 and data[21]==2 and data[22]==3 and data[23]==4,"netadr layout")
  count=count+req(data[34]==0x6d and data[35]==0x38,"network byte order port")
  count=count+req(decode(slice(data,36,5))=="Alpha" and decode(slice(data,68,5))=="q3dm1" and decode(slice(data,100,6))=="baseq3","fixed strings")
  count=count+req(n.readI32(data,132)==1 and n.readI32(data,136)==0 and n.readI32(data,140)==3 and n.readI32(data,144)==8,"integer field order")
  count=count+req(n.readI32(data,148)==5 and n.readI32(data,152)==250 and n.readI32(data,156)==42 and n.readI32(data,160)==0 and n.readI32(data,164)==1,"tail field order")
  mplayerOffset=cache.HEADER_SIZE+cache.GLOBAL_BYTES;favoriteOffset=mplayerOffset+cache.OTHER_BYTES
  count=count+req(n.readI32(data,mplayerOffset)==cache.NA_LOOPBACK and data[mplayerOffset+18]==0x6d and data[mplayerOffset+19]==0x3a,"mplayer fixed offset")
  count=count+req(n.readI32(data,favoriteOffset)==cache.NA_BROADCAST and data[favoriteOffset+4]==255,"favorite fixed offset")
  restored=lan.create();count=count+req(cache.decodeInto(restored,data),"decode valid cache")
  count=count+req(lan.count(restored,lan.AS_GLOBAL)==2 and lan.count(restored,lan.AS_MPLAYER)==1 and lan.count(restored,lan.AS_FAVORITES)==1,"restore counts")
  a=lan.at(restored,lan.AS_GLOBAL,0);count=count+req(a.address=="1.2.3.4:27960" and a.hostName=="Alpha" and a.mapName=="q3dm1" and a.game=="baseq3","restore text")
  count=count+req(a.clients==3 and a.maxClients==8 and a.ping==42 and not a.visible and a.punkbuster==1,"restore fields")
  count=count+req(lan.address(restored,lan.AS_MPLAYER,0)=="localhost:27962" and lan.address(restored,lan.AS_FAVORITES,0)=="255.255.255.255:27963","restore address types")
  roundtrip=cache.encode(restored);count=count+req(sameBytes(data,roundtrip),"byte exact round trip")
  bad=bytes(data);n.writeU32(bad,12,123);count=count+req(not cache.decodeInto(restored,bad) and lan.count(restored,lan.AS_GLOBAL)==0,"reject incompatible size and reset")
  bad=bytes(data);n.writeU32(bad,0,lan.MAX_GLOBAL_SERVERS+1);count=count+req(not cache.decodeInto(restored,bad) and lan.count(restored,lan.AS_MPLAYER)==0,"reject unsafe count")
  memory=Memory(void,0,0,"");host=cache.services(memoryRead,memoryWrite,memory);count=count+req(cache.save(state,host) and memory.writes==1 and memory.name==cache.CACHE_NAME,"save service")
  restored=lan.create();count=count+req(cache.load(restored,host) and memory.reads==1 and lan.count(restored,lan.AS_GLOBAL)==2,"load service")
  count=count+req(sameBytes(memory.data,cache.encode(restored)),"service bytes")
  if len(args)==1 then exact=fs.readAllBytes(args[0]);count=count+req(sameBytes(exact,cache.encode(restored)),"original C oracle bytes") end if
  if len(args)==2 then
    exact=fs.readAllBytes(args[0]);count=count+req(sameBytes(exact,cache.encode(restored)),"original C oracle bytes")
    disk=cache.diskServices(args[1]);count=count+req(cache.save(state,disk),"disk save");fromDisk=lan.create();count=count+req(cache.load(fromDisk,disk) and sameBytes(exact,cache.encode(fromDisk)),"disk load")
  end if
  print("PASS: "+str(count)+" UI LAN servercache contracts");return 0
end function
