# `mq3.client.ui_main.DispatchResult`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-ml-1850214811.md)

<a id="struct-struct-mq3-client-ui-main-dispatchresult-struct-dispatchresult-src-mq3-client-ui-main-ml-2108750199"></a>
## DispatchResult

```ml
struct DispatchResult
```

Stores UI main dispatch result record, including `value`, `action`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L75)

## Members

<a id="field-field-mq3-client-ui-main-dispatchresult-action-action-src-mq3-client-ui-main-ml-805309854"></a>
### action

```ml
action
```

When constructing this record, `result` supplies `action` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L79)

<a id="field-field-mq3-client-ui-main-dispatchresult-value-value-src-mq3-client-ui-main-ml-1819862914"></a>
### value

```ml
value
```

Return value of the dispatched base-game UI entry point, separate from the host action it records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L77)
