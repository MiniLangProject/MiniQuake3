# `src/mq3/botlib/internal_headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.internal_headers`](Package-mq3-botlib-internal-headers-748812588.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-botlib-internal-headers-builtin-date-const-builtin-date-3-src-mq3-botlib-internal-headers-ml-1054668200"></a>
### BUILTIN_DATE

```ml
const BUILTIN_DATE = 3
```

Preprocessor built-in macro identifier for date.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L43)

<a id="constant-constant-mq3-botlib-internal-headers-builtin-file-const-builtin-file-2-src-mq3-botlib-internal-headers-ml-2309665"></a>
### BUILTIN_FILE

```ml
const BUILTIN_FILE = 2
```

Preprocessor built-in macro identifier for file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L41)

<a id="constant-constant-mq3-botlib-internal-headers-builtin-line-const-builtin-line-1-src-mq3-botlib-internal-headers-ml-1200356362"></a>
### BUILTIN_LINE

```ml
const BUILTIN_LINE = 1
```

Preprocessor built-in macro identifier for line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L39)

<a id="constant-constant-mq3-botlib-internal-headers-builtin-stdc-const-builtin-stdc-5-src-mq3-botlib-internal-headers-ml-1354990262"></a>
### BUILTIN_STDC

```ml
const BUILTIN_STDC = 5
```

Preprocessor built-in macro identifier for C standard compatibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L47)

<a id="constant-constant-mq3-botlib-internal-headers-builtin-time-const-builtin-time-4-src-mq3-botlib-internal-headers-ml-1365470625"></a>
### BUILTIN_TIME

```ml
const BUILTIN_TIME = 4
```

Preprocessor built-in macro identifier for time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L45)

<a id="constant-constant-mq3-botlib-internal-headers-cachetype-area-const-cachetype-area-1-src-mq3-botlib-internal-headers-ml-721751454"></a>
### CACHETYPE_AREA

```ml
const CACHETYPE_AREA = 1
```

Routing-cache type identifier for routes within an AAS cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L27)

<a id="constant-constant-mq3-botlib-internal-headers-cachetype-portal-const-cachetype-portal-0-src-mq3-botlib-internal-headers-ml-600614893"></a>
### CACHETYPE_PORTAL

```ml
const CACHETYPE_PORTAL = 0
```

Routing-cache type identifier for routes between cluster portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L25)

<a id="function-function-mq3-botlib-internal-headers-clampepairlength-function-clampepairlength-length-src-mq3-botlib-internal-headers-ml-11385732"></a>
### clampEpairLength

```ml
function clampEpairLength(length)
```

Clamp epair text length to the available key buffer while reserving a terminating byte.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `length` | `dynamic` | — | Operand used to evaluate the returned expression `length`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L260)

<a id="function-function-mq3-botlib-internal-headers-constantnames-function-constantnames-src-mq3-botlib-internal-headers-ml-1403361236"></a>
### constantNames

```ml
function constantNames()
```

Return the ordered constant names table for internal headers: 110 entries beginning with `"MAX_EPAIRKEY"` and `"MAX_CLIENTS"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L234)

<a id="function-function-mq3-botlib-internal-headers-constantvalues-function-constantvalues-src-mq3-botlib-internal-headers-ml-83244008"></a>
### constantValues

```ml
function constantValues()
```

Return the ordered constant values table for internal headers: 110 entries beginning with `MAX_EPAIRKEY` and `MAX_CLIENTS`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L236)

<a id="constant-constant-mq3-botlib-internal-headers-cs-models-const-cs-models-96-src-mq3-botlib-internal-headers-ml-1815904920"></a>
### CS_MODELS

```ml
const CS_MODELS = 96
```

First configuration-string slot reserved for registered model names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L19)

<a id="constant-constant-mq3-botlib-internal-headers-cs-scores-const-cs-scores-32-src-mq3-botlib-internal-headers-ml-870069966"></a>
### CS_SCORES

```ml
const CS_SCORES = 32
```

Configuration-string slot used to publish score information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L17)

<a id="constant-constant-mq3-botlib-internal-headers-cs-sounds-const-cs-sounds-352-src-mq3-botlib-internal-headers-ml-1626511567"></a>
### CS_SOUNDS

```ml
const CS_SOUNDS = 352
```

First configuration-string slot reserved for registered sound names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L21)

<a id="function-function-mq3-botlib-internal-headers-declarationnames-function-declarationnames-src-mq3-botlib-internal-headers-ml-91231860"></a>
### declarationNames

```ml
function declarationNames()
```

Return the ordered declaration names table for internal headers: 227 entries beginning with `"AAS_LoadBSPFile"` and `"AAS_DumpBSPData"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L240)

<a id="constant-constant-mq3-botlib-internal-headers-define-fixed-const-define-fixed-1-src-mq3-botlib-internal-headers-ml-1412860890"></a>
### DEFINE_FIXED

