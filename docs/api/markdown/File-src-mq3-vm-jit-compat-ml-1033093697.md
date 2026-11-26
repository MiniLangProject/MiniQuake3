# `src/mq3/vm/jit_compat.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.jit_compat`](Package-mq3-vm-jit-compat-1688698905.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/interpreter.ml` as `interpreter` → [src/mq3/vm/interpreter.ml](File-src-mq3-vm-interpreter-ml-500037689.md)

## Declarations

<a id="function-function-mq3-vm-jit-compat-appendbytes-function-appendbytes-left-right-src-mq3-vm-jit-compat-ml-1405864755"></a>
### appendBytes

```ml
function appendBytes(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L22)

<a id="function-function-mq3-vm-jit-compat-asmcall-function-asmcall-compiled-args-src-mq3-vm-jit-compat-ml-1561794650"></a>
### AsmCall

```ml
function AsmCall(compiled, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L98)

<a id="function-function-mq3-vm-jit-compat-callasmcall-function-callasmcall-compiled-args-src-mq3-vm-jit-compat-ml-1274961410"></a>
### callAsmCall

```ml
function callAsmCall(compiled, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L97)

- [mq3.vm.jit_compat.Compiled](Type-mq3-vm-jit-compat-compiled-2079298270.md) — struct
<a id="function-function-mq3-vm-jit-compat-constant1-function-constant1-machine-instruction-src-mq3-vm-jit-compat-ml-960505147"></a>
### Constant1

```ml
function Constant1(machine, instruction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machine` | `dynamic` | — |  |
| `instruction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L48)

<a id="function-function-mq3-vm-jit-compat-constant4-function-constant4-machine-instruction-src-mq3-vm-jit-compat-ml-1966959877"></a>
### Constant4

```ml
function Constant4(machine, instruction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machine` | `dynamic` | — |  |
| `instruction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L54)

<a id="function-function-mq3-vm-jit-compat-emit1-function-emit1-output-value-src-mq3-vm-jit-compat-ml-1228832342"></a>
### Emit1

```ml
function Emit1(output, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L28)

<a id="function-function-mq3-vm-jit-compat-emit2-function-emit2-output-value-src-mq3-vm-jit-compat-ml-515668496"></a>
### Emit2

```ml
function Emit2(output, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L29)

<a id="function-function-mq3-vm-jit-compat-emit4-function-emit4-output-value-src-mq3-vm-jit-compat-ml-1907684692"></a>
### Emit4

```ml
function Emit4(output, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L30)

<a id="function-function-mq3-vm-jit-compat-emitaddedi4-function-emitaddedi4-output-src-mq3-vm-jit-compat-ml-2122976811"></a>
### EmitAddEDI4

```ml
function EmitAddEDI4(output)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L64)

<a id="function-function-mq3-vm-jit-compat-emitcommand-function-emitcommand-output-command-src-mq3-vm-jit-compat-ml-979081334"></a>
### EmitCommand

```ml
function EmitCommand(output, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L65)

<a id="function-function-mq3-vm-jit-compat-emitmoveaxedi-function-emitmoveaxedi-output-src-mq3-vm-jit-compat-ml-359953389"></a>
### EmitMovEAXEDI

```ml
function EmitMovEAXEDI(output)
```

Original x86 peephole entry points. These produce their exact byte forms.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L62)

<a id="function-function-mq3-vm-jit-compat-emitmovebxedi-function-emitmovebxedi-output-src-mq3-vm-jit-compat-ml-244448235"></a>
### EmitMovEBXEDI

```ml
function EmitMovEBXEDI(output)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L63)

<a id="function-function-mq3-vm-jit-compat-emitstring-function-emitstring-output-text-src-mq3-vm-jit-compat-ml-1833155276"></a>
### EmitString

```ml
function EmitString(output, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L31)

<a id="function-function-mq3-vm-jit-compat-fltop-function-fltop-value-src-mq3-vm-jit-compat-ml-1783165767"></a>
### fltop

```ml
function fltop(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L79)

<a id="function-function-mq3-vm-jit-compat-fltopandsecond-function-fltopandsecond-top-second-src-mq3-vm-jit-compat-ml-331258699"></a>
### fltopandsecond

```ml
function fltopandsecond(top, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `top` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L80)

<a id="function-function-mq3-vm-jit-compat-hex-function-hex-letter-src-mq3-vm-jit-compat-ml-1971413600"></a>
### Hex

