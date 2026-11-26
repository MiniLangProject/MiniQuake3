// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Semantic native port of code/cgame/cg_players.c. Rendering, collision, audio
// and filesystem calls cross typed boundaries and may be suppressed while the
// retail QVM remains authoritative.
package mq3.client.cgame_players
import mq3.client.cg_local as cgabi
import std.string as strings
import mq3.shared.info as info
import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
/// Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game players.
/// @param text NUL-terminated C string containing the decimal numeric text.
/// @returns The converted integer; a string with no initial numeric conversion yields zero.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

/// Capacity limit for the clients collection or bounded storage used by this client module.
const MAX_CLIENTS=64
/// Capacity limit for the animations collection or bounded storage used by this client module.
const MAX_ANIMATIONS=31
/// Capacity limit for the totalanimations collection or bounded storage used by this client module.
const MAX_TOTALANIMATIONS=36
/// Bit toggled when restarting an animation so repeated identifiers still trigger a transition.
const ANIM_TOGGLEBIT=128
/// Native team identifier for red, used by player and team presentation.
const TEAM_RED=1
/// Native team identifier for blue, used by player and team presentation.
const TEAM_BLUE=2
/// Native team identifier for spectator, used by player and team presentation.
const TEAM_SPECTATOR=3
/// Native game-type value for team deathmatch, used when selecting team-dependent player models,
/// colors, and effects.
const GT_TEAM=3
/// Native lower-body animation slot for the walkcr sequence.
const LEGS_WALKCR=13
/// Native lower-body animation slot for the walk sequence.
const LEGS_WALK=14
/// Native lower-body animation slot for the run sequence.
const LEGS_RUN=15
/// Native lower-body animation slot for the back sequence.
const LEGS_BACK=16
/// Native lower-body animation slot for the land sequence.
const LEGS_LAND=19
/// Native lower-body animation slot for the landb sequence.
const LEGS_LANDB=21
/// Native lower-body animation slot for the idle sequence.
const LEGS_IDLE=22
/// Native lower-body animation slot for the idlecr sequence.
const LEGS_IDLECR=23
/// Native lower-body animation slot for the turn sequence.
const LEGS_TURN=24
/// Native lower-body animation slot for the backcr sequence.
const LEGS_BACKCR=31
/// Native lower-body animation slot for the backwalk sequence.
const LEGS_BACKWALK=32
/// Player-carried flag animation slot for the run sequence.
const FLAG_RUN=33
/// Player-carried flag animation slot for the stand sequence.
const FLAG_STAND=34
/// Player-carried flag animation slot for the stand2 run sequence.
const FLAG_STAND2RUN=35
/// Native upper-body animation slot for the gesture sequence.
const TORSO_GESTURE=6
/// Player powerup slot for quad, also used when constructing active-powerup bitsets.
const PW_QUAD=1
/// Player powerup slot for battlesuit, also used when constructing active-powerup bitsets.
const PW_BATTLESUIT=2
/// Player powerup slot for haste, also used when constructing active-powerup bitsets.
const PW_HASTE=3
/// Player powerup slot for invis, also used when constructing active-powerup bitsets.
const PW_INVIS=4
/// Player powerup slot for regen, also used when constructing active-powerup bitsets.
const PW_REGEN=5
/// Player powerup slot for flight, also used when constructing active-powerup bitsets.
const PW_FLIGHT=6
/// Player powerup slot for redflag, also used when constructing active-powerup bitsets.
const PW_REDFLAG=7
/// Player powerup slot for blueflag, also used when constructing active-powerup bitsets.
const PW_BLUEFLAG=8
/// Player powerup slot for neutralflag, also used when constructing active-powerup bitsets.
const PW_NEUTRALFLAG=9
/// Entity-state flag selecting dead behavior in client presentation.
const EF_DEAD=1
/// Entity-state flag selecting award excellent behavior in client presentation.
const EF_AWARD_EXCELLENT=8
/// Entity-state flag selecting award gauntlet behavior in client presentation.
const EF_AWARD_GAUNTLET=64
/// Entity-state flag selecting award cap behavior in client presentation.
const EF_AWARD_CAP=2048
/// Entity-state flag selecting talk behavior in client presentation.
const EF_TALK=4096
/// Entity-state flag selecting connection behavior in client presentation.
const EF_CONNECTION=8192
/// Entity-state flag selecting award impressive behavior in client presentation.
const EF_AWARD_IMPRESSIVE=32768
/// Entity-state flag selecting award defend behavior in client presentation.
const EF_AWARD_DEFEND=65536
/// Entity-state flag selecting award assist behavior in client presentation.
const EF_AWARD_ASSIST=131072
/// Duration in milliseconds of the player-model pain twitch.
const PAIN_TWITCH_TIME=cgabi.PAIN_TWITCH_TIME

/// Stores client game players queued engine action, including `boundary`, `kind`, `entity`, `name`, `value`, `origin` and additional values.
struct Action
  /// Host service category recorded with a request emitted while loading player media and submitting
  /// animated body parts and powerup effects.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while loading player media
  /// and submitting animated body parts and powerup effects.
  kind
  /// When constructing this record, `effect` supplies `entityNum` for this member.
  entity
  /// Model, skin, sound, shader, or player-effect resource named by the presentation action.
  name
  /// Value payload supplied to the selected host operation while loading player media and submitting
  /// animated body parts and powerup effects.
  value
  /// World-space position supplied with a player-model, powerup, trail, or sound operation.
  origin
  /// Color components associated with the player render, light, or auxiliary-effect request.
  color
  /// True when this request is marked for native dispatch while loading player media and submitting
  /// animated body parts and powerup effects; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game players animation record, including `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`, `reversed` and additional values.
struct Animation
  /// Index of the first model frame belonging to the animation sequence.
  firstFrame
  /// Number of model frames belonging to the animation sequence.
  numFrames
  /// Number of trailing animation frames repeated after the initial sequence; zero disables looping.
  loopFrames
  /// Interval in milliseconds between successive animation frames.
  frameLerp
  /// Time in milliseconds used to reach the first frame of a newly selected animation.
  initialLerp
  /// True when animation frames are traversed in reverse order.
  reversed
  /// True when the animation returns through its frames in reverse after reaching the end.
  flipflop
end struct
/// Stores client game players lerp frame record, including `oldFrame`, `frame`, `oldFrameTime`, `frameTime`, `backlerp`, `animationNumber` and additional values.
struct LerpFrame
  /// Previous animation frame used as the interpolation starting point.
  oldFrame
  /// Current player-model animation frame being approached by interpolation from oldFrame.
  frame
  /// Client time in milliseconds at which the previous animation frame was exact.
  oldFrameTime
  /// Client presentation timestamp in milliseconds at which interpolation reaches the current model
  /// frame.
  frameTime
  /// Previous-frame weight used to interpolate the tracked animation presented by in-game player model
  /// presentation.
  backlerp
  /// Selected animation identifier, including the animation-toggle bit when present.
  animationNumber
  /// Client time in milliseconds at which the first frame of the animation becomes exact.
  animationTime
  /// Animation description supplying frame ranges and playback timing.
  animation
  /// Smoothed yaw angle used to orient the animated body part.
  yawAngle
  /// True while the body part is turning toward its target yaw.
  yawing
  /// Smoothed pitch angle used to orient the animated body part.
  pitchAngle
  /// True while the body part is turning toward its target pitch.
  pitching
