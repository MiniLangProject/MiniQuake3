# `mq3.client.playable_hud.HudState`

[Home](README.md) · [Source file](File-src-mq3-client-playable-hud-ml-310363425.md)

<a id="struct-struct-mq3-client-playable-hud-hudstate-struct-hudstate-src-mq3-client-playable-hud-ml-658742947"></a>
## HudState

```ml
struct HudState
```

Stores playable HUD hud state record, including `health`, `armor`, `ammo`, `status`, `helpText`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L16)

## Members

<a id="field-field-mq3-client-playable-hud-hudstate-ammo-ammo-src-mq3-client-playable-hud-ml-311664913"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L22)

<a id="field-field-mq3-client-playable-hud-hudstate-armor-armor-src-mq3-client-playable-hud-ml-133966429"></a>
### armor

```ml
armor
```

Player armor value displayed alongside health in the lightweight preview HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L20)

<a id="field-field-mq3-client-playable-hud-hudstate-health-health-src-mq3-client-playable-hud-ml-1749266741"></a>
### health

```ml
health
```

Player health value displayed by the lightweight playable-preview HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L18)

<a id="field-field-mq3-client-playable-hud-hudstate-helptext-helptext-src-mq3-client-playable-hud-ml-43248129"></a>
### helpText

```ml
helpText
```

When constructing this record, `state` supplies `helpText` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L26)

<a id="field-field-mq3-client-playable-hud-hudstate-status-status-src-mq3-client-playable-hud-ml-955147269"></a>
### status

```ml
status
```

When constructing this record, `state` supplies `status` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_hud.ml#L24)
