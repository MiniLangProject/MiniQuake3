# `src/mq3/botlib/l_precomp.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.l_precomp`](Package-mq3-botlib-l-precomp-782970389.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/internal_headers.ml` as `botlibHeaders` → [src/mq3/botlib/internal_headers.ml](File-src-mq3-botlib-internal-headers-ml-282928546.md)
- `mq3/botlib/l_script.ml` as `lex` → [src/mq3/botlib/l_script.ml](File-src-mq3-botlib-l-script-ml-301363504.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.botlib.l_precomp.Action](Type-mq3-botlib-l-precomp-action-185725747.md) — struct
<a id="function-function-mq3-botlib-l-precomp-builtinfunction-function-builtinfunction-source-src-mq3-botlib-l-precomp-ml-1974481707"></a>
### BuiltinFunction

```ml
function BuiltinFunction(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L181)

<a id="function-function-mq3-botlib-l-precomp-conditional-function-conditional-source-name-src-mq3-botlib-l-precomp-ml-1384818596"></a>
### conditional

```ml
function conditional(source, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L146)

<a id="function-function-mq3-botlib-l-precomp-create-function-create-hostvalue-src-mq3-botlib-l-precomp-ml-982810109"></a>
### create

```ml
function create(hostValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hostValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L58)

<a id="constant-constant-mq3-botlib-l-precomp-definehashsize-const-definehashsize-1024-src-mq3-botlib-l-precomp-ml-1112293836"></a>
### DEFINEHASHSIZE

```ml
const DEFINEHASHSIZE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L14)

<a id="function-function-mq3-botlib-l-precomp-emit-function-emit-runtime-kind-message-file-line-src-mq3-botlib-l-precomp-ml-188888837"></a>
### emit

```ml
function emit(runtime, kind, message, file, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L62)

<a id="function-function-mq3-botlib-l-precomp-evaluationtoken-function-evaluationtoken-value-line-src-mq3-botlib-l-precomp-ml-138613411"></a>
### evaluationToken

```ml
function evaluationToken(value, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L170)

<a id="function-function-mq3-botlib-l-precomp-freesource-function-freesource-source-src-mq3-botlib-l-precomp-ml-662464501"></a>
### FreeSource

```ml
function FreeSource(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L202)

<a id="function-function-mq3-botlib-l-precomp-host-function-host-src-mq3-botlib-l-precomp-ml-491086870"></a>
### host

```ml
function host()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L50)

- [mq3.botlib.l_precomp.Indent](Type-mq3-botlib-l-precomp-indent-1435455151.md) — struct
<a id="constant-constant-mq3-botlib-l-precomp-indent-elif-const-indent-elif-botlibheaders-indent-elif-src-mq3-botlib-l-precomp-ml-122801658"></a>
### INDENT_ELIF

```ml
const INDENT_ELIF = botlibHeaders.INDENT_ELIF
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L17)

<a id="constant-constant-mq3-botlib-l-precomp-indent-else-const-indent-else-botlibheaders-indent-else-src-mq3-botlib-l-precomp-ml-40148137"></a>
### INDENT_ELSE

```ml
const INDENT_ELSE = botlibHeaders.INDENT_ELSE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L16)

<a id="constant-constant-mq3-botlib-l-precomp-indent-if-const-indent-if-botlibheaders-indent-if-src-mq3-botlib-l-precomp-ml-566218319"></a>
### INDENT_IF

```ml
const INDENT_IF = botlibHeaders.INDENT_IF
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L15)

<a id="constant-constant-mq3-botlib-l-precomp-indent-ifdef-const-indent-ifdef-botlibheaders-indent-ifdef-src-mq3-botlib-l-precomp-ml-931546662"></a>
### INDENT_IFDEF

```ml
const INDENT_IFDEF = botlibHeaders.INDENT_IFDEF
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L18)

<a id="constant-constant-mq3-botlib-l-precomp-indent-ifndef-const-indent-ifndef-botlibheaders-indent-ifndef-src-mq3-botlib-l-precomp-ml-505986978"></a>
### INDENT_IFNDEF

