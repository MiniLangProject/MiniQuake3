import mq3.format.pk3 as pk3
import mq3.client.client_main as cl
import std.string as strings

function require(value,label) if not value then return error(499,"client_main retail probe: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;checks=0
  defaultCfg=pk3.read(archive,"default.cfg");if defaultCfg is error then return defaultCfg end if;checks=checks+require(len(defaultCfg)>1000,"retail default config")
  cgame=pk3.read(archive,"vm/cgame.qvm");if cgame is error then return cgame end if;checks=checks+require(len(cgame)>10000,"retail cgame qvm")
  ui=pk3.read(archive,"vm/ui.qvm");if ui is error then return ui end if;checks=checks+require(len(ui)>10000,"retail ui qvm")
  qagame=pk3.read(archive,"vm/qagame.qvm");if qagame is error then return qagame end if;checks=checks+require(len(qagame)>10000,"retail game qvm")
  arenas=pk3.read(archive,"scripts/arenas.txt");if arenas is error then return arenas end if;checks=checks+require(len(arenas)>1000,"retail arena catalog")
  s=cl.create();s.openedPaks="pak0";s.referencedPaks="pak0";checks=checks+require(cl.CL_OpenedPK3List_f(s,void)=="pak0" and cl.CL_ReferencedPK3List_f(s,void)=="pak0","retail PK3 reporting")
  maps=0;for each entry in archive.entries if strings.indexOf(entry.name,"maps/",0)==0 and strings.indexOf(entry.name,".bsp",0)>0 then maps=maps+1 end if end for;checks=checks+require(maps>=25,"retail BSP catalog")
  print("PASS: "+str(checks)+" retail client_main probes entries="+str(len(archive.entries))+" maps="+str(maps)+" cgame="+str(len(cgame))+"\n");return 0
end function