end struct
/// Stores client game players client info record, including `infoValid`, `deferred`, `name`, `team`, `modelName`, `skinName` and additional values.
struct ClientInfo
  /// True when the client-information entry has been populated from valid server data.
  infoValid
  /// True while the player's full media registration is deferred to a later load step.
  deferred
  /// Player display name received from the server's client-information string.
  name
  /// Player team affiliation used to choose model skins, team colors, and friend markers.
  team
  /// Virtual model name selected for the player or preview model.
  modelName
  /// Skin name selected for the player's body model.
  skinName
  /// Virtual model name selected for the player's head.
  headModelName
  /// Skin name selected for the player's head model.
  headSkinName
  /// Red-team model or identity name used by the player's media selection.
  redTeam
  /// Blue-team model or identity name used by the player's media selection.
  blueTeam
  /// Primary player color used for team and weapon-effect presentation.
  color1
  /// Secondary player color used for team and weapon-effect presentation.
  color2
  /// Footstep-sound category selected by the player model.
  footsteps
  /// Offset applied to position the head model in icon or preview views.
  headOffset
  /// Model gender used when selecting gender-specific player sounds.
  gender
  /// True when the model requires leg yaw to remain aligned with torso yaw.
  fixedlegs
  /// True when the model requires the torso to keep a fixed yaw.
  fixedtorso
  /// True when the player model uses the Missionpack animation set.
  newAnims
  /// Model resource selected for the legs presentation.
  legsModel
  /// Model resource selected for the torso presentation.
  torsoModel
  /// Head-model resource used when drawing a player, head icon, or preview.
  headModel
  /// Skin resource applied to the legs model presentation.
  legsSkin
  /// Skin resource applied to the torso model presentation.
  torsoSkin
  /// Skin resource applied to the player's head model.
  headSkin
  /// Image or shader resource used to draw the model icon.
  modelIcon
  /// Registered sound resources associated with the player model or media group.
  sounds
  /// Animation descriptions indexed by the native player-animation identifiers.
  animations
  /// Reported player score cached alongside the player model and identity information.
  score
  /// Reported player powerup bitmask stored alongside model and identity information.
  powerups
  /// When constructing this record, `clientInfo` supplies `0` for this member.
  breathPuffTime
end struct
/// Stores client game players entity record, including `number`, `clientNum`, `eFlags`, `powerups`, `legsAnim`, `torsoAnim` and additional values.
struct Entity
  /// When constructing this record, `entity` supplies `number` for this member.
  number
  /// Index into the player client-information table used to select models, skins, and animations.
  clientNum
  /// When constructing this record, `entity` supplies `0` for this member.
  eFlags
  /// Entity powerup bitmask used for haste animation, flag attachments, and player visual effects.
  powerups
  /// When constructing this record, `entity` supplies `LEGS_IDLE` for this member.
  legsAnim
  /// When constructing this record, `entity` supplies `11` for this member.
  torsoAnim
  /// When constructing this record, `entity` supplies `0` for this member.
  generic1
  /// Interpolated world-space player position used for body models and attached effects.
  origin
  /// Euler orientation used to place or animate the object.
  angles
  /// Linear rate of change of position used by movement or effect integration.
  velocity
  /// Client timestamp of the last pain reaction, used to animate the flinch.
  painTime
  /// Alternating direction selector used for the player's pain animation.
  painDirection
  /// Last trail-emission time, allowing missile trails to catch up across dropped packets.
  trailTime
  /// Last time a running player's ground-contact dust effect was emitted.
  dustTrailTime
  /// Animation and interpolation state for the player's legs.
  legs
  /// Animation and interpolation state for the player's torso.
  torso
  /// When constructing this record, `entity` supplies `lerpFrame()` for this member.
  flag
end struct
/// Stores client game players trace record, including `fraction`, `endpos`, `normal`, `startsolid`, `allsolid`, `surfaceFlags`.
struct Trace
  /// Fraction of the requested trace distance completed before the first collision.
  fraction
  /// Final world-space position reached by the collision trace.
  endpos
  /// Ground-trace plane normal available to player-shadow and contact-effect calculations.
  normal
  /// True when the collision trace begins inside solid geometry.
  startsolid
  /// True when the trace remains fully enclosed by solid geometry.
  allsolid
  /// Surface-property bits returned by the collision trace.
  surfaceFlags
end struct
/// Stores client game players vertex record, including `origin`, `color`.
struct Vertex
  /// World-space vertex position for player-associated polygon geometry.
  origin
  /// Per-vertex RGBA modulation stored as four byte-range channel values.
  color
end struct
/// Stores client game players state, including `time`, `frameTime`, `gametype`, `localClientNum`, `renderingThirdPerson`, `shadows` and additional values.
struct State
  /// Current client-game time in milliseconds used for player animation and player-attached effects.
  time
  /// Elapsed frame-time slot retained with the player-presentation state.
  frameTime
  /// Game-rule identifier controlling team model skins and teammate marker sprites.
  gametype
  /// When constructing this record, `create` supplies `0` for this member. Used by `breathPuffs` during
  /// subsequent processing.
  localClientNum
  /// True while the camera uses a third-person, chase, or death view.
  renderingThirdPerson
  /// When constructing this record, `create` supplies `1` for this member. Used by `playerShadow` and
  /// `playerSplash` during subsequent processing.
  shadows
  /// When constructing this record, `create` supplies `true` for this member. Used by `playerSprites`
  /// during subsequent processing.
  drawFriend
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `playerAnimation` during subsequent processing.
  noPlayerAnims
  /// When constructing this record, `create` supplies `1` for this member. Used by `runLerpFrame`
  /// during subsequent processing.
  animSpeed
  /// When constructing this record, `create` supplies `0.3` for this member.
  swingSpeed
  /// When constructing this record, `create` supplies `false` for this member. Used by `breathPuffs`
  /// during subsequent processing.
  enableBreath
  /// When constructing this record, `create` supplies `false` for this member. Used by `dustTrail`
  /// during subsequent processing.
  enableDust
  /// Client model, skin, identity, and animation information indexed by player slot.
  clients
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `fileExists` during subsequent processing.
  files
  /// Host requests queued while loading player media and submitting animated body parts and powerup
  /// effects, retained in request order.
  actions
end struct

