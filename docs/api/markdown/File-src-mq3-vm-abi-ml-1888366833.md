# `src/mq3/vm/abi.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.abi`](Package-mq3-vm-abi-646732475.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-vm-abi-createstate-function-createstate-name-src-mq3-vm-abi-ml-1223819085"></a>
### createState

```ml
function createState(name)
```

Create `mq3.vm.abi.VmState` with programStack=0; systemCall=void; name=name; dllHandle=void; 16 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.vm.abi.VmState` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L199)

<a id="constant-constant-mq3-vm-abi-op-add-const-op-add-38-src-mq3-vm-abi-ml-2042804038"></a>
### OP_ADD

```ml
const OP_ADD = 38
```

QVM bytecode opcode for 32-bit integer addition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L88)

<a id="constant-constant-mq3-vm-abi-op-addf-const-op-addf-54-src-mq3-vm-abi-ml-280570364"></a>
### OP_ADDF

```ml
const OP_ADDF = 54
```

QVM bytecode opcode for floating-point addition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L120)

<a id="constant-constant-mq3-vm-abi-op-arg-const-op-arg-33-src-mq3-vm-abi-ml-89904173"></a>
### OP_ARG

```ml
const OP_ARG = 33
```

QVM bytecode opcode for storing a call argument in the program-stack frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L78)

<a id="constant-constant-mq3-vm-abi-op-band-const-op-band-46-src-mq3-vm-abi-ml-681265367"></a>
### OP_BAND

```ml
const OP_BAND = 46
```

QVM bytecode opcode for bitwise AND.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L104)

<a id="constant-constant-mq3-vm-abi-op-bcom-const-op-bcom-49-src-mq3-vm-abi-ml-1481551770"></a>
### OP_BCOM

```ml
const OP_BCOM = 49
```

QVM bytecode opcode for bitwise complement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L110)

<a id="constant-constant-mq3-vm-abi-op-block-copy-const-op-block-copy-34-src-mq3-vm-abi-ml-2094633342"></a>
### OP_BLOCK_COPY

```ml
const OP_BLOCK_COPY = 34
```

QVM bytecode opcode for copying a fixed-size block of VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L80)

<a id="constant-constant-mq3-vm-abi-op-bor-const-op-bor-47-src-mq3-vm-abi-ml-306293112"></a>
### OP_BOR

```ml
const OP_BOR = 47
```

QVM bytecode opcode for bitwise OR.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L106)

<a id="constant-constant-mq3-vm-abi-op-break-const-op-break-2-src-mq3-vm-abi-ml-1950236001"></a>
### OP_BREAK

```ml
const OP_BREAK = 2
```

QVM bytecode opcode for a debug break.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L16)

<a id="constant-constant-mq3-vm-abi-op-bxor-const-op-bxor-48-src-mq3-vm-abi-ml-1469377921"></a>
### OP_BXOR

```ml
const OP_BXOR = 48
```

QVM bytecode opcode for bitwise exclusive OR.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L108)

<a id="constant-constant-mq3-vm-abi-op-call-const-op-call-5-src-mq3-vm-abi-ml-1957722380"></a>
### OP_CALL

```ml
const OP_CALL = 5
```

QVM bytecode opcode for a VM function call or host syscall.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L22)

<a id="constant-constant-mq3-vm-abi-op-const-const-op-const-8-src-mq3-vm-abi-ml-1477186647"></a>
### OP_CONST

```ml
const OP_CONST = 8
```

QVM bytecode opcode for pushing an immediate 32-bit constant.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L28)

<a id="constant-constant-mq3-vm-abi-op-count-const-op-count-60-src-mq3-vm-abi-ml-904729579"></a>
### OP_COUNT

```ml
const OP_COUNT = 60
```

Number of defined QVM opcode values; not an executable instruction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L132)

<a id="constant-constant-mq3-vm-abi-op-cvfi-const-op-cvfi-59-src-mq3-vm-abi-ml-519302567"></a>
### OP_CVFI

```ml
const OP_CVFI = 59
```

QVM bytecode opcode for conversion from float to signed integer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L130)

<a id="constant-constant-mq3-vm-abi-op-cvif-const-op-cvif-58-src-mq3-vm-abi-ml-1010918884"></a>
### OP_CVIF

```ml
const OP_CVIF = 58
```

QVM bytecode opcode for conversion from signed integer to float.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L128)

<a id="constant-constant-mq3-vm-abi-op-divf-const-op-divf-56-src-mq3-vm-abi-ml-1280229466"></a>
### OP_DIVF

```ml
const OP_DIVF = 56
```

QVM bytecode opcode for floating-point division.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L124)

<a id="constant-constant-mq3-vm-abi-op-divi-const-op-divi-40-src-mq3-vm-abi-ml-1088862677"></a>
### OP_DIVI

```ml
const OP_DIVI = 40
```

QVM bytecode opcode for signed-integer division.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L92)

<a id="constant-constant-mq3-vm-abi-op-divu-const-op-divu-41-src-mq3-vm-abi-ml-145035478"></a>
### OP_DIVU

```ml
const OP_DIVU = 41
```

QVM bytecode opcode for unsigned-integer division.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L94)

<a id="constant-constant-mq3-vm-abi-op-enter-const-op-enter-3-src-mq3-vm-abi-ml-921824004"></a>
### OP_ENTER

```ml
const OP_ENTER = 3
```

QVM bytecode opcode for function entry and stack-frame allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L18)

<a id="constant-constant-mq3-vm-abi-op-eq-const-op-eq-11-src-mq3-vm-abi-ml-213349311"></a>
### OP_EQ

```ml
const OP_EQ = 11
```

QVM conditional branch comparing signed-integer operands for equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L34)

<a id="constant-constant-mq3-vm-abi-op-eqf-const-op-eqf-21-src-mq3-vm-abi-ml-1199881906"></a>
### OP_EQF

```ml
const OP_EQF = 21
```

QVM conditional branch comparing floating-point operands for equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L54)

<a id="constant-constant-mq3-vm-abi-op-gef-const-op-gef-26-src-mq3-vm-abi-ml-166836627"></a>
### OP_GEF

```ml
const OP_GEF = 26
```

QVM conditional branch comparing floating-point operands for greater than or equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L64)

<a id="constant-constant-mq3-vm-abi-op-gei-const-op-gei-16-src-mq3-vm-abi-ml-1220899886"></a>
### OP_GEI

```ml
const OP_GEI = 16
```

QVM conditional branch comparing signed-integer operands for greater than or equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L44)

<a id="constant-constant-mq3-vm-abi-op-geu-const-op-geu-20-src-mq3-vm-abi-ml-1774215183"></a>
### OP_GEU

```ml
const OP_GEU = 20
```

QVM conditional branch comparing unsigned-integer operands for greater than or equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L52)

<a id="constant-constant-mq3-vm-abi-op-gtf-const-op-gtf-25-src-mq3-vm-abi-ml-97418004"></a>
### OP_GTF

```ml
const OP_GTF = 25
```

QVM conditional branch comparing floating-point operands for greater than.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L62)

<a id="constant-constant-mq3-vm-abi-op-gti-const-op-gti-15-src-mq3-vm-abi-ml-1003285925"></a>
### OP_GTI

```ml
const OP_GTI = 15
```

QVM conditional branch comparing signed-integer operands for greater than.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L42)

<a id="constant-constant-mq3-vm-abi-op-gtu-const-op-gtu-19-src-mq3-vm-abi-ml-455896145"></a>
### OP_GTU

```ml
const OP_GTU = 19
```

QVM conditional branch comparing unsigned-integer operands for greater than.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L50)

<a id="constant-constant-mq3-vm-abi-op-ignore-const-op-ignore-1-src-mq3-vm-abi-ml-644368400"></a>
### OP_IGNORE

```ml
const OP_IGNORE = 1
```

QVM bytecode opcode for a no-operation instruction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L14)

<a id="constant-constant-mq3-vm-abi-op-jump-const-op-jump-10-src-mq3-vm-abi-ml-917864256"></a>
### OP_JUMP

```ml
const OP_JUMP = 10
```

QVM bytecode opcode for an unconditional jump to an operand-stack destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L32)

<a id="constant-constant-mq3-vm-abi-op-leave-const-op-leave-4-src-mq3-vm-abi-ml-747360379"></a>
### OP_LEAVE

```ml
const OP_LEAVE = 4
```

QVM bytecode opcode for function return and stack-frame release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L20)

<a id="constant-constant-mq3-vm-abi-op-lef-const-op-lef-24-src-mq3-vm-abi-ml-1215075963"></a>
### OP_LEF

```ml
const OP_LEF = 24
```

QVM conditional branch comparing floating-point operands for less than or equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L60)

<a id="constant-constant-mq3-vm-abi-op-lei-const-op-lei-14-src-mq3-vm-abi-ml-1501971290"></a>
### OP_LEI

```ml
const OP_LEI = 14
```

QVM conditional branch comparing signed-integer operands for less than or equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L40)

<a id="constant-constant-mq3-vm-abi-op-leu-const-op-leu-18-src-mq3-vm-abi-ml-1390502414"></a>
### OP_LEU

```ml
const OP_LEU = 18
```

QVM conditional branch comparing unsigned-integer operands for less than or equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L48)

<a id="constant-constant-mq3-vm-abi-op-load1-const-op-load1-27-src-mq3-vm-abi-ml-981621334"></a>
### OP_LOAD1

```ml
const OP_LOAD1 = 27
```

QVM opcode for loading 1 byte(s) in VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L66)

<a id="constant-constant-mq3-vm-abi-op-load2-const-op-load2-28-src-mq3-vm-abi-ml-1783484125"></a>
### OP_LOAD2

```ml
const OP_LOAD2 = 28
```

QVM opcode for loading 2 byte(s) in VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L68)

<a id="constant-constant-mq3-vm-abi-op-load4-const-op-load4-29-src-mq3-vm-abi-ml-1120981926"></a>
### OP_LOAD4

```ml
const OP_LOAD4 = 29
```

QVM opcode for loading 4 byte(s) in VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L70)

<a id="constant-constant-mq3-vm-abi-op-local-const-op-local-9-src-mq3-vm-abi-ml-1253453712"></a>
### OP_LOCAL

```ml
const OP_LOCAL = 9
```

QVM bytecode opcode for pushing an address relative to the current program-stack frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L30)

<a id="constant-constant-mq3-vm-abi-op-lsh-const-op-lsh-50-src-mq3-vm-abi-ml-2137250004"></a>
### OP_LSH

```ml
const OP_LSH = 50
```

QVM bytecode opcode for left bit shift.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L112)

<a id="constant-constant-mq3-vm-abi-op-ltf-const-op-ltf-23-src-mq3-vm-abi-ml-1459675860"></a>
### OP_LTF

```ml
const OP_LTF = 23
```

QVM conditional branch comparing floating-point operands for less than.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L58)

<a id="constant-constant-mq3-vm-abi-op-lti-const-op-lti-13-src-mq3-vm-abi-ml-343495985"></a>
### OP_LTI

```ml
const OP_LTI = 13
```

QVM conditional branch comparing signed-integer operands for less than.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L38)

<a id="constant-constant-mq3-vm-abi-op-ltu-const-op-ltu-17-src-mq3-vm-abi-ml-870035813"></a>
### OP_LTU

```ml
const OP_LTU = 17
```

QVM conditional branch comparing unsigned-integer operands for less than.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L46)

<a id="constant-constant-mq3-vm-abi-op-modi-const-op-modi-42-src-mq3-vm-abi-ml-1393853847"></a>
### OP_MODI

```ml
const OP_MODI = 42
```

QVM bytecode opcode for signed-integer remainder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L96)

<a id="constant-constant-mq3-vm-abi-op-modu-const-op-modu-43-src-mq3-vm-abi-ml-1119844904"></a>
### OP_MODU

```ml
const OP_MODU = 43
```

QVM bytecode opcode for unsigned-integer remainder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L98)

<a id="constant-constant-mq3-vm-abi-op-mulf-const-op-mulf-57-src-mq3-vm-abi-ml-714719837"></a>
### OP_MULF

```ml
const OP_MULF = 57
```

QVM bytecode opcode for floating-point multiplication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L126)

<a id="constant-constant-mq3-vm-abi-op-muli-const-op-muli-44-src-mq3-vm-abi-ml-623513329"></a>
### OP_MULI

```ml
const OP_MULI = 44
```

QVM bytecode opcode for signed-integer multiplication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L100)

<a id="constant-constant-mq3-vm-abi-op-mulu-const-op-mulu-45-src-mq3-vm-abi-ml-2078129050"></a>
### OP_MULU

```ml
const OP_MULU = 45
```

QVM bytecode opcode for unsigned-integer multiplication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L102)

<a id="constant-constant-mq3-vm-abi-op-ne-const-op-ne-12-src-mq3-vm-abi-ml-1820883442"></a>
### OP_NE

```ml
const OP_NE = 12
```

QVM conditional branch comparing signed-integer operands for not equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L36)

<a id="constant-constant-mq3-vm-abi-op-nef-const-op-nef-22-src-mq3-vm-abi-ml-110161413"></a>
### OP_NEF

```ml
const OP_NEF = 22
```

QVM conditional branch comparing floating-point operands for not equal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L56)

<a id="constant-constant-mq3-vm-abi-op-negf-const-op-negf-53-src-mq3-vm-abi-ml-1808405921"></a>
### OP_NEGF

```ml
const OP_NEGF = 53
```

QVM bytecode opcode for floating-point negation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L118)

<a id="constant-constant-mq3-vm-abi-op-negi-const-op-negi-37-src-mq3-vm-abi-ml-1156345279"></a>
### OP_NEGI

```ml
const OP_NEGI = 37
```

QVM bytecode opcode for signed-integer negation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L86)

<a id="constant-constant-mq3-vm-abi-op-pop-const-op-pop-7-src-mq3-vm-abi-ml-1874519926"></a>
### OP_POP

```ml
const OP_POP = 7
```

QVM bytecode opcode for removing an operand-stack value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L26)

<a id="constant-constant-mq3-vm-abi-op-push-const-op-push-6-src-mq3-vm-abi-ml-530822973"></a>
### OP_PUSH

```ml
const OP_PUSH = 6
```

QVM bytecode opcode for allocating an operand-stack slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L24)

<a id="constant-constant-mq3-vm-abi-op-rshi-const-op-rshi-51-src-mq3-vm-abi-ml-42178139"></a>
### OP_RSHI

```ml
const OP_RSHI = 51
```

QVM bytecode opcode for arithmetic signed right shift.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L114)

<a id="constant-constant-mq3-vm-abi-op-rshu-const-op-rshu-52-src-mq3-vm-abi-ml-652650150"></a>
### OP_RSHU

```ml
const OP_RSHU = 52
```

QVM bytecode opcode for logical unsigned right shift.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L116)

<a id="constant-constant-mq3-vm-abi-op-sex16-const-op-sex16-36-src-mq3-vm-abi-ml-578006608"></a>
### OP_SEX16

```ml
const OP_SEX16 = 36
```

QVM bytecode opcode for sign-extending a 16-bit value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L84)

<a id="constant-constant-mq3-vm-abi-op-sex8-const-op-sex8-35-src-mq3-vm-abi-ml-1428483553"></a>
### OP_SEX8

```ml
const OP_SEX8 = 35
```

QVM bytecode opcode for sign-extending an 8-bit value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L82)

<a id="constant-constant-mq3-vm-abi-op-store1-const-op-store1-30-src-mq3-vm-abi-ml-1564693818"></a>
### OP_STORE1

```ml
const OP_STORE1 = 30
```

QVM opcode for storing 1 byte(s) in VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L72)

<a id="constant-constant-mq3-vm-abi-op-store2-const-op-store2-31-src-mq3-vm-abi-ml-799175013"></a>
### OP_STORE2

```ml
const OP_STORE2 = 31
```

QVM opcode for storing 2 byte(s) in VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L74)

<a id="constant-constant-mq3-vm-abi-op-store4-const-op-store4-32-src-mq3-vm-abi-ml-860501104"></a>
### OP_STORE4

```ml
const OP_STORE4 = 32
```

QVM opcode for storing 4 byte(s) in VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L76)

<a id="constant-constant-mq3-vm-abi-op-sub-const-op-sub-39-src-mq3-vm-abi-ml-245697655"></a>
### OP_SUB

```ml
const OP_SUB = 39
```

QVM bytecode opcode for 32-bit integer subtraction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L90)

<a id="constant-constant-mq3-vm-abi-op-subf-const-op-subf-55-src-mq3-vm-abi-ml-6691275"></a>
### OP_SUBF

```ml
const OP_SUBF = 55
```

QVM bytecode opcode for floating-point subtraction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L122)

<a id="constant-constant-mq3-vm-abi-op-undef-const-op-undef-0-src-mq3-vm-abi-ml-2017582253"></a>
### OP_UNDEF

```ml
const OP_UNDEF = 0
```

QVM bytecode opcode for an invalid-instruction trap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L12)

<a id="function-function-mq3-vm-abi-opcodevalues-function-opcodevalues-src-mq3-vm-abi-ml-1056663938"></a>
### opcodeValues

```ml
function opcodeValues()
```

Provide the opcode values lookup table in vm.abi.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L193)

<a id="constant-constant-mq3-vm-abi-vm-offset-program-stack-const-vm-offset-program-stack-0-src-mq3-vm-abi-ml-1250423503"></a>
### VM_OFFSET_PROGRAM_STACK

```ml
const VM_OFFSET_PROGRAM_STACK = 0
```

Byte offset of programStack in the legacy VM assembly ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L7)

<a id="constant-constant-mq3-vm-abi-vm-offset-system-call-const-vm-offset-system-call-4-src-mq3-vm-abi-ml-1767928927"></a>
### VM_OFFSET_SYSTEM_CALL

```ml
const VM_OFFSET_SYSTEM_CALL = 4
```

Byte offset of the systemCall entry in the legacy VM assembly ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L9)

- [mq3.vm.abi.VmState](Type-mq3-vm-abi-vmstate-1369925479.md) — struct
- [mq3.vm.abi.VmSymbol](Type-mq3-vm-abi-vmsymbol-25862738.md) — struct
