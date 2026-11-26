# `src/mq3/botlib/l_script.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.l_script`](Package-mq3-botlib-l-script-496825642.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)

## Declarations

<a id="function-function-mq3-botlib-l-script-at-function-at-script-index-src-mq3-botlib-l-script-ml-63320797"></a>
### at

```ml
function at(script, index)
```

Forward `at` to `mq3.vm.pc_parser.at` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L114)

<a id="function-function-mq3-botlib-l-script-chartext-function-chartext-value-src-mq3-botlib-l-script-ml-488443753"></a>
### charText

```ml
function charText(value)
```

Return the result of `decode(bytes([value]))` for `charText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `decode(bytes([value]))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L117)

<a id="function-function-mq3-botlib-l-script-compressfile-function-compressfile-data-src-mq3-botlib-l-script-ml-875211960"></a>
### compressFile

```ml
function compressFile(data)
```

Remove lexical comments and collapse whitespace while retaining quoted source text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `readAt` and `readAt+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L430)

<a id="function-function-mq3-botlib-l-script-copyinto-function-copyinto-target-value-src-mq3-botlib-l-script-ml-1192114962"></a>
### copyInto

```ml
function copyInto(target, value)
```

Update `target.string`, `target.type`, `target.subtype` and `target.intValue` and related state during `copyInto`. Return paths include `target`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Target record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `target.string`, `target.type` and `target.subtype` and additional fields in place. |
| `value` | `dynamic` | — | Value record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L335)

<a id="function-function-mq3-botlib-l-script-copytoken-function-copytoken-value-src-mq3-botlib-l-script-ml-1257101177"></a>
### copyToken

```ml
function copyToken(value)
```

Build the `mq3.botlib.l_script.Token` result for `copyToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L110)

<a id="function-function-mq3-botlib-l-script-create-function-create-hostvalue-src-mq3-botlib-l-script-ml-49508975"></a>
### create

```ml
function create(hostValue)
```

Build the `mq3.botlib.l_script.Runtime` result for `create`. Return paths include `Runtime(hostValue,"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hostValue` | `dynamic` | — | Initial value stored in `mq3.botlib.l_script.Runtime.host`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L101)

<a id="function-function-mq3-botlib-l-script-defaultpunctuations-function-defaultpunctuations-src-mq3-botlib-l-script-ml-1624285704"></a>
### defaultPunctuations

```ml
function defaultPunctuations()
```

Return the ordered default punctuations table for l script: 52 entries beginning with `Punctuation(">>=",1)` and `Punctuation("<<=",2)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L103)

<a id="function-function-mq3-botlib-l-script-emit-function-emit-script-kind-message-src-mq3-botlib-l-script-ml-56374848"></a>
### emit

```ml
function emit(script, kind, message)
```

Use `script.runtime.host.actionFn` to perform `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `flags`, `runtime` and `source`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `script.runtime.host.actionFn`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L127)

<a id="function-function-mq3-botlib-l-script-emptytoken-function-emptytoken-src-mq3-botlib-l-script-ml-841022056"></a>
### emptyToken

```ml
function emptyToken()
```

Create a `mq3.botlib.l_script.Token` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L107)

<a id="function-function-mq3-botlib-l-script-endofscript-function-endofscript-script-src-mq3-botlib-l-script-ml-2016831029"></a>
### EndOfScript

```ml
function EndOfScript(script)
```

Test `script.source.offset>=len(script.source.data)` as the condition for `EndOfScript`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L399)

<a id="function-function-mq3-botlib-l-script-filelength-function-filelength-fp-src-mq3-botlib-l-script-ml-1039112058"></a>
### FileLength

```ml
function FileLength(fp)
```

Return the byte length of text or the length of a supplied data buffer, using zero for void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fp` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `FileLength`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L412)

<a id="function-function-mq3-botlib-l-script-freescript-function-freescript-script-src-mq3-botlib-l-script-ml-195151739"></a>
### FreeScript

```ml
function FreeScript(script)
```

Update `script.freed`, `script.source.data` and `script.source.pending` during `FreeScript`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed` and `source`. May update `script.freed`, `script.source.data` and `script.source.pending` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L454)

<a id="function-function-mq3-botlib-l-script-frompctoken-function-frompctoken-token-src-mq3-botlib-l-script-ml-1520122517"></a>
### FromPCToken

```ml
function FromPCToken(token)
```

Build the `mq3.botlib.l_script.Token` result for `FromPCToken`. Return paths include `Token(text,token.type,token.subtype,token.intValue,token.floatValue,0,0,token.line,0,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Parsed token; accesses `text`, `type`, `subtype`, `intValue` and `floatValue` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L470)

<a id="function-function-mq3-botlib-l-script-getscriptflags-function-getscriptflags-script-src-mq3-botlib-l-script-ml-1584259319"></a>
### GetScriptFlags

```ml
function GetScriptFlags(script)
```

Return `script.flags` for `GetScriptFlags`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L393)

<a id="function-function-mq3-botlib-l-script-hexdigit-function-hexdigit-value-src-mq3-botlib-l-script-ml-1050930673"></a>
### hexDigit

```ml
function hexDigit(value)
```

Convert an ASCII digit or letter to its numeric digit value, returning -1 for unsupported characters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value-48`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L192)

<a id="function-function-mq3-botlib-l-script-host-function-host-src-mq3-botlib-l-script-ml-831872952"></a>
### host

```ml
function host()
```

Create a `mq3.botlib.l_script.ScriptHost` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L98)

<a id="function-function-mq3-botlib-l-script-integervalue-function-integervalue-text-base-start-src-mq3-botlib-l-script-ml-407538994"></a>
### integerValue

