"""Productive snapshot-to-Cgame timing integration contracts."""
from pathlib import Path
import hashlib,json,subprocess,sys

ROOT=Path(__file__).resolve().parents[1]
def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()
def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_clock_contracts.ml','--output','cgame_clock_contracts.exe'],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/'build/cgame_clock_contracts.exe'],cwd=ROOT/'build',capture_output=True,text=True,check=True).stdout.strip()
    if result!='PASS: 19 productive cgame-clock contracts': raise RuntimeError(result)
    sources=[ROOT/'src/mq3/client/cgame_clock.ml',ROOT/'src/mq3/client/cgame_time.ml',ROOT/'tests/cgame_clock_contracts.ml']
    report={'passed':True,'contracts':19,'scope':'Productive snapshot publication, first-snapshot activation, drift/nudge, pause and monotonic Cgame frame time.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    out=ROOT/'build/reference/cgame_clock';out.mkdir(parents=True,exist_ok=True);(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(result)
if __name__=='__main__': main()
