# `mq3.client.ui_sp_skill.SkillItem`

[Home](README.md) · [Source file](File-src-mq3-client-ui-sp-skill-ml-441619995.md)

<a id="struct-struct-mq3-client-ui-sp-skill-skillitem-struct-skillitem-src-mq3-client-ui-sp-skill-ml-741983365"></a>
## SkillItem

```ml
struct SkillItem
```

Stores UI sp skill skill item record, including `id`, `label`, `y`, `color`, `shader`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L30)

## Members

<a id="field-field-mq3-client-ui-sp-skill-skillitem-color-color-src-mq3-client-ui-sp-skill-ml-225602285"></a>
### color

```ml
color
```

Named menu color such as red or white used to highlight a skill label or menu asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L39)

<a id="field-field-mq3-client-ui-sp-skill-skillitem-id-id-src-mq3-client-ui-sp-skill-ml-75772407"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the single-player difficulty menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L32)

<a id="field-field-mq3-client-ui-sp-skill-skillitem-label-label-src-mq3-client-ui-sp-skill-ml-55671017"></a>
### label

```ml
label
```

Human-readable caption painted beside or inside the UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L34)

<a id="field-field-mq3-client-ui-sp-skill-skillitem-shader-shader-src-mq3-client-ui-sp-skill-ml-1941375779"></a>
### shader

```ml
shader
```

Image asset path for the difficulty illustration or navigation button; empty for text-only skill choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L42)

<a id="field-field-mq3-client-ui-sp-skill-skillitem-y-y-src-mq3-client-ui-sp-skill-ml-1094418893"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the single-player difficulty menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_skill.ml#L37)
