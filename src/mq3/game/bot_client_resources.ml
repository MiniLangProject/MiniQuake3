// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 BotAISetupClient/BotAIShutdownClient resource ownership.
package mq3.game.bot_client_resources
import mq3.game.game_headers as headers
import mq3.game.bot_lifecycle as botLifecycle
import mq3.compat.numeric as n

/// Bot-character characteristic index for gender. Definition: gender of the bot string ("male",
/// "female", "it").
const CHARACTERISTIC_GENDER=headers.CHARACTERISTIC_GENDER
/// Bot-character characteristic index for weaponweights. Definition: weapon weight file string.
const CHARACTERISTIC_WEAPONWEIGHTS=headers.CHARACTERISTIC_WEAPONWEIGHTS
/// Bot-character characteristic index for chat file. Definition: chat file with chats string.
const CHARACTERISTIC_CHAT_FILE=headers.CHARACTERISTIC_CHAT_FILE
/// Bot-character characteristic index for chat name. Definition: name of the chat character string.
const CHARACTERISTIC_CHAT_NAME=headers.CHARACTERISTIC_CHAT_NAME
/// Bot-character characteristic index for itemweights. Definition: goal item weight file string.
const CHARACTERISTIC_ITEMWEIGHTS=headers.CHARACTERISTIC_ITEMWEIGHTS
/// Bot-character characteristic index for walker. Definition: tendency to walk float [0, 1].
const CHARACTERISTIC_WALKER=headers.CHARACTERISTIC_WALKER
/// Chat-state value or flag selecting genderless.
const CHAT_GENDERLESS = 0
/// Chat-state value or flag selecting genderfemale.
const CHAT_GENDERFEMALE = 1
/// Chat-state value or flag selecting gendermale.
const CHAT_GENDERMALE = 2
/// Chat-state value or flag selecting all.
const CHAT_ALL = 0

/// `Settings` record for bot client resources, containing `characterfile`, `skill` and `team`.
struct Settings
  /// Path of the bot-character definition used to configure this bot.
  characterfile
  /// Configured bot skill level supplied to character and decision logic.
  skill
  /// Team assignment associated with the client, bot, or action.
  team
end struct

/// `Services` record for bot client resources, containing `lifecycleState`, `aasInitializedFn`, `diagnosticFn`, `loadCharacterFn` and `allocGoalStateFn` and related fields.
struct Services
  /// State shared by bot allocation, setup, shutdown, and frame processing.
  lifecycleState
  /// Injected callback for AAS initialized; invoked through the Services service/state record.
  aasInitializedFn
  /// Injected callback for diagnostic; invoked through the Services service/state record.
  diagnosticFn
  /// Injected callback for load character; invoked through the Services service/state record.
  loadCharacterFn
  /// Injected callback for alloc goal state; invoked through the Services service/state record.
  allocGoalStateFn
  /// Injected callback for characteristic string; invoked through the Services service/state record.
  characteristicStringFn
  /// Injected callback for load item weights; invoked through the Services service/state record.
  loadItemWeightsFn
  /// Injected callback for free goal state; invoked through the Services service/state record.
  freeGoalStateFn
  /// Injected callback for alloc weapon state; invoked through the Services service/state record.
  allocWeaponStateFn
  /// Injected callback for load weapon weights; invoked through the Services service/state record.
  loadWeaponWeightsFn
  /// Injected callback for free weapon state; invoked through the Services service/state record.
  freeWeaponStateFn
  /// Injected callback for alloc chat state; invoked through the Services service/state record.
  allocChatStateFn
  /// Injected callback for load chat file; invoked through the Services service/state record.
  loadChatFileFn
  /// Injected callback for free chat state; invoked through the Services service/state record.
  freeChatStateFn
  /// Injected callback for set chat gender; invoked through the Services service/state record.
  setChatGenderFn
  /// Injected callback for float time; invoked through the Services service/state record.
  floatTimeFn
  /// Injected callback for alloc move state; invoked through the Services service/state record.
  allocMoveStateFn
  /// Injected callback for characteristic float; invoked through the Services service/state record.
  characteristicFloatFn
  /// Injected callback for integer query; invoked through the Services service/state record.
  integerQueryFn
  /// Injected callback for bot lib var set; invoked through the Services service/state record.
  botLibVarSetFn
  /// Injected callback for chat test; invoked through the Services service/state record.
  chatTestFn
  /// Injected callback for schedule think; invoked through the Services service/state record.
  scheduleThinkFn
  /// Injected callback for mutate goal; invoked through the Services service/state record.
  mutateGoalFn
  /// Injected callback for read session; invoked through the Services service/state record.
  readSessionFn
  /// Injected callback for write session; invoked through the Services service/state record.
  writeSessionFn
  /// Injected callback for chat exit game; invoked through the Services service/state record.
  chatExitGameFn
  /// Injected callback for enter chat; invoked through the Services service/state record.
  enterChatFn
  /// Injected callback for free move state; invoked through the Services service/state record.
  freeMoveStateFn
  /// Injected callback for free character; invoked through the Services service/state record.
  freeCharacterFn
  /// Injected callback for free waypoints; invoked through the Services service/state record.
  freeWaypointsFn
  /// Injected callback for clear activate goal stack; invoked through the Services service/state
  /// record.
  clearActivateGoalStackFn
  /// Opaque caller-supplied context available to bot character, goal, weapon, chat, and movement
  /// resource callbacks.
  context