```ml
function integerValue(text, base, start)
```

Apply `mq3.botlib.l_script.hexDigit` while evaluating `integerValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `base` | `dynamic` | — | Value used by `integerValue` in `if len(data)>start then for index=start to len(data)-1 result=result*base+hexDigit(data[index]) end for end if`. |
| `start` | `dynamic` | — | Value used by `integerValue` in `if len(data)>start then for index=start to len(data)-1 result=result*base+hexDigit(data[index]) end for end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L255)

<a id="function-function-mq3-botlib-l-script-loadscriptfile-function-loadscriptfile-runtime-filename-src-mq3-botlib-l-script-ml-345165157"></a>
### LoadScriptFile

```ml
function LoadScriptFile(runtime, filename)
```

Use `runtime.host.loadFn` to perform `LoadScriptFile`. Return paths include `LoadScriptMemory(runtime,data,len(data),filename)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L script runtime; accesses `host` and `baseFolder`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L449)

<a id="function-function-mq3-botlib-l-script-loadscriptmemory-function-loadscriptmemory-runtime-ptr-length-name-src-mq3-botlib-l-script-ml-913416225"></a>
### LoadScriptMemory

```ml
function LoadScriptMemory(runtime, ptr, length, name)
```

Apply `mq3.botlib.l_script.scriptFromSource` while evaluating `LoadScriptMemory`. Return paths include `scriptFromSource(runtime,pc.Source(name,data,0,1,0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Initial value stored in `mq3.botlib.l_script.Script.runtime`. |
| `ptr` | `dynamic` | — | Value used by `LoadScriptMemory` in `data=ptr`. |
| `length` | `dynamic` | — | Value passed as argument 3 to `slice`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L425)

<a id="constant-constant-mq3-botlib-l-script-max-token-const-max-token-1024-src-mq3-botlib-l-script-ml-433368068"></a>
### MAX_TOKEN

```ml
const MAX_TOKEN = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L10)

<a id="function-function-mq3-botlib-l-script-numbervalue-function-numbervalue-string-subtype-intvalue-floatvalue-src-mq3-botlib-l-script-ml-38871664"></a>
### NumberValue

```ml
function NumberValue(string, subtype, intvalue, floatvalue)
```

Set `intvalue[0]` to `iv` and `floatvalue[0]` to `fv` in `mq3.botlib.l_script.NumberValue`. Return paths include `[iv,fv]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Text to parse, format or deliver. |
| `subtype` | `dynamic` | — | Value used by `NumberValue` in `if (subtype&TT_FLOAT)!=0 then fv=toNumber(string)`. |
| `intvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |
| `floatvalue` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L263)

<a id="function-function-mq3-botlib-l-script-numlinescrossed-function-numlinescrossed-script-src-mq3-botlib-l-script-ml-610219647"></a>
### NumLinesCrossed

```ml
function NumLinesCrossed(script)
```

Return `script.source.line-script.lastLine` for `NumLinesCrossed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source` and `lastLine`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L402)

<a id="constant-constant-mq3-botlib-l-script-p-add-const-p-add-29-src-mq3-botlib-l-script-ml-1953423282"></a>
### P_ADD

```ml
const P_ADD = 29
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L61)

<a id="constant-constant-mq3-botlib-l-script-p-add-assign-const-p-add-assign-14-src-mq3-botlib-l-script-ml-1952081980"></a>
### P_ADD_ASSIGN

```ml
const P_ADD_ASSIGN = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L46)

<a id="constant-constant-mq3-botlib-l-script-p-assign-const-p-assign-31-src-mq3-botlib-l-script-ml-552842819"></a>
### P_ASSIGN

```ml
const P_ASSIGN = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L63)

<a id="constant-constant-mq3-botlib-l-script-p-backslash-const-p-backslash-50-src-mq3-botlib-l-script-ml-1717148102"></a>
### P_BACKSLASH

```ml
const P_BACKSLASH = 50
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L82)

<a id="constant-constant-mq3-botlib-l-script-p-bin-and-const-p-bin-and-32-src-mq3-botlib-l-script-ml-1087344586"></a>
### P_BIN_AND

```ml
const P_BIN_AND = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L64)

<a id="constant-constant-mq3-botlib-l-script-p-bin-and-assign-const-p-bin-and-assign-18-src-mq3-botlib-l-script-ml-394371136"></a>
### P_BIN_AND_ASSIGN

```ml
const P_BIN_AND_ASSIGN = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L50)

<a id="constant-constant-mq3-botlib-l-script-p-bin-not-const-p-bin-not-35-src-mq3-botlib-l-script-ml-1606430529"></a>
### P_BIN_NOT

```ml
const P_BIN_NOT = 35
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L67)

<a id="constant-constant-mq3-botlib-l-script-p-bin-or-const-p-bin-or-33-src-mq3-botlib-l-script-ml-1869753165"></a>
### P_BIN_OR

```ml
const P_BIN_OR = 33
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L65)

<a id="constant-constant-mq3-botlib-l-script-p-bin-or-assign-const-p-bin-or-assign-19-src-mq3-botlib-l-script-ml-2038824971"></a>
### P_BIN_OR_ASSIGN

```ml
const P_BIN_OR_ASSIGN = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L51)

<a id="constant-constant-mq3-botlib-l-script-p-bin-xor-const-p-bin-xor-34-src-mq3-botlib-l-script-ml-122590816"></a>
### P_BIN_XOR

