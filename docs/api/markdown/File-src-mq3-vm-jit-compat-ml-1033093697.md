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

Append bytes in vm.jit_compat; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `len(left)` and `(len(left) > 0)`. |
| `right` | `dynamic` | — | Right used in `len(right)` and `(len(right) > 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L43)

<a id="function-function-mq3-vm-jit-compat-asmcall-function-asmcall-compiled-args-src-mq3-vm-jit-compat-ml-1561794650"></a>
### AsmCall

```ml
function AsmCall(compiled, args)
```

Return `mq3.vm.jit_compat.VM_CallCompiled(compiled, args)` from `vm.jit_compat.AsmCall`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — | Compiled passed as `compiled` to `mq3.vm.jit_compat.VM_CallCompiled`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.vm.jit_compat.VM_CallCompiled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L212)

<a id="function-function-mq3-vm-jit-compat-callasmcall-function-callasmcall-compiled-args-src-mq3-vm-jit-compat-ml-1274961410"></a>
### callAsmCall

```ml
function callAsmCall(compiled, args)
```

Return `mq3.vm.jit_compat.VM_CallCompiled(compiled, args)` from `vm.jit_compat.callAsmCall`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — | Compiled passed as `compiled` to `mq3.vm.jit_compat.VM_CallCompiled`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.vm.jit_compat.VM_CallCompiled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L208)

- [mq3.vm.jit_compat.Compiled](Type-mq3-vm-jit-compat-compiled-2079298270.md) — struct
<a id="function-function-mq3-vm-jit-compat-constant1-function-constant1-machine-instruction-src-mq3-vm-jit-compat-ml-960505147"></a>
### Constant1

```ml
function Constant1(machine, instruction)
```

Compute constant 1 in vm.jit_compat; the normal completion returns `(machine.code[at] & 255)`.

Validation failures include `JIT instruction is invalid`; `JIT constant is outside code`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machine` | `dynamic` | — | Record exposing `addresses`, `code`. |
| `instruction` | `dynamic` | — | Zero-based index into `machine.addresses`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L92)

<a id="function-function-mq3-vm-jit-compat-constant4-function-constant4-machine-instruction-src-mq3-vm-jit-compat-ml-1966959877"></a>
### Constant4

```ml
function Constant4(machine, instruction)
```

Compute constant 4 in vm.jit_compat; the normal completion returns `n.i32(machine.code[at])`.

Validation failures include `JIT instruction is invalid`; `JIT constant is outside code`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machine` | `dynamic` | — | Record exposing `addresses`, `code`. |
| `instruction` | `dynamic` | — | Zero-based index into `machine.addresses`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L103)

<a id="function-function-mq3-vm-jit-compat-emit1-function-emit1-output-value-src-mq3-vm-jit-compat-ml-1228832342"></a>
### Emit1

```ml
function Emit1(output, value)
```

Return `mq3.vm.jit_compat.appendBytes(output, bytes([(value & 255)]))` from `vm.jit_compat.Emit1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Left passed as `left` to `mq3.vm.jit_compat.appendBytes`. |
| `value` | `dynamic` | — | Value used in `(value & 255)` and `bytes([(value & 255)])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L52)

<a id="function-function-mq3-vm-jit-compat-emit2-function-emit2-output-value-src-mq3-vm-jit-compat-ml-515668496"></a>
### Emit2

```ml
function Emit2(output, value)
```

Emit 2 in vm.jit_compat; the normal completion returns `Emit1(result, (value >> 8))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.vm.jit_compat.Emit1`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.jit_compat.Emit1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L56)

<a id="function-function-mq3-vm-jit-compat-emit4-function-emit4-output-value-src-mq3-vm-jit-compat-ml-1907684692"></a>
### Emit4

```ml
function Emit4(output, value)
```

Emit 4 in vm.jit_compat; the normal completion returns `Emit2(result, (value >> 16))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.vm.jit_compat.Emit2`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.jit_compat.Emit2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L60)

<a id="function-function-mq3-vm-jit-compat-emitaddedi4-function-emitaddedi4-output-src-mq3-vm-jit-compat-ml-2122976811"></a>
### EmitAddEDI4

```ml
function EmitAddEDI4(output)
```

Return `mq3.vm.jit_compat.EmitString(output, "83 C7 04")` from `vm.jit_compat.EmitAddEDI4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.vm.jit_compat.EmitString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L118)

