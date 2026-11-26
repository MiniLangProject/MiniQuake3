# `mq3.client.client_main.Host`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-host-struct-host-src-mq3-client-client-main-ml-1682811763"></a>
## Host

```ml
struct Host
```

Platform-specific I/O remains explicit. The native state changes are always performed; actionFn is skipped when a retail QVM already owns the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L212)

## Members

<a id="field-field-mq3-client-client-main-host-actionfn-actionfn-src-mq3-client-client-main-ml-674021835"></a>
### actionFn

```ml
actionFn
```

Host callback for the action operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L214)

<a id="field-field-mq3-client-client-main-host-allocfn-allocfn-src-mq3-client-client-main-ml-1454279107"></a>
### allocFn

```ml
allocFn
```

Host callback for the alloc operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L219)

<a id="field-field-mq3-client-client-main-host-closefn-closefn-src-mq3-client-client-main-ml-1030173935"></a>
### closeFn

```ml
closeFn
```

Host callback for the close operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L227)

<a id="field-field-mq3-client-client-main-host-context-context-src-mq3-client-client-main-ml-710155931"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for client connection and lifecycle commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L232)

<a id="field-field-mq3-client-client-main-host-existsfn-existsfn-src-mq3-client-client-main-ml-750699503"></a>
### existsFn

```ml
existsFn
```

Host callback for the exists operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L229)

<a id="field-field-mq3-client-client-main-host-freefn-freefn-src-mq3-client-client-main-ml-1513196763"></a>
### freeFn

```ml
freeFn
```

Host callback for the free operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L221)

<a id="field-field-mq3-client-client-main-host-millisecondsfn-millisecondsfn-src-mq3-client-client-main-ml-331666259"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback for the milliseconds operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L217)

<a id="field-field-mq3-client-client-main-host-readfn-readfn-src-mq3-client-client-main-ml-55477651"></a>
### readFn

```ml
readFn
```

Host callback for the read operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L223)

<a id="field-field-mq3-client-client-main-host-writefn-writefn-src-mq3-client-client-main-ml-1628270591"></a>
### writeFn

```ml
writeFn
```

Host callback for the write operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L225)
