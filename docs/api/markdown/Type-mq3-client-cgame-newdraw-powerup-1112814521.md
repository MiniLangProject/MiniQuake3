# `mq3.client.cgame_newdraw.Powerup`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-newdraw-ml-909882749.md)

<a id="struct-struct-mq3-client-cgame-newdraw-powerup-struct-powerup-src-mq3-client-cgame-newdraw-ml-1755498545"></a>
## Powerup

```ml
struct Powerup
```

Stores client game newdraw powerup record, including `id`, `expires`, `icon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L290)

## Members

<a id="field-field-mq3-client-cgame-newdraw-powerup-expires-expires-src-mq3-client-cgame-newdraw-ml-2094829263"></a>
### expires

```ml
expires
```

Server/client presentation timestamp at which the timed powerup expires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L294)

<a id="field-field-mq3-client-cgame-newdraw-powerup-icon-icon-src-mq3-client-cgame-newdraw-ml-1117067909"></a>
### icon

```ml
icon
```

Image or shader resource used to draw the active powerup in the HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L296)

<a id="field-field-mq3-client-cgame-newdraw-powerup-id-id-src-mq3-client-cgame-newdraw-ml-95583901"></a>
### id

```ml
id
```

Native item or powerup identifier associated with this definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_newdraw.ml#L292)