<a id="function-function-mq3-vm-jit-compat-emitcommand-function-emitcommand-output-command-src-mq3-vm-jit-compat-ml-979081334"></a>
### EmitCommand

```ml
function EmitCommand(output, command)
```

Emit command in vm.jit_compat; the normal completion returns `error(7975, "JIT command is invalid")`.

Validation failures include `JIT command is invalid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.vm.jit_compat.EmitMovEAXEDI`. |
| `command` | `dynamic` | — | Command used in `(command == 1)` and `(command == 2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L124)

<a id="function-function-mq3-vm-jit-compat-emitmoveaxedi-function-emitmoveaxedi-output-src-mq3-vm-jit-compat-ml-359953389"></a>
### EmitMovEAXEDI

```ml
function EmitMovEAXEDI(output)
```

Original x86 peephole entry points. These produce their exact byte forms.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.vm.jit_compat.EmitString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L112)

<a id="function-function-mq3-vm-jit-compat-emitmovebxedi-function-emitmovebxedi-output-src-mq3-vm-jit-compat-ml-244448235"></a>
### EmitMovEBXEDI

```ml
function EmitMovEBXEDI(output)
```

Return `mq3.vm.jit_compat.EmitString(output, "89 1F")` from `vm.jit_compat.EmitMovEBXEDI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.vm.jit_compat.EmitString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L115)

<a id="function-function-mq3-vm-jit-compat-emitstring-function-emitstring-output-text-src-mq3-vm-jit-compat-ml-1833155276"></a>
### EmitString

```ml
function EmitString(output, text)
```

Emit string in vm.jit_compat; the normal completion returns `result`.

Validation failures include `JIT hex string has an odd digit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Output operand used by `EmitString`; its reads are shown in the implementation. |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L66)

<a id="function-function-mq3-vm-jit-compat-fltop-function-fltop-value-src-mq3-vm-jit-compat-ml-1783165767"></a>
### fltop

```ml
function fltop(value)
```

Return `mq3.compat.numeric.bitsFloat(value)` from `vm.jit_compat.fltop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Low 32 bits containing an IEEE-754 binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L165)

<a id="function-function-mq3-vm-jit-compat-fltopandsecond-function-fltopandsecond-top-second-src-mq3-vm-jit-compat-ml-331258699"></a>
### fltopandsecond

```ml
function fltopandsecond(top, second)
```

Compute vm.jit_compat.fltopandsecond as `[n.bitsFloat(top), n.bitsFloat(second)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `top` | `dynamic` | — | Low 32 bits containing an IEEE-754 binary32 encoding. |
| `second` | `dynamic` | — | Low 32 bits containing an IEEE-754 binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L169)

<a id="function-function-mq3-vm-jit-compat-hex-function-hex-letter-src-mq3-vm-jit-compat-ml-1971413600"></a>
### Hex

```ml
function Hex(letter)
```

Compute hex in vm.jit_compat; the normal completion returns `error(7975, "JIT hex digit is invalid")`.

Validation failures include `JIT hex digit is invalid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `letter` | `dynamic` | — | Letter used in `(letter - 48)` and `(letter - 55)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L80)

<a id="function-function-mq3-vm-jit-compat-inst-function-inst-opcode-destreg-areg-breg-src-mq3-vm-jit-compat-ml-1537588507"></a>
### Inst

```ml
function Inst(opcode, destReg, aReg, bReg)
```

PowerPC instruction constructors preserve the original bit layouts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — | Opcode used in `(opcode \| (destReg << 21))` and `((opcode \| (destReg << 21)) \| (aReg << 16))`. |
| `destReg` | `dynamic` | — | Dest reg used in `(destReg << 21)` and `(opcode \| (destReg << 21))`. |
| `aReg` | `dynamic` | — | A reg used in `(aReg << 16)` and `((opcode \| (destReg << 21)) \| (aReg << 16))`. |
| `bReg` | `dynamic` | — | B reg used in `(bReg << 11)` and `(((opcode \| (destReg << 21)) \| (aReg << 16)) \| (bReg << 11))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L136)

