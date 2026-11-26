# `src/mq3/qcommon/command_buffer.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.command_buffer`](Package-mq3-qcommon-command-buffer-395713574.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-qcommon-command-buffer-addcommand-function-addcommand-state-name-callback-src-mq3-qcommon-command-buffer-ml-1084695095"></a>
### addCommand

```ml
function addCommand(state, name, callback)
```

Add command in qcommon.command_buffer; the normal completion returns `true`.

Direct state writes: `state.functions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `functions`. Updated in place: `functions`. |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.qcommon.command_buffer.Command` record. |
| `callback` | `dynamic` | — | Initial `callback` field stored in the returned or constructed `mq3.qcommon.command_buffer.Command` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L273)

<a id="function-function-mq3-qcommon-command-buffer-addcontextcommand-function-addcontextcommand-state-name-callback-context-src-mq3-qcommon-command-buffer-ml-797499422"></a>
### addContextCommand

```ml
function addContextCommand(state, name, callback, context)
```

Context-bearing registrations keep subsystem state out of the global command state while leaving the original Cmd_AddCommand surface unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `functions`. Updated in place: `functions`. |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.qcommon.command_buffer.Command` record. |
| `callback` | `dynamic` | — | Initial `contextCallback` field stored in the returned or constructed `mq3.qcommon.command_buffer.Command` record. |
| `context` | `dynamic` | — | Initial `callbackContext` field stored in the returned or constructed `mq3.qcommon.command_buffer.Command` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L289)

<a id="function-function-mq3-qcommon-command-buffer-addtext-function-addtext-state-text-src-mq3-qcommon-command-buffer-ml-667800362"></a>
### addText

```ml
function addText(state, text)
```

Add text in qcommon.command_buffer; the normal completion returns `true`.

Direct state writes: `state.buffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `buffer`. Updated in place: `buffer`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.visibleBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L181)

<a id="function-function-mq3-qcommon-command-buffer-argc-function-argc-state-src-mq3-qcommon-command-buffer-ml-585140731"></a>
### argc

```ml
function argc(state)
```

Return `len(state.argv)` from `qcommon.command_buffer.argc`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `argv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L139)

<a id="function-function-mq3-qcommon-command-buffer-args-function-args-state-src-mq3-qcommon-command-buffer-ml-519524251"></a>
### args

```ml
function args(state)
```

Return `mq3.qcommon.command_buffer.argsFrom(state, 1)` from `qcommon.command_buffer.args`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argsFrom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L167)

<a id="function-function-mq3-qcommon-command-buffer-argsbuffer-function-argsbuffer-state-capacity-src-mq3-qcommon-command-buffer-ml-1478842727"></a>
### argsBuffer

```ml
function argsBuffer(state, capacity)
```

Return `mq3.qcommon.command_buffer.copyString(args(state), capacity)` from `qcommon.command_buffer.argsBuffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.args`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.command_buffer.copyString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L171)

<a id="function-function-mq3-qcommon-command-buffer-argsfrom-function-argsfrom-state-start-src-mq3-qcommon-command-buffer-ml-1913383473"></a>
### argsFrom

```ml
function argsFrom(state, start)
```

Compute args from in qcommon.command_buffer; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `argv`. |
| `start` | `dynamic` | — | Start used in `(start < 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L155)

<a id="function-function-mq3-qcommon-command-buffer-argv-function-argv-state-index-src-mq3-qcommon-command-buffer-ml-210535289"></a>
### argv

```ml
function argv(state, index)
```

Compute argv in qcommon.command_buffer; the normal completion returns `state.argv[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `argv`. |
| `index` | `dynamic` | — | Zero-based index into `state.argv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L143)

<a id="function-function-mq3-qcommon-command-buffer-argvbuffer-function-argvbuffer-state-index-capacity-src-mq3-qcommon-command-buffer-ml-1880629193"></a>
### argvBuffer

```ml
function argvBuffer(state, index, capacity)
```

