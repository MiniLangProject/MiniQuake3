# `src/mq3/vm/qvm_assembly_abi.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.qvm_assembly_abi`](Package-mq3-vm-qvm-assembly-abi-1122258689.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-vm-qvm-assembly-abi-cgamenames-function-cgamenames-src-mq3-vm-qvm-assembly-abi-ml-657328406"></a>
### cgameNames

```ml
function cgameNames()
```

List the 102 names in vm.qvm_assembly_abi.cgameNames, beginning with `trap_Print`, `trap_Error`, `trap_Milliseconds`, `trap_Cvar_Register`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/qvm_assembly_abi.ml#L7)

<a id="function-function-mq3-vm-qvm-assembly-abi-cgameordinals-function-cgameordinals-src-mq3-vm-qvm-assembly-abi-ml-1702992352"></a>
### cgameOrdinals

```ml
function cgameOrdinals()
```

Provide the cgame ordinals lookup table in vm.qvm_assembly_abi.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/qvm_assembly_abi.ml#L9)

<a id="function-function-mq3-vm-qvm-assembly-abi-gameduplicate546count-function-gameduplicate546count-src-mq3-vm-qvm-assembly-abi-ml-526684176"></a>
### gameDuplicate546Count

```ml
function gameDuplicate546Count()
```

The original table intentionally assigns -546 to two adjacent imports.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/qvm_assembly_abi.ml#L24)

<a id="function-function-mq3-vm-qvm-assembly-abi-gamenames-function-gamenames-src-mq3-vm-qvm-assembly-abi-ml-1052233082"></a>
### gameNames

```ml
function gameNames()
```

List the 194 names in vm.qvm_assembly_abi.gameNames, beginning with `trap_Printf`, `trap_Error`, `trap_Milliseconds`, `trap_Cvar_Register`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/qvm_assembly_abi.ml#L11)

<a id="function-function-mq3-vm-qvm-assembly-abi-gameordinals-function-gameordinals-src-mq3-vm-qvm-assembly-abi-ml-824688118"></a>
### gameOrdinals

```ml
function gameOrdinals()
```

Provide the game ordinals lookup table in vm.qvm_assembly_abi.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/qvm_assembly_abi.ml#L13)

<a id="function-function-mq3-vm-qvm-assembly-abi-isbuiltinordinal-function-isbuiltinordinal-ordinal-src-mq3-vm-qvm-assembly-abi-ml-2042940085"></a>
### isBuiltinOrdinal

```ml
function isBuiltinOrdinal(ordinal)
```

Compute vm.qvm_assembly_abi.isBuiltinOrdinal as `(ordinal <= - 101)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ordinal` | `dynamic` | — | Ordinal used in `(ordinal <= - 101)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/qvm_assembly_abi.ml#L22)

<a id="function-function-mq3-vm-qvm-assembly-abi-syscallnumber-function-syscallnumber-ordinal-src-mq3-vm-qvm-assembly-abi-ml-2056795393"></a>
### syscallNumber

```ml
function syscallNumber(ordinal)
```

Compute syscall number in vm.qvm_assembly_abi; the normal completion returns `((0 - ordinal) - 1)`.

Validation failures include `QVM import ordinal must be negative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ordinal` | `dynamic` | — | Ordinal used in `(0 - ordinal)` and `(ordinal >= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/qvm_assembly_abi.ml#L19)
