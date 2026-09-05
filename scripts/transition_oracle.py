"""Build unchanged game functions with the actual original server collision."""
import json
import re
from toolchain import ROOT,msvc_env,run

def extract(source,names):
    text=source.read_text();out=[]
    for name in names:
        match=re.search(r'^[\w* \t]+\b'+re.escape(name)+r'\s*\([^;{}]*\)\s*\{',text,re.M)
        if not match:raise RuntimeError('Missing original function '+name)
        end=match.end();depth=1
        while depth:
            if text[end]=='{':depth+=1
            elif text[end]=='}':depth-=1
            end+=1
        out.append(text[match.start():end])
    return '\n\n'.join(out)+'\n'

def build(output):
    source=ROOT/'Quake-III-Arena-original-source/code'
    functions={'g_active.c':['G_TouchTriggers'], 'g_misc.c':['TeleportPlayer'], 'g_client.c':['SetClientViewAngle'],
               'g_utils.c':['G_InitGentity','G_Spawn','G_EntitiesFree','G_FreeEntity','G_TempEntity','G_KillBox','G_SetOrigin','G_Find','G_PickTarget'],
               'g_trigger.c':['trigger_push_touch','trigger_teleporter_touch']}
    selected=[];body=['#define MAXCHOICES 32']
    for name,names in functions.items():
        path=source/'game'/name;selected.append(path);body.append(extract(path,names))
    (output/'game_functions.inc').write_text('\n'.join(body))
    path=source/'server/sv_game.c';selected.append(path)
    (output/'server_functions.inc').write_text(extract(path,['SV_GentityNum','SV_SvEntityForGentity','SV_GEntityForSvEntity','SV_EntityContact']))
    checks=['#include <stddef.h>']
    for name,ctype in [('entitystate','entityState_t'),('playerstate','playerState_t')]:
        schema=json.loads((ROOT/f'docs/reference/{name}.json').read_text())
        checks.append(f'typedef char size_{name}[(sizeof({ctype})=={schema["size"]})?1:-1];')
        for field in schema.get('flat_fields',schema['fields']):
            fieldname=field['name'];offset=field['offset'];size=field['count']*4
            checks.append(f'typedef char offset_{name}_{fieldname.replace(".","_")}[(offsetof({ctype},{fieldname})=={offset} && sizeof((({ctype}*)0)->{fieldname})=={size})?1:-1];')
    (output/'state_offsets.inc').write_text('\n'.join(checks)+'\n')
    (output/'snapvector.inc').write_text(extract(source/'win32/win_shared.c',['Sys_SnapVector']))
    sources=[source/'qcommon'/n for n in ('cm_load.c','cm_trace.c','cm_test.c','cm_patch.c','cm_polylib.c','md4.c')]
    sources += [source/'game'/n for n in ('q_math.c','q_shared.c','bg_misc.c','bg_pmove.c','bg_slidemove.c')]
    host=[ROOT/'tests/reference'/n for n in ('collision_oracle.c','transition_server.c','transition_oracle.c')]
    run(['cl','/nologo','/Od','/Gy','/fp:strict','/arch:SSE2','/MT','/DWIN32','/DNDEBUG','/D_CRT_SECURE_NO_WARNINGS','/DMQ3_ORACLE_LIBRARY',
         f'/I{source/"game"}',f'/I{source/"qcommon"}',f'/I{output}',*sources,*host,
         f'/Fe:{output/"transition_oracle.exe"}','/link','/OPT:REF','/Brepro','/stack:8388608'],output,msvc_env('x86'),output/'build.log')
    return sources+selected+[source/'server/sv_world.c',source/'server/server.h',source/'game/g_local.h',source/'game/q_shared.h',source/'game/bg_public.h',source/'game/g_public.h',source/'win32/win_shared.c']
