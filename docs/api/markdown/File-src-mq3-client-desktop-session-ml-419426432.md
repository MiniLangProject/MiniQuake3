# `src/mq3/client/desktop_session.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.desktop_session`](Package-mq3-client-desktop-session-144064680.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/key_bindings_config.ml` as `bindings` → [src/mq3/client/key_bindings_config.ml](File-src-mq3-client-key-bindings-config-ml-2105830282.md)
- `mq3/client/ui_lan_cache.ml` as `lanCache` → [src/mq3/client/ui_lan_cache.ml](File-src-mq3-client-ui-lan-cache-ml-483900424.md)
- `mq3/engine/local_qvm_match.ml` as `match` → [src/mq3/engine/local_qvm_match.ml](File-src-mq3-engine-local-qvm-match-ml-725859098.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/qcommon/command_buffer.ml` as `commands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/config_persistence.ml` as `config` → [src/mq3/qcommon/config_persistence.ml](File-src-mq3-qcommon-config-persistence-ml-1954559630.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-desktop-session-attach-function-attach-state-session-src-mq3-client-desktop-session-ml-1570430551"></a>
### attach

```ml
function attach(state, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L215)

<a id="function-function-mq3-client-desktop-session-bindingtext-function-bindingtext-host-src-mq3-client-desktop-session-ml-968649684"></a>
### bindingText

```ml
function bindingText(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L44)

<a id="function-function-mq3-client-desktop-session-capture-function-capture-state-session-src-mq3-client-desktop-session-ml-1335512387"></a>
### capture

```ml
function capture(state, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L88)

<a id="function-function-mq3-client-desktop-session-cinematiccommand-function-cinematiccommand-commandstate-session-src-mq3-client-desktop-session-ml-67678756"></a>
### cinematicCommand

```ml
function cinematicCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L149)

<a id="function-function-mq3-client-desktop-session-commandcvar-function-commandcvar-commandstate-name-src-mq3-client-desktop-session-ml-248160095"></a>
### commandCvar

```ml
function commandCvar(commandState, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L47)

<a id="function-function-mq3-client-desktop-session-commandprint-function-commandprint-commandstate-text-src-mq3-client-desktop-session-ml-1995083625"></a>
### commandPrint

```ml
function commandPrint(commandState, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L46)

- [mq3.client.desktop_session.ConfigHost](Type-mq3-client-desktop-session-confighost-891662542.md) — struct
<a id="function-function-mq3-client-desktop-session-configprint-function-configprint-host-text-src-mq3-client-desktop-session-ml-982196295"></a>
### configPrint

```ml
function configPrint(host, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L45)

<a id="function-function-mq3-client-desktop-session-create-function-create-dataroot-src-mq3-client-desktop-session-ml-950275258"></a>
### create

```ml
function create(dataRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dataRoot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L40)

<a id="function-function-mq3-client-desktop-session-defercommandtail-function-defercommandtail-commandstate-src-mq3-client-desktop-session-ml-706785520"></a>
### deferCommandTail

```ml
function deferCommandTail(commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L108)

<a id="function-function-mq3-client-desktop-session-disconnectcommand-function-disconnectcommand-commandstate-session-src-mq3-client-desktop-session-ml-496682102"></a>
### disconnectCommand

```ml
function disconnectCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L144)

<a id="function-function-mq3-client-desktop-session-finishcinematic-function-finishcinematic-session-src-mq3-client-desktop-session-ml-959624354"></a>
### finishCinematic

```ml
function finishCinematic(session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L156)

<a id="extern_function-extern-function-mq3-client-desktop-session-getcurrentprocessid-extern-function-getcurrentprocessid-from-kernel32-dll-returns-u32-src-mq3-client-desktop-session-ml-1598081936"></a>
### GetCurrentProcessId

```ml
extern function GetCurrentProcessId() from "kernel32.dll" returns u32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L16)

<a id="function-function-mq3-client-desktop-session-levelselectcommand-function-levelselectcommand-commandstate-session-src-mq3-client-desktop-session-ml-1786550228"></a>
### levelselectCommand

```ml
function levelselectCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L170)

<a id="function-function-mq3-client-desktop-session-mapcommand-function-mapcommand-commandstate-session-src-mq3-client-desktop-session-ml-908765304"></a>
### mapCommand

```ml
function mapCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L113)

<a id="extern_function-extern-function-mq3-client-desktop-session-movefileexw-extern-function-movefileexw-existingpath-as-wstr-newpath-as-wstr-flags-as-u32-from-kernel32-dll-returns-bool-src-mq3-client-desktop-session-ml-599392846"></a>
### MoveFileExW

```ml
extern function MoveFileExW(existingPath as wstr, newPath as wstr, flags as u32) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `existingPath` | `wstr` | — |  |
| `newPath` | `wstr` | — |  |
| `flags` | `u32` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L15)

<a id="function-function-mq3-client-desktop-session-musiccommand-function-musiccommand-commandstate-session-src-mq3-client-desktop-session-ml-1471545004"></a>
### musicCommand

```ml
function musicCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L194)

<a id="function-function-mq3-client-desktop-session-quitcommand-function-quitcommand-commandstate-session-src-mq3-client-desktop-session-ml-1230812920"></a>
### quitCommand

```ml
function quitCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L176)

<a id="function-function-mq3-client-desktop-session-readcommandfile-function-readcommandfile-commandstate-name-src-mq3-client-desktop-session-ml-179072883"></a>
### readCommandFile

```ml
function readCommandFile(commandState, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L74)

<a id="function-function-mq3-client-desktop-session-readconfig-function-readconfig-context-root-name-src-mq3-client-desktop-session-ml-934784658"></a>
### readConfig

```ml
function readConfig(context, root, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `root` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L61)

<a id="function-function-mq3-client-desktop-session-requestedgame-function-requestedgame-commandstate-src-mq3-client-desktop-session-ml-471365860"></a>
### requestedGame

```ml
function requestedGame(commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L177)

<a id="function-function-mq3-client-desktop-session-restartcommand-function-restartcommand-commandstate-session-src-mq3-client-desktop-session-ml-1136544464"></a>
### restartCommand

```ml
function restartCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L139)

<a id="function-function-mq3-client-desktop-session-restartfilesystem-function-restartfilesystem-commandstate-session-src-mq3-client-desktop-session-ml-1153999100"></a>
### restartFilesystem

```ml
function restartFilesystem(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L182)

<a id="function-function-mq3-client-desktop-session-save-function-save-state-session-src-mq3-client-desktop-session-ml-742197919"></a>
### save

```ml
function save(state, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L79)

- [mq3.client.desktop_session.Session](Type-mq3-client-desktop-session-session-82414742.md) — struct
<a id="function-function-mq3-client-desktop-session-stopmusiccommand-function-stopmusiccommand-commandstate-session-src-mq3-client-desktop-session-ml-962987612"></a>
### stopMusicCommand

```ml
function stopMusicCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L202)

<a id="function-function-mq3-client-desktop-session-streamcommand-function-streamcommand-commandstate-session-src-mq3-client-desktop-session-ml-1821891526"></a>
### streamCommand

```ml
function streamCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L207)

<a id="function-function-mq3-client-desktop-session-videocommand-function-videocommand-commandstate-session-src-mq3-client-desktop-session-ml-1965584068"></a>
### videoCommand

```ml
function videoCommand(commandState, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L187)

<a id="function-function-mq3-client-desktop-session-writeconfig-function-writeconfig-host-name-contents-src-mq3-client-desktop-session-ml-1345337701"></a>
### writeConfig

```ml
function writeConfig(host, name, contents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/desktop_session.ml#L49)
