// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_draw.c.  Rendering, tracing, sound and
// menu calls are represented as typed boundary actions so this module can run
// as an observer beside the authoritative retail cgame QVM.
package mq3.client.cgame_draw

import mq3.compat.numeric as n

/// Native team identifier for free, used by player and team presentation.
const TEAM_FREE=0
/// Native team identifier for red, used by player and team presentation.
const TEAM_RED=1
/// Native team identifier for blue, used by player and team presentation.
const TEAM_BLUE=2
/// Native team identifier for spectator, used by player and team presentation.
const TEAM_SPECTATOR=3
/// Native game-type identifier selecting free-for-all deathmatch.
const GT_FFA=0
/// Native game-type value for one-on-one tournament play, used when choosing team, tournament, and
/// single-player HUD presentation.
const GT_TOURNAMENT=1
/// Native game-type value for single-player arena progression, used when choosing team, tournament, and
/// single-player HUD presentation.
const GT_SINGLE_PLAYER=2
/// Native game-type value for team deathmatch, used when choosing team, tournament, and single-player
/// HUD presentation.
const GT_TEAM=3
/// Native game-type value for capture the flag, used when choosing team, tournament, and single-player
/// HUD presentation.
const GT_CTF=4
/// Player-movement mode selecting intermission input and physics behavior.
const PM_INTERMISSION=5
/// Player-movement state flag indicating follow.
const PMF_FOLLOW=0x1000
/// Player-movement state flag indicating scoreboard.
const PMF_SCOREBOARD=0x2000
/// Snapshot flag indicating that rate limiting delayed the snapshot.
const SNAPFLAG_RATE_DELAYED=1
/// Capacity limit for the clients collection or bounded storage used by this client module.
const MAX_CLIENTS=64
/// Capacity limit for the locations collection or bounded storage used by this client module.
const MAX_LOCATIONS=64
/// Number of frame or packet samples retained by the lagometer history.
const LAG_SAMPLES=128
/// Duration in milliseconds of a server or team vote.
const VOTE_TIME=30000
/// Duration in milliseconds of the standard CGame presentation fade.
const FADE_TIME=200
/// Bigchar font metric controlling width in virtual UI coordinates.
const BIGCHAR_WIDTH=16
/// Bigchar font metric controlling height in virtual UI coordinates.
const BIGCHAR_HEIGHT=16
/// Width of a giant-font character in virtual screen coordinates.
const GIANT_WIDTH=32
/// Height of a giant-font character in virtual screen coordinates.
const GIANT_HEIGHT=48
/// Tinychar font metric controlling width in virtual UI coordinates.
const TINYCHAR_WIDTH=8
/// Tinychar font metric controlling height in virtual UI coordinates.
const TINYCHAR_HEIGHT=8
/// Default square HUD icon size in virtual screen coordinates.
const ICON_SIZE=48
/// Duration in milliseconds of the pickup-icon emphasis effect.
const ITEM_BLOB_TIME=200
/// Milliseconds for which the latest attacker's head icon is displayed.
const ATTACKER_HEAD_TIME=10000

/// Stores client game draw queued engine action, including `kind`, `x`, `y`, `width`, `height`, `text` and additional values.
struct Action
  /// Operation selector telling the host how to interpret a request emitted while drawing status
  /// indicators, crosshairs, votes, and timed HUD feedback.
  kind
  /// Horizontal coordinate of a base-game HUD drawing request in the virtual screen layout.
  x
  /// Vertical coordinate of a base-game HUD drawing request in the virtual screen layout.
  y
  /// Width of the image, bar, or rectangle requested by this HUD action.
  width
  /// Height of the image, bar, or rectangle requested by this HUD action.
  height
  /// HUD string to draw, or serialized texture coordinates when the action describes a font glyph.
  text
  /// Image material selected by a HUD picture or textured-rectangle action.
  shader
  /// RGBA tint associated with this HUD text, image, or fill request.
  color
  /// Value payload supplied to the selected host operation while drawing status indicators, crosshairs,
  /// votes, and timed HUD feedback.
  value
  /// Player slot associated with this score or client-side record.
  client
  /// True when this request is marked for native dispatch while drawing status indicators, crosshairs,
  /// votes, and timed HUD feedback; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game draw glyph record, including `xSkip`, `height`, `imageWidth`, `imageHeight`, `top`, `s` and additional values.
struct Glyph
  /// Horizontal pen advance applied after drawing this font glyph.
  xSkip
  /// Unscaled font-metric height used to size the rendered HUD glyph quad.
  height
  /// Width of the glyph's image region in the font atlas.
  imageWidth
  /// Height of the glyph's image region in the font atlas.
  imageHeight
  /// Top boundary of the interactive or clipped region.
  top
  /// Left texture coordinate of this glyph's region in the font atlas.
  s
  /// Top texture coordinate of this glyph's region in the font atlas.
  t
  /// Right texture coordinate of this glyph's region in the font atlas.
  s2
  /// Bottom texture coordinate of this glyph's region in the font atlas.
  t2
  /// Font atlas material used to render this glyph with its stored texture coordinates.
  shader
end struct
/// Stores client game draw client record, including `name`, `team`, `infoValid`, `health`, `armor`, `location` and additional values.
struct Client
  /// Player display name available to the ordinary HUD and team-overlay drawing code.
  name
  /// Reported team membership used to include this client in the local team overlay.
  team
  /// True when the client-information entry has been populated from valid server data.
  infoValid
  /// Health reported for this teammate and displayed in the team overlay.
  health
  /// Armor reported for this teammate and shown beside health in the team overlay.
  armor
  /// When constructing this record, `client` supplies `0` for this member.
  location
  /// Native weapon identifier reported for this teammate and used by the team-overlay weapon icon.
  weapon
  /// Player powerup bitmask used by HUD and team-overlay icon rendering.
  powerups
  /// True while the player's full media registration is deferred to a later load step.
  deferred
  /// Head-model resource used when drawing a player, head icon, or preview.
  headModel
  /// Skin resource applied to the player's head model.
  headSkin
  /// Image or shader resource used to draw the model icon.
  modelIcon
end struct
/// Stores client game draw powerup record, including `expires`, `icon`.
struct Powerup
  /// When constructing this record, `powerup` supplies `expires` for this member.
  expires
  /// When constructing this record, `powerup` supplies `icon` for this member.
  icon
end struct
/// Stores client game draw trace result record, including `entityNum`, `fog`, `invisible`.
struct TraceResult
  /// Entity identifier hit by the crosshair trace, used to select a player-name display.
  entityNum
  /// True when fog obscures the crosshair trace and player-name identification should be suppressed.
  fog
  /// True when the traced entity is invisible and should not reveal its player name.
  invisible
end struct
/// Stores client game draw lagometer record, including `frameSamples`, `snapshotSamples`, `snapshotFlags`, `frameCount`, `snapshotCount`.
struct Lagometer
  /// When constructing this record, `lagometer` supplies an empty list for this member.
  frameSamples
  /// When constructing this record, `lagometer` supplies an empty list for this member.
  snapshotSamples
  /// When constructing this record, `lagometer` supplies an empty list for this member.
  snapshotFlags
  /// When constructing this record, `lagometer` supplies `0` for this member.
  frameCount
  /// When constructing this record, `lagometer` supplies `0` for this member.
  snapshotCount