```ml
const INDENT_IFNDEF = botlibHeaders.INDENT_IFNDEF
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L19)

<a id="function-function-mq3-botlib-l-precomp-loadfile-function-loadfile-runtime-name-src-mq3-botlib-l-precomp-ml-544215985"></a>
### loadFile

```ml
function loadFile(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L51)

<a id="function-function-mq3-botlib-l-precomp-loadsourcefile-function-loadsourcefile-runtime-filename-src-mq3-botlib-l-precomp-ml-595721755"></a>
### LoadSourceFile

```ml
function LoadSourceFile(runtime, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L197)

<a id="function-function-mq3-botlib-l-precomp-loadsourcememory-function-loadsourcememory-runtime-ptr-length-name-src-mq3-botlib-l-precomp-ml-1126855829"></a>
### LoadSourceMemory

```ml
function LoadSourceMemory(runtime, ptr, length, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `ptr` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L198)

<a id="constant-constant-mq3-botlib-l-precomp-p-add-const-p-add-29-src-mq3-botlib-l-precomp-ml-1898125488"></a>
### P_ADD

```ml
const P_ADD = 29
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L32)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-and-const-p-bin-and-32-src-mq3-botlib-l-precomp-ml-58675216"></a>
### P_BIN_AND

```ml
const P_BIN_AND = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L34)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-not-const-p-bin-not-35-src-mq3-botlib-l-precomp-ml-1801733745"></a>
### P_BIN_NOT

```ml
const P_BIN_NOT = 35
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L37)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-or-const-p-bin-or-33-src-mq3-botlib-l-precomp-ml-257083993"></a>
### P_BIN_OR

```ml
const P_BIN_OR = 33
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L35)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-xor-const-p-bin-xor-34-src-mq3-botlib-l-precomp-ml-678454462"></a>
### P_BIN_XOR

```ml
const P_BIN_XOR = 34
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L36)

<a id="constant-constant-mq3-botlib-l-precomp-p-colon-const-p-colon-42-src-mq3-botlib-l-precomp-ml-1618822495"></a>
### P_COLON

```ml
const P_COLON = 42
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L41)

<a id="constant-constant-mq3-botlib-l-precomp-p-div-const-p-div-27-src-mq3-botlib-l-precomp-ml-1351286438"></a>
### P_DIV

```ml
const P_DIV = 27
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L30)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-and-const-p-logic-and-5-src-mq3-botlib-l-precomp-ml-2141998548"></a>
### P_LOGIC_AND

```ml
const P_LOGIC_AND = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L21)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-eq-const-p-logic-eq-9-src-mq3-botlib-l-precomp-ml-325752790"></a>
### P_LOGIC_EQ

```ml
const P_LOGIC_EQ = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L25)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-geq-const-p-logic-geq-7-src-mq3-botlib-l-precomp-ml-45413782"></a>
### P_LOGIC_GEQ

```ml
const P_LOGIC_GEQ = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L23)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-greater-const-p-logic-greater-37-src-mq3-botlib-l-precomp-ml-573343211"></a>
### P_LOGIC_GREATER

```ml
const P_LOGIC_GREATER = 37
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L39)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-leq-const-p-logic-leq-8-src-mq3-botlib-l-precomp-ml-779428787"></a>
### P_LOGIC_LEQ

```ml
const P_LOGIC_LEQ = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L24)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-less-const-p-logic-less-38-src-mq3-botlib-l-precomp-ml-690842234"></a>
### P_LOGIC_LESS

```ml
const P_LOGIC_LESS = 38
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L40)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-not-const-p-logic-not-36-src-mq3-botlib-l-precomp-ml-934649464"></a>
### P_LOGIC_NOT

```ml
const P_LOGIC_NOT = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L38)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-or-const-p-logic-or-6-src-mq3-botlib-l-precomp-ml-978992513"></a>
### P_LOGIC_OR

```ml
const P_LOGIC_OR = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L22)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-uneq-const-p-logic-uneq-10-src-mq3-botlib-l-precomp-ml-2139524964"></a>
### P_LOGIC_UNEQ

```ml
const P_LOGIC_UNEQ = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L26)