```ml
const DEFINE_FIXED = 1
```

Preprocessor-definition flag preventing removal or ordinary replacement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L37)

<a id="function-function-mq3-botlib-internal-headers-fieldnames-function-fieldnames-src-mq3-botlib-internal-headers-ml-40223384"></a>
### fieldNames

```ml
function fieldNames()
```

Return the ordered field names table for internal headers: 236 entries beginning with `"aas_stringindex_t.numindexes"` and `"aas_stringindex_t.index"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L244)

<a id="constant-constant-mq3-botlib-internal-headers-ft-array-const-ft-array-256-src-mq3-botlib-internal-headers-ml-1564518496"></a>
### FT_ARRAY

```ml
const FT_ARRAY = 256
```

Structure-reader modifier identifying an array field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L221)

<a id="constant-constant-mq3-botlib-internal-headers-ft-bounded-const-ft-bounded-512-src-mq3-botlib-internal-headers-ml-188533711"></a>
### FT_BOUNDED

```ml
const FT_BOUNDED = 512
```

Structure-reader modifier enforcing numeric minimum and maximum bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L223)

<a id="constant-constant-mq3-botlib-internal-headers-ft-char-const-ft-char-1-src-mq3-botlib-internal-headers-ml-1055450220"></a>
### FT_CHAR

```ml
const FT_CHAR = 1
```

Structure-reader type code for a character-sized integer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L209)

<a id="constant-constant-mq3-botlib-internal-headers-ft-float-const-ft-float-3-src-mq3-botlib-internal-headers-ml-1887366082"></a>
### FT_FLOAT

```ml
const FT_FLOAT = 3
```

Structure-reader type code for a floating-point field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L213)

<a id="constant-constant-mq3-botlib-internal-headers-ft-int-const-ft-int-2-src-mq3-botlib-internal-headers-ml-1936679797"></a>
### FT_INT

```ml
const FT_INT = 2
```

Structure-reader type code for an integer field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L211)

<a id="constant-constant-mq3-botlib-internal-headers-ft-string-const-ft-string-4-src-mq3-botlib-internal-headers-ml-1309335205"></a>
### FT_STRING

```ml
const FT_STRING = 4
```

Structure-reader type code for a fixed-size string field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L215)

<a id="constant-constant-mq3-botlib-internal-headers-ft-struct-const-ft-struct-6-src-mq3-botlib-internal-headers-ml-1596911571"></a>
### FT_STRUCT

```ml
const FT_STRUCT = 6
```

Structure-reader type code for a nested structure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L217)

<a id="constant-constant-mq3-botlib-internal-headers-ft-type-const-ft-type-255-src-mq3-botlib-internal-headers-ml-1320134217"></a>
### FT_TYPE

```ml
const FT_TYPE = 255
```

Mask selecting the base field type in a structure-reader descriptor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L219)

<a id="constant-constant-mq3-botlib-internal-headers-ft-unsigned-const-ft-unsigned-1024-src-mq3-botlib-internal-headers-ml-384623356"></a>
### FT_UNSIGNED

```ml
const FT_UNSIGNED = 1024
```

Structure-reader modifier selecting unsigned integer interpretation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L225)

<a id="function-function-mq3-botlib-internal-headers-globalnames-function-globalnames-src-mq3-botlib-internal-headers-ml-1903365114"></a>
### globalNames

```ml
function globalNames()
```

Return a new array `["aasworld","aassettings","botlibglobals","botimport","bot_developer"]` for `globalNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L242)

<a id="function-function-mq3-botlib-internal-headers-headercounts-function-headercounts-src-mq3-botlib-internal-headers-ml-1538667708"></a>
### headerCounts

```ml
function headerCounts()
```

Return a new array `[22,119,110,25,227,5,236]` for `headerCounts`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L248)

<a id="function-function-mq3-botlib-internal-headers-headernames-function-headernames-src-mq3-botlib-internal-headers-ml-2067531418"></a>
### headerNames

```ml
function headerNames()
```

