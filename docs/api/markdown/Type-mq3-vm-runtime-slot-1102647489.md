# `mq3.vm.runtime.Slot`

[Home](README.md) · [Source file](File-src-mq3-vm-runtime-ml-288435087.md)

<a id="struct-struct-mq3-vm-runtime-slot-struct-slot-src-mq3-vm-runtime-ml-1617524635"></a>
## Slot

```ml
struct Slot
```

Slot record for vm.runtime, containing `name`, `image`, `machine`, `syscall`, `active`, `generation`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L31)

## Members

<a id="field-field-mq3-vm-runtime-slot-active-active-src-mq3-vm-runtime-ml-633979045"></a>
### active

```ml
active
```

Nonzero while the slot contains a live VM instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L41)

<a id="field-field-mq3-vm-runtime-slot-codelength-codelength-src-mq3-vm-runtime-ml-685465759"></a>
### codeLength

```ml
codeLength
```

Length of the VM code region in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L53)

<a id="field-field-mq3-vm-runtime-slot-compiled-compiled-src-mq3-vm-runtime-ml-843506107"></a>
### compiled

```ml
compiled
```

Nonzero when this VM has a prepared compiled execution path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L49)

<a id="field-field-mq3-vm-runtime-slot-compiledplan-compiledplan-src-mq3-vm-runtime-ml-641484569"></a>
### compiledPlan

```ml
compiledPlan
```

Validated compiled execution plan retained for subsequent VM calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L57)

<a id="field-field-mq3-vm-runtime-slot-generation-generation-src-mq3-vm-runtime-ml-69316449"></a>
### generation

```ml
generation
```

Generation counter used to distinguish the current instance from an older reused instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L43)

<a id="field-field-mq3-vm-runtime-slot-image-image-src-mq3-vm-runtime-ml-441424241"></a>
### image

```ml
image
```

Loaded QVM image associated with this slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L35)

<a id="field-field-mq3-vm-runtime-slot-machine-machine-src-mq3-vm-runtime-ml-1987485053"></a>
### machine

```ml
machine
```

Interpreter instance associated with the loaded bytecode image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L37)

<a id="field-field-mq3-vm-runtime-slot-name-name-src-mq3-vm-runtime-ml-322053395"></a>
### name

```ml
name
```

Name identifying the game, client-game, or UI VM slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L33)

<a id="field-field-mq3-vm-runtime-slot-native-native-src-mq3-vm-runtime-ml-1137427255"></a>
### native

```ml
native
```

Nonzero when the slot executes a native module rather than bytecode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L51)

<a id="field-field-mq3-vm-runtime-slot-numsymbols-numsymbols-src-mq3-vm-runtime-ml-1893303115"></a>
### numSymbols

```ml
numSymbols
```

Number of entries in the loaded VM debug-symbol table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L47)

<a id="field-field-mq3-vm-runtime-slot-symbols-symbols-src-mq3-vm-runtime-ml-1811747077"></a>
### symbols

```ml
symbols
```

Loaded VM debug symbols used for symbolic lookup, diagnostics, and profiling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L45)

<a id="field-field-mq3-vm-runtime-slot-syscall-syscall-src-mq3-vm-runtime-ml-646542697"></a>
### syscall

```ml
syscall
```

Callback used to dispatch a QVM system call to its host implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L39)

<a id="field-field-mq3-vm-runtime-slot-tablelength-tablelength-src-mq3-vm-runtime-ml-656858493"></a>
### tableLength

```ml
tableLength
```

Byte length of the instruction-address table, calculated as four bytes per entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L55)
