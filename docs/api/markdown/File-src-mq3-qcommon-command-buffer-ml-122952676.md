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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L203)

<a id="function-function-mq3-qcommon-command-buffer-addcontextcommand-function-addcontextcommand-state-name-callback-context-src-mq3-qcommon-command-buffer-ml-797499422"></a>
### addContextCommand

```ml
function addContextCommand(state, name, callback, context)
```

Context-bearing registrations keep subsystem state out of the global command state while leaving the original Cmd_AddCommand surface unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L215)

<a id="function-function-mq3-qcommon-command-buffer-addtext-function-addtext-state-text-src-mq3-qcommon-command-buffer-ml-667800362"></a>
### addText

```ml
function addText(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L139)

<a id="function-function-mq3-qcommon-command-buffer-argc-function-argc-state-src-mq3-qcommon-command-buffer-ml-585140731"></a>
### argc

```ml
function argc(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L119)

<a id="function-function-mq3-qcommon-command-buffer-args-function-args-state-src-mq3-qcommon-command-buffer-ml-519524251"></a>
### args

```ml
function args(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L135)

<a id="function-function-mq3-qcommon-command-buffer-argsbuffer-function-argsbuffer-state-capacity-src-mq3-qcommon-command-buffer-ml-1478842727"></a>
### argsBuffer

```ml
function argsBuffer(state, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L136)

<a id="function-function-mq3-qcommon-command-buffer-argsfrom-function-argsfrom-state-start-src-mq3-qcommon-command-buffer-ml-1913383473"></a>
### argsFrom

```ml
function argsFrom(state, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L125)

<a id="function-function-mq3-qcommon-command-buffer-argv-function-argv-state-index-src-mq3-qcommon-command-buffer-ml-210535289"></a>
### argv

```ml
function argv(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L120)

<a id="function-function-mq3-qcommon-command-buffer-argvbuffer-function-argvbuffer-state-index-capacity-src-mq3-qcommon-command-buffer-ml-1880629193"></a>
### argvBuffer

```ml
function argvBuffer(state, index, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L124)

<a id="extern_function-extern-function-mq3-qcommon-command-buffer-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-qcommon-command-buffer-ml-1807021276"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L370)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L137)

- [mq3.qcommon.command_buffer.Command](Type-mq3-qcommon-command-buffer-command-13006865.md) — struct
<a id="function-function-mq3-qcommon-command-buffer-commandcompletion-function-commandcompletion-state-callback-src-mq3-qcommon-command-buffer-ml-566418760"></a>
### commandCompletion

```ml
function commandCompletion(state, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L233)

<a id="function-function-mq3-qcommon-command-buffer-containsinsensitive-function-containsinsensitive-name-part-start-src-mq3-qcommon-command-buffer-ml-1987573522"></a>
### containsInsensitive

```ml
function containsInsensitive(name, part, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L250)

<a id="function-function-mq3-qcommon-command-buffer-copystring-function-copystring-text-capacity-src-mq3-qcommon-command-buffer-ml-591818733"></a>
### copyString

```ml
function copyString(text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L57)

<a id="function-function-mq3-qcommon-command-buffer-create-function-create-src-mq3-qcommon-command-buffer-ml-1604661332"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L45)

<a id="function-function-mq3-qcommon-command-buffer-defaultextension-function-defaultextension-path-extension-src-mq3-qcommon-command-buffer-ml-1853616096"></a>
### defaultExtension

```ml
function defaultExtension(path, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L304)

<a id="function-function-mq3-qcommon-command-buffer-echocommand-function-echocommand-state-src-mq3-qcommon-command-buffer-ml-590338919"></a>
### echoCommand

```ml
function echoCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L328)

<a id="function-function-mq3-qcommon-command-buffer-emit-function-emit-state-message-src-mq3-qcommon-command-buffer-ml-1400490004"></a>
### emit

```ml
function emit(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L64)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L313)

<a id="function-function-mq3-qcommon-command-buffer-execute-function-execute-state-src-mq3-qcommon-command-buffer-ml-1021694185"></a>
### execute

```ml
function execute(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L160)

<a id="function-function-mq3-qcommon-command-buffer-executeline-function-executeline-state-line-src-mq3-qcommon-command-buffer-ml-842075219"></a>
### executeLine

```ml
function executeLine(state, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L155)

<a id="function-function-mq3-qcommon-command-buffer-executestring-function-executestring-state-text-src-mq3-qcommon-command-buffer-ml-855123162"></a>
### executeString

```ml
function executeString(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L342)

<a id="function-function-mq3-qcommon-command-buffer-executetext-function-executetext-state-when-text-src-mq3-qcommon-command-buffer-ml-349540358"></a>
### executeText

```ml
function executeText(state, when, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `when` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L183)

<a id="function-function-mq3-qcommon-command-buffer-filtername-function-filtername-pattern-name-src-mq3-qcommon-command-buffer-ml-402828895"></a>
### filterName

```ml
function filterName(pattern, name)
```

Case-insensitive Com_Filter subset used by Cmd_List_f, including Baseq3's *, ?, bracket ranges and doubled opening/closing bracket conventions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pattern` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L266)

<a id="function-function-mq3-qcommon-command-buffer-initcommands-function-initcommands-state-src-mq3-qcommon-command-buffer-ml-1372419855"></a>
### initCommands

```ml
function initCommands(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L364)

<a id="function-function-mq3-qcommon-command-buffer-inserttext-function-inserttext-state-text-src-mq3-qcommon-command-buffer-ml-50508242"></a>
### insertText

```ml
function insertText(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L147)

<a id="function-function-mq3-qcommon-command-buffer-isunquotedwhitespace-function-isunquotedwhitespace-value-src-mq3-qcommon-command-buffer-ml-359862731"></a>
### isUnquotedWhitespace

```ml
function isUnquotedWhitespace(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L69)

<a id="function-function-mq3-qcommon-command-buffer-listcommand-function-listcommand-state-src-mq3-qcommon-command-buffer-ml-1832446941"></a>
### listCommand

```ml
function listCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L333)

<a id="function-function-mq3-qcommon-command-buffer-lowerascii-function-lowerascii-value-src-mq3-qcommon-command-buffer-ml-633175467"></a>
### lowerAscii

```ml
function lowerAscii(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L238)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L225)

<a id="function-function-mq3-qcommon-command-buffer-sameinsensitive-function-sameinsensitive-left-right-src-mq3-qcommon-command-buffer-ml-291042357"></a>
### sameInsensitive

```ml
function sameInsensitive(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L242)

- [mq3.qcommon.command_buffer.State](Type-mq3-qcommon-command-buffer-state-1582591869.md) — struct
<a id="function-function-mq3-qcommon-command-buffer-tokenizestring-function-tokenizestring-state-text-src-mq3-qcommon-command-buffer-ml-1543350726"></a>
### tokenizeString

```ml
function tokenizeString(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L74)

<a id="function-function-mq3-qcommon-command-buffer-visiblebytes-function-visiblebytes-text-src-mq3-qcommon-command-buffer-ml-1602140573"></a>
### visibleBytes

```ml
function visibleBytes(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L49)

<a id="function-function-mq3-qcommon-command-buffer-vstrcommand-function-vstrcommand-state-src-mq3-qcommon-command-buffer-ml-1517172703"></a>
### vstrCommand

```ml
function vstrCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L323)

<a id="function-function-mq3-qcommon-command-buffer-waitcommand-function-waitcommand-state-src-mq3-qcommon-command-buffer-ml-699674359"></a>
### waitCommand

```ml
function waitCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/command_buffer.ml#L193)
