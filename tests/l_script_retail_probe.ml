import mq3.botlib.l_script as lex
import mq3.format.pk3 as pk3

struct Context archive reads end struct
function req(ok,label) if not ok then return error(499,"l_script retail: "+label) end if;return 1 end function
function load(ctx,name) data=try(pk3.read(ctx.archive,name));if data is error then return void end if;ctx.reads=ctx.reads+1;return data end function
function scan(runtime,name)
  script=lex.LoadScriptFile(runtime,name);if script==void then return error(499,"cannot load "+name) end if;token=lex.emptyToken();total=0;names=0;numbers=0;strings=0
  while lex.PS_ReadToken(script,token) total=total+1;if token.type==lex.TT_NAME then names=names+1 else if token.type==lex.TT_NUMBER then numbers=numbers+1 else if token.type==lex.TT_STRING then strings=strings+1 end if end while
  lex.FreeScript(script);return [total,names,numbers,strings]
end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;ctx=Context(archive,0);h=lex.host();h.context=ctx;h.loadFn=load;r=lex.create(h);count=0
  arenas=scan(r,"scripts/arenas.txt");count=count+req(not (arenas is error) and arenas[0]>300 and arenas[1]>100 and arenas[3]>50,"arenas")
  bots=scan(r,"scripts/bots.txt");count=count+req(not (bots is error) and bots[0]>400 and bots[1]>250 and bots[2]>10,"bots")
  lex.PS_SetBaseFolder(r,"botfiles");character=scan(r,"bots/sarge_c.c");count=count+req(not (character is error) and character[0]>100 and character[2]>20,"character")
  weapons=scan(r,"weapons.c");count=count+req(not (weapons is error) and weapons[0]>200 and weapons[2]>50,"weapons")
  count=count+req(ctx.reads==4,"archive reads")
  print("PASS: "+str(count)+" retail l_script probes arenas="+str(arenas[0])+" bots="+str(bots[0])+" character="+str(character[0])+" weapons="+str(weapons[0])+"\n");return 0
end function
