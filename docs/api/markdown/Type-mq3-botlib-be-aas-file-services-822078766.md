# `mq3.botlib.be_aas_file.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-file-ml-8892360.md)

<a id="struct-struct-mq3-botlib-be-aas-file-services-struct-services-src-mq3-botlib-be-aas-file-ml-1736544871"></a>
## Services

```ml
struct Services
```

`Services` record for be aas file, containing `context`, `readFileFn`, `writeFileFn` and `printFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L22)

## Members

<a id="field-field-mq3-botlib-be-aas-file-services-context-context-src-mq3-botlib-be-aas-file-ml-55561277"></a>
### context

```ml
context
```

Caller-supplied data associated with AAS file reads, writes, and file diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L24)

<a id="field-field-mq3-botlib-be-aas-file-services-printfn-printfn-src-mq3-botlib-be-aas-file-ml-968128725"></a>
### printFn

```ml
printFn
```

Host callback that prints navigation-file loading and serialization diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L30)

<a id="field-field-mq3-botlib-be-aas-file-services-readfilefn-readfilefn-src-mq3-botlib-be-aas-file-ml-131844805"></a>
### readFileFn

```ml
readFileFn
```

Host callback that reads a requested file through the host filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L26)

<a id="field-field-mq3-botlib-be-aas-file-services-writefilefn-writefilefn-src-mq3-botlib-be-aas-file-ml-1493522165"></a>
### writeFileFn

```ml
writeFileFn
```

Host callback that writes a complete file through the host filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_file.ml#L28)
