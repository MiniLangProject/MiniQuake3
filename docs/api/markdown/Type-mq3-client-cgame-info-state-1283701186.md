# `mq3.client.cgame_info.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-info-ml-1413900769.md)

<a id="struct-struct-mq3-client-cgame-info-state-struct-state-src-mq3-client-cgame-info-ml-1423070219"></a>
## State

```ml
struct State
```

Stores client game info state, including `playerIcons`, `itemIcons`, `infoScreenText`, `updates`, `registeredShaders`, `registeredSounds`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L32)

## Members

<a id="field-field-mq3-client-cgame-info-state-infoscreentext-infoscreentext-src-mq3-client-cgame-info-ml-1649978104"></a>
### infoScreenText

```ml
infoScreenText
```

Status text displayed while connecting, loading, or waiting for a game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L38)

<a id="field-field-mq3-client-cgame-info-state-itemicons-itemicons-src-mq3-client-cgame-info-ml-446077734"></a>
### itemIcons

```ml
itemIcons
```

Image or shader resources used to draw the item icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L36)

<a id="field-field-mq3-client-cgame-info-state-playericons-playericons-src-mq3-client-cgame-info-ml-330597786"></a>
### playerIcons

```ml
playerIcons
```

Image or shader resources used to draw the player icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L34)

<a id="field-field-mq3-client-cgame-info-state-registeredshaders-registeredshaders-src-mq3-client-cgame-info-ml-2088998010"></a>
### registeredShaders

```ml
registeredShaders
```

Shader resources selected for registered rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L43)

<a id="field-field-mq3-client-cgame-info-state-registeredsounds-registeredsounds-src-mq3-client-cgame-info-ml-1850060438"></a>
### registeredSounds

```ml
registeredSounds
```

Sound resources selected for the registered event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L45)

<a id="field-field-mq3-client-cgame-info-state-updates-updates-src-mq3-client-cgame-info-ml-5984282"></a>
### updates

```ml
updates
```

When constructing this record, `create` supplies `0` for this member. Used by `loadingString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L41)
