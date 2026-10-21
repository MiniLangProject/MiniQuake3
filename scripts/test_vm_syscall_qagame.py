"""Verify the server-specific qagame syscall ABI and safe service bridge."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env

def main():
    out=ROOT/'build/reference/vm_syscall_qagame';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/vm_syscall_qagame_oracle.c';oracle=out/'oracle.exe'
    original=ROOT/'Quake-III-Arena-original-source/code'
    server_source=original/'server/sv_game.c'
    source_text=server_source.read_text(encoding='utf-8',errors='replace')
    covered_cases=['G_LOCATE_GAME_DATA','G_DROP_CLIENT','G_SEND_SERVER_COMMAND','G_SET_CONFIGSTRING',
      'G_GET_CONFIGSTRING','G_GET_USERINFO','G_SET_USERINFO','G_GET_SERVERINFO','G_SET_BRUSH_MODEL',
      'G_IN_PVS','G_IN_PVS_IGNORE_PORTALS','G_ADJUST_AREA_PORTAL_STATE','G_AREAS_CONNECTED',
      'G_LINKENTITY','G_UNLINKENTITY','G_BOT_ALLOCATE_CLIENT','G_BOT_FREE_CLIENT','G_GET_ENTITY_TOKEN']
    covered_cases += ['G_FS_GETFILELIST','G_DEBUG_POLYGON_CREATE','G_DEBUG_POLYGON_DELETE','G_REAL_TIME','G_SNAPVECTOR','G_FS_SEEK']
    missing=[name for name in covered_cases if f'case {name}:' not in source_text]
    if missing:raise RuntimeError('covered SV_GameSystemCalls cases missing: '+', '.join(missing))
    run(['cl','/nologo','/Od','/MT','/DWIN32',f'/I{original/"game"}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_qagame_oracle.ml','--output','vm_syscall_qagame_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/vm_syscall_qagame_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('qagame public ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_qagame_contracts.ml','--output','vm_syscall_qagame_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/vm_syscall_qagame_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 47 qagame-specific syscall contracts':raise RuntimeError(value)
    files=[server_source,harness,ROOT/'tests/vm_syscall_qagame_oracle.ml',ROOT/'src/mq3/vm/syscall_qagame.ml',ROOT/'tests/vm_syscall_qagame_contracts.ml']
    report={'passed':True,'records':4,'contracts':47,
      'scope':'qagame opcodes 15-23, 26-31, 34-42 and 45: game-data registration, client/control strings, server state, brush models, PVS/portals, entity links, bot slots, spawn tokens, file lists, debug polygons, real time, SnapVector and FS_Seek.',
      'oracle':'Original Baseq3 g_public.h compiled directly to freeze GAME_API_VERSION, ABI scalar/vector/qtime widths and every covered server-specific trap ordinal; all 24 cases are also required in unchanged sv_game.c.',
      'safety':'Argument vectors, masked VM pointers, vectors, strings, output spans, game-data strides/counts, callback availability and unsupported binary-structure traps are checked.',
      'remaining':'Trace, point contents, EntitiesInBox, EntityContact and GetUsercmd are handled by the separate binary-world bridge. Productive debug-polygon drawing and host file enumeration still depend on supplied subsystem adapters.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 qagame-ABI records + {report['contracts']} qagame-specific syscall contracts")
if __name__=='__main__':main()
