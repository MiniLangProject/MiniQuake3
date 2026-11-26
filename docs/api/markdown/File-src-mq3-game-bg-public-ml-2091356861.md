# `src/mq3/game/bg_public.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bg_public`](Package-mq3-game-bg-public-1889719263.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-game-bg-public-anim-togglebit-const-anim-togglebit-128-src-mq3-game-bg-public-ml-1601516550"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```

Animation bit toggled to restart an animation even when its index is unchanged.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L138)

- [mq3.game.bg_public.Animation](Type-mq3-game-bg-public-animation-1048157595.md) — struct
<a id="constant-constant-mq3-game-bg-public-armor-protection-const-armor-protection-0-66-src-mq3-game-bg-public-ml-2114508147"></a>
### ARMOR_PROTECTION

```ml
const ARMOR_PROTECTION = 0.66
```

Fraction of incoming damage that armor can absorb before health is reduced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L13)

<a id="constant-constant-mq3-game-bg-public-crouch-viewheight-const-crouch-viewheight-12-src-mq3-game-bg-public-ml-1359120302"></a>
### CROUCH_VIEWHEIGHT

```ml
const CROUCH_VIEWHEIGHT = 12
```

Crouched eye height above the player origin, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L35)

<a id="constant-constant-mq3-game-bg-public-cs-botinfo-const-cs-botinfo-25-src-mq3-game-bg-public-ml-1550235058"></a>
### CS_BOTINFO

```ml
const CS_BOTINFO = 25
```

Configuration-string index or range start used to publish botinfo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L78)

<a id="constant-constant-mq3-game-bg-public-cs-flagstatus-const-cs-flagstatus-23-src-mq3-game-bg-public-ml-1482583762"></a>
### CS_FLAGSTATUS

```ml
const CS_FLAGSTATUS = 23
```

Configuration-string index or range start used to publish flagstatus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L74)

<a id="constant-constant-mq3-game-bg-public-cs-game-version-const-cs-game-version-20-src-mq3-game-bg-public-ml-1260999667"></a>
### CS_GAME_VERSION

```ml
const CS_GAME_VERSION = 20
```

Configuration-string index or range start used to publish game version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L68)

<a id="constant-constant-mq3-game-bg-public-cs-intermission-const-cs-intermission-22-src-mq3-game-bg-public-ml-208927837"></a>
### CS_INTERMISSION

```ml
const CS_INTERMISSION = 22
```

Configuration-string index or range start used to publish intermission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L72)

<a id="constant-constant-mq3-game-bg-public-cs-items-const-cs-items-27-src-mq3-game-bg-public-ml-1766904534"></a>
### CS_ITEMS

```ml
const CS_ITEMS = 27
```

Configuration-string index or range start used to publish items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L80)

<a id="constant-constant-mq3-game-bg-public-cs-level-start-time-const-cs-level-start-time-21-src-mq3-game-bg-public-ml-1065551796"></a>
### CS_LEVEL_START_TIME

```ml
const CS_LEVEL_START_TIME = 21
```

Configuration-string index or range start used to publish level start time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L70)

<a id="constant-constant-mq3-game-bg-public-cs-locations-const-cs-locations-608-src-mq3-game-bg-public-ml-1647448673"></a>
### CS_LOCATIONS

```ml
const CS_LOCATIONS = 608
```

Configuration-string index or range start used to publish locations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L88)

<a id="constant-constant-mq3-game-bg-public-cs-max-const-cs-max-736-src-mq3-game-bg-public-ml-1976841571"></a>
### CS_MAX

```ml
const CS_MAX = 736
```

First configuration-string index after the game-defined ranges.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L92)

<a id="constant-constant-mq3-game-bg-public-cs-message-const-cs-message-3-src-mq3-game-bg-public-ml-1051431748"></a>
### CS_MESSAGE

```ml
const CS_MESSAGE = 3
```

Configuration-string index or range start used to publish message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L42)

<a id="constant-constant-mq3-game-bg-public-cs-models-const-cs-models-32-src-mq3-game-bg-public-ml-540556664"></a>
### CS_MODELS

```ml
const CS_MODELS = 32
```

Configuration-string index or range start used to publish models.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L82)

