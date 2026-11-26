# `mq3.client.system_info.Services`

[Home](README.md) · [Source file](File-src-mq3-client-system-info-ml-628530239.md)

<a id="struct-struct-mq3-client-system-info-services-struct-services-src-mq3-client-system-info-ml-314921375"></a>
## Services

```ml
struct Services
```

Stores system info host-service callbacks, including `cheatResetFn`, `loadedPaksFn`, `referencedPaksFn`, `setCvarFn`, `getCvarFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L21)

## Members

<a id="field-field-mq3-client-system-info-services-cheatresetfn-cheatresetfn-src-mq3-client-system-info-ml-1795976857"></a>
### cheatResetFn

```ml
cheatResetFn
```

Host callback for the cheat reset operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L24)

<a id="field-field-mq3-client-system-info-services-context-context-src-mq3-client-system-info-ml-1848293241"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for server system-info configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L39)

<a id="field-field-mq3-client-system-info-services-getcvarfn-getcvarfn-src-mq3-client-system-info-ml-2062030121"></a>
### getCvarFn

```ml
getCvarFn
```

Host callback for the get cvar operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L36)

<a id="field-field-mq3-client-system-info-services-loadedpaksfn-loadedpaksfn-src-mq3-client-system-info-ml-1970453201"></a>
### loadedPaksFn

```ml
loadedPaksFn
```

Host callback for the loaded paks operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L27)

<a id="field-field-mq3-client-system-info-services-referencedpaksfn-referencedpaksfn-src-mq3-client-system-info-ml-250251697"></a>
### referencedPaksFn

```ml
referencedPaksFn
```

Host callback for the referenced paks operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L30)

<a id="field-field-mq3-client-system-info-services-setcvarfn-setcvarfn-src-mq3-client-system-info-ml-694940993"></a>
### setCvarFn

```ml
setCvarFn
```

Host callback for the set cvar operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L33)
