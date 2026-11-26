# `mq3.botlib.server_imports.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-server-imports-ml-1126004744.md)

<a id="struct-struct-mq3-botlib-server-imports-services-struct-services-src-mq3-botlib-server-imports-ml-574347473"></a>
## Services

```ml
struct Services
```

`Services` record for server imports, containing `printFn`, `errorFn`, `traceFn`, `entityTraceFn` and `pointContentsFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L96)

## Members

<a id="field-field-mq3-botlib-server-imports-services-allocfn-allocfn-src-mq3-botlib-server-imports-ml-1291987241"></a>
### allocFn

```ml
allocFn
```

Host callback that allocates host-managed memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L114)

<a id="field-field-mq3-botlib-server-imports-services-context-context-src-mq3-botlib-server-imports-ml-257058601"></a>
### context

```ml
context
```

Caller-supplied data associated with engine services imported by the bot library, including traces and memory access.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L141)

<a id="field-field-mq3-botlib-server-imports-services-cvargetfn-cvargetfn-src-mq3-botlib-server-imports-ml-367045249"></a>
### cvarGetFn

```ml
cvarGetFn
```

Host callback that retrieves a configuration variable from the host registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L132)

<a id="field-field-mq3-botlib-server-imports-services-drawpolyfn-drawpolyfn-src-mq3-botlib-server-imports-ml-1771353049"></a>
### drawPolyFn

```ml
drawPolyFn
```

Host callback that submits a navigation debug polygon to the host renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L122)

<a id="field-field-mq3-botlib-server-imports-services-entitydatafn-entitydatafn-src-mq3-botlib-server-imports-ml-1275629835"></a>
### entityDataFn

```ml
entityDataFn
```

Host callback that retrieves the host representation of a game entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L110)

<a id="field-field-mq3-botlib-server-imports-services-entitytracefn-entitytracefn-src-mq3-botlib-server-imports-ml-638454021"></a>
### entityTraceFn

```ml
entityTraceFn
```

Host callback that traces movement against an individual entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L104)

<a id="field-field-mq3-botlib-server-imports-services-errorfn-errorfn-src-mq3-botlib-server-imports-ml-575944689"></a>
### errorFn

```ml
errorFn
```

Host callback that reports a host error using the requested error severity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L100)

<a id="field-field-mq3-botlib-server-imports-services-executeclientcommandfn-executeclientcommandfn-src-mq3-botlib-server-imports-ml-722000199"></a>
### executeClientCommandFn

```ml
executeClientCommandFn
```

Host callback that dispatches a validated client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L124)

<a id="field-field-mq3-botlib-server-imports-services-freefn-freefn-src-mq3-botlib-server-imports-ml-596503409"></a>
### freeFn

```ml
freeFn
```

Host callback that releases host-managed memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L116)

<a id="field-field-mq3-botlib-server-imports-services-gameframefn-gameframefn-src-mq3-botlib-server-imports-ml-604231765"></a>
### gameFrameFn

```ml
gameFrameFn
```

Host callback that runs the game VM for one server simulation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L126)

<a id="field-field-mq3-botlib-server-imports-services-getapifn-getapifn-src-mq3-botlib-server-imports-ml-461267569"></a>
### getApiFn

```ml
getApiFn
```

Host callback that retrieves the host bot-library API interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L138)

<a id="field-field-mq3-botlib-server-imports-services-hunkallocfn-hunkallocfn-src-mq3-botlib-server-imports-ml-1935478749"></a>
### hunkAllocFn

```ml
hunkAllocFn
```

Host callback that allocates permanent hunk memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L120)

<a id="field-field-mq3-botlib-server-imports-services-hunkmarkfn-hunkmarkfn-src-mq3-botlib-server-imports-ml-231887295"></a>
### hunkMarkFn

```ml
hunkMarkFn
```

Host callback that records the host hunk allocation mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L118)

<a id="field-field-mq3-botlib-server-imports-services-inpvsfn-inpvsfn-src-mq3-botlib-server-imports-ml-1240992977"></a>
### inPvsFn

```ml
inPvsFn
```

Host callback that tests whether two positions are potentially visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L108)

<a id="field-field-mq3-botlib-server-imports-services-modelboundsfn-modelboundsfn-src-mq3-botlib-server-imports-ml-277545661"></a>
### modelBoundsFn

```ml
modelBoundsFn
```

Host callback that returns bounds of a collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L112)

<a id="field-field-mq3-botlib-server-imports-services-pointcontentsfn-pointcontentsfn-src-mq3-botlib-server-imports-ml-308045885"></a>
### pointContentsFn

```ml
pointContentsFn
```

Host callback that queries world contents at a supplied point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L106)

<a id="field-field-mq3-botlib-server-imports-services-printfn-printfn-src-mq3-botlib-server-imports-ml-1138665033"></a>
### printFn

```ml
printFn
```

Host callback that forwards bot-library diagnostic output through the engine import table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L98)

<a id="field-field-mq3-botlib-server-imports-services-setupfn-setupfn-src-mq3-botlib-server-imports-ml-1237950449"></a>
### setupFn

```ml
setupFn
```

Host callback that initializes the supplied bot-library adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L128)

<a id="field-field-mq3-botlib-server-imports-services-shutdownfn-shutdownfn-src-mq3-botlib-server-imports-ml-1981999585"></a>
### shutdownFn

```ml
shutdownFn
```

Host callback that shuts down the host subsystem and releases its resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L130)

<a id="field-field-mq3-botlib-server-imports-services-testfn-testfn-src-mq3-botlib-server-imports-ml-1691568569"></a>
### testFn

```ml
testFn
```

Host callback that invokes the bot-library diagnostic entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L136)

<a id="field-field-mq3-botlib-server-imports-services-tracefn-tracefn-src-mq3-botlib-server-imports-ml-1000494629"></a>
### traceFn

```ml
traceFn
```

Host callback that performs a collision sweep through the host world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L102)

<a id="field-field-mq3-botlib-server-imports-services-varsetfn-varsetfn-src-mq3-botlib-server-imports-ml-771176019"></a>
### varSetFn

```ml
varSetFn
```

Host callback that sets a bot-library configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L134)
