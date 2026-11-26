# `mq3.game.entities.Entity`

[Home](README.md) · [Source file](File-src-mq3-game-entities-ml-1863725345.md)

<a id="struct-struct-mq3-game-entities-entity-struct-entity-src-mq3-game-entities-ml-1012343711"></a>
## Entity

```ml
struct Entity
```

`Entity` record for entities, containing `slot`, `s`, `r`, `client` and `inuse` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L159)

## Members

<a id="field-field-mq3-game-entities-entity-activator-activator-src-mq3-game-entities-ml-293835322"></a>
### activator

```ml
activator
```

Entity that triggered the current activation chain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L223)

<a id="field-field-mq3-game-entities-entity-blocked-blocked-src-mq3-game-entities-ml-1450032126"></a>
### blocked

```ml
blocked
```

Mover callback invoked when another object obstructs movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L245)

<a id="field-field-mq3-game-entities-entity-classname-classname-src-mq3-game-entities-ml-475421426"></a>
### classname

```ml
classname
```

Map entity class name used to select a spawn function.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L171)

<a id="field-field-mq3-game-entities-entity-client-client-src-mq3-game-entities-ml-1239757424"></a>
### client

```ml
client
```

Client record attached to a player entity, or void for a non-player entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L167)

<a id="field-field-mq3-game-entities-entity-clipmask-clipmask-src-mq3-game-entities-ml-901901750"></a>
### clipmask

```ml
clipmask
```

Contents mask used to select surfaces/entities that can block this object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L277)

<a id="field-field-mq3-game-entities-entity-count-count-src-mq3-game-entities-ml-671047882"></a>
### count

```ml
count
```

Class-specific count/amount read from the map entity definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L203)

<a id="field-field-mq3-game-entities-entity-damage-damage-src-mq3-game-entities-ml-2088393364"></a>
### damage

```ml
damage
```

Damage amount applied by this entity, attack, or operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L207)

<a id="field-field-mq3-game-entities-entity-die-die-src-mq3-game-entities-ml-77303270"></a>
### die

```ml
die
```

Entity callback invoked when damage kills the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L261)

<a id="field-field-mq3-game-entities-entity-enemy-enemy-src-mq3-game-entities-ml-1971286058"></a>
### enemy

```ml
enemy
```

Current enemy entity selected by the bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L257)

<a id="field-field-mq3-game-entities-entity-eventtime-eventtime-src-mq3-game-entities-ml-903864254"></a>
### eventTime

```ml
eventTime
```

Timestamp of the most recently recorded entity event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L177)

<a id="field-field-mq3-game-entities-entity-flags-flags-src-mq3-game-entities-ml-1255432198"></a>
### flags

```ml
flags
```

FL_* game entity flags controlling gameplay behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L213)

<a id="field-field-mq3-game-entities-entity-fly-sound-debounce-time-fly-sound-debounce-time-src-mq3-game-entities-ml-450441010"></a>
### fly_sound_debounce_time

```ml
fly_sound_debounce_time
```

Deadline preventing repeated fly/mover sound emission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L231)

<a id="field-field-mq3-game-entities-entity-freeafterevent-freeafterevent-src-mq3-game-entities-ml-501614138"></a>
### freeAfterEvent

```ml
freeAfterEvent
```

Nonzero when the entity should be freed after its transient event expires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L179)

<a id="field-field-mq3-game-entities-entity-freetime-freetime-src-mq3-game-entities-ml-1669284324"></a>
### freetime

```ml
freetime
```

Game timestamp at which the entity slot was last released.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L173)

<a id="field-field-mq3-game-entities-entity-health-health-src-mq3-game-entities-ml-1093831182"></a>
### health

```ml
health
```

Current health value used by damage, death, and healing logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L205)

<a id="field-field-mq3-game-entities-entity-inuse-inuse-src-mq3-game-entities-ml-1254375590"></a>
### inuse

```ml
inuse
```

Nonzero when this entity, client, or bot record currently represents a live allocated object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L169)

<a id="field-field-mq3-game-entities-entity-item-item-src-mq3-game-entities-ml-1251548600"></a>
### item

```ml
item
```

Item definition associated with this pickup entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L281)

<a id="field-field-mq3-game-entities-entity-message-message-src-mq3-game-entities-ml-1528141210"></a>
### message

```ml
message
```

Text associated with the map entity or trigger action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L195)

<a id="field-field-mq3-game-entities-entity-methodofdeath-methodofdeath-src-mq3-game-entities-ml-133126158"></a>
### methodOfDeath

```ml
methodOfDeath
```

MOD_* identifier used to attribute direct damage and death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L273)

<a id="field-field-mq3-game-entities-entity-model-model-src-mq3-game-entities-ml-468183030"></a>
### model

```ml
model
```

Primary model resource name read from a map entity definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L189)

<a id="field-field-mq3-game-entities-entity-model2-model2-src-mq3-game-entities-ml-1574274616"></a>
### model2

```ml
model2
```

Secondary model resource name read from a map entity definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L191)

