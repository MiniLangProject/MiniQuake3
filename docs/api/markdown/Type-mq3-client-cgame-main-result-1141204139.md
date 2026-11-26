# `mq3.client.cgame_main.Result`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-result-struct-result-src-mq3-client-cgame-main-ml-1515939377"></a>
## Result

```ml
struct Result
```

Stores client game main operation result, including `handled`, `value`, `actions`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L103)

## Members

<a id="field-field-mq3-client-cgame-main-result-actions-actions-src-mq3-client-cgame-main-ml-552105274"></a>
### actions

```ml
actions
```

Host requests queued while initializing CGame, registering media, and updating shared client information, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L111)

<a id="field-field-mq3-client-cgame-main-result-handled-handled-src-mq3-client-cgame-main-ml-254258710"></a>
### handled

```ml
handled
```

When constructing this record, `result` supplies `handled` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L105)

<a id="field-field-mq3-client-cgame-main-result-value-value-src-mq3-client-cgame-main-ml-1929763002"></a>
### value

```ml
value
```

Result of a CGame lifecycle or entry-point operation, returned alongside its recorded host requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L108)
