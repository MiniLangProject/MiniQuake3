// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete shared CGame-local ABI and declaration facade from code/cgame/cg_local.h.
// Live state stays in the split semantic CGame modules; this file owns the exact
// Baseq3/Missionpack constants, enum ordinals, record shapes and declaration inventory.
package mq3.client.cg_local

const CG_FONT_THRESHOLD=0.1
const POWERUP_BLINKS=5
const POWERUP_BLINK_TIME=1000
const FADE_TIME=200
const PULSE_TIME=200
const DAMAGE_DEFLECT_TIME=100
const DAMAGE_RETURN_TIME=400
const DAMAGE_TIME=500
const LAND_DEFLECT_TIME=150
const LAND_RETURN_TIME=300
const STEP_TIME=200
const DUCK_TIME=100
const PAIN_TWITCH_TIME=200
const WEAPON_SELECT_TIME=1400
const ITEM_SCALEUP_TIME=1000
const ZOOM_TIME=150
const ITEM_BLOB_TIME=200
const MUZZLE_FLASH_TIME=20
const SINK_TIME=1000
const ATTACKER_HEAD_TIME=10000
const REWARD_TIME=3000
const PULSE_SCALE=1.5
const MAX_STEP_CHANGE=32
const MAX_VERTS_ON_POLY=10
const MAX_MARK_POLYS=256
const STAT_MINUS=10
const ICON_SIZE=48
const CHAR_WIDTH=32
const CHAR_HEIGHT=48
const TEXT_ICON_SPACE=4
const TEAMCHAT_WIDTH=80
const TEAMCHAT_HEIGHT=8
const GIANT_WIDTH=32
const GIANT_HEIGHT=48
const NUM_CROSSHAIRS=10
const TEAM_OVERLAY_MAXNAME_WIDTH=12
const TEAM_OVERLAY_MAXLOCATION_WIDTH=16
const DEFAULT_MODEL="sarge"
const DEFAULT_TEAM_MODEL="sarge"
const DEFAULT_TEAM_HEAD="sarge"
const DEFAULT_REDTEAM_NAME="Stroggs"
const DEFAULT_BLUETEAM_NAME="Pagans"
const MAX_CUSTOM_SOUNDS=32
const MAX_SKULLTRAIL=10
const MAX_REWARDSTACK=10
const MAX_SOUNDBUFFER=20
const MAX_PREDICTED_EVENTS=16
const MISSIONPACK_DEFAULT_TEAM_MODEL="james"
const MISSIONPACK_DEFAULT_TEAM_HEAD="*james"

const FOOTSTEP_NORMAL=0
const FOOTSTEP_BOOT=1
const FOOTSTEP_FLESH=2
const FOOTSTEP_MECH=3
const FOOTSTEP_ENERGY=4
const FOOTSTEP_METAL=5
const FOOTSTEP_SPLASH=6
const FOOTSTEP_TOTAL=7
const IMPACTSOUND_DEFAULT=0
const IMPACTSOUND_METAL=1
const IMPACTSOUND_FLESH=2
const LE_MARK=0
const LE_EXPLOSION=1
const LE_SPRITE_EXPLOSION=2
const LE_FRAGMENT=3
const LE_MOVE_SCALE_FADE=4
const LE_FALL_SCALE_FADE=5
const LE_FADE_RGB=6
const LE_SCALE_FADE=7
const LE_SCOREPLUM=8
const LE_KAMIKAZE=9
const LE_INVULIMPACT=10
const LE_INVULJUICED=11
const LE_SHOWREFENTITY=12
const LEF_PUFF_DONT_SCALE=1
const LEF_TUMBLE=2
const LEF_SOUND1=4
const LEF_SOUND2=8
const LEMT_NONE=0
const LEMT_BURN=1
const LEMT_BLOOD=2
const LEBS_NONE=0
const LEBS_BLOOD=1
const LEBS_BRASS=2
const SYSTEM_PRINT=0
const CHAT_PRINT=1
const TEAMCHAT_PRINT=2

