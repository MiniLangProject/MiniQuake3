# `src/mq3/vm/pc_parser.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.pc_parser`](Package-mq3-vm-pc-parser-1928803480.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/time.ml` as `time` → `../MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-vm-pc-parser-adddefine-function-adddefine-registry-text-src-mq3-vm-pc-parser-ml-1872168718"></a>
### addDefine

```ml
function addDefine(registry, text)
```

Add define in vm.pc_parser; the normal completion returns `1`.

Direct state writes: `registry.defines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `defines`. Updated in place: `defines`. |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `Source("<global define>", bytes(text), 0, 1, 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L306)

- [mq3.vm.pc_parser.ArgumentResult](Type-mq3-vm-pc-parser-argumentresult-1280415052.md) — struct
<a id="function-function-mq3-vm-pc-parser-at-function-at-source-index-src-mq3-vm-pc-parser-ml-691168435"></a>
### at

```ml
function at(source, index)
```

Compute at in vm.pc_parser; the normal completion returns `source.data[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `data`. |
| `index` | `dynamic` | — | Zero-based index into `source.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L50)

<a id="function-function-mq3-vm-pc-parser-booleanvalue-function-booleanvalue-value-src-mq3-vm-pc-parser-ml-72083333"></a>
### booleanValue

```ml
function booleanValue(value)
```

Canonicalize a numeric expression result to the preprocessor boolean values zero and one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Numeric expression result; zero is false and every nonzero value is true. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L478)

<a id="function-function-mq3-vm-pc-parser-builtintoken-function-builtintoken-entry-token-src-mq3-vm-pc-parser-ml-175840093"></a>
### builtinToken

```ml
function builtinToken(entry, token)
```

Compute builtin token in vm.pc_parser; the normal completion returns `Token(TT_NAME, len(bytes(text)), 0, 0.0, text, token.line, token.leadingSpace)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Entry used in `entry[1]` and `len(entry[1])`. |
| `token` | `dynamic` | — | Record exposing `text`, `line`, `leadingSpace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L159)

<a id="function-function-mq3-vm-pc-parser-cleardefines-function-cleardefines-registry-src-mq3-vm-pc-parser-ml-244797763"></a>
### clearDefines

```ml
function clearDefines(registry)
```

Clear defines in vm.pc_parser; updates `registry.defines`.

Direct state writes: `registry.defines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Updated in place: `defines`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L314)

- [mq3.vm.pc_parser.Conditional](Type-mq3-vm-pc-parser-conditional-1771413818.md) — struct
<a id="function-function-mq3-vm-pc-parser-conditionalactive-function-conditionalactive-entry-src-mq3-vm-pc-parser-ml-471072374"></a>
### conditionalActive

```ml
function conditionalActive(entry)
```

Compute conditional active in vm.pc_parser; the normal completion returns `entry[3][(len(entry[3]) - 1)].active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Entry used in `entry[3]` and `len(entry[3])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L409)

<a id="function-function-mq3-vm-pc-parser-conditionaldirective-function-conditionaldirective-registry-entry-directive-line-src-mq3-vm-pc-parser-ml-963660590"></a>
### conditionalDirective

```ml
function conditionalDirective(registry, entry, directive, line)
```

Compute conditional directive in vm.pc_parser; the normal completion returns `fail("unknown conditional directive")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.vm.pc_parser.evaluateExpression`. |
| `entry` | `dynamic` | — | Entry passed as `entry` to `mq3.vm.pc_parser.lineTokens`. |
| `directive` | `dynamic` | — | Directive used in `("#" + directive)` and `(directive == "if")`. |
| `line` | `dynamic` | — | Line passed as `line` to `mq3.vm.pc_parser.lineTokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L573)

<a id="function-function-mq3-vm-pc-parser-create-function-create-context-loadfn-src-mq3-vm-pc-parser-ml-1733818003"></a>
### create

```ml
function create(context, loadFn)
```