<a id="function-function-mq3-vm-jit-compat-inst4-function-inst4-opcode-destreg-areg-breg-flags-src-mq3-vm-jit-compat-ml-538623868"></a>
### Inst4

```ml
function Inst4(opcode, destReg, aReg, bReg, flags)
```

Return `mq3.compat.numeric.i32((Inst(opcode, destReg, aReg, bReg) | flags))` from `vm.jit_compat.Inst4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — | Opcode passed as `opcode` to `mq3.vm.jit_compat.Inst`. |
| `destReg` | `dynamic` | — | Dest reg passed as `destReg` to `mq3.vm.jit_compat.Inst`. |
| `aReg` | `dynamic` | — | A reg passed as `aReg` to `mq3.vm.jit_compat.Inst`. |
| `bReg` | `dynamic` | — | B reg passed as `bReg` to `mq3.vm.jit_compat.Inst`. |
| `flags` | `dynamic` | — | Flags used in `(Inst(opcode, destReg, aReg, bReg) \| flags)` and `n.i32((Inst(opcode, destReg, aReg, bReg) \| flags))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L143)

<a id="function-function-mq3-vm-jit-compat-instimm-function-instimm-opcode-destreg-areg-immediate-src-mq3-vm-jit-compat-ml-205189556"></a>
### InstImm

```ml
function InstImm(opcode, destReg, aReg, immediate)
```

Return `mq3.compat.numeric.i32((((opcode | (destReg << 21)) | (aReg << 16)) | (immediate & 65535)))` from `vm.jit_compat.InstImm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — | Opcode used in `(opcode \| (destReg << 21))` and `((opcode \| (destReg << 21)) \| (aReg << 16))`. |
| `destReg` | `dynamic` | — | Dest reg used in `(destReg << 21)` and `(opcode \| (destReg << 21))`. |
| `aReg` | `dynamic` | — | A reg used in `(aReg << 16)` and `((opcode \| (destReg << 21)) \| (aReg << 16))`. |
| `immediate` | `dynamic` | — | Immediate used in `(immediate & 65535)` and `(((opcode \| (destReg << 21)) \| (aReg << 16)) \| (immediate & 65535))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L149)

<a id="function-function-mq3-vm-jit-compat-instimmu-function-instimmu-opcode-destreg-areg-immediate-src-mq3-vm-jit-compat-ml-366942554"></a>
### InstImmU

```ml
function InstImmU(opcode, destReg, aReg, immediate)
```

Return `mq3.vm.jit_compat.InstImm(opcode, destReg, aReg, immediate)` from `vm.jit_compat.InstImmU`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opcode` | `dynamic` | — | Opcode passed as `opcode` to `mq3.vm.jit_compat.InstImm`. |
| `destReg` | `dynamic` | — | Dest reg passed as `destReg` to `mq3.vm.jit_compat.InstImm`. |
| `aReg` | `dynamic` | — | A reg passed as `aReg` to `mq3.vm.jit_compat.InstImm`. |
| `immediate` | `dynamic` | — | Immediate passed as `immediate` to `mq3.vm.jit_compat.InstImm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L155)

<a id="function-function-mq3-vm-jit-compat-loadopstack-function-loadopstack-values-src-mq3-vm-jit-compat-ml-1513942286"></a>
### loadOpStack

```ml
function loadOpStack(values)
```

Compute vm.jit_compat.loadOpStack as `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L172)

<a id="function-function-mq3-vm-jit-compat-ltop-function-ltop-value-src-mq3-vm-jit-compat-ml-1218419321"></a>
### ltop

```ml
function ltop(value)
```

Compute vm.jit_compat.ltop as `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L158)

