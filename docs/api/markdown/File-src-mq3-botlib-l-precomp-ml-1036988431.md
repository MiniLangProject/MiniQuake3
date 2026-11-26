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

Apply `mq3.botlib.l_precomp.PC_ReadSourceToken` and `mq3.botlib.l_precomp.PC_UnreadSourceToken` while evaluating `BuiltinFunction`. Return paths include `token.type==pc.TT_NUMBER`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `lastToken`. May update `source.lastToken` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L458)

<a id="function-function-mq3-botlib-l-precomp-conditional-function-conditional-source-name-src-mq3-botlib-l-precomp-ml-1384818596"></a>
### conditional

```ml
function conditional(source, name)
```

Apply `mq3.botlib.l_precomp.sourceEntry`, `mq3.botlib.l_precomp.sourceLocation` and `mq3.vm.pc_parser.conditionalDirective` while evaluating `conditional`. Return paths include `pc.conditionalDirective(source.runtime.registry,entry,name,where[1])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L363)

<a id="function-function-mq3-botlib-l-precomp-create-function-create-hostvalue-src-mq3-botlib-l-precomp-ml-982810109"></a>
### create

```ml
function create(hostValue)
```

Apply `mq3.vm.pc_parser.create` while evaluating `create`. Return paths include `runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hostValue` | `dynamic` | — | Host value record; accesses `loadFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L150)

<a id="constant-constant-mq3-botlib-l-precomp-definehashsize-const-definehashsize-1024-src-mq3-botlib-l-precomp-ml-1112293836"></a>
### DEFINEHASHSIZE

```ml
const DEFINEHASHSIZE = 1024
```

Number of hash buckets used for preprocessor definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L15)

<a id="function-function-mq3-botlib-l-precomp-emit-function-emit-runtime-kind-message-file-line-src-mq3-botlib-l-precomp-ml-188888837"></a>
### emit

```ml
function emit(runtime, kind, message, file, line)
```

Set `runtime.actions` to `runtime.actions+[value]` in `mq3.botlib.l_precomp.emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `retailActive`, `actions` and `host`. May update `runtime.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.botlib.l_precomp.Action.kind`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `file` | `dynamic` | — | Source filename attached to the diagnostic. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L160)

<a id="function-function-mq3-botlib-l-precomp-evaluationtoken-function-evaluationtoken-value-line-src-mq3-botlib-l-precomp-ml-138613411"></a>
### evaluationToken

```ml
function evaluationToken(value, line)
```

Create a `mq3.vm.pc_parser.Token` record, initializing `type` as `pc.TT_NUMBER`, `subtype` as `pc.TT_DECIMAL|pc.TT_INTEGER` and `intValue` from `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Initial value stored in `mq3.vm.pc_parser.Token.intValue`. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L431)

<a id="function-function-mq3-botlib-l-precomp-freesource-function-freesource-source-src-mq3-botlib-l-precomp-ml-662464501"></a>
### FreeSource

```ml
function FreeSource(source)
```

Apply `mq3.vm.pc_parser.free` while evaluating `FreeSource`. Return paths include `pc.free(source.runtime.registry,source.handle)!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L526)

<a id="function-function-mq3-botlib-l-precomp-host-function-host-src-mq3-botlib-l-precomp-ml-491086870"></a>
### host

```ml
function host()
```

Create a `mq3.botlib.l_precomp.PrecompHost` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L137)

- [mq3.botlib.l_precomp.Indent](Type-mq3-botlib-l-precomp-indent-1435455151.md) — struct
<a id="constant-constant-mq3-botlib-l-precomp-indent-elif-const-indent-elif-botlibheaders-indent-elif-src-mq3-botlib-l-precomp-ml-122801658"></a>
### INDENT_ELIF

```ml
const INDENT_ELIF = botlibHeaders.INDENT_ELIF
```

Preprocessor nesting-kind identifier for elif.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L21)

<a id="constant-constant-mq3-botlib-l-precomp-indent-else-const-indent-else-botlibheaders-indent-else-src-mq3-botlib-l-precomp-ml-40148137"></a>
### INDENT_ELSE

```ml
const INDENT_ELSE = botlibHeaders.INDENT_ELSE
```

Preprocessor nesting-kind identifier for else.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L19)

<a id="constant-constant-mq3-botlib-l-precomp-indent-if-const-indent-if-botlibheaders-indent-if-src-mq3-botlib-l-precomp-ml-566218319"></a>
### INDENT_IF

```ml
const INDENT_IF = botlibHeaders.INDENT_IF
```

Preprocessor nesting-kind identifier for if.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L17)

<a id="constant-constant-mq3-botlib-l-precomp-indent-ifdef-const-indent-ifdef-botlibheaders-indent-ifdef-src-mq3-botlib-l-precomp-ml-931546662"></a>
### INDENT_IFDEF

```ml
const INDENT_IFDEF = botlibHeaders.INDENT_IFDEF
```

Preprocessor nesting-kind identifier for ifdef.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L23)

<a id="constant-constant-mq3-botlib-l-precomp-indent-ifndef-const-indent-ifndef-botlibheaders-indent-ifndef-src-mq3-botlib-l-precomp-ml-505986978"></a>
### INDENT_IFNDEF

```ml
const INDENT_IFNDEF = botlibHeaders.INDENT_IFNDEF
```

Preprocessor nesting-kind identifier for ifndef.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L25)

<a id="function-function-mq3-botlib-l-precomp-loadfile-function-loadfile-runtime-name-src-mq3-botlib-l-precomp-ml-544215985"></a>
### loadFile

```ml
function loadFile(runtime, name)
```

Load a normalized preprocessor path, trying the configured base folder before the original path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `baseFolder` and `host`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L141)

<a id="function-function-mq3-botlib-l-precomp-loadsourcefile-function-loadsourcefile-runtime-filename-src-mq3-botlib-l-precomp-ml-595721755"></a>
### LoadSourceFile

```ml
function LoadSourceFile(runtime, filename)
```

Forward `LoadSourceFile` to `mq3.botlib.l_precomp.wrap` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry` and `baseFolder`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L514)

<a id="function-function-mq3-botlib-l-precomp-loadsourcememory-function-loadsourcememory-runtime-ptr-length-name-src-mq3-botlib-l-precomp-ml-1126855829"></a>
### LoadSourceMemory

```ml
function LoadSourceMemory(runtime, ptr, length, name)
```

