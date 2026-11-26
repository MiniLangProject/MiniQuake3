# `src/mq3/botlib/l_struct.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.l_struct`](Package-mq3-botlib-l-struct-270615456.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)

## Declarations

<a id="function-function-mq3-botlib-l-struct-checktoken-function-checktoken-reader-text-src-mq3-botlib-l-struct-ml-645462632"></a>
### checkToken

```ml
function checkToken(reader, text)
```

Apply `mq3.botlib.l_struct.nextToken` and `mq3.botlib.l_struct.unreadToken` while evaluating `checkToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry`, `sourceHandle` and `source`. May update `reader.pending` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L83)

<a id="function-function-mq3-botlib-l-struct-createfieldvalue-function-createfieldvalue-fd-src-mq3-botlib-l-struct-ml-1202716166"></a>
### createFieldValue

```ml
function createFieldValue(fd)
```

Build the `mq3.botlib.l_struct.FieldValue` result for `createFieldValue`. Return paths include `FieldValue(fd,values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fd` | `dynamic` | — | Fd record; accesses `type` and `maxarray`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L108)

<a id="function-function-mq3-botlib-l-struct-createstructure-function-createstructure-def-src-mq3-botlib-l-struct-ml-434725629"></a>
### createStructure

```ml
function createStructure(def)
```

Build the `mq3.botlib.l_struct.Structure` result for `createStructure`. Return paths include `Structure(def,values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — | Def record; accesses `fields`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L115)

<a id="function-function-mq3-botlib-l-struct-definition-function-definition-size-fields-src-mq3-botlib-l-struct-ml-947929636"></a>
### definition

```ml
function definition(size, fields)
```

Create a `mq3.botlib.l_struct.StructDef` record, initializing `size` from `size` and `fields` from `fields`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `fields` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.StructDef.fields`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L52)

<a id="function-function-mq3-botlib-l-struct-expecttoken-function-expecttoken-reader-text-src-mq3-botlib-l-struct-ml-1781927832"></a>
### expectToken

```ml
function expectToken(reader, text)
```

Apply `mq3.botlib.l_struct.nextToken` while evaluating `expectToken`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry`, `sourceHandle` and `source`. May update `reader.pending` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L76)

<a id="function-function-mq3-botlib-l-struct-fail-function-fail-reader-message-src-mq3-botlib-l-struct-ml-1185243382"></a>
### fail

```ml
function fail(reader, message)
```

Set `reader.diagnostics` to `reader.diagnostics+[message]` in `mq3.botlib.l_struct.fail`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `diagnostics`. May update `reader.diagnostics` in place. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L36)

<a id="function-function-mq3-botlib-l-struct-field-function-field-name-offset-type-maxarray-floatmin-floatmax-substruct-src-mq3-botlib-l-struct-ml-1759792528"></a>
### field

```ml
function field(name, offset, type, maxarray, floatmin, floatmax, substruct)
```

Create a `mq3.botlib.l_struct.FieldDef` record, initializing `name` from `name`, `offset` from `offset` and `type` from `type`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `type` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.FieldDef.type`. |
| `maxarray` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.FieldDef.maxarray`. |
| `floatmin` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.FieldDef.floatmin`. |
| `floatmax` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.FieldDef.floatmax`. |
| `substruct` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.FieldDef.substruct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L48)

- [mq3.botlib.l_struct.FieldDef](Type-mq3-botlib-l-struct-fielddef-151438485.md) — struct
<a id="function-function-mq3-botlib-l-struct-fieldvalue-function-fieldvalue-structure-name-src-mq3-botlib-l-struct-ml-955122074"></a>
### fieldValue

```ml
function fieldValue(structure, name)
```

Apply `mq3.botlib.l_struct.valueIndex` while evaluating `fieldValue`. Return paths include `structure.fields[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — | Structure record; accesses `fields`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L131)

- [mq3.botlib.l_struct.FieldValue](Type-mq3-botlib-l-struct-fieldvalue-1462248639.md) — struct
<a id="function-function-mq3-botlib-l-struct-findfield-function-findfield-defs-name-src-mq3-botlib-l-struct-ml-1848212829"></a>
### FindField

```ml
function FindField(defs, name)
```

FindField

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `defs` | `dynamic` | — | Value used by `FindField` in `if defs==void then return void end if`. |
| `name` | `dynamic` | — | Lookup text matched against `candidate.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L91)

<a id="constant-constant-mq3-botlib-l-struct-ft-array-const-ft-array-256-src-mq3-botlib-l-struct-ml-1702881112"></a>
### FT_ARRAY

```ml
const FT_ARRAY = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L17)

<a id="constant-constant-mq3-botlib-l-struct-ft-bounded-const-ft-bounded-512-src-mq3-botlib-l-struct-ml-734449879"></a>
### FT_BOUNDED

```ml
const FT_BOUNDED = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L18)

<a id="constant-constant-mq3-botlib-l-struct-ft-char-const-ft-char-1-src-mq3-botlib-l-struct-ml-2087336708"></a>
### FT_CHAR

```ml
const FT_CHAR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L11)

