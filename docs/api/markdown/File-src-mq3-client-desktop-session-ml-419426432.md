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
- `std/fs.ml` as `fs` → `../../a7594a0c0299/MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-desktop-session-attach-function-attach-state-session-src-mq3-client-desktop-session-ml-1570430551"></a>
### attach

```ml
function attach(state, session)
```

Updates `session.persistence`, `session.notice`, `session.configLoaded`, `session.transitionCommands` and additional values during desktop session `attach`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context`. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.persistence`, `session.notice`, `session.configLoaded`, `session.transitionCommands` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L337)

<a id="function-function-mq3-client-desktop-session-bindingtext-function-bindingtext-host-src-mq3-client-desktop-session-ml-968649684"></a>
### bindingText

```ml
function bindingText(host)
```

Adapts `mq3.client.key_bindings_config.bindingText` to desktop session `bindingText`, returning its result for `host.bindingState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.bindingState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L98)

<a id="function-function-mq3-client-desktop-session-capture-function-capture-state-session-src-mq3-client-desktop-session-ml-1335512387"></a>
### capture

```ml
function capture(state, session)
```

Updates `session.settings`, `session.settings.userinfos`, `session.settings.userinfos[0]`, `session.restartCommands` and additional values during desktop session `capture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context.userinfos`, `state.context.cvars`, `state.context.commandState.buffer`. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.settings`, `session.settings.userinfos`, `session.settings.userinfos[0]`, `session.restartCommands` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L168)

<a id="function-function-mq3-client-desktop-session-cinematiccommand-function-cinematiccommand-commandstate-session-src-mq3-client-desktop-session-ml-67678756"></a>
### cinematicCommand

```ml
function cinematicCommand(commandState, session)
```

Updates `session.target`, `session.cinematicNext`, `session.action` during desktop session `cinematicCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context.cvars`. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.target`, `session.cinematicNext`, `session.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L243)

<a id="function-function-mq3-client-desktop-session-commandcvar-function-commandcvar-commandstate-name-src-mq3-client-desktop-session-ml-248160095"></a>
### commandCvar

```ml
function commandCvar(commandState, name)
```

Adapts `mq3.qcommon.cvar.variableString` to desktop session `commandCvar`, returning its result for `commandState.context.context.cvars, name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context.cvars`. |
| `name` | `dynamic` | — | Argument 2 of `mq3.qcommon.cvar.variableString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L110)

<a id="function-function-mq3-client-desktop-session-commandprint-function-commandprint-commandstate-text-src-mq3-client-desktop-session-ml-1995083625"></a>
### commandPrint

```ml
function commandPrint(commandState, text)
```

Adapts `mq3.engine.local_qvm_match.emitPrint` to desktop session `commandPrint`, returning its result for `commandState.context.context, text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context`. |
| `text` | `dynamic` | — | Argument 2 of `mq3.engine.local_qvm_match.emitPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L106)

- [mq3.client.desktop_session.ConfigHost](Type-mq3-client-desktop-session-confighost-891662542.md) — struct
<a id="function-function-mq3-client-desktop-session-configprint-function-configprint-host-text-src-mq3-client-desktop-session-ml-982196295"></a>
### configPrint

```ml
function configPrint(host, text)
```

Adapts `mq3.engine.local_qvm_match.emitPrint` to desktop session `configPrint`, returning its result for `host.context, text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context`. |
| `text` | `dynamic` | — | Argument 2 of `mq3.engine.local_qvm_match.emitPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L102)

<a id="function-function-mq3-client-desktop-session-create-function-create-dataroot-src-mq3-client-desktop-session-ml-950275258"></a>
### create

```ml
function create(dataRoot)
```

Creates a `mq3.client.desktop_session.Session` record. Assigns `dataRoot` from `dataRoot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dataRoot` | `dynamic` | — | Value used to initialize `Session.dataRoot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L92)

<a id="function-function-mq3-client-desktop-session-defercommandtail-function-defercommandtail-commandstate-src-mq3-client-desktop-session-ml-706785520"></a>
### deferCommandTail

```ml
function deferCommandTail(commandState)
```

Updates `commandState.wait` during desktop session `deferCommandTail`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `commandState.wait`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L190)

<a id="function-function-mq3-client-desktop-session-disconnectcommand-function-disconnectcommand-commandstate-session-src-mq3-client-desktop-session-ml-496682102"></a>
### disconnectCommand

```ml
function disconnectCommand(commandState, session)
```

Updates `session.action` during desktop session `disconnectCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Accepted for compatibility with `disconnectCommand`; the current implementation does not read it. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L235)

