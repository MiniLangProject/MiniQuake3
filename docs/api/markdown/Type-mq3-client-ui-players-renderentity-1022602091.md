# `mq3.client.ui_players.RenderEntity`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-ml-675454436.md)

<a id="struct-struct-mq3-client-ui-players-renderentity-struct-renderentity-src-mq3-client-ui-players-ml-659787329"></a>
## RenderEntity

```ml
struct RenderEntity
```

Stores UI players render entity record, including `kind`, `origin`, `axis`, `oldframe`, `frame`, `backlerp` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L177)

## Members

<a id="field-field-mq3-client-ui-players-renderentity-axis-axis-src-mq3-client-ui-players-ml-430139962"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L183)

<a id="field-field-mq3-client-ui-players-renderentity-backlerp-backlerp-src-mq3-client-ui-players-ml-1215866704"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the submitted model entity presented by the base-game menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L190)

<a id="field-field-mq3-client-ui-players-renderentity-frame-frame-src-mq3-client-ui-players-ml-323132136"></a>
### frame

```ml
frame
```

Current model frame submitted when drawing the Baseq3 menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L187)

<a id="field-field-mq3-client-ui-players-renderentity-kind-kind-src-mq3-client-ui-players-ml-1736811144"></a>
### kind

```ml
kind
```

Drawing primitive or presentation category selecting how this record is rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L179)

<a id="field-field-mq3-client-ui-players-renderentity-model-model-src-mq3-client-ui-players-ml-342040468"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L192)

<a id="field-field-mq3-client-ui-players-renderentity-oldframe-oldframe-src-mq3-client-ui-players-ml-259266524"></a>
### oldframe

```ml
oldframe
```

Previous model frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L185)

<a id="field-field-mq3-client-ui-players-renderentity-origin-origin-src-mq3-client-ui-players-ml-607743864"></a>
### origin

```ml
origin
```

Preview-scene position of a player body part, weapon, or attached sprite.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L181)

<a id="field-field-mq3-client-ui-players-renderentity-radius-radius-src-mq3-client-ui-players-ml-1997082272"></a>
### radius

```ml
radius
```

World-space sprite radius in the player-preview scene entity record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L198)

<a id="field-field-mq3-client-ui-players-renderentity-renderfx-renderfx-src-mq3-client-ui-players-ml-1413549736"></a>
### renderfx

```ml
renderfx
```

Renderer-entity flags controlling lighting, view restrictions, depth handling, and related effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L201)

<a id="field-field-mq3-client-ui-players-renderentity-shader-shader-src-mq3-client-ui-players-ml-1954993290"></a>
### shader

```ml
shader
```

Optional material reference retained in the base-game player-preview render submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L196)

<a id="field-field-mq3-client-ui-players-renderentity-skin-skin-src-mq3-client-ui-players-ml-877061934"></a>
### skin

```ml
skin
```

Skin resource selected for rendering the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L194)

<a id="field-field-mq3-client-ui-players-renderentity-tag-tag-src-mq3-client-ui-players-ml-903949328"></a>
### tag

```ml
tag
```

When constructing this record, `renderEntity` supplies `tag` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L203)
