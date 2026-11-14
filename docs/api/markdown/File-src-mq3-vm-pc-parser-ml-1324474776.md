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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L208)

- [mq3.vm.pc_parser.ArgumentResult](Type-mq3-vm-pc-parser-argumentresult-1280415052.md) — struct
<a id="function-function-mq3-vm-pc-parser-at-function-at-source-index-src-mq3-vm-pc-parser-ml-691168435"></a>
### at

```ml
function at(source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L34)

<a id="function-function-mq3-vm-pc-parser-booleanvalue-function-booleanvalue-value-src-mq3-vm-pc-parser-ml-72083333"></a>
### booleanValue

```ml
function booleanValue(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L316)

<a id="function-function-mq3-vm-pc-parser-builtintoken-function-builtintoken-entry-token-src-mq3-vm-pc-parser-ml-175840093"></a>
### builtinToken

```ml
function builtinToken(entry, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L94)

<a id="function-function-mq3-vm-pc-parser-cleardefines-function-cleardefines-registry-src-mq3-vm-pc-parser-ml-244797763"></a>
### clearDefines

```ml
function clearDefines(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L212)

- [mq3.vm.pc_parser.Conditional](Type-mq3-vm-pc-parser-conditional-1771413818.md) — struct
<a id="function-function-mq3-vm-pc-parser-conditionalactive-function-conditionalactive-entry-src-mq3-vm-pc-parser-ml-471072374"></a>
### conditionalActive

```ml
function conditionalActive(entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L274)

<a id="function-function-mq3-vm-pc-parser-conditionaldirective-function-conditionaldirective-registry-entry-directive-line-src-mq3-vm-pc-parser-ml-963660590"></a>
### conditionalDirective

```ml
function conditionalDirective(registry, entry, directive, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `entry` | `dynamic` | — |  |
| `directive` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L371)

<a id="function-function-mq3-vm-pc-parser-create-function-create-context-loadfn-src-mq3-vm-pc-parser-ml-1733818003"></a>
### create

```ml
function create(context, loadFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `loadFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L33)

- [mq3.vm.pc_parser.Define](Type-mq3-vm-pc-parser-define-1095006429.md) — struct
<a id="function-function-mq3-vm-pc-parser-definedname-function-definedname-registry-name-src-mq3-vm-pc-parser-ml-994981842"></a>
### definedName

```ml
function definedName(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L91)

<a id="function-function-mq3-vm-pc-parser-defineindex-function-defineindex-registry-name-src-mq3-vm-pc-parser-ml-415589848"></a>
### defineIndex

```ml
function defineIndex(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L89)

<a id="function-function-mq3-vm-pc-parser-definition-function-definition-values-src-mq3-vm-pc-parser-ml-1663753632"></a>
### definition

```ml
function definition(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L112)

<a id="function-function-mq3-vm-pc-parser-digitvalue-function-digitvalue-value-src-mq3-vm-pc-parser-ml-390720905"></a>
### digitValue

```ml
function digitValue(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L62)

<a id="function-function-mq3-vm-pc-parser-encode-function-encode-token-src-mq3-vm-pc-parser-ml-180430717"></a>
### encode

```ml
function encode(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L430)

<a id="function-function-mq3-vm-pc-parser-escaped-function-escaped-value-src-mq3-vm-pc-parser-ml-381590867"></a>
### escaped

```ml
function escaped(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L50)

<a id="function-function-mq3-vm-pc-parser-evaluateexpression-function-evaluateexpression-registry-tokens-src-mq3-vm-pc-parser-ml-285024677"></a>
### evaluateExpression

```ml
function evaluateExpression(registry, tokens)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L366)

<a id="function-function-mq3-vm-pc-parser-expandexpression-function-expandexpression-registry-tokens-depth-src-mq3-vm-pc-parser-ml-1216845700"></a>
### expandExpression

```ml
function expandExpression(registry, tokens, depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L288)

