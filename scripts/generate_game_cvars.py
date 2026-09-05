"""Extract the pinned Baseq3 game Cvar table, preserving row order and flags."""
import json
import re
from generate_game_constants import baseq3
from inventory import sha
from toolchain import ROOT


def tables():
    source = ROOT / 'Quake-III-Arena-original-source/code/game/g_main.c'
    original = source.read_text()
    body = re.search(r'static cvarTable_t\s+gameCvarTable\[\]\s*=\s*\{.*?^\};', original, re.M | re.S)[0]
    flags = {'0': 0, 'CVAR_ARCHIVE': 1, 'CVAR_USERINFO': 2, 'CVAR_SERVERINFO': 4,
             'CVAR_SYSTEMINFO': 8, 'CVAR_INIT': 16, 'CVAR_LATCH': 32, 'CVAR_ROM': 64,
             'CVAR_USER_CREATED': 128, 'CVAR_TEMP': 256, 'CVAR_CHEAT': 512, 'CVAR_NORESTART': 1024}
    rows = []
    for row in re.findall(r'\{([^{}]+)\}', baseq3(body)):
        parts = [p.strip() for p in row.split(',')]
        parts += ['0'] * (7 - len(parts))
        vm, name, default, expr, count, track, shader = parts
        value = 0
        for flag in expr.split('|'):
            value |= flags[flag.strip()]
        rows.append([vm.removeprefix('&') if vm != 'NULL' else '', json.loads(name),
                     'baseq3' if default == 'GAMEVERSION' else '' if default == '__DATE__' else json.loads(default),
                     value, int(count), track == 'qtrue', shader == 'qtrue'])
    assert len(rows) == 46 and sum(bool(row[0]) for row in rows) == 43
    assert not any(row[6] for row in rows)
    return source, body, rows


def main():
    source, _, rows = tables()
    lines = ['// Copyright (C) 1999-2005 Id Software, Inc.', '// SPDX-License-Identifier: GPL-2.0-or-later',
             '// Generated from pinned g_main.c, Baseq3 only. Build date is supplied by the module host.',
             'package mq3.game.cvar_tables', 'function entries(buildDate)', '  return [']
    for i, row in enumerate(rows):
        fields = [json.dumps(v) for v in row]
        if row[1] == 'gamedate': fields[2] = 'buildDate'
        lines.append('    [' + ','.join(fields) + ']' + (',' if i + 1 < len(rows) else ''))
    lines += ['  ]', 'end function', '']
    (ROOT / 'src/mq3/game/cvar_tables.ml').write_text('\n'.join(lines), encoding='utf-8', newline='\n')
    (ROOT / 'docs/reference/game_cvars.json').write_text(json.dumps(
        dict(source_sha256=sha(source), profile='baseq3', build_date='supplied explicitly by module host', rows=rows),
        indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f'Generated {len(rows)} Baseq3 Cvars / {sum(bool(r[0]) for r in rows)} VM snapshots')


if __name__ == '__main__':
    main()