end struct
/// Stores client game draw state, including `time`, `levelStartTime`, `serverTime`, `latestSnapshotNum`, `serverCommandSequence`, `team` and additional values.
struct State
  /// Client-game timestamp in milliseconds used to animate and expire HUD indicators.
  time
  /// Server timestamp at which the level began, used by elapsed-match-time displays.
  levelStartTime
  /// Server snapshot time in milliseconds displayed in the HUD snapshot diagnostic line.
  serverTime
  /// Sequence number of the latest snapshot received from the engine.
  latestSnapshotNum
  /// Reliable server-command sequence shown by the HUD snapshot diagnostic display.
  serverCommandSequence
  /// Local-player team membership used to select HUD colors, teammate rows, and spectator presentation.
  team
  /// Game-rule identifier selecting team overlays, score layout, and spectator HUD instructions.
  gametype
  /// Client slot of the player whose HUD and head are displayed, including a followed player.
  clientNum
  /// Local-player health used by the main HUD status, crosshair, and spectator decisions.
  health
  /// Local-player armor used by the main HUD status bar and health-color calculations.
  armor
  /// Ammunition quantity or ammunition state associated with the selected weapon.
  ammo
  /// Native identifier of the local-player weapon shown by the main HUD ammo and weapon indicators.
  weapon
  /// Compatibility weapon-timing slot initialized to zero; the current HUD drawing paths do not consult
  /// it.
  weaponTime
  /// When constructing this record, `state` supplies `false` for this member.
  weaponFiring
  /// True while the player explicitly requests the scoreboard overlay.
  showScores
  /// True while producing the menu screenshot for the current level.
  levelShot
  /// When constructing this record, `state` supplies `true` for this member.
  draw2D
  /// When constructing this record, `state` supplies `true` for this member.
  drawStatus
  /// Image or shader resources used to draw the draw icon.
  drawIcons
  /// Image or shader resources used to draw the draw3d icon.
  draw3dIcons
  /// When constructing this record, `state` supplies `1` for this member.
  drawCrosshair
  /// When constructing this record, `state` supplies `true` for this member.
  drawCrosshairNames
  /// When constructing this record, `state` supplies `true` for this member.
  crosshairHealth
  /// True while the camera uses a third-person, chase, or death view.
  renderingThirdPerson
  /// When constructing this record, `state` supplies `32.0` for this member.
  crosshairSize
  /// Horizontal crosshair offset from the center of the active view rectangle.
  crosshairX
  /// Vertical crosshair offset from the center of the active view rectangle.
  crosshairY
  /// Independent timestamp for the pickup pulse around the crosshair.
  itemPickupBlendTime
  /// Client slot most recently identified under the crosshair.
  crosshairClientNum
  /// Timestamp of the last valid crosshair-player identification.
  crosshairClientTime
  /// Timestamp used to time the latest attacker's HUD indication.
  attackerTime
  /// Client slot of the last attacker whose portrait and name can appear in the HUD.
  attackerNum
  /// Warmup deadline or state supplied by the server's warmup configuration.
  warmup
  /// Last warmup countdown value announced to the player.
  warmupCount
  /// Ammunition-warning state: one means low ammunition and two means empty.
  lowAmmoWarning
  /// True while the scoreboard is actually being rendered.
  scoreBoardShowing
  /// Start time of the active vote in milliseconds; zero suppresses the vote display.
  voteTime
  /// True when vote information changed and the UI should refresh or play feedback.
  voteModified
  /// When constructing this record, `state` supplies an empty string for this member.
  voteString
  /// Number of affirmative votes displayed for the current server vote.
  voteYes
  /// Number of negative votes displayed for the current server vote.
  voteNo
  /// When constructing this record, `state` supplies `[0,0]` for this member.
  teamVoteTime
  /// Per-team indicators that team-vote information changed.
  teamVoteModified
  /// When constructing this record, `state` supplies `["",""]` for this member.
  teamVoteString
  /// When constructing this record, `state` supplies `[0,0]` for this member.
  teamVoteYes
  /// When constructing this record, `state` supplies `[0,0]` for this member.
  teamVoteNo
  /// Player movement mode used to select death, intermission, and ordinary HUD presentation.
  pmType
  /// Player movement flags used for follow-mode text and spectator or scoreboard presentation.
  pmFlags
  /// When constructing this record, `state` supplies `false` for this member.
  noPredict
  /// When constructing this record, `state` supplies `false` for this member.
  synchronous
  /// When constructing this record, `state` supplies `0.4` for this member.
  stereoSeparation
  /// Left coordinate of the active view rectangle used to position the crosshair and tiled border.
  refX
  /// Top coordinate of the active view rectangle used to position the crosshair and tiled border.
  refY
  /// When constructing this record, `state` supplies `640` for this member.
  refWidth
  /// When constructing this record, `state` supplies `480` for this member.
  refHeight
  /// Text of the current centered announcement.
  centerPrint
  /// Client timestamp at which the current centered announcement began.
  centerPrintTime
  /// Vertical display position of the centered announcement.
  centerPrintY
  /// Character width selected for the centered announcement.
  centerPrintCharWidth
  /// Number of lines in the centered announcement.
  centerPrintLines
  /// Timestamp used to schedule the current voice announcement or portrait.
  voiceTime
  /// Previous FPS sampling timestamp in milliseconds, retained to measure the next HUD frame interval.
  frameTime
  /// When constructing this record, `state` supplies `[0,0,0,0]` for this member.
  previousFrameTimes
  /// Total FPS samples collected; modulo four selects the next frame-duration history slot.
  fpsIndex
  /// Client information indexed by player slot for HUD heads, names, and team-overlay entries.
  clients
  /// When constructing this record, `state` supplies an empty list for this member.
  locations
  /// When constructing this record, `state` supplies an empty list for this member.
  sortedTeamPlayers
  /// Powerup display entries carrying expiry times and icons for the local HUD countdown list.
  powerups
  /// When constructing this record, `state` supplies `lagometer()` for this member.
  lag
  /// Host requests queued while drawing status indicators, crosshairs, votes, and timed HUD feedback,
  /// retained in request order.
  actions
  /// When constructing this record, `state` supplies `0` for this member. Used by `publish` during
  /// subsequent processing.
  emitted
  /// Number of requests withheld from native dispatch while drawing status indicators, crosshairs,
  /// votes, and timed HUD feedback because the retail QVM owns their effects.
  suppressed
end struct