Create `mq3.vm.pc_parser.Registry` with context=context; loadFn=loadFn; sources=array(MAX_SOURCEFILES, 0); defines=[].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.pc_parser.Registry` record. |
| `loadFn` | `dynamic` | — | Initial `loadFn` field stored in the returned or constructed `mq3.vm.pc_parser.Registry` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L46)

- [mq3.vm.pc_parser.Define](Type-mq3-vm-pc-parser-define-1095006429.md) — struct
<a id="function-function-mq3-vm-pc-parser-definedname-function-definedname-registry-name-src-mq3-vm-pc-parser-ml-994981842"></a>
### definedName

```ml
function definedName(registry, name)
```

Compute vm.pc_parser.definedName as `(isBuiltin(name) or (defineIndex(registry, name) >= 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.vm.pc_parser.defineIndex`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.pc_parser.isBuiltin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L149)

<a id="function-function-mq3-vm-pc-parser-defineindex-function-defineindex-registry-name-src-mq3-vm-pc-parser-ml-415589848"></a>
### defineIndex

```ml
function defineIndex(registry, name)
```

Compute define index in vm.pc_parser; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `defines`. |
| `name` | `dynamic` | — | Name used in `(registry.defines[index].name == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L142)

<a id="function-function-mq3-vm-pc-parser-definition-function-definition-values-src-mq3-vm-pc-parser-ml-1663753632"></a>
### definition

```ml
function definition(values)
```

Compute definition in vm.pc_parser; the normal completion returns `Define(name, parameters, body, functionLike)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Values used in `values[0]` and `values[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L185)

<a id="function-function-mq3-vm-pc-parser-digitvalue-function-digitvalue-value-src-mq3-vm-pc-parser-ml-390720905"></a>
### digitValue

```ml
function digitValue(value)
```

Decode a validated ASCII decimal or hexadecimal digit into its numeric value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | ASCII code for 0..9, A..F, or a..f; the lexer validates the character before calling. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L99)

<a id="function-function-mq3-vm-pc-parser-encode-function-encode-token-src-mq3-vm-pc-parser-ml-180430717"></a>
### encode

```ml
function encode(token)
```

Encode pc parser in vm.pc_parser; the normal completion returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Record exposing `type`, `subtype`, `intValue`, `floatValue`, `text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L642)

<a id="function-function-mq3-vm-pc-parser-escaped-function-escaped-value-src-mq3-vm-pc-parser-ml-381590867"></a>
### escaped

```ml
function escaped(value)
```

Compute escaped in vm.pc_parser; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value == 110)` and `(value == 114)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L79)

<a id="function-function-mq3-vm-pc-parser-evaluateexpression-function-evaluateexpression-registry-tokens-src-mq3-vm-pc-parser-ml-285024677"></a>
### evaluateExpression

```ml
function evaluateExpression(registry, tokens)
```

Compute evaluate expression in vm.pc_parser; the normal completion returns `[true, n.i32(value)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.vm.pc_parser.expandExpression`. |
| `tokens` | `dynamic` | — | Tokens passed as `tokens` to `mq3.vm.pc_parser.expandExpression`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L563)

<a id="function-function-mq3-vm-pc-parser-expandexpression-function-expandexpression-registry-tokens-depth-src-mq3-vm-pc-parser-ml-1216845700"></a>
### expandExpression

```ml
function expandExpression(registry, tokens, depth)
```

Compute expand expression in vm.pc_parser; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `defines`. |
| `tokens` | `dynamic` | — | Tokens passed as `tokens` to `mq3.vm.pc_parser.parseArguments`. |
| `depth` | `dynamic` | — | Depth used in `(depth + 1)` and `(depth > 32)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L437)

- [mq3.vm.pc_parser.Expression](Type-mq3-vm-pc-parser-expression-197418800.md) — struct
<a id="function-function-mq3-vm-pc-parser-expressionmatch-function-expressionmatch-state-text-src-mq3-vm-pc-parser-ml-1219346670"></a>
### expressionMatch

```ml
function expressionMatch(state, text)
```

Update `state.position` in vm.pc_parser; the normal completion returns `false`.

Direct state writes: `state.position`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `position`. Updated in place: `position`. |
| `text` | `dynamic` | — | Text used in `(token.text == text)` and `((token != void) and (token.text == text))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L475)

<a id="function-function-mq3-vm-pc-parser-expressionpeek-function-expressionpeek-state-src-mq3-vm-pc-parser-ml-1923863313"></a>
### expressionPeek

```ml
function expressionPeek(state)
```

Compute expression peek in vm.pc_parser; the normal completion returns `state.tokens[state.position]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `position`, `tokens`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L464)