<a id="constant-constant-mq3-botlib-l-precomp-p-lshift-const-p-lshift-22-src-mq3-botlib-l-precomp-ml-1788157469"></a>
### P_LSHIFT

```ml
const P_LSHIFT = 22
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L28)

<a id="constant-constant-mq3-botlib-l-precomp-p-mod-const-p-mod-28-src-mq3-botlib-l-precomp-ml-318899299"></a>
### P_MOD

```ml
const P_MOD = 28
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L31)

<a id="constant-constant-mq3-botlib-l-precomp-p-mul-const-p-mul-26-src-mq3-botlib-l-precomp-ml-1161012953"></a>
### P_MUL

```ml
const P_MUL = 26
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L29)

<a id="constant-constant-mq3-botlib-l-precomp-p-questionmark-const-p-questionmark-43-src-mq3-botlib-l-precomp-ml-128035570"></a>
### P_QUESTIONMARK

```ml
const P_QUESTIONMARK = 43
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L42)

<a id="constant-constant-mq3-botlib-l-precomp-p-rshift-const-p-rshift-21-src-mq3-botlib-l-precomp-ml-1651692128"></a>
### P_RSHIFT

```ml
const P_RSHIFT = 21
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L27)

<a id="constant-constant-mq3-botlib-l-precomp-p-sub-const-p-sub-30-src-mq3-botlib-l-precomp-ml-495138546"></a>
### P_SUB

```ml
const P_SUB = 30
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L33)

<a id="function-function-mq3-botlib-l-precomp-pc-addbuiltindefines-function-pc-addbuiltindefines-source-src-mq3-botlib-l-precomp-ml-1230686869"></a>
### PC_AddBuiltinDefines

```ml
function PC_AddBuiltinDefines(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L110)

<a id="function-function-mq3-botlib-l-precomp-pc-adddefine-function-pc-adddefine-source-string-src-mq3-botlib-l-precomp-ml-1109965406"></a>
### PC_AddDefine

```ml
function PC_AddDefine(source, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L139)

<a id="function-function-mq3-botlib-l-precomp-pc-adddefinetohash-function-pc-adddefinetohash-define-table-src-mq3-botlib-l-precomp-ml-726146335"></a>
### PC_AddDefineToHash

```ml
function PC_AddDefineToHash(define, table)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `define` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L105)

<a id="function-function-mq3-botlib-l-precomp-pc-addglobaldefine-function-pc-addglobaldefine-runtime-string-src-mq3-botlib-l-precomp-ml-2057351111"></a>
### PC_AddGlobalDefine

```ml
function PC_AddGlobalDefine(runtime, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L140)

<a id="function-function-mq3-botlib-l-precomp-pc-addglobaldefinestosource-function-pc-addglobaldefinestosource-source-src-mq3-botlib-l-precomp-ml-155832497"></a>
### PC_AddGlobalDefinesToSource

```ml
function PC_AddGlobalDefinesToSource(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L144)

<a id="function-function-mq3-botlib-l-precomp-pc-checkopensourcehandles-function-pc-checkopensourcehandles-runtime-src-mq3-botlib-l-precomp-ml-886386404"></a>
### PC_CheckOpenSourceHandles

```ml
function PC_CheckOpenSourceHandles(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L208)

<a id="function-function-mq3-botlib-l-precomp-pc-checktokenstring-function-pc-checktokenstring-source-string-src-mq3-botlib-l-precomp-ml-356237902"></a>
### PC_CheckTokenString

```ml
function PC_CheckTokenString(source, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L188)

<a id="function-function-mq3-botlib-l-precomp-pc-checktokentype-function-pc-checktokentype-source-type-subtype-src-mq3-botlib-l-precomp-ml-425436489"></a>
### PC_CheckTokenType

```ml
function PC_CheckTokenType(source, type, subtype)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `subtype` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L189)

<a id="function-function-mq3-botlib-l-precomp-pc-cleartokenwhitespace-function-pc-cleartokenwhitespace-token-src-mq3-botlib-l-precomp-ml-677791641"></a>
### PC_ClearTokenWhiteSpace

