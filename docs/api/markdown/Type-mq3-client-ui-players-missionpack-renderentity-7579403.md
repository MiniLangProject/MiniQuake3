# `mq3.client.ui_players_missionpack.RenderEntity`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-missionpack-ml-1990652480.md)

<a id="struct-struct-mq3-client-ui-players-missionpack-renderentity-struct-renderentity-src-mq3-client-ui-players-missionpack-ml-595447401"></a>
## RenderEntity

```ml
struct RenderEntity
```

Stores UI players missionpack render entity record, including `kind`, `origin`, `axis`, `oldframe`, `frame`, `backlerp` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L178)

## Members

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-axis-axis-src-mq3-client-ui-players-missionpack-ml-964083062"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L184)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-backlerp-backlerp-src-mq3-client-ui-players-missionpack-ml-904067088"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the submitted model entity presented by the Missionpack menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L191)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-frame-frame-src-mq3-client-ui-players-missionpack-ml-1993487096"></a>
### frame

```ml
frame
```

Current model frame submitted when drawing the Missionpack menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L188)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-kind-kind-src-mq3-client-ui-players-missionpack-ml-1143835528"></a>
### kind

```ml
kind
```

Drawing primitive or presentation category selecting how this record is rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L180)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-model-model-src-mq3-client-ui-players-missionpack-ml-87439364"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L193)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-oldframe-oldframe-src-mq3-client-ui-players-missionpack-ml-2141854252"></a>
### oldframe

```ml
oldframe
```

Previous model frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L186)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-origin-origin-src-mq3-client-ui-players-missionpack-ml-183409032"></a>
### origin

```ml
origin
```

Preview-scene position of a Missionpack player body part, weapon, or attached sprite.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L182)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-radius-radius-src-mq3-client-ui-players-missionpack-ml-1530713472"></a>
### radius

```ml
radius
```

World-space sprite radius in the mission-pack player-preview entity record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L199)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-renderfx-renderfx-src-mq3-client-ui-players-missionpack-ml-2075030008"></a>
### renderfx

```ml
renderfx
```

Renderer-entity flags controlling lighting, view restrictions, depth handling, and related effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L202)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-shader-shader-src-mq3-client-ui-players-missionpack-ml-1296735958"></a>
### shader

```ml
shader
```

Optional material reference retained in the mission-pack player-preview scene submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L197)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-skin-skin-src-mq3-client-ui-players-missionpack-ml-1132883130"></a>
### skin

```ml
skin
```

Skin resource selected for rendering the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L195)

<a id="field-field-mq3-client-ui-players-missionpack-renderentity-tag-tag-src-mq3-client-ui-players-missionpack-ml-1887391712"></a>
### tag

```ml
tag
```

When constructing this record, `renderEntity` supplies `tag` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L204)