```ml
const P_BIN_XOR = 34
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L66)

<a id="constant-constant-mq3-botlib-l-script-p-bin-xor-assign-const-p-bin-xor-assign-20-src-mq3-botlib-l-script-ml-1819815589"></a>
### P_BIN_XOR_ASSIGN

```ml
const P_BIN_XOR_ASSIGN = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L52)

<a id="constant-constant-mq3-botlib-l-script-p-braceclose-const-p-braceclose-47-src-mq3-botlib-l-script-ml-184302844"></a>
### P_BRACECLOSE

```ml
const P_BRACECLOSE = 47
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L79)

<a id="constant-constant-mq3-botlib-l-script-p-braceopen-const-p-braceopen-46-src-mq3-botlib-l-script-ml-829899155"></a>
### P_BRACEOPEN

```ml
const P_BRACEOPEN = 46
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L78)

<a id="constant-constant-mq3-botlib-l-script-p-colon-const-p-colon-42-src-mq3-botlib-l-script-ml-195675243"></a>
### P_COLON

```ml
const P_COLON = 42
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L74)

<a id="constant-constant-mq3-botlib-l-script-p-comma-const-p-comma-40-src-mq3-botlib-l-script-ml-510063105"></a>
### P_COMMA

```ml
const P_COMMA = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L72)

<a id="constant-constant-mq3-botlib-l-script-p-cpp1-const-p-cpp1-24-src-mq3-botlib-l-script-ml-757193815"></a>
### P_CPP1

```ml
const P_CPP1 = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L56)

<a id="constant-constant-mq3-botlib-l-script-p-cpp2-const-p-cpp2-25-src-mq3-botlib-l-script-ml-298662064"></a>
### P_CPP2

```ml
const P_CPP2 = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L57)

<a id="constant-constant-mq3-botlib-l-script-p-dec-const-p-dec-17-src-mq3-botlib-l-script-ml-1133920073"></a>
### P_DEC

```ml
const P_DEC = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L49)

<a id="constant-constant-mq3-botlib-l-script-p-div-const-p-div-27-src-mq3-botlib-l-script-ml-1886859176"></a>
### P_DIV

```ml
const P_DIV = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L59)

<a id="constant-constant-mq3-botlib-l-script-p-div-assign-const-p-div-assign-12-src-mq3-botlib-l-script-ml-326120262"></a>
### P_DIV_ASSIGN

```ml
const P_DIV_ASSIGN = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L44)

<a id="constant-constant-mq3-botlib-l-script-p-dollar-const-p-dollar-52-src-mq3-botlib-l-script-ml-1085876760"></a>
### P_DOLLAR

```ml
const P_DOLLAR = 52
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L84)

<a id="constant-constant-mq3-botlib-l-script-p-inc-const-p-inc-16-src-mq3-botlib-l-script-ml-1038660988"></a>
### P_INC

```ml
const P_INC = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L48)

<a id="constant-constant-mq3-botlib-l-script-p-logic-and-const-p-logic-and-5-src-mq3-botlib-l-script-ml-1175574256"></a>
### P_LOGIC_AND

```ml
const P_LOGIC_AND = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L37)

<a id="constant-constant-mq3-botlib-l-script-p-logic-eq-const-p-logic-eq-9-src-mq3-botlib-l-script-ml-1637041562"></a>
### P_LOGIC_EQ

```ml
const P_LOGIC_EQ = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L41)

<a id="constant-constant-mq3-botlib-l-script-p-logic-geq-const-p-logic-geq-7-src-mq3-botlib-l-script-ml-2024986062"></a>
### P_LOGIC_GEQ

```ml
const P_LOGIC_GEQ = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L39)

<a id="constant-constant-mq3-botlib-l-script-p-logic-greater-const-p-logic-greater-37-src-mq3-botlib-l-script-ml-393279579"></a>
### P_LOGIC_GREATER

```ml
const P_LOGIC_GREATER = 37
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L69)

<a id="constant-constant-mq3-botlib-l-script-p-logic-leq-const-p-logic-leq-8-src-mq3-botlib-l-script-ml-1345280749"></a>
### P_LOGIC_LEQ

```ml
const P_LOGIC_LEQ = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L40)

<a id="constant-constant-mq3-botlib-l-script-p-logic-less-const-p-logic-less-38-src-mq3-botlib-l-script-ml-545944756"></a>
### P_LOGIC_LESS

```ml
const P_LOGIC_LESS = 38
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L70)

<a id="constant-constant-mq3-botlib-l-script-p-logic-not-const-p-logic-not-36-src-mq3-botlib-l-script-ml-2127251778"></a>
### P_LOGIC_NOT

```ml
const P_LOGIC_NOT = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L68)

<a id="constant-constant-mq3-botlib-l-script-p-logic-or-const-p-logic-or-6-src-mq3-botlib-l-script-ml-1603749087"></a>
### P_LOGIC_OR

```ml
const P_LOGIC_OR = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L38)

<a id="constant-constant-mq3-botlib-l-script-p-logic-uneq-const-p-logic-uneq-10-src-mq3-botlib-l-script-ml-1414828238"></a>
### P_LOGIC_UNEQ

```ml
const P_LOGIC_UNEQ = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L42)

<a id="constant-constant-mq3-botlib-l-script-p-lshift-const-p-lshift-22-src-mq3-botlib-l-script-ml-1099778989"></a>
### P_LSHIFT

```ml
const P_LSHIFT = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L54)

<a id="constant-constant-mq3-botlib-l-script-p-lshift-assign-const-p-lshift-assign-2-src-mq3-botlib-l-script-ml-247398243"></a>
### P_LSHIFT_ASSIGN

```ml
const P_LSHIFT_ASSIGN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L34)