<a id="field-field-mq3-game-entities-entity-movedir-movedir-src-mq3-game-entities-ml-134502098"></a>
### movedir

```ml
movedir
```

Normalized direction along which the entity moves or fires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L215)

<a id="field-field-mq3-game-entities-entity-moverstate-moverstate-src-mq3-game-entities-ml-188920334"></a>
### moverState

```ml
moverState
```

Current position/transition state of a moving map object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L237)

<a id="field-field-mq3-game-entities-entity-neverfree-neverfree-src-mq3-game-entities-ml-860508042"></a>
### neverFree

```ml
neverFree
```

Nonzero when ordinary entity cleanup must retain this entity slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L175)

<a id="field-field-mq3-game-entities-entity-nextthink-nextthink-src-mq3-game-entities-ml-1860776782"></a>
### nextthink

```ml
nextthink
```

Game timestamp at which the entity think callback should next run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L217)

<a id="field-field-mq3-game-entities-entity-nexttrain-nexttrain-src-mq3-game-entities-ml-1113540662"></a>
### nextTrain

```ml
nextTrain
```

Next path or train entity in the mover route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L233)

<a id="field-field-mq3-game-entities-entity-noise-index-noise-index-src-mq3-game-entities-ml-251112226"></a>
### noise_index

```ml
noise_index
```

Registered sound index used by this map entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L229)

<a id="field-field-mq3-game-entities-entity-pain-pain-src-mq3-game-entities-ml-917362062"></a>
### pain

```ml
pain
```

Entity callback invoked when a damage event causes a pain response.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L259)

<a id="field-field-mq3-game-entities-entity-pain-debounce-time-pain-debounce-time-src-mq3-game-entities-ml-1845076406"></a>
### pain_debounce_time

```ml
pain_debounce_time
```

Deadline preventing repeated pain responses in rapid succession.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L291)

<a id="field-field-mq3-game-entities-entity-parent-parent-src-mq3-game-entities-ml-1800205498"></a>
### parent

```ml
parent
```

Entity that created or owns this transient object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L265)

<a id="field-field-mq3-game-entities-entity-physicsbounce-physicsbounce-src-mq3-game-entities-ml-1605196906"></a>
### physicsBounce

```ml
physicsBounce
```

Bounce factor used when this physics object collides with a surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L279)

<a id="field-field-mq3-game-entities-entity-physicsobject-physicsobject-src-mq3-game-entities-ml-1642239894"></a>
### physicsObject

```ml
physicsObject
```

Nonzero when generic entity physics should advance this object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L227)

<a id="field-field-mq3-game-entities-entity-pos1-pos1-src-mq3-game-entities-ml-2092105964"></a>
### pos1

```ml
pos1
```

First mover endpoint in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L239)

<a id="field-field-mq3-game-entities-entity-pos2-pos2-src-mq3-game-entities-ml-767764934"></a>
### pos2

```ml
pos2
```

Second mover endpoint in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L241)

<a id="field-field-mq3-game-entities-entity-r-r-src-mq3-game-entities-ml-768514158"></a>
### r

```ml
r
```

Engine-shared entity state used for world linking, collision, and visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L165)

<a id="field-field-mq3-game-entities-entity-random-random-src-mq3-game-entities-ml-2013886104"></a>
### random

```ml
random
```

Random variation added to the map entity activation/repeat delay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L201)

<a id="field-field-mq3-game-entities-entity-reached-reached-src-mq3-game-entities-ml-1214657958"></a>
### reached

```ml
reached
```

Mover callback invoked when the mover reaches an endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L243)

<a id="field-field-mq3-game-entities-entity-s-s-src-mq3-game-entities-ml-1142013762"></a>
### s

```ml
s
```

Network-visible entity state used to build snapshots for clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L163)

<a id="field-field-mq3-game-entities-entity-slot-slot-src-mq3-game-entities-ml-1034311026"></a>
### slot

```ml
slot
```

Index of the entity/client slot represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L161)

<a id="field-field-mq3-game-entities-entity-sound1to2-sound1to2-src-mq3-game-entities-ml-1087416750"></a>
### sound1to2

```ml
sound1to2
```

Sound played while the mover travels from its first endpoint to its second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L249)

<a id="field-field-mq3-game-entities-entity-sound2to1-sound2to1-src-mq3-game-entities-ml-1323562922"></a>
### sound2to1

```ml
sound2to1
```

Sound played while the mover travels from its second endpoint to its first.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L251)

<a id="field-field-mq3-game-entities-entity-soundloop-soundloop-src-mq3-game-entities-ml-1473104654"></a>
### soundLoop

```ml
soundLoop
```

Looping sound selected while the entity is active or moving.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L255)

<a id="field-field-mq3-game-entities-entity-soundpos1-soundpos1-src-mq3-game-entities-ml-2142896886"></a>
### soundPos1

```ml
soundPos1
```

Sound played when the mover arrives at its first endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L247)

<a id="field-field-mq3-game-entities-entity-soundpos2-soundpos2-src-mq3-game-entities-ml-683260654"></a>
### soundPos2

```ml
soundPos2
```