- [mq3.vm.pc_parser.Expression](Type-mq3-vm-pc-parser-expression-197418800.md) — struct
<a id="function-function-mq3-vm-pc-parser-expressionmatch-function-expressionmatch-state-text-src-mq3-vm-pc-parser-ml-1219346670"></a>
### expressionMatch

```ml
function expressionMatch(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L315)

<a id="function-function-mq3-vm-pc-parser-expressionpeek-function-expressionpeek-state-src-mq3-vm-pc-parser-ml-1923863313"></a>
### expressionPeek

```ml
function expressionPeek(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L313)

<a id="function-function-mq3-vm-pc-parser-expressiontake-function-expressiontake-state-src-mq3-vm-pc-parser-ml-979232853"></a>
### expressionTake

```ml
function expressionTake(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L314)

<a id="function-function-mq3-vm-pc-parser-fail-function-fail-message-src-mq3-vm-pc-parser-ml-1258602967"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L32)

<a id="function-function-mq3-vm-pc-parser-free-function-free-registry-handle-src-mq3-vm-pc-parser-ml-332183917"></a>
### free

```ml
function free(registry, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L219)

<a id="function-function-mq3-vm-pc-parser-integervalue-function-integervalue-text-base-start-src-mq3-vm-pc-parser-ml-1277054864"></a>
### integerValue

```ml
function integerValue(text, base, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L63)

<a id="function-function-mq3-vm-pc-parser-isbuiltin-function-isbuiltin-name-src-mq3-vm-pc-parser-ml-1535012937"></a>
### isBuiltin

```ml
function isBuiltin(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L90)

<a id="function-function-mq3-vm-pc-parser-isdigit-function-isdigit-value-src-mq3-vm-pc-parser-ml-774553939"></a>
### isDigit

```ml
function isDigit(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L37)

<a id="function-function-mq3-vm-pc-parser-isname-function-isname-value-src-mq3-vm-pc-parser-ml-1578310017"></a>
### isName

```ml
function isName(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L36)

<a id="function-function-mq3-vm-pc-parser-isnamestart-function-isnamestart-value-src-mq3-vm-pc-parser-ml-981734831"></a>
### isNameStart

```ml
function isNameStart(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L35)

<a id="function-function-mq3-vm-pc-parser-linetokens-function-linetokens-entry-line-src-mq3-vm-pc-parser-ml-802998844"></a>
### lineTokens

```ml
function lineTokens(entry, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L258)

<a id="function-function-mq3-vm-pc-parser-load-function-load-registry-name-src-mq3-vm-pc-parser-ml-1871567186"></a>
### load

```ml
function load(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L213)

<a id="function-function-mq3-vm-pc-parser-location-function-location-registry-handle-src-mq3-vm-pc-parser-ml-1081660497"></a>
### location

```ml
function location(registry, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L427)

- [mq3.vm.pc_parser.MacroExpansion](Type-mq3-vm-pc-parser-macroexpansion-1759381183.md) — struct
<a id="constant-constant-mq3-vm-pc-parser-max-sourcefiles-const-max-sourcefiles-64-src-mq3-vm-pc-parser-ml-230521899"></a>
### MAX_SOURCEFILES

```ml
const MAX_SOURCEFILES = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L8)

<a id="constant-constant-mq3-vm-pc-parser-max-tokenlength-const-max-tokenlength-1024-src-mq3-vm-pc-parser-ml-798737178"></a>
### MAX_TOKENLENGTH

```ml
const MAX_TOKENLENGTH = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L9)

<a id="function-function-mq3-vm-pc-parser-mergedtoken-function-mergedtoken-left-right-src-mq3-vm-pc-parser-ml-1742125155"></a>
### mergedToken

```ml
function mergedToken(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L164)

<a id="function-function-mq3-vm-pc-parser-monthname-function-monthname-value-src-mq3-vm-pc-parser-ml-660899983"></a>
### monthName

```ml
function monthName(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L93)

