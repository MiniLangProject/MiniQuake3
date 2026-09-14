#!/usr/bin/env python3
from pathlib import Path
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[1]
ENTITY=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_entity.c'
MOVE=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_move.c'
entity=ENTITY.read_text(encoding='latin-1');move=MOVE.read_text(encoding='latin-1')
for anchor in ('ent->i.update_time = AAS_Time() - ent->i.ltime','VectorCopy(ent->i.origin, ent->i.lastvisorigin)','Com_Memcpy(info, &aasworld.entities[entnum].i, sizeof(aas_entityinfo_t))'):
    if anchor not in entity: raise SystemExit('FAIL: missing be_aas_entity.c anchor: '+anchor)
for anchor in ('int AAS_Swimming','testorg[2] -= 2','CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER'):
    if anchor not in move: raise SystemExit('FAIL: missing be_aas_move.c anchor: '+anchor)
subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/aas_entity_queries_contracts.ml','--output','aas_entity_queries_contracts.exe'],cwd=ROOT,check=True)
result=subprocess.run([ROOT/'build/aas_entity_queries_contracts.exe'],cwd=ROOT/'build',text=True,capture_output=True,check=True).stdout.strip()
if result!='PASS: 15 AAS entity/movement-query contracts': raise SystemExit(result)
print(result+' + original source anchors')
