"""Generate the complete original entityState_t storage codec, including trajectories."""
import json
import re
from toolchain import ROOT
from inventory import sha

def main():
    source=ROOT/'Quake-III-Arena-original-source/code/game/q_shared.h'
    body=source.read_text().split('typedef struct entityState_s {')[1].split('} entityState_t;')[0]
    body=re.sub(r'//[^\n]*|/\*.*?\*/','',body,flags=re.S)
    fields=[];flat=[];offset=0
    for declaration in body.split(';'):
        if not declaration.strip():continue
        m=re.fullmatch(r'\s*(int|vec3_t|trajectory_t)\s+(\w+)\s*',declaration)
        if not m:raise ValueError(declaration)
        kind,name=m.groups();count={'int':1,'vec3_t':3,'trajectory_t':9}[kind]
        fields.append({'name':name,'type':kind,'count':count,'offset':offset})
        if kind=='trajectory_t':
            for sub,typ,num,delta in [('trType','int',1,0),('trTime','int',1,4),('trDuration','int',1,8),('trBase','float',3,12),('trDelta','float',3,24)]:
                flat.append({'name':name+'.'+sub,'type':typ,'count':num,'offset':offset+delta})
        else:flat.append({'name':name,'type':'float' if kind=='vec3_t' else 'int','count':count,'offset':offset})
        offset+=count*4
    lines=['// Copyright (C) 1999-2005 Id Software, Inc.','// SPDX-License-Identifier: GPL-2.0-or-later',
           '// Generated from pinned q_shared.h; storage layout, not delta network encoding.',
           'package mq3.game.entitystate','import mq3.compat.numeric as n','import mq3.game.trajectory as tr',f'const BYTE_SIZE = {offset}',
           'struct EntityState',*['  '+f['name'] for f in fields],'end struct','','function create()']
    defaults={'int':'0','vec3_t':'[0.0,0.0,0.0]','trajectory_t':'tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0])'}
    lines+=['  return EntityState('+','.join(defaults[f['type']] for f in fields)+')','end function','','function load(data,offset)',
            '  if offset < 0 or offset+BYTE_SIZE > len(data) then return error(482,"Truncated entityState") end if','  state = create()']
    for f in flat:
        values=[f'n.readI32(data,offset+{f["offset"]+i*4})' for i in range(f['count'])]
        if f['type']=='float':values=['n.bitsFloat('+v+')' for v in values]
        lines+=['  state.'+f['name']+' = '+(values[0] if f['count']==1 else '['+','.join(values)+']')]
    lines+=['  return state','end function','','function words(state)','  result = []']
    for f in flat:
        values=['state.'+f['name']+(f'[{i}]' if f['count']>1 else '') for i in range(f['count'])]
        values=[('n.floatBits(' if f['type']=='float' else 'n.u32(')+v+')' for v in values]
        lines+=['  result = result+['+','.join(values)+']']
    lines+=['  return result','end function','']
    lines+=['function copy(source)','  state = create()']
    for f in flat:
        value='source.'+f['name']
        if f['count']>1:value='['+','.join(value+f'[{i}]' for i in range(f['count']))+']'
        lines+=['  state.'+f['name']+' = '+value]
    lines+=['  return state','end function','']
    (ROOT/'src/mq3/game/entitystate.ml').write_text('\n'.join(lines))
    (ROOT/'docs/reference/entitystate.json').write_text(json.dumps({'source_sha256':sha(source),'size':offset,'fields':fields,'flat_fields':flat},indent=2)+'\n')
    print(f'Generated {len(fields)} entity fields / {offset} bytes')
if __name__=='__main__':main()
