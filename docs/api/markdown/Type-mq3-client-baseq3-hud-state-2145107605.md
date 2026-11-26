# `mq3.client.baseq3_hud.State`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-hud-ml-1439544244.md)

<a id="struct-struct-mq3-client-baseq3-hud-state-struct-state-src-mq3-client-baseq3-hud-ml-1413558357"></a>
## State

```ml
struct State
```

Stores base Quake III HUD state, including `health`, `armor`, `ammo`, `weapon`, `score`, `kills` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L61)

## Members

<a id="field-field-mq3-client-baseq3-hud-state-ammo-ammo-src-mq3-client-baseq3-hud-ml-635677762"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L67)

<a id="field-field-mq3-client-baseq3-hud-state-armor-armor-src-mq3-client-baseq3-hud-ml-2129271054"></a>
### armor

```ml
armor
```

Player armor supplied to the base-game-style armor icon and numeric display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L65)

<a id="field-field-mq3-client-baseq3-hud-state-deaths-deaths-src-mq3-client-baseq3-hud-ml-879279400"></a>
### deaths

```ml
deaths
```

When constructing this record, `state` supplies `deaths` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L75)

<a id="field-field-mq3-client-baseq3-hud-state-fragtime-fragtime-src-mq3-client-baseq3-hud-ml-1474486944"></a>
### fragTime

```ml
fragTime
```

Timestamp of the last frag notification, used to expire the HUD's kill feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L84)

<a id="field-field-mq3-client-baseq3-hud-state-health-health-src-mq3-client-baseq3-hud-ml-1042394374"></a>
### health

```ml
health
```

Player health supplied to the base-game-style numeric status display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L63)

<a id="field-field-mq3-client-baseq3-hud-state-kills-kills-src-mq3-client-baseq3-hud-ml-902230898"></a>
### kills

```ml
kills
```

When constructing this record, `state` supplies `kills` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L73)

<a id="field-field-mq3-client-baseq3-hud-state-ownedweapons-ownedweapons-src-mq3-client-baseq3-hud-ml-1681753570"></a>
### ownedWeapons

```ml
ownedWeapons
```

When constructing this record, `state` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L86)

<a id="field-field-mq3-client-baseq3-hud-state-pickupclass-pickupclass-src-mq3-client-baseq3-hud-ml-518363150"></a>
### pickupClass

```ml
pickupClass
```

When constructing this record, `state` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L77)

<a id="field-field-mq3-client-baseq3-hud-state-pickupname-pickupname-src-mq3-client-baseq3-hud-ml-1016600768"></a>
### pickupName

```ml
pickupName
```

Human-readable item name shown by pickup notifications and item-selection UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L79)

<a id="field-field-mq3-client-baseq3-hud-state-pickuptime-pickuptime-src-mq3-client-baseq3-hud-ml-922784004"></a>
### pickupTime

```ml
pickupTime
```

Timestamp of the last item pickup, used with the feedback lifetime to hide its temporary HUD notification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L82)

<a id="field-field-mq3-client-baseq3-hud-state-score-score-src-mq3-client-baseq3-hud-ml-1438926786"></a>
### score

```ml
score
```

Player score displayed by the base-game HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L71)

<a id="field-field-mq3-client-baseq3-hud-state-weapon-weapon-src-mq3-client-baseq3-hud-ml-1892386826"></a>
### weapon

```ml
weapon
```

Selected weapon classname used to highlight the base-game-style weapon selection strip.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L69)

<a id="field-field-mq3-client-baseq3-hud-state-weaponammo-weaponammo-src-mq3-client-baseq3-hud-ml-365803190"></a>
### weaponAmmo

```ml
weaponAmmo
```

When constructing this record, `state` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L88)

<a id="field-field-mq3-client-baseq3-hud-state-weaponselecttime-weaponselecttime-src-mq3-client-baseq3-hud-ml-577122188"></a>
### weaponSelectTime

```ml
weaponSelectTime
```

Timestamp at which the weapon-selection display was last refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_hud.ml#L90)
