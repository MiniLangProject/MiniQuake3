"""Unchanged CG_ConsoleCommand differential and productive retail-QVM gate."""
from __future__ import annotations
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

COMMANDS=("sizeup","SIZEDOWN","+scores","-scores","+zoom","-zoom","startOrbit","unknown","kill")

def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,required=True);parser.add_argument('--qvms',type=Path,default=ROOT/'build/reference/qvms');args=parser.parse_args()
    source=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_consolecmds.c'
    output=ROOT/'build/reference/cgame_console_commands';output.mkdir(parents=True,exist_ok=True)
    (output/'cgame_console_command_under_test.inc').write_text(extract(source,['CG_ConsoleCommand']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/cgame_console_command_oracle.c';oracle=output/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/W4',f'/I{output}',harness,f'/Fe:{oracle}','/link','/Brepro'],output,msvc_env('x86'),output/'oracle-build.log')
    native=run([oracle],output,log=output/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_console_command_retail_probe.ml','--output','cgame_console_command_retail_probe.exe'],cwd=ROOT,check=True)
    pak=(args.data_root/'baseq3/pak0.pk3').resolve()
    result=run([ROOT/'build/cgame_console_command_retail_probe.exe',pak,args.qvms.resolve()],ROOT/'build',log=output/'minilang.log',timeout=240)
    lines=result.splitlines();mini='\n'.join(lines[:len(COMMANDS)])+'\n'
    if native!=mini: raise RuntimeError('Cgame console dispatch mismatch\nC:\n'+native+'MiniLang/QVM:\n'+mini)
    if len(lines)!=len(COMMANDS)+1 or not lines[-1].startswith('PASS: retail Cgame console commands registered='): raise RuntimeError(result)
    table=source.read_text(encoding='latin-1')
    for name in ('sizeup','sizedown','+scores','-scores','weapnext','weapon','tell_target','startOrbit','kill','say','callvote'):
        if f'{{ "{name}"' not in table and f'trap_AddCommand ("{name}")' not in table: raise RuntimeError('original command table anchor drift: '+name)
    files=[source,harness,ROOT/'src/mq3/engine/local_qvm_match.ml',ROOT/'src/mq3/qcommon/command_buffer.ml',ROOT/'tests/cgame_console_command_retail_probe.ml']
    report={'passed':True,'records':len(COMMANDS),'retail':lines[-1],'functions':['CG_ConsoleCommand','CG_InitConsoleCommands'],'scope':'Completion-only Cgame registrations now enter the productive Cmd registry; Cmd_ExecuteString dispatches the shared token state through Cgame, server game, UI and connected-server forwarding in original order.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (output/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {len(COMMANDS)} unchanged CG_ConsoleCommand records + {lines[-1]}')
    return 0
if __name__=='__main__': raise SystemExit(main())