```ml
function PC_ClearTokenWhiteSpace(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L127)

<a id="function-function-mq3-botlib-l-precomp-pc-convertpath-function-pc-convertpath-path-src-mq3-botlib-l-precomp-ml-336523103"></a>
### PC_ConvertPath

```ml
function PC_ConvertPath(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L119)

<a id="function-function-mq3-botlib-l-precomp-pc-copydefine-function-pc-copydefine-source-define-src-mq3-botlib-l-precomp-ml-1818228668"></a>
### PC_CopyDefine

```ml
function PC_CopyDefine(source, define)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `define` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L143)

<a id="function-function-mq3-botlib-l-precomp-pc-copytoken-function-pc-copytoken-token-src-mq3-botlib-l-precomp-ml-521308491"></a>
### PC_CopyToken

```ml
function PC_CopyToken(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L85)

<a id="function-function-mq3-botlib-l-precomp-pc-definefromstring-function-pc-definefromstring-runtime-string-src-mq3-botlib-l-precomp-ml-345690499"></a>
### PC_DefineFromString

```ml
function PC_DefineFromString(runtime, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L136)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-define-function-pc-directive-define-source-src-mq3-botlib-l-precomp-ml-482579091"></a>
### PC_Directive_define

```ml
function PC_Directive_define(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L133)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-elif-function-pc-directive-elif-source-src-mq3-botlib-l-precomp-ml-601915857"></a>
### PC_Directive_elif

```ml
function PC_Directive_elif(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L152)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-else-function-pc-directive-else-source-src-mq3-botlib-l-precomp-ml-704596055"></a>
### PC_Directive_else

```ml
function PC_Directive_else(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L150)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-endif-function-pc-directive-endif-source-src-mq3-botlib-l-precomp-ml-574170989"></a>
### PC_Directive_endif

```ml
function PC_Directive_endif(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L151)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-error-function-pc-directive-error-source-src-mq3-botlib-l-precomp-ml-2063725981"></a>
### PC_Directive_error

```ml
function PC_Directive_error(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L167)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-eval-function-pc-directive-eval-source-src-mq3-botlib-l-precomp-ml-1352067209"></a>
### PC_Directive_eval

```ml
function PC_Directive_eval(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L171)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-evalfloat-function-pc-directive-evalfloat-source-src-mq3-botlib-l-precomp-ml-1229592533"></a>
### PC_Directive_evalfloat

```ml
function PC_Directive_evalfloat(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L172)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-if-function-pc-directive-if-source-src-mq3-botlib-l-precomp-ml-897892395"></a>
### PC_Directive_if

```ml
function PC_Directive_if(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L153)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-if-def-function-pc-directive-if-def-source-type-src-mq3-botlib-l-precomp-ml-1636857003"></a>
### PC_Directive_if_def

```ml
function PC_Directive_if_def(source, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L147)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-ifdef-function-pc-directive-ifdef-source-src-mq3-botlib-l-precomp-ml-653448045"></a>
### PC_Directive_ifdef

```ml
function PC_Directive_ifdef(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L148)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-ifndef-function-pc-directive-ifndef-source-src-mq3-botlib-l-precomp-ml-1345296849"></a>
### PC_Directive_ifndef

```ml
function PC_Directive_ifndef(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L149)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-include-function-pc-directive-include-source-src-mq3-botlib-l-precomp-ml-1271732857"></a>
### PC_Directive_include

```ml
function PC_Directive_include(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L124)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-line-function-pc-directive-line-source-src-mq3-botlib-l-precomp-ml-1356765913"></a>
### PC_Directive_line

```ml
function PC_Directive_line(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L166)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-pragma-function-pc-directive-pragma-source-src-mq3-botlib-l-precomp-ml-758161237"></a>
### PC_Directive_pragma

```ml
function PC_Directive_pragma(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L168)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-undef-function-pc-directive-undef-source-src-mq3-botlib-l-precomp-ml-435144005"></a>
### PC_Directive_undef

```ml
function PC_Directive_undef(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L132)

<a id="function-function-mq3-botlib-l-precomp-pc-dollardirective-evalfloat-function-pc-dollardirective-evalfloat-source-src-mq3-botlib-l-precomp-ml-1919943909"></a>
### PC_DollarDirective_evalfloat