/// Creates a `mq3.client.cgame_players.Animation` record. Assigns `firstFrame` from `firstFrame`, `numFrames` from `numFrames`, `loopFrames` from `loopFrames`, `frameLerp` from `frameLerp`.
/// @param firstFrame Value used to initialize `Animation.firstFrame`.
/// @param numFrames Value used to initialize `Animation.numFrames`.
/// @param loopFrames Value used to initialize `Animation.loopFrames`.
/// @param frameLerp Value used to initialize `Animation.frameLerp`.
/// @param initialLerp Value used to initialize `Animation.initialLerp`.
/// @param reversed Value used to initialize `Animation.reversed`.
/// @param flipflop Value used to initialize `Animation.flipflop`.
function animation(firstFrame,numFrames,loopFrames,frameLerp,initialLerp,reversed,flipflop) return Animation(firstFrame,numFrames,loopFrames,frameLerp,initialLerp,reversed,flipflop) end function
/// Creates a `mq3.client.cgame_players.LerpFrame` record. Initializes the record with the defaults written in this constructor.
function lerpFrame() return LerpFrame(0,0,0,0,0.0,0,0,void,0.0,false,0.0,false) end function
/// Creates a `mq3.client.cgame_players.ClientInfo` record. Initializes the record with the defaults written in this constructor.
function clientInfo() return ClientInfo(false,false,"",0,"sarge","default","sarge","default","","",[1.0,1.0,1.0],[1.0,1.0,1.0],0,[0.0,0.0,0.0],0,false,false,false,"","","","","","","",array(13,""),[],0,0,0) end function
/// Creates a `mq3.client.cgame_players.Entity` record. Assigns `number` from `number`, `clientNum` from `clientNum`.
/// @param number Value used to initialize `Entity.number`.
/// @param clientNum Value used to initialize `Entity.clientNum`.
function entity(number,clientNum) return Entity(number,clientNum,0,0,LEGS_IDLE,11,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0,0,lerpFrame(),lerpFrame(),lerpFrame()) end function
/// Creates a `mq3.client.cgame_players.Vertex` record. Assigns `origin` from `origin`.
/// @param origin Value used to initialize `Vertex.origin`.
function vertex(origin) return Vertex(origin,[255,255,255,255]) end function
/// Calls `mq3.client.cgame_players.clientInfo`, `mq3.client.cgame_players.State` from client game players `create`. The final path returns `State(0,0,0,0,false,1,true,false,1,0.3,false,false,clients,[],[])`.
function create()
  clients=[];for i=0 to MAX_CLIENTS-1 clients=clients+[clientInfo()] end for
  return State(0,0,0,0,false,1,true,false,1,0.3,false,false,clients,[],[])
end function
/// Updates `state.actions` during client game players `effect`.
/// @param state Mutable client game players record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param entityNum Entity number identifying a world or player entity.
/// @param name Name used to select or register the corresponding client game players resource.
/// @param value Value used by `item=Action(boundary,kind,entityNum,name,value,origin,color,not retailActive)`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param color Color value used by the client game players drawing or interpolation operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function effect(state,boundary,kind,entityNum,name,value,origin,color,retailActive) item=Action(boundary,kind,entityNum,name,value,origin,color,not retailActive);state.actions=state.actions+[item];return item end function
/// Computes `(value & (1<<index))!=0` for client game players `bit`.
/// @param value Value used by `return (value & (1<<index))!=0`.
/// @param index Value used by `return (value & (1<<index))!=0`.
function bit(value,index) return (value & (1<<index))!=0 end function
/// Lists the custom sound names catalog for client game players in its declared source order.
function customSoundNames() return ["*death1.wav","*death2.wav","*death3.wav","*jump1.wav","*pain25_1.wav","*pain50_1.wav","*pain75_1.wav","*pain100_1.wav","*falling1.wav","*gasp.wav","*drown.wav","*fall1.wav","*taunt.wav"] end function

// CG_CustomSound
/// @param state Record read through `state.clients`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param soundName Value used by `if strings.substr(soundName,0,1)!="*" then effect(state,"audio","register-sound",clientNum,soundName,"",void,void,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function customSound(state,clientNum,soundName,retailActive)
  if strings.substr(soundName,0,1)!="*" then effect(state,"audio","register-sound",clientNum,soundName,"",void,void,retailActive);return soundName end if
  if clientNum<0 or clientNum>=MAX_CLIENTS then clientNum=0 end if;names=customSoundNames();for i=0 to len(names)-1 if soundName==names[i] then return state.clients[clientNum].sounds[i] end if end for;return error(7850,"Unknown custom sound: "+soundName)
end function
/// Calls `decode`, `slice` from client game players `tokens`. The final path returns `effect`.
/// @param text Text consumed or emitted by `tokens` in the client game players path.
function tokens(text) effect=[];data=bytes(text);at=0;while at<len(data) while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if;if data[at]==47 and at+1<len(data) and data[at+1]==47 then while at<len(data) and data[at]!=10 at=at+1 end while else start=at;while at<len(data) and data[at]>32 at=at+1 end while;effect=effect+[decode(slice(data,start,at-start))] end if end while;return effect end function
// CG_ParseAnimationFile
/// @param filename Accepted for compatibility with `parseAnimationFile`; the current implementation does not read it.
/// @param text Text whose length/content is inspected by `parseAnimationFile`.
/// @param ci Mutable client game players record/storage; this routine assigns `ci.footsteps`, `ci.headOffset`, `ci.gender`, `ci.fixedlegs` and additional values.
function parseAnimationFile(filename,text,ci)
  if text==void or len(text)==0 or len(text)>=19999 then return false end if;data=tokens(text);at=0;ci.footsteps=0;ci.headOffset=[0.0,0.0,0.0];ci.gender=0;ci.fixedlegs=false;ci.fixedtorso=false
  while at<len(data) key=strings.toLowerAscii(data[at]);if key=="footsteps" and at+1<len(data) then at=at+1;value=strings.toLowerAscii(data[at]);if value=="boot" then ci.footsteps=1 else if value=="flesh" then ci.footsteps=2 else if value=="mech" then ci.footsteps=3 else if value=="energy" then ci.footsteps=4 else ci.footsteps=0 end if;at=at+1 else if key=="headoffset" and at+3<len(data) then ci.headOffset=[numbers.atof32(data[at+1]),numbers.atof32(data[at+2]),numbers.atof32(data[at+3])];at=at+4 else if key=="sex" and at+1<len(data) then sex=strings.toLowerAscii(data[at+1]);ci.gender=0;if strings.substr(sex,0,1)=="f" then ci.gender=1 else if strings.substr(sex,0,1)=="n" then ci.gender=2 end if;at=at+2 else if key=="fixedlegs" then ci.fixedlegs=true;at=at+1 else if key=="fixedtorso" then ci.fixedtorso=true;at=at+1 else break end if end while
  ci.animations=[];skip=0;for i=0 to MAX_ANIMATIONS-1 if at+3>=len(data) then return false end if;first=atoi(data[at]);count=atoi(data[at+1]);loops=atoi(data[at+2]);fps=numbers.atof32(data[at+3]);at=at+4;if i==LEGS_WALKCR then skip=first-ci.animations[TORSO_GESTURE].firstFrame end if;if i>=LEGS_WALKCR then first=first-skip end if;reversed=count<0;if reversed then count=0-count end if;if fps==0.0 then fps=1.0 end if;millis=n.trunc32(1000.0/fps);ci.animations=ci.animations+[animation(first,count,loops,millis,millis,reversed,false)] end for
  backcr=ci.animations[LEGS_WALKCR];ci.animations=ci.animations+[animation(backcr.firstFrame,backcr.numFrames,backcr.loopFrames,backcr.frameLerp,backcr.initialLerp,true,false)];backwalk=ci.animations[LEGS_WALK];ci.animations=ci.animations+[animation(backwalk.firstFrame,backwalk.numFrames,backwalk.loopFrames,backwalk.frameLerp,backwalk.initialLerp,true,false)];ci.animations=ci.animations+[animation(0,16,16,66,66,false,false),animation(16,5,0,50,50,false,false),animation(16,5,1,66,66,true,false)];return true