Set `runtime.registry.sources[slot]` to `[name,[pc.Source(name,data,0,1,0)],0,0]` in `mq3.botlib.l_precomp.LoadSourceMemory`. Return paths include `wrap(runtime,slot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry`. May update `runtime.registry.sources[slot]` in place. |
| `ptr` | `dynamic` | — | Value used by `LoadSourceMemory` in `data=ptr`. |
| `length` | `dynamic` | — | Value passed as argument 3 to `slice`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L520)

<a id="constant-constant-mq3-botlib-l-precomp-p-add-const-p-add-29-src-mq3-botlib-l-precomp-ml-1898125488"></a>
### P_ADD

```ml
const P_ADD = 29
```

Scanner punctuation identifier for `+`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L50)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-and-const-p-bin-and-32-src-mq3-botlib-l-precomp-ml-58675216"></a>
### P_BIN_AND

```ml
const P_BIN_AND = 32
```

Scanner punctuation identifier for `&`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L54)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-not-const-p-bin-not-35-src-mq3-botlib-l-precomp-ml-1801733745"></a>
### P_BIN_NOT

```ml
const P_BIN_NOT = 35
```

Scanner punctuation identifier for `~`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L60)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-or-const-p-bin-or-33-src-mq3-botlib-l-precomp-ml-257083993"></a>
### P_BIN_OR

```ml
const P_BIN_OR = 33
```

Scanner punctuation identifier for `|`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L56)

<a id="constant-constant-mq3-botlib-l-precomp-p-bin-xor-const-p-bin-xor-34-src-mq3-botlib-l-precomp-ml-678454462"></a>
### P_BIN_XOR

```ml
const P_BIN_XOR = 34
```

Scanner punctuation identifier for `^`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L58)

<a id="constant-constant-mq3-botlib-l-precomp-p-colon-const-p-colon-42-src-mq3-botlib-l-precomp-ml-1618822495"></a>
### P_COLON

```ml
const P_COLON = 42
```

Scanner punctuation identifier for `:`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L68)

<a id="constant-constant-mq3-botlib-l-precomp-p-div-const-p-div-27-src-mq3-botlib-l-precomp-ml-1351286438"></a>
### P_DIV

```ml
const P_DIV = 27
```

Scanner punctuation identifier for `/`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L46)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-and-const-p-logic-and-5-src-mq3-botlib-l-precomp-ml-2141998548"></a>
### P_LOGIC_AND

```ml
const P_LOGIC_AND = 5
```

Scanner punctuation identifier for `&&`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L28)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-eq-const-p-logic-eq-9-src-mq3-botlib-l-precomp-ml-325752790"></a>
### P_LOGIC_EQ

```ml
const P_LOGIC_EQ = 9
```

Scanner punctuation identifier for `==`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L36)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-geq-const-p-logic-geq-7-src-mq3-botlib-l-precomp-ml-45413782"></a>
### P_LOGIC_GEQ

```ml
const P_LOGIC_GEQ = 7
```

Scanner punctuation identifier for `>=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L32)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-greater-const-p-logic-greater-37-src-mq3-botlib-l-precomp-ml-573343211"></a>
### P_LOGIC_GREATER

```ml
const P_LOGIC_GREATER = 37
```

Scanner punctuation identifier for `>`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L64)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-leq-const-p-logic-leq-8-src-mq3-botlib-l-precomp-ml-779428787"></a>
### P_LOGIC_LEQ

```ml
const P_LOGIC_LEQ = 8
```

Scanner punctuation identifier for `<=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L34)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-less-const-p-logic-less-38-src-mq3-botlib-l-precomp-ml-690842234"></a>
### P_LOGIC_LESS

```ml
const P_LOGIC_LESS = 38
```

Scanner punctuation identifier for `<`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L66)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-not-const-p-logic-not-36-src-mq3-botlib-l-precomp-ml-934649464"></a>
### P_LOGIC_NOT

```ml
const P_LOGIC_NOT = 36
```

Scanner punctuation identifier for `!`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L62)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-or-const-p-logic-or-6-src-mq3-botlib-l-precomp-ml-978992513"></a>
### P_LOGIC_OR

```ml
const P_LOGIC_OR = 6
```

Scanner punctuation identifier for `||`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L30)

<a id="constant-constant-mq3-botlib-l-precomp-p-logic-uneq-const-p-logic-uneq-10-src-mq3-botlib-l-precomp-ml-2139524964"></a>
### P_LOGIC_UNEQ

```ml
const P_LOGIC_UNEQ = 10
```

