"""Verify the concrete BSP/game-level to server-snapshot runtime adapter."""
import argparse,json,re,struct,subprocess,sys,zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

def spawn_origin(data):
 off,size=struct.unpack_from('<ii',data,8);text=data[off:off+size].decode('latin1','replace')
 for block in re.findall(r'\{([^}]*)\}',text,re.S):
  pairs=dict(re.findall(r'"([^"]+)"\s+"([^"]*)"',block))
  if pairs.get('classname','').startswith('info_player') and 'origin' in pairs:
   values=[float(v) for v in pairs['origin'].split()]
   if len(values)==3:return values
 raise RuntimeError('map has no player spawn origin')

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);parser.add_argument('--bsp',type=Path);args=parser.parse_args()
 out=ROOT/'build/reference/snapshot_runtime';out.mkdir(parents=True,exist_ok=True)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_runtime_contracts.ml','--output','snapshot_runtime_contracts.exe'],cwd=ROOT,check=True)
 contracts=run([ROOT/'build/snapshot_runtime_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 16 snapshot-runtime contracts':raise RuntimeError(contracts)
 retail=[];bsp_path=args.bsp
 if args.data_root:
  with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:
   data=archive.read('maps/q3dm1.bsp')
  bsp_path=out/'q3dm1.bsp';bsp_path.write_bytes(data)
 if bsp_path:
  bsp_path=bsp_path.resolve()
  data=bsp_path.read_bytes();origin=spawn_origin(data)
  subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_runtime_map.ml','--output','snapshot_runtime_map.exe'],cwd=ROOT,check=True)
  result=run([ROOT/'build/snapshot_runtime_map.exe',bsp_path,*map(str,origin)],ROOT/'build',log=out/'retail.log',timeout=180).strip()
  if 'entities=2 ring=64,65 emitted=2 packetBytes=' not in result:raise RuntimeError(result)
  retail=[{'map':bsp_path.stem,'bsp_sha256':sha(bsp_path),'origin':origin,'result':result}];print(result)
 sources=[ROOT/'src/mq3/server/snapshot_runtime.ml',ROOT/'tests/snapshot_runtime_contracts.ml',ROOT/'tests/snapshot_runtime_map.ml']
 report={'passed':True,'contracts':16,'retail':retail,'scope':'Concrete adapter from collision.world/visibility and game Level entities/playerstates into snapshot_build host services, send-ready frame and persistent packet-entity ring.','remaining':'Live server scheduler ownership and per-client frame table integration remain open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(contracts)
if __name__=='__main__':main()
