# `mq3.client.ui_add_bots.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-add-bots-ml-1676535950.md)

<a id="struct-struct-mq3-client-ui-add-bots-action-struct-action-src-mq3-client-ui-add-bots-ml-799869827"></a>
## Action

```ml
struct Action
```

Stores UI add bots queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L51)

## Members

<a id="field-field-mq3-client-ui-add-bots-action-boundary-boundary-src-mq3-client-ui-add-bots-ml-1378454895"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while populating bot choices and issuing bot-addition commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L54)

<a id="field-field-mq3-client-ui-add-bots-action-dispatched-dispatched-src-mq3-client-ui-add-bots-ml-1489096877"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while populating bot choices and issuing bot-addition commands; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L68)

<a id="field-field-mq3-client-ui-add-bots-action-kind-kind-src-mq3-client-ui-add-bots-ml-1600949151"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while populating bot choices and issuing bot-addition commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L57)

<a id="field-field-mq3-client-ui-add-bots-action-name-name-src-mq3-client-ui-add-bots-ml-276918245"></a>
### name

```ml
name
```

Bot-menu target or media asset, or the addbot command name, selected by the action kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L59)

<a id="field-field-mq3-client-ui-add-bots-action-text-text-src-mq3-client-ui-add-bots-ml-1564169005"></a>
### text

```ml
text
```

Complete addbot command assembled from the selected bot, skill, team, and delay; empty for menu and asset actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L62)

<a id="field-field-mq3-client-ui-add-bots-action-value-value-src-mq3-client-ui-add-bots-ml-146925459"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while populating bot choices and issuing bot-addition commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L65)
