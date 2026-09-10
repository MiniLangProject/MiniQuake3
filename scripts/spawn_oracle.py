"""Original g_spawn.c plus real positional/trigger spawn functions and server CM.

Unported item/class functions are recorded boundaries, never simplified gameplay.
"""
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
from generate_spawn import tables
import re

FUNCTIONS={
    'g_mem.c':['G_Alloc','G_InitMemory','Svcmd_GameMem_f'],
    'g_svcmds.c':['StringToFilter','UpdateIPBans','G_FilterPacket','AddIP','G_ProcessIPBans','Svcmd_AddIP_f','Svcmd_RemoveIP_f','Svcmd_EntityList_f','ClientForString','Svcmd_ForceTeam_f','ConsoleCommand'],
    'g_session.c':['G_WriteClientSessionData','G_ReadSessionData','G_InitSessionData','G_InitWorldSession','G_WriteSessionData'],
    'g_utils.c':['G_TeamCommand','vectoyaw','G_InitGentity','G_Spawn','G_EntitiesFree','G_FreeEntity','G_SetOrigin','G_Find','G_PickTarget','G_FindConfigstringIndex','G_ModelIndex','G_SoundIndex','G_SetMovedir','G_TempEntity','G_KillBox','vtos','AddRemap','BuildShaderStateConfig','G_UseTargets','G_AddPredictableEvent','G_AddEvent','G_Sound'],
    'g_client.c':['SpotWouldTelefrag','SelectNearestDeathmatchSpawnPoint','SelectRandomDeathmatchSpawnPoint','SelectRandomFurthestSpawnPoint','SelectSpawnPoint','SelectInitialSpawnPoint','SelectSpectatorSpawnPoint','InitBodyQue','BodySink','CopyToBodyQue','SetClientViewAngle','respawn','ClientSpawn','ClientBegin','TeamCount','TeamLeader','PickTeam','ClientCleanName','ClientUserinfoChanged','ClientConnect','ClientDisconnect','SP_info_player_deathmatch','SP_info_player_start','SP_info_player_intermission'],
    'g_misc.c':['locateCamera','SP_misc_portal_surface','SP_misc_portal_camera','TeleportPlayer','SP_info_null','SP_info_notnull','SP_info_camp','SP_light','SP_misc_model','SP_misc_teleporter_dest','Use_Shooter','InitShooter_Finish','InitShooter','SP_shooter_rocket','SP_shooter_grenade','SP_shooter_plasma'],
    'g_target.c':['Use_Target_Give','SP_target_give','Use_target_remove_powerups','SP_target_remove_powerups','Use_Target_Score','SP_target_score','Use_Target_Print','SP_target_print','SP_target_position','Think_Target_Delay','Use_Target_Delay','SP_target_delay','target_relay_use','SP_target_relay','target_teleporter_use','SP_target_teleporter','Use_Target_Speaker','SP_target_speaker','target_location_linkup','SP_target_location','target_kill_use','SP_target_kill','target_laser_think','target_laser_on','target_laser_off','target_laser_use','target_laser_start','SP_target_laser'],
    'g_team.c':['OtherTeam','TeamName','AddTeamScore','Team_SetFlagStatus','Team_ForceGesture','Team_CheckDroppedItem','Team_ResetFlag','Team_ResetFlags','Team_ReturnFlagSound','Team_TakeFlagSound','Team_CaptureFlagSound','Team_ReturnFlag','Team_FreeEntity','Team_DroppedFlagThink','Team_TouchOurFlag','Team_TouchEnemyFlag','Pickup_Team','SelectRandomTeamSpawnPoint','SelectCTFSpawnPoint','SP_team_CTF_redplayer','SP_team_CTF_blueplayer','SP_team_CTF_redspawn','SP_team_CTF_bluespawn','OnSameTeam','Team_FragBonuses','Team_CheckHurtCarrier','Team_GetLocation','Team_GetLocationMsg','SortClients','TeamplayInfoMessage','CheckTeamStatus'],
    'g_mover.c':['G_TestEntityPosition','G_CreateRotationMatrix','G_TransposeMatrix','G_RotatePoint','G_TryPushingEntity','G_MoverPush','G_MoverTeam','G_RunMover',
                 'SetMoverState','MatchTeam','ReturnToPos1','Reached_BinaryMover','Use_BinaryMover','InitMover',
                 'Blocked_Door','Touch_DoorTriggerSpectator','Touch_DoorTrigger','Think_SpawnNewDoorTrigger','Think_MatchTeam','SP_func_door',
                 'Touch_Plat','Touch_PlatCenterTrigger','SpawnPlatTrigger','SP_func_plat',
                 'Touch_Button','SP_func_button','Think_BeginMoving','Reached_Train',
                 'Think_SetupTrainTargets','SP_path_corner','SP_func_train','SP_func_static',
                 'SP_func_rotating','SP_func_bobbing','SP_func_pendulum'],
    'g_main.c':['AddTournamentPlayer','RemoveTournamentLoser','RemoveTournamentWinner','AdjustTournamentScores','MoveClientToIntermission','BeginIntermission','ExitLevel','G_RunThink','FindIntermissionPoint','SortRanks','CalculateRanks','SendScoreboardMessageToAllClients','ScoreIsTied','CheckExitRules','LogExit','CheckIntermissionExit','CheckVote','PrintTeam','SetLeader','CheckTeamLeader','CheckTeamVote','CheckCvars'],
    'g_trigger.c':['InitTrigger','AimAtTarget','SP_trigger_push','SP_trigger_teleport','trigger_push_touch','trigger_teleporter_touch','multi_wait','multi_trigger','Use_Multi','Touch_Multi','SP_trigger_multiple','trigger_always_think','SP_trigger_always','Use_target_push','SP_target_push','func_timer_think','func_timer_use','SP_func_timer','hurt_use','hurt_touch','SP_trigger_hurt'],
    'g_combat.c':['ScorePlum','AddScore','TossClientItems','LookAtKiller','GibEntity','body_die','CheckAlmostCapture','CheckAlmostScored','player_die','CheckArmor','G_Damage','CanDamage','G_RadiusDamage'],
    'g_weapon.c':['G_BounceProjectile','Weapon_Gauntlet','CheckGauntletAttack','SnapVectorTowards','Bullet_Fire','BFG_Fire','ShotgunPellet','ShotgunPattern','weapon_supershotgun_fire','weapon_grenadelauncher_fire','Weapon_RocketLauncher_Fire','Weapon_Plasmagun_Fire','weapon_railgun_fire','Weapon_GrapplingHook_Fire','Weapon_HookFree','Weapon_HookThink','Weapon_LightningFire','LogAccuracyHit','CalcMuzzlePoint','CalcMuzzlePointOrigin','FireWeapon'],
    'g_missile.c':['G_BounceMissile','G_ExplodeMissile','G_MissileImpact','G_RunMissile','fire_plasma','fire_grenade','fire_bfg','fire_rocket','fire_grapple'],
    'g_items.c':['Pickup_Powerup','Pickup_Holdable','Add_Ammo','Pickup_Ammo','Pickup_Weapon','Pickup_Health','Pickup_Armor','RespawnItem','Touch_Item','RegisterItem','LaunchItem','Drop_Item','Use_Item','FinishSpawningItem','G_ItemDisabled','G_SpawnItem','G_BounceItem','G_RunItem'],
    'g_active.c':['P_DamageFeedback','P_WorldEffects','G_SetClientSound','ClientImpacts','G_TouchTriggers','SpectatorThink','ClientInactivityTimer','ClientTimerActions','ClientIntermissionThink','ClientEvents','SendPendingPredictableEvents','ClientThink_real','ClientThink','G_RunClient','SpectatorClientEndFrame','ClientEndFrame'],
    'g_cmds.c':['CheatsOk','ConcatArgs','Cmd_Give_f','Cmd_God_f','Cmd_Notarget_f','Cmd_Noclip_f','Cmd_LevelShot_f','Cmd_TeamTask_f','Cmd_Kill_f','G_SayTo','G_Say','Cmd_Say_f','Cmd_Tell_f','G_VoiceTo','G_Voice','Cmd_Voice_f','Cmd_VoiceTell_f','Cmd_VoiceTaunt_f','Cmd_GameCommand_f','Cmd_Where_f','Cmd_SetViewpos_f','Cmd_Stats_f','ClientCommand','SanitizeString','ClientNumberFromString','Cmd_Follow_f','Cmd_FollowCycle_f','SetTeam','StopFollowing','Cmd_Team_f','BroadcastTeamChange','DeathmatchScoreboardMessage','Cmd_Score_f','Cmd_CallVote_f','Cmd_Vote_f','Cmd_CallTeamVote_f','Cmd_TeamVote_f'],
}
def build(output, *, lifecycle=False):
    output.mkdir(parents=True,exist_ok=True);source=ROOT/'Quake-III-Arena-original-source/code'
    body=['#define MAXCHOICES 32', '#define MAX_SHADER_REMAPS 128',
          '#define TRAIN_START_ON 1', '#define TRAIN_TOGGLE 2', '#define TRAIN_BLOCK_STOPS 4',
          'typedef struct {char oldShader[MAX_QPATH],newShader[MAX_QPATH];float timeOffset;} shaderRemap_t;',
          'int remapCount=0; shaderRemap_t remappedShaders[MAX_SHADER_REMAPS];',
          # The retail door replay reaches this engine trap from unchanged
          # Reached_BinaryMover. Visibility portal accounting has its own direct
          # differential suite; lifecycle snapshots observe the mover state.
          'void trap_AdjustAreaPortalState(gentity_t *ent,qboolean open){(void)ent;(void)open;}',
          '#define MISSILE_PRESTEP_TIME 50', '#define RESPAWN_ARMOR 25', '#define RESPAWN_HEALTH 35', '#define RESPAWN_AMMO 40', '#define RESPAWN_HOLDABLE 60', '#define RESPAWN_MEGAHEALTH 35', '#define RESPAWN_POWERUP 120',
          'qboolean itemRegistered[MAX_ITEMS];', '#define MAX_SPAWN_POINTS 128', '#define MAX_TEAM_SPAWN_POINTS 32', 'static vec3_t playerMins={-15,-15,-24},playerMaxs={15,15,32};'];selected=[]
    for name,names in FUNCTIONS.items():
        path=source/'game'/name;selected.append(path)
        if name=='g_mem.c':
            source_text=path.read_text(encoding='utf-8')
            declarations=re.search(r'^#define POOLSIZE.*?^static int\s+allocPoint;',source_text,re.M|re.S)
            if not declarations:raise RuntimeError('Missing original game memory storage')
            body.append(declarations[0]+'\n#define G_Alloc Original_G_Alloc\n'+extract(path,names)+'\n#undef G_Alloc')
        elif name=='g_svcmds.c':
            source_text=path.read_text(encoding='utf-8')
            declarations=re.search(r'^typedef struct ipFilter_s.*?^static int\s+numIPFilters;',source_text,re.M|re.S)
            if not declarations:raise RuntimeError('Missing original IP filter storage')
            body.append(declarations[0]+'\nchar *ConcatArgs(int start);\n#define G_FilterPacket Original_G_FilterPacket\n'+extract(path,names)+'\n#undef G_FilterPacket')
        elif name in ('g_combat.c','g_client.c'):
            # G_Damage has alternate preprocessor braces; SpotWouldTelefrag
            # has a commented opening brace. Keep complete top-level bodies.
            source_text=path.read_text()
            if name=='g_combat.c':
                match=re.search(r'^char\s+\*modNames\[\]\s*=\s*\{.*?^\};',source_text,re.M|re.S)
                if not match:raise RuntimeError('Missing original modNames table')
                body.append(match[0])
            for symbol in names:
                match=re.search(r'^(?:static\s+)?\w+[ \t]+\*?'+symbol+r'\s*\([^;]*?\)\s*\{.*?^\}',source_text,re.M|re.S)
                if not match:raise RuntimeError('Missing original game function '+symbol)
                if symbol=='ClientSpawn':body.append('#define ClientSpawn Original_ClientSpawn\n'+match[0]+'\n#undef ClientSpawn')
                elif symbol=='ClientBegin':body.append('#define ClientBegin Original_ClientBegin\n#define ClientSpawn Original_ClientSpawn\n'+match[0]+'\n#undef ClientSpawn\n#undef ClientBegin')
                elif symbol=='ClientUserinfoChanged':body.append('#define ClientUserinfoChanged Original_ClientUserinfoChanged\n'+match[0]+'\n#undef ClientUserinfoChanged')
                else:body.append(match[0])
        elif name=='g_weapon.c':
            # Conditional branches contain alternate braces. Keep each complete
            # original top-level body and its shared mutable firing state.
            source_text=path.read_text()
            declarations=re.search(r'^static\s+float\s+s_quadFactor;.*?^static\s+vec3_t\s+muzzle;',source_text,re.M|re.S)
            if not declarations:raise RuntimeError('Missing original weapon state')
            body.append(declarations[0])
            for define in ('MACHINEGUN_SPREAD','MACHINEGUN_DAMAGE','MACHINEGUN_TEAM_DAMAGE','DEFAULT_SHOTGUN_DAMAGE','MAX_RAIL_HITS'):
                match=re.search(r'^#define[ \t]+'+define+r'\b[^\n]*',source_text,re.M)
                if not match:raise RuntimeError('Missing original weapon define '+define)
                body.append(match[0])
            for symbol in names:
                match=re.search(r'^\w+[ \t]+\*?'+symbol+r'\s*\([^;]*?\)\s*\{.*?^\}',source_text,re.M|re.S)
                if not match:raise RuntimeError('Missing original weapon function '+symbol)
                if symbol in ('FireWeapon','CheckGauntletAttack'):
                    body.append(f'#define {symbol} Original_{symbol}\n'+match[0]+f'\n#undef {symbol}')
                else:body.append(match[0])
        elif name=='g_active.c':
            source_text=path.read_text();functions=[]
            for symbol in names:
                match=re.search(r'^\w+[ \t]+\*?'+symbol+r'\s*\([^;]*?\)\s*\{.*?^\}',source_text,re.M|re.S)
                if not match:raise RuntimeError('Missing original game function '+symbol)
                if symbol=='ClientEndFrame':functions.append('#define ClientEndFrame Original_ClientEndFrame\n'+match[0]+'\n#undef ClientEndFrame')
                elif symbol=='ClientThink':functions.append('#define ClientThink Original_ClientThink\n'+match[0]+'\n#undef ClientThink')
                elif symbol=='G_RunClient':functions.append('#define G_RunClient Original_G_RunClient\n'+match[0]+'\n#undef G_RunClient')
                else:functions.append(match[0])
            body.append('\n'.join(functions))
        elif name=='g_team.c':
            source_text=path.read_text()
            state=re.search(r'typedef struct teamgame_s \{.*?teamgame_t teamgame;',source_text,re.S)
            remaps=re.search(r'static char ctfFlagStatusRemap\[\].*?;\s*static char oneFlagStatusRemap\[\].*?;',source_text,re.S)
            if not state or not remaps:raise RuntimeError('Missing original team state declarations')
            body.append(state[0]+'\n'+remaps[0]+'\n'+extract(path,names))
        elif name=='g_items.c':
            source_text=path.read_text();functions=[]
            for symbol in names:
                match=re.search(r'^\w+[ \t]+\*?'+symbol+r'\s*\([^;]*?\)\s*\{.*?^\}',source_text,re.M|re.S)
                if not match:raise RuntimeError('Missing original game function '+symbol)
                functions.append(match[0])
            body.append('#define G_RunItem Original_RunItem\n'+'\n'.join(functions)+'\n#undef G_RunItem')
        elif name=='g_cmds.c':
            match=re.search(r'static const char \*gameNames\[\] = \{.*?\};',path.read_text(),re.S)
            if not match:raise RuntimeError('Missing original vote gameNames')
            orders=re.search(r'static char\s+\*gc_orders\[\] = \{.*?\};',path.read_text(),re.S)
            if not orders:raise RuntimeError('Missing original gc_orders table')
            # Preserve native declaration order for static helpers and callers.
            source_text=path.read_text()
            ordered=sorted(names,key=lambda symbol:re.search(r'^[\w* \t]+\b'+re.escape(symbol)+r'\s*\([^;{}]*\)\s*\{',source_text,re.M).start())
            body.append(match[0]+'\n'+orders[0]+'\n#define EC "\\x19"\n#define Cmd_FollowCycle_f Original_Cmd_FollowCycle_f\n'+extract(path,ordered)+'\n#undef Cmd_FollowCycle_f')
        elif name=='g_mover.c':
            source_text=path.read_text(encoding='utf-8')
            storage=re.search(r'typedef struct \{\s*gentity_t\s+\*ent;.*?pushed_t\s+pushed\[MAX_GENTITIES\], \*pushed_p;',source_text,re.S)
            if not storage:raise RuntimeError('Missing original mover push storage')
            functions=[]
            for symbol in names:
                function=extract(path,[symbol])
                if symbol=='G_RunMover':functions.append('#define G_RunMover Original_G_RunMover\n'+function+'\n#undef G_RunMover')
                else:functions.append(function)
            body.append(storage[0]+'\n'+'\n'.join(functions))
        elif name=='g_main.c':
            # Rename only each definition. Its callers keep the mode-aware
            # wrappers, preserving the older isolated score/spawn suites.
            for symbol in names:
                function=extract(path,[symbol])
                if symbol in ('AddTournamentPlayer','MoveClientToIntermission','BeginIntermission','ExitLevel'):
                    body.append(f'#define {symbol} Original_{symbol}\n'+function+f'\n#undef {symbol}')
                else:body.append(function)
        elif name=='g_missile.c':body.append('#define G_RunMissile Original_RunMissile\n'+extract(path,names)+'\n#undef G_RunMissile')
        else:body.append(extract(path,names))
    (output/'spawn_functions.inc').write_text('\n'.join(body))
    (output/'vote_argv.inc').write_text(extract(source/'qcommon/cmd.c',['Cmd_Argc','Cmd_Argv','Cmd_ArgvBuffer']))
    selected.append(source/'qcommon/cmd.c')
    # This is the verbatim allocated-entity loop, not a rewritten test model.
    frame=extract(source/'game/g_main.c',['G_RunFrame'])
    loop=frame[frame.index('\tent = &g_entities[0];'):frame.index('end = trap_Milliseconds();')]
    (output/'entity_frame.inc').write_text('static void runEntities(void) {int i;gentity_t *ent;\n'+loop+'}\n')
    tournament=extract(source/'game/g_main.c',['CheckTournament'])
    (output/'tournament.inc').write_text('#define CheckTournament Original_CheckTournament\n'+tournament+'\n#undef CheckTournament\n')
    (output/'full_frame.inc').write_text('#define G_RunFrame Original_G_RunFrame\n#define CheckTournament Original_CheckTournament\n'+frame+'\n#undef CheckTournament\n#undef G_RunFrame\n')
    _,fields,classes,items=tables();implemented={n for names in FUNCTIONS.values() for n in names}|{'SP_item_botroam'}
    stubs=[]
    for index,(name,function) in enumerate(classes):
        if function not in implemented:stubs.append(f'void {function}(gentity_t *e) {{ boundary(e,2,{index}); }}')
    (output/'spawn_boundaries.inc').write_text('\n'.join(stubs)+'\n')
    (output/'server_functions.inc').write_text(extract(source/'server/sv_game.c',['SV_GentityNum','SV_SvEntityForGentity','SV_GEntityForSvEntity','SV_EntityContact','SV_SetBrushModel','SV_inPVS']))
    (output/'snapvector.inc').write_text(extract(source/'win32/win_shared.c',['Sys_SnapVector']))
    sources=[source/'qcommon'/n for n in ('cm_load.c','cm_trace.c','cm_test.c','cm_patch.c','cm_polylib.c','md4.c')]
    sources += [source/'game'/n for n in ('q_math.c','q_shared.c','bg_misc.c','bg_pmove.c','bg_slidemove.c')]
    hosts=[ROOT/'tests/reference'/n for n in ('collision_oracle.c','spawn_server.c','spawn_oracle.c')]
    extra=[]
    if lifecycle:
        from generate_game_cvars import tables as cvar_tables
        main_source, table, _ = cvar_tables()
        original=main_source.read_text(encoding='utf-8')
        typedef=re.search(r'typedef struct \{.*?\} cvarTable_t;',original,re.S)[0]
        declarations=original[original.index('vmCvar_t\tg_gametype;'):original.index('// bk001129 - made static')]
        (output/'game_cvar_table.inc').write_text(typedef+'\n'+declarations+'\n'+table+'\nstatic int gameCvarTableSize=sizeof(gameCvarTable)/sizeof(gameCvarTable[0]);\n',encoding='utf-8',newline='\n')
        additions={'g_main.c':['G_Printf','G_Error','G_LogPrintf','G_RemapTeamShaders','G_RegisterCvars','G_UpdateCvars','G_FindTeams','G_InitGame','G_ShutdownGame'],
                   'g_items.c':['ClearRegisteredItems','SaveRegisteredItems','G_CheckTeamItems'], 'g_team.c':['Team_InitGame','PrintMsg']}
        original_bodies=[]
        for filename,symbols in additions.items():
            original=(source/'game'/filename).read_text(encoding='utf-8')
            for symbol in symbols:
                match=re.search(r'^(?:static[ \t]+)?[\w* \t]+\b'+symbol+r'\s*\([^;]*?\)\s*\{.*?^\}',original,re.M|re.S)
                if not match:raise RuntimeError('Missing lifecycle function '+symbol)
                original_bodies.append(('#define PrintMsg Original_PrintMsg\n'+match[0]+'\n#undef PrintMsg') if symbol=='PrintMsg' else match[0])
        (output/'game_lifecycle_functions.inc').write_text('\n\n'.join(original_bodies)+'\n',encoding='utf-8',newline='\n')
        hosts.append(ROOT/'tests/reference/game_lifecycle_cvars.c')
        selected.append(source/'qcommon/cvar.c')
        extra=['/DMQ3_LIFECYCLE_ORACLE','/DCvar_Get=lifecycleCollisionCvarGet']
    run(['cl','/nologo','/Od','/Gy','/fp:strict','/arch:SSE2','/MT','/DWIN32','/DNDEBUG','/D_CRT_SECURE_NO_WARNINGS','/DMQ3_ORACLE_LIBRARY',
         f'/I{source/"game"}',f'/I{source/"qcommon"}',f'/I{output}',*extra,*sources,*hosts,f'/Fe:{output/"spawn_oracle.exe"}',
         '/link','/OPT:REF','/Brepro','/stack:8388608'],output,msvc_env('x86'),output/'build.log')
    return sources+selected+[source/'game/g_spawn.c',source/'game/g_local.h',source/'game/q_shared.h',source/'game/bg_public.h',source/'server/sv_game.c',source/'server/sv_world.c',source/'server/sv_init.c',source.parent/'ui/menudef.h']
