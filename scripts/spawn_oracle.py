"""Original g_spawn.c plus real positional/trigger spawn functions and server CM.

Unported item/class functions are recorded boundaries, never simplified gameplay.
"""
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
from generate_spawn import tables

FUNCTIONS={
    'g_utils.c':['G_InitGentity','G_Spawn','G_EntitiesFree','G_FreeEntity','G_SetOrigin','G_Find','G_PickTarget','G_FindConfigstringIndex','G_ModelIndex','G_SoundIndex','G_SetMovedir','G_TempEntity','G_KillBox','vtos'],
    'g_client.c':['SetClientViewAngle','SP_info_player_deathmatch','SP_info_player_start','SP_info_player_intermission'],
    'g_misc.c':['TeleportPlayer','SP_info_null','SP_info_notnull','SP_info_camp','SP_light','SP_misc_model','SP_misc_teleporter_dest'],
    'g_target.c':['SP_target_position'],
    'g_team.c':['SP_team_CTF_redplayer','SP_team_CTF_blueplayer','SP_team_CTF_redspawn','SP_team_CTF_bluespawn'],
    'g_mover.c':['SP_path_corner'],
    'g_main.c':['G_RunThink'],
    'g_trigger.c':['InitTrigger','AimAtTarget','SP_trigger_push','SP_trigger_teleport','trigger_push_touch','trigger_teleporter_touch'],
    'g_active.c':['G_TouchTriggers'],
}
def build(output):
    output.mkdir(parents=True,exist_ok=True);source=ROOT/'Quake-III-Arena-original-source/code'
    body=['#define MAXCHOICES 32'];selected=[]
    for name,names in FUNCTIONS.items():
        path=source/'game'/name;selected.append(path);body.append(extract(path,names))
    (output/'spawn_functions.inc').write_text('\n'.join(body))
    _,fields,classes,items=tables();implemented={n for names in FUNCTIONS.values() for n in names}|{'SP_item_botroam'}
    stubs=[]
    for index,(name,function) in enumerate(classes):
        if function not in implemented:stubs.append(f'void {function}(gentity_t *e) {{ boundary(e,2,{index}); }}')
    (output/'spawn_boundaries.inc').write_text('\n'.join(stubs)+'\n')
    (output/'server_functions.inc').write_text(extract(source/'server/sv_game.c',['SV_GentityNum','SV_SvEntityForGentity','SV_GEntityForSvEntity','SV_EntityContact','SV_SetBrushModel']))
    (output/'snapvector.inc').write_text(extract(source/'win32/win_shared.c',['Sys_SnapVector']))
    sources=[source/'qcommon'/n for n in ('cm_load.c','cm_trace.c','cm_test.c','cm_patch.c','cm_polylib.c','md4.c')]
    sources += [source/'game'/n for n in ('q_math.c','q_shared.c','bg_misc.c','bg_pmove.c','bg_slidemove.c')]
    hosts=[ROOT/'tests/reference'/n for n in ('collision_oracle.c','spawn_server.c','spawn_oracle.c')]
    run(['cl','/nologo','/Od','/Gy','/fp:strict','/arch:SSE2','/MT','/DWIN32','/DNDEBUG','/D_CRT_SECURE_NO_WARNINGS','/DMQ3_ORACLE_LIBRARY',
         f'/I{source/"game"}',f'/I{source/"qcommon"}',f'/I{output}',*sources,*hosts,f'/Fe:{output/"spawn_oracle.exe"}',
         '/link','/OPT:REF','/Brepro','/stack:8388608'],output,msvc_env('x86'),output/'build.log')
    return sources+selected+[source/'game/g_spawn.c',source/'game/g_local.h',source/'game/q_shared.h',source/'game/bg_public.h',source/'server/sv_game.c',source/'server/sv_world.c']
