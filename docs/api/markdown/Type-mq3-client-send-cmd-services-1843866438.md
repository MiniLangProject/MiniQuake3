# `mq3.client.send_cmd.Services`

[Home](README.md) · [Source file](File-src-mq3-client-send-cmd-ml-1342588170.md)

<a id="struct-struct-mq3-client-send-cmd-services-struct-services-src-mq3-client-send-cmd-ml-674560541"></a>
## Services

```ml
struct Services
```

Stores send cmd host-service callbacks, including `createCommandFn`, `transmitFn`, `cvarFn`, `diagnosticFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L134)

## Members

<a id="field-field-mq3-client-send-cmd-services-context-context-src-mq3-client-send-cmd-ml-899600141"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for client command-packet transmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L148)

<a id="field-field-mq3-client-send-cmd-services-createcommandfn-createcommandfn-src-mq3-client-send-cmd-ml-123099009"></a>
### createCommandFn

```ml
createCommandFn
```

Host callback for the create command operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L137)

<a id="field-field-mq3-client-send-cmd-services-cvarfn-cvarfn-src-mq3-client-send-cmd-ml-1762434093"></a>
### cvarFn

```ml
cvarFn
```

Host callback for the cvar operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L142)

<a id="field-field-mq3-client-send-cmd-services-diagnosticfn-diagnosticfn-src-mq3-client-send-cmd-ml-1735689355"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback for the diagnostic operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L145)

<a id="field-field-mq3-client-send-cmd-services-transmitfn-transmitfn-src-mq3-client-send-cmd-ml-1533685981"></a>
### transmitFn

```ml
transmitFn
```

Host callback for the transmit operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L140)