<a id="function-function-mq3-vm-jit-compat-ltopandsecond-function-ltopandsecond-top-second-src-mq3-vm-jit-compat-ml-537243203"></a>
### ltopandsecond

```ml
function ltopandsecond(top, second)
```

Compute vm.jit_compat.ltopandsecond as `[top, second]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `top` | `dynamic` | — | Top operand used by `ltopandsecond`; its reads are shown in the implementation. |
| `second` | `dynamic` | — | Second operand used by `ltopandsecond`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L162)

<a id="function-function-mq3-vm-jit-compat-makefloat-function-makefloat-value-src-mq3-vm-jit-compat-ml-1564224745"></a>
### makeFloat

```ml
function makeFloat(value)
```

Return `mq3.compat.numeric.bitsFloat(value)` from `vm.jit_compat.makeFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Low 32 bits containing an IEEE-754 binary32 encoding. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L178)

<a id="function-function-mq3-vm-jit-compat-makeinteger-function-makeinteger-value-src-mq3-vm-jit-compat-ml-817872025"></a>
### makeInteger

```ml
function makeInteger(value)
```

Return `mq3.compat.numeric.i32(value)` from `vm.jit_compat.makeInteger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L181)

<a id="function-function-mq3-vm-jit-compat-ppcnewsymbols-function-ppcnewsymbols-src-mq3-vm-jit-compat-ml-1176208526"></a>
### ppcNewSymbols

```ml
function ppcNewSymbols()
```

List the 18 names in vm.jit_compat.ppcNewSymbols, beginning with `AsmCall`, `Constant1`, `Constant4`, `Emit4`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L38)

<a id="function-function-mq3-vm-jit-compat-ppcsymbols-function-ppcsymbols-src-mq3-vm-jit-compat-ml-196747434"></a>
### ppcSymbols

```ml
function ppcSymbols()
```

List the 14 names in vm.jit_compat.ppcSymbols, beginning with `AsmCall`, `Constant1`, `Constant4`, `Emit4`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L36)

<a id="function-function-mq3-vm-jit-compat-spillopstack-function-spillopstack-values-src-mq3-vm-jit-compat-ml-506768308"></a>
### spillOpStack

```ml
function spillOpStack(values)
```

Compute vm.jit_compat.spillOpStack as `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L175)

<a id="function-function-mq3-vm-jit-compat-vm-callcompiled-function-vm-callcompiled-compiled-args-src-mq3-vm-jit-compat-ml-663988186"></a>
### VM_CallCompiled

```ml
function VM_CallCompiled(compiled, args)
```

Compute call compiled in vm.jit_compat; the normal completion returns `interpreter.callFast(compiled.machine, args)`.

Validation failures include `compiled QVM is missing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — | Record exposing `machine`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.vm.interpreter.callFast`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L201)

<a id="function-function-mq3-vm-jit-compat-vm-compile-function-vm-compile-image-callback-architecture-src-mq3-vm-jit-compat-ml-152917345"></a>
### VM_Compile

```ml
function VM_Compile(image, callback, architecture)
```

Compute compile in vm.jit_compat; the normal completion returns `Compiled(machine, architecture, pointers, len(machine.code), (len(pointers) * 4), false)`.

Validation failures include `unsupported JIT architecture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Image passed as `image` to `mq3.vm.interpreter.load`. |
| `callback` | `dynamic` | — | Callback passed as `callback` to `mq3.vm.interpreter.load`. |
| `architecture` | `dynamic` | — | Initial `architecture` field stored in the returned or constructed `mq3.vm.jit_compat.Compiled` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L189)

<a id="function-function-mq3-vm-jit-compat-x86symbols-function-x86symbols-src-mq3-vm-jit-compat-ml-738593150"></a>
### x86Symbols

```ml
function x86Symbols()
```

List the 15 names in vm.jit_compat.x86Symbols, beginning with `AsmCall`, `Constant1`, `Constant4`, `Emit1`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L34)