<a id="constant-constant-mq3-botlib-l-script-p-mod-const-p-mod-28-src-mq3-botlib-l-script-ml-1239430547"></a>
### P_MOD

```ml
const P_MOD = 28
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L60)

<a id="constant-constant-mq3-botlib-l-script-p-mod-assign-const-p-mod-assign-13-src-mq3-botlib-l-script-ml-1967949909"></a>
### P_MOD_ASSIGN

```ml
const P_MOD_ASSIGN = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L45)

<a id="constant-constant-mq3-botlib-l-script-p-mul-const-p-mul-26-src-mq3-botlib-l-script-ml-1532238121"></a>
### P_MUL

```ml
const P_MUL = 26
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L58)

<a id="constant-constant-mq3-botlib-l-script-p-mul-assign-const-p-mul-assign-11-src-mq3-botlib-l-script-ml-183008439"></a>
### P_MUL_ASSIGN

```ml
const P_MUL_ASSIGN = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L43)

<a id="constant-constant-mq3-botlib-l-script-p-parenthesesclose-const-p-parenthesesclose-45-src-mq3-botlib-l-script-ml-431984344"></a>
### P_PARENTHESESCLOSE

```ml
const P_PARENTHESESCLOSE = 45
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L77)

<a id="constant-constant-mq3-botlib-l-script-p-parenthesesopen-const-p-parenthesesopen-44-src-mq3-botlib-l-script-ml-2134339789"></a>
### P_PARENTHESESOPEN

```ml
const P_PARENTHESESOPEN = 44
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L76)

<a id="constant-constant-mq3-botlib-l-script-p-parms-const-p-parms-3-src-mq3-botlib-l-script-ml-511406050"></a>
### P_PARMS

```ml
const P_PARMS = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L35)

<a id="constant-constant-mq3-botlib-l-script-p-pointerref-const-p-pointerref-23-src-mq3-botlib-l-script-ml-317832848"></a>
### P_POINTERREF

```ml
const P_POINTERREF = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L55)

<a id="constant-constant-mq3-botlib-l-script-p-precomp-const-p-precomp-51-src-mq3-botlib-l-script-ml-2017018983"></a>
### P_PRECOMP

```ml
const P_PRECOMP = 51
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L83)

<a id="constant-constant-mq3-botlib-l-script-p-precompmerge-const-p-precompmerge-4-src-mq3-botlib-l-script-ml-1628282573"></a>
### P_PRECOMPMERGE

```ml
const P_PRECOMPMERGE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L36)

<a id="constant-constant-mq3-botlib-l-script-p-questionmark-const-p-questionmark-43-src-mq3-botlib-l-script-ml-1511488828"></a>
### P_QUESTIONMARK

```ml
const P_QUESTIONMARK = 43
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L75)

<a id="constant-constant-mq3-botlib-l-script-p-ref-const-p-ref-39-src-mq3-botlib-l-script-ml-951186357"></a>
### P_REF

```ml
const P_REF = 39
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L71)

<a id="constant-constant-mq3-botlib-l-script-p-rshift-const-p-rshift-21-src-mq3-botlib-l-script-ml-1515681910"></a>
### P_RSHIFT

```ml
const P_RSHIFT = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L53)

<a id="constant-constant-mq3-botlib-l-script-p-rshift-assign-const-p-rshift-assign-1-src-mq3-botlib-l-script-ml-428366892"></a>
### P_RSHIFT_ASSIGN

```ml
const P_RSHIFT_ASSIGN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L33)

<a id="constant-constant-mq3-botlib-l-script-p-semicolon-const-p-semicolon-41-src-mq3-botlib-l-script-ml-1702255680"></a>
### P_SEMICOLON

```ml
const P_SEMICOLON = 41
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L73)

<a id="constant-constant-mq3-botlib-l-script-p-sqbracketclose-const-p-sqbracketclose-49-src-mq3-botlib-l-script-ml-30499004"></a>
### P_SQBRACKETCLOSE

```ml
const P_SQBRACKETCLOSE = 49
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L81)

<a id="constant-constant-mq3-botlib-l-script-p-sqbracketopen-const-p-sqbracketopen-48-src-mq3-botlib-l-script-ml-154558517"></a>
### P_SQBRACKETOPEN

```ml
const P_SQBRACKETOPEN = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L80)

<a id="constant-constant-mq3-botlib-l-script-p-sub-const-p-sub-30-src-mq3-botlib-l-script-ml-1373546876"></a>
### P_SUB

```ml
const P_SUB = 30
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L62)

<a id="constant-constant-mq3-botlib-l-script-p-sub-assign-const-p-sub-assign-15-src-mq3-botlib-l-script-ml-678066763"></a>
### P_SUB_ASSIGN

```ml
const P_SUB_ASSIGN = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L47)

<a id="function-function-mq3-botlib-l-script-ps-checktokenstring-function-ps-checktokenstring-script-string-src-mq3-botlib-l-script-ml-871791630"></a>
### PS_CheckTokenString

```ml
function PS_CheckTokenString(script, string)
```

Set `script.source.offset` to `script.lastOffset` in `mq3.botlib.l_script.PS_CheckTokenString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source` and `lastOffset`. May update `script.source.offset` in place. |
| `string` | `dynamic` | — | Value used by `PS_CheckTokenString` in `if token.string==string then return true end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L354)

<a id="function-function-mq3-botlib-l-script-ps-checktokentype-function-ps-checktokentype-script-type-subtype-token-src-mq3-botlib-l-script-ml-517003050"></a>
### PS_CheckTokenType

```ml
function PS_CheckTokenType(script, type, subtype, token)
```

