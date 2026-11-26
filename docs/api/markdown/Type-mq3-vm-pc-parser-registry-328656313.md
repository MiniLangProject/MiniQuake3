# `mq3.vm.pc_parser.Registry`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-registry-struct-registry-src-mq3-vm-pc-parser-ml-589173807"></a>
## Registry

```ml
struct Registry
```

Registry record for vm.pc_parser, containing `context`, `loadFn`, `sources`, `defines`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L122)

## Members

<a id="field-field-mq3-vm-pc-parser-registry-context-context-src-mq3-vm-pc-parser-ml-2808962"></a>
### context

```ml
context
```

Opaque caller-supplied context available to the precompiler source-file loading callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L124)

<a id="field-field-mq3-vm-pc-parser-registry-defines-defines-src-mq3-vm-pc-parser-ml-1894469670"></a>
### defines

```ml
defines
```

Active macro definitions available to the preprocessor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L130)

<a id="field-field-mq3-vm-pc-parser-registry-loadfn-loadfn-src-mq3-vm-pc-parser-ml-710719402"></a>
### loadFn

```ml
loadFn
```

Injected callback for load; invoked through the Registry service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L126)

<a id="field-field-mq3-vm-pc-parser-registry-sources-sources-src-mq3-vm-pc-parser-ml-924410954"></a>
### sources

```ml
sources
```

Loaded source objects managed by the preprocessor registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L128)