<a id="constant-constant-mq3-game-bg-public-cs-motd-const-cs-motd-4-src-mq3-game-bg-public-ml-1257860035"></a>
### CS_MOTD

```ml
const CS_MOTD = 4
```

Configuration-string index or range start used to publish motd.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L44)

<a id="constant-constant-mq3-game-bg-public-cs-music-const-cs-music-2-src-mq3-game-bg-public-ml-372316691"></a>
### CS_MUSIC

```ml
const CS_MUSIC = 2
```

Configuration-string index or range start used to publish music.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L40)

<a id="constant-constant-mq3-game-bg-public-cs-particles-const-cs-particles-672-src-mq3-game-bg-public-ml-749111306"></a>
### CS_PARTICLES

```ml
const CS_PARTICLES = 672
```

Configuration-string index or range start used to publish particles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L90)

<a id="constant-constant-mq3-game-bg-public-cs-players-const-cs-players-544-src-mq3-game-bg-public-ml-1103742976"></a>
### CS_PLAYERS

```ml
const CS_PLAYERS = 544
```

Configuration-string index or range start used to publish players.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L86)

<a id="constant-constant-mq3-game-bg-public-cs-scores1-const-cs-scores1-6-src-mq3-game-bg-public-ml-1318209589"></a>
### CS_SCORES1

```ml
const CS_SCORES1 = 6
```

Configuration-string index or range start used to publish scores1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L48)

<a id="constant-constant-mq3-game-bg-public-cs-scores2-const-cs-scores2-7-src-mq3-game-bg-public-ml-560530504"></a>
### CS_SCORES2

```ml
const CS_SCORES2 = 7
```

Configuration-string index or range start used to publish scores2.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L50)

<a id="constant-constant-mq3-game-bg-public-cs-shaderstate-const-cs-shaderstate-24-src-mq3-game-bg-public-ml-555394027"></a>
### CS_SHADERSTATE

```ml
const CS_SHADERSTATE = 24
```

Configuration-string index or range start used to publish shaderstate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L76)

<a id="constant-constant-mq3-game-bg-public-cs-sounds-const-cs-sounds-288-src-mq3-game-bg-public-ml-984433541"></a>
### CS_SOUNDS

```ml
const CS_SOUNDS = 288
```

Configuration-string index or range start used to publish sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L84)

<a id="constant-constant-mq3-game-bg-public-cs-teamvote-no-const-cs-teamvote-no-18-src-mq3-game-bg-public-ml-544997802"></a>
### CS_TEAMVOTE_NO

```ml
const CS_TEAMVOTE_NO = 18
```

Configuration-string index or range start used to publish teamvote no.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L66)

<a id="constant-constant-mq3-game-bg-public-cs-teamvote-string-const-cs-teamvote-string-14-src-mq3-game-bg-public-ml-1966203094"></a>
### CS_TEAMVOTE_STRING

```ml
const CS_TEAMVOTE_STRING = 14
```

Configuration-string index or range start used to publish teamvote string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L62)

<a id="constant-constant-mq3-game-bg-public-cs-teamvote-time-const-cs-teamvote-time-12-src-mq3-game-bg-public-ml-340002532"></a>
### CS_TEAMVOTE_TIME

```ml
const CS_TEAMVOTE_TIME = 12
```

Configuration-string index or range start used to publish teamvote time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L60)

<a id="constant-constant-mq3-game-bg-public-cs-teamvote-yes-const-cs-teamvote-yes-16-src-mq3-game-bg-public-ml-521547122"></a>
### CS_TEAMVOTE_YES

```ml
const CS_TEAMVOTE_YES = 16
```

Configuration-string index or range start used to publish teamvote yes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L64)

<a id="constant-constant-mq3-game-bg-public-cs-vote-no-const-cs-vote-no-11-src-mq3-game-bg-public-ml-733712975"></a>
### CS_VOTE_NO

```ml
const CS_VOTE_NO = 11
```

Configuration-string index or range start used to publish vote no.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L58)

<a id="constant-constant-mq3-game-bg-public-cs-vote-string-const-cs-vote-string-9-src-mq3-game-bg-public-ml-1995579128"></a>
### CS_VOTE_STRING

