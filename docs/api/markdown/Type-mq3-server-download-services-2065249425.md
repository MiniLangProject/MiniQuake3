# `mq3.server.download.Services`

[Home](README.md) · [Source file](File-src-mq3-server-download-ml-1708412053.md)

<a id="struct-struct-mq3-server-download-services-struct-services-src-mq3-server-download-ml-1744052935"></a>
## Services

```ml
struct Services
```

Services record for server.download, containing `idPakFn`, `openFn`, `readFn`, `closeFn`, `dropFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L73)

## Members

<a id="field-field-mq3-server-download-services-closefn-closefn-src-mq3-server-download-ml-267925751"></a>
### closeFn

```ml
closeFn
```

Host callback that closes a host file handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L81)

<a id="field-field-mq3-server-download-services-context-context-src-mq3-server-download-ml-751595571"></a>
### context

```ml
context
```

Caller-supplied data associated with asset download file access and client rejection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L85)

<a id="field-field-mq3-server-download-services-dropfn-dropfn-src-mq3-server-download-ml-527157897"></a>
### dropFn

```ml
dropFn
```

Host callback that disconnects a client and reports the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L83)

<a id="field-field-mq3-server-download-services-idpakfn-idpakfn-src-mq3-server-download-ml-1799718403"></a>
### idPakFn

```ml
idPakFn
```

Host callback that classifies an archive as an original game package.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L75)

<a id="field-field-mq3-server-download-services-openfn-openfn-src-mq3-server-download-ml-1410818355"></a>
### openFn

```ml
openFn
```

Host callback that opens a requested host file and returns its handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L77)

<a id="field-field-mq3-server-download-services-readfn-readfn-src-mq3-server-download-ml-1954192651"></a>
### readFn

```ml
readFn
```

Host callback that reads the next byte block from an open asset download file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L79)
