#!/usr/bin/env python3
"""Baseq3 sv_ccmds.c unchanged-C, native, and Retail BSP gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

FUNCTIONS=['Cmd_Argv','SV_AddOperatorCommands','SV_BanNum_f','SV_Ban_f','SV_ConSay_f','SV_DumpUser_f','SV_Heartbeat_f','SV_KickNum_f','SV_Kick_f','SV_KillServer_f','SV_MapRestart_f','SV_Map_f','SV_RemoveOperatorCommands','SV_Serverinfo_f','SV_Status_f','SV_Systeminfo_f']

def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def pak0(root):
    direct=root/'pak0.pk3';nested=root/'baseq3/pak0.pk3'
    if direct.is_file(): return direct
    if nested.is_file(): return nested
    raise FileNotFoundError('pak0.pk3 not found below '+str(root))

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,required=True);args=parser.parse_args()
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_ccmds.c';port=ROOT/'src/mq3/server/operator_commands.ml';original=source.read_text(encoding='utf-8',errors='replace');ported=port.read_text(encoding='utf-8')
    if len(FUNCTIONS)!=16: raise RuntimeError('operator-command symbol inventory changed')
    for name in FUNCTIONS:
        if name not in original: raise RuntimeError('missing original ledger token '+name)
        if not re.search(r'(?m)^function\s+'+re.escape(name)+r'\s*\(',ported): raise RuntimeError('missing ported symbol '+name)
    for fragment in ['SNAPFLAG_SERVERCOUNT','"banUser "+address','"map_restart\\n"','nextHeartbeat=-9999999','"spdevmap"','"sectorlist"']:
        if fragment not in ported: raise RuntimeError('missing operator semantic marker '+fragment)

    out=ROOT/'build/reference/server_operator_commands';out.mkdir(parents=True,exist_ok=True)
    (out/'sv_ccmds_under_test.inc').write_bytes(source.read_bytes())
    real=(ROOT/'Quake-III-Arena-original-source/code/server/server.h').as_posix()
    (out/'server.h').write_text('#ifndef TEST_SERVER_H\n#define TEST_SERVER_H\n#include "'+real+'"\n#endif\n',encoding='ascii',newline='\n')
    harness=ROOT/'tests/reference/server_operator_commands_oracle.c';oracle=out/'oracle.exe';code=source.parents[1]
    includes=[f'/I{out}',f'/I{code}/server',f'/I{code}/qcommon',f'/I{code}/game']
    run(['cl','/nologo','/Od','/MT','/DWIN32',*includes,harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log');mini=run([build('tests/server_operator_commands_oracle.ml','server_operator_commands_oracle.exe')],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini: raise RuntimeError('server operator unchanged-C mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    contracts=run([build('tests/server_operator_commands_contracts.ml','server_operator_commands_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 29 server operator-command contracts': raise RuntimeError(contracts)
    retail=run([build('tests/server_operator_commands_retail_probe.ml','server_operator_commands_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build',log=out/'retail.log').strip()
    if not retail.startswith('PASS: 6 Retail server operator probes q3dm1=1906708 q3dm17=2286376'): raise RuntimeError(retail)
    files=[source,port,harness,ROOT/'tests/server_operator_commands_oracle.ml',ROOT/'tests/server_operator_commands_contracts.ml',ROOT/'tests/server_operator_commands_retail_probe.ml']
    report={'passed':True,'symbols':16,'differential_records':len(native.splitlines()),'contracts':29,'retail_contracts':6,
      'scope':'Complete Baseq3 operator-console command behavior: guarded map loads, map/devmap/spmap policy, delayed/slow/fast restarts, client reconnect, kick/ban, status and user info, console chat, heartbeat, info, shutdown and idempotent command registration.',
      'host_boundary':'Spawn, VM frames/reconnect, reliable server commands, drops, authorize DNS/OOB traffic, configstrings, shutdown and command registration are typed host actions suitable for the existing server runtime.',
      'remaining':'The original authentication service may no longer answer; banUser/banClient still emit the exact authorize-server OOB request. SV_RemoveOperatorCommands intentionally remains a no-op because the entire original removal block is disabled with #if 0.',
      'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 16 server operator symbols + '+str(len(native.splitlines()))+' C records + 29 contracts + 6 Retail probes')

if __name__=='__main__': main()
