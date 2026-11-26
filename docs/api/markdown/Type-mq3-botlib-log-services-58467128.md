# `mq3.botlib.log.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-log-ml-480729422.md)

<a id="struct-struct-mq3-botlib-log-services-struct-services-src-mq3-botlib-log-ml-579525671"></a>
## Services

```ml
struct Services
```

`Services` record for log, containing `context`, `openFn`, `closeFn`, `writeFn` and `flushFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L55)

## Members

<a id="field-field-mq3-botlib-log-services-closefn-closefn-src-mq3-botlib-log-ml-289443673"></a>
### closeFn

```ml
closeFn
```

Host callback that closes a host file handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L62)

<a id="field-field-mq3-botlib-log-services-context-context-src-mq3-botlib-log-ml-402139517"></a>
### context

```ml
context
```

Caller-supplied data associated with opening, writing, flushing, and closing bot-library log files.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L58)

<a id="field-field-mq3-botlib-log-services-flushfn-flushfn-src-mq3-botlib-log-ml-410582421"></a>
### flushFn

```ml
flushFn
```

Host callback that flushes buffered text to its host destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L66)

<a id="field-field-mq3-botlib-log-services-openfn-openfn-src-mq3-botlib-log-ml-632514401"></a>
### openFn

```ml
openFn
```

Host callback that opens a requested host file and returns its handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L60)

<a id="field-field-mq3-botlib-log-services-printfn-printfn-src-mq3-botlib-log-ml-1586071517"></a>
### printFn

```ml
printFn
```

Host callback that prints log-opening failures and bot logging diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L68)

<a id="field-field-mq3-botlib-log-services-writefn-writefn-src-mq3-botlib-log-ml-1426671225"></a>
### writeFn

```ml
writeFn
```

Host callback that writes data through the host output interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/log.ml#L64)