/// Creates a `mq3.client.cgame_draw.Action` record. Assigns `kind` from `kind`, `x` from `x`, `y` from `y`, `width` from `width`.
/// @param kind Value used to initialize `Action.kind`.
/// @param x Value used to initialize `Action.x`.
/// @param y Value used to initialize `Action.y`.
/// @param width Value used to initialize `Action.width`.
/// @param height Value used to initialize `Action.height`.
/// @param text Value used to initialize `Action.text`.
/// @param shader Value used to initialize `Action.shader`.
/// @param color Value used to initialize `Action.color`.
/// @param value Value used to initialize `Action.value`.
/// @param client Value used to initialize `Action.client`.
function action(kind,x,y,width,height,text,shader,color,value,client) return Action(kind,x,y,width,height,text,shader,color,value,client,false) end function
/// Updates `command.dispatched`, `state.actions`, `state.emitted`, `state.suppressed` during client game draw `publish`.
/// @param state Mutable client game draw record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`.
/// @param command Mutable client game draw record/storage; this routine assigns `command.dispatched`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function publish(state,command,retailActive) command.dispatched=not retailActive;state.actions=state.actions+[command];if command.dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if;return command end function
/// Creates a `mq3.client.cgame_draw.Client` record. Assigns `name` from `name`, `team` from `team`.
/// @param name Value used to initialize `Client.name`.
/// @param team Value used to initialize `Client.team`.
function client(name,team) return Client(name,team,true,100,0,0,0,0,false,"","","") end function
/// Creates a `mq3.client.cgame_draw.Powerup` record. Assigns `expires` from `expires`, `icon` from `icon`.
/// @param expires Value used to initialize `Powerup.expires`.
/// @param icon Value used to initialize `Powerup.icon`.
function powerup(expires,icon) return Powerup(expires,icon) end function
/// Creates a `mq3.client.cgame_draw.Lagometer` record. Initializes the record with the defaults written in this constructor.
function lagometer() return Lagometer([],[],[],0,0) end function
/// Creates a `mq3.client.cgame_draw.State` record. Initializes the record with the defaults written in this constructor.
function state()
  return State(0,0,0,0,0,TEAM_FREE,GT_FFA,0,100,0,0,0,0,false,false,false,true,true,true,true,1,true,true,false,32.0,0,0,0,-1,0,0,0,0,0,0,false,0,false,"",0,0,[0,0],[false,false],["",""],[0,0],[0,0],0,0,false,false,0.4,0,0,640,480,"",0,0,16,0,0,0,[0,0,0,0],0,[],[],[],[],lagometer(),[],0,0)
end function
/// Updates `value.actions` during client game draw `clear`.
/// @param value Mutable client game draw record/storage; this routine assigns `value.actions`.
function clear(value) value.actions=[];return void end function
/// Evaluates client game draw `printableLength` and returns `count` according to its guard/selection conditions.
/// @param text Text consumed or emitted by `printableLength` in the client game draw path.
function printableLength(text) data=bytes(text);index=0;count=0;while index<len(data) if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2 else count=count+1;index=index+1 end if end while;return count end function
/// Clamps `value` to the inclusive bounds `low` and `high` for client game draw.
/// @param value Value tested by `value<low`, `value>high` before the calculation continues.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
/// Calls `mq3.compat.numeric.trunc32` from client game draw `colorHealth`. The final path returns `[1.0,g,b,1.0]`.
/// @param health Value used by `if health<=0 then return [0.0,0.0,0.0,1.0] end if`.
/// @param armor Value used by `count=armor`.
function colorHealth(health,armor) if health<=0 then return [0.0,0.0,0.0,1.0] end if;count=armor;limit=n.trunc32(health*0.66/0.34);if count>limit then count=limit end if;total=health+count;g=0.0;b=0.0;if total>60 then g=1.0 else if total>=30 then g=(total-30)/30.0 end if;if total>=100 then b=1.0 else if total>=66 then b=(total-66)/33.0 end if;return [1.0,g,b,1.0] end function
/// Evaluates client game draw `fadeAlpha` and returns `0.0`, `(total-t)/FADE_TIME`, `1.0` according to its guard/selection conditions.
/// @param value Record read through `value.time`.
/// @param start Value tested by `start==0` before the calculation continues.
/// @param total Value used by `if t<0 or t>=total then return 0.0 end if`.
function fadeAlpha(value,start,total) if start==0 then return 0.0 end if;t=value.time-start;if t<0 or t>=total then return 0.0 end if;if total-t<FADE_TIME then return (total-t)/FADE_TIME end if;return 1.0 end function
/// Adapts `mq3.client.cgame_draw.publish` to client game draw `drawText`, returning its result for `value, action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1), retailActive`.
/// @param value Argument 1 of `mq3.client.cgame_draw.publish`.
/// @param x Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`.
/// @param y Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`.
/// @param text Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`.
/// @param size Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`.
/// @param color Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.publish`.
function drawText(value,x,y,text,size,color,retailActive) return publish(value,action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1),retailActive) end function
/// Adapts `mq3.client.cgame_draw.publish` to client game draw `drawPic`, returning its result for `value, action("pic",x,y,w,h,"",shader,color,0,-1), retailActive`.
/// @param value Argument 1 of `mq3.client.cgame_draw.publish`.
/// @param x Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`.
/// @param y Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`.
/// @param w Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`.
/// @param h Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`.
/// @param shader Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`.
/// @param color Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.publish`.
function drawPic(value,x,y,w,h,shader,color,retailActive) return publish(value,action("pic",x,y,w,h,"",shader,color,0,-1),retailActive) end function

// CG_Text_Width
/// @param text Text consumed or emitted by `textWidth` in the client game draw path.
/// @param scale Value used by `return n.trunc32(width*scale*glyphScale)`.
/// @param limit Upper limit applied while collecting or rendering the result.
/// @param glyphs Sequence read at `glyphs[data[index]`.
/// @param glyphScale Value used by `return n.trunc32(width*scale*glyphScale)`.
function textWidth(text,scale,limit,glyphs,glyphScale)
  if text==void then return 0 end if;data=bytes(text);max=len(data);if limit>0 and max>limit then max=limit end if;index=0;count=0;width=0.0
  while index<len(data) and count<max
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2
    else
      if data[index]<len(glyphs) then width=width+glyphs[data[index]].xSkip end if
      index=index+1;count=count+1
    end if
  end while;return n.trunc32(width*scale*glyphScale)
end function
// CG_Text_Height
/// @param text Text consumed or emitted by `textHeight` in the client game draw path.
/// @param scale Value used by `return n.trunc32(height*scale*glyphScale)`.
/// @param limit Upper limit applied while collecting or rendering the result.
/// @param glyphs Sequence read at `glyphs[data[index]`.
/// @param glyphScale Value used by `return n.trunc32(height*scale*glyphScale)`.
function textHeight(text,scale,limit,glyphs,glyphScale)
  if text==void then return 0 end if;data=bytes(text);max=len(data);if limit>0 and max>limit then max=limit end if;index=0;count=0;height=0.0
  while index<len(data) and count<max
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2
    else
      if data[index]<len(glyphs) and glyphs[data[index]].height>height then height=glyphs[data[index]].height end if
      index=index+1;count=count+1
    end if
  end while;return n.trunc32(height*scale*glyphScale)
end function
// CG_Text_PaintChar
/// @param value Argument 1 of `mq3.client.cgame_draw.publish`.
/// @param x Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param y Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param width Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param height Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param scale Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param s Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param t Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param s2 Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param t2 Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param shader Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.publish`.
function textPaintChar(value,x,y,width,height,scale,s,t,s2,t2,shader,retailActive) return publish(value,action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1),retailActive) end function
// CG_Text_Paint
/// @param value Value used by `if data[index]==94 and index+1<len(data) and data[index+1]!=94 then publish(value,action("set-color",0,0,0,0,"","",color,data[index+1],-1),ret...`.
/// @param x Horizontal coordinate in the coordinate space used by `textPaint`.
/// @param y Vertical coordinate in the coordinate space used by `textPaint`.
/// @param scale Value used by `useScale=scale*glyphScale`.
/// @param color Color value used by the client game draw drawing or interpolation operation.
/// @param text Text consumed or emitted by `textPaint` in the client game draw path.
/// @param adjust Value used by `x=x+n.trunc32(glyph.xSkip*useScale+adjust)`.
/// @param limit Upper limit applied while collecting or rendering the result.
/// @param style Value used by `if style==1 or style==2 then ofs=1`.
/// @param glyphs Sequence read at `glyphs[data[index]`.
/// @param glyphScale Value used by `useScale=scale*glyphScale`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function textPaint(value,x,y,scale,color,text,adjust,limit,style,glyphs,glyphScale,retailActive)
  if text==void then return x end if;data=bytes(text);max=len(data);if limit>0 and max>limit then max=limit end if;index=0;count=0;useScale=scale*glyphScale
  while index<len(data) and count<max
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then publish(value,action("set-color",0,0,0,0,"","",color,data[index+1],-1),retailActive);index=index+2
    else
      if data[index]<len(glyphs) then
        glyph=glyphs[data[index]]
        if style==1 or style==2 then ofs=1;if style==2 then ofs=2 end if;textPaintChar(value,x+ofs,y-n.trunc32(useScale*glyph.top)+ofs,glyph.imageWidth,glyph.imageHeight,useScale,glyph.s,glyph.t,glyph.s2,glyph.t2,glyph.shader,retailActive) end if
        textPaintChar(value,x,y-n.trunc32(useScale*glyph.top),glyph.imageWidth,glyph.imageHeight,useScale,glyph.s,glyph.t,glyph.s2,glyph.t2,glyph.shader,retailActive);x=x+n.trunc32(glyph.xSkip*useScale+adjust)
      end if
      index=index+1;count=count+1
    end if
  end while;return x
