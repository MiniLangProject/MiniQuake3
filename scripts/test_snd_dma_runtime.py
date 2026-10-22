"""Coverage and integration checks for the complete client/snd_dma.c adapter."""
import json
import re
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    source=ROOT/'Quake-III-Arena-original-source/code/client/snd_dma.c'
    target=ROOT/'src/mq3/audio/snd_dma_runtime.ml'
    contracts=ROOT/'tests/snd_dma_runtime_contracts.ml'
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'))
    item=next(entry for entry in ledger['files'] if entry['source']=='code/client/snd_dma.c')
    text=target.read_text(encoding='utf-8')
    missing=[name for name in item['symbol_candidates'] if re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',text) is None]
    if missing: raise RuntimeError('snd_dma symbols missing: '+', '.join(missing))
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snd_dma_runtime_contracts.ml','--output','snd_dma_runtime_contracts.exe'],cwd=ROOT,check=True)
    native=run([ROOT/'build/snd_dma_runtime_contracts.exe'],ROOT/'build',log=ROOT/'build/reference/snd_dma_runtime-contracts.log').strip()
    if native!='PASS: 25 snd dma runtime contracts': raise RuntimeError(native)
    dependencies=[
      ROOT/'src/mq3/audio/snd_channels.ml',ROOT/'src/mq3/audio/snd_spatialize.ml',
      ROOT/'src/mq3/audio/snd_loop_channels.ml',ROOT/'src/mq3/audio/snd_raw_stream.ml']
    result={'passed':True,'symbols':len(item['symbol_candidates']),'contracts':25,
      'scope':'All client/snd_dma.c entry points are represented by the stateful adapter; initialization, registry, one-shots, loops, spatial listener state, raw PCM, background music, clocks and teardown are exercised while existing unchanged-C differential suites validate the delegated mixer algorithms.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [source,target,contracts,*dependencies]}}
    out=ROOT/'build/reference/snd_dma_runtime';out.mkdir(parents=True,exist_ok=True)
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['symbols']} snd_dma symbols + {result['contracts']} runtime contracts")
if __name__=='__main__': main()