Return the ordered header names table for internal headers: 22 entries beginning with `"be_aas_bsp.h"` and `"be_aas_cluster.h"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L228)

<a id="constant-constant-mq3-botlib-internal-headers-indent-elif-const-indent-elif-4-src-mq3-botlib-internal-headers-ml-253109529"></a>
### INDENT_ELIF

```ml
const INDENT_ELIF = 4
```

Preprocessor nesting-kind identifier for elif.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L53)

<a id="constant-constant-mq3-botlib-internal-headers-indent-else-const-indent-else-2-src-mq3-botlib-internal-headers-ml-1318533631"></a>
### INDENT_ELSE

```ml
const INDENT_ELSE = 2
```

Preprocessor nesting-kind identifier for else.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L51)

<a id="constant-constant-mq3-botlib-internal-headers-indent-if-const-indent-if-1-src-mq3-botlib-internal-headers-ml-750310188"></a>
### INDENT_IF

```ml
const INDENT_IF = 1
```

Preprocessor nesting-kind identifier for if.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L49)

<a id="constant-constant-mq3-botlib-internal-headers-indent-ifdef-const-indent-ifdef-8-src-mq3-botlib-internal-headers-ml-1709554453"></a>
### INDENT_IFDEF

```ml
const INDENT_IFDEF = 8
```

Preprocessor nesting-kind identifier for ifdef.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L55)

<a id="constant-constant-mq3-botlib-internal-headers-indent-ifndef-const-indent-ifndef-16-src-mq3-botlib-internal-headers-ml-1706187032"></a>
### INDENT_IFNDEF

```ml
const INDENT_IFNDEF = 16
```

Preprocessor nesting-kind identifier for ifndef.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L57)

<a id="function-function-mq3-botlib-internal-headers-macronames-function-macronames-src-mq3-botlib-internal-headers-ml-297538664"></a>
### macroNames

```ml
function macroNames()
```

Return the ordered macro names table for internal headers: 119 entries beginning with `"MAX_EPAIRKEY"` and `"AAS_DEBUG"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L232)

<a id="constant-constant-mq3-botlib-internal-headers-max-clients-const-max-clients-64-src-mq3-botlib-internal-headers-ml-486605827"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots supported by these interfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L9)

<a id="constant-constant-mq3-botlib-internal-headers-max-configstrings-const-max-configstrings-1024-src-mq3-botlib-internal-headers-ml-1346772440"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```

Number of indexed configuration-string slots in the game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L15)

<a id="constant-constant-mq3-botlib-internal-headers-max-epairkey-const-max-epairkey-128-src-mq3-botlib-internal-headers-ml-614538734"></a>
### MAX_EPAIRKEY

```ml
const MAX_EPAIRKEY = 128
```

Maximum character capacity of a BSP entity key or value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L7)

<a id="constant-constant-mq3-botlib-internal-headers-max-models-const-max-models-256-src-mq3-botlib-internal-headers-ml-1818357330"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```

These are sent over the net as 8 bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L11)

<a id="constant-constant-mq3-botlib-internal-headers-max-path-const-max-path-64-src-mq3-botlib-internal-headers-ml-1544922873"></a>
### MAX_PATH

```ml
const MAX_PATH = 64
```

Byte capacity of a bot-library path string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L23)

<a id="constant-constant-mq3-botlib-internal-headers-max-sounds-const-max-sounds-256-src-mq3-botlib-internal-headers-ml-1287610258"></a>
### MAX_SOUNDS

```ml
const MAX_SOUNDS = 256
```

So they cannot be blindly increased.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L13)

<a id="constant-constant-mq3-botlib-internal-headers-max-stringfield-const-max-stringfield-80-src-mq3-botlib-internal-headers-ml-1147778653"></a>
### MAX_STRINGFIELD

```ml
const MAX_STRINGFIELD = 80
```

Character capacity of a fixed-size botlib ABI string field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L207)

<a id="constant-constant-mq3-botlib-internal-headers-max-token-const-max-token-1024-src-mq3-botlib-internal-headers-ml-1087904572"></a>
### MAX_TOKEN

```ml
const MAX_TOKEN = 1024
```

Maximum character capacity reserved for a scanner token spelling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L61)

<a id="constant-constant-mq3-botlib-internal-headers-max-tokenlength-const-max-tokenlength-1024-src-mq3-botlib-internal-headers-ml-304419680"></a>
### MAX_TOKENLENGTH

```ml
const MAX_TOKENLENGTH = 1024
```

Maximum character capacity reserved for a scanner token spelling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L59)

<a id="constant-constant-mq3-botlib-internal-headers-max-weights-const-max-weights-128-src-mq3-botlib-internal-headers-ml-1811716842"></a>
### MAX_WEIGHTS

```ml
const MAX_WEIGHTS = 128
```

Maximum number of named fuzzy-weight expressions in a configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L31)

<a id="function-function-mq3-botlib-internal-headers-ownershipmappings-function-ownershipmappings-src-mq3-botlib-internal-headers-ml-1906496000"></a>
### ownershipMappings

```ml
function ownershipMappings()
```

Return the ordered ownership mappings table for internal headers: 22 entries beginning with `"be_aas_bsp.h=aas_bspq3,aas_client_trace"` and `"be_aas_cluster.h=aas_clustering"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L230)

<a id="constant-constant-mq3-botlib-internal-headers-p-add-const-p-add-29-src-mq3-botlib-internal-headers-ml-124485962"></a>
### P_ADD

```ml
const P_ADD = 29
```

Scanner punctuation identifier for `+`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L159)

<a id="constant-constant-mq3-botlib-internal-headers-p-add-assign-const-p-add-assign-14-src-mq3-botlib-internal-headers-ml-111542808"></a>
### P_ADD_ASSIGN

```ml
const P_ADD_ASSIGN = 14
```

Scanner punctuation identifier for `+=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L129)

