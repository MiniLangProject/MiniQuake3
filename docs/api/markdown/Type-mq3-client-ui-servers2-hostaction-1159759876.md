# `mq3.client.ui_servers2.HostAction`

[Home](README.md) · [Source file](File-src-mq3-client-ui-servers2-ml-1909498126.md)

<a id="struct-struct-mq3-client-ui-servers2-hostaction-struct-hostaction-src-mq3-client-ui-servers2-ml-164620827"></a>
## HostAction

```ml
struct HostAction
```

Stores UI servers2 host action record, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L111)

## Members

<a id="field-field-mq3-client-ui-servers2-hostaction-boundary-boundary-src-mq3-client-ui-servers2-ml-2002928509"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while refreshing, filtering, and selecting servers for connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L114)

<a id="field-field-mq3-client-ui-servers2-hostaction-dispatched-dispatched-src-mq3-client-ui-servers2-ml-1247067811"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while refreshing, filtering, and selecting servers for connection; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L126)

<a id="field-field-mq3-client-ui-servers2-hostaction-kind-kind-src-mq3-client-ui-servers2-ml-1226063581"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while refreshing, filtering, and selecting servers for connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L117)

<a id="field-field-mq3-client-ui-servers2-hostaction-name-name-src-mq3-client-ui-servers2-ml-986198635"></a>
### name

```ml
name
```

Target resource, command, or setting name addressed by this queued host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L119)

<a id="field-field-mq3-client-ui-servers2-hostaction-number-number-src-mq3-client-ui-servers2-ml-250616103"></a>
### number

```ml
number
```

When constructing this record, `action` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L123)

<a id="field-field-mq3-client-ui-servers2-hostaction-text-text-src-mq3-client-ui-servers2-ml-1333885707"></a>
### text

```ml
text
```

Command or configuration text emitted by the server browser, including connect and ping requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L121)