<a id="function-function-mq3-client-desktop-session-finishcinematic-function-finishcinematic-session-src-mq3-client-desktop-session-ml-959624354"></a>
### finishCinematic

```ml
function finishCinematic(session)
```

Updates `session.cinematicNext`, `session.action`, `session.transitionCommands` during desktop session `finishCinematic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.cinematicNext`, `session.action`, `session.transitionCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L252)

<a id="extern_function-extern-function-mq3-client-desktop-session-getcurrentprocessid-extern-function-getcurrentprocessid-from-kernel32-dll-returns-u32-src-mq3-client-desktop-session-ml-1598081936"></a>
### GetCurrentProcessId

```ml
extern function GetCurrentProcessId() from "kernel32.dll" returns u32
```

Reads the current Windows process identifier used to distinguish desktop-session temporary files. This binding is used by desktop session.


**Returns:** The unsigned identifier of the current process.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L23)

<a id="function-function-mq3-client-desktop-session-levelselectcommand-function-levelselectcommand-commandstate-session-src-mq3-client-desktop-session-ml-1786550228"></a>
### levelselectCommand

```ml
function levelselectCommand(commandState, session)
```

Updates `session.action` during desktop session `levelselectCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.game`. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L269)

<a id="function-function-mq3-client-desktop-session-mapcommand-function-mapcommand-commandstate-session-src-mq3-client-desktop-session-ml-908765304"></a>
### mapCommand

```ml
function mapCommand(commandState, session)
```

Updates `session.singlePlayer`, `session.action`, `session.mapName` during desktop session `mapCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context.archive`, `commandState.context.context.cvars`. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.singlePlayer`, `session.action`, `session.mapName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L198)

<a id="extern_function-extern-function-mq3-client-desktop-session-movefileexw-extern-function-movefileexw-existingpath-as-wstr-newpath-as-wstr-flags-as-u32-from-kernel32-dll-returns-bool-src-mq3-client-desktop-session-ml-599392846"></a>
### MoveFileExW

```ml
extern function MoveFileExW(existingPath as wstr, newPath as wstr, flags as u32) from "kernel32.dll" returns bool
```

Moves or replaces a file through the Unicode Windows API for desktop-session persistence. This binding is used by desktop session.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `existingPath` | `wstr` | — | NUL-terminated UTF-16 path of the existing temporary file to move. |
| `newPath` | `wstr` | — | NUL-terminated UTF-16 destination path for the persisted file. |
| `flags` | `u32` | — | Win32 MOVEFILE_* bit flags; the session writer passes replacement and write-through flags. |


**Returns:** True when the requested move succeeds; false when Windows reports failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L20)

<a id="function-function-mq3-client-desktop-session-musiccommand-function-musiccommand-commandstate-session-src-mq3-client-desktop-session-ml-1471545004"></a>
### musicCommand

```ml
function musicCommand(commandState, session)
```

Calls `mq3.qcommon.command_buffer.argc`, `mq3.qcommon.command_buffer.emit`, `mq3.qcommon.command_buffer.argv` and additional helpers from desktop session `musicCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context`. |
| `session` | `dynamic` | — | Accepted for compatibility with `musicCommand`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L307)

<a id="function-function-mq3-client-desktop-session-quitcommand-function-quitcommand-commandstate-session-src-mq3-client-desktop-session-ml-1230812920"></a>
### quitCommand

```ml
function quitCommand(commandState, session)
```

Updates `session.action` during desktop session `quitCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the desktop session helper calls. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L278)

<a id="function-function-mq3-client-desktop-session-readcommandfile-function-readcommandfile-commandstate-name-src-mq3-client-desktop-session-ml-179072883"></a>
### readCommandFile