<a id="constant-constant-mq3-botlib-internal-headers-p-assign-const-p-assign-31-src-mq3-botlib-internal-headers-ml-1024006739"></a>
### P_ASSIGN

```ml
const P_ASSIGN = 31
```

Scanner punctuation identifier for `=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L163)

<a id="constant-constant-mq3-botlib-internal-headers-p-backslash-const-p-backslash-50-src-mq3-botlib-internal-headers-ml-1990013362"></a>
### P_BACKSLASH

```ml
const P_BACKSLASH = 50
```

Scanner punctuation identifier for `\\`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L201)

<a id="constant-constant-mq3-botlib-internal-headers-p-bin-and-const-p-bin-and-32-src-mq3-botlib-internal-headers-ml-773633414"></a>
### P_BIN_AND

```ml
const P_BIN_AND = 32
```

Scanner punctuation identifier for `&`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L165)

<a id="constant-constant-mq3-botlib-internal-headers-p-bin-and-assign-const-p-bin-and-assign-18-src-mq3-botlib-internal-headers-ml-842948428"></a>
### P_BIN_AND_ASSIGN

```ml
const P_BIN_AND_ASSIGN = 18
```

Scanner punctuation identifier for `&=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L137)

<a id="constant-constant-mq3-botlib-internal-headers-p-bin-not-const-p-bin-not-35-src-mq3-botlib-internal-headers-ml-500151337"></a>
### P_BIN_NOT

```ml
const P_BIN_NOT = 35
```

Scanner punctuation identifier for `~`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L171)

<a id="constant-constant-mq3-botlib-internal-headers-p-bin-or-const-p-bin-or-33-src-mq3-botlib-internal-headers-ml-1012382049"></a>
### P_BIN_OR

```ml
const P_BIN_OR = 33
```

Scanner punctuation identifier for `|`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L167)

<a id="constant-constant-mq3-botlib-internal-headers-p-bin-or-assign-const-p-bin-or-assign-19-src-mq3-botlib-internal-headers-ml-1818929807"></a>
### P_BIN_OR_ASSIGN

```ml
const P_BIN_OR_ASSIGN = 19
```

Scanner punctuation identifier for `|=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L139)

<a id="constant-constant-mq3-botlib-internal-headers-p-bin-xor-const-p-bin-xor-34-src-mq3-botlib-internal-headers-ml-1800239632"></a>
### P_BIN_XOR

```ml
const P_BIN_XOR = 34
```

Scanner punctuation identifier for `^`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L169)

<a id="constant-constant-mq3-botlib-internal-headers-p-bin-xor-assign-const-p-bin-xor-assign-20-src-mq3-botlib-internal-headers-ml-1091497685"></a>
### P_BIN_XOR_ASSIGN

```ml
const P_BIN_XOR_ASSIGN = 20
```

Scanner punctuation identifier for `^=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L141)

<a id="constant-constant-mq3-botlib-internal-headers-p-braceclose-const-p-braceclose-47-src-mq3-botlib-internal-headers-ml-639527772"></a>
### P_BRACECLOSE

```ml
const P_BRACECLOSE = 47
```

Scanner punctuation identifier for `}`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L195)

<a id="constant-constant-mq3-botlib-internal-headers-p-braceopen-const-p-braceopen-46-src-mq3-botlib-internal-headers-ml-444624867"></a>
### P_BRACEOPEN

```ml
const P_BRACEOPEN = 46
```

Scanner punctuation identifier for `{`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L193)

<a id="constant-constant-mq3-botlib-internal-headers-p-colon-const-p-colon-42-src-mq3-botlib-internal-headers-ml-829582635"></a>
### P_COLON

```ml
const P_COLON = 42
```

Scanner punctuation identifier for `:`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L185)

<a id="constant-constant-mq3-botlib-internal-headers-p-comma-const-p-comma-40-src-mq3-botlib-internal-headers-ml-1974529605"></a>
### P_COMMA

```ml
const P_COMMA = 40
```

Scanner punctuation identifier for `,`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L181)

<a id="constant-constant-mq3-botlib-internal-headers-p-cpp1-const-p-cpp1-24-src-mq3-botlib-internal-headers-ml-1304073863"></a>
### P_CPP1

```ml
const P_CPP1 = 24
```

Scanner punctuation identifier for `::`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L149)

<a id="constant-constant-mq3-botlib-internal-headers-p-cpp2-const-p-cpp2-25-src-mq3-botlib-internal-headers-ml-881672856"></a>
### P_CPP2

```ml
const P_CPP2 = 25
```

Scanner punctuation identifier for `.*`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L151)

<a id="constant-constant-mq3-botlib-internal-headers-p-dec-const-p-dec-17-src-mq3-botlib-internal-headers-ml-1574719953"></a>
### P_DEC

