"""Translate baseq3 enum constants and item tags from the pinned source data."""
import re
from toolchain import ROOT

def baseq3(text):
    text=re.sub(r'/\*.*?\*/|//[^\n]*','',text,flags=re.S)
    return re.sub(r'#ifdef MISSIONPACK\b.*?#endif','',text,flags=re.S)

def main():
    folder=ROOT / 'Quake-III-Arena-original-source/code/game'
    text=baseq3((folder / 'bg_public.h').read_text())
    enums=('pmtype_t','weaponstate_t','statIndex_t','persEnum_t','powerup_t','holdable_t','weapon_t','entity_event_t','animNumber_t','team_t')
    values={}
    for body,name in re.findall(r'typedef\s+enum\s*\{([^{}]*)\}\s*(\w+)\s*;',text):
        if name not in enums: continue
        value=0
        for member in body.split(','):
            member=member.strip()
            if not member: continue
            parts=member.split('=');key=parts[0].strip()
            if len(parts)==2: value=int(parts[1].strip(),0)
            if not re.fullmatch(r'\w+',key): raise ValueError(key)
            values[key]=value;value+=1
    items=baseq3((folder / 'bg_misc.c').read_text()).split('bg_itemlist[]')[1].split('int\t\tbg_numItems')[0]
    tags=[0]
    for tag in re.findall(r'\bIT_\w+\s*,\s*(\w+)\s*,',items):
        tags.append(values[tag] if tag in values else int(tag,0))
    lines=['// Copyright (C) 1999-2005 Id Software, Inc.','// SPDX-License-Identifier: GPL-2.0-or-later',
           '// Generated source data, baseq3 without MISSIONPACK.','package mq3.game.constants']
    lines += [f'const {key} = {value}' for key,value in values.items()]
    lines += ['', 'function itemTag(index)', '  tags = ['+','.join(map(str,tags))+']',
              '  if index < 0 or index >= len(tags) then return error(471,"Invalid baseq3 item index") end if',
              '  return tags[index]','end function','']
    (ROOT / 'src/mq3/game/constants.ml').write_text('\n'.join(lines))
    print(f'Generated {len(values)} enum constants and {len(tags)} item tags')

if __name__=='__main__':main()
