# `mq3.client.ui_host_lifecycle.Services`

[Home](README.md) · [Source file](File-src-mq3-client-ui-host-lifecycle-ml-451482783.md)

<a id="struct-struct-mq3-client-ui-host-lifecycle-services-struct-services-src-mq3-client-ui-host-lifecycle-ml-990411291"></a>
## Services

```ml
struct Services
```

Stores UI host lifecycle host-service callbacks, including `context`, `fullscreenFn`, `refreshFn`, `menuFn`, `connectFn`, `cgameFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L55)

## Members

<a id="field-field-mq3-client-ui-host-lifecycle-services-catcherfn-catcherfn-src-mq3-client-ui-host-lifecycle-ml-2084992433"></a>
### catcherFn

```ml
catcherFn
```

Host callback for the catcher operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L74)

<a id="field-field-mq3-client-ui-host-lifecycle-services-cgamefn-cgamefn-src-mq3-client-ui-host-lifecycle-ml-2127020737"></a>
### cgameFn

```ml
cgameFn
```

Host callback for the cgame operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L69)

<a id="field-field-mq3-client-ui-host-lifecycle-services-cinematicfn-cinematicfn-src-mq3-client-ui-host-lifecycle-ml-742587181"></a>
### cinematicFn

```ml
cinematicFn
```

Host callback for the cinematic operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L72)

<a id="field-field-mq3-client-ui-host-lifecycle-services-connectfn-connectfn-src-mq3-client-ui-host-lifecycle-ml-170359453"></a>
### connectFn

```ml
connectFn
```

Host callback for the connect operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L67)

<a id="field-field-mq3-client-ui-host-lifecycle-services-context-context-src-mq3-client-ui-host-lifecycle-ml-1359824693"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for UI virtual-machine lifecycle management.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L58)

<a id="field-field-mq3-client-ui-host-lifecycle-services-fullscreenfn-fullscreenfn-src-mq3-client-ui-host-lifecycle-ml-2076608175"></a>
### fullscreenFn

```ml
fullscreenFn
```

Host callback for the fullscreen operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L61)

<a id="field-field-mq3-client-ui-host-lifecycle-services-menufn-menufn-src-mq3-client-ui-host-lifecycle-ml-1824215747"></a>
### menuFn

```ml
menuFn
```

Host callback for the menu operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L65)

<a id="field-field-mq3-client-ui-host-lifecycle-services-refreshfn-refreshfn-src-mq3-client-ui-host-lifecycle-ml-988377693"></a>
### refreshFn

```ml
refreshFn
```

Host callback for the refresh operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L63)