<a id="constant-constant-mq3-vm-pc-parser-p-precomp-const-p-precomp-51-src-mq3-vm-pc-parser-ml-1743577515"></a>
### P_PRECOMP

```ml
const P_PRECOMP = 51
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L21)

<a id="function-function-mq3-vm-pc-parser-parametercount-function-parametercount-value-src-mq3-vm-pc-parser-ml-1481653689"></a>
### parameterCount

```ml
function parameterCount(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L139)

<a id="function-function-mq3-vm-pc-parser-parameterindex-function-parameterindex-definition-name-src-mq3-vm-pc-parser-ml-417340884"></a>
### parameterIndex

```ml
function parameterIndex(definition, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `definition` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L109)

<a id="function-function-mq3-vm-pc-parser-parseadd-function-parseadd-state-src-mq3-vm-pc-parser-ml-1041405085"></a>
### parseAdd

```ml
function parseAdd(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L349)

<a id="function-function-mq3-vm-pc-parser-parsearguments-function-parsearguments-tokens-openindex-expected-src-mq3-vm-pc-parser-ml-2037624104"></a>
### parseArguments

```ml
function parseArguments(tokens, openIndex, expected)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — |  |
| `openIndex` | `dynamic` | — |  |
| `expected` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L140)

<a id="function-function-mq3-vm-pc-parser-parsebitand-function-parsebitand-state-src-mq3-vm-pc-parser-ml-1190318891"></a>
### parseBitAnd

```ml
function parseBitAnd(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L361)

<a id="function-function-mq3-vm-pc-parser-parsebitor-function-parsebitor-state-src-mq3-vm-pc-parser-ml-419148873"></a>
### parseBitOr

```ml
function parseBitOr(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L363)

<a id="function-function-mq3-vm-pc-parser-parsebitxor-function-parsebitxor-state-src-mq3-vm-pc-parser-ml-1584050055"></a>
### parseBitXor

```ml
function parseBitXor(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L362)

<a id="function-function-mq3-vm-pc-parser-parseconditionalexpression-function-parseconditionalexpression-state-src-mq3-vm-pc-parser-ml-961296157"></a>
### parseConditionalExpression

```ml
function parseConditionalExpression(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L318)

<a id="function-function-mq3-vm-pc-parser-parseequality-function-parseequality-state-src-mq3-vm-pc-parser-ml-1169679083"></a>
### parseEquality

```ml
function parseEquality(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L358)

<a id="function-function-mq3-vm-pc-parser-parselogicaland-function-parselogicaland-state-src-mq3-vm-pc-parser-ml-831963183"></a>
### parseLogicalAnd

```ml
function parseLogicalAnd(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L364)

<a id="function-function-mq3-vm-pc-parser-parselogicalor-function-parselogicalor-state-src-mq3-vm-pc-parser-ml-1629821029"></a>
### parseLogicalOr

```ml
function parseLogicalOr(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L365)

<a id="function-function-mq3-vm-pc-parser-parsemultiply-function-parsemultiply-state-src-mq3-vm-pc-parser-ml-1851197683"></a>
### parseMultiply

```ml
function parseMultiply(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L340)

<a id="function-function-mq3-vm-pc-parser-parseprimary-function-parseprimary-state-src-mq3-vm-pc-parser-ml-240466365"></a>
### parsePrimary

```ml
function parsePrimary(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L323)

<a id="function-function-mq3-vm-pc-parser-parserelational-function-parserelational-state-src-mq3-vm-pc-parser-ml-816275741"></a>
### parseRelational

```ml
function parseRelational(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L355)

<a id="function-function-mq3-vm-pc-parser-parseshift-function-parseshift-state-src-mq3-vm-pc-parser-ml-1195345153"></a>
### parseShift

```ml
function parseShift(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L352)

<a id="function-function-mq3-vm-pc-parser-parseunary-function-parseunary-state-src-mq3-vm-pc-parser-ml-58790429"></a>
### parseUnary