<a id="function-function-mq3-vm-pc-parser-expressiontake-function-expressiontake-state-src-mq3-vm-pc-parser-ml-979232853"></a>
### expressionTake

```ml
function expressionTake(state)
```

Update `state.position` in vm.pc_parser; the normal completion returns `token`.

Direct state writes: `state.position`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `position`. Updated in place: `position`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L469)

<a id="function-function-mq3-vm-pc-parser-fail-function-fail-message-src-mq3-vm-pc-parser-ml-1258602967"></a>
### fail

```ml
function fail(message)
```

Create the vm.pc_parser error for `fail` with 7691 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("PC parser: " + message)` and `error(7691, ("PC parser: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L42)

<a id="function-function-mq3-vm-pc-parser-free-function-free-registry-handle-src-mq3-vm-pc-parser-ml-332183917"></a>
### free

```ml
function free(registry, handle)
```

Compute free in vm.pc_parser; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `sources`. |
| `handle` | `dynamic` | — | Zero-based index into `registry.sources`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L327)

<a id="function-function-mq3-vm-pc-parser-integervalue-function-integervalue-text-base-start-src-mq3-vm-pc-parser-ml-1277054864"></a>
### integerValue

```ml
function integerValue(text, base, start)
```

Compute integer value in vm.pc_parser; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |
| `base` | `dynamic` | — | Base used in `(value * base)` and `((value * base) + digitValue(data[index]))`. |
| `start` | `dynamic` | — | Start operand used by `integerValue`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L104)

<a id="function-function-mq3-vm-pc-parser-isbuiltin-function-isbuiltin-name-src-mq3-vm-pc-parser-ml-1535012937"></a>
### isBuiltin

```ml
function isBuiltin(name)
```

Compute vm.pc_parser.isBuiltin as `((((name == "__LINE__") or (name == "__FILE__")) or (name == "__DATE__")) or (name == "__TIME__"))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(name == "__LINE__")` and `(name == "__FILE__")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L145)

<a id="function-function-mq3-vm-pc-parser-isdigit-function-isdigit-value-src-mq3-vm-pc-parser-ml-774553939"></a>
### isDigit

```ml
function isDigit(value)
```

Compute vm.pc_parser.isDigit as `((value >= 48) and (value <= 57))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value >= 48)` and `(value <= 57)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L59)

<a id="function-function-mq3-vm-pc-parser-isname-function-isname-value-src-mq3-vm-pc-parser-ml-1578310017"></a>
### isName

```ml
function isName(value)
```

Compute vm.pc_parser.isName as `(isNameStart(value) or ((value >= 48) and (value <= 57)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.pc_parser.isNameStart`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L56)

<a id="function-function-mq3-vm-pc-parser-isnamestart-function-isnamestart-value-src-mq3-vm-pc-parser-ml-981734831"></a>
### isNameStart

```ml
function isNameStart(value)
```

Compute vm.pc_parser.isNameStart as `(((value == 95) or ((value >= 65) and (value <= 90))) or ((value >= 97) and (value <= 122)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value == 95)` and `(value >= 65)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L53)

<a id="function-function-mq3-vm-pc-parser-linetokens-function-linetokens-entry-line-src-mq3-vm-pc-parser-ml-802998844"></a>
### lineTokens

```ml
function lineTokens(entry, line)
```

Apply `mq3.vm.pc_parser.pcNextRaw`, `mq3.vm.pc_parser.unread` for line tokens in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Entry passed as `entry` to `mq3.vm.pc_parser.pcNextRaw`. |
| `line` | `dynamic` | — | Line used in `(token.line != activeLine)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L391)

