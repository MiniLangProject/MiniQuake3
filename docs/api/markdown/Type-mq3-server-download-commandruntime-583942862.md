# `mq3.server.download.CommandRuntime`

[Home](README.md) · [Source file](File-src-mq3-server-download-ml-1708412053.md)

<a id="struct-struct-mq3-server-download-commandruntime-struct-commandruntime-src-mq3-server-download-ml-2115954483"></a>
## CommandRuntime

```ml
struct CommandRuntime
```

Adapter for the four download builtins in SV_ExecuteClientCommand.  Keeping it next to the window state makes the reliable command path and the snapshot writer operate on the same live download cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L27)

## Members

<a id="field-field-mq3-server-download-commandruntime-context-context-src-mq3-server-download-ml-1476311098"></a>
### context

```ml
context
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L27)

<a id="field-field-mq3-server-download-commandruntime-downloadhost-downloadhost-src-mq3-server-download-ml-176770682"></a>
### downloadHost

```ml
downloadHost
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L27)

<a id="field-field-mq3-server-download-commandruntime-sendgamestatefn-sendgamestatefn-src-mq3-server-download-ml-1802074142"></a>
### sendGamestateFn

```ml
sendGamestateFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L27)

<a id="field-field-mq3-server-download-commandruntime-serverstate-serverstate-src-mq3-server-download-ml-367855382"></a>
### serverState

```ml
serverState
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L27)

<a id="field-field-mq3-server-download-commandruntime-state-state-src-mq3-server-download-ml-1675617254"></a>
### state

```ml
state
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L27)
