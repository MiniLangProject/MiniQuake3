import mq3.client.ui_start_server as u

function req(value, message)
  if not value then return error(7878, message) end if
  return 1
end function

function arena(mapName, typeName, bots)
  return u.Arena(mapName, typeName, bots)
end function

function bot(name, model)
  return u.Bot(name, model)
end function

function main(args)
  count = 0
  arenas = [
    arena("q3dm1", "ffa single", "sarge visor"),
    arena("q3dm6", "ffa team", "grunt"),
    arena("q3dm7", "ffa", "sarge"),
    arena("q3dm8", "ffa", "visor"),
    arena("q3dm9", "ffa", "anarki"),
    arena("q3dm10", "ffa", "major"),
    arena("q3ctf1", "ctf team", "major")
  ]

  state = u.startState()
  u.startServerGametypeEvent(state, arenas, 0, true)
  count = count + req(len(state.maps) == 6 and state.maps[0] == "Q3DM1", "arena filter")
  count = count + req(state.maxPages == 2, "map page count")
  u.startServerMapEvent(state, 1, true)
  count = count + req(state.displayName == "Q3DM6", "map select")
  u.startServerMenuEvent(state, 16, true, true)
  count = count + req(state.page == 1 and state.currentMap == 1, "page preserves map")
  u.startServerMapEvent(state, 0, true)
  count = count + req(state.currentMap == 4 and state.displayName == "Q3DM9", "paged map select")
  u.startServerMenuEvent(state, 18, true, true)
  count = count + req(not state.actions[0].dispatched, "suppression")
  u.startServerCache(state, arenas, true, true)
  count = count + req(len(state.actions) >= 17, "cache")

  options = u.options()
  options.multiplayer = true
  options.gametype = u.GT_TEAM
  options.mapName = "Q3DM6"
  options.dedicated = 0
  options.timeLimit = 15
  options.fragLimit = 20
  options.hostname = "Server"
  options.botSkill = 2
  u.serverOptionsInitPlayerItems(options, "Player")
  options.playerTypes[1] = 1
  options.playerNames[1] = "Sarge"
  options.playerTeams[1] = 0
  count = count + req(u.serverOptionsStart(options, true) >= 2, "start")
  count = count + req(options.actions[0].name == "ui_team_fraglimit", "mode cvars")
  count = count + req(u.botAlreadySelected(options, "sarge"), "selected")

  bots = [bot("Visor", "visor/default"), bot("Anarki", "anarki/red"), bot("Sarge", "sarge/default")]
  select = u.botState()
  u.botSelectInit(select, options, bots, "Sarge")
  count = count + req(select.sorted[0].name == "Anarki" and select.selected == 1, "bot sort default")
  count = count + req(u.serverPlayerIcon("anarki/red", true) == "models/players/anarki/icon_red.tga", "icon")
  count = count + req(u.botSelectBotEvent(select, 0, true), "bot event")
  count = count + req(select.selected == 0, "bot selection")
  count = count + req(u.botSelectSelectEvent(select, options, true, true), "bot select event")
  count = count + req(options.newBot and options.newBotName == "Anarki", "bot choose")
  u.serverOptionsLevelshotDraw(options, true)
  count = count + req(options.playerNames[options.newBotIndex] == "Anarki", "bot apply")

  print("PASS: "+str(count)+" native ui_startserver contracts")
  return 0
end function