```ml
function parseUnary(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L333)

<a id="function-function-mq3-vm-pc-parser-pcnextraw-function-pcnextraw-entry-src-mq3-vm-pc-parser-ml-2090142870"></a>
### pcNextRaw

```ml
function pcNextRaw(entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L231)

<a id="function-function-mq3-vm-pc-parser-popconditional-function-popconditional-entry-src-mq3-vm-pc-parser-ml-817044954"></a>
### popConditional

```ml
function popConditional(entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L283)

<a id="function-function-mq3-vm-pc-parser-punctuationnumber-function-punctuationnumber-index-src-mq3-vm-pc-parser-ml-1021938560"></a>
### punctuationNumber

```ml
function punctuationNumber(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L39)

<a id="function-function-mq3-vm-pc-parser-punctuationstrings-function-punctuationstrings-src-mq3-vm-pc-parser-ml-1890130402"></a>
### punctuationStrings

```ml
function punctuationStrings()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L38)

<a id="function-function-mq3-vm-pc-parser-pushconditional-function-pushconditional-entry-parent-selected-src-mq3-vm-pc-parser-ml-1007327829"></a>
### pushConditional

```ml
function pushConditional(entry, parent, selected)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |
| `parent` | `dynamic` | — |  |
| `selected` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L278)

<a id="function-function-mq3-vm-pc-parser-pushinclude-function-pushinclude-registry-entry-name-src-mq3-vm-pc-parser-ml-2067703448"></a>
### pushInclude

```ml
function pushInclude(registry, entry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `entry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L220)

<a id="function-function-mq3-vm-pc-parser-queuefront-function-queuefront-entry-tokens-src-mq3-vm-pc-parser-ml-198538756"></a>
### queueFront

```ml
function queueFront(entry, tokens)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L252)

<a id="function-function-mq3-vm-pc-parser-raw-function-raw-source-src-mq3-vm-pc-parser-ml-2056762445"></a>
### raw

```ml
function raw(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L81)

<a id="function-function-mq3-vm-pc-parser-read-function-read-registry-sourcehandle-src-mq3-vm-pc-parser-ml-949950114"></a>
### read

```ml
function read(registry, sourceHandle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `sourceHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L389)

<a id="function-function-mq3-vm-pc-parser-readnumber-function-readnumber-source-leadingspace-src-mq3-vm-pc-parser-ml-800703993"></a>
### readNumber

```ml
function readNumber(source, leadingSpace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `leadingSpace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L66)

<a id="function-function-mq3-vm-pc-parser-readstring-function-readstring-source-quote-leadingspace-src-mq3-vm-pc-parser-ml-1887678371"></a>
### readString

```ml
function readString(source, quote, leadingSpace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `quote` | `dynamic` | — |  |
| `leadingSpace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L51)

- [mq3.vm.pc_parser.Registry](Type-mq3-vm-pc-parser-registry-328656313.md) — struct
<a id="function-function-mq3-vm-pc-parser-skip-function-skip-source-src-mq3-vm-pc-parser-ml-1306697005"></a>
### skip

```ml
function skip(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L40)

- [mq3.vm.pc_parser.Source](Type-mq3-vm-pc-parser-source-1350446047.md) — struct
<a id="function-function-mq3-vm-pc-parser-sourcemacroexpansion-function-sourcemacroexpansion-entry-value-line-src-mq3-vm-pc-parser-ml-802229831"></a>
### sourceMacroExpansion

```ml
function sourceMacroExpansion(entry, value, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L196)

<a id="function-function-mq3-vm-pc-parser-sourcetake-function-sourcetake-source-src-mq3-vm-pc-parser-ml-1259128109"></a>
### sourceTake

