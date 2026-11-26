# `mq3.client.ui_qmenu.KeyResult`

[Home](README.md) · [Source file](File-src-mq3-client-ui-qmenu-ml-201905758.md)

<a id="struct-struct-mq3-client-ui-qmenu-keyresult-struct-keyresult-src-mq3-client-ui-qmenu-ml-785029023"></a>
## KeyResult

```ml
struct KeyResult
```

Stores UI qmenu key result record, including `sound`, `key`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L324)

## Members

<a id="field-field-mq3-client-ui-qmenu-keyresult-key-key-src-mq3-client-ui-qmenu-ml-1826670335"></a>
### key

```ml
key
```

When constructing this record, `MenuField_Key` supplies `key` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L328)

<a id="field-field-mq3-client-ui-qmenu-keyresult-sound-sound-src-mq3-client-ui-qmenu-ml-183854927"></a>
### sound

```ml
sound
```

Menu SOUND_* feedback code selected by key handling for navigation, activation, or rejected input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L326)