```ml
function PC_DollarDirective_evalfloat(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L179)

<a id="function-function-mq3-botlib-l-precomp-pc-dollardirective-evalint-function-pc-dollardirective-evalint-source-src-mq3-botlib-l-precomp-ml-1711447541"></a>
### PC_DollarDirective_evalint

```ml
function PC_DollarDirective_evalint(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L178)

<a id="function-function-mq3-botlib-l-precomp-pc-dollarevaluate-function-pc-dollarevaluate-source-intvalue-floatvalue-integer-src-mq3-botlib-l-precomp-ml-194008348"></a>
### PC_DollarEvaluate

```ml
function PC_DollarEvaluate(source, intvalue, floatvalue, integer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `intvalue` | `dynamic` | — |  |
| `floatvalue` | `dynamic` | — |  |
| `integer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L165)

<a id="function-function-mq3-botlib-l-precomp-pc-evaluate-function-pc-evaluate-source-intvalue-floatvalue-integer-src-mq3-botlib-l-precomp-ml-795021796"></a>
### PC_Evaluate

```ml
function PC_Evaluate(source, intvalue, floatvalue, integer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `intvalue` | `dynamic` | — |  |
| `floatvalue` | `dynamic` | — |  |
| `integer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L164)

<a id="function-function-mq3-botlib-l-precomp-pc-evaluatetokens-function-pc-evaluatetokens-source-tokens-intvalue-floatvalue-integer-src-mq3-botlib-l-precomp-ml-2056604682"></a>
### PC_EvaluateTokens

```ml
function PC_EvaluateTokens(source, tokens, intvalue, floatvalue, integer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `intvalue` | `dynamic` | — |  |
| `floatvalue` | `dynamic` | — |  |
| `integer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L161)

<a id="function-function-mq3-botlib-l-precomp-pc-expandbuiltindefine-function-pc-expandbuiltindefine-source-deftoken-definetoken-src-mq3-botlib-l-precomp-ml-1953953777"></a>
### PC_ExpandBuiltinDefine

```ml
function PC_ExpandBuiltinDefine(source, deftoken, defineToken)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `deftoken` | `dynamic` | — |  |
| `defineToken` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L111)

<a id="function-function-mq3-botlib-l-precomp-pc-expanddefine-function-pc-expanddefine-source-deftoken-define-parms-src-mq3-botlib-l-precomp-ml-1196267901"></a>
### PC_ExpandDefine

```ml
function PC_ExpandDefine(source, deftoken, define, parms)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `deftoken` | `dynamic` | — |  |
| `define` | `dynamic` | — |  |
| `parms` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L114)

<a id="function-function-mq3-botlib-l-precomp-pc-expanddefineintosource-function-pc-expanddefineintosource-source-deftoken-define-src-mq3-botlib-l-precomp-ml-1393577576"></a>
### PC_ExpandDefineIntoSource

```ml
function PC_ExpandDefineIntoSource(source, deftoken, define)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `deftoken` | `dynamic` | — |  |
| `define` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L115)

<a id="function-function-mq3-botlib-l-precomp-pc-expectanytoken-function-pc-expectanytoken-source-src-mq3-botlib-l-precomp-ml-1121601653"></a>
### PC_ExpectAnyToken

```ml
function PC_ExpectAnyToken(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L187)

<a id="function-function-mq3-botlib-l-precomp-pc-expecttokenstring-function-pc-expecttokenstring-source-string-src-mq3-botlib-l-precomp-ml-1773049910"></a>
### PC_ExpectTokenString

```ml
function PC_ExpectTokenString(source, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L185)

<a id="function-function-mq3-botlib-l-precomp-pc-expecttokentype-function-pc-expecttokentype-source-type-subtype-src-mq3-botlib-l-precomp-ml-1915784663"></a>
### PC_ExpectTokenType

```ml
function PC_ExpectTokenType(source, type, subtype)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `subtype` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L186)

<a id="function-function-mq3-botlib-l-precomp-pc-finddefine-function-pc-finddefine-defines-name-src-mq3-botlib-l-precomp-ml-810853257"></a>
### PC_FindDefine