```ml
const P_DEC = 17
```

Scanner punctuation identifier for `--`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L135)

<a id="constant-constant-mq3-botlib-internal-headers-p-div-const-p-div-27-src-mq3-botlib-internal-headers-ml-735968324"></a>
### P_DIV

```ml
const P_DIV = 27
```

Scanner punctuation identifier for `/`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L155)

<a id="constant-constant-mq3-botlib-internal-headers-p-div-assign-const-p-div-assign-12-src-mq3-botlib-internal-headers-ml-1633858862"></a>
### P_DIV_ASSIGN

```ml
const P_DIV_ASSIGN = 12
```

Scanner punctuation identifier for `/=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L125)

<a id="constant-constant-mq3-botlib-internal-headers-p-dollar-const-p-dollar-52-src-mq3-botlib-internal-headers-ml-1569635464"></a>
### P_DOLLAR

```ml
const P_DOLLAR = 52
```

Scanner punctuation identifier for `$`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L205)

<a id="constant-constant-mq3-botlib-internal-headers-p-inc-const-p-inc-16-src-mq3-botlib-internal-headers-ml-986140788"></a>
### P_INC

```ml
const P_INC = 16
```

Scanner punctuation identifier for `++`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L133)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-and-const-p-logic-and-5-src-mq3-botlib-internal-headers-ml-558481832"></a>
### P_LOGIC_AND

```ml
const P_LOGIC_AND = 5
```

Scanner punctuation identifier for `&&`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L111)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-eq-const-p-logic-eq-9-src-mq3-botlib-internal-headers-ml-694034170"></a>
### P_LOGIC_EQ

```ml
const P_LOGIC_EQ = 9
```

Scanner punctuation identifier for `==`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L119)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-geq-const-p-logic-geq-7-src-mq3-botlib-internal-headers-ml-1265697786"></a>
### P_LOGIC_GEQ

```ml
const P_LOGIC_GEQ = 7
```

Scanner punctuation identifier for `>=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L115)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-greater-const-p-logic-greater-37-src-mq3-botlib-internal-headers-ml-379255951"></a>
### P_LOGIC_GREATER

```ml
const P_LOGIC_GREATER = 37
```

Scanner punctuation identifier for `>`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L175)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-leq-const-p-logic-leq-8-src-mq3-botlib-internal-headers-ml-339304341"></a>
### P_LOGIC_LEQ

```ml
const P_LOGIC_LEQ = 8
```

Scanner punctuation identifier for `<=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L117)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-less-const-p-logic-less-38-src-mq3-botlib-internal-headers-ml-922713972"></a>
### P_LOGIC_LESS

```ml
const P_LOGIC_LESS = 38
```

Scanner punctuation identifier for `<`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L177)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-not-const-p-logic-not-36-src-mq3-botlib-internal-headers-ml-651966998"></a>
### P_LOGIC_NOT

```ml
const P_LOGIC_NOT = 36
```

Scanner punctuation identifier for `!`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L173)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-or-const-p-logic-or-6-src-mq3-botlib-internal-headers-ml-606903051"></a>
### P_LOGIC_OR

```ml
const P_LOGIC_OR = 6
```

Scanner punctuation identifier for `||`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L113)

<a id="constant-constant-mq3-botlib-internal-headers-p-logic-uneq-const-p-logic-uneq-10-src-mq3-botlib-internal-headers-ml-124999722"></a>
### P_LOGIC_UNEQ

```ml
const P_LOGIC_UNEQ = 10
```

Scanner punctuation identifier for `!=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L121)

<a id="constant-constant-mq3-botlib-internal-headers-p-lshift-const-p-lshift-22-src-mq3-botlib-internal-headers-ml-235778193"></a>
### P_LSHIFT

```ml
const P_LSHIFT = 22
```

Scanner punctuation identifier for `<<`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L145)

<a id="constant-constant-mq3-botlib-internal-headers-p-lshift-assign-const-p-lshift-assign-2-src-mq3-botlib-internal-headers-ml-814814927"></a>
### P_LSHIFT_ASSIGN

```ml
const P_LSHIFT_ASSIGN = 2
```

Scanner punctuation identifier for `<<=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L105)

<a id="constant-constant-mq3-botlib-internal-headers-p-mod-const-p-mod-28-src-mq3-botlib-internal-headers-ml-1613196875"></a>
### P_MOD

```ml
const P_MOD = 28
```

Scanner punctuation identifier for `%`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L157)

<a id="constant-constant-mq3-botlib-internal-headers-p-mod-assign-const-p-mod-assign-13-src-mq3-botlib-internal-headers-ml-887468109"></a>
### P_MOD_ASSIGN

```ml
const P_MOD_ASSIGN = 13
```

Scanner punctuation identifier for `%=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L127)