<a id="constant-constant-mq3-botlib-l-struct-ft-float-const-ft-float-3-src-mq3-botlib-l-struct-ml-935474442"></a>
### FT_FLOAT

```ml
const FT_FLOAT = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L13)

<a id="constant-constant-mq3-botlib-l-struct-ft-int-const-ft-int-2-src-mq3-botlib-l-struct-ml-747281565"></a>
### FT_INT

```ml
const FT_INT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L12)

<a id="constant-constant-mq3-botlib-l-struct-ft-string-const-ft-string-4-src-mq3-botlib-l-struct-ml-1809894005"></a>
### FT_STRING

```ml
const FT_STRING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L14)

<a id="constant-constant-mq3-botlib-l-struct-ft-struct-const-ft-struct-6-src-mq3-botlib-l-struct-ml-1218513243"></a>
### FT_STRUCT

```ml
const FT_STRUCT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L15)

<a id="constant-constant-mq3-botlib-l-struct-ft-type-const-ft-type-255-src-mq3-botlib-l-struct-ml-200610049"></a>
### FT_TYPE

```ml
const FT_TYPE = 255
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L16)

<a id="constant-constant-mq3-botlib-l-struct-ft-unsigned-const-ft-unsigned-1024-src-mq3-botlib-l-struct-ml-1724301764"></a>
### FT_UNSIGNED

```ml
const FT_UNSIGNED = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L19)

<a id="constant-constant-mq3-botlib-l-struct-max-stringfield-const-max-stringfield-80-src-mq3-botlib-l-struct-ml-293614893"></a>
### MAX_STRINGFIELD

```ml
const MAX_STRINGFIELD = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L10)

<a id="function-function-mq3-botlib-l-struct-nexttoken-function-nexttoken-reader-src-mq3-botlib-l-struct-ml-1491004371"></a>
### nextToken

```ml
function nextToken(reader)
```

Set `reader.pending` to `void` in `mq3.botlib.l_struct.nextToken`. Return paths include `pc.sourceTake(reader.source)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry`, `sourceHandle` and `source`. May update `reader.pending` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L63)

<a id="function-function-mq3-botlib-l-struct-precompilerreader-function-precompilerreader-registry-sourcehandle-src-mq3-botlib-l-struct-ml-1489896626"></a>
### precompilerReader

```ml
function precompilerReader(registry, sourceHandle)
```

Create a `mq3.botlib.l_struct.Reader` record, initializing `registry` from `registry` and `sourceHandle` from `sourceHandle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.Reader.registry`. |
| `sourceHandle` | `dynamic` | — | Initial value stored in `mq3.botlib.l_struct.Reader.sourceHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L60)

<a id="function-function-mq3-botlib-l-struct-readchar-function-readchar-reader-fd-src-mq3-botlib-l-struct-ml-1398643533"></a>
### ReadChar

```ml
function ReadChar(reader, fd)
```

ReadChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry`, `sourceHandle` and `source`. May update `reader.pending` in place. |
| `fd` | `dynamic` | — | Fd record; accesses `type`, `floatmin` and `floatmax`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L188)

- [mq3.botlib.l_struct.Reader](Type-mq3-botlib-l-struct-reader-2083030309.md) — struct
<a id="function-function-mq3-botlib-l-struct-readfieldscalar-function-readfieldscalar-reader-fd-src-mq3-botlib-l-struct-ml-2088786361"></a>
### readFieldScalar

```ml
function readFieldScalar(reader, fd)
```

Apply `mq3.botlib.l_struct.ReadChar`, `mq3.botlib.l_struct.ReadNumber` and `mq3.botlib.l_struct.ReadString` while evaluating `readFieldScalar`. Return paths include `fail(reader,"unsupported structure field type "+str(kind))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry`, `sourceHandle` and `source`. May update `reader.pending` in place. |
| `fd` | `dynamic` | — | Fd record; accesses `type` and `substruct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L206)

<a id="function-function-mq3-botlib-l-struct-readnumber-function-readnumber-reader-fd-src-mq3-botlib-l-struct-ml-25598385"></a>
### ReadNumber

```ml
function ReadNumber(reader, fd)
```

ReadNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry`, `sourceHandle` and `source`. May update `reader.pending` in place. |
| `fd` | `dynamic` | — | Fd record; accesses `type`, `floatmin` and `floatmax`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L151)

<a id="function-function-mq3-botlib-l-struct-readstring-function-readstring-reader-fd-src-mq3-botlib-l-struct-ml-2043881213"></a>
### ReadString

```ml
function ReadString(reader, fd)
```

ReadString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`, `registry`, `sourceHandle` and `source`. May update `reader.pending` in place. |
| `fd` | `dynamic` | — | Not read by this implementation; retained in the `ReadString` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L197)

<a id="function-function-mq3-botlib-l-struct-readstructure-function-readstructure-reader-def-structure-src-mq3-botlib-l-struct-ml-523461265"></a>
### ReadStructure

```ml
function ReadStructure(reader, def, structure)
```

ReadStructure

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `diagnostics`. May update `reader.diagnostics` in place. |
| `def` | `dynamic` | — | Def record; accesses `fields`. |
| `structure` | `dynamic` | — | Structure record; accesses `fields`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L222)

