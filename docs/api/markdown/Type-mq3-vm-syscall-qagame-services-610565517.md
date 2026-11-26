# `mq3.vm.syscall_qagame.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-qagame-ml-1544842921.md)

<a id="struct-struct-mq3-vm-syscall-qagame-services-struct-services-src-mq3-vm-syscall-qagame-ml-1139236575"></a>
## Services

```ml
struct Services
```

Services record for vm.syscall_qagame, containing `shared`, `context`, `locateGameDataFn`, `dropClientFn`, `sendServerCommandFn`, `setConfigstringFn`, and 20 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L22)

## Members

<a id="field-field-mq3-vm-syscall-qagame-services-adjustareaportalfn-adjustareaportalfn-src-mq3-vm-syscall-qagame-ml-654796611"></a>
### adjustAreaPortalFn

```ml
adjustAreaPortalFn
```

Injected callback for adjust area portal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L50)

<a id="field-field-mq3-vm-syscall-qagame-services-areasconnectedfn-areasconnectedfn-src-mq3-vm-syscall-qagame-ml-422266945"></a>
### areasConnectedFn

```ml
areasConnectedFn
```

Injected callback for areas connected; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L52)

<a id="field-field-mq3-vm-syscall-qagame-services-botallocateclientfn-botallocateclientfn-src-mq3-vm-syscall-qagame-ml-1130943479"></a>
### botAllocateClientFn

```ml
botAllocateClientFn
```

Injected callback for bot allocate client; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L58)

<a id="field-field-mq3-vm-syscall-qagame-services-botfreeclientfn-botfreeclientfn-src-mq3-vm-syscall-qagame-ml-637612547"></a>
### botFreeClientFn

```ml
botFreeClientFn
```

Injected callback for bot free client; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L60)

<a id="field-field-mq3-vm-syscall-qagame-services-context-context-src-mq3-vm-syscall-qagame-ml-1941684155"></a>
### context

```ml
context
```

Opaque caller-supplied context available to server game-VM entity, client, and configuration services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L27)

<a id="field-field-mq3-vm-syscall-qagame-services-debugpolygoncreatefn-debugpolygoncreatefn-src-mq3-vm-syscall-qagame-ml-135575409"></a>
### debugPolygonCreateFn

```ml
debugPolygonCreateFn
```

Injected callback for debug polygon create; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L66)

<a id="field-field-mq3-vm-syscall-qagame-services-debugpolygondeletefn-debugpolygondeletefn-src-mq3-vm-syscall-qagame-ml-633284907"></a>
### debugPolygonDeleteFn

```ml
debugPolygonDeleteFn
```

Injected callback for debug polygon delete; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L68)

<a id="field-field-mq3-vm-syscall-qagame-services-dropclientfn-dropclientfn-src-mq3-vm-syscall-qagame-ml-1660726535"></a>
### dropClientFn

```ml
dropClientFn
```

Injected callback for drop client; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L31)

<a id="field-field-mq3-vm-syscall-qagame-services-entitytokenfn-entitytokenfn-src-mq3-vm-syscall-qagame-ml-837048019"></a>
### entityTokenFn

```ml
entityTokenFn
```

Injected callback for entity token; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L62)

<a id="field-field-mq3-vm-syscall-qagame-services-extendedfn-extendedfn-src-mq3-vm-syscall-qagame-ml-676581965"></a>
### extendedFn

```ml
extendedFn
```

Injected callback for extended; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L76)

<a id="field-field-mq3-vm-syscall-qagame-services-filelistfn-filelistfn-src-mq3-vm-syscall-qagame-ml-423818335"></a>
### fileListFn

```ml
fileListFn
```

Injected callback for file list; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L64)

<a id="field-field-mq3-vm-syscall-qagame-services-getconfigstringfn-getconfigstringfn-src-mq3-vm-syscall-qagame-ml-1707162911"></a>
### getConfigstringFn