end function

// CG_DrawField
/// @param value Value used by `result=result+[publish(value,action("number",x,y,16,24,"",str(frame),void,frame,-1),retailActive)]`.
/// @param x Horizontal coordinate in the coordinate space used by `drawField`.
/// @param y Vertical coordinate in the coordinate space used by `drawField`.
/// @param width Width in the coordinate space used by `drawField`.
/// @param number Value used by `number=clamp(number,low,high)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawField(value,x,y,width,number,retailActive)
  if width<1 then return [] end if;if width>5 then width=5 end if;low=-99999;high=99999;if width==1 then low=0;high=9 else if width==2 then low=-9;high=99 else if width==3 then low=-99;high=999 else if width==4 then low=-999;high=9999 end if;number=clamp(number,low,high);text=str(number);if len(text)>width then text=decode(slice(bytes(text),0,width)) end if;x=x+2+16*(width-len(text));result=[]
  data=bytes(text);if len(data)>0 then for i=0 to len(data)-1 frame=data[i]-48;if data[i]==45 then frame=10 end if;result=result+[publish(value,action("number",x,y,16,24,"",str(frame),void,frame,-1),retailActive)];x=x+16 end for end if;return result
end function
// CG_Draw3DModel
/// @param value Record read through `value.drawIcons`, `value.draw3dIcons`.
/// @param x Horizontal coordinate in the coordinate space used by `draw3DModel`.
/// @param y Vertical coordinate in the coordinate space used by `draw3DModel`.
/// @param w Width in the coordinate space used by `draw3DModel`.
/// @param h Height in the coordinate space used by `draw3DModel`.
/// @param model Model handle, asset or preview record used by this client game draw operation.
/// @param skin Accepted for compatibility with `draw3DModel`; the current implementation does not read it.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param angles Value used by `return publish(value,action("model",x,y,w,h,str(origin)+"|"+str(angles),model,void,0,-1),retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function draw3DModel(value,x,y,w,h,model,skin,origin,angles,retailActive) if not value.drawIcons or not value.draw3dIcons then return void end if;return publish(value,action("model",x,y,w,h,str(origin)+"|"+str(angles),model,void,0,-1),retailActive) end function
// CG_DrawHead
/// @param value Record read through `value.clients`, `value.draw3dIcons`, `value.drawIcons`.
/// @param x Horizontal coordinate in the coordinate space used by `drawHead`.
/// @param y Vertical coordinate in the coordinate space used by `drawHead`.
/// @param w Width in the coordinate space used by `drawHead`.
/// @param h Height in the coordinate space used by `drawHead`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param angles Value used by `if value.draw3dIcons and ci.headModel!="" then draw3DModel(value,x,y,w,h,ci.headModel,ci.headSkin,[70.0,0.0,0.0],angles,retailActive) else if...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawHead(value,x,y,w,h,clientNum,angles,retailActive) if clientNum<0 or clientNum>=len(value.clients) then return void end if;ci=value.clients[clientNum];if value.draw3dIcons and ci.headModel!="" then draw3DModel(value,x,y,w,h,ci.headModel,ci.headSkin,[70.0,0.0,0.0],angles,retailActive) else if value.drawIcons and ci.modelIcon!="" then drawPic(value,x,y,w,h,ci.modelIcon,void,retailActive) end if;if ci.deferred then drawPic(value,x,y,w,h,"defer",void,retailActive) end if;return void end function
// CG_DrawFlagModel
/// @param value Record read through `value.draw3dIcons`, `value.drawIcons`.
/// @param x Horizontal coordinate in the coordinate space used by `drawFlagModel`.
/// @param y Vertical coordinate in the coordinate space used by `drawFlagModel`.
/// @param w Width in the coordinate space used by `drawFlagModel`.
/// @param h Height in the coordinate space used by `drawFlagModel`.
/// @param team Value used by `if team!=TEAM_RED and team!=TEAM_BLUE and team!=TEAM_FREE then return void end if`.
/// @param force2D Value used by `if not force2D and value.draw3dIcons then return draw3DModel(value,x,y,w,h,name+"-flag-model","",[90.0,0.0,0.0],[0.0,0.0,0.0],retailActive) en...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawFlagModel(value,x,y,w,h,team,force2D,retailActive) if team!=TEAM_RED and team!=TEAM_BLUE and team!=TEAM_FREE then return void end if;name="neutral";if team==TEAM_RED then name="red" else if team==TEAM_BLUE then name="blue" end if;if not force2D and value.draw3dIcons then return draw3DModel(value,x,y,w,h,name+"-flag-model","",[90.0,0.0,0.0],[0.0,0.0,0.0],retailActive) end if;if value.drawIcons then return drawPic(value,x,y,w,h,name+"-flag-icon",void,retailActive) end if;return void end function
// CG_DrawStatusBarHead
/// @param value Record read through `value.time`, `value.clientNum`.
/// @param x Horizontal coordinate in the coordinate space used by `drawStatusBarHead`.
/// @param damageTime Value used by `if damageTime!=0 and value.time-damageTime<500 then frac=(value.time-damageTime)/500.0`.
/// @param damageX Value used by `x=x-n.trunc32((size-60)*(0.5+damageX*0.5)) end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawStatusBarHead(value,x,damageTime,damageX,retailActive) size=60;if damageTime!=0 and value.time-damageTime<500 then frac=(value.time-damageTime)/500.0;size=n.trunc32(60*(1.5-frac*0.5));x=x-n.trunc32((size-60)*(0.5+damageX*0.5)) end if;return drawHead(value,x,480-size,size,size,value.clientNum,[0.0,180.0,0.0],retailActive) end function
// CG_DrawStatusBarFlag
/// @param value Argument 1 of `mq3.client.cgame_draw.drawFlagModel`.
/// @param x Argument 2 of `mq3.client.cgame_draw.drawFlagModel`.
/// @param team Argument 6 of `mq3.client.cgame_draw.drawFlagModel`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.drawFlagModel`.
function drawStatusBarFlag(value,x,team,retailActive) return drawFlagModel(value,x,480-ICON_SIZE,ICON_SIZE,ICON_SIZE,team,false,retailActive) end function
// CG_DrawTeamBackground
/// @param value Value used by `return drawPic(value,x,y,w,h,"team-status",color,retailActive)`.
/// @param x Horizontal coordinate in the coordinate space used by `drawTeamBackground`.
/// @param y Vertical coordinate in the coordinate space used by `drawTeamBackground`.
/// @param w Width in the coordinate space used by `drawTeamBackground`.
/// @param h Height in the coordinate space used by `drawTeamBackground`.
/// @param alpha Opacity or blend weight used by the visual effect.
/// @param team Value used by `if team!=TEAM_RED and team!=TEAM_BLUE then return void end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawTeamBackground(value,x,y,w,h,alpha,team,retailActive) if team!=TEAM_RED and team!=TEAM_BLUE then return void end if;color=[1.0,0.0,0.0,alpha];if team==TEAM_BLUE then color=[0.0,0.0,1.0,alpha] end if;return drawPic(value,x,y,w,h,"team-status",color,retailActive) end function
// CG_DrawStatusBar
/// @param value Record read through `value.drawStatus`, `value.team`, `value.weapon`, `value.ammo` and additional values.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawStatusBar(value,retailActive)
  if not value.drawStatus then return void end if;drawTeamBackground(value,0,420,640,60,0.33,value.team,retailActive);if value.weapon!=0 and value.ammo>=0 then drawField(value,0,432,3,value.ammo,retailActive) end if;drawStatusBarHead(value,249,0,0.0,retailActive);drawField(value,185,432,3,value.health,retailActive);if value.armor>0 then drawField(value,370,432,3,value.armor,retailActive);if value.drawIcons and not value.draw3dIcons then drawPic(value,434,432,48,48,"armor",void,retailActive) end if end if;return void