<a id="function-function-mq3-vm-pc-parser-load-function-load-registry-name-src-mq3-vm-pc-parser-ml-1871567186"></a>
### load

```ml
function load(registry, name)
```

Load pc parser in vm.pc_parser; the normal completion returns `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `loadFn`, `sources`, `context`. |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.vm.pc_parser.Source` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L318)

<a id="function-function-mq3-vm-pc-parser-location-function-location-registry-handle-src-mq3-vm-pc-parser-ml-1081660497"></a>
### location

```ml
function location(registry, handle)
```

Compute location in vm.pc_parser; the normal completion returns `[entry[0], source.line]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `sources`. |
| `handle` | `dynamic` | — | Zero-based index into `registry.sources`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L637)

- [mq3.vm.pc_parser.MacroExpansion](Type-mq3-vm-pc-parser-macroexpansion-1759381183.md) — struct
<a id="constant-constant-mq3-vm-pc-parser-max-sourcefiles-const-max-sourcefiles-64-src-mq3-vm-pc-parser-ml-230521899"></a>
### MAX_SOURCEFILES

```ml
const MAX_SOURCEFILES = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L8)

<a id="constant-constant-mq3-vm-pc-parser-max-tokenlength-const-max-tokenlength-1024-src-mq3-vm-pc-parser-ml-798737178"></a>
### MAX_TOKENLENGTH

```ml
const MAX_TOKENLENGTH = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L9)

<a id="function-function-mq3-vm-pc-parser-mergedtoken-function-mergedtoken-left-right-src-mq3-vm-pc-parser-ml-1742125155"></a>
### mergedToken

```ml
function mergedToken(left, right)
```

Compute merged token in vm.pc_parser; the normal completion returns `fail(((("can't merge " + left.text) + " with ") + right.text))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record exposing `type`, `text`, `line`, `leadingSpace`. |
| `right` | `dynamic` | — | Record exposing `type`, `text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L249)

<a id="function-function-mq3-vm-pc-parser-monthname-function-monthname-value-src-mq3-vm-pc-parser-ml-660899983"></a>
### monthName

```ml
function monthName(value)
```

Compute vm.pc_parser.monthName as `["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"][(value - 1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value - 1)` and `["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"][(value - 1)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L155)

<a id="constant-constant-mq3-vm-pc-parser-p-precomp-const-p-precomp-51-src-mq3-vm-pc-parser-ml-1743577515"></a>
### P_PRECOMP

```ml
const P_PRECOMP = 51
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L21)

<a id="function-function-mq3-vm-pc-parser-parametercount-function-parametercount-value-src-mq3-vm-pc-parser-ml-1481653689"></a>
### parameterCount

```ml
function parameterCount(value)
```

Compute parameter count in vm.pc_parser; the normal completion returns `len(value.parameters)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `parameters`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L214)

<a id="function-function-mq3-vm-pc-parser-parameterindex-function-parameterindex-definition-name-src-mq3-vm-pc-parser-ml-417340884"></a>
### parameterIndex

```ml
function parameterIndex(definition, name)
```

Compute parameter index in vm.pc_parser; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `definition` | `dynamic` | — | Record exposing `parameters`. |
| `name` | `dynamic` | — | Name used in `(definition.parameters[index] == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L180)

<a id="function-function-mq3-vm-pc-parser-parseadd-function-parseadd-state-src-mq3-vm-pc-parser-ml-1041405085"></a>
### parseAdd

```ml
function parseAdd(state)
```

Parse add in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseMultiply`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L527)

<a id="function-function-mq3-vm-pc-parser-parsearguments-function-parsearguments-tokens-openindex-expected-src-mq3-vm-pc-parser-ml-2037624104"></a>
### parseArguments

```ml
function parseArguments(tokens, openIndex, expected)
```

Parse arguments in vm.pc_parser; the normal completion returns `ArgumentResult(false, index, 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — | Tokens used in `len(tokens)` and `tokens[index]`. |
| `openIndex` | `dynamic` | — | Initial `next` field stored in the returned or constructed `mq3.vm.pc_parser.ArgumentResult` record. |
| `expected` | `dynamic` | — | Expected used in `(expected > 0)` and `(expected == 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L219)