Scanner punctuation identifier for `!=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L38)

<a id="constant-constant-mq3-botlib-l-precomp-p-lshift-const-p-lshift-22-src-mq3-botlib-l-precomp-ml-1788157469"></a>
### P_LSHIFT

```ml
const P_LSHIFT = 22
```

Scanner punctuation identifier for `<<`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L42)

<a id="constant-constant-mq3-botlib-l-precomp-p-mod-const-p-mod-28-src-mq3-botlib-l-precomp-ml-318899299"></a>
### P_MOD

```ml
const P_MOD = 28
```

Scanner punctuation identifier for `%`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L48)

<a id="constant-constant-mq3-botlib-l-precomp-p-mul-const-p-mul-26-src-mq3-botlib-l-precomp-ml-1161012953"></a>
### P_MUL

```ml
const P_MUL = 26
```

Scanner punctuation identifier for `*`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L44)

<a id="constant-constant-mq3-botlib-l-precomp-p-questionmark-const-p-questionmark-43-src-mq3-botlib-l-precomp-ml-128035570"></a>
### P_QUESTIONMARK

```ml
const P_QUESTIONMARK = 43
```

Scanner punctuation identifier for `?`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L70)

<a id="constant-constant-mq3-botlib-l-precomp-p-rshift-const-p-rshift-21-src-mq3-botlib-l-precomp-ml-1651692128"></a>
### P_RSHIFT

```ml
const P_RSHIFT = 21
```

Scanner punctuation identifier for `>>`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L40)

<a id="constant-constant-mq3-botlib-l-precomp-p-sub-const-p-sub-30-src-mq3-botlib-l-precomp-ml-495138546"></a>
### P_SUB

```ml
const P_SUB = 30
```

Scanner punctuation identifier for `-`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L52)

<a id="function-function-mq3-botlib-l-precomp-pc-addbuiltindefines-function-pc-addbuiltindefines-source-src-mq3-botlib-l-precomp-ml-1230686869"></a>
### PC_AddBuiltinDefines

```ml
function PC_AddBuiltinDefines(source)
```

Test `source!=void` as the condition for `PC_AddBuiltinDefines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Operand used to evaluate the returned expression `source!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L275)

<a id="function-function-mq3-botlib-l-precomp-pc-adddefine-function-pc-adddefine-source-string-src-mq3-botlib-l-precomp-ml-1109965406"></a>
### PC_AddDefine

```ml
function PC_AddDefine(source, string)
```

Forward `PC_AddDefine` to `mq3.vm.pc_parser.addDefine` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `string` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L340)

<a id="function-function-mq3-botlib-l-precomp-pc-adddefinetohash-function-pc-adddefinetohash-define-table-src-mq3-botlib-l-precomp-ml-726146335"></a>
### PC_AddDefineToHash

```ml
function PC_AddDefineToHash(define, table)
```

Set `table[hash]` to `[define]` and `table[hash]` to `[define]+table[hash]` in `mq3.botlib.l_precomp.PC_AddDefineToHash`. Return paths include `define`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `define` | `dynamic` | — | Define record; accesses `name`. |
| `table` | `dynamic` | — | Array or byte sequence accessed at `hash`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L257)

<a id="function-function-mq3-botlib-l-precomp-pc-addglobaldefine-function-pc-addglobaldefine-runtime-string-src-mq3-botlib-l-precomp-ml-2057351111"></a>
### PC_AddGlobalDefine

```ml
function PC_AddGlobalDefine(runtime, string)
```

Set `runtime.globalDefines` to `runtime.globalDefines+[string]` in `mq3.botlib.l_precomp.PC_AddGlobalDefine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry` and `globalDefines`. May update `runtime.globalDefines` in place. |
| `string` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L344)

<a id="function-function-mq3-botlib-l-precomp-pc-addglobaldefinestosource-function-pc-addglobaldefinestosource-source-src-mq3-botlib-l-precomp-ml-155832497"></a>
### PC_AddGlobalDefinesToSource

```ml
function PC_AddGlobalDefinesToSource(source)
```

Return the number of entries in `source.runtime.globalDefines` for `PC_AddGlobalDefinesToSource`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L358)

<a id="function-function-mq3-botlib-l-precomp-pc-checkopensourcehandles-function-pc-checkopensourcehandles-runtime-src-mq3-botlib-l-precomp-ml-886386404"></a>
### PC_CheckOpenSourceHandles

```ml
function PC_CheckOpenSourceHandles(runtime)
```

Record or dispatch `"open-source"` actions in `PC_CheckOpenSourceHandles`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L549)

<a id="function-function-mq3-botlib-l-precomp-pc-checktokenstring-function-pc-checktokenstring-source-string-src-mq3-botlib-l-precomp-ml-356237902"></a>
### PC_CheckTokenString

```ml
function PC_CheckTokenString(source, string)
```

Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.PC_UnreadToken` while evaluating `PC_CheckTokenString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place. |
| `string` | `dynamic` | — | Value used by `PC_CheckTokenString` in `if token.text==string then return true end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L481)

<a id="function-function-mq3-botlib-l-precomp-pc-checktokentype-function-pc-checktokentype-source-type-subtype-src-mq3-botlib-l-precomp-ml-425436489"></a>
### PC_CheckTokenType

```ml
function PC_CheckTokenType(source, type, subtype)
```

Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.PC_UnreadToken` while evaluating `PC_CheckTokenType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place. |
| `type` | `dynamic` | — | Value used by `PC_CheckTokenType` in `if token.type==type and (subtype==0 or (token.subtype&subtype)!=0) then return token end if`. |
| `subtype` | `dynamic` | — | Value used by `PC_CheckTokenType` in `if token.type==type and (subtype==0 or (token.subtype&subtype)!=0) then return token end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L486)

<a id="function-function-mq3-botlib-l-precomp-pc-cleartokenwhitespace-function-pc-cleartokenwhitespace-token-src-mq3-botlib-l-precomp-ml-677791641"></a>
### PC_ClearTokenWhiteSpace

```ml
function PC_ClearTokenWhiteSpace(token)
```

Set `token.leadingSpace` to `false` in `mq3.botlib.l_precomp.PC_ClearTokenWhiteSpace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Parsed token; accesses `leadingSpace`. May update `token.leadingSpace` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L315)

<a id="function-function-mq3-botlib-l-precomp-pc-convertpath-function-pc-convertpath-path-src-mq3-botlib-l-precomp-ml-336523103"></a>
### PC_ConvertPath

```ml
function PC_ConvertPath(path)
```

Normalize slash and backslash separators into single forward slashes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L299)

<a id="function-function-mq3-botlib-l-precomp-pc-copydefine-function-pc-copydefine-source-define-src-mq3-botlib-l-precomp-ml-1818228668"></a>
### PC_CopyDefine

```ml
function PC_CopyDefine(source, define)
```

Build the `mq3.vm.pc_parser.Define` result for `PC_CopyDefine`. Return paths include `pc.Define(define.name,parameters,tokens,define.functionLike)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Not read by this implementation; retained in the `PC_CopyDefine` signature. |
| `define` | `dynamic` | — | Define record; accesses `tokens`, `parameters`, `name` and `functionLike`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L355)

<a id="function-function-mq3-botlib-l-precomp-pc-copytoken-function-pc-copytoken-token-src-mq3-botlib-l-precomp-ml-521308491"></a>
### PC_CopyToken

```ml
function PC_CopyToken(token)
```

Build the `mq3.vm.pc_parser.Token` result for `PC_CopyToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Parsed token; accesses `type`, `subtype`, `intValue`, `floatValue` and `text` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L209)

<a id="function-function-mq3-botlib-l-precomp-pc-definefromstring-function-pc-definefromstring-runtime-string-src-mq3-botlib-l-precomp-ml-345690499"></a>
### PC_DefineFromString

```ml
function PC_DefineFromString(runtime, string)
```

Apply `mq3.vm.pc_parser.addDefine`, `mq3.vm.pc_parser.raw` and `mq3.vm.pc_parser.defineIndex` while evaluating `PC_DefineFromString`. Return paths include `runtime.registry.defines[pc.defineIndex(runtime.registry,first.text)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry`. |
| `string` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L334)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-define-function-pc-directive-define-source-src-mq3-botlib-l-precomp-ml-482579091"></a>
### PC_Directive_define

```ml
function PC_Directive_define(source)
```