end function

// CG_DrawAttacker
/// @param value Mutable client game draw record/storage; this routine assigns `value.attackerTime`.
/// @param y Vertical coordinate in the coordinate space used by `drawAttacker`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawAttacker(value,y,retailActive) if value.health<=0 or value.attackerTime==0 or value.attackerNum<0 or value.attackerNum>=len(value.clients) or value.attackerNum==value.clientNum then return y end if;if value.time-value.attackerTime>ATTACKER_HEAD_TIME then value.attackerTime=0;return y end if;drawHead(value,580,y,60,60,value.attackerNum,[0.0,180.0,0.0],retailActive);name=value.clients[value.attackerNum].name;drawText(value,640-printableLength(name)*16,y+60,name,16,[1.0,1.0,1.0,0.5],retailActive);return y+78 end function
// CG_DrawSnapshot
/// @param value Record read through `value.serverTime`, `value.latestSnapshotNum`, `value.serverCommandSequence`.
/// @param y Vertical coordinate in the coordinate space used by `drawSnapshot`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawSnapshot(value,y,retailActive) text="time:"+str(value.serverTime)+" snap:"+str(value.latestSnapshotNum)+" cmd:"+str(value.serverCommandSequence);drawText(value,635-printableLength(text)*16,y+2,text,16,void,retailActive);return y+20 end function
// CG_DrawFPS
/// @param value Mutable client game draw record/storage; this routine assigns `value.frameTime`, `value.previousFrameTimes[slot]`, `value.fpsIndex`.
/// @param y Vertical coordinate in the coordinate space used by `drawFPS`.
/// @param milliseconds Time interval in milliseconds.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawFPS(value,y,milliseconds,retailActive) frame=milliseconds-value.frameTime;value.frameTime=milliseconds;slot=value.fpsIndex%4;if slot<len(value.previousFrameTimes) then value.previousFrameTimes[slot]=frame end if;value.fpsIndex=value.fpsIndex+1;if value.fpsIndex>4 then total=0;for each sample in value.previousFrameTimes total=total+sample end for;if total==0 then total=1 end if;fps=n.trunc32(4000/total);text=str(fps)+"fps";drawText(value,635-printableLength(text)*16,y+2,text,16,void,retailActive) end if;return y+20 end function
// CG_DrawTimer
/// @param value Record read through `value.time`, `value.levelStartTime`.
/// @param y Vertical coordinate in the coordinate space used by `drawTimer`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawTimer(value,y,retailActive) seconds=n.trunc32((value.time-value.levelStartTime)/1000);mins=n.trunc32(seconds/60);seconds=seconds-mins*60;text=str(mins)+":"+str(n.trunc32(seconds/10))+str(seconds%10);drawText(value,635-printableLength(text)*16,y+2,text,16,void,retailActive);return y+20 end function
// CG_DrawTeamOverlay
/// @param value Record read through `value.team`, `value.sortedTeamPlayers`, `value.clients`, `value.locations`.
/// @param y Vertical coordinate in the coordinate space used by `drawTeamOverlay`.
/// @param right Value used by `if right then x=640-width end if`.
/// @param upper Value used by `if not upper then y=y-height end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawTeamOverlay(value,y,right,upper,retailActive)
  if value.team!=TEAM_RED and value.team!=TEAM_BLUE then return y end if;players=[];pwidth=0;count=len(value.sortedTeamPlayers);if count>8 then count=8 end if
  if count>0 then for i=0 to count-1 index=value.sortedTeamPlayers[i];if index>=0 and index<len(value.clients) then ci=value.clients[index];if ci.infoValid and ci.team==value.team then players=players+[index];width=printableLength(ci.name);if width>pwidth then pwidth=width end if end if end if end for end if
  if len(players)==0 then return y end if;if pwidth>12 then pwidth=12 end if;lwidth=0;for each location in value.locations width=printableLength(location);if width>lwidth then lwidth=width end if end for;if lwidth>16 then lwidth=16 end if;width=(pwidth+lwidth+11)*8;x=0;if right then x=640-width end if;height=len(players)*8;if not upper then y=y-height end if;result=y;if upper then result=y+height end if;drawTeamBackground(value,x,y,width,height,0.33,value.team,retailActive)
  for each index in players ci=value.clients[index];drawText(value,x+8,y,ci.name,8,void,retailActive);location="unknown";if ci.location>=0 and ci.location<len(value.locations) and value.locations[ci.location]!="" then location=value.locations[ci.location] end if;drawText(value,x+16+pwidth*8,y,location,8,void,retailActive);drawText(value,x+24+(pwidth+lwidth)*8,y,str(ci.health)+" "+str(ci.armor),8,colorHealth(ci.health,ci.armor),retailActive);drawPic(value,x+48+(pwidth+lwidth)*8,y,8,8,"weapon-"+str(ci.weapon),void,retailActive);y=y+8 end for;return result
end function
// CG_DrawUpperRight
/// @param value Record read through `value.gametype`.
/// @param milliseconds Time interval in milliseconds.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawUpperRight(value,milliseconds,retailActive) y=0;if value.gametype>=GT_TEAM then y=drawTeamOverlay(value,y,true,true,retailActive) end if;y=drawSnapshot(value,y,retailActive);y=drawFPS(value,y,milliseconds,retailActive);y=drawTimer(value,y,retailActive);return drawAttacker(value,y,retailActive) end function