```ml
function PC_FindDefine(defines, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `defines` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L107)

<a id="function-function-mq3-botlib-l-precomp-pc-finddefineparm-function-pc-finddefineparm-define-name-src-mq3-botlib-l-precomp-ml-269525262"></a>
### PC_FindDefineParm

```ml
function PC_FindDefineParm(define, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `define` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L108)

<a id="function-function-mq3-botlib-l-precomp-pc-findhasheddefine-function-pc-findhasheddefine-table-name-src-mq3-botlib-l-precomp-ml-215529891"></a>
### PC_FindHashedDefine

```ml
function PC_FindHashedDefine(table, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L106)

<a id="function-function-mq3-botlib-l-precomp-pc-freedefine-function-pc-freedefine-define-src-mq3-botlib-l-precomp-ml-1833996301"></a>
### PC_FreeDefine

```ml
function PC_FreeDefine(define)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `define` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L109)

<a id="function-function-mq3-botlib-l-precomp-pc-freesourcehandle-function-pc-freesourcehandle-runtime-handle-src-mq3-botlib-l-precomp-ml-1451579128"></a>
### PC_FreeSourceHandle

```ml
function PC_FreeSourceHandle(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L204)

<a id="function-function-mq3-botlib-l-precomp-pc-freetoken-function-pc-freetoken-token-src-mq3-botlib-l-precomp-ml-546652551"></a>
### PC_FreeToken

```ml
function PC_FreeToken(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L86)

<a id="function-function-mq3-botlib-l-precomp-pc-inittokenheap-function-pc-inittokenheap-runtime-src-mq3-botlib-l-precomp-ml-512567352"></a>
### PC_InitTokenHeap

```ml
function PC_InitTokenHeap(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L84)

<a id="function-function-mq3-botlib-l-precomp-pc-lexerview-function-pc-lexerview-source-src-mq3-botlib-l-precomp-ml-1821999365"></a>
### PC_LexerView

```ml
function PC_LexerView(source)
```

Expose the original l_script API over the active preprocessor input without copying its cursor or line state. This is used by native botlib readers that sit below l_precomp in the original engine.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L71)

<a id="function-function-mq3-botlib-l-precomp-pc-loadsourcehandle-function-pc-loadsourcehandle-runtime-filename-src-mq3-botlib-l-precomp-ml-1311409557"></a>
### PC_LoadSourceHandle

```ml
function PC_LoadSourceHandle(runtime, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L203)

<a id="function-function-mq3-botlib-l-precomp-pc-mergetokens-function-pc-mergetokens-t1-t2-src-mq3-botlib-l-precomp-ml-194123881"></a>
### PC_MergeTokens

```ml
function PC_MergeTokens(t1, t2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `t1` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L98)

<a id="function-function-mq3-botlib-l-precomp-pc-namehash-function-pc-namehash-name-src-mq3-botlib-l-precomp-ml-1400024389"></a>
### PC_NameHash

```ml
function PC_NameHash(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L102)

<a id="function-function-mq3-botlib-l-precomp-pc-operatorpriority-function-pc-operatorpriority-op-src-mq3-botlib-l-precomp-ml-1803541375"></a>
### PC_OperatorPriority

```ml
function PC_OperatorPriority(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L155)

<a id="function-function-mq3-botlib-l-precomp-pc-popindent-function-pc-popindent-source-typeout-skipout-src-mq3-botlib-l-precomp-ml-894166102"></a>
### PC_PopIndent

```ml
function PC_PopIndent(source, typeOut, skipOut)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `typeOut` | `dynamic` | — |  |
| `skipOut` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L79)

<a id="function-function-mq3-botlib-l-precomp-pc-printdefine-function-pc-printdefine-runtime-define-src-mq3-botlib-l-precomp-ml-1151299697"></a>
### PC_PrintDefine

```ml
function PC_PrintDefine(runtime, define)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `define` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L99)

<a id="function-function-mq3-botlib-l-precomp-pc-printdefinehashtable-function-pc-printdefinehashtable-runtime-table-src-mq3-botlib-l-precomp-ml-1711442026"></a>
### PC_PrintDefineHashTable

```ml
function PC_PrintDefineHashTable(runtime, table)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L100)

