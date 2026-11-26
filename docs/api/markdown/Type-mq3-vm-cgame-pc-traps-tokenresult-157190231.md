# `mq3.vm.cgame_pc_traps.TokenResult`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-pc-traps-ml-1555701781.md)

<a id="struct-struct-mq3-vm-cgame-pc-traps-tokenresult-struct-tokenresult-src-mq3-vm-cgame-pc-traps-ml-404608721"></a>
## TokenResult

```ml
struct TokenResult
```

TokenResult record for vm.cgame_pc_traps, containing `found`, `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L42)

## Members

<a id="field-field-mq3-vm-cgame-pc-traps-tokenresult-data-data-src-mq3-vm-cgame-pc-traps-ml-327309165"></a>
### data

```ml
data
```

Packed token ABI bytes returned to the calling VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L46)

<a id="field-field-mq3-vm-cgame-pc-traps-tokenresult-found-found-src-mq3-vm-cgame-pc-traps-ml-307814017"></a>
### found

```ml
found
```

Nonzero when the requested token, source, or resource result is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L44)