```ml
const CS_VOTE_STRING = 9
```

Configuration-string index or range start used to publish vote string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L54)

<a id="constant-constant-mq3-game-bg-public-cs-vote-time-const-cs-vote-time-8-src-mq3-game-bg-public-ml-1143042843"></a>
### CS_VOTE_TIME

```ml
const CS_VOTE_TIME = 8
```

Configuration-string index or range start used to publish vote time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L52)

<a id="constant-constant-mq3-game-bg-public-cs-vote-yes-const-cs-vote-yes-10-src-mq3-game-bg-public-ml-1846582784"></a>
### CS_VOTE_YES

```ml
const CS_VOTE_YES = 10
```

Configuration-string index or range start used to publish vote yes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L56)

<a id="constant-constant-mq3-game-bg-public-cs-warmup-const-cs-warmup-5-src-mq3-game-bg-public-ml-644211500"></a>
### CS_WARMUP

```ml
const CS_WARMUP = 5
```

Configuration-string index or range start used to publish warmup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L46)

<a id="constant-constant-mq3-game-bg-public-dead-viewheight-const-dead-viewheight-16-src-mq3-game-bg-public-ml-476022655"></a>
### DEAD_VIEWHEIGHT

```ml
const DEAD_VIEWHEIGHT = -16
```

Eye-height offset used while the player is dead.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L37)

<a id="constant-constant-mq3-game-bg-public-default-gravity-const-default-gravity-800-src-mq3-game-bg-public-ml-1080596687"></a>
### DEFAULT_GRAVITY

```ml
const DEFAULT_GRAVITY = 800
```

Default downward acceleration in world units per second squared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L9)

<a id="constant-constant-mq3-game-bg-public-default-shotgun-count-const-default-shotgun-count-11-src-mq3-game-bg-public-ml-725961315"></a>
### DEFAULT_SHOTGUN_COUNT

```ml
const DEFAULT_SHOTGUN_COUNT = 11
```

Number of pellets emitted by a standard shotgun shot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L21)

<a id="constant-constant-mq3-game-bg-public-default-shotgun-spread-const-default-shotgun-spread-700-src-mq3-game-bg-public-ml-221299648"></a>
### DEFAULT_SHOTGUN_SPREAD

```ml
const DEFAULT_SHOTGUN_SPREAD = 700
```

Horizontal and vertical spread scale used to distribute shotgun pellets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L19)

<a id="constant-constant-mq3-game-bg-public-default-viewheight-const-default-viewheight-26-src-mq3-game-bg-public-ml-1842780723"></a>
### DEFAULT_VIEWHEIGHT

```ml
const DEFAULT_VIEWHEIGHT = 26
```

Standing eye height above the player origin, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L33)

<a id="constant-constant-mq3-game-bg-public-df-fixed-fov-const-df-fixed-fov-16-src-mq3-game-bg-public-ml-1036834098"></a>
### DF_FIXED_FOV

```ml
const DF_FIXED_FOV = 16
```

Deathmatch-option bit enabling fixed field of view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L148)

<a id="constant-constant-mq3-game-bg-public-df-no-falling-const-df-no-falling-8-src-mq3-game-bg-public-ml-1923574611"></a>
### DF_NO_FALLING

```ml
const DF_NO_FALLING = 8
```

Deathmatch-option bit enabling no falling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L146)

<a id="constant-constant-mq3-game-bg-public-df-no-footsteps-const-df-no-footsteps-32-src-mq3-game-bg-public-ml-91586596"></a>
### DF_NO_FOOTSTEPS

```ml
const DF_NO_FOOTSTEPS = 32
```

Deathmatch-option bit enabling no footsteps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L150)

<a id="constant-constant-mq3-game-bg-public-ef-award-denied-const-ef-award-denied-262144-src-mq3-game-bg-public-ml-1619550824"></a>
### EF_AWARD_DENIED

```ml
const EF_AWARD_DENIED = 262144
```

Network entity-flag bit indicating award denied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L128)

<a id="constant-constant-mq3-game-bg-public-ef-bounce-const-ef-bounce-16-src-mq3-game-bg-public-ml-1071626378"></a>
### EF_BOUNCE