Set `source.runtime.registry.defines` to `source.runtime.registry.defines+[define]` and `source.runtime.registry.defines[index]` to `define` in `mq3.botlib.l_precomp.PC_Directive_define`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. May update `source.runtime.registry.defines` and `source.runtime.registry.defines[index]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L328)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-elif-function-pc-directive-elif-source-src-mq3-botlib-l-precomp-ml-601915857"></a>
### PC_Directive_elif

```ml
function PC_Directive_elif(source)
```

Forward `PC_Directive_elif` to `mq3.botlib.l_precomp.conditional` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L382)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-else-function-pc-directive-else-source-src-mq3-botlib-l-precomp-ml-704596055"></a>
### PC_Directive_else

```ml
function PC_Directive_else(source)
```

Forward `PC_Directive_else` to `mq3.botlib.l_precomp.conditional` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L376)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-endif-function-pc-directive-endif-source-src-mq3-botlib-l-precomp-ml-574170989"></a>
### PC_Directive_endif

```ml
function PC_Directive_endif(source)
```

Forward `PC_Directive_endif` to `mq3.botlib.l_precomp.conditional` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L379)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-error-function-pc-directive-error-source-src-mq3-botlib-l-precomp-ml-2063725981"></a>
### PC_Directive_error

```ml
function PC_Directive_error(source)
```

Apply `mq3.botlib.l_precomp.PC_ReadLine` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_Directive_error`. Return paths include `SourceError(source,message)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L421)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-eval-function-pc-directive-eval-source-src-mq3-botlib-l-precomp-ml-1352067209"></a>
### PC_Directive_eval

```ml
function PC_Directive_eval(source)
```

Apply `mq3.botlib.l_precomp.PC_Evaluate`, `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.queueFront` while evaluating `PC_Directive_eval`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L434)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-evalfloat-function-pc-directive-evalfloat-source-src-mq3-botlib-l-precomp-ml-1229592533"></a>
### PC_Directive_evalfloat

```ml
function PC_Directive_evalfloat(source)
```

Apply `mq3.botlib.l_precomp.PC_Evaluate`, `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.queueFront` while evaluating `PC_Directive_evalfloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L437)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-if-function-pc-directive-if-source-src-mq3-botlib-l-precomp-ml-897892395"></a>
### PC_Directive_if

```ml
function PC_Directive_if(source)
```

Forward `PC_Directive_if` to `mq3.botlib.l_precomp.conditional` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L385)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-if-def-function-pc-directive-if-def-source-type-src-mq3-botlib-l-precomp-ml-1636857003"></a>
### PC_Directive_if_def

```ml
function PC_Directive_if_def(source, type)
```

Apply `mq3.botlib.l_precomp.conditional` while evaluating `PC_Directive_if_def`. Return paths include `conditional(source,"ifndef")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `type` | `dynamic` | — | Value used by `PC_Directive_if_def` in `if type==INDENT_IFDEF then return conditional(source,"ifdef") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L367)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-ifdef-function-pc-directive-ifdef-source-src-mq3-botlib-l-precomp-ml-653448045"></a>
### PC_Directive_ifdef

```ml
function PC_Directive_ifdef(source)
```

Forward `PC_Directive_ifdef` to `mq3.botlib.l_precomp.conditional` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L370)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-ifndef-function-pc-directive-ifndef-source-src-mq3-botlib-l-precomp-ml-1345296849"></a>
### PC_Directive_ifndef

```ml
function PC_Directive_ifndef(source)
```

Forward `PC_Directive_ifndef` to `mq3.botlib.l_precomp.conditional` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L373)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-include-function-pc-directive-include-source-src-mq3-botlib-l-precomp-ml-1271732857"></a>
### PC_Directive_include

```ml
function PC_Directive_include(source)
```

Forward `PC_Directive_include` to `mq3.botlib.l_precomp.PC_ReadDirective` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `includePath` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L306)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-line-function-pc-directive-line-source-src-mq3-botlib-l-precomp-ml-1356765913"></a>
### PC_Directive_line

```ml
function PC_Directive_line(source)
```

Apply `mq3.botlib.l_precomp.PC_ReadLine`, `mq3.botlib.l_precomp.SourceError` and `mq3.botlib.l_precomp.sourceEntry` while evaluating `PC_Directive_line`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L418)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-pragma-function-pc-directive-pragma-source-src-mq3-botlib-l-precomp-ml-758161237"></a>
### PC_Directive_pragma

```ml
function PC_Directive_pragma(source)
```

Apply `mq3.botlib.l_precomp.PC_ReadLine` while evaluating `PC_Directive_pragma`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L424)

<a id="function-function-mq3-botlib-l-precomp-pc-directive-undef-function-pc-directive-undef-source-src-mq3-botlib-l-precomp-ml-435144005"></a>
### PC_Directive_undef

```ml
function PC_Directive_undef(source)
```

Apply `mq3.botlib.l_precomp.PC_ReadLine`, `mq3.botlib.l_precomp.SourceError` and `mq3.botlib.l_precomp.removeDefine` while evaluating `PC_Directive_undef`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L325)

<a id="function-function-mq3-botlib-l-precomp-pc-dollardirective-evalfloat-function-pc-dollardirective-evalfloat-source-src-mq3-botlib-l-precomp-ml-1919943909"></a>
### PC_DollarDirective_evalfloat

```ml
function PC_DollarDirective_evalfloat(source)
```

Forward `PC_DollarDirective_evalfloat` to `mq3.botlib.l_precomp.PC_Directive_evalfloat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L451)

<a id="function-function-mq3-botlib-l-precomp-pc-dollardirective-evalint-function-pc-dollardirective-evalint-source-src-mq3-botlib-l-precomp-ml-1711447541"></a>
### PC_DollarDirective_evalint

```ml
function PC_DollarDirective_evalint(source)
```

Forward `PC_DollarDirective_evalint` to `mq3.botlib.l_precomp.PC_Directive_eval` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L448)

<a id="function-function-mq3-botlib-l-precomp-pc-dollarevaluate-function-pc-dollarevaluate-source-intvalue-floatvalue-integer-src-mq3-botlib-l-precomp-ml-194008348"></a>
### PC_DollarEvaluate

```ml
function PC_DollarEvaluate(source, intvalue, floatvalue, integer)
```

Forward `PC_DollarEvaluate` to `mq3.botlib.l_precomp.PC_Evaluate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `intvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `floatvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `integer` | `dynamic` | — | Value passed as argument 5 to `mq3.botlib.l_precomp.PC_EvaluateTokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L415)

<a id="function-function-mq3-botlib-l-precomp-pc-evaluate-function-pc-evaluate-source-intvalue-floatvalue-integer-src-mq3-botlib-l-precomp-ml-795021796"></a>
### PC_Evaluate

```ml
function PC_Evaluate(source, intvalue, floatvalue, integer)
```

Forward `PC_Evaluate` to `mq3.botlib.l_precomp.PC_EvaluateTokens` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `intvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `floatvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `integer` | `dynamic` | — | Value passed as argument 5 to `mq3.botlib.l_precomp.PC_EvaluateTokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L409)

