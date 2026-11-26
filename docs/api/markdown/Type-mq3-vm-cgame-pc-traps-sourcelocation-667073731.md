# `mq3.vm.cgame_pc_traps.SourceLocation`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-pc-traps-ml-1555701781.md)

<a id="struct-struct-mq3-vm-cgame-pc-traps-sourcelocation-struct-sourcelocation-src-mq3-vm-cgame-pc-traps-ml-61455191"></a>
## SourceLocation

```ml
struct SourceLocation
```

SourceLocation record for vm.cgame_pc_traps, containing `found`, `name`, `line`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_pc_traps.ml#L49)

## Members

<a id="field-field-mq3-vm-cgame-pc-traps-sourcelocation-found-found-src-mq3-vm-cgame-pc-traps-ml-1186622061"></a>
### found

```ml
found
```

Nonzero when the requested token, source, or resource result is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_pc_traps.ml#L51)

<a id="field-field-mq3-vm-cgame-pc-traps-sourcelocation-line-line-src-mq3-vm-cgame-pc-traps-ml-2071554177"></a>
### line

```ml
line
```

Current source line number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_pc_traps.ml#L55)

<a id="field-field-mq3-vm-cgame-pc-traps-sourcelocation-name-name-src-mq3-vm-cgame-pc-traps-ml-405775459"></a>
### name

```ml
name
```

Name of the source containing the current token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_pc_traps.ml#L53)
