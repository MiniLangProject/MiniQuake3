# `mq3.vm.syscall_cgame.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-cgame-ml-1987612568.md)

<a id="struct-struct-mq3-vm-syscall-cgame-services-struct-services-src-mq3-vm-syscall-cgame-ml-877095735"></a>
## Services

```ml
struct Services
```

Services record for vm.syscall_cgame, containing `shared`, `context`, `addCommandFn`, `removeCommandFn`, `sendClientCommandFn`, `updateScreenFn`, and 18 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L35)

## Members

<a id="field-field-mq3-vm-syscall-cgame-services-addcommandfn-addcommandfn-src-mq3-vm-syscall-cgame-ml-994130661"></a>
### addCommandFn

```ml
addCommandFn
```

Injected callback for add command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L42)

<a id="field-field-mq3-vm-syscall-cgame-services-clearscenefn-clearscenefn-src-mq3-vm-syscall-cgame-ml-1053170627"></a>
### clearSceneFn

```ml
clearSceneFn
```

Injected callback for clear scene; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L60)

<a id="field-field-mq3-vm-syscall-cgame-services-context-context-src-mq3-vm-syscall-cgame-ml-1992979853"></a>
### context

```ml
context
```

Opaque caller-supplied context available to client-game VM rendering, snapshots, input commands, and registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L40)

<a id="field-field-mq3-vm-syscall-cgame-services-extendedfn-extendedfn-src-mq3-vm-syscall-cgame-ml-1095121043"></a>
### extendedFn

```ml
extendedFn
```

Injected callback for extended; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L85)

<a id="field-field-mq3-vm-syscall-cgame-services-getcurrentcmdnumberfn-getcurrentcmdnumberfn-src-mq3-vm-syscall-cgame-ml-633953661"></a>
### getCurrentCmdNumberFn

```ml
getCurrentCmdNumberFn
```

Injected callback for get current cmd number; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L73)

<a id="field-field-mq3-vm-syscall-cgame-services-getcurrentsnapshotnumberfn-getcurrentsnapshotnumberfn-src-mq3-vm-syscall-cgame-ml-1807444377"></a>
### getCurrentSnapshotNumberFn

```ml
getCurrentSnapshotNumberFn
```

Injected callback for get current snapshot number; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L67)

<a id="field-field-mq3-vm-syscall-cgame-services-getgamestatefn-getgamestatefn-src-mq3-vm-syscall-cgame-ml-859939911"></a>
### getGameStateFn

```ml
getGameStateFn
```

Injected callback for get game state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L64)

<a id="field-field-mq3-vm-syscall-cgame-services-getglconfigfn-getglconfigfn-src-mq3-vm-syscall-cgame-ml-536089025"></a>
### getGlconfigFn

```ml
getGlconfigFn
```

Injected callback for get glconfig; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L62)

<a id="field-field-mq3-vm-syscall-cgame-services-getservercommandfn-getservercommandfn-src-mq3-vm-syscall-cgame-ml-932523065"></a>
### getServerCommandFn

```ml
getServerCommandFn
```

Injected callback for get server command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L71)

<a id="field-field-mq3-vm-syscall-cgame-services-getsnapshotfn-getsnapshotfn-src-mq3-vm-syscall-cgame-ml-1863180721"></a>
### getSnapshotFn

```ml
getSnapshotFn
```

Injected callback for get snapshot; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L69)

<a id="field-field-mq3-vm-syscall-cgame-services-getusercmdfn-getusercmdfn-src-mq3-vm-syscall-cgame-ml-1102776107"></a>
### getUserCmdFn

```ml
getUserCmdFn
```

Injected callback for get user cmd; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L75)

<a id="field-field-mq3-vm-syscall-cgame-services-keyservices-keyservices-src-mq3-vm-syscall-cgame-ml-843881489"></a>
### keyServices

```ml
keyServices
```

Keyboard-state and key-binding service bundle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L81)

<a id="field-field-mq3-vm-syscall-cgame-services-loadworldfn-loadworldfn-src-mq3-vm-syscall-cgame-ml-605967677"></a>
### loadWorldFn

```ml
loadWorldFn
```

Injected callback for load world; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L50)

<a id="field-field-mq3-vm-syscall-cgame-services-memoryremainingfn-memoryremainingfn-src-mq3-vm-syscall-cgame-ml-946597869"></a>
### memoryRemainingFn

```ml
memoryRemainingFn
```

Injected callback for memory remaining; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L79)

<a id="field-field-mq3-vm-syscall-cgame-services-pcservices-pcservices-src-mq3-vm-syscall-cgame-ml-1253713051"></a>
### pcServices

```ml
pcServices
```

Preprocessor/token-source service bundle used by parser syscalls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L83)

<a id="field-field-mq3-vm-syscall-cgame-services-registermodelfn-registermodelfn-src-mq3-vm-syscall-cgame-ml-2057985389"></a>
### registerModelFn

```ml
registerModelFn
```

Injected callback for register model; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L52)

<a id="field-field-mq3-vm-syscall-cgame-services-registershaderfn-registershaderfn-src-mq3-vm-syscall-cgame-ml-300678137"></a>
### registerShaderFn

```ml
registerShaderFn
```

Injected callback for register shader; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L56)

<a id="field-field-mq3-vm-syscall-cgame-services-registershadernomipfn-registershadernomipfn-src-mq3-vm-syscall-cgame-ml-995899145"></a>
### registerShaderNoMipFn

```ml
registerShaderNoMipFn
```

Injected callback for register shader no mip; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L58)

<a id="field-field-mq3-vm-syscall-cgame-services-registerskinfn-registerskinfn-src-mq3-vm-syscall-cgame-ml-539885021"></a>
### registerSkinFn

```ml
registerSkinFn
```

Injected callback for register skin; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L54)

<a id="field-field-mq3-vm-syscall-cgame-services-removecommandfn-removecommandfn-src-mq3-vm-syscall-cgame-ml-196077677"></a>
### removeCommandFn

```ml
removeCommandFn
```

Injected callback for remove command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L44)

<a id="field-field-mq3-vm-syscall-cgame-services-sendclientcommandfn-sendclientcommandfn-src-mq3-vm-syscall-cgame-ml-1260743845"></a>
### sendClientCommandFn

```ml
sendClientCommandFn
```

Injected callback for send client command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L46)

<a id="field-field-mq3-vm-syscall-cgame-services-setusercmdvaluefn-setusercmdvaluefn-src-mq3-vm-syscall-cgame-ml-1188484941"></a>
### setUserCmdValueFn

```ml
setUserCmdValueFn
```

Injected callback for set user cmd value; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L77)

<a id="field-field-mq3-vm-syscall-cgame-services-shared-shared-src-mq3-vm-syscall-cgame-ml-990282183"></a>
### shared

```ml
shared
```

Shared host service bundle used by the VM syscall adapters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L37)

<a id="field-field-mq3-vm-syscall-cgame-services-updatescreenfn-updatescreenfn-src-mq3-vm-syscall-cgame-ml-1173622343"></a>
### updateScreenFn

```ml
updateScreenFn
```

Injected callback for update screen; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L48)