<a id="function-function-mq3-botlib-l-precomp-pc-evaluatetokens-function-pc-evaluatetokens-source-tokens-intvalue-floatvalue-integer-src-mq3-botlib-l-precomp-ml-2056604682"></a>
### PC_EvaluateTokens

```ml
function PC_EvaluateTokens(source, tokens, intvalue, floatvalue, integer)
```

Set `intvalue[0]` to `result[1]` and `floatvalue[0]` to `result[1]*1.0` in `mq3.botlib.l_precomp.PC_EvaluateTokens`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `tokens` | `dynamic` | — | Array or byte sequence accessed at `openIndex` and `index`. |
| `intvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `floatvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `integer` | `dynamic` | — | Not read by this implementation; retained in the `PC_EvaluateTokens` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L401)

<a id="function-function-mq3-botlib-l-precomp-pc-expandbuiltindefine-function-pc-expandbuiltindefine-source-deftoken-definetoken-src-mq3-botlib-l-precomp-ml-1953953777"></a>
### PC_ExpandBuiltinDefine

```ml
function PC_ExpandBuiltinDefine(source, deftoken, defineToken)
```

Apply `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.builtinToken` while evaluating `PC_ExpandBuiltinDefine`. Return paths include `pc.builtinToken(entry,deftoken)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |
| `deftoken` | `dynamic` | — | Parsed token; accesses `text`, `line` and `leadingSpace`. |
| `defineToken` | `dynamic` | — | Not read by this implementation; retained in the `PC_ExpandBuiltinDefine` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L280)

<a id="function-function-mq3-botlib-l-precomp-pc-expanddefine-function-pc-expanddefine-source-deftoken-define-parms-src-mq3-botlib-l-precomp-ml-1196267901"></a>
### PC_ExpandDefine

```ml
function PC_ExpandDefine(source, deftoken, define, parms)
```

Apply `mq3.vm.pc_parser.substituteMacro` while evaluating `PC_ExpandDefine`. Return paths include `define.tokens`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Not read by this implementation; retained in the `PC_ExpandDefine` signature. |
| `deftoken` | `dynamic` | — | Deftoken record; accesses `line`. |
| `define` | `dynamic` | — | Define record; accesses `functionLike` and `tokens`. |
| `parms` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L288)

<a id="function-function-mq3-botlib-l-precomp-pc-expanddefineintosource-function-pc-expanddefineintosource-source-deftoken-define-src-mq3-botlib-l-precomp-ml-1393577576"></a>
### PC_ExpandDefineIntoSource

```ml
function PC_ExpandDefineIntoSource(source, deftoken, define)
```

Expand a source macro, prepend its tokens to the input queue, and report whether the macro was invoked.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |
| `deftoken` | `dynamic` | — | Deftoken record; accesses `line`. |
| `define` | `dynamic` | — | Value record; accesses `functionLike`, `tokens` and `name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L293)

<a id="function-function-mq3-botlib-l-precomp-pc-expectanytoken-function-pc-expectanytoken-source-src-mq3-botlib-l-precomp-ml-1121601653"></a>
### PC_ExpectAnyToken

```ml
function PC_ExpectAnyToken(source)
```

Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ExpectAnyToken`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L477)

<a id="function-function-mq3-botlib-l-precomp-pc-expecttokenstring-function-pc-expecttokenstring-source-string-src-mq3-botlib-l-precomp-ml-1773049910"></a>
### PC_ExpectTokenString

```ml
function PC_ExpectTokenString(source, string)
```

Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ExpectTokenString`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place. |
| `string` | `dynamic` | — | Operand used to evaluate the returned expression `SourceError(source,"expected "+string)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L469)

<a id="function-function-mq3-botlib-l-precomp-pc-expecttokentype-function-pc-expecttokentype-source-type-subtype-src-mq3-botlib-l-precomp-ml-1915784663"></a>
### PC_ExpectTokenType

```ml
function PC_ExpectTokenType(source, type, subtype)
```

Apply `mq3.botlib.l_precomp.PC_ReadToken` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ExpectTokenType`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place. |
| `type` | `dynamic` | — | Value used by `PC_ExpectTokenType` in `if token==void or token is error or token.type!=type or subtype!=0 and (token.subtype&subtype)==0 then return So...`. |
| `subtype` | `dynamic` | — | Value used by `PC_ExpectTokenType` in `if token==void or token is error or token.type!=type or subtype!=0 and (token.subtype&subtype)==0 then return So...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L474)

<a id="function-function-mq3-botlib-l-precomp-pc-finddefine-function-pc-finddefine-defines-name-src-mq3-botlib-l-precomp-ml-810853257"></a>
### PC_FindDefine

```ml
function PC_FindDefine(defines, name)
```

Find a macro by exact name in a definition list and return void when the list has no match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `defines` | `dynamic` | — | Value used by `PC_FindDefine` in `if defines!=0 and defines!=void then for each define in defines if define.name==name then return define end if e...`. |
| `name` | `dynamic` | — | Lookup text matched against `define.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L265)

<a id="function-function-mq3-botlib-l-precomp-pc-finddefineparm-function-pc-finddefineparm-define-name-src-mq3-botlib-l-precomp-ml-269525262"></a>
### PC_FindDefineParm

```ml
function PC_FindDefineParm(define, name)
```

Forward `PC_FindDefineParm` to `mq3.vm.pc_parser.parameterIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `define` | `dynamic` | — | Definition record; accesses `parameters`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L269)

<a id="function-function-mq3-botlib-l-precomp-pc-findhasheddefine-function-pc-findhasheddefine-table-name-src-mq3-botlib-l-precomp-ml-215529891"></a>
### PC_FindHashedDefine

```ml
function PC_FindHashedDefine(table, name)
```

Find a macro by exact name in its hash bucket and return void when the definition is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — | Array or byte sequence accessed at `PC_NameHash(name)`. |
| `name` | `dynamic` | — | Lookup text matched against `define.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L261)

<a id="function-function-mq3-botlib-l-precomp-pc-freedefine-function-pc-freedefine-define-src-mq3-botlib-l-precomp-ml-1833996301"></a>
### PC_FreeDefine

```ml
function PC_FreeDefine(define)
```

Test `define!=void` as the condition for `PC_FreeDefine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `define` | `dynamic` | — | Operand used to evaluate the returned expression `define!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L272)

<a id="function-function-mq3-botlib-l-precomp-pc-freesourcehandle-function-pc-freesourcehandle-runtime-handle-src-mq3-botlib-l-precomp-ml-1451579128"></a>
### PC_FreeSourceHandle

