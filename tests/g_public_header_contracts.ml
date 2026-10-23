import mq3.game.g_public as p
function req(ok,label) if not ok then return error(7953,"g_public.h: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(p.GAME_API_VERSION==8,"API version")
  count=count+req(p.SVF_NOCLIENT==1 and p.SVF_CLIENTMASK==2 and p.SVF_BOT==8,"base flags")
  count=count+req(p.SVF_BROADCAST==32 and p.SVF_PORTAL==64 and p.SVF_USE_CURRENT_ORIGIN==128,"snapshot flags")
  count=count+req(p.SVF_SINGLECLIENT==256 and p.SVF_NOSERVERINFO==512 and p.SVF_CAPSULE==1024 and p.SVF_NOTSINGLECLIENT==2048,"extended flags")
  count=count+req(p.GAME_INIT==0 and p.GAME_CONSOLE_COMMAND==9 and p.BOTAI_START_FRAME==10,"export ordinals")
  count=count+req(not p.sendsToClient(p.SVF_NOCLIENT,0,0),"no-client filter")
  count=count+req(p.sendsToClient(p.SVF_SINGLECLIENT,3,3) and not p.sendsToClient(p.SVF_SINGLECLIENT,3,2),"single-client filter")
  count=count+req(not p.sendsToClient(p.SVF_NOTSINGLECLIENT,3,3) and p.sendsToClient(p.SVF_NOTSINGLECLIENT,3,2),"not-single filter")
  count=count+req(p.sendsToClient(p.SVF_CLIENTMASK,5,0) and not p.sendsToClient(p.SVF_CLIENTMASK,5,1) and p.sendsToClient(p.SVF_CLIENTMASK,5,2),"client mask")
  count=count+req(not p.sendsToClient(p.SVF_CLIENTMASK,0,-1) and not p.sendsToClient(p.SVF_CLIENTMASK,0,32),"client mask bounds")
  print("PASS: "+str(count)+" g_public.h ABI contracts")
  return 0
end function
