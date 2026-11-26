# `mq3.vm.abi.VmSymbol`

[Home](README.md) · [Source file](File-src-mq3-vm-abi-ml-1888366833.md)

<a id="struct-struct-mq3-vm-abi-vmsymbol-struct-vmsymbol-src-mq3-vm-abi-ml-1227932811"></a>
## VmSymbol

```ml
struct VmSymbol
```

VmSymbol record for vm.abi, containing `next`, `symValue`, `profileCount`, `symName`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L135)

## Members

<a id="field-field-mq3-vm-abi-vmsymbol-next-next-src-mq3-vm-abi-ml-1113064022"></a>
### next

```ml
next
```

Next entry in the linked VM symbol list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L137)

<a id="field-field-mq3-vm-abi-vmsymbol-profilecount-profilecount-src-mq3-vm-abi-ml-1681995588"></a>
### profileCount

```ml
profileCount
```

Execution/profile counter associated with this VM symbol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L141)

<a id="field-field-mq3-vm-abi-vmsymbol-symname-symname-src-mq3-vm-abi-ml-955280368"></a>
### symName

```ml
symName
```

Name associated with the VM debug symbol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L143)

<a id="field-field-mq3-vm-abi-vmsymbol-symvalue-symvalue-src-mq3-vm-abi-ml-617376740"></a>
### symValue

```ml
symValue
```

Numeric address/value associated with the VM debug symbol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/abi.ml#L139)
