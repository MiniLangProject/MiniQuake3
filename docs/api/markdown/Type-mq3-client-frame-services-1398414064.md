# `mq3.client.frame.Services`

[Home](README.md) · [Source file](File-src-mq3-client-frame-ml-2110176474.md)

<a id="struct-struct-mq3-client-frame-services-struct-services-src-mq3-client-frame-ml-459431947"></a>
## Services

```ml
struct Services
```

The opaque runtime references let a platform host bind the already ported network_ingress, protocol_runtime and demo runtimes. The callbacks retain the original engine boundaries: SendCmd owns client netchan output, resend owns connectionless negotiation and setCGameTime owns snapshot/demo advancement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L96)

## Members

<a id="field-field-mq3-client-frame-services-cinematicfn-cinematicfn-src-mq3-client-frame-ml-458361281"></a>
### cinematicFn

```ml
cinematicFn
```

Host callback for the cinematic operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L134)

<a id="field-field-mq3-client-frame-services-commandtextfn-commandtextfn-src-mq3-client-frame-ml-1216163609"></a>
### commandTextFn

```ml
commandTextFn
```

Host callback for the command text operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L104)

<a id="field-field-mq3-client-frame-services-consolefn-consolefn-src-mq3-client-frame-ml-472486905"></a>
### consoleFn

```ml
consoleFn
```

Host callback for the console operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L136)

<a id="field-field-mq3-client-frame-services-context-context-src-mq3-client-frame-ml-617609833"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for client frame scheduling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L148)

<a id="field-field-mq3-client-frame-services-debuggraphfn-debuggraphfn-src-mq3-client-frame-ml-806646419"></a>
### debugGraphFn

```ml
debugGraphFn
```

Host callback for the debug graph operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L107)

<a id="field-field-mq3-client-frame-services-demoruntime-demoruntime-src-mq3-client-frame-ml-1812836185"></a>
### demoRuntime

```ml
demoRuntime
```

When constructing this record, `services` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L142)

<a id="field-field-mq3-client-frame-services-diagnosticfn-diagnosticfn-src-mq3-client-frame-ml-357941891"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback for the diagnostic operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L116)

<a id="field-field-mq3-client-frame-services-disconnectfn-disconnectfn-src-mq3-client-frame-ml-2039624465"></a>
### disconnectFn

```ml
disconnectFn
```

Host callback for the disconnect operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L119)

<a id="field-field-mq3-client-frame-services-infostringfn-infostringfn-src-mq3-client-frame-ml-1691301911"></a>
### infoStringFn

```ml
infoStringFn
```

Host callback for the info string operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L110)

<a id="field-field-mq3-client-frame-services-menufn-menufn-src-mq3-client-frame-ml-1461188263"></a>
### menuFn

```ml
menuFn
```

Host callback for the menu operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L98)

<a id="field-field-mq3-client-frame-services-networkruntime-networkruntime-src-mq3-client-frame-ml-216821921"></a>
### networkRuntime

```ml
networkRuntime
```

When constructing this record, `services` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L138)

<a id="field-field-mq3-client-frame-services-protocolruntime-protocolruntime-src-mq3-client-frame-ml-22522493"></a>
### protocolRuntime

```ml
protocolRuntime
```

When constructing this record, `services` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L140)

<a id="field-field-mq3-client-frame-services-reliablefn-reliablefn-src-mq3-client-frame-ml-46849825"></a>
### reliableFn

```ml
reliableFn
```

Host callback for the reliable operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L113)

<a id="field-field-mq3-client-frame-services-resendfn-resendfn-src-mq3-client-frame-ml-1838269551"></a>
### resendFn

```ml
resendFn
```

Host callback for the resend operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L124)

<a id="field-field-mq3-client-frame-services-screenfn-screenfn-src-mq3-client-frame-ml-439891381"></a>
### screenFn

```ml
screenFn
```

Host callback for the screen operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L129)

<a id="field-field-mq3-client-frame-services-sendcmdfn-sendcmdfn-src-mq3-client-frame-ml-750206897"></a>
### sendCmdFn

```ml
sendCmdFn
```

Host callback for the send cmd operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L122)

<a id="field-field-mq3-client-frame-services-sendruntime-sendruntime-src-mq3-client-frame-ml-1376693209"></a>
### sendRuntime

```ml
sendRuntime
```

When constructing this record, `services` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L144)

<a id="field-field-mq3-client-frame-services-sendservices-sendservices-src-mq3-client-frame-ml-2120808369"></a>
### sendServices

```ml
sendServices
```

When constructing this record, `services` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L146)

<a id="field-field-mq3-client-frame-services-setcgametimefn-setcgametimefn-src-mq3-client-frame-ml-1545123937"></a>
### setCGameTimeFn

```ml
setCGameTimeFn
```

Host callback for the set c game time operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L127)

<a id="field-field-mq3-client-frame-services-soundfn-soundfn-src-mq3-client-frame-ml-42474657"></a>
### soundFn

```ml
soundFn
```

Host callback for the sound operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L131)

<a id="field-field-mq3-client-frame-services-stopsoundsfn-stopsoundsfn-src-mq3-client-frame-ml-1189826557"></a>
### stopSoundsFn

```ml
stopSoundsFn
```

Host callback for the stop sounds operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/frame.ml#L101)