/// Stores client game local lerp frame record, including `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `yawAngle` and additional values.
struct LerpFrame oldFrame oldFrameTime frame frameTime backlerp yawAngle yawing pitchAngle pitching animationNumber animation animationTime end struct
/// Stores client game local player entity record, including `legs`, `torso`, `flag`, `painTime`, `painDirection`, `lightningFiring` and additional values.
struct PlayerEntity legs torso flag painTime painDirection lightningFiring railgunImpact railgunFlash barrelAngle barrelTime barrelSpinning end struct
/// Stores client game local c entity record, including `currentState`, `nextState`, `interpolate`, `currentValid`, `muzzleFlashTime`, `previousEvent` and additional values.
struct CEntity currentState nextState interpolate currentValid muzzleFlashTime previousEvent teleportFlag trailTime dustTrailTime miscTime snapShotTime pe errorTime errorOrigin errorAngles extrapolated rawOrigin rawAngles beamEnd lerpOrigin lerpAngles end struct
/// Stores client game local mark poly record, including `prevMark`, `nextMark`, `time`, `markShader`, `alphaFade`, `color` and additional values.
struct MarkPoly prevMark nextMark time markShader alphaFade color poly verts end struct
/// Stores client game local local entity record, including `prev`, `next`, `leType`, `leFlags`, `startTime`, `endTime` and additional values.
struct LocalEntity prev next leType leFlags startTime endTime fadeInTime lifeRate pos angles bounceFactor color radius light lightColor leMarkType leBounceSoundType refEntity end struct
/// Stores client game local score record, including `client`, `score`, `ping`, `time`, `scoreFlags`, `powerUps` and additional values.
struct Score client score ping time scoreFlags powerUps accuracy impressiveCount excellentCount guantletCount defendCount assistCount captures perfect team end struct
/// Stores client game local client info record, including `infoValid`, `name`, `team`, `botSkill`, `color1`, `color2` and additional values.
struct ClientInfo infoValid name team botSkill color1 color2 score location health armor curWeapon handicap wins losses teamTask teamLeader powerups medkitUsageTime invulnerabilityStartTime invulnerabilityStopTime breathPuffTime modelName skinName headModelName headSkinName redTeam blueTeam deferred newAnims fixedlegs fixedtorso headOffset footsteps gender legsModel legsSkin torsoModel torsoSkin headModel headSkin modelIcon animations sounds end struct
/// Stores client game local weapon info record, including `registered`, `item`, `handsModel`, `weaponModel`, `barrelModel`, `flashModel` and additional values.
struct WeaponInfo registered item handsModel weaponModel barrelModel flashModel weaponMidpoint flashDlight flashDlightColor flashSound weaponIcon ammoIcon ammoModel missileModel missileSound missileTrailFunc missileDlight missileDlightColor missileRenderfx ejectBrassFunc trailRadius wiTrailTime readySound firingSound loopFireSound end struct
/// Stores client game local item info record, including `registered`, `models`, `icon`.
struct ItemInfo registered models icon end struct
/// Stores client game local powerup info record, including `itemNum`.
struct PowerupInfo itemNum end struct
/// Stores client game local skull trail record, including `positions`, `numpositions`.
struct SkullTrail positions numpositions end struct
/// Stores client game local cg state record, including `clientFrame`, `clientNum`, `demoPlayback`, `levelShot`, `deferredPlayerLoading`, `loading` and additional values.
struct CgState clientFrame clientNum demoPlayback levelShot deferredPlayerLoading loading intermissionStarted latestSnapshotNum latestSnapshotTime snap nextSnap activeSnapshots frameInterpolation thisFrameTeleport nextFrameTeleport frametime time oldTime physicsTime timelimitWarnings fraglimitWarnings mapRestart renderingThirdPerson hyperspace predictedPlayerState predictedPlayerEntity validPPS predictedErrorTime predictedError eventSequence predictableEvents stepChange stepTime duckChange duckTime landChange landTime weaponSelect autoAngles autoAxis autoAnglesFast autoAxisFast refdef refdefViewAngles zoomed zoomTime zoomSensitivity infoScreenText scoresRequestTime numScores selectedScore teamScores scores showScores scoreBoardShowing scoreFadeTime killerName spectatorList spectatorLen spectatorWidth spectatorTime spectatorPaintX spectatorPaintX2 spectatorOffset spectatorPaintLen skulltrails centerPrintTime centerPrintCharWidth centerPrintY centerPrint centerPrintLines lowAmmoWarning lastKillTime crosshairClientNum crosshairClientTime powerupActive powerupTime attackerTime voiceTime rewardStack rewardTime rewardCount rewardShader rewardSound soundBufferIn soundBufferOut soundTime soundBuffer voiceChatTime voiceChatBufferIn voiceChatBufferOut warmup warmupCount itemPickup itemPickupTime itemPickupBlendTime weaponSelectTime weaponAnimation weaponAnimationTime damageTime damageX damageY damageValue headYaw headEndPitch headEndYaw headEndTime headStartPitch headStartYaw headStartTime v_dmg_time v_dmg_pitch v_dmg_roll kick_angles kick_origin bobfracsin bobcycle xyspeed nextOrbitTime testModelEntity testModelName testGun end struct
/// Stores client game local cg media record, including `charsetShader`, `charsetProp`, `charsetPropGlow`, `charsetPropB`, `whiteShader`, `redCubeModel` and additional values.
struct CgMedia charsetShader charsetProp charsetPropGlow charsetPropB whiteShader redCubeModel blueCubeModel redCubeIcon blueCubeIcon redFlagModel blueFlagModel neutralFlagModel redFlagShader blueFlagShader flagShader flagPoleModel flagFlapModel redFlagFlapSkin blueFlagFlapSkin neutralFlagFlapSkin redFlagBaseModel blueFlagBaseModel neutralFlagBaseModel overloadBaseModel overloadTargetModel overloadLightsModel overloadEnergyModel harvesterModel harvesterRedSkin harvesterBlueSkin harvesterNeutralModel armorModel armorIcon teamStatusBar deferShader gibAbdomen gibArm gibChest gibFist gibFoot gibForearm gibIntestine gibLeg gibSkull gibBrain smoke2 machinegunBrassModel shotgunBrassModel railRingsShader railCoreShader lightningShader friendShader balloonShader connectionShader selectShader viewBloodShader tracerShader crosshairShader lagometerShader backTileShader noammoShader smokePuffShader smokePuffRageProShader shotgunSmokePuffShader plasmaBallShader waterBubbleShader bloodTrailShader nailPuffShader blueProxMine numberShaders shadowMarkShader botSkillShaders wakeMarkShader bloodMarkShader bulletMarkShader burnMarkShader holeMarkShader energyMarkShader quadShader redQuadShader quadWeaponShader invisShader regenShader battleSuitShader battleWeaponShader hastePuffShader redKamikazeShader blueKamikazeShader bulletFlashModel ringFlashModel dishFlashModel lightningExplosionModel railExplosionShader plasmaExplosionShader bulletExplosionShader rocketExplosionShader grenadeExplosionShader bfgExplosionShader bloodExplosionShader teleportEffectModel teleportEffectShader kamikazeEffectModel kamikazeShockWave kamikazeHeadModel kamikazeHeadTrail guardPowerupModel scoutPowerupModel doublerPowerupModel ammoRegenPowerupModel invulnerabilityImpactModel invulnerabilityJuicedModel medkitUsageModel dustPuffShader heartShader invulnerabilityPowerupModel scoreboardName scoreboardPing scoreboardScore scoreboardTime medalImpressive medalExcellent medalGauntlet medalDefend medalAssist medalCapture quadSound tracerSound selectSound useNothingSound wearOffSound footsteps sfx_lghit1 sfx_lghit2 sfx_lghit3 sfx_ric1 sfx_ric2 sfx_ric3 sfx_railg sfx_rockexp sfx_plasmaexp sfx_proxexp sfx_nghit sfx_nghitflesh sfx_nghitmetal sfx_chghit sfx_chghitflesh sfx_chghitmetal kamikazeExplodeSound kamikazeImplodeSound kamikazeFarSound useInvulnerabilitySound invulnerabilityImpactSound1 invulnerabilityImpactSound2 invulnerabilityImpactSound3 invulnerabilityJuicedSound obeliskHitSound1 obeliskHitSound2 obeliskHitSound3 obeliskRespawnSound winnerSound loserSound youSuckSound gibSound gibBounce1Sound gibBounce2Sound gibBounce3Sound teleInSound teleOutSound noAmmoSound respawnSound talkSound landSound fallSound jumpPadSound oneMinuteSound fiveMinuteSound suddenDeathSound threeFragSound twoFragSound oneFragSound hitSound hitSoundHighArmor hitSoundLowArmor hitTeamSound impressiveSound excellentSound deniedSound humiliationSound assistSound defendSound firstImpressiveSound firstExcellentSound firstHumiliationSound takenLeadSound tiedLeadSound lostLeadSound voteNow votePassed voteFailed watrInSound watrOutSound watrUnSound flightSound medkitSound weaponHoverSound captureAwardSound redScoredSound blueScoredSound redLeadsSound blueLeadsSound teamsTiedSound captureYourTeamSound captureOpponentSound returnYourTeamSound returnOpponentSound takenYourTeamSound takenOpponentSound redFlagReturnedSound blueFlagReturnedSound neutralFlagReturnedSound enemyTookYourFlagSound enemyTookTheFlagSound yourTeamTookEnemyFlagSound yourTeamTookTheFlagSound youHaveFlagSound yourBaseIsUnderAttackSound holyShitSound count3Sound count2Sound count1Sound countFightSound countPrepareSound patrolShader assaultShader campShader followShader defendShader teamLeaderShader retrieveShader escortShader flagShaders countPrepareTeamSound ammoregenSound doublerSound guardSound scoutSound cursor selectCursor sizeCursor regenSound protectSound n_healthSound hgrenb1aSound hgrenb2aSound wstbimplSound wstbimpmSound wstbimpdSound wstbactvSound end struct
/// Stores client game local cgs state record, including `gameState`, `glconfig`, `screenXScale`, `screenYScale`, `screenXBias`, `serverCommandSequence` and additional values.
struct CgsState gameState glconfig screenXScale screenYScale screenXBias serverCommandSequence processedSnapshotNum localServer gametype dmflags teamflags fraglimit capturelimit timelimit maxclients mapname redTeam blueTeam voteTime voteYes voteNo voteModified voteString teamVoteTime teamVoteYes teamVoteNo teamVoteModified teamVoteString levelStartTime scores1 scores2 redflag blueflag flagStatus newHud gameModels gameSounds numInlineModels inlineDrawModel inlineModelMidpoints clientinfo teamChatMsgs teamChatMsgTimes teamChatPos teamLastChatPos cursorX cursorY eventHandling mouseCaptured sizingHud capturedItem activeCursor currentOrder orderPending orderTime currentVoiceClient acceptOrderTime acceptTask acceptLeader acceptVoice media end struct