```ml
function readCommandFile(commandState, name)
```

Calls `mq3.client.desktop_session.readConfig` from desktop session `readCommandFile`. The final path returns `readConfig(context,context.uiLanCacheHost.context.root,name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding desktop session resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L148)

<a id="function-function-mq3-client-desktop-session-readconfig-function-readconfig-context-root-name-src-mq3-client-desktop-session-ml-934784658"></a>
### readConfig

```ml
function readConfig(context, root, name)
```

Calls `mq3.engine.local_qvm_match.desktopFilePath`, `std.string.endsWith`, `std.string.toLowerAscii` and additional helpers from desktop session `readConfig`. The final path returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.archive`. |
| `root` | `dynamic` | — | Value used by `path=match.desktopFilePath(root,name)`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding desktop session resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L132)

<a id="function-function-mq3-client-desktop-session-requestedgame-function-requestedgame-commandstate-src-mq3-client-desktop-session-ml-471365860"></a>
### requestedGame

```ml
function requestedGame(commandState)
```

Calls `mq3.qcommon.cvar.find` from desktop session `requestedGame`. The final path returns `value.string`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context.cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L281)

<a id="function-function-mq3-client-desktop-session-restartcommand-function-restartcommand-commandstate-session-src-mq3-client-desktop-session-ml-1136544464"></a>
### restartCommand

```ml
function restartCommand(commandState, session)
```

Updates `session.action` during desktop session `restartCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.game`. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L227)

<a id="function-function-mq3-client-desktop-session-restartfilesystem-function-restartfilesystem-commandstate-session-src-mq3-client-desktop-session-ml-1153999100"></a>
### restartFilesystem

```ml
function restartFilesystem(commandState, session)
```

Updates `session.requestedGame`, `session.action` during desktop session `restartFilesystem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the desktop session helper calls. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.requestedGame`, `session.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L289)

<a id="function-function-mq3-client-desktop-session-save-function-save-state-session-src-mq3-client-desktop-session-ml-742197919"></a>
### save

```ml
function save(state, session)
```

Updates `session.savedBindings` during desktop session `save`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context`. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.savedBindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L156)

- [mq3.client.desktop_session.Session](Type-mq3-client-desktop-session-session-82414742.md) — struct
<a id="function-function-mq3-client-desktop-session-stopmusiccommand-function-stopmusiccommand-commandstate-session-src-mq3-client-desktop-session-ml-962987612"></a>
### stopMusicCommand

```ml
function stopMusicCommand(commandState, session)
```

Calls `mq3.engine.local_qvm_match.uiStopMusic` from desktop session `stopMusicCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record read through `commandState.context.context`. |
| `session` | `dynamic` | — | Accepted for compatibility with `stopMusicCommand`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L318)

<a id="function-function-mq3-client-desktop-session-streamcommand-function-streamcommand-commandstate-session-src-mq3-client-desktop-session-ml-1821891526"></a>
### streamCommand

```ml
function streamCommand(commandState, session)
```

Updates `session.target`, `session.action` during desktop session `streamCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the desktop session helper calls. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.target`, `session.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L326)

<a id="function-function-mq3-client-desktop-session-videocommand-function-videocommand-commandstate-session-src-mq3-client-desktop-session-ml-1965584068"></a>
### videoCommand

```ml
function videoCommand(commandState, session)
```

Updates `session.videoRestart` during desktop session `videoCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the desktop session helper calls. |
| `session` | `dynamic` | — | Mutable desktop session record/storage; this routine assigns `session.videoRestart`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L297)

<a id="function-function-mq3-client-desktop-session-writeconfig-function-writeconfig-host-name-contents-src-mq3-client-desktop-session-ml-1345337701"></a>
### writeConfig

```ml
function writeConfig(host, name, contents)
```

Calls `mq3.engine.local_qvm_match.desktopFilePath`, `std.string.endsWith`, `std.string.toLowerAscii` and additional helpers from desktop session `writeConfig`. The final path returns `replaced`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.dataRoot`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding desktop session resource. |
| `contents` | `dynamic` | — | Value used by `written=try(fs.writeAllText(temporary,contents))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/desktop_session.ml#L116)
