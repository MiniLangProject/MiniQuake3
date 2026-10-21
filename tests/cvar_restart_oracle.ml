// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar
import mq3.compat.numeric as n

function value(value) if value==void then return "<null>" end if;return value end function
function dump(label,variable)
  if variable==void then print label+"|<missing>|<missing>|<missing>|<missing>|-1|-1|-1|-1|0";return void end if
  modified=0;if variable.modified then modified=1 end if
  print label+"|"+value(variable.name)+"|"+value(variable.string)+"|"+value(variable.resetString)+"|"+value(variable.latchedString)+"|"+str(variable.flags)+"|"+str(modified)+"|"+str(variable.modificationCount)+"|"+str(variable.integer)+"|"+str(n.floatBits(variable.value))
  return void
end function
function order(label,registry)
  names="";for each variable in registry.variables names=names+value(variable.name)+"," end for
  print label+"|"+names+"|flags="+str(registry.modifiedFlags);return void
end function
function dumpOldUser(variable)
  cleared="<not-cleared>";if variable!=void and variable.name==void then cleared="<cleared>" end if
  modified=-1;if variable!=void then modified=0;if variable.modified then modified=1 end if end if
  flags=-1;count=-1;integer=-1
  if variable!=void then flags=variable.flags;count=variable.modificationCount;integer=variable.integer end if
  print "oldUser|"+cleared+"|flags="+str(flags)+"|modified="+str(modified)+"|count="+str(count)+"|integer="+str(integer)
  return void
end function
function main(args)
  registry=cvar.create()
  normal=cvar.get(registry,"normal","base",cvar.ARCHIVE);cvar.set2(registry,"normal","changed",true)
  unchanged=cvar.get(registry,"unchanged","base",0)
  pending=cvar.get(registry,"pending","base",cvar.LATCH);cvar.set2(registry,"pending","next",false)
  changedLatch=cvar.get(registry,"changedLatch","base",cvar.LATCH);cvar.set2(registry,"changedLatch","live",true);cvar.set2(registry,"changedLatch","next",false)
  rom=cvar.get(registry,"rom","base",cvar.ROM);cvar.set2(registry,"rom","live",true)
  init=cvar.get(registry,"init","base",cvar.INIT);cvar.set2(registry,"init","live",true)
  keep=cvar.get(registry,"keep","base",cvar.NORESTART);cvar.set2(registry,"keep","live",true)
  user=cvar.set2(registry,"user","temp",false)
  order("before",registry);cvar.restart(registry);order("after",registry)
  dump("normal",normal);dump("unchanged",unchanged);dump("pending",pending);dump("changedLatch",changedLatch)
  dump("rom",rom);dump("init",init);dump("keep",keep);dumpOldUser(user)
  reborn=cvar.get(registry,"user","reborn",0);dump("reborn",reborn);order("recreated",registry)
  return 0
end function