end function
// CG_FileExists
/// @param state Record read through `state.files`.
/// @param filename File name passed to the corresponding file/asset operation.
function fileExists(state,filename) for each file in state.files if file==filename then return true end if end for;return false end function
/// Evaluates client game players `teamSuffix` and returns `"default"`, `"blue"`, `"red"` according to its guard/selection conditions.
/// @param state Record read through `state.gametype`.
/// @param ci Client presentation information, including model and player identity. Record read through `ci.team`.
function teamSuffix(state,ci) if state.gametype<GT_TEAM then return "default" end if;if ci.team==TEAM_BLUE then return "blue" end if;return "red" end function
// CG_FindClientModelFile
/// @param state Shared client game players state passed to the helper calls in `findClientModelFile`.
/// @param ci Client presentation information, including model and player identity.
/// @param teamName Team name used for the menu or model selection.
/// @param modelName Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`.
/// @param skinName Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`.
/// @param base Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`.
/// @param ext Value used by `for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+...`.
function findClientModelFile(state,ci,teamName,modelName,skinName,base,ext)
  team=teamSuffix(state,ci);for each folder in ["","characters/"] for pass=0 to 1 prefix="";if pass==0 and teamName!="" then prefix=teamName end if;for each leaf in [base+"_"+skinName+"_"+team+"."+ext,base+"_"+team+"."+ext,base+"_"+skinName+"."+ext] path="models/players/"+folder+modelName+"/"+prefix+leaf;if fileExists(state,path) then return path end if end for;if teamName=="" then break end if end for end for;return void
end function
// CG_FindClientHeadFile
/// @param state Shared client game players state passed to the helper calls in `findClientHeadFile`.
/// @param ci Client presentation information, including model and player identity.
/// @param teamName Team name used for the menu or model selection.
/// @param headModelName Value used by `model=headModelName`.
/// @param headSkinName Value used by `for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="model...`.
/// @param base Value used by `for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="model...`.
/// @param ext Value used by `for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="model...`.
function findClientHeadFile(state,ci,teamName,headModelName,headSkinName,base,ext)
  heads="";model=headModelName;if strings.substr(model,0,1)=="*" then heads="heads/";model=strings.substr(model,1,len(model)-1) end if;team=teamSuffix(state,ci)
  for each folder in [heads,"heads/"] for pass=0 to 1 prefix="";if pass==0 and teamName!="" then prefix=teamName end if;for each leaf in [headSkinName+"/"+prefix+base+"_"+team+"."+ext,prefix+base+"_"+team+"."+ext,prefix+base+"_"+headSkinName+"."+ext] path="models/players/"+folder+model+"/"+leaf;if fileExists(state,path) then return path end if end for;if teamName=="" then break end if end for end for;return void
end function
// CG_RegisterClientSkin
/// @param state Shared client game players state passed to the helper calls in `registerClientSkin`.
/// @param ci Mutable client game players record/storage; this routine assigns `ci.legsSkin`, `ci.torsoSkin`, `ci.headSkin`.
/// @param teamName Team name used for the menu or model selection.
/// @param modelName Value used by `legs=findClientModelFile(state,ci,teamName,modelName,skinName,"lower","skin")`.
/// @param skinName Value used by `legs=findClientModelFile(state,ci,teamName,modelName,skinName,"lower","skin")`.
/// @param headModelName Value used by `head=findClientHeadFile(state,ci,teamName,headModelName,headSkinName,"head","skin")`.
/// @param headSkinName Value used by `head=findClientHeadFile(state,ci,teamName,headModelName,headSkinName,"head","skin")`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function registerClientSkin(state,ci,teamName,modelName,skinName,headModelName,headSkinName,retailActive)
  legs=findClientModelFile(state,ci,teamName,modelName,skinName,"lower","skin");torso=findClientModelFile(state,ci,teamName,modelName,skinName,"upper","skin");head=findClientHeadFile(state,ci,teamName,headModelName,headSkinName,"head","skin");if legs==void or torso==void or head==void then return false end if;ci.legsSkin=legs;ci.torsoSkin=torso;ci.headSkin=head;for each path in [legs,torso,head] effect(state,"renderer","register-skin",0,path,"",void,void,retailActive) end for;return true
end function
// CG_RegisterClientModelname
/// @param state Shared client game players state passed to the helper calls in `registerClientModelname`.
/// @param ci Mutable client game players record/storage; this routine assigns `ci.legsModel`, `ci.torsoModel`, `ci.headModel`, `ci.modelIcon` and additional values.
/// @param modelName Value used by `if headName=="" then headName=modelName end if`.
/// @param skinName Value used by `if not registerClientSkin(state,ci,teamName,modelName,skinName,headName,headSkinName,retailActive) then return false end if`.
/// @param headModelName Value used by `headName=headModelName`.
/// @param headSkinName Value used by `if not registerClientSkin(state,ci,teamName,modelName,skinName,headName,headSkinName,retailActive) then return false end if`.
/// @param teamName Team name used for the menu or model selection.
/// @param animationText Value used by `if not parseAnimationFile("models/players/"+modelName+"/animation.cfg",animationText,ci) then return false end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function registerClientModelname(state,ci,modelName,skinName,headModelName,headSkinName,teamName,animationText,retailActive)
  headName=headModelName;if headName=="" then headName=modelName end if;ci.legsModel="models/players/"+modelName+"/lower.md3";ci.torsoModel="models/players/"+modelName+"/upper.md3";if strings.substr(headName,0,1)=="*" then bare=strings.substr(headName,1,len(headName)-1);ci.headModel="models/players/heads/"+bare+"/"+bare+".md3" else ci.headModel="models/players/"+headName+"/head.md3" end if;for each path in [ci.legsModel,ci.torsoModel,ci.headModel] effect(state,"renderer","register-model",0,path,"",void,void,retailActive) end for;if not registerClientSkin(state,ci,teamName,modelName,skinName,headName,headSkinName,retailActive) then return false end if;if not parseAnimationFile("models/players/"+modelName+"/animation.cfg",animationText,ci) then return false end if;icon=findClientHeadFile(state,ci,teamName,headName,headSkinName,"icon","skin");if icon==void then icon=findClientHeadFile(state,ci,teamName,headName,headSkinName,"icon","tga") end if;if icon==void then return false end if;ci.modelIcon=icon;effect(state,"renderer","register-shader",0,icon,"",void,void,retailActive);ci.newAnims=true;return true
