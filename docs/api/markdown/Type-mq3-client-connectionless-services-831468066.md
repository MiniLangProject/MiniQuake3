# `mq3.client.connectionless.Services`

[Home](README.md) · [Source file](File-src-mq3-client-connectionless-ml-1561502254.md)

<a id="struct-struct-mq3-client-connectionless-services-struct-services-src-mq3-client-connectionless-ml-786224309"></a>
## Services

```ml
struct Services
```

Stores connectionless host-service callbacks, including `infoFn`, `statusFn`, `disconnectFn`, `printFn`, `outOfBandFn`, `motdFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L71)

## Members

<a id="field-field-mq3-client-connectionless-services-authorizationfn-authorizationfn-src-mq3-client-connectionless-ml-691556529"></a>
### authorizationFn

```ml
authorizationFn
```

Host callback for the authorization operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L98)

<a id="field-field-mq3-client-connectionless-services-clearuserinfomodifiedfn-clearuserinfomodifiedfn-src-mq3-client-connectionless-ml-53375221"></a>
### clearUserinfoModifiedFn

```ml
clearUserinfoModifiedFn
```

Host callback for the clear userinfo modified operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L107)

<a id="field-field-mq3-client-connectionless-services-context-context-src-mq3-client-connectionless-ml-906653069"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for connectionless server replies.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L93)

<a id="field-field-mq3-client-connectionless-services-diagnosticfn-diagnosticfn-src-mq3-client-connectionless-ml-1527973727"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback for the diagnostic operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L90)

<a id="field-field-mq3-client-connectionless-services-disconnectfn-disconnectfn-src-mq3-client-connectionless-ml-1266605805"></a>
### disconnectFn

```ml
disconnectFn
```

Host callback for the disconnect operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L78)

<a id="field-field-mq3-client-connectionless-services-infofn-infofn-src-mq3-client-connectionless-ml-976737669"></a>
### infoFn

```ml
infoFn
```

Host callback for the info operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L73)

<a id="field-field-mq3-client-connectionless-services-lanfn-lanfn-src-mq3-client-connectionless-ml-1259613973"></a>
### lanFn

```ml
lanFn
```

Host callback for the lan operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L95)

<a id="field-field-mq3-client-connectionless-services-motdfn-motdfn-src-mq3-client-connectionless-ml-305876597"></a>
### motdFn

```ml
motdFn
```

Host callback for the motd operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L85)

<a id="field-field-mq3-client-connectionless-services-outofbanddatafn-outofbanddatafn-src-mq3-client-connectionless-ml-1464499853"></a>
### outOfBandDataFn

```ml
outOfBandDataFn
```

Host callback for the out of band data operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L104)

<a id="field-field-mq3-client-connectionless-services-outofbandfn-outofbandfn-src-mq3-client-connectionless-ml-574434765"></a>
### outOfBandFn

```ml
outOfBandFn
```

Host callback for the out of band operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L83)

<a id="field-field-mq3-client-connectionless-services-printfn-printfn-src-mq3-client-connectionless-ml-1682101189"></a>
### printFn

```ml
printFn
```

Host callback for the print operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L80)

<a id="field-field-mq3-client-connectionless-services-serversfn-serversfn-src-mq3-client-connectionless-ml-670679849"></a>
### serversFn

```ml
serversFn
```

Host callback for the servers operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L87)

<a id="field-field-mq3-client-connectionless-services-statusfn-statusfn-src-mq3-client-connectionless-ml-320840405"></a>
### statusFn

```ml
statusFn
```

Host callback for the status operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L75)

<a id="field-field-mq3-client-connectionless-services-userinfofn-userinfofn-src-mq3-client-connectionless-ml-1692591403"></a>
### userinfoFn

```ml
userinfoFn
```

Host callback for the userinfo operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/connectionless.ml#L101)