<a id="function-function-mq3-botlib-l-precomp-pc-pushindent-function-pc-pushindent-source-type-skip-src-mq3-botlib-l-precomp-ml-44671764"></a>
### PC_PushIndent

```ml
function PC_PushIndent(source, type, skip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `skip` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L78)

<a id="function-function-mq3-botlib-l-precomp-pc-pushscript-function-pc-pushscript-source-script-src-mq3-botlib-l-precomp-ml-11173494"></a>
### PC_PushScript

```ml
function PC_PushScript(source, script)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `script` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L83)

<a id="function-function-mq3-botlib-l-precomp-pc-readdefineparms-function-pc-readdefineparms-source-define-maxparms-src-mq3-botlib-l-precomp-ml-677087143"></a>
### PC_ReadDefineParms

```ml
function PC_ReadDefineParms(source, define, maxparms)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `define` | `dynamic` | — |  |
| `maxparms` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L92)

<a id="function-function-mq3-botlib-l-precomp-pc-readdirective-function-pc-readdirective-source-name-src-mq3-botlib-l-precomp-ml-37531448"></a>
### PC_ReadDirective

```ml
function PC_ReadDirective(source, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L174)

<a id="function-function-mq3-botlib-l-precomp-pc-readdollardirective-function-pc-readdollardirective-source-name-src-mq3-botlib-l-precomp-ml-597513144"></a>
### PC_ReadDollarDirective

```ml
function PC_ReadDollarDirective(source, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L180)

<a id="function-function-mq3-botlib-l-precomp-pc-readline-function-pc-readline-source-src-mq3-botlib-l-precomp-ml-1807120221"></a>
### PC_ReadLine

```ml
function PC_ReadLine(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L125)

<a id="function-function-mq3-botlib-l-precomp-pc-readsourcetoken-function-pc-readsourcetoken-source-src-mq3-botlib-l-precomp-ml-52157697"></a>
### PC_ReadSourceToken

```ml
function PC_ReadSourceToken(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L88)

<a id="function-function-mq3-botlib-l-precomp-pc-readtoken-function-pc-readtoken-source-src-mq3-botlib-l-precomp-ml-916704065"></a>
### PC_ReadToken

```ml
function PC_ReadToken(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L184)

<a id="function-function-mq3-botlib-l-precomp-pc-readtokenhandle-function-pc-readtokenhandle-runtime-handle-src-mq3-botlib-l-precomp-ml-178435078"></a>
### PC_ReadTokenHandle

```ml
function PC_ReadTokenHandle(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L205)

<a id="function-function-mq3-botlib-l-precomp-pc-removeallglobaldefines-function-pc-removeallglobaldefines-runtime-src-mq3-botlib-l-precomp-ml-963521012"></a>
### PC_RemoveAllGlobalDefines

```ml
function PC_RemoveAllGlobalDefines(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L142)

<a id="function-function-mq3-botlib-l-precomp-pc-removeglobaldefine-function-pc-removeglobaldefine-runtime-name-src-mq3-botlib-l-precomp-ml-440668561"></a>
### PC_RemoveGlobalDefine

```ml
function PC_RemoveGlobalDefine(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L141)

<a id="function-function-mq3-botlib-l-precomp-pc-setbasefolder-function-pc-setbasefolder-runtime-path-src-mq3-botlib-l-precomp-ml-670507609"></a>
### PC_SetBaseFolder

```ml
function PC_SetBaseFolder(runtime, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L207)

<a id="function-function-mq3-botlib-l-precomp-pc-setincludepath-function-pc-setincludepath-source-path-src-mq3-botlib-l-precomp-ml-858227262"></a>
### PC_SetIncludePath

```ml
function PC_SetIncludePath(source, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L193)

<a id="function-function-mq3-botlib-l-precomp-pc-setpunctuations-function-pc-setpunctuations-source-p-src-mq3-botlib-l-precomp-ml-1527365569"></a>
### PC_SetPunctuations

```ml
function PC_SetPunctuations(source, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L194)

<a id="function-function-mq3-botlib-l-precomp-pc-skipuntilstring-function-pc-skipuntilstring-source-string-src-mq3-botlib-l-precomp-ml-1548206342"></a>
### PC_SkipUntilString

