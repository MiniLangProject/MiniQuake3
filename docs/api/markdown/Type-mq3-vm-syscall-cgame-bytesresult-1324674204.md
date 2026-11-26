# `mq3.vm.syscall_cgame.BytesResult`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-cgame-ml-1987612568.md)

<a id="struct-struct-mq3-vm-syscall-cgame-bytesresult-struct-bytesresult-src-mq3-vm-syscall-cgame-ml-772641529"></a>
## BytesResult

```ml
struct BytesResult
```

BytesResult record for vm.syscall_cgame, containing `found`, `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L20)

## Members

<a id="field-field-mq3-vm-syscall-cgame-bytesresult-data-data-src-mq3-vm-syscall-cgame-ml-1729236475"></a>
### data

```ml
data
```

Binary result bytes to copy into the calling VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L24)

<a id="field-field-mq3-vm-syscall-cgame-bytesresult-found-found-src-mq3-vm-syscall-cgame-ml-920713643"></a>
### found

```ml
found
```

Nonzero when the requested token, source, or resource result is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L22)
