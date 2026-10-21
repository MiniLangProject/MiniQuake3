import mq3.client.ui_servers2 as u

function req(value,message)
  if not value then return error(7922,message) end if
  return 1
end function

function server(address,host,mapName,clients,maxClients,ping,gameType,minPing,maxPing,pb)
  return u.node(address,host,mapName,clients,maxClients,ping,gameType,u.gameName(gameType),1,minPing,maxPing,pb)
end function

function main(args)
  count=0
  state=u.browserState();state.source=u.AS_GLOBAL;state.maxServers=128;state.numQueried=4
  state.servers=[
    server("1.1.1.1:27960","ALPHA","Q3DM1",0,8,50,u.GT_FFA,0,0,false),
    server("2.2.2.2:27960","BRAVO","Q3DM6",8,8,220,u.GT_TEAM,0,0,true),
    server("3.3.3.3:27960","CHARLIE","Q3TOURNEY2",1,2,420,u.GT_TOURNAMENT,0,300,false),
    server("4.4.4.4:27960","DELTA","Q3CTF1",3,12,90,u.GT_CTF,100,0,true)
  ]
  count=count+req(u.arenaServersUpdateMenu(state)==4,"all servers visible")
  count=count+req(state.mapPicture=="levelshots/Q3DM1.tga" and len(state.rows)==4,"selection picture and rows")
  state.showEmpty=false;state.showFull=false;state.gameFilter=u.GAMES_ALL
  count=count+req(u.arenaServersUpdateMenu(state)==2,"empty full filters")
  state.gameFilter=u.GAMES_CTF
  count=count+req(u.arenaServersUpdateMenu(state)==1 and state.rows[0]!="","game filter")
  count=count+req(u.pingColor(state.servers[3])=="^4" and u.pingColor(state.servers[1])=="^3","ping colors")

  state.showEmpty=true;state.showFull=true;state.gameFilter=u.GAMES_ALL;u.arenaServersUpdateMenu(state)
  count=count+req(u.arenaServersSort(state,u.SORT_CLIENTS) and state.servers[0].hostname=="DELTA","open-slot sort")
  state.selected=0;count=count+req(u.arenaServersGo(state,true),"connect selected")
  count=count+req(state.actions[len(state.actions)-1].text=="connect 4.4.4.4:27960\n" and not state.actions[len(state.actions)-1].dispatched,"typed connect")

  favorites=u.browserState();favorites.source=u.AS_FAVORITES;favorites.maxServers=16
  u.arenaServersLoadFavorites(favorites,["5.5.5.5:27960","hostname.invalid","6.6.6.6:27960"],800)
  count=count+req(len(favorites.favoriteAddresses)==2 and len(favorites.favoriteServers)==0,"favorite validation/reset")
  favorites.servers=[];u.arenaServersInsertFavorites(favorites,800)
  count=count+req(len(favorites.servers)==2 and favorites.servers[0].hostname=="NO RESPONSE","favorite no response")
  favorites.numQueried=2;u.arenaServersUpdateMenu(favorites);favorites.selected=0
  count=count+req(u.arenaServersRemove(favorites) and len(favorites.favoriteAddresses)==1,"favorite removal")
  count=count+req(u.arenaServersSaveChanges(favorites,true)==16,"favorite persistence")

  insert=u.browserState();insert.source=u.AS_GLOBAL;insert.maxServers=128
  infoText="\\hostname\\^1server\\mapname\\q3dm17\\clients\\4\\sv_maxclients\\8\\gametype\\3\\nettype\\1\\minPing\\0\\maxPing\\0\\punkbuster\\1"
  count=count+req(u.arenaServersInsert(insert,"7.7.7.7:27960",infoText,99,100),"server insertion")
  count=count+req(insert.servers[0].hostname=="SERVER" and insert.servers[0].mapName=="Q3DM17" and insert.servers[0].punkbuster,"server info decode")
  count=count+req(not u.arenaServersInsert(insert,"8.8.8.8:27960",infoText,100,100),"max ping rejection")

  local=u.browserState();local.source=u.AS_LOCAL;local.maxServers=128
  u.arenaServersStartRefresh(local,1000,68,"",true)
  count=count+req(local.refreshing and local.actions[len(local.actions)-1].text=="localservers\n","local refresh")
  remote=u.browserState();remote.source=u.AS_GLOBAL;remote.maxServers=128;remote.gameFilter=u.GAMES_TEAMPLAY;remote.showEmpty=true;remote.showFull=false
  u.arenaServersStartRefresh(remote,2000,68,"debug",true)
  count=count+req(remote.actions[len(remote.actions)-1].text=="globalservers 0 debug team empty\n","global refresh args")

  addresses=["9.9.9.9:27960"]
  u.arenaServersDoRefresh(remote,2001,1,0,[],addresses,800,true)
  count=count+req(remote.currentPing==1 and remote.pingRequests[0].address==addresses[0],"ping dispatch")
  result=u.PingResult(0,addresses[0],42,infoText)
  u.arenaServersDoRefresh(remote,2012,1,1,[result],addresses,800,true)
  count=count+req(len(remote.servers)==1 and remote.servers[0].pingTime==42,"ping result")
  count=count+req(not remote.refreshing,"automatic refresh completion")

  menu=u.uiArenaServersMenu(u.AS_LOCAL,u.GAMES_ALL,u.SORT_HOST,1,1,0,[],800,3000,68,"",true)
  count=count+req(len(menu.assets)==15 and len(menu.items)==21,"menu assets/items")
  count=count+req(menu.items[7].y==192 and menu.items[18].x==640,"menu layout")
  count=count+req(len(menu.choices)==4 and menu.choices[0].values==["Local","Internet","Favorites"],"visible choices")
  count=count+req(menu.items[6].fallback=="menu/art/unknownmap" and menu.items[20].fallback=="menu/art/unknownmap","original image fallbacks")
  previous=len(menu.actions);u.arenaServersEvent(menu,u.ID_SPECIFY,u.QM_ACTIVATED,0,3000,68,"",800,true)
  count=count+req(len(menu.actions)==previous+1 and menu.actions[previous].name=="specify-server","specify route")
  previous=len(menu.actions);u.arenaServersEvent(menu,u.ID_CREATE,u.QM_ACTIVATED,0,3000,68,"",800,true)
  count=count+req(menu.actions[previous].name=="start-server","create route")
  u.arenaServersEvent(menu,u.ID_MASTER,u.QM_ACTIVATED,1,3000,68,"",800,true)
  count=count+req(menu.masterSelection==1 and menu.source==u.AS_GLOBAL,"internet source mapping")
  u.punkbusterConfirmEnable(menu,true,1,true);count=count+req(menu.punkbuster,"punkbuster enable")
  u.punkbusterConfirmDisable(menu,true,0,true);count=count+req(not menu.punkbuster,"punkbuster disable")
  count=count+req(u.arenaServersMenuKey(remote,u.K_SPACE,false,800,true)=="default","inactive space key")
  count=count+req(u.arenaServersMenuKey(local,u.K_SPACE,false,800,true)=="menu_move" and not local.refreshing,"space stops refresh")
  print("PASS: "+str(count)+" native ui_servers2 contracts")
  return 0
end function