```ml
function PC_FreeSourceHandle(runtime, handle)
```

Forward `PC_FreeSourceHandle` to `mq3.vm.pc_parser.free` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry`. |
| `handle` | `dynamic` | — | Handle identifying the allocated preprocessor source. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L534)

<a id="function-function-mq3-botlib-l-precomp-pc-freetoken-function-pc-freetoken-token-src-mq3-botlib-l-precomp-ml-546652551"></a>
### PC_FreeToken

```ml
function PC_FreeToken(token)
```

Test `token!=void` as the condition for `PC_FreeToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Operand used to evaluate the returned expression `token!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L212)

<a id="function-function-mq3-botlib-l-precomp-pc-inittokenheap-function-pc-inittokenheap-runtime-src-mq3-botlib-l-precomp-ml-512567352"></a>
### PC_InitTokenHeap

```ml
function PC_InitTokenHeap(runtime)
```

Set `runtime.tokenHeapInitialized` to `true` in `mq3.botlib.l_precomp.PC_InitTokenHeap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `tokenHeapInitialized`. May update `runtime.tokenHeapInitialized` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L206)

<a id="function-function-mq3-botlib-l-precomp-pc-lexerview-function-pc-lexerview-source-src-mq3-botlib-l-precomp-ml-1821999365"></a>
### PC_LexerView

```ml
function PC_LexerView(source)
```

Expose the original l_script API over the active preprocessor input without copying its cursor or line state. This is used by native botlib readers that sit below l_precomp in the original engine.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L174)

<a id="function-function-mq3-botlib-l-precomp-pc-loadsourcehandle-function-pc-loadsourcehandle-runtime-filename-src-mq3-botlib-l-precomp-ml-1311409557"></a>
### PC_LoadSourceHandle

```ml
function PC_LoadSourceHandle(runtime, filename)
```

Forward `PC_LoadSourceHandle` to `mq3.vm.pc_parser.load` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry` and `baseFolder`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L530)

<a id="function-function-mq3-botlib-l-precomp-pc-mergetokens-function-pc-mergetokens-t1-t2-src-mq3-botlib-l-precomp-ml-194123881"></a>
### PC_MergeTokens

```ml
function PC_MergeTokens(t1, t2)
```

Forward `PC_MergeTokens` to `mq3.vm.pc_parser.mergedToken` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `t1` | `dynamic` | — | Left record; accesses `type`, `text`, `line` and `leadingSpace`. |
| `t2` | `dynamic` | — | Right record; accesses `type` and `text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L239)

<a id="function-function-mq3-botlib-l-precomp-pc-namehash-function-pc-namehash-name-src-mq3-botlib-l-precomp-ml-1400024389"></a>
### PC_NameHash

```ml
function PC_NameHash(name)
```

Hash a macro name into the 1024-entry define table using the released position-weighted byte algorithm.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L251)

<a id="function-function-mq3-botlib-l-precomp-pc-operatorpriority-function-pc-operatorpriority-op-src-mq3-botlib-l-precomp-ml-1803541375"></a>
### PC_OperatorPriority

```ml
function PC_OperatorPriority(op)
```

Map a preprocessor operator code to its original arithmetic, comparison or logical precedence.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L389)

<a id="function-function-mq3-botlib-l-precomp-pc-popindent-function-pc-popindent-source-typeout-skipout-src-mq3-botlib-l-precomp-ml-894166102"></a>
### PC_PopIndent

```ml
function PC_PopIndent(source, typeOut, skipOut)
```

Pop a conditional-compilation indent and write its type and skip flag into optional output slots.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `indents`. May update `source.indents` in place. |
| `typeOut` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `skipOut` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L196)

<a id="function-function-mq3-botlib-l-precomp-pc-printdefine-function-pc-printdefine-runtime-define-src-mq3-botlib-l-precomp-ml-1151299697"></a>
### PC_PrintDefine

```ml
function PC_PrintDefine(runtime, define)
```

Record or dispatch `"define"` actions in `PC_PrintDefine`. Return paths include `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `retailActive`, `actions` and `host`. May update `runtime.actions` in place. |
| `define` | `dynamic` | — | Define record; accesses `name` and `tokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L243)

<a id="function-function-mq3-botlib-l-precomp-pc-printdefinehashtable-function-pc-printdefinehashtable-runtime-table-src-mq3-botlib-l-precomp-ml-1711442026"></a>
### PC_PrintDefineHashTable

```ml
function PC_PrintDefineHashTable(runtime, table)
```

Apply `mq3.botlib.l_precomp.PC_PrintDefine` while evaluating `PC_PrintDefineHashTable`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `retailActive`, `actions` and `host`. May update `runtime.actions` in place. |
| `table` | `dynamic` | — | Value used by `PC_PrintDefineHashTable` in `for each bucket in table if bucket!=0 then for each define in bucket PC_PrintDefine(runtime,define)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L247)

<a id="function-function-mq3-botlib-l-precomp-pc-pushindent-function-pc-pushindent-source-type-skip-src-mq3-botlib-l-precomp-ml-44671764"></a>
### PC_PushIndent

```ml
function PC_PushIndent(source, type, skip)
```

Set `source.indents` to `source.indents+[Indent(type,skip)]` in `mq3.botlib.l_precomp.PC_PushIndent`. Return paths include `len(source.indents)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `indents`. May update `source.indents` in place. |
| `type` | `dynamic` | — | Initial value stored in `mq3.botlib.l_precomp.Indent.type`. |
| `skip` | `dynamic` | — | Initial value stored in `mq3.botlib.l_precomp.Indent.skip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L191)

<a id="function-function-mq3-botlib-l-precomp-pc-pushscript-function-pc-pushscript-source-script-src-mq3-botlib-l-precomp-ml-11173494"></a>
### PC_PushScript

```ml
function PC_PushScript(source, script)
```

Set `source.scripts` to `source.scripts+[script]` in `mq3.botlib.l_precomp.PC_PushScript`. Return paths include `len(source.scripts)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `scripts`. May update `source.scripts` in place. |
| `script` | `dynamic` | — | Value used by `PC_PushScript` in `source.scripts=source.scripts+[script]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L203)

<a id="function-function-mq3-botlib-l-precomp-pc-readdefineparms-function-pc-readdefineparms-source-define-maxparms-src-mq3-botlib-l-precomp-ml-677087143"></a>
### PC_ReadDefineParms

```ml
function PC_ReadDefineParms(source, define, maxparms)
```

Read balanced macro invocation parentheses, enforce the parameter limit, and return parsed argument token lists.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |
| `define` | `dynamic` | — | Value record; accesses `parameters`. |
| `maxparms` | `dynamic` | — | Value used by `PC_ReadDefineParms` in `if count>maxparms then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L227)