Set `script.source.offset` to `script.lastOffset` in `mq3.botlib.l_script.PS_CheckTokenType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source` and `lastOffset`. May update `script.source.offset` in place. |
| `type` | `dynamic` | — | Value used by `PS_CheckTokenType` in `if value.type==type and (value.subtype&subtype)==subtype then copyInto(token,value)`. |
| `subtype` | `dynamic` | — | Value used by `PS_CheckTokenType` in `if value.type==type and (value.subtype&subtype)==subtype then copyInto(token,value)`. |
| `token` | `dynamic` | — | Target record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `token.string`, `token.type` and `token.subtype` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L360)

<a id="function-function-mq3-botlib-l-script-ps-createpunctuationtable-function-ps-createpunctuationtable-script-punctuations-src-mq3-botlib-l-script-ml-2081850234"></a>
### PS_CreatePunctuationTable

```ml
function PS_CreatePunctuationTable(script, punctuations)
```

Set `script.punctuations` to `sorted` in `mq3.botlib.l_script.PS_CreatePunctuationTable`. Return paths include `sorted`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `punctuations`. May update `script.punctuations` in place. |
| `punctuations` | `dynamic` | — | Value used by `PS_CreatePunctuationTable` in `if punctuations==void then punctuations=defaultPunctuations() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L146)

<a id="function-function-mq3-botlib-l-script-ps-expectanytoken-function-ps-expectanytoken-script-token-src-mq3-botlib-l-script-ml-1853938804"></a>
### PS_ExpectAnyToken

```ml
function PS_ExpectAnyToken(script, token)
```

Apply `mq3.botlib.l_script.PS_ReadToken` and `mq3.botlib.l_script.ScriptError` while evaluating `PS_ExpectAnyToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `token.string`, `token.type` and `token.subtype` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L350)

<a id="function-function-mq3-botlib-l-script-ps-expecttokenstring-function-ps-expecttokenstring-script-string-src-mq3-botlib-l-script-ml-811989166"></a>
### PS_ExpectTokenString

```ml
function PS_ExpectTokenString(script, string)
```

Apply `mq3.botlib.l_script.emptyToken`, `mq3.botlib.l_script.PS_ReadToken` and `mq3.botlib.l_script.ScriptError` while evaluating `PS_ExpectTokenString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place. |
| `string` | `dynamic` | — | Operand used to evaluate the returned expression `ScriptError(script,"couldn't find expected "+string)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L331)

<a id="function-function-mq3-botlib-l-script-ps-expecttokentype-function-ps-expecttokentype-script-type-subtype-token-src-mq3-botlib-l-script-ml-187878548"></a>
### PS_ExpectTokenType

```ml
function PS_ExpectTokenType(script, type, subtype, token)
```

Apply `mq3.botlib.l_script.PS_ReadToken` and `mq3.botlib.l_script.ScriptError` while evaluating `PS_ExpectTokenType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place. |
| `type` | `dynamic` | — | Value used by `PS_ExpectTokenType` in `if token.type!=type then return ScriptError(script,"unexpected token type for "+token.string) end if`. |
| `subtype` | `dynamic` | — | Value used by `PS_ExpectTokenType` in `if type==TT_NUMBER and (token.subtype&subtype)!=subtype then return ScriptError(script,"unexpected number subtyp...`. |
| `token` | `dynamic` | — | Parsed token; accesses `type`, `string` and `subtype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L341)

<a id="function-function-mq3-botlib-l-script-ps-nextwhitespacechar-function-ps-nextwhitespacechar-script-src-mq3-botlib-l-script-ml-1398219511"></a>
### PS_NextWhiteSpaceChar

```ml
function PS_NextWhiteSpaceChar(script)
```

Set `script.whitespaceStart` to `script.whitespaceStart+1` in `mq3.botlib.l_script.PS_NextWhiteSpaceChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `whitespaceStart` and `whitespaceEnd`. May update `script.whitespaceStart` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L374)

<a id="function-function-mq3-botlib-l-script-ps-readescapecharacter-function-ps-readescapecharacter-script-ch-src-mq3-botlib-l-script-ml-955775172"></a>
### PS_ReadEscapeCharacter

```ml
function PS_ReadEscapeCharacter(script, ch)
```

Update `script.source.offset` and `ch[0]` during `PS_ReadEscapeCharacter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. May update `script.source.offset` in place. |
| `ch` | `dynamic` | — | Array or byte sequence accessed at `0`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L196)

<a id="function-function-mq3-botlib-l-script-ps-readliteral-function-ps-readliteral-script-token-src-mq3-botlib-l-script-ml-1035443264"></a>
### PS_ReadLiteral

```ml
function PS_ReadLiteral(script, token)
```

Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` during `PS_ReadLiteral`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. May update `script.source.offset` in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L237)

<a id="function-function-mq3-botlib-l-script-ps-readname-function-ps-readname-script-token-src-mq3-botlib-l-script-ml-75446998"></a>
### PS_ReadName

```ml
function PS_ReadName(script, token)
```

Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` during `PS_ReadName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. May update `script.source.offset` in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L246)

<a id="function-function-mq3-botlib-l-script-ps-readnumber-function-ps-readnumber-script-token-src-mq3-botlib-l-script-ml-1519460594"></a>
### PS_ReadNumber

```ml
function PS_ReadNumber(script, token)
```

Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` and related state during `PS_ReadNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. May update `script.source.offset` in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue`. May update `token.string`, `token.type` and `token.subtype` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L275)

<a id="function-function-mq3-botlib-l-script-ps-readprimitive-function-ps-readprimitive-script-token-src-mq3-botlib-l-script-ml-2087161344"></a>
### PS_ReadPrimitive

```ml
function PS_ReadPrimitive(script, token)
```

Update `script.source.offset`, `token.string` and `script.token` during `PS_ReadPrimitive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source` and `token`. May update `script.source.offset` and `script.token` in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`. May update `token.string` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L305)