Return `mq3.qcommon.command_buffer.copyString(argv(state, index), capacity)` from `qcommon.command_buffer.argvBuffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argv`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.qcommon.command_buffer.argv`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.command_buffer.copyString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L151)

<a id="extern_function-extern-function-mq3-qcommon-command-buffer-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-qcommon-command-buffer-ml-1807021276"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Convert a C-string signed decimal integer prefix for qcommon.command_buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | Null-terminated narrow numeric text accepted by the C runtime. |


**Returns:** The converted signed integer; zero when no number is recognized.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L490)

<a id="constant-constant-mq3-qcommon-command-buffer-big-info-string-const-big-info-string-8192-src-mq3-qcommon-command-buffer-ml-358108251"></a>
### BIG_INFO_STRING

```ml
const BIG_INFO_STRING = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L13)

<a id="function-function-mq3-qcommon-command-buffer-cmd-function-cmd-state-src-mq3-qcommon-command-buffer-ml-665010827"></a>
### cmd

```ml
function cmd(state)
```

Compute qcommon.command_buffer.cmd as `state.command`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `command`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L174)

- [mq3.qcommon.command_buffer.Command](Type-mq3-qcommon-command-buffer-command-13006865.md) — struct
<a id="function-function-mq3-qcommon-command-buffer-commandcompletion-function-commandcompletion-state-callback-src-mq3-qcommon-command-buffer-ml-566418760"></a>
### commandCompletion

```ml
function commandCompletion(state, callback)
```

Compute command completion in qcommon.command_buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `functions`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L315)

<a id="function-function-mq3-qcommon-command-buffer-containsinsensitive-function-containsinsensitive-name-part-start-src-mq3-qcommon-command-buffer-ml-1987573522"></a>
### containsInsensitive

```ml
function containsInsensitive(name, part, start)
```

Test insensitive in qcommon.command_buffer; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |
| `part` | `dynamic` | — | Part used in `bytes(part)`. |
| `start` | `dynamic` | — | Start used in `(start + 1)` and `(start + index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L341)

<a id="function-function-mq3-qcommon-command-buffer-copystring-function-copystring-text-capacity-src-mq3-qcommon-command-buffer-ml-591818733"></a>
### copyString

```ml
function copyString(text, capacity)
```

Copy string in qcommon.command_buffer; the normal completion returns `decode(slice(data, 0, length))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.visibleBytes`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity < 1)` and `(capacity - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L65)

<a id="function-function-mq3-qcommon-command-buffer-create-function-create-src-mq3-qcommon-command-buffer-ml-1604661332"></a>
### create

```ml
function create()
```

Create `mq3.qcommon.command_buffer.State` with buffer=""; argv=[]; command=""; wait=0; 16 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L48)

<a id="function-function-mq3-qcommon-command-buffer-defaultextension-function-defaultextension-path-extension-src-mq3-qcommon-command-buffer-ml-1853616096"></a>
### defaultExtension

```ml
function defaultExtension(path, extension)
```

Compute default extension in qcommon.command_buffer; the normal completion returns `(path + extension)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path used in `bytes(path)` and `(path + extension)`. |
| `extension` | `dynamic` | — | Extension used in `(path + extension)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L400)

<a id="function-function-mq3-qcommon-command-buffer-echocommand-function-echocommand-state-src-mq3-qcommon-command-buffer-ml-590338919"></a>
### echoCommand

```ml
function echoCommand(state)
```

Compute echo command in qcommon.command_buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L434)

<a id="function-function-mq3-qcommon-command-buffer-emit-function-emit-state-message-src-mq3-qcommon-command-buffer-ml-1400490004"></a>
### emit

```ml
function emit(state, message)
```

Emit command buffer in qcommon.command_buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `printFn`. |
| `message` | `dynamic` | — | Message used in `state.printFn(state, message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L75)

<a id="constant-constant-mq3-qcommon-command-buffer-exec-append-const-exec-append-2-src-mq3-qcommon-command-buffer-ml-1882959929"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L8)

<a id="constant-constant-mq3-qcommon-command-buffer-exec-insert-const-exec-insert-1-src-mq3-qcommon-command-buffer-ml-393893560"></a>
### EXEC_INSERT

```ml
const EXEC_INSERT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L7)

<a id="constant-constant-mq3-qcommon-command-buffer-exec-now-const-exec-now-0-src-mq3-qcommon-command-buffer-ml-56342201"></a>
### EXEC_NOW

```ml
const EXEC_NOW = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L6)