```ml
function PC_SkipUntilString(source, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L190)

<a id="function-function-mq3-botlib-l-precomp-pc-sourcefileandline-function-pc-sourcefileandline-runtime-handle-src-mq3-botlib-l-precomp-ml-1438474762"></a>
### PC_SourceFileAndLine

```ml
function PC_SourceFileAndLine(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L206)

<a id="function-function-mq3-botlib-l-precomp-pc-stringizetokens-function-pc-stringizetokens-tokens-token-src-mq3-botlib-l-precomp-ml-337191813"></a>
### PC_StringizeTokens

```ml
function PC_StringizeTokens(tokens, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L97)

<a id="function-function-mq3-botlib-l-precomp-pc-unreadlasttoken-function-pc-unreadlasttoken-source-src-mq3-botlib-l-precomp-ml-1509287277"></a>
### PC_UnreadLastToken

```ml
function PC_UnreadLastToken(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L191)

<a id="function-function-mq3-botlib-l-precomp-pc-unreadsourcetoken-function-pc-unreadsourcetoken-source-token-src-mq3-botlib-l-precomp-ml-1048729814"></a>
### PC_UnreadSourceToken

```ml
function PC_UnreadSourceToken(source, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L91)

<a id="function-function-mq3-botlib-l-precomp-pc-unreadtoken-function-pc-unreadtoken-source-token-src-mq3-botlib-l-precomp-ml-1468847378"></a>
### PC_UnreadToken

```ml
function PC_UnreadToken(source, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L192)

<a id="function-function-mq3-botlib-l-precomp-pc-whitespacebeforetoken-function-pc-whitespacebeforetoken-token-src-mq3-botlib-l-precomp-ml-1239550391"></a>
### PC_WhiteSpaceBeforeToken

```ml
function PC_WhiteSpaceBeforeToken(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L126)

- [mq3.botlib.l_precomp.PrecompHost](Type-mq3-botlib-l-precomp-precomphost-125789787.md) — struct
<a id="function-function-mq3-botlib-l-precomp-quakecmacro-function-quakecmacro-source-src-mq3-botlib-l-precomp-ml-1535729641"></a>
### QuakeCMacro

```ml
function QuakeCMacro(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L182)

<a id="function-function-mq3-botlib-l-precomp-removedefine-function-removedefine-registry-name-src-mq3-botlib-l-precomp-ml-1629394094"></a>
### removeDefine

```ml
function removeDefine(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L129)

- [mq3.botlib.l_precomp.Runtime](Type-mq3-botlib-l-precomp-runtime-699338599.md) — struct
- [mq3.botlib.l_precomp.Source](Type-mq3-botlib-l-precomp-source-316817148.md) — struct
<a id="function-function-mq3-botlib-l-precomp-sourceentry-function-sourceentry-source-src-mq3-botlib-l-precomp-ml-1751890167"></a>
### sourceEntry

```ml
function sourceEntry(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L66)

<a id="function-function-mq3-botlib-l-precomp-sourceerror-function-sourceerror-source-message-src-mq3-botlib-l-precomp-ml-815717710"></a>
### SourceError

```ml
function SourceError(source, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L75)

<a id="function-function-mq3-botlib-l-precomp-sourcelocation-function-sourcelocation-source-src-mq3-botlib-l-precomp-ml-1729676237"></a>
### sourceLocation

```ml
function sourceLocation(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L67)

<a id="function-function-mq3-botlib-l-precomp-sourcewarning-function-sourcewarning-source-message-src-mq3-botlib-l-precomp-ml-1904249394"></a>
### SourceWarning

```ml
function SourceWarning(source, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L76)

<a id="function-function-mq3-botlib-l-precomp-unreadsigntoken-function-unreadsigntoken-source-src-mq3-botlib-l-precomp-ml-171946251"></a>
### UnreadSignToken

```ml
function UnreadSignToken(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L169)

<a id="function-function-mq3-botlib-l-precomp-wrap-function-wrap-runtime-handle-src-mq3-botlib-l-precomp-ml-992172462"></a>
### wrap

```ml
function wrap(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L196)
