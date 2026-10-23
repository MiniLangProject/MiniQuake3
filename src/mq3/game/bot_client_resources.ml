// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 BotAISetupClient/BotAIShutdownClient resource ownership.
package mq3.game.bot_client_resources
import mq3.game.game_headers as headers
import mq3.game.bot_lifecycle as botLifecycle
import mq3.compat.numeric as n

const CHARACTERISTIC_GENDER=headers.CHARACTERISTIC_GENDER
const CHARACTERISTIC_WEAPONWEIGHTS=headers.CHARACTERISTIC_WEAPONWEIGHTS
const CHARACTERISTIC_CHAT_FILE=headers.CHARACTERISTIC_CHAT_FILE
const CHARACTERISTIC_CHAT_NAME=headers.CHARACTERISTIC_CHAT_NAME
const CHARACTERISTIC_ITEMWEIGHTS=headers.CHARACTERISTIC_ITEMWEIGHTS
const CHARACTERISTIC_WALKER=headers.CHARACTERISTIC_WALKER
const CHAT_GENDERLESS = 0
const CHAT_GENDERFEMALE = 1
const CHAT_GENDERMALE = 2
const CHAT_ALL = 0

struct Settings
  characterfile
  skill
  team
end struct

struct Services
  lifecycleState
  aasInitializedFn
  diagnosticFn
  loadCharacterFn
  allocGoalStateFn
  characteristicStringFn
  loadItemWeightsFn
  freeGoalStateFn
  allocWeaponStateFn
  loadWeaponWeightsFn
  freeWeaponStateFn
  allocChatStateFn
  loadChatFileFn
  freeChatStateFn
  setChatGenderFn
  floatTimeFn
  allocMoveStateFn
  characteristicFloatFn
  integerQueryFn
  botLibVarSetFn
  chatTestFn
  scheduleThinkFn
  mutateGoalFn
  readSessionFn
  writeSessionFn
  chatExitGameFn
  enterChatFn
  freeMoveStateFn
  freeCharacterFn
  freeWaypointsFn
  clearActivateGoalStackFn
  context
end struct