```ml
const EF_BOUNCE = 16
```

Network entity-flag bit indicating bounce.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L126)

<a id="constant-constant-mq3-game-bg-public-ev-event-bit1-const-ev-event-bit1-256-src-mq3-game-bg-public-ml-351332254"></a>
### EV_EVENT_BIT1

```ml
const EV_EVENT_BIT1 = 256
```

Network/predictable event identifier reporting event bit1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L130)

<a id="constant-constant-mq3-game-bg-public-ev-event-bit2-const-ev-event-bit2-512-src-mq3-game-bg-public-ml-768378863"></a>
### EV_EVENT_BIT2

```ml
const EV_EVENT_BIT2 = 512
```

Network/predictable event identifier reporting event bit2.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L132)

<a id="constant-constant-mq3-game-bg-public-ev-event-bits-const-ev-event-bits-768-src-mq3-game-bg-public-ml-804507480"></a>
### EV_EVENT_BITS

```ml
const EV_EVENT_BITS = 768
```

Network/predictable event identifier reporting event bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L134)

<a id="constant-constant-mq3-game-bg-public-event-valid-msec-const-event-valid-msec-300-src-mq3-game-bg-public-ml-1041883124"></a>
### EVENT_VALID_MSEC

```ml
const EVENT_VALID_MSEC = 300
```

Duration in milliseconds for which transient entity events remain valid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L136)

<a id="constant-constant-mq3-game-bg-public-game-version-const-game-version-baseq3-1-src-mq3-game-bg-public-ml-50150848"></a>
### GAME_VERSION

```ml
const GAME_VERSION = "baseq3-1"
```

Baseq3 game-module version string exchanged with the client game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L7)

<a id="constant-constant-mq3-game-bg-public-gib-health-const-gib-health-40-src-mq3-game-bg-public-ml-1833671716"></a>
### GIB_HEALTH

```ml
const GIB_HEALTH = -40
```

Health threshold below which a corpse can be gibbed instead of remaining intact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L11)

- [mq3.game.bg_public.Gitem](Type-mq3-game-bg-public-gitem-664815043.md) — struct
<a id="function-function-mq3-game-bg-public-item-index-function-item-index-index-src-mq3-game-bg-public-ml-1726693352"></a>
### ITEM_INDEX

```ml
function ITEM_INDEX(index)
```

Return `index` for `ITEM_INDEX`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L248)

<a id="constant-constant-mq3-game-bg-public-item-radius-const-item-radius-15-src-mq3-game-bg-public-ml-2138652195"></a>
### ITEM_RADIUS

```ml
const ITEM_RADIUS = 15
```

Pickup/contact radius used for item interaction bounds in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L23)

<a id="constant-constant-mq3-game-bg-public-lightning-range-const-lightning-range-768-src-mq3-game-bg-public-ml-1422103788"></a>
### LIGHTNING_RANGE

```ml
const LIGHTNING_RANGE = 768
```

Maximum lightning-gun trace distance in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L25)

<a id="constant-constant-mq3-game-bg-public-mask-all-const-mask-all-1-src-mq3-game-bg-public-ml-1984448601"></a>
### MASK_ALL

```ml
const MASK_ALL = -1
```

Combined CONTENTS_* mask used for all collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L152)

<a id="constant-constant-mq3-game-bg-public-mask-deadsolid-const-mask-deadsolid-65537-src-mq3-game-bg-public-ml-1089706871"></a>
### MASK_DEADSOLID

```ml
const MASK_DEADSOLID = 65537
```

Combined CONTENTS_* mask used for deadsolid collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L158)

<a id="constant-constant-mq3-game-bg-public-mask-opaque-const-mask-opaque-25-src-mq3-game-bg-public-ml-414302408"></a>
### MASK_OPAQUE

```ml
const MASK_OPAQUE = 25
```

Combined CONTENTS_* mask used for opaque collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L162)

<a id="constant-constant-mq3-game-bg-public-mask-playersolid-const-mask-playersolid-33619969-src-mq3-game-bg-public-ml-882295805"></a>
### MASK_PLAYERSOLID

```ml
const MASK_PLAYERSOLID = 33619969
```

Combined CONTENTS_* mask used for playersolid collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L156)