<a id="function-function-mq3-vm-pc-parser-parsebitand-function-parsebitand-state-src-mq3-vm-pc-parser-ml-1190318891"></a>
### parseBitAnd

```ml
function parseBitAnd(state)
```

Parse bit and in vm.pc_parser; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseEquality`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L547)

<a id="function-function-mq3-vm-pc-parser-parsebitor-function-parsebitor-state-src-mq3-vm-pc-parser-ml-419148873"></a>
### parseBitOr

```ml
function parseBitOr(state)
```

Parse bit or in vm.pc_parser; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseBitXor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L553)

<a id="function-function-mq3-vm-pc-parser-parsebitxor-function-parsebitxor-state-src-mq3-vm-pc-parser-ml-1584050055"></a>
### parseBitXor

```ml
function parseBitXor(state)
```

Parse bit xor in vm.pc_parser; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseBitAnd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L550)

<a id="function-function-mq3-vm-pc-parser-parseconditionalexpression-function-parseconditionalexpression-state-src-mq3-vm-pc-parser-ml-961296157"></a>
### parseConditionalExpression

```ml
function parseConditionalExpression(state)
```

Parse conditional expression in vm.pc_parser; the normal completion returns `condition`.

Direct state writes: `state.valid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `valid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L484)

<a id="function-function-mq3-vm-pc-parser-parseequality-function-parseequality-state-src-mq3-vm-pc-parser-ml-1169679083"></a>
### parseEquality

```ml
function parseEquality(state)
```

Parse equality in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseRelational`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L542)

<a id="function-function-mq3-vm-pc-parser-parselogicaland-function-parselogicaland-state-src-mq3-vm-pc-parser-ml-831963183"></a>
### parseLogicalAnd

```ml
function parseLogicalAnd(state)
```

Parse logical and in vm.pc_parser; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseBitOr`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L556)

<a id="function-function-mq3-vm-pc-parser-parselogicalor-function-parselogicalor-state-src-mq3-vm-pc-parser-ml-1629821029"></a>
### parseLogicalOr

```ml
function parseLogicalOr(state)
```

Parse logical or in vm.pc_parser; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseLogicalAnd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L559)

<a id="function-function-mq3-vm-pc-parser-parsemultiply-function-parsemultiply-state-src-mq3-vm-pc-parser-ml-1851197683"></a>
### parseMultiply

```ml
function parseMultiply(state)
```

Parse multiply in vm.pc_parser; updates `state.valid`.

Direct state writes: `state.valid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `valid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L516)

<a id="function-function-mq3-vm-pc-parser-parseprimary-function-parseprimary-state-src-mq3-vm-pc-parser-ml-240466365"></a>
### parsePrimary

```ml
function parsePrimary(state)
```

Parse primary in vm.pc_parser; the normal completion returns `0`.

Direct state writes: `state.valid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `registry`. Updated in place: `valid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L493)

<a id="function-function-mq3-vm-pc-parser-parserelational-function-parserelational-state-src-mq3-vm-pc-parser-ml-816275741"></a>
### parseRelational

```ml
function parseRelational(state)
```

Parse relational in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseShift`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L537)

<a id="function-function-mq3-vm-pc-parser-parseshift-function-parseshift-state-src-mq3-vm-pc-parser-ml-1195345153"></a>
### parseShift

```ml
function parseShift(state)
```

Parse shift in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.parseAdd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L532)

<a id="function-function-mq3-vm-pc-parser-parseunary-function-parseunary-state-src-mq3-vm-pc-parser-ml-58790429"></a>
### parseUnary

```ml
function parseUnary(state)
```