/// Lists the type names catalog for client game local in its declared source order.
function typeNames() return ["footstep_t","impactSound_t","lerpFrame_t","playerEntity_t","centity_t","markPoly_t","leType_t","leFlag_t","leMarkType_t","leBounceSoundType_t","localEntity_t","score_t","clientInfo_t","weaponInfo_t","itemInfo_t","powerupInfo_t","skulltrail_t","cg_t","cgMedia_t","cgs_t","q3print_t"] end function
/// Lists the lerp frame field names catalog for client game local in its declared source order.
function lerpFrameFieldNames() return ["oldFrame","oldFrameTime","frame","frameTime","backlerp","yawAngle","yawing","pitchAngle","pitching","animationNumber","animation","animationTime"] end function
/// Lists the player entity field names catalog for client game local in its declared source order.
function playerEntityFieldNames() return ["legs","torso","flag","painTime","painDirection","lightningFiring","railgunImpact","railgunFlash","barrelAngle","barrelTime","barrelSpinning"] end function
/// Lists the centity field names catalog for client game local in its declared source order.
function centityFieldNames() return ["currentState","nextState","interpolate","currentValid","muzzleFlashTime","previousEvent","teleportFlag","trailTime","dustTrailTime","miscTime","snapShotTime","pe","errorTime","errorOrigin","errorAngles","extrapolated","rawOrigin","rawAngles","beamEnd","lerpOrigin","lerpAngles"] end function
/// Lists the mark poly field names catalog for client game local in its declared source order.
function markPolyFieldNames() return ["prevMark","nextMark","time","markShader","alphaFade","color","poly","verts"] end function
/// Lists the local entity field names catalog for client game local in its declared source order.
function localEntityFieldNames() return ["prev","next","leType","leFlags","startTime","endTime","fadeInTime","lifeRate","pos","angles","bounceFactor","color","radius","light","lightColor","leMarkType","leBounceSoundType","refEntity"] end function
/// Lists the score field names catalog for client game local in its declared source order.
function scoreFieldNames() return ["client","score","ping","time","scoreFlags","powerUps","accuracy","impressiveCount","excellentCount","guantletCount","defendCount","assistCount","captures","perfect","team"] end function
/// Lists the client info field names catalog for client game local in its declared source order.
function clientInfoFieldNames() return ["infoValid","name","team","botSkill","color1","color2","score","location","health","armor","curWeapon","handicap","wins","losses","teamTask","teamLeader","powerups","medkitUsageTime","invulnerabilityStartTime","invulnerabilityStopTime","breathPuffTime","modelName","skinName","headModelName","headSkinName","redTeam","blueTeam","deferred","newAnims","fixedlegs","fixedtorso","headOffset","footsteps","gender","legsModel","legsSkin","torsoModel","torsoSkin","headModel","headSkin","modelIcon","animations","sounds"] end function
/// Lists the weapon info field names catalog for client game local in its declared source order.
function weaponInfoFieldNames() return ["registered","item","handsModel","weaponModel","barrelModel","flashModel","weaponMidpoint","flashDlight","flashDlightColor","flashSound","weaponIcon","ammoIcon","ammoModel","missileModel","missileSound","missileTrailFunc","missileDlight","missileDlightColor","missileRenderfx","ejectBrassFunc","trailRadius","wiTrailTime","readySound","firingSound","loopFireSound"] end function
/// Lists the item info field names catalog for client game local in its declared source order.
function itemInfoFieldNames() return ["registered","models","icon"] end function
/// Lists the powerup info field names catalog for client game local in its declared source order.
function powerupInfoFieldNames() return ["itemNum"] end function
/// Lists the skulltrail field names catalog for client game local in its declared source order.
function skulltrailFieldNames() return ["positions","numpositions"] end function
/// Lists the cg field names catalog for client game local in its declared source order.
function cgFieldNames() return ["clientFrame","clientNum","demoPlayback","levelShot","deferredPlayerLoading","loading","intermissionStarted","latestSnapshotNum","latestSnapshotTime","snap","nextSnap","activeSnapshots","frameInterpolation","thisFrameTeleport","nextFrameTeleport","frametime","time","oldTime","physicsTime","timelimitWarnings","fraglimitWarnings","mapRestart","renderingThirdPerson","hyperspace","predictedPlayerState","predictedPlayerEntity","validPPS","predictedErrorTime","predictedError","eventSequence","predictableEvents","stepChange","stepTime","duckChange","duckTime","landChange","landTime","weaponSelect","autoAngles","autoAxis","autoAnglesFast","autoAxisFast","refdef","refdefViewAngles","zoomed","zoomTime","zoomSensitivity","infoScreenText","scoresRequestTime","numScores","selectedScore","teamScores","scores","showScores","scoreBoardShowing","scoreFadeTime","killerName","spectatorList","spectatorLen","spectatorWidth","spectatorTime","spectatorPaintX","spectatorPaintX2","spectatorOffset","spectatorPaintLen","skulltrails","centerPrintTime","centerPrintCharWidth","centerPrintY","centerPrint","centerPrintLines","lowAmmoWarning","lastKillTime","crosshairClientNum","crosshairClientTime","powerupActive","powerupTime","attackerTime","voiceTime","rewardStack","rewardTime","rewardCount","rewardShader","rewardSound","soundBufferIn","soundBufferOut","soundTime","soundBuffer","voiceChatTime","voiceChatBufferIn","voiceChatBufferOut","warmup","warmupCount","itemPickup","itemPickupTime","itemPickupBlendTime","weaponSelectTime","weaponAnimation","weaponAnimationTime","damageTime","damageX","damageY","damageValue","headYaw","headEndPitch","headEndYaw","headEndTime","headStartPitch","headStartYaw","headStartTime","v_dmg_time","v_dmg_pitch","v_dmg_roll","kick_angles","kick_origin","bobfracsin","bobcycle","xyspeed","nextOrbitTime","testModelEntity","testModelName","testGun"] end function
/// Lists the cg media field names catalog for client game local in its declared source order.
function cgMediaFieldNames() return ["charsetShader","charsetProp","charsetPropGlow","charsetPropB","whiteShader","redCubeModel","blueCubeModel","redCubeIcon","blueCubeIcon","redFlagModel","blueFlagModel","neutralFlagModel","redFlagShader","blueFlagShader","flagShader","flagPoleModel","flagFlapModel","redFlagFlapSkin","blueFlagFlapSkin","neutralFlagFlapSkin","redFlagBaseModel","blueFlagBaseModel","neutralFlagBaseModel","overloadBaseModel","overloadTargetModel","overloadLightsModel","overloadEnergyModel","harvesterModel","harvesterRedSkin","harvesterBlueSkin","harvesterNeutralModel","armorModel","armorIcon","teamStatusBar","deferShader","gibAbdomen","gibArm","gibChest","gibFist","gibFoot","gibForearm","gibIntestine","gibLeg","gibSkull","gibBrain","smoke2","machinegunBrassModel","shotgunBrassModel","railRingsShader","railCoreShader","lightningShader","friendShader","balloonShader","connectionShader","selectShader","viewBloodShader","tracerShader","crosshairShader","lagometerShader","backTileShader","noammoShader","smokePuffShader","smokePuffRageProShader","shotgunSmokePuffShader","plasmaBallShader","waterBubbleShader","bloodTrailShader","nailPuffShader","blueProxMine","numberShaders","shadowMarkShader","botSkillShaders","wakeMarkShader","bloodMarkShader","bulletMarkShader","burnMarkShader","holeMarkShader","energyMarkShader","quadShader","redQuadShader","quadWeaponShader","invisShader","regenShader","battleSuitShader","battleWeaponShader","hastePuffShader","redKamikazeShader","blueKamikazeShader","bulletFlashModel","ringFlashModel","dishFlashModel","lightningExplosionModel","railExplosionShader","plasmaExplosionShader","bulletExplosionShader","rocketExplosionShader","grenadeExplosionShader","bfgExplosionShader","bloodExplosionShader","teleportEffectModel","teleportEffectShader","kamikazeEffectModel","kamikazeShockWave","kamikazeHeadModel","kamikazeHeadTrail","guardPowerupModel","scoutPowerupModel","doublerPowerupModel","ammoRegenPowerupModel","invulnerabilityImpactModel","invulnerabilityJuicedModel","medkitUsageModel","dustPuffShader","heartShader","invulnerabilityPowerupModel","scoreboardName","scoreboardPing","scoreboardScore","scoreboardTime","medalImpressive","medalExcellent","medalGauntlet","medalDefend","medalAssist","medalCapture","quadSound","tracerSound","selectSound","useNothingSound","wearOffSound","footsteps","sfx_lghit1","sfx_lghit2","sfx_lghit3","sfx_ric1","sfx_ric2","sfx_ric3","sfx_railg","sfx_rockexp","sfx_plasmaexp","sfx_proxexp","sfx_nghit","sfx_nghitflesh","sfx_nghitmetal","sfx_chghit","sfx_chghitflesh","sfx_chghitmetal","kamikazeExplodeSound","kamikazeImplodeSound","kamikazeFarSound","useInvulnerabilitySound","invulnerabilityImpactSound1","invulnerabilityImpactSound2","invulnerabilityImpactSound3","invulnerabilityJuicedSound","obeliskHitSound1","obeliskHitSound2","obeliskHitSound3","obeliskRespawnSound","winnerSound","loserSound","youSuckSound","gibSound","gibBounce1Sound","gibBounce2Sound","gibBounce3Sound","teleInSound","teleOutSound","noAmmoSound","respawnSound","talkSound","landSound","fallSound","jumpPadSound","oneMinuteSound","fiveMinuteSound","suddenDeathSound","threeFragSound","twoFragSound","oneFragSound","hitSound","hitSoundHighArmor","hitSoundLowArmor","hitTeamSound","impressiveSound","excellentSound","deniedSound","humiliationSound","assistSound","defendSound","firstImpressiveSound","firstExcellentSound","firstHumiliationSound","takenLeadSound","tiedLeadSound","lostLeadSound","voteNow","votePassed","voteFailed","watrInSound","watrOutSound","watrUnSound","flightSound","medkitSound","weaponHoverSound","captureAwardSound","redScoredSound","blueScoredSound","redLeadsSound","blueLeadsSound","teamsTiedSound","captureYourTeamSound","captureOpponentSound","returnYourTeamSound","returnOpponentSound","takenYourTeamSound","takenOpponentSound","redFlagReturnedSound","blueFlagReturnedSound","neutralFlagReturnedSound","enemyTookYourFlagSound","enemyTookTheFlagSound","yourTeamTookEnemyFlagSound","yourTeamTookTheFlagSound","youHaveFlagSound","yourBaseIsUnderAttackSound","holyShitSound","count3Sound","count2Sound","count1Sound","countFightSound","countPrepareSound","patrolShader","assaultShader","campShader","followShader","defendShader","teamLeaderShader","retrieveShader","escortShader","flagShaders","countPrepareTeamSound","ammoregenSound","doublerSound","guardSound","scoutSound","cursor","selectCursor","sizeCursor","regenSound","protectSound","n_healthSound","hgrenb1aSound","hgrenb2aSound","wstbimplSound","wstbimpmSound","wstbimpdSound","wstbactvSound"] end function
/// Lists the cgs field names catalog for client game local in its declared source order.
function cgsFieldNames() return ["gameState","glconfig","screenXScale","screenYScale","screenXBias","serverCommandSequence","processedSnapshotNum","localServer","gametype","dmflags","teamflags","fraglimit","capturelimit","timelimit","maxclients","mapname","redTeam","blueTeam","voteTime","voteYes","voteNo","voteModified","voteString","teamVoteTime","teamVoteYes","teamVoteNo","teamVoteModified","teamVoteString","levelStartTime","scores1","scores2","redflag","blueflag","flagStatus","newHud","gameModels","gameSounds","numInlineModels","inlineDrawModel","inlineModelMidpoints","clientinfo","teamChatMsgs","teamChatMsgTimes","teamChatPos","teamLastChatPos","cursorX","cursorY","eventHandling","mouseCaptured","sizingHud","capturedItem","activeCursor","currentOrder","orderPending","orderTime","currentVoiceClient","acceptOrderTime","acceptTask","acceptLeader","acceptVoice","media"] end function
/// Lists the declaration names catalog for client game local in its declared source order.
function declarationNames() return ["CG_ConfigString","CG_Argv","CG_Printf","CG_Error","CG_StartMusic","CG_UpdateCvars","CG_CrosshairPlayer","CG_LastAttacker","CG_LoadMenus","CG_KeyEvent","CG_MouseEvent","CG_EventHandling","CG_RankRunFrame","CG_SetScoreSelection","CG_GetSelectedScore","CG_BuildSpectatorString","CG_TestModel_f","CG_TestGun_f","CG_TestModelNextFrame_f","CG_TestModelPrevFrame_f","CG_TestModelNextSkin_f","CG_TestModelPrevSkin_f","CG_ZoomDown_f","CG_ZoomUp_f","CG_AddBufferedSound","CG_DrawActiveFrame","CG_AdjustFrom640","CG_FillRect","CG_DrawPic","CG_DrawString","CG_DrawStringExt","CG_DrawBigString","CG_DrawBigStringColor","CG_DrawSmallString","CG_DrawSmallStringColor","CG_DrawStrlen","CG_FadeColor","CG_TeamColor","CG_TileClear","CG_ColorForHealth","CG_GetColorForHealth","UI_DrawProportionalString","CG_DrawRect","CG_DrawSides","CG_DrawTopBottom","CG_AddLagometerFrameInfo","CG_AddLagometerSnapshotInfo","CG_CenterPrint","CG_DrawHead","CG_DrawActive","CG_DrawFlagModel","CG_DrawTeamBackground","CG_OwnerDraw","CG_Text_Paint","CG_Text_Width","CG_Text_Height","CG_SelectPrevPlayer","CG_SelectNextPlayer","CG_GetValue","CG_OwnerDrawVisible","CG_RunMenuScript","CG_ShowResponseHead","CG_SetPrintString","CG_InitTeamChat","CG_GetTeamColor","CG_GetGameStatusText","CG_GetKillerText","CG_Draw3DModel","CG_Text_PaintChar","CG_CheckOrderPending","CG_GameTypeString","CG_YourTeamHasFlag","CG_OtherTeamHasFlag","CG_StatusHandle","CG_Player","CG_ResetPlayerEntity","CG_AddRefEntityWithPowerups","CG_NewClientInfo","CG_CustomSound","CG_BuildSolidList","CG_PointContents","CG_Trace","CG_PredictPlayerState","CG_LoadDeferredPlayers","CG_CheckEvents","CG_PlaceString","CG_EntityEvent","CG_PainEvent","CG_SetEntitySoundPosition","CG_AddPacketEntities","CG_Beam","CG_AdjustPositionForMover","CG_PositionEntityOnTag","CG_PositionRotatedEntityOnTag","CG_NextWeapon_f","CG_PrevWeapon_f","CG_Weapon_f","CG_RegisterWeapon","CG_RegisterItemVisuals","CG_FireWeapon","CG_MissileHitWall","CG_MissileHitPlayer","CG_ShotgunFire","CG_Bullet","CG_RailTrail","CG_GrappleTrail","CG_AddViewWeapon","CG_AddPlayerWeapon","CG_DrawWeaponSelect","CG_OutOfAmmoChange","CG_InitMarkPolys","CG_AddMarks","CG_ImpactMark","CG_InitLocalEntities","CG_AllocLocalEntity","CG_AddLocalEntities","CG_SmokePuff","CG_BubbleTrail","CG_SpawnEffect","CG_KamikazeEffect","CG_ObeliskExplode","CG_ObeliskPain","CG_InvulnerabilityImpact","CG_InvulnerabilityJuiced","CG_LightningBoltBeam","CG_ScorePlum","CG_GibPlayer","CG_BigExplode","CG_Bleed","CG_MakeExplosion","CG_ProcessSnapshots","CG_LoadingString","CG_LoadingItem","CG_LoadingClient","CG_DrawInformation","CG_DrawOldScoreboard","CG_DrawOldTourneyScoreboard","CG_ConsoleCommand","CG_InitConsoleCommands","CG_ExecuteNewServerCommands","CG_ParseServerinfo","CG_SetConfigValues","CG_LoadVoiceChats","CG_ShaderStateChanged","CG_VoiceChatLocal","CG_PlayBufferedVoiceChats","CG_Respawn","CG_TransitionPlayerState","CG_CheckChangedPredictableEvents","trap_Print","trap_Error","trap_Milliseconds","trap_Cvar_Register","trap_Cvar_Update","trap_Cvar_Set","trap_Cvar_VariableStringBuffer","trap_Argc","trap_Argv","trap_Args","trap_FS_FOpenFile","trap_FS_Read","trap_FS_Write","trap_FS_FCloseFile","trap_FS_Seek","trap_SendConsoleCommand","trap_AddCommand","trap_SendClientCommand","trap_UpdateScreen","trap_CM_LoadMap","trap_CM_NumInlineModels","trap_CM_InlineModel","trap_CM_TempBoxModel","trap_CM_PointContents","trap_CM_TransformedPointContents","trap_CM_BoxTrace","trap_CM_TransformedBoxTrace","trap_CM_MarkFragments","trap_S_StartSound","trap_S_StopLoopingSound","trap_S_StartLocalSound","trap_S_ClearLoopingSounds","trap_S_AddLoopingSound","trap_S_AddRealLoopingSound","trap_S_UpdateEntityPosition","trap_S_Respatialize","trap_S_RegisterSound","trap_S_StartBackgroundTrack","trap_S_StopBackgroundTrack","trap_R_LoadWorldMap","trap_R_RegisterModel","trap_R_RegisterSkin","trap_R_RegisterShader","trap_R_RegisterShaderNoMip","trap_R_ClearScene","trap_R_AddRefEntityToScene","trap_R_AddPolyToScene","trap_R_AddPolysToScene","trap_R_AddLightToScene","trap_R_LightForPoint","trap_R_RenderScene","trap_R_SetColor","trap_R_DrawStretchPic","trap_R_ModelBounds","trap_R_LerpTag","trap_R_RemapShader","trap_GetGlconfig","trap_GetGameState","trap_GetCurrentSnapshotNumber","trap_GetSnapshot","trap_GetServerCommand","trap_GetCurrentCmdNumber","trap_GetUserCmd","trap_SetUserCmdValue","testPrintInt","testPrintFloat","trap_MemoryRemaining","trap_R_RegisterFont","trap_Key_IsDown","trap_Key_GetCatcher","trap_Key_SetCatcher","trap_Key_GetKey","trap_CIN_PlayCinematic","trap_CIN_StopCinematic","trap_CIN_RunCinematic","trap_CIN_DrawCinematic","trap_CIN_SetExtents","trap_SnapVector","trap_loadCamera","trap_startCamera","trap_getCameraInfo","trap_GetEntityToken","CG_ClearParticles","CG_AddParticles","CG_ParticleSnow","CG_ParticleSmoke","CG_AddParticleShrapnel","CG_ParticleSnowFlurry","CG_ParticleBulletDebris","CG_ParticleSparks","CG_ParticleDust","CG_ParticleMisc","CG_ParticleExplosion","CG_NewParticleArea"] end function
/// Lists the global names catalog for client game local in its declared source order.
function globalNames() return ["cgs","cg","cg_entities","cg_weapons","cg_items","cg_markPolys","cg_centertime","cg_runpitch","cg_runroll","cg_bobup","cg_bobpitch","cg_bobroll","cg_swingSpeed","cg_shadows","cg_gibs","cg_drawTimer","cg_drawFPS","cg_drawSnapshot","cg_draw3dIcons","cg_drawIcons","cg_drawAmmoWarning","cg_drawCrosshair","cg_drawCrosshairNames","cg_drawRewards","cg_drawTeamOverlay","cg_teamOverlayUserinfo","cg_crosshairX","cg_crosshairY","cg_crosshairSize","cg_crosshairHealth","cg_drawStatus","cg_draw2D","cg_animSpeed","cg_debugAnim","cg_debugPosition","cg_debugEvents","cg_railTrailTime","cg_errorDecay","cg_nopredict","cg_noPlayerAnims","cg_showmiss","cg_footsteps","cg_addMarks","cg_brassTime","cg_gun_frame","cg_gun_x","cg_gun_y","cg_gun_z","cg_drawGun","cg_viewsize","cg_tracerChance","cg_tracerWidth","cg_tracerLength","cg_autoswitch","cg_ignore","cg_simpleItems","cg_fov","cg_zoomFov","cg_thirdPersonRange","cg_thirdPersonAngle","cg_thirdPerson","cg_stereoSeparation","cg_lagometer","cg_drawAttacker","cg_synchronousClients","cg_teamChatTime","cg_teamChatHeight","cg_stats","cg_forceModel","cg_buildScript","cg_paused","cg_blood","cg_predictItems","cg_deferPlayers","cg_drawFriend","cg_teamChatsOnly","cg_noVoiceChats","cg_noVoiceText","cg_scorePlum","cg_smoothClients","pmove_fixed","pmove_msec","cg_cameraOrbit","cg_cameraOrbitDelay","cg_timescaleFadeEnd","cg_timescaleFadeSpeed","cg_timescale","cg_cameraMode","cg_smallFont","cg_bigFont","cg_noTaunt","cg_noProjectileTrail","cg_oldRail","cg_oldRocket","cg_oldPlasma","cg_trueLightning","cg_redTeamName","cg_blueTeamName","cg_currentSelectedPlayer","cg_currentSelectedPlayerName","cg_singlePlayer","cg_enableDust","cg_enableBreath","cg_singlePlayerActive","cg_recordSPDemo","cg_recordSPDemoName","cg_obeliskRespawnDelay","sortedTeamPlayers","numSortedTeamPlayers","drawTeamOverlayModificationCount","systemChat","teamChat1","teamChat2","initparticles"] end function

