# `mq3.client.ui_shared.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-shared-ml-1094733975.md)

<a id="struct-struct-mq3-client-ui-shared-action-struct-action-src-mq3-client-ui-shared-ml-606135027"></a>
## Action

```ml
struct Action
```

Stores UI shared queued engine action, including `boundary`, `kind`, `name`, `detail`, `number`, `vector` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L137)

## Members

<a id="field-field-mq3-client-ui-shared-action-boundary-boundary-src-mq3-client-ui-shared-ml-1873195407"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while evaluating menu scripts, registering resources, and issuing widget draw requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L140)

<a id="field-field-mq3-client-ui-shared-action-detail-detail-src-mq3-client-ui-shared-ml-837643185"></a>
### detail

```ml
detail
```

Additional text payload required by the selected host operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L147)

<a id="field-field-mq3-client-ui-shared-action-dispatched-dispatched-src-mq3-client-ui-shared-ml-1387612089"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while evaluating menu scripts, registering resources, and issuing widget draw requests; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L155)

<a id="field-field-mq3-client-ui-shared-action-kind-kind-src-mq3-client-ui-shared-ml-1674530775"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while evaluating menu scripts, registering resources, and issuing widget draw requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L143)

<a id="field-field-mq3-client-ui-shared-action-name-name-src-mq3-client-ui-shared-ml-288336925"></a>
### name

```ml
name
```

Resource, menu or item, cvar, or command target referenced by the parsed-menu host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L145)

<a id="field-field-mq3-client-ui-shared-action-number-number-src-mq3-client-ui-shared-ml-448711745"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while evaluating menu scripts, registering resources, and issuing widget draw requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L150)

<a id="field-field-mq3-client-ui-shared-action-vector-vector-src-mq3-client-ui-shared-ml-850446549"></a>
### vector

```ml
vector
```

Vector argument interpreted according to the queued operation's kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L152)