Parse unary in vm.pc_parser; the normal completion returns `parsePrimary(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.vm.pc_parser.expressionMatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L505)

<a id="function-function-mq3-vm-pc-parser-pcnextraw-function-pcnextraw-entry-src-mq3-vm-pc-parser-ml-2090142870"></a>
### pcNextRaw

```ml
function pcNextRaw(entry)
```

Update `entry entries` in vm.pc_parser.

Direct state writes: `entry elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Mutable sequence written at `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L353)

<a id="function-function-mq3-vm-pc-parser-popconditional-function-popconditional-entry-src-mq3-vm-pc-parser-ml-817044954"></a>
### popConditional

```ml
function popConditional(entry)
```

Update `entry entries` in vm.pc_parser; the normal completion returns `true`.

Direct state writes: `entry elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Mutable sequence written at `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L428)

<a id="function-function-mq3-vm-pc-parser-punctuationnumber-function-punctuationnumber-index-src-mq3-vm-pc-parser-ml-1021938560"></a>
### punctuationNumber

```ml
function punctuationNumber(index)
```

Compute vm.pc_parser.punctuationNumber as `(index + 1)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index used in `(index + 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L64)

<a id="function-function-mq3-vm-pc-parser-punctuationstrings-function-punctuationstrings-src-mq3-vm-pc-parser-ml-1890130402"></a>
### punctuationStrings

```ml
function punctuationStrings()
```

List the 52 names in vm.pc_parser.punctuationStrings, beginning with `>>=`, `<<=`, `...`, `##`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L61)

<a id="function-function-mq3-vm-pc-parser-pushconditional-function-pushconditional-entry-parent-selected-src-mq3-vm-pc-parser-ml-1007327829"></a>
### pushConditional

```ml
function pushConditional(entry, parent, selected)
```

Update `entry entries` in vm.pc_parser.

Direct state writes: `entry elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Mutable sequence written at `3`. |
| `parent` | `dynamic` | — | Initial `parentActive` field stored in the returned or constructed `mq3.vm.pc_parser.Conditional` record. |
| `selected` | `dynamic` | — | Initial `branchTaken` field stored in the returned or constructed `mq3.vm.pc_parser.Conditional` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L419)

<a id="function-function-mq3-vm-pc-parser-pushinclude-function-pushinclude-registry-entry-name-src-mq3-vm-pc-parser-ml-2067703448"></a>
### pushInclude

```ml
function pushInclude(registry, entry, name)
```

Update `entry entries` in vm.pc_parser; the normal completion returns `true`.

Direct state writes: `entry elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `loadFn`, `context`. |
| `entry` | `dynamic` | — | Mutable sequence written at `1`. |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.vm.pc_parser.Source` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L334)

<a id="function-function-mq3-vm-pc-parser-queuefront-function-queuefront-entry-tokens-src-mq3-vm-pc-parser-ml-198538756"></a>
### queueFront

```ml
function queueFront(entry, tokens)
```

Queue front in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Entry used in `entry[1]` and `len(entry[1])`. |
| `tokens` | `dynamic` | — | Tokens used in `(tokens + source.pending)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L380)

<a id="function-function-mq3-vm-pc-parser-raw-function-raw-source-src-mq3-vm-pc-parser-ml-2056762445"></a>
### raw

```ml
function raw(source)
```

Update `source.offset` in vm.pc_parser; the normal completion returns `fail(((("unrecognized token at " + source.name) + ":") + str(source.line)))`.

Direct state writes: `source.offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `offset`, `line`, `data`, `name`. Updated in place: `offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L131)

<a id="function-function-mq3-vm-pc-parser-read-function-read-registry-sourcehandle-src-mq3-vm-pc-parser-ml-949950114"></a>
### read

```ml
function read(registry, sourceHandle)
```

Read pc parser in vm.pc_parser; updates `registry.defines`.

Direct state writes: `registry.defines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `sources`, `defines`. Updated in place: `defines`. |
| `sourceHandle` | `dynamic` | — | Zero-based index into `registry.sources`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L596)

<a id="function-function-mq3-vm-pc-parser-readnumber-function-readnumber-source-leadingspace-src-mq3-vm-pc-parser-ml-800703993"></a>
### readNumber

```ml
function readNumber(source, leadingSpace)
```

Read number in vm.pc_parser; the normal completion returns `Token(TT_NUMBER, subtype, intValue, floatValue, text, started, leadingSpace)`.

Direct state writes: `source.offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `line`, `offset`, `data`. Updated in place: `offset`. |
| `leadingSpace` | `dynamic` | — | Initial `leadingSpace` field stored in the returned or constructed `mq3.vm.pc_parser.Token` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L112)

