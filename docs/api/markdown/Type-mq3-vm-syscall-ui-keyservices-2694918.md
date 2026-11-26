# `mq3.vm.syscall_ui.KeyServices`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-ml-839264043.md)

<a id="struct-struct-mq3-vm-syscall-ui-keyservices-struct-keyservices-src-mq3-vm-syscall-ui-ml-325302979"></a>
## KeyServices

```ml
struct KeyServices
```

KeyServices record for vm.syscall_ui, containing `keyNameFn`, `bindingFn`, `setBindingFn`, `isDownFn`, `getOverstrikeFn`, `setOverstrikeFn`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L26)

## Members

<a id="field-field-mq3-vm-syscall-ui-keyservices-bindingfn-bindingfn-src-mq3-vm-syscall-ui-ml-817461132"></a>
### bindingFn

```ml
bindingFn
```

Injected callback for binding; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L30)

<a id="field-field-mq3-vm-syscall-ui-keyservices-clearfn-clearfn-src-mq3-vm-syscall-ui-ml-721773624"></a>
### clearFn

```ml
clearFn
```

Injected callback for clear; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L40)

<a id="field-field-mq3-vm-syscall-ui-keyservices-getcatcherfn-getcatcherfn-src-mq3-vm-syscall-ui-ml-1986004352"></a>
### getCatcherFn

```ml
getCatcherFn
```

Injected callback for get catcher; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L42)

<a id="field-field-mq3-vm-syscall-ui-keyservices-getoverstrikefn-getoverstrikefn-src-mq3-vm-syscall-ui-ml-560195432"></a>
### getOverstrikeFn

```ml
getOverstrikeFn
```

Injected callback for get overstrike; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L36)

<a id="field-field-mq3-vm-syscall-ui-keyservices-isdownfn-isdownfn-src-mq3-vm-syscall-ui-ml-1363116232"></a>
### isDownFn

```ml
isDownFn
```

Injected callback for is down; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L34)

<a id="field-field-mq3-vm-syscall-ui-keyservices-keynamefn-keynamefn-src-mq3-vm-syscall-ui-ml-521413924"></a>
### keyNameFn

```ml
keyNameFn
```

Injected callback for key name; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L28)

<a id="field-field-mq3-vm-syscall-ui-keyservices-setbindingfn-setbindingfn-src-mq3-vm-syscall-ui-ml-1366495490"></a>
### setBindingFn

```ml
setBindingFn
```

Injected callback for set binding; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L32)

<a id="field-field-mq3-vm-syscall-ui-keyservices-setcatcherfn-setcatcherfn-src-mq3-vm-syscall-ui-ml-1189286376"></a>
### setCatcherFn

```ml
setCatcherFn
```

Injected callback for set catcher; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L44)

<a id="field-field-mq3-vm-syscall-ui-keyservices-setoverstrikefn-setoverstrikefn-src-mq3-vm-syscall-ui-ml-2017445816"></a>
### setOverstrikeFn

```ml
setOverstrikeFn
```

Injected callback for set overstrike; invoked through the KeyServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L38)
