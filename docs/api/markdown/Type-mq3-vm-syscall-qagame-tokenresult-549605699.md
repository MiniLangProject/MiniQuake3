# `mq3.vm.syscall_qagame.TokenResult`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-qagame-ml-1544842921.md)

<a id="struct-struct-mq3-vm-syscall-qagame-tokenresult-struct-tokenresult-src-mq3-vm-syscall-qagame-ml-1073785705"></a>
## TokenResult

```ml
struct TokenResult
```

TokenResult record for vm.syscall_qagame, containing `found`, `text`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L14)

## Members

<a id="field-field-mq3-vm-syscall-qagame-tokenresult-found-found-src-mq3-vm-syscall-qagame-ml-1049314697"></a>
### found

```ml
found
```

Nonzero when the requested token, source, or resource result is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L16)

<a id="field-field-mq3-vm-syscall-qagame-tokenresult-text-text-src-mq3-vm-syscall-qagame-ml-40627667"></a>
### text

```ml
text
```

Spelling of the token returned by the host token-reading operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L18)