<a id="function-function-mq3-vm-pc-parser-readstring-function-readstring-source-quote-leadingspace-src-mq3-vm-pc-parser-ml-1887678371"></a>
### readString

```ml
function readString(source, quote, leadingSpace)
```

Read string in vm.pc_parser; the normal completion returns `Token(type, subtype, 0, 0.0, decode(slice(result, 0, count)), started, leadingSpace)`.

Direct state writes: `source.offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `line`, `offset`. Updated in place: `offset`. |
| `quote` | `dynamic` | — | Quote used in `(quote == 39)` and `(at(source, source.offset) != quote)`. |
| `leadingSpace` | `dynamic` | — | Initial `leadingSpace` field stored in the returned or constructed `mq3.vm.pc_parser.Token` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L86)

- [mq3.vm.pc_parser.Registry](Type-mq3-vm-pc-parser-registry-328656313.md) — struct
<a id="function-function-mq3-vm-pc-parser-skip-function-skip-source-src-mq3-vm-pc-parser-ml-1306697005"></a>
### skip

```ml
function skip(source)
```

Update `source.line`, `source.offset` in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `offset`, `line`. Updated in place: `line`, `offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L67)

- [mq3.vm.pc_parser.Source](Type-mq3-vm-pc-parser-source-1350446047.md) — struct
<a id="function-function-mq3-vm-pc-parser-sourcemacroexpansion-function-sourcemacroexpansion-entry-value-line-src-mq3-vm-pc-parser-ml-802229831"></a>
### sourceMacroExpansion

```ml
function sourceMacroExpansion(entry, value, line)
```

Compute source macro expansion in vm.pc_parser; the normal completion returns `MacroExpansion(true, true, tokens)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Entry passed as `entry` to `mq3.vm.pc_parser.take`. |
| `value` | `dynamic` | — | Record exposing `functionLike`, `tokens`, `name`. |
| `line` | `dynamic` | — | Line passed as `line` to `mq3.vm.pc_parser.substituteMacro`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L289)

<a id="function-function-mq3-vm-pc-parser-sourcetake-function-sourcetake-source-src-mq3-vm-pc-parser-ml-1259128109"></a>
### sourceTake

```ml
function sourceTake(source)
```

Update `source.pending` in vm.pc_parser; the normal completion returns `token`.

Direct state writes: `source.pending`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `pending`. Updated in place: `pending`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L342)

<a id="function-function-mq3-vm-pc-parser-stringized-function-stringized-argument-line-src-mq3-vm-pc-parser-ml-770891961"></a>
### stringized

```ml
function stringized(argument, line)
```

Compute stringized in vm.pc_parser; the normal completion returns `Token(TT_STRING, (len(bytes(text)) + 2), 0, 0.0, text, line, false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argument` | `dynamic` | — | Argument used in `(argument != 0)`. |
| `line` | `dynamic` | — | Initial `line` field stored in the returned or constructed `mq3.vm.pc_parser.Token` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L241)

<a id="function-function-mq3-vm-pc-parser-substitutemacro-function-substitutemacro-value-arguments-line-src-mq3-vm-pc-parser-ml-859076977"></a>
### substituteMacro

```ml
function substituteMacro(value, arguments, line)
```

Compute substitute macro in vm.pc_parser; the normal completion returns `merged`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `tokens`. |
| `arguments` | `dynamic` | — | Arguments used in `arguments[parameter]` and `stringized(arguments[parameter], line)`. |
| `line` | `dynamic` | — | Line passed as `line` to `mq3.vm.pc_parser.stringized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L258)

<a id="function-function-mq3-vm-pc-parser-take-function-take-entry-src-mq3-vm-pc-parser-ml-624533966"></a>
### take

```ml
function take(entry)
```

