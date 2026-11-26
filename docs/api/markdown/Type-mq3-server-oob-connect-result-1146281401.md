# `mq3.server.oob_connect.Result`

[Home](README.md) · [Source file](File-src-mq3-server-oob-connect-ml-829458266.md)

<a id="struct-struct-mq3-server-oob-connect-result-struct-result-src-mq3-server-oob-connect-ml-339691255"></a>
## Result

```ml
struct Result
```

Result record for server.oob_connect, containing `accepted`, `reason`, `slot`, `challengeIndex`, `userinfo`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L156)

## Members

<a id="field-field-mq3-server-oob-connect-result-accepted-accepted-src-mq3-server-oob-connect-ml-1652466854"></a>
### accepted

```ml
accepted
```

True when validation accepted the requested operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L158)

<a id="field-field-mq3-server-oob-connect-result-challengeindex-challengeindex-src-mq3-server-oob-connect-ml-2072797934"></a>
### challengeIndex

```ml
challengeIndex
```

Index of the challenge-table entry used by the connection attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L164)

<a id="field-field-mq3-server-oob-connect-result-reason-reason-src-mq3-server-oob-connect-ml-1909117676"></a>
### reason

```ml
reason
```

Diagnostic explaining the result or rejection of this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L160)

<a id="field-field-mq3-server-oob-connect-result-slot-slot-src-mq3-server-oob-connect-ml-1852389180"></a>
### slot

```ml
slot
```

Index identifying this entry in its owning slot table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L162)

<a id="field-field-mq3-server-oob-connect-result-userinfo-userinfo-src-mq3-server-oob-connect-ml-1399383246"></a>
### userinfo

```ml
userinfo
```

Backslash-delimited client information string, including name and connection settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L166)