<a id="function-function-mq3-qcommon-command-buffer-execcommand-function-execcommand-state-src-mq3-qcommon-command-buffer-ml-606078423"></a>
### execCommand

```ml
function execCommand(state)
```

Compute exec command in qcommon.command_buffer.

Validation failures include `exec requires FS_ReadFile service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `readFileFn`, `freeFileFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L413)

<a id="function-function-mq3-qcommon-command-buffer-execute-function-execute-state-src-mq3-qcommon-command-buffer-ml-1021694185"></a>
### execute

```ml
function execute(state)
```

Execute command buffer in qcommon.command_buffer; updates `state.wait`, `state.buffer`.

Direct state writes: `state.wait`, `state.buffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `buffer`, `wait`. Updated in place: `wait`, `buffer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L214)

<a id="function-function-mq3-qcommon-command-buffer-executeline-function-executeline-state-line-src-mq3-qcommon-command-buffer-ml-842075219"></a>
### executeLine

```ml
function executeLine(state, line)
```

Execute line in qcommon.command_buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `executeFn`. |
| `line` | `dynamic` | — | Line used in `state.executeFn(state, line)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L205)

<a id="function-function-mq3-qcommon-command-buffer-executestring-function-executestring-state-text-src-mq3-qcommon-command-buffer-ml-855123162"></a>
### executeString

```ml
function executeString(state, text)
```

Execute string in qcommon.command_buffer; updates `state.functions`.

Direct state writes: `state.functions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `functions`, `cvarCommandFn`, `cvarContextCommandFn`, `cvarCommandContext`, `clientRunning`, `clientGameCommandFn`, `serverRunning` and further fields. Updated in place: `functions`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.tokenizeString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L455)

<a id="function-function-mq3-qcommon-command-buffer-executetext-function-executetext-state-when-text-src-mq3-qcommon-command-buffer-ml-349540358"></a>
### executeText

```ml
function executeText(state, when, text)
```

Execute text in qcommon.command_buffer; the normal completion returns `error(3511, "Cbuf_ExecuteText: bad exec_when")`.

Validation failures include `Cbuf_ExecuteText: bad exec_when`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.executeLine`. |
| `when` | `dynamic` | — | When used in `(when == EXEC_NOW)` and `(when == EXEC_INSERT)`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.visibleBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L243)

<a id="function-function-mq3-qcommon-command-buffer-filtername-function-filtername-pattern-name-src-mq3-qcommon-command-buffer-ml-402828895"></a>
### filterName

```ml
function filterName(pattern, name)
```

Case-insensitive Com_Filter subset used by Cmd_List_f, including Baseq3's *, ?, bracket ranges and doubled opening/closing bracket conventions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pattern` | `dynamic` | — | Pattern used in `bytes(pattern)`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.command_buffer.containsInsensitive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L359)

<a id="function-function-mq3-qcommon-command-buffer-initcommands-function-initcommands-state-src-mq3-qcommon-command-buffer-ml-1372419855"></a>
### initCommands

```ml
function initCommands(state)
```

Update `state.executeFn` in qcommon.command_buffer.

Direct state writes: `state.executeFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `executeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L481)

<a id="function-function-mq3-qcommon-command-buffer-inserttext-function-inserttext-state-text-src-mq3-qcommon-command-buffer-ml-50508242"></a>
### insertText

```ml
function insertText(state, text)
```

Update `state.buffer` in qcommon.command_buffer; the normal completion returns `true`.

Direct state writes: `state.buffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `buffer`. Updated in place: `buffer`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.visibleBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L194)

<a id="function-function-mq3-qcommon-command-buffer-isunquotedwhitespace-function-isunquotedwhitespace-value-src-mq3-qcommon-command-buffer-ml-359862731"></a>
### isUnquotedWhitespace

```ml
function isUnquotedWhitespace(value)
```

Compute qcommon.command_buffer.isUnquotedWhitespace as `((value <= 32) or (value >= 128))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value <= 32)` and `(value >= 128)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L82)

<a id="function-function-mq3-qcommon-command-buffer-listcommand-function-listcommand-state-src-mq3-qcommon-command-buffer-ml-1832446941"></a>
### listCommand