Return `mq3.vm.pc_parser.pcNextRaw(entry)` from `vm.pc_parser.take`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Entry passed as `entry` to `mq3.vm.pc_parser.pcNextRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L385)

- [mq3.vm.pc_parser.Token](Type-mq3-vm-pc-parser-token-735227767.md) — struct
<a id="constant-constant-mq3-vm-pc-parser-token-size-const-token-size-1040-src-mq3-vm-pc-parser-ml-2127114480"></a>
### TOKEN_SIZE

```ml
const TOKEN_SIZE = 1040
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L10)

<a id="function-function-mq3-vm-pc-parser-tokenlistappend-function-tokenlistappend-list-token-src-mq3-vm-pc-parser-ml-1152234695"></a>
### tokenListAppend

```ml
function tokenListAppend(list, token)
```

Compute token list append in vm.pc_parser; the normal completion returns `(list + [token])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | List used in `(list == 0)` and `(list == void)`. |
| `token` | `dynamic` | — | Token used in `(list + [token])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L176)

<a id="constant-constant-mq3-vm-pc-parser-tt-decimal-const-tt-decimal-8-src-mq3-vm-pc-parser-ml-56631243"></a>
### TT_DECIMAL

```ml
const TT_DECIMAL = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L16)

<a id="constant-constant-mq3-vm-pc-parser-tt-float-const-tt-float-2048-src-mq3-vm-pc-parser-ml-1377492967"></a>
### TT_FLOAT

```ml
const TT_FLOAT = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L19)

<a id="constant-constant-mq3-vm-pc-parser-tt-hex-const-tt-hex-256-src-mq3-vm-pc-parser-ml-1743559602"></a>
### TT_HEX

```ml
const TT_HEX = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L17)

<a id="constant-constant-mq3-vm-pc-parser-tt-integer-const-tt-integer-4096-src-mq3-vm-pc-parser-ml-1021740966"></a>
### TT_INTEGER

```ml
const TT_INTEGER = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L20)

<a id="constant-constant-mq3-vm-pc-parser-tt-literal-const-tt-literal-2-src-mq3-vm-pc-parser-ml-1981385617"></a>
### TT_LITERAL

```ml
const TT_LITERAL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L12)

<a id="constant-constant-mq3-vm-pc-parser-tt-name-const-tt-name-4-src-mq3-vm-pc-parser-ml-1066339501"></a>
### TT_NAME

```ml
const TT_NAME = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L14)

<a id="constant-constant-mq3-vm-pc-parser-tt-number-const-tt-number-3-src-mq3-vm-pc-parser-ml-1421632624"></a>
### TT_NUMBER

```ml
const TT_NUMBER = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L13)

<a id="constant-constant-mq3-vm-pc-parser-tt-octal-const-tt-octal-512-src-mq3-vm-pc-parser-ml-1004437855"></a>
### TT_OCTAL

```ml
const TT_OCTAL = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L18)

<a id="constant-constant-mq3-vm-pc-parser-tt-punctuation-const-tt-punctuation-5-src-mq3-vm-pc-parser-ml-1763350426"></a>
### TT_PUNCTUATION

```ml
const TT_PUNCTUATION = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L15)

<a id="constant-constant-mq3-vm-pc-parser-tt-string-const-tt-string-1-src-mq3-vm-pc-parser-ml-85887446"></a>
### TT_STRING

```ml
const TT_STRING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L11)

<a id="function-function-mq3-vm-pc-parser-twodigits-function-twodigits-value-src-mq3-vm-pc-parser-ml-1858258105"></a>
### twoDigits

```ml
function twoDigits(value)
```

Compute two digits in vm.pc_parser; the normal completion returns `str(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `str(value)` and `(value < 10)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L152)

<a id="function-function-mq3-vm-pc-parser-unread-function-unread-entry-token-src-mq3-vm-pc-parser-ml-833806765"></a>
### unread

```ml
function unread(entry, token)
```

Compute unread in vm.pc_parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Entry used in `entry[1]` and `len(entry[1])`. |
| `token` | `dynamic` | — | Token used in `(token == void)` and `([token] + source.pending)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L372)