<a id="constant-constant-mq3-game-bg-public-mask-shot-const-mask-shot-100663297-src-mq3-game-bg-public-ml-1883151329"></a>
### MASK_SHOT

```ml
const MASK_SHOT = 100663297
```

Combined CONTENTS_* mask used for shot collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L164)

<a id="constant-constant-mq3-game-bg-public-mask-solid-const-mask-solid-1-src-mq3-game-bg-public-ml-432402906"></a>
### MASK_SOLID

```ml
const MASK_SOLID = 1
```

Combined CONTENTS_* mask used for solid collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L154)

<a id="constant-constant-mq3-game-bg-public-mask-water-const-mask-water-56-src-mq3-game-bg-public-ml-2143070424"></a>
### MASK_WATER

```ml
const MASK_WATER = 56
```

Combined CONTENTS_* mask used for water collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L160)

<a id="constant-constant-mq3-game-bg-public-max-item-models-const-max-item-models-4-src-mq3-game-bg-public-ml-2017094339"></a>
### MAX_ITEM_MODELS

```ml
const MAX_ITEM_MODELS = 4
```

Upper bound on item models represented by mq3.game.bg_public.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L144)

<a id="constant-constant-mq3-game-bg-public-max-items-const-max-items-256-src-mq3-game-bg-public-ml-2057701238"></a>
### MAX_ITEMS

```ml
const MAX_ITEMS = 256
```

Maximum number of item definitions indexed by the game and client game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L15)

<a id="constant-constant-mq3-game-bg-public-maxtouch-const-maxtouch-32-src-mq3-game-bg-public-ml-1470562012"></a>
### MAXTOUCH

```ml
const MAXTOUCH = 32
```

Maximum number of entity contacts retained by one player-movement result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L123)

<a id="constant-constant-mq3-game-bg-public-mins-z-const-mins-z-24-src-mq3-game-bg-public-ml-1190258608"></a>
### MINS_Z

```ml
const MINS_Z = -24
```

Bottom of the normal player collision box relative to the player origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L31)

<a id="constant-constant-mq3-game-bg-public-pmf-all-times-const-pmf-all-times-352-src-mq3-game-bg-public-ml-815661649"></a>
### PMF_ALL_TIMES

```ml
const PMF_ALL_TIMES = 352
```

Combined movement mask for landing, knockback, and water-jump timers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L121)

<a id="constant-constant-mq3-game-bg-public-pmf-backwards-jump-const-pmf-backwards-jump-8-src-mq3-game-bg-public-ml-1534710319"></a>
### PMF_BACKWARDS_JUMP

```ml
const PMF_BACKWARDS_JUMP = 8
```

Player movement-state bit indicating backwards jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L99)

<a id="constant-constant-mq3-game-bg-public-pmf-backwards-run-const-pmf-backwards-run-16-src-mq3-game-bg-public-ml-1683443498"></a>
### PMF_BACKWARDS_RUN

```ml
const PMF_BACKWARDS_RUN = 16
```

Player movement-state bit indicating backwards run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L101)

<a id="constant-constant-mq3-game-bg-public-pmf-ducked-const-pmf-ducked-1-src-mq3-game-bg-public-ml-1341918118"></a>
### PMF_DUCKED

```ml
const PMF_DUCKED = 1
```

Player movement-state bit indicating ducked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L95)