<a id="constant-constant-mq3-botlib-internal-headers-p-mul-const-p-mul-26-src-mq3-botlib-internal-headers-ml-683791997"></a>
### P_MUL

```ml
const P_MUL = 26
```

Scanner punctuation identifier for `*`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L153)

<a id="constant-constant-mq3-botlib-internal-headers-p-mul-assign-const-p-mul-assign-11-src-mq3-botlib-internal-headers-ml-2128018147"></a>
### P_MUL_ASSIGN

```ml
const P_MUL_ASSIGN = 11
```

Scanner punctuation identifier for `*=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L123)

<a id="constant-constant-mq3-botlib-internal-headers-p-parenthesesclose-const-p-parenthesesclose-45-src-mq3-botlib-internal-headers-ml-1222856220"></a>
### P_PARENTHESESCLOSE

```ml
const P_PARENTHESESCLOSE = 45
```

Scanner punctuation identifier for `)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L191)

<a id="constant-constant-mq3-botlib-internal-headers-p-parenthesesopen-const-p-parenthesesopen-44-src-mq3-botlib-internal-headers-ml-1636413513"></a>
### P_PARENTHESESOPEN

```ml
const P_PARENTHESESOPEN = 44
```

Scanner punctuation identifier for `(`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L189)

<a id="constant-constant-mq3-botlib-internal-headers-p-parms-const-p-parms-3-src-mq3-botlib-internal-headers-ml-411488086"></a>
### P_PARMS

```ml
const P_PARMS = 3
```

Scanner punctuation identifier for `...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L107)

<a id="constant-constant-mq3-botlib-internal-headers-p-pointerref-const-p-pointerref-23-src-mq3-botlib-internal-headers-ml-1919988844"></a>
### P_POINTERREF

```ml
const P_POINTERREF = 23
```

Scanner punctuation identifier for `->`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L147)

<a id="constant-constant-mq3-botlib-internal-headers-p-precomp-const-p-precomp-51-src-mq3-botlib-internal-headers-ml-1255456475"></a>
### P_PRECOMP

```ml
const P_PRECOMP = 51
```

Scanner punctuation identifier for `#`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L203)

<a id="constant-constant-mq3-botlib-internal-headers-p-precompmerge-const-p-precompmerge-4-src-mq3-botlib-internal-headers-ml-349827021"></a>
### P_PRECOMPMERGE

```ml
const P_PRECOMPMERGE = 4
```

Scanner punctuation identifier for `##`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L109)

<a id="constant-constant-mq3-botlib-internal-headers-p-questionmark-const-p-questionmark-43-src-mq3-botlib-internal-headers-ml-161840220"></a>
### P_QUESTIONMARK

```ml
const P_QUESTIONMARK = 43
```

Scanner punctuation identifier for `?`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L187)

<a id="constant-constant-mq3-botlib-internal-headers-p-ref-const-p-ref-39-src-mq3-botlib-internal-headers-ml-37097973"></a>
### P_REF

```ml
const P_REF = 39
```

Scanner punctuation identifier for `.`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L179)

<a id="constant-constant-mq3-botlib-internal-headers-p-rshift-const-p-rshift-21-src-mq3-botlib-internal-headers-ml-865478526"></a>
### P_RSHIFT

```ml
const P_RSHIFT = 21
```

Scanner punctuation identifier for `>>`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L143)

<a id="constant-constant-mq3-botlib-internal-headers-p-rshift-assign-const-p-rshift-assign-1-src-mq3-botlib-internal-headers-ml-211343092"></a>
### P_RSHIFT_ASSIGN

```ml
const P_RSHIFT_ASSIGN = 1
```

Scanner punctuation identifier for `>>=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L103)

<a id="constant-constant-mq3-botlib-internal-headers-p-semicolon-const-p-semicolon-41-src-mq3-botlib-internal-headers-ml-22763644"></a>
### P_SEMICOLON

```ml
const P_SEMICOLON = 41
```

Scanner punctuation identifier for `;`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L183)

<a id="constant-constant-mq3-botlib-internal-headers-p-sqbracketclose-const-p-sqbracketclose-49-src-mq3-botlib-internal-headers-ml-1922983712"></a>
### P_SQBRACKETCLOSE

```ml
const P_SQBRACKETCLOSE = 49
```

Scanner punctuation identifier for `]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L199)

<a id="constant-constant-mq3-botlib-internal-headers-p-sqbracketopen-const-p-sqbracketopen-48-src-mq3-botlib-internal-headers-ml-51592473"></a>
### P_SQBRACKETOPEN

```ml
const P_SQBRACKETOPEN = 48
```

Scanner punctuation identifier for `[`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L197)

<a id="constant-constant-mq3-botlib-internal-headers-p-sub-const-p-sub-30-src-mq3-botlib-internal-headers-ml-433357820"></a>
### P_SUB

```ml
const P_SUB = 30
```

Scanner punctuation identifier for `-`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L161)

