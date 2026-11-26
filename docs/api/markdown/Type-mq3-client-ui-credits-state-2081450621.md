# `mq3.client.ui_credits.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-credits-ml-1753415280.md)

<a id="struct-struct-mq3-client-ui-credits-state-struct-state-src-mq3-client-ui-credits-ml-1276942729"></a>
## State

```ml
struct State
```

Stores UI credits state, including `fullscreen`, `drawFn`, `keyFn`, `pushed`, `commands`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_credits.ml#L36)

## Members

<a id="field-field-mq3-client-ui-credits-state-commands-commands-src-mq3-client-ui-credits-ml-584603770"></a>
### commands

```ml
commands
```

When constructing this record, `open` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_credits.ml#L47)

<a id="field-field-mq3-client-ui-credits-state-drawfn-drawfn-src-mq3-client-ui-credits-ml-1765926714"></a>
### drawFn

```ml
drawFn
```

Host callback for the draw operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_credits.ml#L41)

<a id="field-field-mq3-client-ui-credits-state-fullscreen-fullscreen-src-mq3-client-ui-credits-ml-2042463188"></a>
### fullscreen

```ml
fullscreen
```

Whether the credits screen covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_credits.ml#L39)

<a id="field-field-mq3-client-ui-credits-state-keyfn-keyfn-src-mq3-client-ui-credits-ml-1271537214"></a>
### keyFn

```ml
keyFn
```

Host callback for the key operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_credits.ml#L43)

<a id="field-field-mq3-client-ui-credits-state-pushed-pushed-src-mq3-client-ui-credits-ml-106231292"></a>
### pushed

```ml
pushed
```

Records that the scrolling credits screen has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_credits.ml#L45)