// CG_DrawScores
/// @param value Record read through `value.gametype`.
/// @param y Vertical coordinate in the coordinate space used by `drawScores`.
/// @param score1 Value used by `drawText(value,560,y,str(score1),16,[1.0,0.0,0.0,0.33],retailActive) else drawText(value,600,y,str(score1),16,void,retailActive) end if`.
/// @param score2 Value used by `if value.gametype>=GT_TEAM then drawText(value,600,y,str(score2),16,[0.0,0.0,1.0,0.33],retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawScores(value,y,score1,score2,retailActive) y=y-24;if value.gametype>=GT_TEAM then drawText(value,600,y,str(score2),16,[0.0,0.0,1.0,0.33],retailActive);drawText(value,560,y,str(score1),16,[1.0,0.0,0.0,0.33],retailActive) else drawText(value,600,y,str(score1),16,void,retailActive) end if;return y end function
// CG_DrawPowerups
/// @param value Record read through `value.powerups`, `value.time`.
/// @param y Vertical coordinate in the coordinate space used by `drawPowerups`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawPowerups(value,y,retailActive) if len(value.powerups)==0 then return y end if;for each item in value.powerups if item.expires>value.time then y=y-52;seconds=n.trunc32((item.expires-value.time)/1000);drawText(value,590,y,str(seconds),16,void,retailActive);drawPic(value,608,y,48,48,item.icon,void,retailActive) end if end for;return y end function
// CG_DrawLowerRight
/// @param value Value used by `y=drawScores(value,y,score1,score2,retailActive)`.
/// @param score1 Value used by `y=drawScores(value,y,score1,score2,retailActive)`.
/// @param score2 Value used by `y=drawScores(value,y,score1,score2,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawLowerRight(value,score1,score2,retailActive) y=480;y=drawScores(value,y,score1,score2,retailActive);return drawPowerups(value,y,retailActive) end function
// CG_DrawPickupItem
/// @param value Value used by `alpha=fadeAlpha(value,pickupTime,3000)`.
/// @param y Vertical coordinate in the coordinate space used by `drawPickupItem`.
/// @param itemName Value used by `drawText(value,48,y+8,itemName,16,[1.0,1.0,1.0,alpha],retailActive)`.
/// @param itemIcon Value used by `drawPic(value,8,y,32,32,itemIcon,[1.0,1.0,1.0,alpha],retailActive)`.
/// @param pickupTime Value used by `alpha=fadeAlpha(value,pickupTime,3000)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawPickupItem(value,y,itemName,itemIcon,pickupTime,retailActive) alpha=fadeAlpha(value,pickupTime,3000);if alpha==0.0 then return y end if;drawPic(value,8,y,32,32,itemIcon,[1.0,1.0,1.0,alpha],retailActive);drawText(value,48,y+8,itemName,16,[1.0,1.0,1.0,alpha],retailActive);return y+32 end function
// CG_DrawLowerLeft
/// @param value Argument 1 of `mq3.client.cgame_draw.drawPickupItem`.
/// @param itemName Argument 3 of `mq3.client.cgame_draw.drawPickupItem`.
/// @param itemIcon Argument 4 of `mq3.client.cgame_draw.drawPickupItem`.
/// @param pickupTime Argument 5 of `mq3.client.cgame_draw.drawPickupItem`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.drawPickupItem`.
function drawLowerLeft(value,itemName,itemIcon,pickupTime,retailActive) return drawPickupItem(value,440,itemName,itemIcon,pickupTime,retailActive) end function
// CG_DrawTeamInfo
/// @param value Argument 1 of `mq3.client.cgame_draw.drawTeamOverlay`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.drawTeamOverlay`.
function drawTeamInfo(value,retailActive) return drawTeamOverlay(value,480,false,false,retailActive) end function
// CG_DrawHoldableItem
/// @param value Value used by `return drawPic(value,640-ICON_SIZE,480-ICON_SIZE,ICON_SIZE,ICON_SIZE,icon,void,retailActive)`.
/// @param icon Value used by `if icon=="" then return void end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawHoldableItem(value,icon,retailActive) if icon=="" then return void end if;return drawPic(value,640-ICON_SIZE,480-ICON_SIZE,ICON_SIZE,ICON_SIZE,icon,void,retailActive) end function
// CG_DrawPersistantPowerup
/// @param value Value used by `return drawPic(value,640-ICON_SIZE,480-ICON_SIZE*2,ICON_SIZE,ICON_SIZE,icon,void,retailActive)`.
/// @param icon Value used by `if icon=="" then return void end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawPersistantPowerup(value,icon,retailActive) if icon=="" then return void end if;return drawPic(value,640-ICON_SIZE,480-ICON_SIZE*2,ICON_SIZE,ICON_SIZE,icon,void,retailActive) end function
// CG_DrawReward
/// @param value Value used by `alpha=fadeAlpha(value,rewardTime,3000)`.
/// @param rewardTime Value used by `alpha=fadeAlpha(value,rewardTime,3000)`.
/// @param rewardCount Value used by `if rewardCount>=10 then drawPic(value,320-32,56,64,64,rewardShader,[1.0,1.0,1.0,alpha],retailActive)`.
/// @param rewardShader Value used by `if rewardCount>=10 then drawPic(value,320-32,56,64,64,rewardShader,[1.0,1.0,1.0,alpha],retailActive)`.
/// @param rewardSound Accepted for compatibility with `drawReward`; the current implementation does not read it.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawReward(value,rewardTime,rewardCount,rewardShader,rewardSound,retailActive) alpha=fadeAlpha(value,rewardTime,3000);if alpha==0.0 then return false end if;if rewardCount>=10 then drawPic(value,320-32,56,64,64,rewardShader,[1.0,1.0,1.0,alpha],retailActive);drawText(value,320+32,72,str(rewardCount),16,[1.0,1.0,1.0,alpha],retailActive) else for i=0 to rewardCount-1 drawPic(value,320-rewardCount*16+i*32,56,32,32,rewardShader,[1.0,1.0,1.0,alpha],retailActive) end for end if;return true end function

// CG_AddLagometerFrameInfo
/// @param value Mutable client game draw record/storage; this routine assigns `value.lag.frameSamples`, `value.lag.frameSamples[value.lag.frameCount%LAG_SAMPLES]`, `value.lag.frameCount`.
function addLagometerFrameInfo(value) sample=value.time-value.latestSnapshotNum;if len(value.lag.frameSamples)<LAG_SAMPLES then value.lag.frameSamples=value.lag.frameSamples+[sample] else value.lag.frameSamples[value.lag.frameCount%LAG_SAMPLES]=sample end if;value.lag.frameCount=value.lag.frameCount+1;return sample end function
// CG_AddLagometerSnapshotInfo
/// @param value Mutable client game draw record/storage; this routine assigns `value.lag.snapshotSamples`, `value.lag.snapshotFlags`, `value.lag.snapshotSamples[slot]`, `value.lag.snapshotFlags[slot]` and additional values.
/// @param ping Value used by `sample=ping`.
/// @param flags Value used by `flags=0 end if`.
/// @param present Value used by `if not present then sample=-1`.
function addLagometerSnapshotInfo(value,ping,flags,present) sample=ping;if not present then sample=-1;flags=0 end if;if len(value.lag.snapshotSamples)<LAG_SAMPLES then value.lag.snapshotSamples=value.lag.snapshotSamples+[sample];value.lag.snapshotFlags=value.lag.snapshotFlags+[flags] else slot=value.lag.snapshotCount%LAG_SAMPLES;value.lag.snapshotSamples[slot]=sample;value.lag.snapshotFlags[slot]=flags end if;value.lag.snapshotCount=value.lag.snapshotCount+1;return sample end function
// CG_DrawDisconnect
/// @param value Record read through `value.time`.
/// @param commandTime Value used by `if commandTime<=currentCmdTime then return false end if`.
/// @param currentCmdTime Value used by `if commandTime<=currentCmdTime then return false end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawDisconnect(value,commandTime,currentCmdTime,retailActive) if commandTime<=currentCmdTime then return false end if;if ((value.time>>9)&1)!=0 then return true end if;drawPic(value,640-48,480-48,48,48,"disconnect",void,retailActive);return true end function
// CG_DrawLagometer
/// @param value Record read through `value.lag.frameSamples`, `value.lag.snapshotSamples`, `value.noPredict`, `value.synchronous`.
/// @param enabled Value used by `if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if`.
/// @param commandTime Value used by `if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if`.
/// @param currentCmdTime Value used by `if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawLagometer(value,enabled,commandTime,currentCmdTime,retailActive) if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if;drawPic(value,640-48,480-48,48,48,"lagometer",void,retailActive);for each sample in value.lag.frameSamples publish(value,action("lag-frame",0,0,1,clamp(sample,-100,100),"","",void,sample,-1),retailActive) end for;for each sample in value.lag.snapshotSamples publish(value,action("lag-snapshot",0,0,1,clamp(sample,-900,900),"","",void,sample,-1),retailActive) end for;if value.noPredict or value.synchronous then drawText(value,592,432,"snc",16,void,retailActive) end if;return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end function

