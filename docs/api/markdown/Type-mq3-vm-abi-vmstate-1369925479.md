# `mq3.vm.abi.VmState`

[Home](README.md) · [Source file](File-src-mq3-vm-abi-ml-1888366833.md)

<a id="struct-struct-mq3-vm-abi-vmstate-struct-vmstate-src-mq3-vm-abi-ml-861456681"></a>
## VmState

```ml
struct VmState
```

vm_s is pointer-heavy in C. The port keeps equivalent ownership and state fields as managed values while retaining the two assembler-visible offsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L148)

## Members

<a id="field-field-mq3-vm-abi-vmstate-breakcount-breakcount-src-mq3-vm-abi-ml-655817717"></a>
### breakCount

```ml
breakCount
```

Counter associated with VM debug-break handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L187)

<a id="field-field-mq3-vm-abi-vmstate-breakfunction-breakfunction-src-mq3-vm-abi-ml-1829634589"></a>
### breakFunction

```ml
breakFunction
```

VM function selected as the debugging breakpoint target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L185)

<a id="field-field-mq3-vm-abi-vmstate-calllevel-calllevel-src-mq3-vm-abi-ml-685436921"></a>
### callLevel

```ml
callLevel
```

Current nesting depth of calls into the VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L183)

<a id="field-field-mq3-vm-abi-vmstate-codebase-codebase-src-mq3-vm-abi-ml-85774025"></a>
### codeBase

```ml
codeBase
```

Base storage/address of the VM instruction region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L164)

<a id="field-field-mq3-vm-abi-vmstate-codelength-codelength-src-mq3-vm-abi-ml-747942651"></a>
### codeLength

```ml
codeLength
```

Length of the VM code region in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L166)

<a id="field-field-mq3-vm-abi-vmstate-compiled-compiled-src-mq3-vm-abi-ml-2107136759"></a>
### compiled

```ml
compiled
```

Nonzero when this VM has a prepared compiled execution path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L162)

<a id="field-field-mq3-vm-abi-vmstate-currentlyinterpreting-currentlyinterpreting-src-mq3-vm-abi-ml-436063857"></a>
### currentlyInterpreting

```ml
currentlyInterpreting
```

Nonzero while execution is inside the bytecode interpreter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L160)

<a id="field-field-mq3-vm-abi-vmstate-database-database-src-mq3-vm-abi-ml-1827339987"></a>
### dataBase

```ml
dataBase
```

Base storage/address of the VM data region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L173)

<a id="field-field-mq3-vm-abi-vmstate-datamask-datamask-src-mq3-vm-abi-ml-617460145"></a>
### dataMask

```ml
dataMask
```

Address mask applied to VM data offsets to preserve the QVM memory model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L175)

<a id="field-field-mq3-vm-abi-vmstate-dllhandle-dllhandle-src-mq3-vm-abi-ml-2137795145"></a>
### dllHandle

```ml
dllHandle
```

Handle for the loaded native game-module library, when native execution is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L156)

<a id="field-field-mq3-vm-abi-vmstate-entrypoint-entrypoint-src-mq3-vm-abi-ml-1412090157"></a>
### entryPoint

```ml
entryPoint
```

Callable entry point used to dispatch commands to the native game module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L158)

<a id="field-field-mq3-vm-abi-vmstate-fqpath-fqpath-src-mq3-vm-abi-ml-168700129"></a>
### fqpath

```ml
fqpath
```

Fully qualified path of the loaded native module or VM image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L189)

<a id="field-field-mq3-vm-abi-vmstate-instructionpointers-instructionpointers-src-mq3-vm-abi-ml-2008628825"></a>
### instructionPointers

```ml
instructionPointers
```

Lookup table mapping QVM instruction numbers to execution addresses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L168)

<a id="field-field-mq3-vm-abi-vmstate-instructionpointerslength-instructionpointerslength-src-mq3-vm-abi-ml-546684185"></a>
### instructionPointersLength

```ml
instructionPointersLength
```

Byte length of the allocated instruction-pointer table; the original engine reserves four bytes per QVM instruction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L171)

<a id="field-field-mq3-vm-abi-vmstate-name-name-src-mq3-vm-abi-ml-1671797951"></a>
### name

```ml
name
```

Name of the VM instance represented by this native ABI record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L154)

<a id="field-field-mq3-vm-abi-vmstate-numsymbols-numsymbols-src-mq3-vm-abi-ml-493871575"></a>
### numSymbols

```ml
numSymbols
```

Number of entries in the loaded VM debug-symbol table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L179)

<a id="field-field-mq3-vm-abi-vmstate-programstack-programstack-src-mq3-vm-abi-ml-1671776985"></a>
### programStack

```ml
programStack
```

Byte offset of the current stack frame in QVM data memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L150)

<a id="field-field-mq3-vm-abi-vmstate-stackbottom-stackbottom-src-mq3-vm-abi-ml-2100314209"></a>
### stackBottom

```ml
stackBottom
```

Lowest byte offset that the QVM program stack is allowed to reach.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L177)

<a id="field-field-mq3-vm-abi-vmstate-symbols-symbols-src-mq3-vm-abi-ml-1641124813"></a>
### symbols

```ml
symbols
```

Loaded VM debug symbols used for symbolic lookup, diagnostics, and profiling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L181)

<a id="field-field-mq3-vm-abi-vmstate-systemcall-systemcall-src-mq3-vm-abi-ml-586793459"></a>
### systemCall

```ml
systemCall
```

Host callback that services system calls made by the VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L152)