end struct

/// Build the `mq3.game.bot_client_resources.Services` result for `create`.
/// @param state Initial value stored in `mq3.game.bot_client_resources.Services.lifecycleState`.
function create(state)
  if state == void then return error(495,"Bot client resources require lifecycle state") end if
  return Services(state,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,
    void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

/// Require an integer bot client slot within the fixed bot-client capacity.
/// @param client Value passed as argument 1 to `typeof`.
function validClient(client)
  if typeof(client) != "int" or client < 0 or client >= botLifecycle.MAX_CLIENTS then return error(495,"Invalid bot client slot") end if
  return client
end function

/// Require a callback used to allocate or release bot client resources.
/// @param callback Callback invoked by this operation.
/// @param label Label retained with the diagnostic or action record.
function need(callback,label)
  if callback == void then return error(495,"Bot client resources require "+label) end if
  return callback
end function

/// Use `services.diagnosticFn` to perform `diagnostic`.
/// @param services Host service callbacks; accesses `diagnosticFn`.
/// @param kind Value passed as argument 2 to `services.diagnosticFn`.
/// @param client Value passed as argument 3 to `services.diagnosticFn`.
/// @param settings Value passed as argument 4 to `services.diagnosticFn`.
function diagnostic(services,kind,client,settings)
  if services.diagnosticFn != void then services.diagnosticFn(services,kind,client,settings) end if
  return void
end function

/// Apply `mq3.game.bot_lifecycle.createBot` while evaluating `inactiveBot`. Return paths include `bot`.
/// @param client Initial value stored in `mq3.game.bot_lifecycle.BotState.client`.
function inactiveBot(client)
  bot = botLifecycle.createBot(client); bot.inuse = false; return bot
end function

/// Use `services.characteristicStringFn` to perform `setupClient`.
/// @param services Host service callbacks; accesses `lifecycleState`, `aasInitializedFn`, `loadCharacterFn`, `allocGoalStateFn` and `characteristicStringFn` and related fields.
/// @param client Value passed as argument 1 to `typeof`.
/// @param settings Settings record; accesses `characterfile`, `skill` and `team`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
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

/// Update `bot.inuse`, `bot.client`, `bot.entitynum` and `bot.settings` and related state during `clearBot`.
/// @param bot Bot AI state; accesses `inuse`, `client`, `entitynum`, `settings` and `curPs` and related fields. May update `bot.inuse`, `bot.client` and `bot.entitynum` and additional fields in place.
function clearBot(bot)
  bot.inuse = false; bot.client = 0; bot.entitynum = 0; bot.settings = void; bot.curPs = void
  bot.character = 0; bot.ms = 0; bot.gs = 0; bot.cs = 0; bot.ws = 0; bot.entergameTime = 0.0
  bot.walker = 0.0; bot.setupcount = 0; bot.checkpoints = void; bot.patrolpoints = void
  bot.numKills = 0; bot.numDeaths = 0; bot.transient = void; return void
end function

/// Apply `mq3.game.bot_client_resources.validClient`, `mq3.game.bot_client_resources.need` and `mq3.game.bot_client_resources.clearBot` while evaluating `shutdownClient`.
/// @param services Host service callbacks; accesses `lifecycleState`, `writeSessionFn`, `chatExitGameFn`, `enterChatFn` and `freeMoveStateFn` and related fields.
/// @param client Value passed as argument 1 to `typeof`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
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