end function
// CG_ColorFromString
/// @param value Value used by `val=atoi(value)`.
function colorFromString(value) val=atoi(value);if val<1 or val>7 then return [1.0,1.0,1.0] end if;return [toFloat((val>>2)&1),toFloat((val>>1)&1),toFloat(val&1)] end function
// CG_LoadClientInfo
/// @param state Shared client game players state passed to the helper calls in `loadClientInfo`.
/// @param ci Mutable client game players record/storage; this routine assigns `ci.modelName`, `ci.skinName`, `ci.headModelName`, `ci.headSkinName` and additional values.
/// @param animationText Value used by `ok=registerClientModelname(state,ci,ci.modelName,ci.skinName,ci.headModelName,ci.headSkinName,"",animationText,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function loadClientInfo(state,ci,animationText,retailActive) ok=registerClientModelname(state,ci,ci.modelName,ci.skinName,ci.headModelName,ci.headSkinName,"",animationText,retailActive);if not ok then ci.modelName="sarge";ci.skinName="default";ci.headModelName="sarge";ci.headSkinName="default" end if;for i=0 to len(customSoundNames())-1 ci.sounds[i]="sound/player/"+ci.modelName+"/"+strings.substr(customSoundNames()[i],1,len(customSoundNames()[i])-1);effect(state,"audio","register-sound",0,ci.sounds[i],"",void,void,retailActive) end for;ci.deferred=false;return ok
end function
// CG_CopyClientInfoModel
/// @param sourceInfo Record read through `sourceInfo.footsteps`, `sourceInfo.gender`, `sourceInfo.headOffset`, `sourceInfo.fixedlegs` and additional values.
/// @param targetInfo Mutable client game players record/storage; this routine assigns `targetInfo.footsteps`, `targetInfo.gender`, `targetInfo.headOffset`, `targetInfo.fixedlegs` and additional values.
function copyClientInfoModel(sourceInfo,targetInfo) targetInfo.footsteps=sourceInfo.footsteps;targetInfo.gender=sourceInfo.gender;targetInfo.headOffset=sourceInfo.headOffset;targetInfo.fixedlegs=sourceInfo.fixedlegs;targetInfo.fixedtorso=sourceInfo.fixedtorso;targetInfo.legsModel=sourceInfo.legsModel;targetInfo.torsoModel=sourceInfo.torsoModel;targetInfo.headModel=sourceInfo.headModel;targetInfo.legsSkin=sourceInfo.legsSkin;targetInfo.torsoSkin=sourceInfo.torsoSkin;targetInfo.headSkin=sourceInfo.headSkin;targetInfo.modelIcon=sourceInfo.modelIcon;targetInfo.animations=sourceInfo.animations;targetInfo.sounds=sourceInfo.sounds;targetInfo.newAnims=sourceInfo.newAnims;return void end function
// CG_ScanForExistingClientInfo
/// @param state Record read through `state.clients`.
/// @param ci Mutable client game players record/storage; this routine assigns `ci.deferred`.
function scanForExistingClientInfo(state,ci) for each existing in state.clients if existing.infoValid and not existing.deferred and existing.modelName==ci.modelName and existing.skinName==ci.skinName and existing.headModelName==ci.headModelName and existing.headSkinName==ci.headSkinName and existing.team==ci.team then copyClientInfoModel(existing,ci);ci.deferred=false;return true end if end for;return false end function
// CG_SetDeferredClientInfo
/// @param state Record read through `state.clients`.
/// @param ci Mutable client game players record/storage; this routine assigns `ci.deferred`.
function setDeferredClientInfo(state,ci) if scanForExistingClientInfo(state,ci) then return false end if;for each existing in state.clients if existing.infoValid and not existing.deferred then copyClientInfoModel(existing,ci);ci.deferred=true;return true end if end for;ci.deferred=false;return false end function
// CG_NewClientInfo
/// @param state Mutable client game players record/storage; this routine assigns `state.clients[clientNum]`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param config Value used by `if config=="" then state.clients[clientNum]=clientInfo()`.
/// @param animationText Value used by `if not scanForExistingClientInfo(state,ci) then if deferPlayers then setDeferredClientInfo(state,ci) else loadClientInfo(state,ci,animationTex...`.
/// @param deferPlayers Value used by `if not scanForExistingClientInfo(state,ci) then if deferPlayers then setDeferredClientInfo(state,ci) else loadClientInfo(state,ci,animationTex...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function newClientInfo(state,clientNum,config,animationText,deferPlayers,retailActive)
  if clientNum<0 or clientNum>=MAX_CLIENTS then return false end if;if config=="" then state.clients[clientNum]=clientInfo();return false end if;ci=clientInfo();ci.name=info.value(config,"n");ci.team=atoi(info.value(config,"t"));model=info.value(config,"model");head=info.value(config,"hmodel");slash=strings.indexOf(model,"/",0);ci.modelName=model;ci.skinName="default";if slash>=0 then ci.modelName=strings.substr(model,0,slash);ci.skinName=strings.substr(model,slash+1,len(model)-slash-1) end if;slash=strings.indexOf(head,"/",0);ci.headModelName=head;ci.headSkinName="default";if slash>=0 then ci.headModelName=strings.substr(head,0,slash);ci.headSkinName=strings.substr(head,slash+1,len(head)-slash-1) end if;ci.color1=colorFromString(info.value(config,"c1"));ci.color2=colorFromString(info.value(config,"c2"));ci.infoValid=true;if not scanForExistingClientInfo(state,ci) then if deferPlayers then setDeferredClientInfo(state,ci) else loadClientInfo(state,ci,animationText,retailActive) end if end if;state.clients[clientNum]=ci;return true
end function
// CG_LoadDeferredPlayers
/// @param state Record read through `state.clients`.
/// @param animationText Value used by `for each ci in state.clients if ci.infoValid and ci.deferred then if lowMemory then ci.deferred=false else loadClientInfo(state,ci,animationTe...`.
/// @param lowMemory Value used by `for each ci in state.clients if ci.infoValid and ci.deferred then if lowMemory then ci.deferred=false else loadClientInfo(state,ci,animationTe...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function loadDeferredPlayers(state,animationText,lowMemory,retailActive) loaded=0;for each ci in state.clients if ci.infoValid and ci.deferred then if lowMemory then ci.deferred=false else loadClientInfo(state,ci,animationText,retailActive);loaded=loaded+1 end if end if end for;return loaded end function