<a id="constant-constant-mq3-botlib-internal-headers-p-sub-assign-const-p-sub-assign-15-src-mq3-botlib-internal-headers-ml-1044075207"></a>
### P_SUB_ASSIGN

```ml
const P_SUB_ASSIGN = 15
```

Scanner punctuation identifier for `-=`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L131)

<a id="constant-constant-mq3-botlib-internal-headers-pathseperator-char-const-pathseperator-char-92-src-mq3-botlib-internal-headers-ml-1394861244"></a>
### PATHSEPERATOR_CHAR

```ml
const PATHSEPERATOR_CHAR = 92
```

Character used to separate path components in botlib file names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L35)

<a id="constant-constant-mq3-botlib-internal-headers-pathseperator-str-const-pathseperator-str-src-mq3-botlib-internal-headers-ml-658714469"></a>
### PATHSEPERATOR_STR

```ml
const PATHSEPERATOR_STR = "\\"
```

String used to separate path components in botlib file names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L33)

<a id="constant-constant-mq3-botlib-internal-headers-scfl-nobinarynumbers-const-scfl-nobinarynumbers-32-src-mq3-botlib-internal-headers-ml-86874638"></a>
### SCFL_NOBINARYNUMBERS

```ml
const SCFL_NOBINARYNUMBERS = 32
```

Scanner flag disabling binary-number literal syntax.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L73)

<a id="constant-constant-mq3-botlib-internal-headers-scfl-noerrors-const-scfl-noerrors-1-src-mq3-botlib-internal-headers-ml-270906100"></a>
### SCFL_NOERRORS

```ml
const SCFL_NOERRORS = 1
```

Scanner flag suppressing error diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L63)

<a id="constant-constant-mq3-botlib-internal-headers-scfl-nonumbervalues-const-scfl-nonumbervalues-64-src-mq3-botlib-internal-headers-ml-858155443"></a>
### SCFL_NONUMBERVALUES

```ml
const SCFL_NONUMBERVALUES = 64
```

Scanner flag preventing numeric token values from being calculated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L75)

<a id="constant-constant-mq3-botlib-internal-headers-scfl-nostringescapechars-const-scfl-nostringescapechars-8-src-mq3-botlib-internal-headers-ml-1264467973"></a>
### SCFL_NOSTRINGESCAPECHARS

```ml
const SCFL_NOSTRINGESCAPECHARS = 8
```

Scanner flag disabling escape-sequence interpretation inside string literals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L69)

<a id="constant-constant-mq3-botlib-internal-headers-scfl-nostringwhitespaces-const-scfl-nostringwhitespaces-4-src-mq3-botlib-internal-headers-ml-1080264181"></a>
### SCFL_NOSTRINGWHITESPACES

```ml
const SCFL_NOSTRINGWHITESPACES = 4
```

Scanner flag preventing whitespace-separated string literals from being joined.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L67)

<a id="constant-constant-mq3-botlib-internal-headers-scfl-nowarnings-const-scfl-nowarnings-2-src-mq3-botlib-internal-headers-ml-568402679"></a>
### SCFL_NOWARNINGS

```ml
const SCFL_NOWARNINGS = 2
```

Scanner flag suppressing warning diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L65)

<a id="constant-constant-mq3-botlib-internal-headers-scfl-primitive-const-scfl-primitive-16-src-mq3-botlib-internal-headers-ml-879801470"></a>
### SCFL_PRIMITIVE

```ml
const SCFL_PRIMITIVE = 16
```

Scanner flag selecting primitive tokenization rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L71)

<a id="constant-constant-mq3-botlib-internal-headers-tt-binary-const-tt-binary-1024-src-mq3-botlib-internal-headers-ml-1634441728"></a>
### TT_BINARY

```ml
const TT_BINARY = 1024
```

Numeric-token subtype flag for binary notation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L93)

<a id="constant-constant-mq3-botlib-internal-headers-tt-decimal-const-tt-decimal-8-src-mq3-botlib-internal-headers-ml-1708837051"></a>
### TT_DECIMAL

```ml
const TT_DECIMAL = 8
```

Numeric-token subtype flag for decimal notation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L87)

<a id="constant-constant-mq3-botlib-internal-headers-tt-float-const-tt-float-2048-src-mq3-botlib-internal-headers-ml-1737599711"></a>
### TT_FLOAT

```ml
const TT_FLOAT = 2048
```

Numeric-token subtype flag for a floating-point value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L95)

<a id="constant-constant-mq3-botlib-internal-headers-tt-hex-const-tt-hex-256-src-mq3-botlib-internal-headers-ml-1615390072"></a>
### TT_HEX

```ml
const TT_HEX = 256
```

Numeric-token subtype flag for hexadecimal notation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L89)

<a id="constant-constant-mq3-botlib-internal-headers-tt-integer-const-tt-integer-4096-src-mq3-botlib-internal-headers-ml-1418406364"></a>
### TT_INTEGER

