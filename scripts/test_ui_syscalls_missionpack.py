#!/usr/bin/env python3
"""Complete native Missionpack UI syscall ABI, contract, and Retail gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

def functions(text):
    return set(re.findall(r'(?m)^function\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(',text))

def original_functions(text):
    return set(re.findall(r'(?m)^[A-Za-z_][\w \t*]*\b((?:trap_[A-Za-z0-9_]+|PASSFLOAT|dllEntry))\s*\(',text))

def bodies(text,names,mini=False):
    result={}
    for name in names:
        if name in ('PASSFLOAT','dllEntry'): continue
        if mini:
            match=re.search(r'(?m)^function\s+'+re.escape(name)+r'\([^)]*\)(.*?)end function',text,re.S)
            if not match: raise RuntimeError('missing MiniLang body '+name)
            op=re.search(r'\b(UI_[A-Z0-9_]+)\b',match.group(1))
        else:
            match=re.search(r'(?m)^[A-Za-z_][\w \t*]*\b'+re.escape(name)+r'\s*\([^;{}]*\)\s*\{(.*?)\n\}',text,re.S)
            if not match: raise RuntimeError('missing original body '+name)
            op=re.search(r'\bsyscall\s*\(\s*(UI_[A-Z0-9_]+)',match.group(1))
        if not op: raise RuntimeError('missing opcode in '+name)
        result[name]=op.group(1)
    return result

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
    source=ROOT/'Quake-III-Arena-original-source/code/ui/ui_syscalls.c'
    public=ROOT/'Quake-III-Arena-original-source/code/ui/ui_public.h'
    port=ROOT/'src/mq3/client/ui_syscalls_missionpack.ml'
    original=source.read_text(encoding='utf-8',errors='replace');ported=port.read_text(encoding='utf-8')
    symbols=original_functions(original)
    if len(symbols)!=89: raise RuntimeError(f'expected 89 original symbols, found {len(symbols)}')
    missing=sorted(symbols-functions(ported))
    if missing: raise RuntimeError('missing native symbols: '+', '.join(missing))
    original_map=bodies(original,symbols);ported_map=bodies(ported,symbols,True)
    wrong=[f'{name}: {original_map[name]} != {ported_map.get(name)}' for name in sorted(original_map) if original_map[name]!=ported_map.get(name)]
    if wrong: raise RuntimeError('opcode mapping mismatch\n'+'\n'.join(wrong))

    out=ROOT/'build/reference/ui_syscalls_missionpack';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/ui_syscalls_missionpack_oracle.c';oracle=out/'oracle.exe';code=source.parents[1]
    includes=[f'/I{code/name}' for name in ('ui','qcommon','renderer','client')]
    run(['cl','/nologo','/Od','/MT','/DWIN32',*includes,source,harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    mini=run([build('tests/ui_syscalls_missionpack_oracle.ml','ui_syscalls_missionpack_oracle.exe')],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini: raise RuntimeError('Missionpack UI syscall ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    contracts=run([build('tests/ui_syscalls_missionpack_contracts.ml','ui_syscalls_missionpack_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 92 Missionpack native UI syscall contracts': raise RuntimeError(contracts)
    retail=run([build('tests/ui_syscalls_missionpack_retail_probe.ml','ui_syscalls_missionpack_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build',log=out/'retail.log').strip()
    if retail!='PASS: 12 Retail Missionpack UI syscall probes renderer=2 sound=1 fs=1 cinematic=1': raise RuntimeError(retail)
    files=[source,public,port,harness,ROOT/'tests/ui_syscalls_missionpack_oracle.ml',ROOT/'tests/ui_syscalls_missionpack_contracts.ml',ROOT/'tests/ui_syscalls_missionpack_retail_probe.ml']
    report={'passed':True,'symbols':89,'trap_wrappers':87,'opcode_mappings':87,'abi_records':16,'contracts':92,'retail_contracts':12,
      'scope':'Complete native Missionpack ui_syscalls.c veneer with exact import ordinals, argument order, opaque pointer forwarding, binary32 bit transport and return conversion. Retail probes cover renderer, sound, filesystem, cvars, LAN, input, cinematics, CD-key handling and the production precompiler parser.',
      'host_boundary':'The module accepts a native host callback. It is suitable for CL_UISystemCalls or an adapter over the existing mq3.vm.syscall_ui services; it does not reinterpret native pointers as QVM offsets.',
      'remaining':'PunkBuster status remains a forwarded ABI action because the GPL engine has no PunkBuster client implementation. Network discovery, OS clipboard and actual audio/video presentation remain responsibilities of the installed host services.',
      'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 89 symbols / 87 exact opcodes + 92 native contracts + 12 Retail UI syscall probes')

if __name__=='__main__': main()