/// Computes `value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL` for client game local `validFootstep`.
/// @param value Value used by `return value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL`.
function validFootstep(value) return value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL end function
/// Computes `value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH` for client game local `validImpactSound`.
/// @param value Value used by `return value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH`.
function validImpactSound(value) return value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH end function
/// Evaluates client game local `validLocalEntityType` and returns `true`, `missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY` according to its guard/selection conditions.
/// @param value Value tested by `value>=LE_MARK and value<=LE_SCOREPLUM` before the calculation continues.
/// @param missionpack Value used by `return missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY`.
function validLocalEntityType(value,missionpack) if value>=LE_MARK and value<=LE_SCOREPLUM then return true end if;return missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY end function
/// Evaluates client game local `nextSoundBufferSlot` and returns `error(7956,"cg_local.h: invalid sound-buffer slot")`, `(value+1)%MAX_SOUNDBUFFER` according to its guard/selection conditions.
/// @param value Value tested by `value<0 or value>=MAX_SOUNDBUFFER` before the calculation continues.
function nextSoundBufferSlot(value) if value<0 or value>=MAX_SOUNDBUFFER then return error(7956,"cg_local.h: invalid sound-buffer slot") end if;return (value+1)%MAX_SOUNDBUFFER end function
/// Evaluates client game local `nextRewardSlot` and returns `error(7956,"cg_local.h: invalid reward slot")`, `(value+1)%MAX_REWARDSTACK` according to its guard/selection conditions.
/// @param value Value tested by `value<0 or value>=MAX_REWARDSTACK` before the calculation continues.
function nextRewardSlot(value) if value<0 or value>=MAX_REWARDSTACK then return error(7956,"cg_local.h: invalid reward slot") end if;return (value+1)%MAX_REWARDSTACK end function
/// Computes `value>=0 and value<NUM_CROSSHAIRS` for client game local `validCrosshair`.
/// @param value Value used by `return value>=0 and value<NUM_CROSSHAIRS`.
function validCrosshair(value) return value>=0 and value<NUM_CROSSHAIRS end function
/// Computes `vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY` for client game local `validMarkPolygon`.
/// @param vertexCount Value used by `return vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY`.
function validMarkPolygon(vertexCount) return vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY end function
/// Computes `timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME` for client game local `powerupBlinkWindow`.
/// @param timeLeft Value used by `return timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME`.
function powerupBlinkWindow(timeLeft) return timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME end function
/// Evaluates client game local `clampTeamChatHeight` and returns `0`, `TEAMCHAT_HEIGHT`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<0`, `value>TEAMCHAT_HEIGHT` before the calculation continues.
function clampTeamChatHeight(value) if value<0 then return 0 end if;if value>TEAMCHAT_HEIGHT then return TEAMCHAT_HEIGHT end if;return value end function