<a id="function-function-mq3-botlib-l-script-ps-readpunctuation-function-ps-readpunctuation-script-token-src-mq3-botlib-l-script-ml-298715280"></a>
### PS_ReadPunctuation

```ml
function PS_ReadPunctuation(script, token)
```

Update `script.source.offset`, `token.string`, `token.type` and `token.subtype` during `PS_ReadPunctuation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `punctuations` and `source`. May update `script.source.offset` in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L295)

<a id="function-function-mq3-botlib-l-script-ps-readstring-function-ps-readstring-script-token-quote-src-mq3-botlib-l-script-ml-2134538774"></a>
### PS_ReadString

```ml
function PS_ReadString(script, token, quote)
```

Update `script.source.offset`, `script.source.line`, `token.string` and `token.type` and related state during `PS_ReadString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source` and `flags`. May update `script.source.offset` and `script.source.line` in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type` and `subtype`. May update `token.string`, `token.type` and `token.subtype` in place. |
| `quote` | `dynamic` | — | Value used by `PS_ReadString` in `if quote==34 then type=TT_STRING end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L214)

<a id="function-function-mq3-botlib-l-script-ps-readtoken-function-ps-readtoken-script-token-src-mq3-botlib-l-script-ml-2107774492"></a>
### PS_ReadToken

```ml
function PS_ReadToken(script, token)
```

Update `script.tokenAvailable`, `token.string`, `token.type` and `token.subtype` and related state during `PS_ReadToken`. Return paths include `ok`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place. |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. May update `token.string`, `token.type` and `token.subtype` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L313)

<a id="function-function-mq3-botlib-l-script-ps-readwhitespace-function-ps-readwhitespace-script-src-mq3-botlib-l-script-ml-447738149"></a>
### PS_ReadWhiteSpace

```ml
function PS_ReadWhiteSpace(script)
```

Set `script.source.line` to `script.source.line+1` and `script.source.offset` to `script.source.offset+1` in `mq3.botlib.l_script.PS_ReadWhiteSpace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. May update `script.source.line` and `script.source.offset` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L170)

<a id="function-function-mq3-botlib-l-script-ps-setbasefolder-function-ps-setbasefolder-runtime-path-src-mq3-botlib-l-script-ml-1100006199"></a>
### PS_SetBaseFolder

```ml
function PS_SetBaseFolder(runtime, path)
```

Set `runtime.baseFolder` to `path` in `mq3.botlib.l_script.PS_SetBaseFolder`. Return paths include `path`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | L script runtime; accesses `baseFolder`. May update `runtime.baseFolder` in place. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L458)

<a id="function-function-mq3-botlib-l-script-ps-skipuntilstring-function-ps-skipuntilstring-script-string-src-mq3-botlib-l-script-ml-1454040790"></a>
### PS_SkipUntilString

```ml
function PS_SkipUntilString(script, string)
```

Apply `mq3.botlib.l_script.emptyToken` and `mq3.botlib.l_script.PS_ReadToken` while evaluating `PS_SkipUntilString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place. |
| `string` | `dynamic` | — | Value used by `PS_SkipUntilString` in `while PS_ReadToken(script,token) if token.string==string then return true end if end while`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L364)

<a id="function-function-mq3-botlib-l-script-ps-unreadlasttoken-function-ps-unreadlasttoken-script-src-mq3-botlib-l-script-ml-2086702391"></a>
### PS_UnreadLastToken

```ml
function PS_UnreadLastToken(script)
```

Set `script.tokenAvailable` to `true` in `mq3.botlib.l_script.PS_UnreadLastToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `tokenAvailable`. May update `script.tokenAvailable` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L367)

<a id="function-function-mq3-botlib-l-script-ps-unreadtoken-function-ps-unreadtoken-script-token-src-mq3-botlib-l-script-ml-1387882280"></a>
### PS_UnreadToken

```ml
function PS_UnreadToken(script, token)
```

Set `script.token` to `copyToken(token)` and `script.tokenAvailable` to `true` in `mq3.botlib.l_script.PS_UnreadToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `token` and `tokenAvailable`. May update `script.token` and `script.tokenAvailable` in place. |
| `token` | `dynamic` | — | Value record; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L371)

- [mq3.botlib.l_script.Punctuation](Type-mq3-botlib-l-script-punctuation-1360470796.md) — struct
<a id="function-function-mq3-botlib-l-script-punctuationfromnum-function-punctuationfromnum-script-num-src-mq3-botlib-l-script-ml-1583308925"></a>
### PunctuationFromNum

```ml
function PunctuationFromNum(script, num)
```

Find the spelling of a punctuation code, retaining the released unknown-punctuation fallback text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `punctuations`. |
| `num` | `dynamic` | — | Value used by `PunctuationFromNum` in `for each value in script.punctuations if value.n==num then return value.p end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L166)

<a id="function-function-mq3-botlib-l-script-readsignedfloat-function-readsignedfloat-script-src-mq3-botlib-l-script-ml-1656420999"></a>
### ReadSignedFloat

```ml
function ReadSignedFloat(script)
```

