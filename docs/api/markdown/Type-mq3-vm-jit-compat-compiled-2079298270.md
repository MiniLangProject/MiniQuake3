# `mq3.vm.jit_compat.Compiled`

[Home](README.md) · [Source file](File-src-mq3-vm-jit-compat-ml-1033093697.md)

<a id="struct-struct-mq3-vm-jit-compat-compiled-struct-compiled-src-mq3-vm-jit-compat-ml-412786871"></a>
## Compiled

```ml
struct Compiled
```

Compiled record for vm.jit_compat, containing `machine`, `architecture`, `instructionPointers`, `codeLength`, `tableLength`, `nativeCode`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L17)

## Members

<a id="field-field-mq3-vm-jit-compat-compiled-architecture-architecture-src-mq3-vm-jit-compat-ml-1989809924"></a>
### architecture

```ml
architecture
```

Architecture identifier associated with the native VM execution plan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L21)

<a id="field-field-mq3-vm-jit-compat-compiled-codelength-codelength-src-mq3-vm-jit-compat-ml-932238700"></a>
### codeLength

```ml
codeLength
```

Length of the VM code region in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L25)

<a id="field-field-mq3-vm-jit-compat-compiled-instructionpointers-instructionpointers-src-mq3-vm-jit-compat-ml-846885402"></a>
### instructionPointers

```ml
instructionPointers
```

QVM code-byte offsets indexed by instruction number, retained by the compatibility dispatch plan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L23)

<a id="field-field-mq3-vm-jit-compat-compiled-machine-machine-src-mq3-vm-jit-compat-ml-121705862"></a>
### machine

```ml
machine
```

Interpreter/VM instance associated with the prepared compilation plan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L19)

<a id="field-field-mq3-vm-jit-compat-compiled-nativecode-nativecode-src-mq3-vm-jit-compat-ml-1089377786"></a>
### nativeCode

```ml
nativeCode
```

True only when native machine code has been emitted; false for this compatibility plan, which executes through the fast interpreter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L30)

<a id="field-field-mq3-vm-jit-compat-compiled-tablelength-tablelength-src-mq3-vm-jit-compat-ml-1779497142"></a>
### tableLength

```ml
tableLength
```

Byte length of the prepared instruction-address table, calculated as four bytes per entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/jit_compat.ml#L27)