// CG_SetLerpFrameAnimation
/// @param ci Client presentation information, including model and player identity. Record read through `ci.animations`.
/// @param lf Mutable client game players record/storage; this routine assigns `lf.animationNumber`, `lf.animation`, `lf.animationTime`.
/// @param newAnimation Value assigned to `lf.animationNumber`.
function setLerpFrameAnimation(ci,lf,newAnimation) lf.animationNumber=newAnimation;index=newAnimation & ~ANIM_TOGGLEBIT;if index<0 or index>=len(ci.animations) then return error(7851,"Bad animation number: "+str(index)) end if;lf.animation=ci.animations[index];lf.animationTime=lf.frameTime+lf.animation.initialLerp;return index end function
// CG_RunLerpFrame
/// @param state Record read through `state.animSpeed`, `state.time`.
/// @param ci Client presentation information, including model and player identity.
/// @param lf Mutable client game players record/storage; this routine assigns `lf.oldFrame`, `lf.frame`, `lf.backlerp`, `lf.oldFrameTime` and additional values.
/// @param newAnimation Value used by `if newAnimation!=lf.animationNumber or lf.animation==void then setLerpFrameAnimation(ci,lf,newAnimation) end if`.
/// @param speedScale Value used by `f=n.trunc32((lf.frameTime-lf.animationTime)/anim.frameLerp*speedScale)`.
function runLerpFrame(state,ci,lf,newAnimation,speedScale)
  if state.animSpeed==0 then lf.oldFrame=0;lf.frame=0;lf.backlerp=0.0;return 0 end if;if newAnimation!=lf.animationNumber or lf.animation==void then setLerpFrameAnimation(ci,lf,newAnimation) end if;if state.time>=lf.frameTime then lf.oldFrame=lf.frame;lf.oldFrameTime=lf.frameTime;anim=lf.animation;if anim.frameLerp==0 then return lf.frame end if;if state.time<lf.animationTime then lf.frameTime=lf.animationTime else lf.frameTime=lf.oldFrameTime+anim.frameLerp end if;f=n.trunc32((lf.frameTime-lf.animationTime)/anim.frameLerp*speedScale);frames=anim.numFrames;if anim.flipflop then frames=frames*2 end if;if f>=frames then f=f-frames;if anim.loopFrames>0 then f=(f%anim.loopFrames)+anim.numFrames-anim.loopFrames else f=frames-1;lf.frameTime=state.time end if end if;if anim.reversed then lf.frame=anim.firstFrame+anim.numFrames-1-f else if anim.flipflop and f>=anim.numFrames then lf.frame=anim.firstFrame+anim.numFrames-1-(f%anim.numFrames) else lf.frame=anim.firstFrame+f end if;if state.time>lf.frameTime then lf.frameTime=state.time end if end if;if lf.frameTime>state.time+200 then lf.frameTime=state.time end if;if lf.oldFrameTime>state.time then lf.oldFrameTime=state.time end if;if lf.frameTime==lf.oldFrameTime then lf.backlerp=0.0 else lf.backlerp=1.0-(state.time-lf.oldFrameTime)/(lf.frameTime-lf.oldFrameTime) end if;return lf.frame
