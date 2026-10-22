import mq3.botlib.l_precomp as pre
import mq3.format.pk3 as pk3

struct Context archive reads end struct
function req(ok,label) if not ok then return error(499,"l_precomp retail probe: "+label) end if;return 1 end function
function load(ctx,name) value=pk3.read(ctx.archive,name);if value is error then return void end if;ctx.reads=ctx.reads+1;return value end function
function parse(runtime,name)
  handle=pre.PC_LoadSourceHandle(runtime,name);if handle==0 then return error(499,"cannot load "+name) end if;count=0;names=0;numbers=0
  while true token=pre.PC_ReadTokenHandle(runtime,handle);if token==void then break end if;if token is error then return token end if;count=count+1;if token.type==4 then names=names+1 else if token.type==3 then numbers=numbers+1 end if end while
  pre.PC_FreeSourceHandle(runtime,handle);return [count,names,numbers]
end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;ctx=Context(archive,0);h=pre.host();h.context=ctx;h.loadFn=load;r=pre.create(h);checks=0
  arenas=parse(r,"scripts/arenas.txt");if arenas is error then return arenas end if;checks=checks+req(arenas[0]>300 and arenas[1]>100,"retail arena tokens")
  bots=parse(r,"scripts/bots.txt");if bots is error then return bots end if;checks=checks+req(bots[0]>300 and bots[1]>100,"retail bot registry tokens")
  pre.PC_SetBaseFolder(r,"botfiles");character=parse(r,"bots/sarge_c.c");if character is error then return character end if;checks=checks+req(character[0]>100 and character[2]>20,"retail character tokens")
  weapons=parse(r,"weapons.c");if weapons is error then return weapons end if;checks=checks+req(weapons[0]>200 and weapons[2]>50,"retail weapon-weight tokens")
  checks=checks+req(ctx.reads>=7 and pre.PC_CheckOpenSourceHandles(r)==0,"retail includes and handles closed")
  checks=checks+req(pre.PC_NameHash("CHARACTERISTIC_NAME")==pre.PC_NameHash("CHARACTERISTIC_NAME"),"retail identifier hash")
  print("PASS: "+str(checks)+" retail l_precomp probes arenas="+str(arenas[0])+" bots="+str(bots[0])+" character="+str(character[0])+" weapons="+str(weapons[0])+"\n");return 0
end function