<a id="function-function-mq3-botlib-l-precomp-pc-readdirective-function-pc-readdirective-source-name-src-mq3-botlib-l-precomp-ml-37531448"></a>
### PC_ReadDirective

```ml
function PC_ReadDirective(source, name)
```

Apply `mq3.botlib.l_precomp.PC_ReadLine`, `mq3.botlib.l_precomp.SourceError` and `mq3.botlib.l_precomp.sourceEntry` while evaluating `PC_ReadDirective`. Return paths include `SourceError(source,"unknown precompiler directive "+name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `includePath` and `runtime`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L442)

<a id="function-function-mq3-botlib-l-precomp-pc-readdollardirective-function-pc-readdollardirective-source-name-src-mq3-botlib-l-precomp-ml-597513144"></a>
### PC_ReadDollarDirective

```ml
function PC_ReadDollarDirective(source, name)
```

Apply `mq3.botlib.l_precomp.PC_DollarDirective_evalint`, `mq3.botlib.l_precomp.PC_DollarDirective_evalfloat` and `mq3.botlib.l_precomp.SourceError` while evaluating `PC_ReadDollarDirective`. Return paths include `SourceError(source,"unknown dollar directive "+name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L455)

<a id="function-function-mq3-botlib-l-precomp-pc-readline-function-pc-readline-source-src-mq3-botlib-l-precomp-ml-1807120221"></a>
### PC_ReadLine

```ml
function PC_ReadLine(source)
```

Apply `mq3.botlib.l_precomp.sourceEntry`, `mq3.botlib.l_precomp.sourceLocation` and `mq3.vm.pc_parser.lineTokens` while evaluating `PC_ReadLine`. Return paths include `pc.lineTokens(entry,where[1])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L309)

<a id="function-function-mq3-botlib-l-precomp-pc-readsourcetoken-function-pc-readsourcetoken-source-src-mq3-botlib-l-precomp-ml-52157697"></a>
### PC_ReadSourceToken

```ml
function PC_ReadSourceToken(source)
```

Read the next raw preprocessor token and retain a successful token for subsequent source operations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `lastToken`. May update `source.lastToken` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L216)

<a id="function-function-mq3-botlib-l-precomp-pc-readtoken-function-pc-readtoken-source-src-mq3-botlib-l-precomp-ml-916704065"></a>
### PC_ReadToken

```ml
function PC_ReadToken(source)
```

Set `source.lastToken` to `token` in `mq3.botlib.l_precomp.PC_ReadToken`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L465)

<a id="function-function-mq3-botlib-l-precomp-pc-readtokenhandle-function-pc-readtokenhandle-runtime-handle-src-mq3-botlib-l-precomp-ml-178435078"></a>
### PC_ReadTokenHandle

```ml
function PC_ReadTokenHandle(runtime, handle)
```

Forward `PC_ReadTokenHandle` to `mq3.vm.pc_parser.read` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L538)

<a id="function-function-mq3-botlib-l-precomp-pc-removeallglobaldefines-function-pc-removeallglobaldefines-runtime-src-mq3-botlib-l-precomp-ml-963521012"></a>
### PC_RemoveAllGlobalDefines

```ml
function PC_RemoveAllGlobalDefines(runtime)
```

Set `runtime.globalDefines` to `[]` in `mq3.botlib.l_precomp.PC_RemoveAllGlobalDefines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry` and `globalDefines`. May update `runtime.globalDefines` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L351)

<a id="function-function-mq3-botlib-l-precomp-pc-removeglobaldefine-function-pc-removeglobaldefine-runtime-name-src-mq3-botlib-l-precomp-ml-440668561"></a>
### PC_RemoveGlobalDefine

```ml
function PC_RemoveGlobalDefine(runtime, name)
```

Forward `PC_RemoveGlobalDefine` to `mq3.botlib.l_precomp.removeDefine` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L348)

<a id="function-function-mq3-botlib-l-precomp-pc-setbasefolder-function-pc-setbasefolder-runtime-path-src-mq3-botlib-l-precomp-ml-670507609"></a>
### PC_SetBaseFolder

```ml
function PC_SetBaseFolder(runtime, path)
```

Set `runtime.baseFolder` to `PC_ConvertPath(path)` and `runtime.baseFolder` to `runtime.baseFolder+"/"` in `mq3.botlib.l_precomp.PC_SetBaseFolder`. Return paths include `runtime.baseFolder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `baseFolder`. May update `runtime.baseFolder` in place. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L546)

<a id="function-function-mq3-botlib-l-precomp-pc-setincludepath-function-pc-setincludepath-source-path-src-mq3-botlib-l-precomp-ml-858227262"></a>
### PC_SetIncludePath

```ml
function PC_SetIncludePath(source, path)
```

Set `source.includePath` to `PC_ConvertPath(path)` and `source.includePath` to `source.includePath+"/"` in `mq3.botlib.l_precomp.PC_SetIncludePath`. Return paths include `source.includePath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `includePath`. May update `source.includePath` in place. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L501)

<a id="function-function-mq3-botlib-l-precomp-pc-setpunctuations-function-pc-setpunctuations-source-p-src-mq3-botlib-l-precomp-ml-1527365569"></a>
### PC_SetPunctuations

```ml
function PC_SetPunctuations(source, p)
```

Set `source.punctuations` to `p` in `mq3.botlib.l_precomp.PC_SetPunctuations`. Return paths include `p`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `punctuations`. May update `source.punctuations` in place. |
| `p` | `dynamic` | — | Operand used to evaluate the returned expression `p`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L505)

<a id="function-function-mq3-botlib-l-precomp-pc-skipuntilstring-function-pc-skipuntilstring-source-string-src-mq3-botlib-l-precomp-ml-1548206342"></a>
### PC_SkipUntilString

```ml
function PC_SkipUntilString(source, string)
```

Apply `mq3.botlib.l_precomp.PC_ReadToken` while evaluating `PC_SkipUntilString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`, `handle` and `lastToken`. May update `source.lastToken` in place. |
| `string` | `dynamic` | — | Value used by `PC_SkipUntilString` in `if token.text==string then return true end if end while`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L490)

<a id="function-function-mq3-botlib-l-precomp-pc-sourcefileandline-function-pc-sourcefileandline-runtime-handle-src-mq3-botlib-l-precomp-ml-1438474762"></a>
### PC_SourceFileAndLine

```ml
function PC_SourceFileAndLine(runtime, handle)
```

Forward `PC_SourceFileAndLine` to `mq3.vm.pc_parser.location` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L precomp runtime; accesses `registry`. |
| `handle` | `dynamic` | — | Handle identifying the allocated preprocessor source. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L542)

<a id="function-function-mq3-botlib-l-precomp-pc-stringizetokens-function-pc-stringizetokens-tokens-token-src-mq3-botlib-l-precomp-ml-337191813"></a>
### PC_StringizeTokens

```ml
function PC_StringizeTokens(tokens, token)
```

Apply `mq3.vm.pc_parser.stringized` while evaluating `PC_StringizeTokens`. Return paths include `pc.stringized(tokens,line)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — | Value used by `stringized` in `if argument!=0 then for each token in argument if token.type==TT_STRING then text=text+"\\""+token.text+"\\"" else...`. |
| `token` | `dynamic` | — | Parsed token; accesses `line`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L235)

