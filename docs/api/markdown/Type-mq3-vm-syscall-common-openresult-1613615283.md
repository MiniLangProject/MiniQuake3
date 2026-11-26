# `mq3.vm.syscall_common.OpenResult`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-common-ml-1768394.md)

<a id="struct-struct-mq3-vm-syscall-common-openresult-struct-openresult-src-mq3-vm-syscall-common-ml-274561049"></a>
## OpenResult

```ml
struct OpenResult
```

Host file-open result copied into the QVM handle slot and returned as the open trap result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L62)

## Members

<a id="field-field-mq3-vm-syscall-common-openresult-handle-handle-src-mq3-vm-syscall-common-ml-1963508234"></a>
### handle

```ml
handle
```

Host file handle returned by the open operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L64)

<a id="field-field-mq3-vm-syscall-common-openresult-length-length-src-mq3-vm-syscall-common-ml-962767786"></a>
### length

```ml
length
```

File length or mode-specific status returned by the host; an absent open result becomes -1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L66)
