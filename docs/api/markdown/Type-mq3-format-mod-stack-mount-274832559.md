# `mq3.format.mod_stack.Mount`

[Home](README.md) · [Source file](File-src-mq3-format-mod-stack-ml-1677131492.md)

<a id="struct-struct-mq3-format-mod-stack-mount-struct-mount-src-mq3-format-mod-stack-ml-176088243"></a>
## Mount

```ml
struct Mount
```

Mount record for format.mod_stack, containing `game`, `dataRoot`, `archive`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L31)

## Members

<a id="field-field-mq3-format-mod-stack-mount-archive-archive-src-mq3-format-mod-stack-ml-268438180"></a>
### archive

```ml
archive
```

PK3 archive mounted at this stack entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L37)

<a id="field-field-mq3-format-mod-stack-mount-dataroot-dataroot-src-mq3-format-mod-stack-ml-483205364"></a>
### dataRoot

```ml
dataRoot
```

Filesystem root used to resolve this game directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L35)

<a id="field-field-mq3-format-mod-stack-mount-game-game-src-mq3-format-mod-stack-ml-1124107316"></a>
### game

```ml
game
```

Game directory whose assets are mounted at this stack entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L33)
