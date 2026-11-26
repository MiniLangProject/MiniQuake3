# `mq3.vm.interpreter.VM`

[Home](README.md) · [Source file](File-src-mq3-vm-interpreter-ml-500037689.md)

<a id="struct-struct-mq3-vm-interpreter-vm-struct-vm-src-mq3-vm-interpreter-ml-1348551819"></a>
## VM

```ml
struct VM
```

Validated QVM image, decoded instruction metadata, mutable data memory, and execution counters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L10)

## Members

<a id="field-field-mq3-vm-interpreter-vm-addresses-addresses-src-mq3-vm-interpreter-ml-801924436"></a>
### addresses

```ml
addresses
```

Zero-based instruction-number table mapping each instruction to its code byte offset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L15)

<a id="field-field-mq3-vm-interpreter-vm-breaks-breaks-src-mq3-vm-interpreter-ml-1998597664"></a>
### breaks

```ml
breaks
```

Cumulative number of OP_BREAK instructions observed; OP_BREAK increments this counter and continues.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L39)

<a id="field-field-mq3-vm-interpreter-vm-code-code-src-mq3-vm-interpreter-ml-143015542"></a>
### code

```ml
code
```

Byte-offset-indexed decoded code array: opcodes, widened immediates, and branch targets rewritten from instruction numbers to code byte offsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L13)

<a id="field-field-mq3-vm-interpreter-vm-data-data-src-mq3-vm-interpreter-ml-1716965912"></a>
### data

```ml
data
```

Mutable VM data bytes containing initialized data, literals, BSS, and stack storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L23)

<a id="field-field-mq3-vm-interpreter-vm-limit-limit-src-mq3-vm-interpreter-ml-1013571640"></a>
### limit

```ml
limit
```

Maximum number of interpreter steps allowed for the current VM call.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L37)

<a id="field-field-mq3-vm-interpreter-vm-mask-mask-src-mq3-vm-interpreter-ml-1819227248"></a>
### mask

```ml
mask
```

Bit mask used to wrap/check VM data-memory offsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L25)

<a id="field-field-mq3-vm-interpreter-vm-nativeplan-nativeplan-src-mq3-vm-interpreter-ml-2127120852"></a>
### nativePlan

```ml
nativePlan
```

Prepared native-execution plan used when the interpreter delegates supported operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L41)

<a id="field-field-mq3-vm-interpreter-vm-needs-needs-src-mq3-vm-interpreter-ml-1639675252"></a>
### needs

```ml
needs
```

Minimum operand-stack depth required by each opcode, indexed by instruction byte offset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L21)

<a id="field-field-mq3-vm-interpreter-vm-programstack-programstack-src-mq3-vm-interpreter-ml-1506743132"></a>
### programStack

```ml
programStack
```

Byte offset of the current stack frame in QVM data memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L27)

<a id="field-field-mq3-vm-interpreter-vm-stackbottom-stackbottom-src-mq3-vm-interpreter-ml-1425734452"></a>
### stackBottom

```ml
stackBottom
```

Exclusive lower guard boundary of the QVM program stack; the stack pointer must remain above this byte offset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L30)

<a id="field-field-mq3-vm-interpreter-vm-starts-starts-src-mq3-vm-interpreter-ml-814450446"></a>
### starts

```ml
starts
```

Byte-offset-indexed markers identifying valid instruction starts in the QVM code region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L17)

<a id="field-field-mq3-vm-interpreter-vm-steps-steps-src-mq3-vm-interpreter-ml-239161944"></a>
### steps

```ml
steps
```

Cumulative execution-step counter across VM calls; each call measures its budget from its entry value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L35)

<a id="field-field-mq3-vm-interpreter-vm-syscall-syscall-src-mq3-vm-interpreter-ml-1284742452"></a>
### syscall

```ml
syscall
```

Optional trap callback `(vm, argumentBase)` returning a value convertible to signed int32. `argumentBase` is a VM byte offset; slot zero holds the trap number and later slots hold arguments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L33)

<a id="field-field-mq3-vm-interpreter-vm-widths-widths-src-mq3-vm-interpreter-ml-83715862"></a>
### widths

```ml
widths
```

Immediate-operand byte counts (0, 1, or 4), indexed by instruction byte offset; excludes the opcode byte.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L19)
