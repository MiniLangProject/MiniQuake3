# `mq3.client.ui_rankings.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-rankings-ml-966722513.md)

<a id="struct-struct-mq3-client-ui-rankings-action-struct-action-src-mq3-client-ui-rankings-ml-345862071"></a>
## Action

```ml
struct Action
```

Stores UI rankings queued engine action, including `boundary`, `kind`, `name`, `text`, `x`, `y` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L49)

## Members

<a id="field-field-mq3-client-ui-rankings-action-boundary-boundary-src-mq3-client-ui-rankings-ml-374506107"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while offering account login, logout, signup, and ranked-play choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L52)

<a id="field-field-mq3-client-ui-rankings-action-dispatched-dispatched-src-mq3-client-ui-rankings-ml-633670077"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while offering account login, logout, signup, and ranked-play choices; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L72)

<a id="field-field-mq3-client-ui-rankings-action-kind-kind-src-mq3-client-ui-rankings-ml-1801819315"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while offering account login, logout, signup, and ranked-play choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L55)

<a id="field-field-mq3-client-ui-rankings-action-name-name-src-mq3-client-ui-rankings-ml-1751652937"></a>
### name

```ml
name
```

Menu destination, command label, drawing color, or artwork resource referenced by the rankings action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L58)

<a id="field-field-mq3-client-ui-rankings-action-text-text-src-mq3-client-ui-rankings-ml-1468905621"></a>
### text

```ml
text
```

Drawn account-field character or rankings command text carried by the selected host operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L60)

<a id="field-field-mq3-client-ui-rankings-action-value-value-src-mq3-client-ui-rankings-ml-1775672379"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while offering account login, logout, signup, and ranked-play choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L69)

<a id="field-field-mq3-client-ui-rankings-action-x-x-src-mq3-client-ui-rankings-ml-141300487"></a>
### x

```ml
x
```

Horizontal position of this queued drawing operation in the virtual layout used by the ranked-play account menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L63)

<a id="field-field-mq3-client-ui-rankings-action-y-y-src-mq3-client-ui-rankings-ml-218537931"></a>
### y

```ml
y
```

Vertical position of this queued drawing operation in the virtual layout used by the ranked-play account menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_rankings.ml#L66)