<a id="function-function-mq3-botlib-l-precomp-pc-unreadlasttoken-function-pc-unreadlasttoken-source-src-mq3-botlib-l-precomp-ml-1509287277"></a>
### PC_UnreadLastToken

```ml
function PC_UnreadLastToken(source)
```

Apply `mq3.botlib.l_precomp.PC_UnreadToken` while evaluating `PC_UnreadLastToken`. Return paths include `PC_UnreadToken(source,source.lastToken)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `lastToken`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L493)

<a id="function-function-mq3-botlib-l-precomp-pc-unreadsourcetoken-function-pc-unreadsourcetoken-source-token-src-mq3-botlib-l-precomp-ml-1048729814"></a>
### PC_UnreadSourceToken

```ml
function PC_UnreadSourceToken(source, token)
```

Apply `mq3.botlib.l_precomp.sourceEntry` and `mq3.vm.pc_parser.unread` while evaluating `PC_UnreadSourceToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |
| `token` | `dynamic` | — | Value used by `unread` in `if token==void then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L222)

<a id="function-function-mq3-botlib-l-precomp-pc-unreadtoken-function-pc-unreadtoken-source-token-src-mq3-botlib-l-precomp-ml-1468847378"></a>
### PC_UnreadToken

```ml
function PC_UnreadToken(source, token)
```

Forward `PC_UnreadToken` to `mq3.botlib.l_precomp.PC_UnreadSourceToken` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |
| `token` | `dynamic` | — | Value used by `unread` in `if token==void then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L497)

<a id="function-function-mq3-botlib-l-precomp-pc-whitespacebeforetoken-function-pc-whitespacebeforetoken-token-src-mq3-botlib-l-precomp-ml-1239550391"></a>
### PC_WhiteSpaceBeforeToken

```ml
function PC_WhiteSpaceBeforeToken(token)
```

Test `token!=void and token.leadingSpace` as the condition for `PC_WhiteSpaceBeforeToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Parsed token; accesses `leadingSpace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L312)

- [mq3.botlib.l_precomp.PrecompHost](Type-mq3-botlib-l-precomp-precomphost-125789787.md) — struct
<a id="function-function-mq3-botlib-l-precomp-quakecmacro-function-quakecmacro-source-src-mq3-botlib-l-precomp-ml-1535729641"></a>
### QuakeCMacro

```ml
function QuakeCMacro(source)
```

Apply `mq3.botlib.l_precomp.PC_ReadSourceToken` and `mq3.botlib.l_precomp.PC_UnreadSourceToken` while evaluating `QuakeCMacro`. Return paths include `token.type!=pc.TT_NAME or (token.text!="evalint" and token.text!="evalfloat")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `lastToken`. May update `source.lastToken` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L461)

<a id="function-function-mq3-botlib-l-precomp-removedefine-function-removedefine-registry-name-src-mq3-botlib-l-precomp-ml-1629394094"></a>
### removeDefine

```ml
function removeDefine(registry, name)
```

Remove a non-builtin macro from the shared definition table, returning false for missing or builtin names.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `defines`. May update `registry.defines[index]` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L320)

- [mq3.botlib.l_precomp.Runtime](Type-mq3-botlib-l-precomp-runtime-699338599.md) — struct
- [mq3.botlib.l_precomp.Source](Type-mq3-botlib-l-precomp-source-316817148.md) — struct
<a id="function-function-mq3-botlib-l-precomp-sourceentry-function-sourceentry-source-src-mq3-botlib-l-precomp-ml-1751890167"></a>
### sourceEntry

```ml
function sourceEntry(source)
```

Resolve a valid preprocessor source handle to its shared registry entry, returning void for an invalid handle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `handle` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L166)

<a id="function-function-mq3-botlib-l-precomp-sourceerror-function-sourceerror-source-message-src-mq3-botlib-l-precomp-ml-815717710"></a>
### SourceError

```ml
function SourceError(source, message)
```

Emit a source-located preprocessor diagnostic and construct error 7741 with the filename and line number.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L181)

<a id="function-function-mq3-botlib-l-precomp-sourcelocation-function-sourcelocation-source-src-mq3-botlib-l-precomp-ml-1729676237"></a>
### sourceLocation

```ml
function sourceLocation(source)
```

Apply `mq3.vm.pc_parser.location` while evaluating `sourceLocation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L169)

<a id="function-function-mq3-botlib-l-precomp-sourcewarning-function-sourcewarning-source-message-src-mq3-botlib-l-precomp-ml-1904249394"></a>
### SourceWarning

```ml
function SourceWarning(source, message)
```

Emit a source-located preprocessor warning and return false.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `runtime`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L185)

<a id="function-function-mq3-botlib-l-precomp-unreadsigntoken-function-unreadsigntoken-source-src-mq3-botlib-l-precomp-ml-171946251"></a>
### UnreadSignToken

```ml
function UnreadSignToken(source)
```

Apply `mq3.botlib.l_precomp.PC_UnreadSourceToken` while evaluating `UnreadSignToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `lastToken`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L427)

<a id="function-function-mq3-botlib-l-precomp-wrap-function-wrap-runtime-handle-src-mq3-botlib-l-precomp-ml-992172462"></a>
### wrap

```ml
function wrap(runtime, handle)
```

Build the `mq3.botlib.l_precomp.Source` result for `wrap`. Return paths include `Source(runtime,handle,"",void,void,[],[])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Initial value stored in `mq3.botlib.l_precomp.Source.runtime`. |
| `handle` | `dynamic` | — | Handle identifying the allocated preprocessor source. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L510)