// CG_CenterPrint
/// @param value Mutable client game draw record/storage; this routine assigns `value.centerPrint`, `value.centerPrintTime`, `value.centerPrintY`, `value.centerPrintCharWidth` and additional values.
/// @param text Value assigned to `value.centerPrint`.
/// @param y Value assigned to `value.centerPrintY`.
/// @param charWidth Value assigned to `value.centerPrintCharWidth`.
function centerPrint(value,text,y,charWidth) value.centerPrint=text;value.centerPrintTime=value.time;value.centerPrintY=y;value.centerPrintCharWidth=charWidth;value.centerPrintLines=1;data=bytes(text);for each ch in data if ch==10 then value.centerPrintLines=value.centerPrintLines+1 end if end for;return value.centerPrintLines end function
// CG_DrawCenterString
/// @param value Record read through `value.centerPrintTime`, `value.centerPrint`, `value.centerPrintY`, `value.centerPrintLines` and additional values.
/// @param centertime Value used by `alpha=fadeAlpha(value,value.centerPrintTime,n.trunc32(1000*centertime))`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawCenterString(value,centertime,retailActive) alpha=fadeAlpha(value,value.centerPrintTime,n.trunc32(1000*centertime));if alpha==0.0 then return false end if;lines=[];remaining=value.centerPrint;start=0;data=bytes(remaining);for i=0 to len(data) if i==len(data) or data[i]==10 then lines=lines+[decode(slice(data,start,i-start))];start=i+1 end if end for;y=value.centerPrintY-n.trunc32(value.centerPrintLines*BIGCHAR_HEIGHT/2);for each line in lines if len(line)>50 then line=decode(slice(bytes(line),0,50)) end if;x=n.trunc32((640-value.centerPrintCharWidth*printableLength(line))/2);drawText(value,x,y,line,value.centerPrintCharWidth,[1.0,1.0,1.0,alpha],retailActive);y=y+n.trunc32(value.centerPrintCharWidth*1.5) end for;return true end function
// CG_DrawCrosshair
/// @param value Record read through `value.drawCrosshair`, `value.team`, `value.renderingThirdPerson`, `value.crosshairSize` and additional values.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawCrosshair(value,retailActive) if value.drawCrosshair==0 or value.team==TEAM_SPECTATOR or value.renderingThirdPerson then return false end if;size=value.crosshairSize;elapsed=value.time-value.itemPickupBlendTime;if elapsed>0 and elapsed<ITEM_BLOB_TIME then size=size*(1.0+elapsed/ITEM_BLOB_TIME) end if;color=void;if value.crosshairHealth then color=colorHealth(value.health,value.armor) end if;drawPic(value,value.refX+n.trunc32((value.refWidth-size)/2)+value.crosshairX,value.refY+n.trunc32((value.refHeight-size)/2)+value.crosshairY,n.trunc32(size),n.trunc32(size),"crosshair-"+str(value.drawCrosshair%10),color,retailActive);return true end function
// CG_ScanForCrosshairEntity
/// @param value Mutable client game draw record/storage; this routine assigns `value.crosshairClientNum`, `value.crosshairClientTime`.
/// @param trace Record read through `trace.entityNum`, `trace.fog`, `trace.invisible`.
function scanForCrosshairEntity(value,trace) if trace.entityNum<0 or trace.entityNum>=MAX_CLIENTS or trace.fog or trace.invisible then return false end if;value.crosshairClientNum=trace.entityNum;value.crosshairClientTime=value.time;publish(value,action("trace",0,0,0,0,"131072","",void,trace.entityNum,trace.entityNum),true);return true end function
// CG_DrawCrosshairNames
/// @param value Record read through `value.drawCrosshair`, `value.drawCrosshairNames`, `value.renderingThirdPerson`, `value.crosshairClientTime` and additional values.
/// @param trace Value used by `scanForCrosshairEntity(value,trace)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawCrosshairNames(value,trace,retailActive) if value.drawCrosshair==0 or not value.drawCrosshairNames or value.renderingThirdPerson then return false end if;scanForCrosshairEntity(value,trace);alpha=fadeAlpha(value,value.crosshairClientTime,1000)*0.5;if alpha==0.0 or value.crosshairClientNum<0 or value.crosshairClientNum>=len(value.clients) then return false end if;name=value.clients[value.crosshairClientNum].name;drawText(value,320-printableLength(name)*8,170,name,16,[1.0,1.0,1.0,alpha],retailActive);return true end function
// CG_DrawSpectator
/// @param value Record read through `value.gametype`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawSpectator(value,retailActive) drawText(value,248,440,"SPECTATOR",16,void,retailActive);if value.gametype==GT_TOURNAMENT then drawText(value,200,460,"waiting to play",16,void,retailActive) else if value.gametype>=GT_TEAM then drawText(value,8,460,"press ESC and use the JOIN menu to play",16,void,retailActive) end if;return void end function
// CG_DrawVote
/// @param value Mutable client game draw record/storage; this routine assigns `value.voteModified`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawVote(value,retailActive) if value.voteTime==0 then return false end if;if value.voteModified then value.voteModified=false;publish(value,action("sound",0,0,0,0,"talk","",void,0,-1),retailActive) end if;sec=n.trunc32((VOTE_TIME-(value.time-value.voteTime))/1000);if sec<0 then sec=0 end if;drawText(value,0,58,"VOTE("+str(sec)+"):"+value.voteString+" yes:"+str(value.voteYes)+" no:"+str(value.voteNo),8,void,retailActive);return true end function
// CG_DrawTeamVote
/// @param value Mutable client game draw record/storage; this routine assigns `value.teamVoteModified[offset]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawTeamVote(value,retailActive) offset=-1;if value.team==TEAM_RED then offset=0 else if value.team==TEAM_BLUE then offset=1 end if;if offset<0 or value.teamVoteTime[offset]==0 then return false end if;if value.teamVoteModified[offset] then value.teamVoteModified[offset]=false;publish(value,action("sound",0,0,0,0,"talk","",void,0,-1),retailActive) end if;sec=n.trunc32((VOTE_TIME-(value.time-value.teamVoteTime[offset]))/1000);if sec<0 then sec=0 end if;drawText(value,0,90,"TEAMVOTE("+str(sec)+"):"+value.teamVoteString[offset]+" yes:"+str(value.teamVoteYes[offset])+" no:"+str(value.teamVoteNo[offset]),8,void,retailActive);return true end function
// CG_DrawScoreboard
/// @param value Record read through `value.showScores`, `value.pmType`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawScoreboard(value,retailActive) if value.showScores or value.pmType==3 or value.pmType==PM_INTERMISSION then publish(value,action("scoreboard",0,0,640,480,"","",void,0,-1),retailActive);return true end if;return false end function
// CG_DrawIntermission
/// @param value Mutable client game draw record/storage; this routine assigns `value.scoreBoardShowing`.
/// @param centertime Value used by `if value.gametype==GT_SINGLE_PLAYER then return drawCenterString(value,centertime,retailActive) end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawIntermission(value,centertime,retailActive) if value.gametype==GT_SINGLE_PLAYER then return drawCenterString(value,centertime,retailActive) end if;value.scoreBoardShowing=drawScoreboard(value,retailActive);return value.scoreBoardShowing end function
// CG_DrawFollow
/// @param value Record read through `value.pmFlags`, `value.clientNum`, `value.clients`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawFollow(value,retailActive) if (value.pmFlags&PMF_FOLLOW)==0 then return false end if;drawText(value,248,24,"following",16,void,retailActive);name="";if value.clientNum>=0 and value.clientNum<len(value.clients) then name=value.clients[value.clientNum].name end if;drawText(value,n.trunc32((640-GIANT_WIDTH*printableLength(name))/2),40,name,GIANT_WIDTH,void,retailActive);return true end function
// CG_DrawAmmoWarning
/// @param value Record read through `value.lowAmmoWarning`.
/// @param enabled Value used by `if not enabled or value.lowAmmoWarning==0 then return false end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawAmmoWarning(value,enabled,retailActive) if not enabled or value.lowAmmoWarning==0 then return false end if;text="LOW AMMO WARNING";if value.lowAmmoWarning==2 then text="OUT OF AMMO" end if;drawText(value,320-printableLength(text)*8,64,text,16,void,retailActive);return true end function
// CG_DrawProxWarning
/// @param value Value used by `drawText(value,320-printableLength(text)*8,80,text,16,[1.0,0.0,0.0,1.0],retailActive)`.
/// @param ticking Value used by `if not ticking then return false end if`.
/// @param proxTick Value used by `if proxTick!=0 then text="INTERNAL COMBUSTION IN: "+str(proxTick) end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawProxWarning(value,ticking,proxTick,retailActive) if not ticking then return false end if;text="YOU HAVE BEEN MINED";if proxTick!=0 then text="INTERNAL COMBUSTION IN: "+str(proxTick) end if;drawText(value,320-printableLength(text)*8,80,text,16,[1.0,0.0,0.0,1.0],retailActive);return true end function
// CG_DrawWarmup
/// @param value Mutable client game draw record/storage; this routine assigns `value.warmupCount`, `value.warmup`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawWarmup(value,retailActive) if value.warmup==0 then return false end if;if value.warmup<0 then drawText(value,320-19*8,24,"Waiting for players",16,void,retailActive);value.warmupCount=0;return true end if;mode="Free For All";if value.gametype==GT_TEAM then mode="Team Deathmatch" else if value.gametype==GT_CTF then mode="Capture the Flag" end if;drawText(value,320-printableLength(mode)*16,25,mode,32,void,retailActive);sec=n.trunc32((value.warmup-value.time)/1000);if sec<0 then value.warmup=0;sec=0 end if;if sec!=value.warmupCount then value.warmupCount=sec;if sec>=0 and sec<=2 then publish(value,action("sound",0,0,0,0,"count"+str(sec+1),"",void,sec,-1),retailActive) end if end if;text="Starts in: "+str(sec+1);cw=16;if sec==0 then cw=28 else if sec==1 then cw=24 else if sec==2 then cw=20 end if;drawText(value,320-printableLength(text)*cw/2,70,text,cw,void,retailActive);return true end function
// CG_DrawTimedMenus
/// @param value Mutable client game draw record/storage; this routine assigns `value.voiceTime`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawTimedMenus(value,retailActive) if value.voiceTime!=0 and value.time-value.voiceTime>2500 then publish(value,action("menu-close",0,0,0,0,"voiceMenu","",void,0,-1),retailActive);publish(value,action("cvar",0,0,0,0,"cl_conXOffset=0","",void,0,-1),retailActive);value.voiceTime=0;return true end if;return false end function
// CG_Draw2D
/// @param value Mutable client game draw record/storage; this routine assigns `value.scoreBoardShowing`.
/// @param trace Value used by `drawCrosshairNames(value,trace,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function draw2DFrame(value,trace,retailActive)
  if value.levelShot or not value.draw2D then return false end if;if value.pmType==PM_INTERMISSION then drawIntermission(value,3.0,retailActive);return true end if
  if value.team==TEAM_SPECTATOR then
    drawSpectator(value,retailActive);drawCrosshair(value,retailActive);drawCrosshairNames(value,trace,retailActive)
  else
    if not value.showScores and value.health>0 then drawStatusBar(value,retailActive);drawAmmoWarning(value,true,retailActive);drawCrosshair(value,retailActive);drawCrosshairNames(value,trace,retailActive);drawReward(value,0,0,"","",retailActive) end if
    if value.gametype>=GT_TEAM then drawTeamInfo(value,retailActive) end if
  end if
  drawVote(value,retailActive);drawTeamVote(value,retailActive);drawLagometer(value,true,0,0,retailActive);drawUpperRight(value,value.time,retailActive);drawLowerRight(value,0,0,retailActive);if not drawFollow(value,retailActive) then drawWarmup(value,retailActive) end if;value.scoreBoardShowing=drawScoreboard(value,retailActive);if not value.scoreBoardShowing then drawCenterString(value,3.0,retailActive) end if;return true
