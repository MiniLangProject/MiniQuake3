"""Transfer the pinned 162-entry normal table with exact C float values."""
import re, struct
from toolchain import ROOT

def render():
    source=(ROOT/'Quake-III-Arena-original-source/code/game/q_math.c').read_text(encoding='utf-8')
    body=re.search(r'bytedirs\[NUMVERTEXNORMALS\]\s*=\s*\{(.*?)\n\};',source,re.S)[1]
    rows=re.findall(r'\{([^{}]+)\}',body)
    values=[[struct.unpack('<f',struct.pack('<f',float(v.strip().rstrip('fF'))))[0] for v in row.split(',')] for row in rows]
    assert len(values)==162 and all(len(v)==3 for v in values)
    return '// Copyright (C) 1999-2005 Id Software, Inc.\n// SPDX-License-Identifier: GPL-2.0-or-later\n// Generated from pinned q_math.c by scripts/generate_directions.py.\npackage mq3.shared.bytedirs\nfunction values()\n  return '+repr(values)+'\nend function\n'

if __name__=='__main__':
    (ROOT/'src/mq3/shared/bytedirs.ml').write_text(render(),encoding='utf-8',newline='\n')
