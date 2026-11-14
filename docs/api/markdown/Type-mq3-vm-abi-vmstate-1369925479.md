# `mq3.vm.abi.VmState`

[Home](README.md) · [Source file](File-src-mq3-vm-abi-ml-1888366833.md)

<a id="struct-struct-mq3-vm-abi-vmstate-struct-vmstate-src-mq3-vm-abi-ml-861456681"></a>
## VmState

```ml
struct VmState
```

vm_s is pointer-heavy in C. The port keeps equivalent ownership and state fields as managed values while retaining the two assembler-visible offsets.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

## Members

<a id="field-field-mq3-vm-abi-vmstate-breakcount-breakcount-src-mq3-vm-abi-ml-655817717"></a>
### breakCount

```ml
breakCount
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-breakfunction-breakfunction-src-mq3-vm-abi-ml-1829634589"></a>
### breakFunction

```ml
breakFunction
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-calllevel-calllevel-src-mq3-vm-abi-ml-685436921"></a>
### callLevel

```ml
callLevel
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-codebase-codebase-src-mq3-vm-abi-ml-85774025"></a>
### codeBase

```ml
codeBase
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-codelength-codelength-src-mq3-vm-abi-ml-747942651"></a>
### codeLength

```ml
codeLength
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-compiled-compiled-src-mq3-vm-abi-ml-2107136759"></a>
### compiled

```ml
compiled
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-currentlyinterpreting-currentlyinterpreting-src-mq3-vm-abi-ml-436063857"></a>
### currentlyInterpreting

```ml
currentlyInterpreting
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-database-database-src-mq3-vm-abi-ml-1827339987"></a>
### dataBase

```ml
dataBase
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-datamask-datamask-src-mq3-vm-abi-ml-617460145"></a>
### dataMask

```ml
dataMask
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-dllhandle-dllhandle-src-mq3-vm-abi-ml-2137795145"></a>
### dllHandle

```ml
dllHandle
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-entrypoint-entrypoint-src-mq3-vm-abi-ml-1412090157"></a>
### entryPoint

```ml
entryPoint
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-fqpath-fqpath-src-mq3-vm-abi-ml-168700129"></a>
### fqpath

```ml
fqpath
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-instructionpointers-instructionpointers-src-mq3-vm-abi-ml-2008628825"></a>
### instructionPointers

```ml
instructionPointers
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-instructionpointerslength-instructionpointerslength-src-mq3-vm-abi-ml-546684185"></a>
### instructionPointersLength

```ml
instructionPointersLength
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-name-name-src-mq3-vm-abi-ml-1671797951"></a>
### name

```ml
name
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-numsymbols-numsymbols-src-mq3-vm-abi-ml-493871575"></a>
### numSymbols

```ml
numSymbols
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-programstack-programstack-src-mq3-vm-abi-ml-1671776985"></a>
### programStack

```ml
programStack
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-stackbottom-stackbottom-src-mq3-vm-abi-ml-2100314209"></a>
### stackBottom

```ml
stackBottom
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-symbols-symbols-src-mq3-vm-abi-ml-1641124813"></a>
### symbols

```ml
symbols
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)

<a id="field-field-mq3-vm-abi-vmstate-systemcall-systemcall-src-mq3-vm-abi-ml-586793459"></a>
### systemCall

```ml
systemCall
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/abi.ml#L75)