end function
// CG_ClearLerpFrame
/// @param state Record read through `state.time`.
/// @param ci Client presentation information, including model and player identity.
/// @param lf Mutable client game players record/storage; this routine assigns `lf.frameTime`, `lf.oldFrameTime`, `lf.oldFrame`, `lf.frame`.
/// @param animationNumber Value used by `setLerpFrameAnimation(ci,lf,animationNumber)`.
function clearLerpFrame(state,ci,lf,animationNumber) lf.frameTime=state.time;lf.oldFrameTime=state.time;setLerpFrameAnimation(ci,lf,animationNumber);lf.oldFrame=lf.animation.firstFrame;lf.frame=lf.animation.firstFrame;return void end function
// CG_PlayerAnimation
/// @param state Record read through `state.noPlayerAnims`, `state.clients`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.clientNum`, `cent.legsAnim`, `cent.legs.yawing` and additional values.
function playerAnimation(state,cent) if state.noPlayerAnims then return [0,0,0.0,0,0,0.0] end if;scale=1.0;if bit(cent.powerups,PW_HASTE) then scale=1.5 end if;ci=state.clients[cent.clientNum];legsAnim=cent.legsAnim;if cent.legs.yawing and (legsAnim & ~ANIM_TOGGLEBIT)==LEGS_IDLE then legsAnim=LEGS_TURN end if;runLerpFrame(state,ci,cent.legs,legsAnim,scale);runLerpFrame(state,ci,cent.torso,cent.torsoAnim,scale);return [cent.legs.oldFrame,cent.legs.frame,cent.legs.backlerp,cent.torso.oldFrame,cent.torso.frame,cent.torso.backlerp] end function
/// Computes `(360.0/65536.0)*toFloat(n.trunc32(value*(65536.0/360.0))&65535)` for client game players `angleMod`.
/// @param value Value used by `return (360.0/65536.0)*toFloat(n.trunc32(value*(65536.0/360.0))&65535)`.
function angleMod(value) return (360.0/65536.0)*toFloat(n.trunc32(value*(65536.0/360.0))&65535) end function
/// Evaluates client game players `angleSubtract` and returns `effect` according to its guard/selection conditions.
/// @param a Value used by `effect=a-b`.
/// @param b Value used by `effect=a-b`.
function angleSubtract(a,b) effect=a-b;while effect>180.0 effect=effect-360.0 end while;while effect<-180.0 effect=effect+360.0 end while;return effect end function
/// Evaluates client game players `absolute` and returns `0-value`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<0` before the calculation continues.
function absolute(value) if value<0 then return 0-value end if;return value end function
// CG_SwingAngles
/// @param frameTime Value used by `move=frameTime*scale*speed`.
/// @param destination Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`.
/// @param swingTolerance Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`.
/// @param clampTolerance Value used by `if remaining>clampTolerance then angle=angleMod(destination-(clampTolerance-1)) else if remaining<0.0-clampTolerance then angle=angleMod(desti...`.
/// @param speed Value used by `move=frameTime*scale*speed`.
/// @param angle Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`.
/// @param swinging Value used by `if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=tru...`.
function swingAngles(frameTime,destination,swingTolerance,clampTolerance,speed,angle,swinging) if not swinging and (angleSubtract(angle,destination)>swingTolerance or angleSubtract(angle,destination)<0.0-swingTolerance) then swinging=true end if;if not swinging then return [angle,false] end if;swing=angleSubtract(destination,angle);scale=2.0;if absolute(swing)<swingTolerance*0.5 then scale=0.5 else if absolute(swing)<swingTolerance then scale=1.0 end if;move=frameTime*scale*speed;if swing<0 then move=0.0-move end if;if (swing>=0 and move>=swing) or (swing<0 and move<=swing) then move=swing;swinging=false end if;angle=angleMod(angle+move);remaining=angleSubtract(destination,angle);if remaining>clampTolerance then angle=angleMod(destination-(clampTolerance-1)) else if remaining<0.0-clampTolerance then angle=angleMod(destination+(clampTolerance-1)) end if;return [angle,swinging] end function
// CG_AddPainTwitch
/// @param state Record read through `state.time`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.painTime`, `cent.painDirection`.
/// @param torsoAngles Mutable sequence; this routine writes `torsoAngles[2]`.
function addPainTwitch(state,cent,torsoAngles) elapsed=state.time-cent.painTime;if elapsed>=PAIN_TWITCH_TIME then return torsoAngles end if;amount=20.0*(1.0-elapsed/PAIN_TWITCH_TIME);if cent.painDirection!=0 then torsoAngles[2]=torsoAngles[2]+amount else torsoAngles[2]=torsoAngles[2]-amount end if;return torsoAngles end function
// CG_PlayerAngles
/// @param state Shared client game players state passed to the helper calls in `playerAngles`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.eFlags`, `cent.angles`.
function playerAngles(state,cent) offsets=[0,22,45,-22,0,22,-45,-22];direction=0;if (cent.eFlags & EF_DEAD)==0 then direction=n.trunc32(cent.angles[1]);if direction<0 or direction>7 then return error(7852,"Bad player movement angle") end if end if;head=[cent.angles[0],angleMod(cent.angles[1]),cent.angles[2]];legs=[0.0,head[1]+offsets[direction],0.0];torso=[head[0]*0.75,head[1]+0.25*offsets[direction],0.0];torso=addPainTwitch(state,cent,torso);return [legs,torso,head] end function
// CG_HasteTrail
/// @param state Record read through `state.time`.
/// @param cent Mutable client game players record/storage; this routine assigns `cent.trailTime`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function hasteTrail(state,cent,retailActive) anim=cent.legs.animationNumber & ~ANIM_TOGGLEBIT;if cent.trailTime>state.time or (anim!=LEGS_RUN and anim!=LEGS_BACK) then return false end if;cent.trailTime=cent.trailTime+100;if cent.trailTime<state.time then cent.trailTime=state.time end if;origin=[cent.origin[0],cent.origin[1],cent.origin[2]-16.0];effect(state,"scene","smoke-puff",cent.number,"haste",500,origin,[1.0,1.0,1.0,1.0],retailActive);return true end function
// CG_BreathPuffs
/// @param state Record read through `state.clients`, `state.enableBreath`, `state.localClientNum`, `state.renderingThirdPerson` and additional values.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.clientNum`, `cent.number`, `cent.eFlags`.
/// @param headOrigin Value used by `effect(state,"scene","smoke-puff",cent.number,"breath",1500,headOrigin,[1.0,1.0,1.0,0.66],retailActive)`.
/// @param contents Value used by `if not state.enableBreath or (cent.number==state.localClientNum and not state.renderingThirdPerson) or (cent.eFlags & EF_DEAD)!=0 or (contents...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function breathPuffs(state,cent,headOrigin,contents,retailActive) ci=state.clients[cent.clientNum];if not state.enableBreath or (cent.number==state.localClientNum and not state.renderingThirdPerson) or (cent.eFlags & EF_DEAD)!=0 or (contents & 56)!=0 or ci.breathPuffTime>state.time then return false end if;ci.breathPuffTime=state.time+2000;effect(state,"scene","smoke-puff",cent.number,"breath",1500,headOrigin,[1.0,1.0,1.0,0.66],retailActive);return true end function
// CG_DustTrail
/// @param state Record read through `state.enableDust`, `state.time`.
/// @param cent Mutable client game players record/storage; this routine assigns `cent.dustTrailTime`.
/// @param trace Record read through `trace.surfaceFlags`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function dustTrail(state,cent,trace,retailActive) anim=cent.legs.animationNumber & ~ANIM_TOGGLEBIT;if not state.enableDust or cent.dustTrailTime>state.time or (anim!=LEGS_LANDB and anim!=LEGS_LAND) or (trace.surfaceFlags & 0x40000)==0 then return false end if;cent.dustTrailTime=state.time+40;effect(state,"scene","smoke-puff",cent.number,"dust",500,[cent.origin[0],cent.origin[1],cent.origin[2]-16.0],[0.8,0.8,0.7,0.33],retailActive);return true end function
// CG_TrailItem
/// @param state Shared client game players state passed to the helper calls in `trailItem`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.number`, `cent.origin`.
/// @param model Model handle, asset or preview record used by this client game players operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function trailItem(state,cent,model,retailActive) effect(state,"scene","trail-item",cent.number,model,"tag_back",[cent.origin[0],cent.origin[1],cent.origin[2]+16.0],void,retailActive);return void end function
// CG_PlayerFlag
/// @param state Record read through `state.clients`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.legsAnim`, `cent.clientNum`, `cent.flag`, `cent.number` and additional values.
/// @param skin Value used by `effect(state,"scene","tagged-model",cent.number,"flag-flap",skin,cent.origin,void,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerFlag(state,cent,skin,retailActive) anim=FLAG_RUN;legs=cent.legsAnim & ~ANIM_TOGGLEBIT;if legs==LEGS_IDLE or legs==LEGS_IDLECR or legs==LEGS_WALK or legs==LEGS_WALKCR then anim=FLAG_STAND end if;runLerpFrame(state,state.clients[cent.clientNum],cent.flag,anim,1.0);effect(state,"scene","tagged-model",cent.number,"flag-pole","tag_flag",cent.origin,void,retailActive);effect(state,"scene","tagged-model",cent.number,"flag-flap",skin,cent.origin,void,retailActive);return void end function
// CG_PlayerTokens
/// @param state Shared client game players state passed to the helper calls in `playerTokens`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.generic1`, `cent.number`, `cent.origin`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerTokens(state,cent,retailActive) count=cent.generic1;if count>16 then count=16 end if;for i=0 to count-1 effect(state,"scene","token",cent.number,"skull",str(i),[cent.origin[0],cent.origin[1],cent.origin[2]+10.0],void,retailActive) end for;return count end function
// CG_PlayerPowerups
/// @param state Record read through `state.clients`, `state.actions`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.number`, `cent.origin`, `cent.clientNum`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerPowerups(state,cent,retailActive) if cent.powerups==0 then return 0 end if;if bit(cent.powerups,PW_QUAD) then effect(state,"renderer","light",cent.number,"quad",200,cent.origin,[0.2,0.2,1.0],retailActive) end if;if bit(cent.powerups,PW_FLIGHT) then effect(state,"audio","loop",cent.number,"flight","",cent.origin,void,retailActive) end if;for each flag in [[PW_REDFLAG,"red"],[PW_BLUEFLAG,"blue"],[PW_NEUTRALFLAG,"neutral"]] if bit(cent.powerups,flag[0]) then if state.clients[cent.clientNum].newAnims then playerFlag(state,cent,flag[1],retailActive) else trailItem(state,cent,flag[1]+"-flag",retailActive) end if;effect(state,"renderer","light",cent.number,flag[1],200,cent.origin,void,retailActive) end if end for;if bit(cent.powerups,PW_HASTE) then hasteTrail(state,cent,retailActive) end if;return len(state.actions) end function
// CG_PlayerFloatSprite
/// @param state Shared client game players state passed to the helper calls in `playerFloatSprite`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.number`, `cent.origin`.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerFloatSprite(state,cent,shader,retailActive) effect(state,"scene","sprite",cent.number,shader,10,[cent.origin[0],cent.origin[1],cent.origin[2]+48.0],[1.0,1.0,1.0,1.0],retailActive);return true end function
// CG_PlayerSprites
/// @param state Record read through `state.gametype`, `state.clients`, `state.drawFriend`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.eFlags`, `cent.clientNum`.
/// @param localTeam Value used by `if (cent.eFlags & EF_DEAD)==0 and state.gametype>=GT_TEAM and state.clients[cent.clientNum].team==localTeam and state.drawFriend then return p...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerSprites(state,cent,localTeam,retailActive) choices=[[EF_CONNECTION,"connection"],[EF_TALK,"balloon"],[EF_AWARD_IMPRESSIVE,"medal-impressive"],[EF_AWARD_EXCELLENT,"medal-excellent"],[EF_AWARD_GAUNTLET,"medal-gauntlet"],[EF_AWARD_DEFEND,"medal-defend"],[EF_AWARD_ASSIST,"medal-assist"],[EF_AWARD_CAP,"medal-capture"]];for each choice in choices if (cent.eFlags & choice[0])!=0 then return playerFloatSprite(state,cent,choice[1],retailActive) end if end for;if (cent.eFlags & EF_DEAD)==0 and state.gametype>=GT_TEAM and state.clients[cent.clientNum].team==localTeam and state.drawFriend then return playerFloatSprite(state,cent,"friend",retailActive) end if;return false end function
// CG_PlayerShadow
/// @param state Record read through `state.shadows`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.number`.
/// @param trace Record read through `trace.fraction`, `trace.startsolid`, `trace.allsolid`, `trace.endpos`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerShadow(state,cent,trace,retailActive) if state.shadows==0 or bit(cent.powerups,PW_INVIS) or trace.fraction==1.0 or trace.startsolid or trace.allsolid then return void end if;plane=trace.endpos[2]+1.0;if state.shadows==1 then effect(state,"scene","impact-mark",cent.number,"shadow",1.0-trace.fraction,trace.endpos,[1.0-trace.fraction,1.0-trace.fraction,1.0-trace.fraction,1.0],retailActive) end if;return plane end function
// CG_PlayerSplash
/// @param state Record read through `state.shadows`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.number`.
/// @param feetContents Value used by `if state.shadows==0 or (feetContents&56)==0 or (headContents&57)!=0 or trace.fraction==1.0 then return false end if`.
/// @param headContents Value used by `if state.shadows==0 or (feetContents&56)==0 or (headContents&57)!=0 or trace.fraction==1.0 then return false end if`.
/// @param trace Record read through `trace.fraction`, `trace.endpos`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerSplash(state,cent,feetContents,headContents,trace,retailActive) if state.shadows==0 or (feetContents&56)==0 or (headContents&57)!=0 or trace.fraction==1.0 then return false end if;effect(state,"scene","wake-poly",cent.number,"wake",4,trace.endpos,[1.0,1.0,1.0,1.0],retailActive);return true end function
// CG_AddRefEntityWithPowerups
/// @param state Record read through `state.time`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.powerups`, `cent.number`, `cent.origin`.
/// @param team Value used by `if team==TEAM_RED then shader="red-quad" end if`.
/// @param part Value used by `if bit(cent.powerups,PW_INVIS) then effect(state,"scene","model",cent.number,part,"invis",cent.origin,void,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function addRefEntityWithPowerups(state,cent,team,part,retailActive) if bit(cent.powerups,PW_INVIS) then effect(state,"scene","model",cent.number,part,"invis",cent.origin,void,retailActive);return 1 end if;count=1;effect(state,"scene","model",cent.number,part,"base",cent.origin,void,retailActive);if bit(cent.powerups,PW_QUAD) then shader="quad";if team==TEAM_RED then shader="red-quad" end if;effect(state,"scene","model",cent.number,part,shader,cent.origin,void,retailActive);count=count+1 end if;if bit(cent.powerups,PW_REGEN) and ((state.time/100)%10)==1 then effect(state,"scene","model",cent.number,part,"regen",cent.origin,void,retailActive);count=count+1 end if;if bit(cent.powerups,PW_BATTLESUIT) then effect(state,"scene","model",cent.number,part,"battlesuit",cent.origin,void,retailActive);count=count+1 end if;return count end function
// CG_LightVerts
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param vertices Value used by `for each vertex in vertices color=[]`.
/// @param ambient Sequence read at `ambient[i]`.
/// @param directed Sequence read at `directed[i]`.
/// @param lightDir Sequence read at `lightDir[0]`, `lightDir[1]`, `lightDir[2]`.
function lightVerts(normal,vertices,ambient,directed,lightDir) incoming=normal[0]*lightDir[0]+normal[1]*lightDir[1]+normal[2]*lightDir[2];for each vertex in vertices color=[];for i=0 to 2 value=ambient[i];if incoming>0 then value=value+incoming*directed[i] end if;if value>255 then value=255 end if;color=color+[n.trunc32(value)] end for;vertex.color=color+[255] end for;return true end function
// CG_Player
/// @param state Mutable client game players record/storage; this routine assigns `state.actions`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.clientNum`, `cent.number`, `cent.origin`.
/// @param localTeam Value used by `playerSprites(state,cent,localTeam,retailActive)`.
/// @param shadowTrace Value used by `shadow=playerShadow(state,cent,shadowTrace,retailActive)`.
/// @param feetContents Value used by `playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive)`.
/// @param headContents Value used by `playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive)`.
/// @param splashTrace Value used by `playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function player(state,cent,localTeam,shadowTrace,feetContents,headContents,splashTrace,retailActive) if cent.clientNum<0 or cent.clientNum>=MAX_CLIENTS then return error(7853,"Bad clientNum on player entity") end if;ci=state.clients[cent.clientNum];if not ci.infoValid then return false end if;state.actions=[];playerSprites(state,cent,localTeam,retailActive);shadow=playerShadow(state,cent,shadowTrace,retailActive);playerSplash(state,cent,feetContents,headContents,splashTrace,retailActive);frames=playerAnimation(state,cent);playerAngles(state,cent);for each part in ["legs","torso","head"] addRefEntityWithPowerups(state,cent,ci.team,part,retailActive) end for;effect(state,"scene","tag-attach",cent.number,"torso","tag_torso",cent.origin,void,retailActive);effect(state,"scene","tag-attach",cent.number,"head","tag_head",cent.origin,void,retailActive);playerPowerups(state,cent,retailActive);return true end function
// CG_ResetPlayerEntity
/// @param state Record read through `state.clients`, `state.time`.
/// @param cent Mutable client game players record/storage; this routine assigns `cent.legs`, `cent.torso`, `cent.flag`, `cent.trailTime`.
function resetPlayerEntity(state,cent) cent.legs=lerpFrame();cent.torso=lerpFrame();cent.flag=lerpFrame();clearLerpFrame(state,state.clients[cent.clientNum],cent.legs,cent.legsAnim);clearLerpFrame(state,state.clients[cent.clientNum],cent.torso,cent.torsoAnim);cent.trailTime=state.time;return void end function
