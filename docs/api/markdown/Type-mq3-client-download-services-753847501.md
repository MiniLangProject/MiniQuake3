# `mq3.client.download.Services`

[Home](README.md) · [Source file](File-src-mq3-client-download-ml-170988721.md)

<a id="struct-struct-mq3-client-download-services-struct-services-src-mq3-client-download-ml-574609207"></a>
## Services

```ml
struct Services
```

Stores download host-service callbacks, including `cvarValueFn`, `cvarStringFn`, `reliableFn`, `openFn`, `writeFn`, `closeFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L28)

## Members

<a id="field-field-mq3-client-download-services-closefn-closefn-src-mq3-client-download-ml-684040543"></a>
### closeFn

```ml
closeFn
```

Host callback for the close operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L43)

<a id="field-field-mq3-client-download-services-context-context-src-mq3-client-download-ml-1391683747"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for server-directed file downloads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L54)

<a id="field-field-mq3-client-download-services-cvarstringfn-cvarstringfn-src-mq3-client-download-ml-1380720405"></a>
### cvarStringFn

```ml
cvarStringFn
```

Host callback for the cvar string operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L34)

<a id="field-field-mq3-client-download-services-cvarvaluefn-cvarvaluefn-src-mq3-client-download-ml-1526834339"></a>
### cvarValueFn

```ml
cvarValueFn
```

Host callback for the cvar value operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L31)

<a id="field-field-mq3-client-download-services-nextfn-nextfn-src-mq3-client-download-ml-1362973037"></a>
### nextFn

```ml
nextFn
```

Host callback for the next operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L49)

<a id="field-field-mq3-client-download-services-openfn-openfn-src-mq3-client-download-ml-1392865427"></a>
### openFn

```ml
openFn
```

Host callback for the open operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L39)

<a id="field-field-mq3-client-download-services-packetfn-packetfn-src-mq3-client-download-ml-1325644907"></a>
### packetFn

```ml
packetFn
```

Host callback for the packet operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L47)

<a id="field-field-mq3-client-download-services-printfn-printfn-src-mq3-client-download-ml-1447575075"></a>
### printFn

```ml
printFn
```

Host callback for the print operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L51)

<a id="field-field-mq3-client-download-services-reliablefn-reliablefn-src-mq3-client-download-ml-564708239"></a>
### reliableFn

```ml
reliableFn
```

Host callback for the reliable operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L37)

<a id="field-field-mq3-client-download-services-renamefn-renamefn-src-mq3-client-download-ml-887505199"></a>
### renameFn

```ml
renameFn
```

Host callback for the rename operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L45)

<a id="field-field-mq3-client-download-services-writefn-writefn-src-mq3-client-download-ml-1849665671"></a>
### writeFn

```ml
writeFn
```

Host callback for the write operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L41)