Sound played when the mover arrives at its second endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L253)

<a id="field-field-mq3-game-entities-entity-spawnflags-spawnflags-src-mq3-game-entities-ml-1932693342"></a>
### spawnflags

```ml
spawnflags
```

Class-specific bit flags read from the map entity definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L187)

<a id="field-field-mq3-game-entities-entity-speed-speed-src-mq3-game-entities-ml-932949874"></a>
### speed

```ml
speed
```

Movement or travel speed used by this game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L193)

<a id="field-field-mq3-game-entities-entity-splashdamage-splashdamage-src-mq3-game-entities-ml-939966054"></a>
### splashDamage

```ml
splashDamage
```

Damage at the center of the radial splash-damage effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L269)

<a id="field-field-mq3-game-entities-entity-splashmethodofdeath-splashmethodofdeath-src-mq3-game-entities-ml-1026848686"></a>
### splashMethodOfDeath

```ml
splashMethodOfDeath
```

MOD_* identifier used to attribute splash damage and death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L275)

<a id="field-field-mq3-game-entities-entity-splashradius-splashradius-src-mq3-game-entities-ml-301109500"></a>
### splashRadius

```ml
splashRadius
```

Maximum world-space radius affected by splash damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L271)

<a id="field-field-mq3-game-entities-entity-takedamage-takedamage-src-mq3-game-entities-ml-1078973206"></a>
### takedamage

```ml
takedamage
```

Nonzero when damage processing is allowed to reduce this entity health.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L235)

<a id="field-field-mq3-game-entities-entity-target-target-src-mq3-game-entities-ml-906179764"></a>
### target

```ml
target
```

Target-name selector identifying entities activated by this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L183)

<a id="field-field-mq3-game-entities-entity-target-ent-target-ent-src-mq3-game-entities-ml-683916564"></a>
### target_ent

```ml
target_ent
```

Entity currently resolved as the active target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L267)

<a id="field-field-mq3-game-entities-entity-targetname-targetname-src-mq3-game-entities-ml-1382800718"></a>
### targetname

```ml
targetname
```

Name by which other map entities can target this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L185)

<a id="field-field-mq3-game-entities-entity-targetshadername-targetshadername-src-mq3-game-entities-ml-1595092008"></a>
### targetShaderName

```ml
targetShaderName
```

Shader name selected for a map-triggered remapping operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L209)

<a id="field-field-mq3-game-entities-entity-targetshadernewname-targetshadernewname-src-mq3-game-entities-ml-1059187382"></a>
### targetShaderNewName

```ml
targetShaderNewName
```

Replacement shader name applied by the map-triggered remapping operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L211)

<a id="field-field-mq3-game-entities-entity-team-team-src-mq3-game-entities-ml-849153896"></a>
### team

```ml
team
```

Team assignment associated with the client, bot, or action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L197)

<a id="field-field-mq3-game-entities-entity-teamchain-teamchain-src-mq3-game-entities-ml-1830614382"></a>
### teamchain

```ml
teamchain
```

Next entity linked into this entity team or mover group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L285)

<a id="field-field-mq3-game-entities-entity-teammaster-teammaster-src-mq3-game-entities-ml-2006333276"></a>
### teammaster

```ml
teammaster
```

Master entity coordinating this entity team or mover group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L283)

<a id="field-field-mq3-game-entities-entity-think-think-src-mq3-game-entities-ml-1185386678"></a>
### think

```ml
think
```

Entity callback invoked when its nextthink deadline is reached.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L219)

<a id="field-field-mq3-game-entities-entity-timestamp-timestamp-src-mq3-game-entities-ml-1365855914"></a>
### timestamp

```ml
timestamp
```

Game timestamp retained by the entity behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L263)

<a id="field-field-mq3-game-entities-entity-touch-touch-src-mq3-game-entities-ml-1002195866"></a>
### touch

```ml
touch
```

Entity callback invoked when another entity touches it.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L181)

<a id="field-field-mq3-game-entities-entity-unlinkafterevent-unlinkafterevent-src-mq3-game-entities-ml-1745026136"></a>
### unlinkAfterEvent

```ml
unlinkAfterEvent
```

Nonzero when the entity should be unlinked after its transient event expires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L225)

<a id="field-field-mq3-game-entities-entity-use-use-src-mq3-game-entities-ml-1547823926"></a>
### use

```ml
use
```

Entity callback invoked when the entity is activated by another object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L221)

<a id="field-field-mq3-game-entities-entity-wait-wait-src-mq3-game-entities-ml-1540904580"></a>
### wait

```ml
wait
```

Configured delay between repeated uses of the map entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L199)

<a id="field-field-mq3-game-entities-entity-waterlevel-waterlevel-src-mq3-game-entities-ml-2126189028"></a>
### waterlevel

```ml
waterlevel
```

Depth classification of the player immersion in liquid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L287)

<a id="field-field-mq3-game-entities-entity-watertype-watertype-src-mq3-game-entities-ml-1832430522"></a>
### watertype

```ml
watertype
```

CONTENTS_* mask identifying the liquid around the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entities.ml#L289)
