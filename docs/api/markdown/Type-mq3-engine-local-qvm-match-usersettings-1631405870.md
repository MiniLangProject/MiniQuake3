# `mq3.engine.local_qvm_match.UserSettings`

[Home](README.md) · [Source file](File-src-mq3-engine-local-qvm-match-ml-725859098.md)

<a id="struct-struct-mq3-engine-local-qvm-match-usersettings-struct-usersettings-src-mq3-engine-local-qvm-match-ml-1978945251"></a>
## UserSettings

```ml
struct UserSettings
```

The original engine keeps one cvar/key/userinfo store alive while moving from ui.qvm into a local game.  MiniQuake3 boots the heavy game host only after the UI selects a map, so explicitly carry that persistent state across the host boundary instead of silently reverting menu choices and bindings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L185)

## Members

<a id="field-field-mq3-engine-local-qvm-match-usersettings-bindings-bindings-src-mq3-engine-local-qvm-match-ml-980627871"></a>
### bindings

```ml
bindings
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L185)

<a id="field-field-mq3-engine-local-qvm-match-usersettings-cvars-cvars-src-mq3-engine-local-qvm-match-ml-1071695275"></a>
### cvars

```ml
cvars
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L185)

<a id="field-field-mq3-engine-local-qvm-match-usersettings-pendingbotcommands-pendingbotcommands-src-mq3-engine-local-qvm-match-ml-858353695"></a>
### pendingBotCommands

```ml
pendingBotCommands
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L185)

<a id="field-field-mq3-engine-local-qvm-match-usersettings-userinfos-userinfos-src-mq3-engine-local-qvm-match-ml-836703943"></a>
### userinfos

```ml
userinfos
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L185)
