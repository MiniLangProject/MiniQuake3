# `mq3.client.frame.Services`

[Home](README.md) · [Source file](File-src-mq3-client-frame-ml-2110176474.md)

<a id="struct-struct-mq3-client-frame-services-struct-services-src-mq3-client-frame-ml-459431947"></a>
## Services

```ml
struct Services
```

The opaque runtime references let a platform host bind the already ported network_ingress, protocol_runtime and demo runtimes. The callbacks retain the original engine boundaries: SendCmd owns client netchan output, resend owns connectionless negotiation and setCGameTime owns snapshot/demo advancement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L33)

## Members

<a id="field-field-mq3-client-frame-services-cinematicfn-cinematicfn-src-mq3-client-frame-ml-458361281"></a>
### cinematicFn

```ml
cinematicFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L35)

<a id="field-field-mq3-client-frame-services-commandtextfn-commandtextfn-src-mq3-client-frame-ml-1216163609"></a>
### commandTextFn

```ml
commandTextFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-services-consolefn-consolefn-src-mq3-client-frame-ml-472486905"></a>
### consoleFn

```ml
consoleFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L35)

<a id="field-field-mq3-client-frame-services-context-context-src-mq3-client-frame-ml-617609833"></a>
### context

```ml
context
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L36)

<a id="field-field-mq3-client-frame-services-debuggraphfn-debuggraphfn-src-mq3-client-frame-ml-806646419"></a>
### debugGraphFn

```ml
debugGraphFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-services-demoruntime-demoruntime-src-mq3-client-frame-ml-1812836185"></a>
### demoRuntime

```ml
demoRuntime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L36)

<a id="field-field-mq3-client-frame-services-diagnosticfn-diagnosticfn-src-mq3-client-frame-ml-357941891"></a>
### diagnosticFn

```ml
diagnosticFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-services-disconnectfn-disconnectfn-src-mq3-client-frame-ml-2039624465"></a>
### disconnectFn

```ml
disconnectFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-services-infostringfn-infostringfn-src-mq3-client-frame-ml-1691301911"></a>
### infoStringFn

```ml
infoStringFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-services-menufn-menufn-src-mq3-client-frame-ml-1461188263"></a>
### menuFn

```ml
menuFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-services-networkruntime-networkruntime-src-mq3-client-frame-ml-216821921"></a>
### networkRuntime

```ml
networkRuntime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L36)

<a id="field-field-mq3-client-frame-services-protocolruntime-protocolruntime-src-mq3-client-frame-ml-22522493"></a>
### protocolRuntime

```ml
protocolRuntime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L36)

<a id="field-field-mq3-client-frame-services-reliablefn-reliablefn-src-mq3-client-frame-ml-46849825"></a>
### reliableFn

```ml
reliableFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-services-resendfn-resendfn-src-mq3-client-frame-ml-1838269551"></a>
### resendFn

```ml
resendFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L35)

<a id="field-field-mq3-client-frame-services-screenfn-screenfn-src-mq3-client-frame-ml-439891381"></a>
### screenFn

```ml
screenFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L35)

<a id="field-field-mq3-client-frame-services-sendcmdfn-sendcmdfn-src-mq3-client-frame-ml-750206897"></a>
### sendCmdFn

```ml
sendCmdFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L35)

<a id="field-field-mq3-client-frame-services-sendruntime-sendruntime-src-mq3-client-frame-ml-1376693209"></a>
### sendRuntime

```ml
sendRuntime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L36)

<a id="field-field-mq3-client-frame-services-sendservices-sendservices-src-mq3-client-frame-ml-2120808369"></a>
### sendServices

```ml
sendServices
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L36)

<a id="field-field-mq3-client-frame-services-setcgametimefn-setcgametimefn-src-mq3-client-frame-ml-1545123937"></a>
### setCGameTimeFn

```ml
setCGameTimeFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L35)

<a id="field-field-mq3-client-frame-services-soundfn-soundfn-src-mq3-client-frame-ml-42474657"></a>
### soundFn

```ml
soundFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L35)

<a id="field-field-mq3-client-frame-services-stopsoundsfn-stopsoundsfn-src-mq3-client-frame-ml-1189826557"></a>
### stopSoundsFn

```ml
stopSoundsFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)