Apply `mq3.botlib.l_script.emptyToken`, `mq3.botlib.l_script.PS_ExpectAnyToken` and `mq3.botlib.l_script.PS_ExpectTokenType` while evaluating `ReadSignedFloat`. Return paths include `sign*token.floatValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L383)

<a id="function-function-mq3-botlib-l-script-readsignedint-function-readsignedint-script-src-mq3-botlib-l-script-ml-1282859889"></a>
### ReadSignedInt

```ml
function ReadSignedInt(script)
```

Apply `mq3.botlib.l_script.emptyToken`, `mq3.botlib.l_script.PS_ExpectAnyToken` and `mq3.botlib.l_script.PS_ExpectTokenType` while evaluating `ReadSignedInt`. Return paths include `sign*token.intValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `freed`, `tokenAvailable`, `token`, `lastOffset` and `source` and related fields. May update `script.tokenAvailable`, `script.lastOffset` and `script.lastLine` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L386)

<a id="function-function-mq3-botlib-l-script-resetscript-function-resetscript-script-src-mq3-botlib-l-script-ml-475908347"></a>
### ResetScript

```ml
function ResetScript(script)
```

Update `script.source.offset`, `script.source.line`, `script.source.pending` and `script.lastOffset` and related state during `ResetScript`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`, `lastOffset`, `lastLine`, `whitespaceStart` and `whitespaceEnd` and related fields. May update `script.source.offset`, `script.source.line` and `script.source.pending` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L396)

- [mq3.botlib.l_script.Runtime](Type-mq3-botlib-l-script-runtime-1157087200.md) — struct
<a id="constant-constant-mq3-botlib-l-script-scfl-nobinarynumbers-const-scfl-nobinarynumbers-32-src-mq3-botlib-l-script-ml-1448255746"></a>
### SCFL_NOBINARYNUMBERS

```ml
const SCFL_NOBINARYNUMBERS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L16)

<a id="constant-constant-mq3-botlib-l-script-scfl-noerrors-const-scfl-noerrors-1-src-mq3-botlib-l-script-ml-1551570188"></a>
### SCFL_NOERRORS

```ml
const SCFL_NOERRORS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L11)

<a id="constant-constant-mq3-botlib-l-script-scfl-nonumbervalues-const-scfl-nonumbervalues-64-src-mq3-botlib-l-script-ml-715523827"></a>
### SCFL_NONUMBERVALUES

```ml
const SCFL_NONUMBERVALUES = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L17)

<a id="constant-constant-mq3-botlib-l-script-scfl-nostringescapechars-const-scfl-nostringescapechars-8-src-mq3-botlib-l-script-ml-1297941085"></a>
### SCFL_NOSTRINGESCAPECHARS

```ml
const SCFL_NOSTRINGESCAPECHARS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L14)

<a id="constant-constant-mq3-botlib-l-script-scfl-nostringwhitespaces-const-scfl-nostringwhitespaces-4-src-mq3-botlib-l-script-ml-2039984517"></a>
### SCFL_NOSTRINGWHITESPACES

```ml
const SCFL_NOSTRINGWHITESPACES = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L13)

<a id="constant-constant-mq3-botlib-l-script-scfl-nowarnings-const-scfl-nowarnings-2-src-mq3-botlib-l-script-ml-1749217339"></a>
### SCFL_NOWARNINGS

```ml
const SCFL_NOWARNINGS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L12)

<a id="constant-constant-mq3-botlib-l-script-scfl-primitive-const-scfl-primitive-16-src-mq3-botlib-l-script-ml-439530110"></a>
### SCFL_PRIMITIVE

```ml
const SCFL_PRIMITIVE = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L15)

- [mq3.botlib.l_script.Script](Type-mq3-botlib-l-script-script-1635807543.md) — struct
<a id="function-function-mq3-botlib-l-script-scripterror-function-scripterror-script-str-src-mq3-botlib-l-script-ml-1845000096"></a>
### ScriptError

```ml
function ScriptError(script, str)
```

Forward `ScriptError` to `mq3.botlib.l_script.emit` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `flags`, `runtime` and `source`. |
| `str` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L137)

<a id="function-function-mq3-botlib-l-script-scriptfromsource-function-scriptfromsource-runtime-source-src-mq3-botlib-l-script-ml-1037722225"></a>
### scriptFromSource

```ml
function scriptFromSource(runtime, source)
```

Apply `mq3.botlib.l_script.emptyToken` and `mq3.botlib.l_script.SetScriptPunctuations` while evaluating `scriptFromSource`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Initial value stored in `mq3.botlib.l_script.Script.runtime`. |
| `source` | `dynamic` | — | Parser source state; accesses `offset` and `line`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L417)

- [mq3.botlib.l_script.ScriptHost](Type-mq3-botlib-l-script-scripthost-1666266081.md) — struct
<a id="function-function-mq3-botlib-l-script-scriptskipto-function-scriptskipto-script-value-src-mq3-botlib-l-script-ml-1402119080"></a>
### ScriptSkipTo

```ml
function ScriptSkipTo(script, value)
```

Set `script.source.offset` to `script.source.offset+1` in `mq3.botlib.l_script.ScriptSkipTo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. May update `script.source.offset` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L406)

<a id="function-function-mq3-botlib-l-script-scriptwarning-function-scriptwarning-script-str-src-mq3-botlib-l-script-ml-73129304"></a>
### ScriptWarning

```ml
function ScriptWarning(script, str)
```

Forward `ScriptWarning` to `mq3.botlib.l_script.emit` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `flags`, `runtime` and `source`. |
| `str` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L141)

<a id="function-function-mq3-botlib-l-script-setscriptflags-function-setscriptflags-script-flags-src-mq3-botlib-l-script-ml-776058114"></a>
### SetScriptFlags

```ml
function SetScriptFlags(script, flags)
```

Set `script.flags` to `flags` in `mq3.botlib.l_script.SetScriptFlags`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `flags`. May update `script.flags` in place. |
| `flags` | `dynamic` | — | Value used by `SetScriptFlags` in `script.flags=flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L390)

