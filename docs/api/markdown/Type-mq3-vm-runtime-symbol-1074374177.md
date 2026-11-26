# `mq3.vm.runtime.Symbol`

[Home](README.md) · [Source file](File-src-mq3-vm-runtime-ml-288435087.md)

<a id="struct-struct-mq3-vm-runtime-symbol-struct-symbol-src-mq3-vm-runtime-ml-979200243"></a>
## Symbol

```ml
struct Symbol
```

Symbol record for vm.runtime, containing `value`, `name`, `profileCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L22)

## Members

<a id="field-field-mq3-vm-runtime-symbol-name-name-src-mq3-vm-runtime-ml-183354191"></a>
### name

```ml
name
```

Human-readable name of this VM debug symbol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L26)

<a id="field-field-mq3-vm-runtime-symbol-profilecount-profilecount-src-mq3-vm-runtime-ml-2062393133"></a>
### profileCount

```ml
profileCount
```

Execution/profile counter associated with this VM symbol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L28)

<a id="field-field-mq3-vm-runtime-symbol-value-value-src-mq3-vm-runtime-ml-1137782465"></a>
### value

```ml
value
```

Instruction/code address associated with this VM debug symbol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L24)
