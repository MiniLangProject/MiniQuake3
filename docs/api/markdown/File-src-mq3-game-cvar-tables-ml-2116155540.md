# `src/mq3/game/cvar_tables.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.cvar_tables`](Package-mq3-game-cvar-tables-1260961244.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-game-cvar-tables-entries-function-entries-builddate-src-mq3-game-cvar-tables-ml-1157905806"></a>
### entries

```ml
function entries(buildDate)
```

Return the ordered entries table for cvar tables: 46 entries beginning with `["g_cheats","sv_cheats","",0,0,false,false]` and `["","gamename","baseq3",68,0,false,false]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buildDate` | `dynamic` | — | Value used by `entries` in `["","gamedate",buildDate,64,0,false,false],`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvar_tables.ml#L7)