<a id="function-function-mq3-botlib-l-script-setscriptpunctuations-function-setscriptpunctuations-script-p-src-mq3-botlib-l-script-ml-141938221"></a>
### SetScriptPunctuations

```ml
function SetScriptPunctuations(script, p)
```

Forward `SetScriptPunctuations` to `mq3.botlib.l_script.PS_CreatePunctuationTable` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `punctuations`. May update `script.punctuations` in place. |
| `p` | `dynamic` | — | Value used by `PS_CreatePunctuationTable` in `if punctuations==void then punctuations=defaultPunctuations() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L162)

<a id="function-function-mq3-botlib-l-script-span-function-span-script-start-count-src-mq3-botlib-l-script-ml-1282407396"></a>
### span

```ml
function span(script, start, count)
```

Decode a byte range from the lexical source, returning an empty string for a nonpositive length.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | `dynamic` | — | Lexical script state; accesses `source`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `slice`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L122)

<a id="function-function-mq3-botlib-l-script-stripdoublequotes-function-stripdoublequotes-string-src-mq3-botlib-l-script-ml-974980057"></a>
### StripDoubleQuotes

```ml
function StripDoubleQuotes(string)
```

Remove an optional leading and trailing double quote from lexical string text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L377)

<a id="function-function-mq3-botlib-l-script-stripsinglequotes-function-stripsinglequotes-string-src-mq3-botlib-l-script-ml-2025893099"></a>
### StripSingleQuotes

```ml
function StripSingleQuotes(string)
```

Remove an optional leading and trailing single quote from lexical literal text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L380)

- [mq3.botlib.l_script.Token](Type-mq3-botlib-l-script-token-222951337.md) — struct
<a id="function-function-mq3-botlib-l-script-topctoken-function-topctoken-token-src-mq3-botlib-l-script-ml-1553049111"></a>
### ToPCToken

```ml
function ToPCToken(token)
```

Build the `mq3.vm.pc_parser.Token` result for `ToPCToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Parsed token; accesses `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L467)

<a id="constant-constant-mq3-botlib-l-script-tt-binary-const-tt-binary-1024-src-mq3-botlib-l-script-ml-398524424"></a>
### TT_BINARY

```ml
const TT_BINARY = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L27)

<a id="constant-constant-mq3-botlib-l-script-tt-decimal-const-tt-decimal-8-src-mq3-botlib-l-script-ml-1419937379"></a>
### TT_DECIMAL

```ml
const TT_DECIMAL = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L24)

<a id="constant-constant-mq3-botlib-l-script-tt-float-const-tt-float-2048-src-mq3-botlib-l-script-ml-754257303"></a>
### TT_FLOAT

```ml
const TT_FLOAT = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L28)

<a id="constant-constant-mq3-botlib-l-script-tt-hex-const-tt-hex-256-src-mq3-botlib-l-script-ml-89601552"></a>
### TT_HEX

```ml
const TT_HEX = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L25)

<a id="constant-constant-mq3-botlib-l-script-tt-integer-const-tt-integer-4096-src-mq3-botlib-l-script-ml-1931116620"></a>
### TT_INTEGER

```ml
const TT_INTEGER = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L29)

<a id="constant-constant-mq3-botlib-l-script-tt-literal-const-tt-literal-2-src-mq3-botlib-l-script-ml-1973102573"></a>
### TT_LITERAL

```ml
const TT_LITERAL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L20)

<a id="constant-constant-mq3-botlib-l-script-tt-long-const-tt-long-8192-src-mq3-botlib-l-script-ml-37527265"></a>
### TT_LONG

```ml
const TT_LONG = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L30)

<a id="constant-constant-mq3-botlib-l-script-tt-name-const-tt-name-4-src-mq3-botlib-l-script-ml-614410197"></a>
### TT_NAME

```ml
const TT_NAME = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L22)

<a id="constant-constant-mq3-botlib-l-script-tt-number-const-tt-number-3-src-mq3-botlib-l-script-ml-1900268746"></a>
### TT_NUMBER

```ml
const TT_NUMBER = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L21)

<a id="constant-constant-mq3-botlib-l-script-tt-octal-const-tt-octal-512-src-mq3-botlib-l-script-ml-266099883"></a>
### TT_OCTAL

```ml
const TT_OCTAL = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L26)

<a id="constant-constant-mq3-botlib-l-script-tt-punctuation-const-tt-punctuation-5-src-mq3-botlib-l-script-ml-1253610976"></a>
### TT_PUNCTUATION

```ml
const TT_PUNCTUATION = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L23)

<a id="constant-constant-mq3-botlib-l-script-tt-string-const-tt-string-1-src-mq3-botlib-l-script-ml-1211792556"></a>
### TT_STRING

```ml
const TT_STRING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L19)

<a id="constant-constant-mq3-botlib-l-script-tt-unsigned-const-tt-unsigned-16384-src-mq3-botlib-l-script-ml-1442025713"></a>
### TT_UNSIGNED

```ml
const TT_UNSIGNED = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L31)

<a id="function-function-mq3-botlib-l-script-wrappcsource-function-wrappcsource-runtime-source-src-mq3-botlib-l-script-ml-1921587321"></a>
### WrapPCSource

```ml
function WrapPCSource(runtime, source)
```

Explicit adapters used when a productive pc_parser source must be consumed through the original botlib API. The cursor and line remain shared.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Initial value stored in `mq3.botlib.l_script.Script.runtime`. |
| `source` | `dynamic` | — | Parser source state; accesses `offset` and `line`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L464)
