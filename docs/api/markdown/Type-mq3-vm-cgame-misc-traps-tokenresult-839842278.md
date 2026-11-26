# `mq3.vm.cgame_misc_traps.TokenResult`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-misc-traps-ml-419606242.md)

<a id="struct-struct-mq3-vm-cgame-misc-traps-tokenresult-struct-tokenresult-src-mq3-vm-cgame-misc-traps-ml-446149139"></a>
## TokenResult

```ml
struct TokenResult
```

TokenResult record for vm.cgame_misc_traps, containing `found`, `text`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L30)

## Members

<a id="field-field-mq3-vm-cgame-misc-traps-tokenresult-found-found-src-mq3-vm-cgame-misc-traps-ml-1174922813"></a>
### found

```ml
found
```

Nonzero when the requested token, source, or resource result is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L32)

<a id="field-field-mq3-vm-cgame-misc-traps-tokenresult-text-text-src-mq3-vm-cgame-misc-traps-ml-2016654683"></a>
### text

```ml
text
```

Spelling of the token returned by the host token-reading operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L34)
