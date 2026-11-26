# `mq3.vm.syscall_ui.LanServices`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-ml-839264043.md)

<a id="struct-struct-mq3-vm-syscall-ui-lanservices-struct-lanservices-src-mq3-vm-syscall-ui-ml-1474610955"></a>
## LanServices

```ml
struct LanServices
```

LanServices record for vm.syscall_ui, containing `loadFn`, `saveFn`, `addFn`, `removeFn`, `pingQueueCountFn`, `clearPingFn`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L65)

## Members

<a id="field-field-mq3-vm-syscall-ui-lanservices-addfn-addfn-src-mq3-vm-syscall-ui-ml-199164648"></a>
### addFn

```ml
addFn
```

Injected callback for add; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L71)

<a id="field-field-mq3-vm-syscall-ui-lanservices-clearpingfn-clearpingfn-src-mq3-vm-syscall-ui-ml-1712463040"></a>
### clearPingFn

```ml
clearPingFn
```

Injected callback for clear ping; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L77)

<a id="field-field-mq3-vm-syscall-ui-lanservices-comparefn-comparefn-src-mq3-vm-syscall-ui-ml-170036912"></a>
### compareFn

```ml
compareFn
```

Injected callback for compare; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L101)

<a id="field-field-mq3-vm-syscall-ui-lanservices-getpingfn-getpingfn-src-mq3-vm-syscall-ui-ml-144821996"></a>
### getPingFn

```ml
getPingFn
```

Injected callback for get ping; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L79)

<a id="field-field-mq3-vm-syscall-ui-lanservices-getpinginfofn-getpinginfofn-src-mq3-vm-syscall-ui-ml-2127762256"></a>
### getPingInfoFn

```ml
getPingInfoFn
```

Injected callback for get ping info; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L81)

<a id="field-field-mq3-vm-syscall-ui-lanservices-isvisiblefn-isvisiblefn-src-mq3-vm-syscall-ui-ml-537893520"></a>
### isVisibleFn

```ml
isVisibleFn
```

Injected callback for is visible; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L93)

<a id="field-field-mq3-vm-syscall-ui-lanservices-loadfn-loadfn-src-mq3-vm-syscall-ui-ml-1273347976"></a>
### loadFn

```ml
loadFn
```

Injected callback for load; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L67)

<a id="field-field-mq3-vm-syscall-ui-lanservices-markvisiblefn-markvisiblefn-src-mq3-vm-syscall-ui-ml-897092692"></a>
### markVisibleFn

```ml
markVisibleFn
```

Injected callback for mark visible; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L91)

<a id="field-field-mq3-vm-syscall-ui-lanservices-pingqueuecountfn-pingqueuecountfn-src-mq3-vm-syscall-ui-ml-1979030624"></a>
### pingQueueCountFn

```ml
pingQueueCountFn
```

Injected callback for ping queue count; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L75)

<a id="field-field-mq3-vm-syscall-ui-lanservices-removefn-removefn-src-mq3-vm-syscall-ui-ml-1764783040"></a>
### removeFn

```ml
removeFn
```

Injected callback for remove; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L73)

<a id="field-field-mq3-vm-syscall-ui-lanservices-resetpingsfn-resetpingsfn-src-mq3-vm-syscall-ui-ml-1171772400"></a>
### resetPingsFn

```ml
resetPingsFn
```

Injected callback for reset pings; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L97)

<a id="field-field-mq3-vm-syscall-ui-lanservices-savefn-savefn-src-mq3-vm-syscall-ui-ml-222734518"></a>
### saveFn

```ml
saveFn
```

Injected callback for save; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L69)

<a id="field-field-mq3-vm-syscall-ui-lanservices-serveraddressfn-serveraddressfn-src-mq3-vm-syscall-ui-ml-1624090272"></a>
### serverAddressFn

```ml
serverAddressFn
```

Injected callback for server address; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L85)

<a id="field-field-mq3-vm-syscall-ui-lanservices-servercountfn-servercountfn-src-mq3-vm-syscall-ui-ml-1526235248"></a>
### serverCountFn

```ml
serverCountFn
```

Injected callback for server count; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L83)

<a id="field-field-mq3-vm-syscall-ui-lanservices-serverinfofn-serverinfofn-src-mq3-vm-syscall-ui-ml-1435850942"></a>
### serverInfoFn

```ml
serverInfoFn
```

Injected callback for server info; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L87)

<a id="field-field-mq3-vm-syscall-ui-lanservices-serverpingfn-serverpingfn-src-mq3-vm-syscall-ui-ml-1777555538"></a>
### serverPingFn

```ml
serverPingFn
```

Injected callback for server ping; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L89)

<a id="field-field-mq3-vm-syscall-ui-lanservices-serverstatusfn-serverstatusfn-src-mq3-vm-syscall-ui-ml-1011383898"></a>
### serverStatusFn

```ml
serverStatusFn
```

Injected callback for server status; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L99)

<a id="field-field-mq3-vm-syscall-ui-lanservices-updatepingsfn-updatepingsfn-src-mq3-vm-syscall-ui-ml-952556840"></a>
### updatePingsFn

```ml
updatePingsFn
```

Injected callback for update pings; invoked through the LanServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L95)
