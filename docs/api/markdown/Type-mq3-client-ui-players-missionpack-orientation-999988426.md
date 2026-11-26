# `mq3.client.ui_players_missionpack.Orientation`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-missionpack-ml-1990652480.md)

<a id="struct-struct-mq3-client-ui-players-missionpack-orientation-struct-orientation-src-mq3-client-ui-players-missionpack-ml-807842679"></a>
## Orientation

```ml
struct Orientation
```

Stores UI players missionpack orientation record, including `origin`, `axis`, `found`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L169)

## Members

<a id="field-field-mq3-client-ui-players-missionpack-orientation-axis-axis-src-mq3-client-ui-players-missionpack-ml-1103180817"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L173)

<a id="field-field-mq3-client-ui-players-missionpack-orientation-found-found-src-mq3-client-ui-players-missionpack-ml-1160761799"></a>
### found

```ml
found
```

True when the requested model attachment tag was found and the returned transform is valid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L175)

<a id="field-field-mq3-client-ui-players-missionpack-orientation-origin-origin-src-mq3-client-ui-players-missionpack-ml-1010103827"></a>
### origin

```ml
origin
```

Model-local attachment-tag origin used to join Missionpack preview model parts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L171)