end function
// CG_DrawTourneyScoreboard
/// @param value Value used by `publish(value,action("tourney-scoreboard",0,0,640,480,"","",void,0,-1),retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawTourneyScoreboard(value,retailActive) publish(value,action("tourney-scoreboard",0,0,640,480,"","",void,0,-1),retailActive);return true end function
// CG_DrawActive
/// @param value Record read through `value.team`, `value.pmFlags`, `value.stereoSeparation`, `value.refX` and additional values.
/// @param stereoView Value used by `if stereoView==1 then separation=-value.stereoSeparation/2.0 else if stereoView==2 then separation=value.stereoSeparation/2.0 end if`.
/// @param hasSnapshot Value used by `if not hasSnapshot then publish(value,action("information",0,0,640,480,"","",void,0,-1),retailActive)`.
/// @param trace Value used by `draw2DFrame(value,trace,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawActive(value,stereoView,hasSnapshot,trace,retailActive) if not hasSnapshot then publish(value,action("information",0,0,640,480,"","",void,0,-1),retailActive);return "information" end if;if value.team==TEAM_SPECTATOR and (value.pmFlags&PMF_SCOREBOARD)!=0 then drawTourneyScoreboard(value,retailActive);return "tourney" end if;separation=0.0;if stereoView==1 then separation=-value.stereoSeparation/2.0 else if stereoView==2 then separation=value.stereoSeparation/2.0 end if;publish(value,action("render-scene",value.refX,value.refY,value.refWidth,value.refHeight,"stereo","",void,n.trunc32(separation*1000),-1),retailActive);draw2DFrame(value,trace,retailActive);return "active" end function
