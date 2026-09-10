// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.pause as pause

function line(name,clPaused,svPaused,clients)
  r=pause.check(clients,clPaused,svPaused)
  paused=0;if r.paused then paused=1 end if
  print name+"|"+str(paused)+"|"+str(r.svPaused)+"|"+str(r.cvarSets)
end function

function c(state,addressType) return pause.client(state,addressType) end function

function main(args)
  line("client-off-keeps-one",0,1,[])
  line("client-off-keeps-zero",0,0,[c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)])
  line("empty",1,0,[])
  line("all-states",1,1,[c(pause.CS_FREE,2),c(pause.CS_ZOMBIE,2),c(pause.CS_CONNECTED,2),c(pause.CS_PRIMED,2),c(pause.CS_ACTIVE,2)])
  line("free-plus-human",1,0,[c(pause.CS_FREE,2),c(pause.CS_ACTIVE,2)])
  line("zombie-plus-human",1,0,[c(pause.CS_ZOMBIE,2),c(pause.CS_ACTIVE,2)])
  line("connected-plus-human",1,1,[c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,2)])
  line("primed-plus-human",1,1,[c(pause.CS_PRIMED,2),c(pause.CS_ACTIVE,2)])
  line("active-plus-human",1,1,[c(pause.CS_ACTIVE,2),c(pause.CS_ACTIVE,2)])
  line("all-bot-states",1,0,[c(pause.CS_FREE,pause.NA_BOT),c(pause.CS_ZOMBIE,pause.NA_BOT),c(pause.CS_CONNECTED,pause.NA_BOT),c(pause.CS_PRIMED,pause.NA_BOT),c(pause.CS_ACTIVE,pause.NA_BOT)])
  line("two-humans-clear",1,1,[c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)])
  line("two-humans-already-clear",1,0,[c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)])
  line("one-human-set",1,0,[c(pause.CS_ACTIVE,2)])
  line("one-human-already-set",1,1,[c(pause.CS_ACTIVE,2)])
  line("two-bots",1,0,[c(pause.CS_CONNECTED,pause.NA_BOT),c(pause.CS_ACTIVE,pause.NA_BOT)])
  line("bot-human-bot",1,0,[c(pause.CS_CONNECTED,pause.NA_BOT),c(pause.CS_PRIMED,4),c(pause.CS_ACTIVE,pause.NA_BOT)])
  line("truthy-client-negative",-1,0,[])
  line("truthy-server-retained",1,7,[])
  line("truthy-server-cleared",1,-3,[c(pause.CS_CONNECTED,2),c(pause.CS_ACTIVE,4)])
  line("listen-lan",1,0,[c(pause.CS_ACTIVE,2)])
  line("listen-internet",1,0,[c(pause.CS_ACTIVE,2)])
  line("dedicated-lan",1,0,[c(pause.CS_ACTIVE,2)])
  line("dedicated-internet",1,0,[c(pause.CS_ACTIVE,2)])
  return 0
end function
