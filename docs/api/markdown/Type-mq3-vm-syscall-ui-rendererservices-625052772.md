# `mq3.vm.syscall_ui.RendererServices`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-ml-839264043.md)

<a id="struct-struct-mq3-vm-syscall-ui-rendererservices-struct-rendererservices-src-mq3-vm-syscall-ui-ml-1775704987"></a>
## RendererServices

```ml
struct RendererServices
```

RendererServices record for vm.syscall_ui, containing `registerModelFn`, `registerSkinFn`, `registerShaderNoMipFn`, `clearSceneFn`, `setColorFn`, `drawStretchPicFn`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L47)

## Members

<a id="field-field-mq3-vm-syscall-ui-rendererservices-clearscenefn-clearscenefn-src-mq3-vm-syscall-ui-ml-1698656464"></a>
### clearSceneFn

```ml
clearSceneFn
```

Injected callback for clear scene; invoked through the RendererServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L56)

<a id="field-field-mq3-vm-syscall-ui-rendererservices-drawstretchpicfn-drawstretchpicfn-src-mq3-vm-syscall-ui-ml-608110468"></a>
### drawStretchPicFn

```ml
drawStretchPicFn
```

Injected callback for draw stretch pic; invoked through the RendererServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L60)

<a id="field-field-mq3-vm-syscall-ui-rendererservices-registermodelfn-registermodelfn-src-mq3-vm-syscall-ui-ml-1270419894"></a>
### registerModelFn

```ml
registerModelFn
```

Injected callback for register model; invoked through the RendererServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L49)

<a id="field-field-mq3-vm-syscall-ui-rendererservices-registershadernomipfn-registershadernomipfn-src-mq3-vm-syscall-ui-ml-577461466"></a>
### registerShaderNoMipFn

```ml
registerShaderNoMipFn
```

Injected callback for register shader no mip; invoked through the RendererServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L54)

<a id="field-field-mq3-vm-syscall-ui-rendererservices-registerskinfn-registerskinfn-src-mq3-vm-syscall-ui-ml-1750860182"></a>
### registerSkinFn

```ml
registerSkinFn
```

Injected callback for register skin; invoked through the RendererServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L51)

<a id="field-field-mq3-vm-syscall-ui-rendererservices-setcolorfn-setcolorfn-src-mq3-vm-syscall-ui-ml-708568780"></a>
### setColorFn

```ml
setColorFn
```

Injected callback for set color; invoked through the RendererServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L58)

<a id="field-field-mq3-vm-syscall-ui-rendererservices-updatescreenfn-updatescreenfn-src-mq3-vm-syscall-ui-ml-1913436084"></a>
### updateScreenFn

```ml
updateScreenFn
```

Injected callback for update screen; invoked through the RendererServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L62)