```ml
function sourceTake(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L224)

<a id="function-function-mq3-vm-pc-parser-stringized-function-stringized-argument-line-src-mq3-vm-pc-parser-ml-770891961"></a>
### stringized

```ml
function stringized(argument, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argument` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L159)

<a id="function-function-mq3-vm-pc-parser-substitutemacro-function-substitutemacro-value-arguments-line-src-mq3-vm-pc-parser-ml-859076977"></a>
### substituteMacro

```ml
function substituteMacro(value, arguments, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L169)

<a id="function-function-mq3-vm-pc-parser-take-function-take-entry-src-mq3-vm-pc-parser-ml-624533966"></a>
### take

```ml
function take(entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L255)

- [mq3.vm.pc_parser.Token](Type-mq3-vm-pc-parser-token-735227767.md) — struct
<a id="constant-constant-mq3-vm-pc-parser-token-size-const-token-size-1040-src-mq3-vm-pc-parser-ml-2127114480"></a>
### TOKEN_SIZE

```ml
const TOKEN_SIZE = 1040
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L10)

<a id="function-function-mq3-vm-pc-parser-tokenlistappend-function-tokenlistappend-list-token-src-mq3-vm-pc-parser-ml-1152234695"></a>
### tokenListAppend

```ml
function tokenListAppend(list, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L108)

<a id="constant-constant-mq3-vm-pc-parser-tt-decimal-const-tt-decimal-8-src-mq3-vm-pc-parser-ml-56631243"></a>
### TT_DECIMAL

```ml
const TT_DECIMAL = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L16)

<a id="constant-constant-mq3-vm-pc-parser-tt-float-const-tt-float-2048-src-mq3-vm-pc-parser-ml-1377492967"></a>
### TT_FLOAT

```ml
const TT_FLOAT = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L19)

<a id="constant-constant-mq3-vm-pc-parser-tt-hex-const-tt-hex-256-src-mq3-vm-pc-parser-ml-1743559602"></a>
### TT_HEX

```ml
const TT_HEX = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L17)

<a id="constant-constant-mq3-vm-pc-parser-tt-integer-const-tt-integer-4096-src-mq3-vm-pc-parser-ml-1021740966"></a>
### TT_INTEGER

```ml
const TT_INTEGER = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L20)

<a id="constant-constant-mq3-vm-pc-parser-tt-literal-const-tt-literal-2-src-mq3-vm-pc-parser-ml-1981385617"></a>
### TT_LITERAL

```ml
const TT_LITERAL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L12)

<a id="constant-constant-mq3-vm-pc-parser-tt-name-const-tt-name-4-src-mq3-vm-pc-parser-ml-1066339501"></a>
### TT_NAME

```ml
const TT_NAME = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L14)

<a id="constant-constant-mq3-vm-pc-parser-tt-number-const-tt-number-3-src-mq3-vm-pc-parser-ml-1421632624"></a>
### TT_NUMBER

```ml
const TT_NUMBER = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L13)

<a id="constant-constant-mq3-vm-pc-parser-tt-octal-const-tt-octal-512-src-mq3-vm-pc-parser-ml-1004437855"></a>
### TT_OCTAL

```ml
const TT_OCTAL = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L18)

<a id="constant-constant-mq3-vm-pc-parser-tt-punctuation-const-tt-punctuation-5-src-mq3-vm-pc-parser-ml-1763350426"></a>
### TT_PUNCTUATION

```ml
const TT_PUNCTUATION = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L15)

<a id="constant-constant-mq3-vm-pc-parser-tt-string-const-tt-string-1-src-mq3-vm-pc-parser-ml-85887446"></a>
### TT_STRING

```ml
const TT_STRING = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L11)

<a id="function-function-mq3-vm-pc-parser-twodigits-function-twodigits-value-src-mq3-vm-pc-parser-ml-1858258105"></a>
### twoDigits

```ml
function twoDigits(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L92)

<a id="function-function-mq3-vm-pc-parser-unread-function-unread-entry-token-src-mq3-vm-pc-parser-ml-833806765"></a>
### unread

```ml
function unread(entry, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L247)