<a id="function-function-mq3-botlib-l-struct-scalardefault-function-scalardefault-fd-src-mq3-botlib-l-struct-ml-2110461164"></a>
### scalarDefault

```ml
function scalarDefault(fd)
```

Apply `mq3.botlib.l_struct.createStructure` while evaluating `scalarDefault`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fd` | `dynamic` | — | Fd record; accesses `type` and `substruct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L99)

<a id="function-function-mq3-botlib-l-struct-setvalue-function-setvalue-structure-name-index-newvalue-src-mq3-botlib-l-struct-ml-1135058905"></a>
### setValue

```ml
function setValue(structure, name, index, newValue)
```

Apply `mq3.botlib.l_struct.fieldValue` while evaluating `setValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — | Structure record; accesses `fields`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `newValue` | `dynamic` | — | Value used by `setValue` in `stored.values[index]=newValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L144)

<a id="function-function-mq3-botlib-l-struct-sourcereader-function-sourcereader-name-text-src-mq3-botlib-l-struct-ml-410516416"></a>
### sourceReader

```ml
function sourceReader(name, text)
```

Create a `mq3.botlib.l_struct.Reader` record, initializing `source` as `pc.Source(name,bytes(text),0,1,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L56)

- [mq3.botlib.l_struct.StructDef](Type-mq3-botlib-l-struct-structdef-1373631726.md) — struct
- [mq3.botlib.l_struct.Structure](Type-mq3-botlib-l-struct-structure-115795747.md) — struct
<a id="function-function-mq3-botlib-l-struct-unreadtoken-function-unreadtoken-reader-token-src-mq3-botlib-l-struct-ml-1204978864"></a>
### unreadToken

```ml
function unreadToken(reader, token)
```

Set `reader.pending` to `token` in `mq3.botlib.l_struct.unreadToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `pending`. May update `reader.pending` in place. |
| `token` | `dynamic` | — | Value used by `unreadToken` in `if token!=void then reader.pending=token end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L72)

<a id="function-function-mq3-botlib-l-struct-value-function-value-structure-name-index-src-mq3-botlib-l-struct-ml-1722796776"></a>
### value

```ml
function value(structure, name, index)
```

Apply `mq3.botlib.l_struct.fieldValue` while evaluating `value`. Return paths include `stored.values[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — | Structure record; accesses `fields`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L136)

<a id="function-function-mq3-botlib-l-struct-valueindex-function-valueindex-structure-name-src-mq3-botlib-l-struct-ml-575371742"></a>
### valueIndex

```ml
function valueIndex(structure, name)
```

Find the stored field-value index by definition name, returning -1 for a missing structure or field.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `structure` | `dynamic` | — | Structure record; accesses `fields`. |
| `name` | `dynamic` | — | Lookup text matched against `structure.fields[index].definition.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L123)

<a id="function-function-mq3-botlib-l-struct-writefloat-function-writefloat-value-src-mq3-botlib-l-struct-ml-1286741897"></a>
### WriteFloat

```ml
function WriteFloat(value)
```

WriteFloat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L251)

<a id="function-function-mq3-botlib-l-struct-writeindent-function-writeindent-indent-src-mq3-botlib-l-struct-ml-1763454900"></a>
### WriteIndent

```ml
function WriteIndent(indent)
```

WriteIndent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indent` | `dynamic` | — | Value used by `WriteIndent` in `while indent>0 text=text+"\\t"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L245)

<a id="function-function-mq3-botlib-l-struct-writescalar-function-writescalar-fd-stored-index-indent-src-mq3-botlib-l-struct-ml-1668901019"></a>
### writeScalar

```ml
function writeScalar(fd, stored, index, indent)
```

Apply `mq3.botlib.l_struct.WriteFloat` and `mq3.botlib.l_struct.WriteStructWithIndent` while evaluating `writeScalar`. Return paths include `fail(void,"unsupported structure field type "+str(kind))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fd` | `dynamic` | — | Fd record; accesses `type`, `substruct` and `name`. |
| `stored` | `dynamic` | — | Stored record; accesses `values`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `indent` | `dynamic` | — | Value used by `WriteIndent` in `while indent>0 text=text+"\\t"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L262)

<a id="function-function-mq3-botlib-l-struct-writestructure-function-writestructure-def-structure-src-mq3-botlib-l-struct-ml-554338508"></a>
### WriteStructure

```ml
function WriteStructure(def, structure)
```

WriteStructure

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — | Def record; accesses `fields`. |
| `structure` | `dynamic` | — | Structure record; accesses `fields`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L292)

<a id="function-function-mq3-botlib-l-struct-writestructwithindent-function-writestructwithindent-def-structure-indent-src-mq3-botlib-l-struct-ml-1409297546"></a>
### WriteStructWithIndent

```ml
function WriteStructWithIndent(def, structure, indent)
```

WriteStructWithIndent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — | Def record; accesses `fields`. |
| `structure` | `dynamic` | — | Structure record; accesses `fields`. |
| `indent` | `dynamic` | — | Value used by `WriteIndent` in `while indent>0 text=text+"\\t"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L276)