<a id="constant-constant-mq3-game-bg-public-pmf-follow-const-pmf-follow-4096-src-mq3-game-bg-public-ml-2051331114"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```

Player movement-state bit indicating follow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L115)

<a id="constant-constant-mq3-game-bg-public-pmf-grapple-pull-const-pmf-grapple-pull-2048-src-mq3-game-bg-public-ml-1162312483"></a>
### PMF_GRAPPLE_PULL

```ml
const PMF_GRAPPLE_PULL = 2048
```

Player movement-state bit indicating grapple pull.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L113)

<a id="constant-constant-mq3-game-bg-public-pmf-invulexpand-const-pmf-invulexpand-16384-src-mq3-game-bg-public-ml-453074883"></a>
### PMF_INVULEXPAND

```ml
const PMF_INVULEXPAND = 16384
```

Player movement-state bit indicating invulexpand.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L119)

<a id="constant-constant-mq3-game-bg-public-pmf-jump-held-const-pmf-jump-held-2-src-mq3-game-bg-public-ml-1002191597"></a>
### PMF_JUMP_HELD

```ml
const PMF_JUMP_HELD = 2
```

Player movement-state bit indicating jump held.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L97)

<a id="constant-constant-mq3-game-bg-public-pmf-respawned-const-pmf-respawned-512-src-mq3-game-bg-public-ml-114173331"></a>
### PMF_RESPAWNED

```ml
const PMF_RESPAWNED = 512
```

Player movement-state bit indicating respawned.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L109)

<a id="constant-constant-mq3-game-bg-public-pmf-scoreboard-const-pmf-scoreboard-8192-src-mq3-game-bg-public-ml-1122858319"></a>
### PMF_SCOREBOARD

```ml
const PMF_SCOREBOARD = 8192
```

Player movement-state bit indicating scoreboard.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L117)

<a id="constant-constant-mq3-game-bg-public-pmf-time-knockback-const-pmf-time-knockback-64-src-mq3-game-bg-public-ml-238126999"></a>
### PMF_TIME_KNOCKBACK

```ml
const PMF_TIME_KNOCKBACK = 64
```

Player movement-state bit indicating time knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L105)

<a id="constant-constant-mq3-game-bg-public-pmf-time-land-const-pmf-time-land-32-src-mq3-game-bg-public-ml-324130368"></a>
### PMF_TIME_LAND

```ml
const PMF_TIME_LAND = 32
```

Player movement-state bit indicating time land.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L103)

<a id="constant-constant-mq3-game-bg-public-pmf-time-waterjump-const-pmf-time-waterjump-256-src-mq3-game-bg-public-ml-204792002"></a>
### PMF_TIME_WATERJUMP

```ml
const PMF_TIME_WATERJUMP = 256
```

Player movement-state bit indicating time waterjump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L107)

<a id="constant-constant-mq3-game-bg-public-pmf-use-item-held-const-pmf-use-item-held-1024-src-mq3-game-bg-public-ml-1226998170"></a>
### PMF_USE_ITEM_HELD

```ml
const PMF_USE_ITEM_HELD = 1024
```

Player movement-state bit indicating use item held.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L111)

- [mq3.game.bg_public.Pmove](Type-mq3-game-bg-public-pmove-852760040.md) — struct
<a id="constant-constant-mq3-game-bg-public-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-game-bg-public-ml-906820357"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```

Bit added to a player rank when the score is tied with another player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L17)

<a id="constant-constant-mq3-game-bg-public-score-not-present-const-score-not-present-9999-src-mq3-game-bg-public-ml-776909032"></a>
### SCORE_NOT_PRESENT

```ml
const SCORE_NOT_PRESENT = -9999
```

Scoreboard sentinel indicating that a score has not been supplied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L27)

<a id="constant-constant-mq3-game-bg-public-team-location-update-time-const-team-location-update-time-1000-src-mq3-game-bg-public-ml-1094479868"></a>
### TEAM_LOCATION_UPDATE_TIME

```ml
const TEAM_LOCATION_UPDATE_TIME = 1000
```

Interval in milliseconds between team-location information updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L140)

<a id="constant-constant-mq3-game-bg-public-team-maxoverlay-const-team-maxoverlay-32-src-mq3-game-bg-public-ml-1139362428"></a>
### TEAM_MAXOVERLAY

```ml
const TEAM_MAXOVERLAY = 32
```

Maximum number of players included in a team-overlay message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L142)

<a id="function-function-mq3-game-bg-public-typenames-function-typenames-src-mq3-game-bg-public-ml-1984607470"></a>
### typeNames

```ml
function typeNames()
```

Return the ordered type names table for bg public: 20 entries beginning with `"pmove_t"` and `"animation_t"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L250)

<a id="constant-constant-mq3-game-bg-public-vote-time-const-vote-time-30000-src-mq3-game-bg-public-ml-286384182"></a>
### VOTE_TIME

```ml
const VOTE_TIME = 30000
```

Maximum lifetime of a vote in milliseconds before it expires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L29)
