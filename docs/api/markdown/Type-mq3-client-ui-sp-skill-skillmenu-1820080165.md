# `mq3.client.ui_sp_skill.SkillMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-sp-skill-ml-441619995.md)

<a id="struct-struct-mq3-client-ui-sp-skill-skillmenu-struct-skillmenu-src-mq3-client-ui-sp-skill-ml-2096528521"></a>
## SkillMenu

```ml
struct SkillMenu
```

Stores UI sp skill skill menu record, including `fullscreen`, `cursor`, `arenaInfo`, `skill`, `items`, `assets` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L45)

## Members

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-actions-actions-src-mq3-client-ui-sp-skill-ml-2100435845"></a>
### actions

```ml
actions
```

Host requests queued while selecting bot difficulty and launching the chosen arena, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L64)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-arenainfo-arenainfo-src-mq3-client-ui-sp-skill-ml-619036393"></a>
### arenaInfo

```ml
arenaInfo
```

When constructing this record, `init` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L52)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-assets-assets-src-mq3-client-ui-sp-skill-ml-960357423"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the single-player difficulty menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L59)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-cursor-cursor-src-mq3-client-ui-sp-skill-ml-2113996641"></a>
### cursor

```ml
cursor
```

When constructing this record, `init` supplies `ID_FIGHT` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L50)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-cvarwrites-cvarwrites-src-mq3-client-ui-sp-skill-ml-535306133"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the single-player difficulty menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L66)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-fullscreen-fullscreen-src-mq3-client-ui-sp-skill-ml-217425831"></a>
### fullscreen

```ml
fullscreen
```

Whether the single-player skill-selection menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L48)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-items-items-src-mq3-client-ui-sp-skill-ml-141090973"></a>
### items

```ml
items
```

When constructing this record, `init` supplies `items` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L56)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-skill-skill-src-mq3-client-ui-sp-skill-ml-1558045229"></a>
### skill

```ml
skill
```

When constructing this record, `init` supplies `skill` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L54)

<a id="field-field-mq3-client-ui-sp-skill-skillmenu-sounds-sounds-src-mq3-client-ui-sp-skill-ml-1435802737"></a>
### sounds

```ml
sounds
```

Registered sound resources associated with the player model or media group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_skill.ml#L61)
