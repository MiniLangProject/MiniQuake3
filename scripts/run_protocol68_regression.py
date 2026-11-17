#!/usr/bin/env python3
"""Read-only-source protocol regressions and bounded hot-path measurements."""
from __future__ import annotations
import hashlib
import json
from pathlib import Path
import re
import statistics
import subprocess
import sys
import time
from toolchain import ROOT


def main() -> int:
    out=ROOT/'build/protocol68-evidence';out.mkdir(parents=True,exist_ok=True)
    paths=subprocess.check_output(['git','ls-files','-z','src','native','tests','scripts'],cwd=ROOT).decode().split('\0')
    def hashes(): return {p:hashlib.sha256((ROOT/p).read_bytes()).hexdigest() for p in paths if p and (ROOT/p).is_file()}
    before=hashes()
    report={'status':'running','source_commit':subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip(), 'steps':[],
            'limits':['Function-level original-C comparisons and MiniLang UDP scenarios are not full-game bidirectional interoperability.',
                      'Microbenchmarks are same-process algorithm measurements, not FPS or WAN throughput claims.']}
    steps=[('fragment-build',[sys.executable,'scripts/build_release.py','--source','tests/network_fragment_ingress_contracts.ml','--output','network_fragment_ingress_contracts.exe']),
           ('fragment-run',[ROOT/'build/network_fragment_ingress_contracts.exe']),
           *[(name,[sys.executable,'scripts/'+name+'.py']) for name in ['test_client_netchan','test_server_netchan','test_client_network_ingress','test_network_match_multi','test_shared_game','test_remote_session_commands','test_server_command_stream','test_gamestate']],
           ('benchmark-build',[sys.executable,'scripts/build_release.py','--source','tests/network_hotpath_bench.ml','--output','network_hotpath_bench.exe']),
           ('benchmark-run',[ROOT/'build/network_hotpath_bench.exe'])]
    failed=False
    try:
        for name,command in steps:
            started=time.monotonic();log=out/(name+'.log');code=None
            try:
                with log.open('w',encoding='utf-8') as stream:
                    result=subprocess.run([str(x) for x in command],cwd=ROOT,stdout=stream,stderr=subprocess.STDOUT,timeout=900)
                code=result.returncode
            except (OSError,subprocess.TimeoutExpired) as error:
                with log.open('a',encoding='utf-8') as stream:stream.write('\n'+repr(error)+'\n')
            report['steps'].append({'name':name,'exit_code':code,'seconds':round(time.monotonic()-started,3)})
            print(log.read_text(encoding='utf-8',errors='replace')[-16000:],flush=True)
            if code!=0:failed=True
        text=(out/'benchmark-run.log').read_text(encoding='utf-8',errors='replace')
        rows=[dict(zip(['string_before_ms','string_after_ms','xor_before_ms','xor_after_ms'],map(int,row))) for row in re.findall(r'BENCH sample=\d+ string_before_ms=(\d+) string_after_ms=(\d+) xor_before_ms=(\d+) xor_after_ms=(\d+)',text)]
        report['microbenchmark_samples']=rows
        if len(rows)==5:report['microbenchmark_medians_ms']={k:statistics.median(row[k] for row in rows) for k in rows[0]}
        if hashes()!=before:raise RuntimeError('Tracked source bytes changed during regression')
        subprocess.run(['git','diff','--exit-code'],cwd=ROOT,check=True)
        report['source_bytes_unchanged']=True;report['status']='failed' if failed else 'passed'
        return 1 if failed else 0
    finally:
        (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
        (out/'source-hashes.json').write_text(json.dumps(before,indent=2)+'\n',encoding='utf-8')


if __name__=='__main__':raise SystemExit(main())
