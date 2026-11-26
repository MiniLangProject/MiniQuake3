# `mq3.client.packet_event.Services`

[Home](README.md) · [Source file](File-src-mq3-client-packet-event-ml-580908436.md)

<a id="struct-struct-mq3-client-packet-event-services-struct-services-src-mq3-client-packet-event-ml-1250732953"></a>
## Services

```ml
struct Services
```

Stores packet event host-service callbacks, including `connectionlessHost`, `processFn`, `parseFn`, `demoFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L37)

## Members

<a id="field-field-mq3-client-packet-event-services-connectionlesshost-connectionlesshost-src-mq3-client-packet-event-ml-1559573291"></a>
### connectionlessHost

```ml
connectionlessHost
```

When constructing this record, `services` supplies `connectionlessHost` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L39)

<a id="field-field-mq3-client-packet-event-services-context-context-src-mq3-client-packet-event-ml-1742382185"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for sequenced client packet processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L48)

<a id="field-field-mq3-client-packet-event-services-demofn-demofn-src-mq3-client-packet-event-ml-1766339851"></a>
### demoFn

```ml
demoFn
```

Host callback for the demo operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L45)

<a id="field-field-mq3-client-packet-event-services-parsefn-parsefn-src-mq3-client-packet-event-ml-645803373"></a>
### parseFn

```ml
parseFn
```

Host callback for the parse operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L43)

<a id="field-field-mq3-client-packet-event-services-processfn-processfn-src-mq3-client-packet-event-ml-118580021"></a>
### processFn

```ml
processFn
```

Host callback for the process operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L41)
