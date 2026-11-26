# `mq3.client.ui_main_missionpack.AliasInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-aliasinfo-struct-aliasinfo-src-mq3-client-ui-main-missionpack-ml-153951817"></a>
## AliasInfo

```ml
struct AliasInfo
```

Stores UI main missionpack alias info record, including `name`, `ai`, `action`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L197)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-aliasinfo-action-action-src-mq3-client-ui-main-missionpack-ml-1257328851"></a>
### action

```ml
action
```

When constructing this record, `Alias_Parse` supplies `tokens[at+3]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L203)

<a id="field-field-mq3-client-ui-main-missionpack-aliasinfo-ai-ai-src-mq3-client-ui-main-missionpack-ml-1717197007"></a>
### ai

```ml
ai
```

When constructing this record, `Alias_Parse` supplies `tokens[at+2]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L201)

<a id="field-field-mq3-client-ui-main-missionpack-aliasinfo-name-name-src-mq3-client-ui-main-missionpack-ml-618977877"></a>
### name

```ml
name
```

Public bot alias matched without case sensitivity and translated to its associated AI profile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L199)
