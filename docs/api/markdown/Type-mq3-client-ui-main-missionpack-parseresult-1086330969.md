# `mq3.client.ui_main_missionpack.ParseResult`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-parseresult-struct-parseresult-src-mq3-client-ui-main-missionpack-ml-2109134325"></a>
## ParseResult

```ml
struct ParseResult
```

Stores UI main missionpack parse result record, including `ok`, `next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L239)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-parseresult-next-next-src-mq3-client-ui-main-missionpack-ml-467625923"></a>
### next

```ml
next
```

When constructing this record, `Asset_Parse` supplies `at` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L243)

<a id="field-field-mq3-client-ui-main-missionpack-parseresult-ok-ok-src-mq3-client-ui-main-missionpack-ml-1926405553"></a>
### ok

```ml
ok
```

True when the operation completed successfully and its result can be consumed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L241)