```ml
function listCommand(state)
```

Compute list command in qcommon.command_buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `functions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L441)

<a id="function-function-mq3-qcommon-command-buffer-lowerascii-function-lowerascii-value-src-mq3-qcommon-command-buffer-ml-633175467"></a>
### lowerAscii

```ml
function lowerAscii(value)
```

Compute lower ascii in qcommon.command_buffer; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value + 32)` and `(value >= 65)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L322)

<a id="constant-constant-mq3-qcommon-command-buffer-max-cmd-buffer-const-max-cmd-buffer-16384-src-mq3-qcommon-command-buffer-ml-232078153"></a>
### MAX_CMD_BUFFER

```ml
const MAX_CMD_BUFFER = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L9)

<a id="constant-constant-mq3-qcommon-command-buffer-max-cmd-line-const-max-cmd-line-1024-src-mq3-qcommon-command-buffer-ml-1845780034"></a>
### MAX_CMD_LINE

```ml
const MAX_CMD_LINE = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L10)

<a id="constant-constant-mq3-qcommon-command-buffer-max-string-chars-const-max-string-chars-1024-src-mq3-qcommon-command-buffer-ml-2141882602"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L12)

<a id="constant-constant-mq3-qcommon-command-buffer-max-string-tokens-const-max-string-tokens-1024-src-mq3-qcommon-command-buffer-ml-954706296"></a>
### MAX_STRING_TOKENS

```ml
const MAX_STRING_TOKENS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L11)

<a id="function-function-mq3-qcommon-command-buffer-removecommand-function-removecommand-state-name-src-mq3-qcommon-command-buffer-ml-1302124260"></a>
### removeCommand

```ml
function removeCommand(state, name)
```

Remove command in qcommon.command_buffer; the normal completion returns `found`.

Direct state writes: `state.functions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `functions`. Updated in place: `functions`. |
| `name` | `dynamic` | — | Name used in `(entry.name == name)` and `(not found and (entry.name == name))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L304)

<a id="function-function-mq3-qcommon-command-buffer-sameinsensitive-function-sameinsensitive-left-right-src-mq3-qcommon-command-buffer-ml-291042357"></a>
### sameInsensitive

```ml
function sameInsensitive(left, right)
```

Test same insensitive in qcommon.command_buffer; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `bytes(left)`. |
| `right` | `dynamic` | — | Right used in `bytes(right)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L329)

- [mq3.qcommon.command_buffer.State](Type-mq3-qcommon-command-buffer-state-1582591869.md) — struct
<a id="function-function-mq3-qcommon-command-buffer-tokenizestring-function-tokenizestring-state-text-src-mq3-qcommon-command-buffer-ml-1543350726"></a>
### tokenizeString

```ml
function tokenizeString(state, text)
```

Update `state.argv`, `state.command` in qcommon.command_buffer.

Direct state writes: `state.argv`, `state.command`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `argv`. Updated in place: `argv`, `command`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.copyString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L92)

<a id="function-function-mq3-qcommon-command-buffer-visiblebytes-function-visiblebytes-text-src-mq3-qcommon-command-buffer-ml-1602140573"></a>
### visibleBytes

```ml
function visibleBytes(text)
```

Compute visible bytes in qcommon.command_buffer; the normal completion returns `slice(data, 0, length)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L54)

<a id="function-function-mq3-qcommon-command-buffer-vstrcommand-function-vstrcommand-state-src-mq3-qcommon-command-buffer-ml-1517172703"></a>
### vstrCommand

```ml
function vstrCommand(state)
```

Compute vstr command in qcommon.command_buffer; the normal completion returns `insertText(state, (state.cvarStringFn(state, argv(state, 1)) + "\n"))`.

Validation failures include `vstr requires Cvar_VariableString service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cvarStringFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L427)

<a id="function-function-mq3-qcommon-command-buffer-waitcommand-function-waitcommand-state-src-mq3-qcommon-command-buffer-ml-699674359"></a>
### waitCommand

```ml
function waitCommand(state)
```

Update `state.wait` in qcommon.command_buffer.

Direct state writes: `state.wait`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `wait`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L257)