function create(state)
  if state == void then return error(495,"Bot client resources require lifecycle state") end if
  return Services(state,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,
    void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

function validClient(client)
  if typeof(client) != "int" or client < 0 or client >= botLifecycle.MAX_CLIENTS then return error(495,"Invalid bot client slot") end if
  return client
end function

function need(callback,label)
  if callback == void then return error(495,"Bot client resources require "+label) end if
  return callback
end function

function diagnostic(services,kind,client,settings)
  if services.diagnosticFn != void then services.diagnosticFn(services,kind,client,settings) end if
  return void
end function

function inactiveBot(client)
  bot = botLifecycle.createBot(client); bot.inuse = false; return bot
end function

function setupClient(services,client,settings,restart)
  validClient(client)
  if settings == void then return error(495,"Bot setup requires settings") end if
  state = services.lifecycleState; bot = state.botstates[client]
  if bot == void then bot = inactiveBot(client); state.botstates[client] = bot end if
  if bot.inuse then diagnostic(services,1,client,settings); return false end if
  if not need(services.aasInitializedFn,"AAS_Initialized")(services) then
    diagnostic(services,2,client,settings); return false
  end if
  bot.character = need(services.loadCharacterFn,"BotLoadCharacter")(services,settings.characterfile,settings.skill)
  if bot.character == 0 then diagnostic(services,3,client,settings); return false end if
  bot.settings = Settings(settings.characterfile,settings.skill,settings.team)
  bot.gs = need(services.allocGoalStateFn,"BotAllocGoalState")(services,client)
  filename = need(services.characteristicStringFn,"Characteristic_String")(services,bot.character,CHARACTERISTIC_ITEMWEIGHTS,144)
  result = need(services.loadItemWeightsFn,"BotLoadItemWeights")(services,bot.gs,filename)
  if result != 0 then need(services.freeGoalStateFn,"BotFreeGoalState")(services,bot.gs); return false end if
  bot.ws = need(services.allocWeaponStateFn,"BotAllocWeaponState")(services)
  filename = services.characteristicStringFn(services,bot.character,CHARACTERISTIC_WEAPONWEIGHTS,144)
  result = need(services.loadWeaponWeightsFn,"BotLoadWeaponWeights")(services,bot.ws,filename)
  if result != 0 then
    need(services.freeGoalStateFn,"BotFreeGoalState")(services,bot.gs)
    need(services.freeWeaponStateFn,"BotFreeWeaponState")(services,bot.ws)
    return false
  end if
  bot.cs = need(services.allocChatStateFn,"BotAllocChatState")(services)
  filename = services.characteristicStringFn(services,bot.character,CHARACTERISTIC_CHAT_FILE,144)
  chatname = services.characteristicStringFn(services,bot.character,CHARACTERISTIC_CHAT_NAME,144)
  result = need(services.loadChatFileFn,"BotLoadChatFile")(services,bot.cs,filename,chatname)
  if result != 0 then
    need(services.freeChatStateFn,"BotFreeChatState")(services,bot.cs)
    need(services.freeGoalStateFn,"BotFreeGoalState")(services,bot.gs)
    need(services.freeWeaponStateFn,"BotFreeWeaponState")(services,bot.ws)
    return false
  end if
  gender = services.characteristicStringFn(services,bot.character,CHARACTERISTIC_GENDER,144)
  genderValue = CHAT_GENDERLESS
  if len(bytes(gender)) > 0 then
    first = bytes(gender)[0]
    if first == 102 or first == 70 then genderValue = CHAT_GENDERFEMALE
    else if first == 109 or first == 77 then genderValue = CHAT_GENDERMALE end if
  end if
  need(services.setChatGenderFn,"BotSetChatGender")(services,bot.cs,genderValue)
  bot.inuse = true; bot.client = client; bot.entitynum = client; bot.setupcount = 4
  bot.entergameTime = need(services.floatTimeFn,"FloatTime")(services)
  bot.ms = need(services.allocMoveStateFn,"BotAllocMoveState")(services)
  bot.walker = need(services.characteristicFloatFn,"Characteristic_BFloat")(services,bot.character,CHARACTERISTIC_WALKER,0.0,1.0)
  state.numbots = n.add32(state.numbots,1)
  if need(services.integerQueryFn,"Cvar_VariableIntegerValue")(services,"bot_testichat") != 0 then
    need(services.botLibVarSetFn,"BotLibVarSet")(services,"bot_testichat","1")
    need(services.chatTestFn,"BotChatTest")(services,bot)
  end if
  need(services.scheduleThinkFn,"BotScheduleBotThink")(services)
  if state.interbreed then need(services.mutateGoalFn,"BotMutateGoalFuzzyLogic")(services,bot.gs,1) end if
  if restart != 0 then need(services.readSessionFn,"BotReadSessionData")(services,bot) end if
  return true
end function

function clearBot(bot)
  bot.inuse = false; bot.client = 0; bot.entitynum = 0; bot.settings = void; bot.curPs = void
  bot.character = 0; bot.ms = 0; bot.gs = 0; bot.cs = 0; bot.ws = 0; bot.entergameTime = 0.0
  bot.walker = 0.0; bot.setupcount = 0; bot.checkpoints = void; bot.patrolpoints = void
  bot.numKills = 0; bot.numDeaths = 0; bot.transient = void; return void
end function

function shutdownClient(services,client,restart)
  validClient(client); state = services.lifecycleState; bot = state.botstates[client]
  if bot == void or not bot.inuse then return false end if
  if restart != 0 then need(services.writeSessionFn,"BotWriteSessionData")(services,bot) end if
  if need(services.chatExitGameFn,"BotChat_ExitGame")(services,bot) then
    need(services.enterChatFn,"BotEnterChat")(services,bot.cs,bot.client,CHAT_ALL)
  end if
  need(services.freeMoveStateFn,"BotFreeMoveState")(services,bot.ms)
  need(services.freeGoalStateFn,"BotFreeGoalState")(services,bot.gs)
  need(services.freeChatStateFn,"BotFreeChatState")(services,bot.cs)
  need(services.freeWeaponStateFn,"BotFreeWeaponState")(services,bot.ws)
  need(services.freeCharacterFn,"BotFreeCharacter")(services,bot.character)
  need(services.freeWaypointsFn,"BotFreeWaypoints")(services,bot.checkpoints)
  need(services.freeWaypointsFn,"BotFreeWaypoints")(services,bot.patrolpoints)
  need(services.clearActivateGoalStackFn,"BotClearActivateGoalStack")(services,bot)
  clearBot(bot); state.numbots = n.add32(state.numbots,-1); return true
end function
