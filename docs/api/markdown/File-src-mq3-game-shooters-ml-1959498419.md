# `src/mq3/game/shooters.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.shooters`](Package-mq3-game-shooters-45338275.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/items.ml` as `itemRules` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/missiles.ml` as `missiles` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-shooters-finish-function-finish-level-ent-src-mq3-game-shooters-ml-787545833"></a>
### finish

```ml
function finish(level, ent)
```

Update `ent.enemy`, `ent.think` and `ent.nextthink` during `finish`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `enemy`, `target`, `think` and `nextthink`. May update `ent.enemy`, `ent.think` and `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/shooters.ml#L31)

<a id="function-function-mq3-game-shooters-registeritem-function-registeritem-level-index-src-mq3-game-shooters-ml-301716100"></a>
### registerItem

```ml
function registerItem(level, index)
```

Forward `registerItem` to `mq3.game.items.register` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemRegistered`. May update `level.itemRegistered[item]` in place. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/shooters.ml#L16)

<a id="function-function-mq3-game-shooters-use-function-use-level-ent-other-activator-src-mq3-game-shooters-ml-848764082"></a>
### use

```ml
function use(level, ent, other, activator)
```

Apply `mq3.game.movement.copy`, `mq3.shared.directions.perpendicular` and `mq3.game.entities.random` while evaluating `use`. Return paths include `events.add(level,ent,c.EV_FIRE_WEAPON,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `enemy`, `s`, `movedir` and `random`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `use` signature. |
| `activator` | `dynamic` | — | Not read by this implementation; retained in the `use` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/shooters.ml#L40)

<a id="function-function-mq3-game-shooters-weaponitem-function-weaponitem-weapon-src-mq3-game-shooters-ml-214364138"></a>
### weaponItem

```ml
function weaponItem(weapon)
```

Apply `mq3.game.constants.itemTag` while evaluating `weaponItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/shooters.ml#L21)
