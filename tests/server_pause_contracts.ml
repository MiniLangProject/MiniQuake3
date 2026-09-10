// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.pause as pause
function req(value,label) if not value then return error(499,"server pause: "+label) end if;return 1 end function
function c(state,addressType) return pause.client(state,addressType) end function
function main(args)
  n=0;r=pause.check([],0,1);n=n+req(not r.paused and r.svPaused==1 and r.cvarSets==0,"cl_paused off preserves set server cvar")
  r=pause.check([c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)],0,0);n=n+req(not r.paused and r.svPaused==0 and r.cvarSets==0,"cl_paused off bypasses counting")
  r=pause.check([],1,0);n=n+req(r.paused and r.svPaused==1 and r.cvarSets==1,"empty server pauses")
  r=pause.check([c(pause.CS_FREE,2),c(pause.CS_ACTIVE,2)],1,0);n=n+req(r.paused,"free ignored beside human")
  r=pause.check([c(pause.CS_ZOMBIE,2),c(pause.CS_ACTIVE,2)],1,0);n=n+req(r.paused,"zombie ignored beside human")
  r=pause.check([c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,2)],1,1);n=n+req(not r.paused,"connected human counted")
  r=pause.check([c(pause.CS_PRIMED,2),c(pause.CS_ACTIVE,2)],1,1);n=n+req(not r.paused,"primed human counted")
  r=pause.check([c(pause.CS_ACTIVE,2),c(pause.CS_ACTIVE,2)],1,1);n=n+req(not r.paused,"active human counted")
  r=pause.check([c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)],1,1);n=n+req(not r.paused and r.svPaused==0 and r.cvarSets==1,"two humans unpause")
  r=pause.check([c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)],1,0);n=n+req(not r.paused and r.svPaused==0 and r.cvarSets==0,"already unpaused no set")
  r=pause.check([c(pause.CS_CONNECTED,pause.NA_BOT),c(pause.CS_ACTIVE,pause.NA_BOT)],1,0);n=n+req(r.paused and r.svPaused==1,"bots excluded")
  r=pause.check([c(pause.CS_CONNECTED,pause.NA_BOT),c(pause.CS_PRIMED,4),c(pause.CS_ACTIVE,pause.NA_BOT)],1,0);n=n+req(r.paused,"one human among bots")
  r=pause.check([c(pause.CS_CONNECTED,pause.NA_BOT),c(pause.CS_PRIMED,4),c(pause.CS_ACTIVE,2)],1,1);n=n+req(not r.paused,"two humans among bot")
  r=pause.check([],1,1);n=n+req(r.paused and r.svPaused==1 and r.cvarSets==0,"already paused no set")
  r=pause.check([],1,7);n=n+req(r.paused and r.svPaused==7 and r.cvarSets==0,"noncanonical true server cvar retained")
  r=pause.check([c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)],1,-3);n=n+req(not r.paused and r.svPaused==0 and r.cvarSets==1,"negative server cvar cleared")
  r=pause.check([],-1,0);n=n+req(r.paused and r.svPaused==1,"negative client cvar is true")
  n=n+req(pause.NA_BOT==0 and pause.CS_FREE==0 and pause.CS_ZOMBIE==1,"enum prefix values")
  n=n+req(pause.CS_CONNECTED==2 and pause.CS_PRIMED==3 and pause.CS_ACTIVE==4,"connected enum values")
  n=n+req(try(pause.check(void,1,0)) is error,"missing array")
  n=n+req(try(pause.check([void],1,0)) is error,"missing client")
  // No LAN or dedicated input exists in SV_CheckPaused; both modes therefore share this result.
  a=pause.check([c(pause.CS_ACTIVE,2)],1,0);b=pause.check([c(pause.CS_ACTIVE,2)],1,0);n=n+req(a.paused==b.paused and a.svPaused==b.svPaused,"listen and dedicated invariant")
  print "PASS: "+str(n)+" server pause contracts";return 0
end function