```ml
const TT_INTEGER = 4096
```

Numeric-token subtype flag for an integer value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L97)

<a id="constant-constant-mq3-botlib-internal-headers-tt-literal-const-tt-literal-2-src-mq3-botlib-internal-headers-ml-424399769"></a>
### TT_LITERAL

```ml
const TT_LITERAL = 2
```

Token-kind identifier for a quoted character literal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L79)

<a id="constant-constant-mq3-botlib-internal-headers-tt-long-const-tt-long-8192-src-mq3-botlib-internal-headers-ml-1023072361"></a>
### TT_LONG

```ml
const TT_LONG = 8192
```

Numeric-token subtype flag for an integer with a long suffix.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L99)

<a id="constant-constant-mq3-botlib-internal-headers-tt-name-const-tt-name-4-src-mq3-botlib-internal-headers-ml-1483598133"></a>
### TT_NAME

```ml
const TT_NAME = 4
```

Token-kind identifier for an identifier or unquoted name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L83)

<a id="constant-constant-mq3-botlib-internal-headers-tt-number-const-tt-number-3-src-mq3-botlib-internal-headers-ml-1742240950"></a>
### TT_NUMBER

```ml
const TT_NUMBER = 3
```

Token-kind identifier for a numeric literal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L81)

<a id="constant-constant-mq3-botlib-internal-headers-tt-octal-const-tt-octal-512-src-mq3-botlib-internal-headers-ml-2016569743"></a>
### TT_OCTAL

```ml
const TT_OCTAL = 512
```

Numeric-token subtype flag for octal notation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L91)

<a id="constant-constant-mq3-botlib-internal-headers-tt-punctuation-const-tt-punctuation-5-src-mq3-botlib-internal-headers-ml-1507737592"></a>
### TT_PUNCTUATION

```ml
const TT_PUNCTUATION = 5
```

Token-kind identifier for an operator or punctuation spelling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L85)

<a id="constant-constant-mq3-botlib-internal-headers-tt-string-const-tt-string-1-src-mq3-botlib-internal-headers-ml-1603851140"></a>
### TT_STRING

```ml
const TT_STRING = 1
```

Token-kind identifier for a quoted string literal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L77)

<a id="constant-constant-mq3-botlib-internal-headers-tt-unsigned-const-tt-unsigned-16384-src-mq3-botlib-internal-headers-ml-313913153"></a>
### TT_UNSIGNED

```ml
const TT_UNSIGNED = 16384
```

Numeric-token subtype flag for an unsigned integer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L101)

<a id="function-function-mq3-botlib-internal-headers-typenames-function-typenames-src-mq3-botlib-internal-headers-ml-1925514496"></a>
### typeNames

```ml
function typeNames()
```

Return the ordered type names table for internal headers: 25 entries beginning with `"aas_stringindex_t"` and `"aas_link_t"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L238)

<a id="function-function-mq3-botlib-internal-headers-validcachetype-function-validcachetype-value-src-mq3-botlib-internal-headers-ml-355947681"></a>
### validCacheType

```ml
function validCacheType(value)
```

Test `value==CACHETYPE_PORTAL or value==CACHETYPE_AREA` as the condition for `validCacheType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value==CACHETYPE_PORTAL or value==CACHETYPE_AREA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L251)

<a id="function-function-mq3-botlib-internal-headers-validfieldtype-function-validfieldtype-value-src-mq3-botlib-internal-headers-ml-430790441"></a>
### validFieldType

```ml
function validFieldType(value)
```

Check whether the masked structure-field type is char, integer, float, string or nested structure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `validFieldType` in `base=value&FT_TYPE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L257)

<a id="function-function-mq3-botlib-internal-headers-validtokentype-function-validtokentype-value-src-mq3-botlib-internal-headers-ml-2071267469"></a>
### validTokenType

```ml
function validTokenType(value)
```

Test `value>=TT_STRING and value<=TT_PUNCTUATION` as the condition for `validTokenType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value>=TT_STRING and value<=TT_PUNCTUATION`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L254)

<a id="constant-constant-mq3-botlib-internal-headers-wt-balance-const-wt-balance-1-src-mq3-botlib-internal-headers-ml-1194750278"></a>
### WT_BALANCE

```ml
const WT_BALANCE = 1
```

Fuzzy-weight node kind whose value can be adjusted during weight balancing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L29)

<a id="function-function-mq3-botlib-internal-headers-x86abisizes-function-x86abisizes-src-mq3-botlib-internal-headers-ml-1200174392"></a>
### x86AbiSizes

```ml
function x86AbiSizes()
```

Return a new array `[8,24,24,56,148,156,64,40,12,8,8,4580,32,8,1092,16,32,16,3152,1040,12,1072,2160,28,8]` for `x86AbiSizes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/internal_headers.ml#L246)
