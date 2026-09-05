"""Generate literal baseq3 spawn tables from the pinned original source."""
import json
import re
from toolchain import ROOT
from inventory import sha
from generate_game_constants import baseq3

def tables():
    source=ROOT/'Quake-III-Arena-original-source/code/game/g_spawn.c'
    text=baseq3(source.read_text())
    fields=re.findall(r'\{"(\w+)",\s*(?:FOFS\(([^)]+)\)|0),\s*(F_\w+)\}',text.split('field_t fields[]')[1].split('{NULL}')[0])
    spawns=re.findall(r'\{"([^"]+)",\s*(SP_\w+)\}',text.split('spawn_t\tspawns[]')[1].split('{0, 0}')[0])
    items=baseq3((source.parent/'bg_misc.c').read_text()).split('bg_itemlist[]')[1].split('int\t\tbg_numItems')[0]
    names=[];depth=0;start=0
    for token in re.finditer(r'"(?:\\.|[^"\\])*"|[{}]',items):
        if token[0]=='{':
            depth+=1
            if depth==2:start=token.end()
        elif token[0]=='}':
            if depth==2:
                name=re.match(r'\s*"([^"]+)"',items[start:token.start()])
                if name:names.append(name[1])
            depth-=1
    assert len(fields)==20 and len(names)==35 and len(spawns)==48
    return source,fields,spawns,names

def main():
    source,fields,spawns,items=tables()
    lines=['// Copyright (C) 1999-2005 Id Software, Inc.','// SPDX-License-Identifier: GPL-2.0-or-later',
           '// Generated from pinned g_spawn.c/bg_misc.c, baseq3 only.','package mq3.game.spawn_tables',
           'function fields()','  return '+json.dumps([list(f) for f in fields]),'end function',
           'function classes()','  return '+json.dumps([n for n,f in spawns]),'end function',
           'function items()','  return '+json.dumps(['']+items),'end function','']
    (ROOT/'src/mq3/game/spawn_tables.ml').write_text('\n'.join(lines))
    (ROOT/'docs/reference/spawn.json').write_text(json.dumps({'source_sha256':sha(source),'fields':fields,'spawns':spawns,'items':['']+items},indent=2)+'\n')
    print(f'Generated {len(fields)} fields, {len(spawns)} spawn classes and {len(items)} items')
if __name__=='__main__':main()