```ml
getConfigstringFn
```

Injected callback for get configuration string; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L37)

<a id="field-field-mq3-vm-syscall-qagame-services-getserverinfofn-getserverinfofn-src-mq3-vm-syscall-qagame-ml-740906999"></a>
### getServerinfoFn

```ml
getServerinfoFn
```

Injected callback for get server information; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L43)

<a id="field-field-mq3-vm-syscall-qagame-services-getuserinfofn-getuserinfofn-src-mq3-vm-syscall-qagame-ml-384896095"></a>
### getUserinfoFn

```ml
getUserinfoFn
```

Injected callback for get user information; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L39)

<a id="field-field-mq3-vm-syscall-qagame-services-inpvsfn-inpvsfn-src-mq3-vm-syscall-qagame-ml-798361315"></a>
### inPvsFn

```ml
inPvsFn
```

Injected callback for in potential visibility set; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L48)

<a id="field-field-mq3-vm-syscall-qagame-services-linkentityfn-linkentityfn-src-mq3-vm-syscall-qagame-ml-728776505"></a>
### linkEntityFn

```ml
linkEntityFn
```

Injected callback for link entity; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L54)

<a id="field-field-mq3-vm-syscall-qagame-services-locategamedatafn-locategamedatafn-src-mq3-vm-syscall-qagame-ml-2371611"></a>
### locateGameDataFn

```ml
locateGameDataFn
```

Injected callback for locate game data; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L29)

<a id="field-field-mq3-vm-syscall-qagame-services-realtimefn-realtimefn-src-mq3-vm-syscall-qagame-ml-1291553421"></a>
### realTimeFn

```ml
realTimeFn
```

Injected callback for real time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L70)

<a id="field-field-mq3-vm-syscall-qagame-services-seekfn-seekfn-src-mq3-vm-syscall-qagame-ml-2049831331"></a>
### seekFn

```ml
seekFn
```

Injected callback for seek; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L72)

<a id="field-field-mq3-vm-syscall-qagame-services-sendservercommandfn-sendservercommandfn-src-mq3-vm-syscall-qagame-ml-219169107"></a>
### sendServerCommandFn

```ml
sendServerCommandFn
```

Injected callback for send server command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L33)

<a id="field-field-mq3-vm-syscall-qagame-services-setbrushmodelfn-setbrushmodelfn-src-mq3-vm-syscall-qagame-ml-35597915"></a>
### setBrushModelFn

```ml
setBrushModelFn
```

Injected callback for set brush model; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L45)

<a id="field-field-mq3-vm-syscall-qagame-services-setconfigstringfn-setconfigstringfn-src-mq3-vm-syscall-qagame-ml-213560743"></a>
### setConfigstringFn

```ml
setConfigstringFn
```

Injected callback for set configuration string; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L35)

<a id="field-field-mq3-vm-syscall-qagame-services-setuserinfofn-setuserinfofn-src-mq3-vm-syscall-qagame-ml-1339691383"></a>
### setUserinfoFn

```ml
setUserinfoFn
```

Injected callback for set user information; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L41)

<a id="field-field-mq3-vm-syscall-qagame-services-shared-shared-src-mq3-vm-syscall-qagame-ml-1643490661"></a>
### shared

```ml
shared
```

Shared host service bundle used by the VM syscall adapters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L24)

<a id="field-field-mq3-vm-syscall-qagame-services-unlinkentityfn-unlinkentityfn-src-mq3-vm-syscall-qagame-ml-801926067"></a>
### unlinkEntityFn

```ml
unlinkEntityFn
```

Injected callback for unlink entity; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L56)

<a id="field-field-mq3-vm-syscall-qagame-services-worldservices-worldservices-src-mq3-vm-syscall-qagame-ml-823059379"></a>
### worldServices

```ml
worldServices
```

Injected world-query callbacks used for collision, visibility, and entity access.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L74)