```ml
function Hex(letter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `letter` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L41)

<a id="function-function-mq3-vm-jit-compat-inst-function-inst-opcode-destreg-areg-breg-src-mq3-vm-jit-compat-ml-1537588507"></a>
### Inst

```ml
function Inst(opcode, destReg, aReg, bReg)
```

PowerPC instruction constructors preserve the original bit layouts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — |  |
| `destReg` | `dynamic` | — |  |
| `aReg` | `dynamic` | — |  |
| `bReg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L73)

<a id="function-function-mq3-vm-jit-compat-inst4-function-inst4-opcode-destreg-areg-breg-flags-src-mq3-vm-jit-compat-ml-538623868"></a>
### Inst4

```ml
function Inst4(opcode, destReg, aReg, bReg, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — |  |
| `destReg` | `dynamic` | — |  |
| `aReg` | `dynamic` | — |  |
| `bReg` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L74)

<a id="function-function-mq3-vm-jit-compat-instimm-function-instimm-opcode-destreg-areg-immediate-src-mq3-vm-jit-compat-ml-205189556"></a>
### InstImm

```ml
function InstImm(opcode, destReg, aReg, immediate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — |  |
| `destReg` | `dynamic` | — |  |
| `aReg` | `dynamic` | — |  |
| `immediate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L75)

<a id="function-function-mq3-vm-jit-compat-instimmu-function-instimmu-opcode-destreg-areg-immediate-src-mq3-vm-jit-compat-ml-366942554"></a>
### InstImmU

```ml
function InstImmU(opcode, destReg, aReg, immediate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — |  |
| `destReg` | `dynamic` | — |  |
| `aReg` | `dynamic` | — |  |
| `immediate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L76)

<a id="function-function-mq3-vm-jit-compat-loadopstack-function-loadopstack-values-src-mq3-vm-jit-compat-ml-1513942286"></a>
### loadOpStack

```ml
function loadOpStack(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L81)

<a id="function-function-mq3-vm-jit-compat-ltop-function-ltop-value-src-mq3-vm-jit-compat-ml-1218419321"></a>
### ltop

```ml
function ltop(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L77)

<a id="function-function-mq3-vm-jit-compat-ltopandsecond-function-ltopandsecond-top-second-src-mq3-vm-jit-compat-ml-537243203"></a>
### ltopandsecond

```ml
function ltopandsecond(top, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `top` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L78)

<a id="function-function-mq3-vm-jit-compat-makefloat-function-makefloat-value-src-mq3-vm-jit-compat-ml-1564224745"></a>
### makeFloat

```ml
function makeFloat(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L83)

<a id="function-function-mq3-vm-jit-compat-makeinteger-function-makeinteger-value-src-mq3-vm-jit-compat-ml-817872025"></a>
### makeInteger

```ml
function makeInteger(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L84)

<a id="function-function-mq3-vm-jit-compat-ppcnewsymbols-function-ppcnewsymbols-src-mq3-vm-jit-compat-ml-1176208526"></a>
### ppcNewSymbols

```ml
function ppcNewSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L20)

<a id="function-function-mq3-vm-jit-compat-ppcsymbols-function-ppcsymbols-src-mq3-vm-jit-compat-ml-196747434"></a>
### ppcSymbols

```ml
function ppcSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L19)

<a id="function-function-mq3-vm-jit-compat-spillopstack-function-spillopstack-values-src-mq3-vm-jit-compat-ml-506768308"></a>
### spillOpStack

```ml
function spillOpStack(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L82)

<a id="function-function-mq3-vm-jit-compat-vm-callcompiled-function-vm-callcompiled-compiled-args-src-mq3-vm-jit-compat-ml-663988186"></a>
### VM_CallCompiled

```ml
function VM_CallCompiled(compiled, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L93)

<a id="function-function-mq3-vm-jit-compat-vm-compile-function-vm-compile-image-callback-architecture-src-mq3-vm-jit-compat-ml-152917345"></a>
### VM_Compile

```ml
function VM_Compile(image, callback, architecture)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `architecture` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L86)

<a id="function-function-mq3-vm-jit-compat-x86symbols-function-x86symbols-src-mq3-vm-jit-compat-ml-738593150"></a>
### x86Symbols

```ml
function x86Symbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/jit_compat.ml#L18)
