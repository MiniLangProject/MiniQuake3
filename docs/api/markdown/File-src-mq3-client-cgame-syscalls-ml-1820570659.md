# `src/mq3/client/cgame_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_syscalls`](Package-mq3-client-cgame-syscalls-1331189195.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_cgame.ml` as `syscallCgame` → [src/mq3/vm/syscall_cgame.ml](File-src-mq3-vm-syscall-cgame-ml-1987612568.md)

## Declarations

<a id="constant-constant-mq3-client-cgame-syscalls-cg-addcommand-const-cg-addcommand-15-src-mq3-client-cgame-syscalls-ml-2033108317"></a>
### CG_ADDCOMMAND

```ml
const CG_ADDCOMMAND = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L24)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-argc-const-cg-argc-7-src-mq3-client-cgame-syscalls-ml-1880372270"></a>
### CG_ARGC

```ml
const CG_ARGC = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L16)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-args-const-cg-args-9-src-mq3-client-cgame-syscalls-ml-731660664"></a>
### CG_ARGS

```ml
const CG_ARGS = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L18)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-argv-const-cg-argv-8-src-mq3-client-cgame-syscalls-ml-1021642089"></a>
### CG_ARGV

```ml
const CG_ARGV = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L17)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-drawcinematic-const-cg-cin-drawcinematic-77-src-mq3-client-cgame-syscalls-ml-353454477"></a>
### CG_CIN_DRAWCINEMATIC

```ml
const CG_CIN_DRAWCINEMATIC = 77
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L86)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-playcinematic-const-cg-cin-playcinematic-74-src-mq3-client-cgame-syscalls-ml-1826310182"></a>
### CG_CIN_PLAYCINEMATIC

```ml
const CG_CIN_PLAYCINEMATIC = 74
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L83)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-runcinematic-const-cg-cin-runcinematic-76-src-mq3-client-cgame-syscalls-ml-1563788124"></a>
### CG_CIN_RUNCINEMATIC

```ml
const CG_CIN_RUNCINEMATIC = 76
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L85)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-setextents-const-cg-cin-setextents-78-src-mq3-client-cgame-syscalls-ml-172128106"></a>
### CG_CIN_SETEXTENTS

```ml
const CG_CIN_SETEXTENTS = 78
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L87)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-stopcinematic-const-cg-cin-stopcinematic-75-src-mq3-client-cgame-syscalls-ml-1602547951"></a>
### CG_CIN_STOPCINEMATIC

```ml
const CG_CIN_STOPCINEMATIC = 75
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L84)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-boxtrace-const-cg-cm-boxtrace-25-src-mq3-client-cgame-syscalls-ml-203397358"></a>
### CG_CM_BOXTRACE

```ml
const CG_CM_BOXTRACE = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L34)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-capsuletrace-const-cg-cm-capsuletrace-83-src-mq3-client-cgame-syscalls-ml-1036656318"></a>
### CG_CM_CAPSULETRACE

```ml
const CG_CM_CAPSULETRACE = 83
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L92)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-inlinemodel-const-cg-cm-inlinemodel-20-src-mq3-client-cgame-syscalls-ml-995317981"></a>
### CG_CM_INLINEMODEL

```ml
const CG_CM_INLINEMODEL = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L29)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-loadmap-const-cg-cm-loadmap-18-src-mq3-client-cgame-syscalls-ml-1623606872"></a>
### CG_CM_LOADMAP

```ml
const CG_CM_LOADMAP = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L27)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-loadmodel-const-cg-cm-loadmodel-21-src-mq3-client-cgame-syscalls-ml-1700049720"></a>
### CG_CM_LOADMODEL

```ml
const CG_CM_LOADMODEL = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L30)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-markfragments-const-cg-cm-markfragments-27-src-mq3-client-cgame-syscalls-ml-813616966"></a>
### CG_CM_MARKFRAGMENTS

```ml
const CG_CM_MARKFRAGMENTS = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L36)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-numinlinemodels-const-cg-cm-numinlinemodels-19-src-mq3-client-cgame-syscalls-ml-1965227873"></a>
### CG_CM_NUMINLINEMODELS

```ml
const CG_CM_NUMINLINEMODELS = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L28)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-pointcontents-const-cg-cm-pointcontents-23-src-mq3-client-cgame-syscalls-ml-1055417378"></a>
### CG_CM_POINTCONTENTS

```ml
const CG_CM_POINTCONTENTS = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L32)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-tempboxmodel-const-cg-cm-tempboxmodel-22-src-mq3-client-cgame-syscalls-ml-470090409"></a>
### CG_CM_TEMPBOXMODEL

```ml
const CG_CM_TEMPBOXMODEL = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L31)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-tempcapsulemodel-const-cg-cm-tempcapsulemodel-82-src-mq3-client-cgame-syscalls-ml-250586019"></a>
### CG_CM_TEMPCAPSULEMODEL

```ml
const CG_CM_TEMPCAPSULEMODEL = 82
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L91)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-transformedboxtrace-const-cg-cm-transformedboxtrace-26-src-mq3-client-cgame-syscalls-ml-499658099"></a>
### CG_CM_TRANSFORMEDBOXTRACE

```ml
const CG_CM_TRANSFORMEDBOXTRACE = 26
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L35)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-transformedcapsuletrace-const-cg-cm-transformedcapsuletrace-84-src-mq3-client-cgame-syscalls-ml-1352912631"></a>
### CG_CM_TRANSFORMEDCAPSULETRACE

```ml
const CG_CM_TRANSFORMEDCAPSULETRACE = 84
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L93)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-transformedpointcontents-const-cg-cm-transformedpointcontents-24-src-mq3-client-cgame-syscalls-ml-1239603469"></a>
### CG_CM_TRANSFORMEDPOINTCONTENTS

```ml
const CG_CM_TRANSFORMEDPOINTCONTENTS = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L33)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-register-const-cg-cvar-register-3-src-mq3-client-cgame-syscalls-ml-258966066"></a>
### CG_CVAR_REGISTER

```ml
const CG_CVAR_REGISTER = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L12)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-set-const-cg-cvar-set-5-src-mq3-client-cgame-syscalls-ml-344905280"></a>
### CG_CVAR_SET

```ml
const CG_CVAR_SET = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L14)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-update-const-cg-cvar-update-4-src-mq3-client-cgame-syscalls-ml-1387091389"></a>
### CG_CVAR_UPDATE

```ml
const CG_CVAR_UPDATE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L13)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-variablestringbuffer-const-cg-cvar-variablestringbuffer-6-src-mq3-client-cgame-syscalls-ml-832104603"></a>
### CG_CVAR_VARIABLESTRINGBUFFER

```ml
const CG_CVAR_VARIABLESTRINGBUFFER = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L15)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-error-const-cg-error-1-src-mq3-client-cgame-syscalls-ml-433341376"></a>
### CG_ERROR

```ml
const CG_ERROR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L10)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-fclosefile-const-cg-fs-fclosefile-13-src-mq3-client-cgame-syscalls-ml-1492262131"></a>
### CG_FS_FCLOSEFILE

```ml
const CG_FS_FCLOSEFILE = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L22)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-fopenfile-const-cg-fs-fopenfile-10-src-mq3-client-cgame-syscalls-ml-373126088"></a>
### CG_FS_FOPENFILE

```ml
const CG_FS_FOPENFILE = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L19)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-read-const-cg-fs-read-11-src-mq3-client-cgame-syscalls-ml-567479369"></a>
### CG_FS_READ

```ml
const CG_FS_READ = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L20)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-seek-const-cg-fs-seek-89-src-mq3-client-cgame-syscalls-ml-1267740894"></a>
### CG_FS_SEEK

```ml
const CG_FS_SEEK = 89
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L98)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-write-const-cg-fs-write-12-src-mq3-client-cgame-syscalls-ml-1568244790"></a>
### CG_FS_WRITE

```ml
const CG_FS_WRITE = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L21)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-get-entity-token-const-cg-get-entity-token-86-src-mq3-client-cgame-syscalls-ml-1368800893"></a>
### CG_GET_ENTITY_TOKEN

```ml
const CG_GET_ENTITY_TOKEN = 86
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L95)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getcamerainfo-const-cg-getcamerainfo-92-src-mq3-client-cgame-syscalls-ml-1518989812"></a>
### CG_GETCAMERAINFO

```ml
const CG_GETCAMERAINFO = 92
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L103)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getcurrentcmdnumber-const-cg-getcurrentcmdnumber-54-src-mq3-client-cgame-syscalls-ml-1487634728"></a>
### CG_GETCURRENTCMDNUMBER

```ml
const CG_GETCURRENTCMDNUMBER = 54
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L63)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getcurrentsnapshotnumber-const-cg-getcurrentsnapshotnumber-51-src-mq3-client-cgame-syscalls-ml-940337513"></a>
### CG_GETCURRENTSNAPSHOTNUMBER

```ml
const CG_GETCURRENTSNAPSHOTNUMBER = 51
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L60)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getgamestate-const-cg-getgamestate-50-src-mq3-client-cgame-syscalls-ml-1326621440"></a>
### CG_GETGAMESTATE

```ml
const CG_GETGAMESTATE = 50
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L59)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getglconfig-const-cg-getglconfig-49-src-mq3-client-cgame-syscalls-ml-1445140384"></a>
### CG_GETGLCONFIG

```ml
const CG_GETGLCONFIG = 49
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L58)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getservercommand-const-cg-getservercommand-53-src-mq3-client-cgame-syscalls-ml-93627355"></a>
### CG_GETSERVERCOMMAND

```ml
const CG_GETSERVERCOMMAND = 53
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L62)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getsnapshot-const-cg-getsnapshot-52-src-mq3-client-cgame-syscalls-ml-384293362"></a>
### CG_GETSNAPSHOT

```ml
const CG_GETSNAPSHOT = 52
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L61)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getusercmd-const-cg-getusercmd-55-src-mq3-client-cgame-syscalls-ml-1678390317"></a>
### CG_GETUSERCMD

```ml
const CG_GETUSERCMD = 55
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L64)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-getcatcher-const-cg-key-getcatcher-61-src-mq3-client-cgame-syscalls-ml-977229728"></a>
### CG_KEY_GETCATCHER

```ml
const CG_KEY_GETCATCHER = 61
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L70)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-getkey-const-cg-key-getkey-63-src-mq3-client-cgame-syscalls-ml-159841974"></a>
### CG_KEY_GETKEY

```ml
const CG_KEY_GETKEY = 63
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L72)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-isdown-const-cg-key-isdown-60-src-mq3-client-cgame-syscalls-ml-810906097"></a>
### CG_KEY_ISDOWN

```ml
const CG_KEY_ISDOWN = 60
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L69)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-setcatcher-const-cg-key-setcatcher-62-src-mq3-client-cgame-syscalls-ml-1796560883"></a>
### CG_KEY_SETCATCHER

```ml
const CG_KEY_SETCATCHER = 62
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L71)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-loadcamera-const-cg-loadcamera-90-src-mq3-client-cgame-syscalls-ml-1090969080"></a>
### CG_LOADCAMERA

```ml
const CG_LOADCAMERA = 90
```

These three were shipped commented out in both cg_public.h and cg_syscalls.c. Their dormant sequential ABI slots are kept so the Ledger candidates remain callable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L101)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-memory-remaining-const-cg-memory-remaining-58-src-mq3-client-cgame-syscalls-ml-908883828"></a>
### CG_MEMORY_REMAINING

```ml
const CG_MEMORY_REMAINING = 58
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L67)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-milliseconds-const-cg-milliseconds-2-src-mq3-client-cgame-syscalls-ml-341443739"></a>
### CG_MILLISECONDS

```ml
const CG_MILLISECONDS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L11)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-add-global-define-const-cg-pc-add-global-define-64-src-mq3-client-cgame-syscalls-ml-1144670713"></a>
### CG_PC_ADD_GLOBAL_DEFINE

```ml
const CG_PC_ADD_GLOBAL_DEFINE = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L73)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-free-source-const-cg-pc-free-source-66-src-mq3-client-cgame-syscalls-ml-227350979"></a>
### CG_PC_FREE_SOURCE

```ml
const CG_PC_FREE_SOURCE = 66
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L75)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-load-source-const-cg-pc-load-source-65-src-mq3-client-cgame-syscalls-ml-1666952176"></a>
### CG_PC_LOAD_SOURCE

```ml
const CG_PC_LOAD_SOURCE = 65
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L74)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-read-token-const-cg-pc-read-token-67-src-mq3-client-cgame-syscalls-ml-1601496398"></a>
### CG_PC_READ_TOKEN

```ml
const CG_PC_READ_TOKEN = 67
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L76)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-source-file-and-line-const-cg-pc-source-file-and-line-68-src-mq3-client-cgame-syscalls-ml-1030584407"></a>
### CG_PC_SOURCE_FILE_AND_LINE

```ml
const CG_PC_SOURCE_FILE_AND_LINE = 68
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L77)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-print-const-cg-print-0-src-mq3-client-cgame-syscalls-ml-1925946239"></a>
### CG_PRINT

```ml
const CG_PRINT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L9)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addadditivelighttoscene-const-cg-r-addadditivelighttoscene-85-src-mq3-client-cgame-syscalls-ml-269690012"></a>
### CG_R_ADDADDITIVELIGHTTOSCENE

```ml
const CG_R_ADDADDITIVELIGHTTOSCENE = 85
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L94)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addlighttoscene-const-cg-r-addlighttoscene-43-src-mq3-client-cgame-syscalls-ml-1605418226"></a>
### CG_R_ADDLIGHTTOSCENE

```ml
const CG_R_ADDLIGHTTOSCENE = 43
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L52)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addpolystoscene-const-cg-r-addpolystoscene-87-src-mq3-client-cgame-syscalls-ml-1096876876"></a>
### CG_R_ADDPOLYSTOSCENE

```ml
const CG_R_ADDPOLYSTOSCENE = 87
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L96)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addpolytoscene-const-cg-r-addpolytoscene-42-src-mq3-client-cgame-syscalls-ml-1922262857"></a>
### CG_R_ADDPOLYTOSCENE

```ml
const CG_R_ADDPOLYTOSCENE = 42
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L51)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addrefentitytoscene-const-cg-r-addrefentitytoscene-41-src-mq3-client-cgame-syscalls-ml-729073800"></a>
### CG_R_ADDREFENTITYTOSCENE

```ml
const CG_R_ADDREFENTITYTOSCENE = 41
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L50)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-clearscene-const-cg-r-clearscene-40-src-mq3-client-cgame-syscalls-ml-754609087"></a>
### CG_R_CLEARSCENE

```ml
const CG_R_CLEARSCENE = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L49)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-drawstretchpic-const-cg-r-drawstretchpic-46-src-mq3-client-cgame-syscalls-ml-702204865"></a>
### CG_R_DRAWSTRETCHPIC

```ml
const CG_R_DRAWSTRETCHPIC = 46
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L55)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-inpvs-const-cg-r-inpvs-88-src-mq3-client-cgame-syscalls-ml-1287989469"></a>
### CG_R_INPVS

```ml
const CG_R_INPVS = 88
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L97)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-lerptag-const-cg-r-lerptag-48-src-mq3-client-cgame-syscalls-ml-1497554495"></a>
### CG_R_LERPTAG

```ml
const CG_R_LERPTAG = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L57)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-lightforpoint-const-cg-r-lightforpoint-73-src-mq3-client-cgame-syscalls-ml-486732865"></a>
### CG_R_LIGHTFORPOINT

```ml
const CG_R_LIGHTFORPOINT = 73
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L82)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-loadworldmap-const-cg-r-loadworldmap-36-src-mq3-client-cgame-syscalls-ml-1731157292"></a>
### CG_R_LOADWORLDMAP

```ml
const CG_R_LOADWORLDMAP = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L45)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-modelbounds-const-cg-r-modelbounds-47-src-mq3-client-cgame-syscalls-ml-1288242518"></a>
### CG_R_MODELBOUNDS

```ml
const CG_R_MODELBOUNDS = 47
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L56)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registerfont-const-cg-r-registerfont-59-src-mq3-client-cgame-syscalls-ml-1130423757"></a>
### CG_R_REGISTERFONT

```ml
const CG_R_REGISTERFONT = 59
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L68)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registermodel-const-cg-r-registermodel-37-src-mq3-client-cgame-syscalls-ml-829008619"></a>
### CG_R_REGISTERMODEL

```ml
const CG_R_REGISTERMODEL = 37
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L46)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registershader-const-cg-r-registershader-39-src-mq3-client-cgame-syscalls-ml-889445275"></a>
### CG_R_REGISTERSHADER

```ml
const CG_R_REGISTERSHADER = 39
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L48)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registershadernomip-const-cg-r-registershadernomip-57-src-mq3-client-cgame-syscalls-ml-1990682547"></a>
### CG_R_REGISTERSHADERNOMIP

```ml
const CG_R_REGISTERSHADERNOMIP = 57
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L66)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registerskin-const-cg-r-registerskin-38-src-mq3-client-cgame-syscalls-ml-171486826"></a>
### CG_R_REGISTERSKIN

```ml
const CG_R_REGISTERSKIN = 38
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L47)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-remap-shader-const-cg-r-remap-shader-79-src-mq3-client-cgame-syscalls-ml-1908642671"></a>
### CG_R_REMAP_SHADER

```ml
const CG_R_REMAP_SHADER = 79
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L88)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-renderscene-const-cg-r-renderscene-44-src-mq3-client-cgame-syscalls-ml-803781585"></a>
### CG_R_RENDERSCENE

```ml
const CG_R_RENDERSCENE = 44
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L53)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-setcolor-const-cg-r-setcolor-45-src-mq3-client-cgame-syscalls-ml-1509468890"></a>
### CG_R_SETCOLOR

```ml
const CG_R_SETCOLOR = 45
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L54)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-real-time-const-cg-real-time-70-src-mq3-client-cgame-syscalls-ml-441726898"></a>
### CG_REAL_TIME

```ml
const CG_REAL_TIME = 70
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L79)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-removecommand-const-cg-removecommand-72-src-mq3-client-cgame-syscalls-ml-705279282"></a>
### CG_REMOVECOMMAND

```ml
const CG_REMOVECOMMAND = 72
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L81)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-addloopingsound-const-cg-s-addloopingsound-31-src-mq3-client-cgame-syscalls-ml-226059715"></a>
### CG_S_ADDLOOPINGSOUND

```ml
const CG_S_ADDLOOPINGSOUND = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L40)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-addrealloopingsound-const-cg-s-addrealloopingsound-80-src-mq3-client-cgame-syscalls-ml-1047105003"></a>
### CG_S_ADDREALLOOPINGSOUND

```ml
const CG_S_ADDREALLOOPINGSOUND = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L89)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-clearloopingsounds-const-cg-s-clearloopingsounds-30-src-mq3-client-cgame-syscalls-ml-395012998"></a>
### CG_S_CLEARLOOPINGSOUNDS

```ml
const CG_S_CLEARLOOPINGSOUNDS = 30
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L39)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-registersound-const-cg-s-registersound-34-src-mq3-client-cgame-syscalls-ml-319603298"></a>
### CG_S_REGISTERSOUND

```ml
const CG_S_REGISTERSOUND = 34
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L43)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-respatialize-const-cg-s-respatialize-33-src-mq3-client-cgame-syscalls-ml-245014785"></a>
### CG_S_RESPATIALIZE

```ml
const CG_S_RESPATIALIZE = 33
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L42)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-startbackgroundtrack-const-cg-s-startbackgroundtrack-35-src-mq3-client-cgame-syscalls-ml-1017582571"></a>
### CG_S_STARTBACKGROUNDTRACK

```ml
const CG_S_STARTBACKGROUNDTRACK = 35
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L44)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-startlocalsound-const-cg-s-startlocalsound-29-src-mq3-client-cgame-syscalls-ml-2124676356"></a>
### CG_S_STARTLOCALSOUND

```ml
const CG_S_STARTLOCALSOUND = 29
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L38)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-startsound-const-cg-s-startsound-28-src-mq3-client-cgame-syscalls-ml-1659707157"></a>
### CG_S_STARTSOUND

```ml
const CG_S_STARTSOUND = 28
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L37)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-stopbackgroundtrack-const-cg-s-stopbackgroundtrack-69-src-mq3-client-cgame-syscalls-ml-801727146"></a>
### CG_S_STOPBACKGROUNDTRACK

```ml
const CG_S_STOPBACKGROUNDTRACK = 69
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L78)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-stoploopingsound-const-cg-s-stoploopingsound-81-src-mq3-client-cgame-syscalls-ml-42084806"></a>
### CG_S_STOPLOOPINGSOUND

```ml
const CG_S_STOPLOOPINGSOUND = 81
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L90)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-updateentityposition-const-cg-s-updateentityposition-32-src-mq3-client-cgame-syscalls-ml-691275512"></a>
### CG_S_UPDATEENTITYPOSITION

```ml
const CG_S_UPDATEENTITYPOSITION = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L41)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-sendclientcommand-const-cg-sendclientcommand-16-src-mq3-client-cgame-syscalls-ml-2107399158"></a>
### CG_SENDCLIENTCOMMAND

```ml
const CG_SENDCLIENTCOMMAND = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L25)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-sendconsolecommand-const-cg-sendconsolecommand-14-src-mq3-client-cgame-syscalls-ml-2121346208"></a>
### CG_SENDCONSOLECOMMAND

```ml
const CG_SENDCONSOLECOMMAND = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L23)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-setusercmdvalue-const-cg-setusercmdvalue-56-src-mq3-client-cgame-syscalls-ml-1997617714"></a>
### CG_SETUSERCMDVALUE

```ml
const CG_SETUSERCMDVALUE = 56
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L65)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-snapvector-const-cg-snapvector-71-src-mq3-client-cgame-syscalls-ml-2056662755"></a>
### CG_SNAPVECTOR

```ml
const CG_SNAPVECTOR = 71
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L80)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-startcamera-const-cg-startcamera-91-src-mq3-client-cgame-syscalls-ml-1041869279"></a>
### CG_STARTCAMERA

```ml
const CG_STARTCAMERA = 91
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L102)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-testprintfloat-const-cg-testprintfloat-110-src-mq3-client-cgame-syscalls-ml-964334535"></a>
### CG_TESTPRINTFLOAT

```ml
const CG_TESTPRINTFLOAT = 110
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L105)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-testprintint-const-cg-testprintint-109-src-mq3-client-cgame-syscalls-ml-2027204309"></a>
### CG_TESTPRINTINT

```ml
const CG_TESTPRINTINT = 109
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L104)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-updatescreen-const-cg-updatescreen-17-src-mq3-client-cgame-syscalls-ml-910221407"></a>
### CG_UPDATESCREEN

```ml
const CG_UPDATESCREEN = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L26)

- [mq3.client.cgame_syscalls.DispatcherContext](Type-mq3-client-cgame-syscalls-dispatchercontext-699380433.md) — struct
<a id="function-function-mq3-client-cgame-syscalls-dispatchexisting-function-dispatchexisting-context-words-src-mq3-client-cgame-syscalls-ml-995297610"></a>
### dispatchExisting

```ml
function dispatchExisting(context, words)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `words` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L127)

<a id="function-function-mq3-client-cgame-syscalls-dllentry-function-dllentry-context-syscallfn-retailactive-src-mq3-client-cgame-syscalls-ml-1991466447"></a>
### dllEntry

```ml
function dllEntry(context, syscallFn, retailActive)
```

dllEntry

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `syscallFn` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L114)

<a id="function-function-mq3-client-cgame-syscalls-fail-function-fail-message-src-mq3-client-cgame-syscalls-ml-493417971"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L111)

- [mq3.client.cgame_syscalls.Gateway](Type-mq3-client-cgame-syscalls-gateway-430823991.md) — struct
- [mq3.client.cgame_syscalls.Invocation](Type-mq3-client-cgame-syscalls-invocation-1585376181.md) — struct
<a id="function-function-mq3-client-cgame-syscalls-invoke-function-invoke-gateway-opcode-arguments-src-mq3-client-cgame-syscalls-ml-99646206"></a>
### invoke

```ml
function invoke(gateway, opcode, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `opcode` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L119)

<a id="function-function-mq3-client-cgame-syscalls-passfloat-function-passfloat-value-src-mq3-client-cgame-syscalls-ml-608707271"></a>
### PASSFLOAT

```ml
function PASSFLOAT(value)
```

PASSFLOAT

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L136)

<a id="function-function-mq3-client-cgame-syscalls-qvmgateway-function-qvmgateway-host-vm-base-retailactive-src-mq3-client-cgame-syscalls-ml-399777517"></a>
### qvmGateway

```ml
function qvmGateway(host, vm, base, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L133)

<a id="function-function-mq3-client-cgame-syscalls-testprintfloat-function-testprintfloat-gateway-text-value-src-mq3-client-cgame-syscalls-ml-752897300"></a>
### testPrintFloat

```ml
function testPrintFloat(gateway, text, value)
```

testPrintFloat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L281)

<a id="function-function-mq3-client-cgame-syscalls-testprintint-function-testprintint-gateway-text-value-src-mq3-client-cgame-syscalls-ml-1012513280"></a>
### testPrintInt

```ml
function testPrintInt(gateway, text, value)
```

testPrintInt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L279)

<a id="function-function-mq3-client-cgame-syscalls-trap-addcommand-function-trap-addcommand-gateway-cmdname-src-mq3-client-cgame-syscalls-ml-1023185799"></a>
### trap_AddCommand

```ml
function trap_AddCommand(gateway, cmdName)
```

trap_AddCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `cmdName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L171)

<a id="function-function-mq3-client-cgame-syscalls-trap-argc-function-trap-argc-gateway-src-mq3-client-cgame-syscalls-ml-530445916"></a>
### trap_Argc

```ml
function trap_Argc(gateway)
```

trap_Argc

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L153)

<a id="function-function-mq3-client-cgame-syscalls-trap-args-function-trap-args-gateway-buffer-bufferlength-src-mq3-client-cgame-syscalls-ml-241503576"></a>
### trap_Args

```ml
function trap_Args(gateway, buffer, bufferLength)
```

trap_Args

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufferLength` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L157)

<a id="function-function-mq3-client-cgame-syscalls-trap-argv-function-trap-argv-gateway-index-buffer-bufferlength-src-mq3-client-cgame-syscalls-ml-91294300"></a>
### trap_Argv

```ml
function trap_Argv(gateway, index, buffer, bufferLength)
```

trap_Argv

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufferLength` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L155)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-drawcinematic-function-trap-cin-drawcinematic-gateway-handle-src-mq3-client-cgame-syscalls-ml-1606571544"></a>
### trap_CIN_DrawCinematic

```ml
function trap_CIN_DrawCinematic(gateway, handle)
```

trap_CIN_DrawCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L313)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-playcinematic-function-trap-cin-playcinematic-gateway-name-x-y-width-height-bits-src-mq3-client-cgame-syscalls-ml-420753899"></a>
### trap_CIN_PlayCinematic

```ml
function trap_CIN_PlayCinematic(gateway, name, x, y, width, height, bits)
```

trap_CIN_PlayCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L307)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-runcinematic-function-trap-cin-runcinematic-gateway-handle-src-mq3-client-cgame-syscalls-ml-2106637574"></a>
### trap_CIN_RunCinematic

```ml
function trap_CIN_RunCinematic(gateway, handle)
```

trap_CIN_RunCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L311)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-setextents-function-trap-cin-setextents-gateway-handle-x-y-width-height-src-mq3-client-cgame-syscalls-ml-668059128"></a>
### trap_CIN_SetExtents

```ml
function trap_CIN_SetExtents(gateway, handle, x, y, width, height)
```

trap_CIN_SetExtents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L315)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-stopcinematic-function-trap-cin-stopcinematic-gateway-handle-src-mq3-client-cgame-syscalls-ml-1374217532"></a>
### trap_CIN_StopCinematic

```ml
function trap_CIN_StopCinematic(gateway, handle)
```

trap_CIN_StopCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L309)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-boxtrace-function-trap-cm-boxtrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-src-mq3-client-cgame-syscalls-ml-1527336492"></a>
### trap_CM_BoxTrace

```ml
function trap_CM_BoxTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask)
```

trap_CM_BoxTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `results` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `brushmask` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L193)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-capsuletrace-function-trap-cm-capsuletrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-src-mq3-client-cgame-syscalls-ml-1551950220"></a>
### trap_CM_CapsuleTrace

```ml
function trap_CM_CapsuleTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask)
```

trap_CM_CapsuleTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `results` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `brushmask` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L195)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-inlinemodel-function-trap-cm-inlinemodel-gateway-index-src-mq3-client-cgame-syscalls-ml-174103730"></a>
### trap_CM_InlineModel

```ml
function trap_CM_InlineModel(gateway, index)
```

trap_CM_InlineModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L183)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-loadmap-function-trap-cm-loadmap-gateway-mapname-src-mq3-client-cgame-syscalls-ml-181819887"></a>
### trap_CM_LoadMap

```ml
function trap_CM_LoadMap(gateway, mapname)
```

trap_CM_LoadMap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L179)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-markfragments-function-trap-cm-markfragments-gateway-numpoints-points-projection-maxpoints-pointbuffer-maxfragments-fragmentbuffer-src-mq3-client-cgame-syscalls-ml-1162104153"></a>
### trap_CM_MarkFragments

```ml
function trap_CM_MarkFragments(gateway, numPoints, points, projection, maxPoints, pointBuffer, maxFragments, fragmentBuffer)
```

trap_CM_MarkFragments

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `numPoints` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `maxPoints` | `dynamic` | — |  |
| `pointBuffer` | `dynamic` | — |  |
| `maxFragments` | `dynamic` | — |  |
| `fragmentBuffer` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L201)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-numinlinemodels-function-trap-cm-numinlinemodels-gateway-src-mq3-client-cgame-syscalls-ml-904228362"></a>
### trap_CM_NumInlineModels

```ml
function trap_CM_NumInlineModels(gateway)
```

trap_CM_NumInlineModels

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L181)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-pointcontents-function-trap-cm-pointcontents-gateway-point-model-src-mq3-client-cgame-syscalls-ml-1016605835"></a>
### trap_CM_PointContents

```ml
function trap_CM_PointContents(gateway, point, model)
```

trap_CM_PointContents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L189)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-tempboxmodel-function-trap-cm-tempboxmodel-gateway-mins-maxs-src-mq3-client-cgame-syscalls-ml-261502816"></a>
### trap_CM_TempBoxModel

```ml
function trap_CM_TempBoxModel(gateway, mins, maxs)
```

trap_CM_TempBoxModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L185)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-tempcapsulemodel-function-trap-cm-tempcapsulemodel-gateway-mins-maxs-src-mq3-client-cgame-syscalls-ml-163091876"></a>
### trap_CM_TempCapsuleModel

```ml
function trap_CM_TempCapsuleModel(gateway, mins, maxs)
```

trap_CM_TempCapsuleModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L187)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-transformedboxtrace-function-trap-cm-transformedboxtrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-origin-angles-src-mq3-client-cgame-syscalls-ml-994020954"></a>
### trap_CM_TransformedBoxTrace

```ml
function trap_CM_TransformedBoxTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask, origin, angles)
```

trap_CM_TransformedBoxTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `results` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `brushmask` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L197)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-transformedcapsuletrace-function-trap-cm-transformedcapsuletrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-origin-angles-src-mq3-client-cgame-syscalls-ml-711029090"></a>
### trap_CM_TransformedCapsuleTrace

```ml
function trap_CM_TransformedCapsuleTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask, origin, angles)
```

trap_CM_TransformedCapsuleTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `results` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `brushmask` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L199)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-transformedpointcontents-function-trap-cm-transformedpointcontents-gateway-point-model-origin-angles-src-mq3-client-cgame-syscalls-ml-457511103"></a>
### trap_CM_TransformedPointContents

```ml
function trap_CM_TransformedPointContents(gateway, point, model, origin, angles)
```

trap_CM_TransformedPointContents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L191)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-register-function-trap-cvar-register-gateway-vmcvar-varname-defaultvalue-flags-src-mq3-client-cgame-syscalls-ml-1291586178"></a>
### trap_Cvar_Register

```ml
function trap_Cvar_Register(gateway, vmCvar, varName, defaultValue, flags)
```

trap_Cvar_Register

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `vmCvar` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L145)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-set-function-trap-cvar-set-gateway-varname-value-src-mq3-client-cgame-syscalls-ml-1187682359"></a>
### trap_Cvar_Set

```ml
function trap_Cvar_Set(gateway, varName, value)
```

trap_Cvar_Set

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L149)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-update-function-trap-cvar-update-gateway-vmcvar-src-mq3-client-cgame-syscalls-ml-1895592585"></a>
### trap_Cvar_Update

```ml
function trap_Cvar_Update(gateway, vmCvar)
```

trap_Cvar_Update

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `vmCvar` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L147)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-variablestringbuffer-function-trap-cvar-variablestringbuffer-gateway-varname-buffer-bufsize-src-mq3-client-cgame-syscalls-ml-1325644306"></a>
### trap_Cvar_VariableStringBuffer

```ml
function trap_Cvar_VariableStringBuffer(gateway, varName, buffer, bufsize)
```

trap_Cvar_VariableStringBuffer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufsize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L151)

<a id="function-function-mq3-client-cgame-syscalls-trap-error-function-trap-error-gateway-fmt-src-mq3-client-cgame-syscalls-ml-424426299"></a>
### trap_Error

```ml
function trap_Error(gateway, fmt)
```

trap_Error

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `fmt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L141)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-fclosefile-function-trap-fs-fclosefile-gateway-filehandle-src-mq3-client-cgame-syscalls-ml-1379919298"></a>
### trap_FS_FCloseFile

```ml
function trap_FS_FCloseFile(gateway, fileHandle)
```

trap_FS_FCloseFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `fileHandle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L165)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-fopenfile-function-trap-fs-fopenfile-gateway-qpath-filehandle-mode-src-mq3-client-cgame-syscalls-ml-1677859303"></a>
### trap_FS_FOpenFile

```ml
function trap_FS_FOpenFile(gateway, qpath, fileHandle, mode)
```

trap_FS_FOpenFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `qpath` | `dynamic` | — |  |
| `fileHandle` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L159)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-read-function-trap-fs-read-gateway-buffer-length-filehandle-src-mq3-client-cgame-syscalls-ml-1590540544"></a>
### trap_FS_Read

```ml
function trap_FS_Read(gateway, buffer, length, fileHandle)
```

trap_FS_Read

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `fileHandle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L161)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-seek-function-trap-fs-seek-gateway-filehandle-offset-origin-src-mq3-client-cgame-syscalls-ml-551180919"></a>
### trap_FS_Seek

```ml
function trap_FS_Seek(gateway, fileHandle, offset, origin)
```

trap_FS_Seek

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `fileHandle` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L167)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-write-function-trap-fs-write-gateway-buffer-length-filehandle-src-mq3-client-cgame-syscalls-ml-1831385958"></a>
### trap_FS_Write

```ml
function trap_FS_Write(gateway, buffer, length, fileHandle)
```

trap_FS_Write

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `fileHandle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L163)

<a id="function-function-mq3-client-cgame-syscalls-trap-getcamerainfo-function-trap-getcamerainfo-gateway-time-origin-angles-src-mq3-client-cgame-syscalls-ml-1248755701"></a>
### trap_getCameraInfo

```ml
function trap_getCameraInfo(gateway, time, origin, angles)
```

trap_getCameraInfo -- dormant in the shipped source, ordinal preserved.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L326)

<a id="function-function-mq3-client-cgame-syscalls-trap-getcurrentcmdnumber-function-trap-getcurrentcmdnumber-gateway-src-mq3-client-cgame-syscalls-ml-1958166074"></a>
### trap_GetCurrentCmdNumber

```ml
function trap_GetCurrentCmdNumber(gateway)
```

trap_GetCurrentCmdNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L273)

<a id="function-function-mq3-client-cgame-syscalls-trap-getcurrentsnapshotnumber-function-trap-getcurrentsnapshotnumber-gateway-snapshotnumber-servertime-src-mq3-client-cgame-syscalls-ml-690237997"></a>
### trap_GetCurrentSnapshotNumber

```ml
function trap_GetCurrentSnapshotNumber(gateway, snapshotNumber, serverTime)
```

trap_GetCurrentSnapshotNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `snapshotNumber` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L267)

<a id="function-function-mq3-client-cgame-syscalls-trap-getentitytoken-function-trap-getentitytoken-gateway-buffer-buffersize-src-mq3-client-cgame-syscalls-ml-177230215"></a>
### trap_GetEntityToken

```ml
function trap_GetEntityToken(gateway, buffer, bufferSize)
```

trap_GetEntityToken

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufferSize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L317)

<a id="function-function-mq3-client-cgame-syscalls-trap-getgamestate-function-trap-getgamestate-gateway-gamestate-src-mq3-client-cgame-syscalls-ml-1829349037"></a>
### trap_GetGameState

```ml
function trap_GetGameState(gateway, gameState)
```

trap_GetGameState

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `gameState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L265)

<a id="function-function-mq3-client-cgame-syscalls-trap-getglconfig-function-trap-getglconfig-gateway-glconfig-src-mq3-client-cgame-syscalls-ml-993102283"></a>
### trap_GetGlconfig

```ml
function trap_GetGlconfig(gateway, glconfig)
```

trap_GetGlconfig

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `glconfig` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L263)

<a id="function-function-mq3-client-cgame-syscalls-trap-getservercommand-function-trap-getservercommand-gateway-servercommandnumber-src-mq3-client-cgame-syscalls-ml-1137832049"></a>
### trap_GetServerCommand

```ml
function trap_GetServerCommand(gateway, serverCommandNumber)
```

trap_GetServerCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `serverCommandNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L271)

<a id="function-function-mq3-client-cgame-syscalls-trap-getsnapshot-function-trap-getsnapshot-gateway-snapshotnumber-snapshot-src-mq3-client-cgame-syscalls-ml-1622627959"></a>
### trap_GetSnapshot

```ml
function trap_GetSnapshot(gateway, snapshotNumber, snapshot)
```

trap_GetSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `snapshotNumber` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L269)

<a id="function-function-mq3-client-cgame-syscalls-trap-getusercmd-function-trap-getusercmd-gateway-cmdnumber-usercmd-src-mq3-client-cgame-syscalls-ml-1320579262"></a>
### trap_GetUserCmd

```ml
function trap_GetUserCmd(gateway, cmdNumber, usercmd)
```

trap_GetUserCmd

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `cmdNumber` | `dynamic` | — |  |
| `usercmd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L275)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-getcatcher-function-trap-key-getcatcher-gateway-src-mq3-client-cgame-syscalls-ml-1611388426"></a>
### trap_Key_GetCatcher

```ml
function trap_Key_GetCatcher(gateway)
```

trap_Key_GetCatcher

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L287)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-getkey-function-trap-key-getkey-gateway-binding-src-mq3-client-cgame-syscalls-ml-798385819"></a>
### trap_Key_GetKey

```ml
function trap_Key_GetKey(gateway, binding)
```

trap_Key_GetKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `binding` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L291)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-isdown-function-trap-key-isdown-gateway-keynum-src-mq3-client-cgame-syscalls-ml-398957423"></a>
### trap_Key_IsDown

```ml
function trap_Key_IsDown(gateway, keynum)
```

trap_Key_IsDown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `keynum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L285)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-setcatcher-function-trap-key-setcatcher-gateway-catcher-src-mq3-client-cgame-syscalls-ml-1745487660"></a>
### trap_Key_SetCatcher

```ml
function trap_Key_SetCatcher(gateway, catcher)
```

trap_Key_SetCatcher

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `catcher` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L289)

<a id="function-function-mq3-client-cgame-syscalls-trap-loadcamera-function-trap-loadcamera-gateway-name-src-mq3-client-cgame-syscalls-ml-816341775"></a>
### trap_loadCamera

```ml
function trap_loadCamera(gateway, name)
```

trap_loadCamera -- dormant in the shipped source, ordinal preserved.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L322)

<a id="function-function-mq3-client-cgame-syscalls-trap-memoryremaining-function-trap-memoryremaining-gateway-src-mq3-client-cgame-syscalls-ml-1147766054"></a>
### trap_MemoryRemaining

```ml
function trap_MemoryRemaining(gateway)
```

trap_MemoryRemaining

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L283)

<a id="function-function-mq3-client-cgame-syscalls-trap-milliseconds-function-trap-milliseconds-gateway-src-mq3-client-cgame-syscalls-ml-71449854"></a>
### trap_Milliseconds

```ml
function trap_Milliseconds(gateway)
```

trap_Milliseconds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L143)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-addglobaldefine-function-trap-pc-addglobaldefine-gateway-definetext-src-mq3-client-cgame-syscalls-ml-2005838772"></a>
### trap_PC_AddGlobalDefine

```ml
function trap_PC_AddGlobalDefine(gateway, defineText)
```

trap_PC_AddGlobalDefine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `defineText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L293)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-freesource-function-trap-pc-freesource-gateway-handle-src-mq3-client-cgame-syscalls-ml-1661270712"></a>
### trap_PC_FreeSource

```ml
function trap_PC_FreeSource(gateway, handle)
```

trap_PC_FreeSource

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L297)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-loadsource-function-trap-pc-loadsource-gateway-filename-src-mq3-client-cgame-syscalls-ml-216817495"></a>
### trap_PC_LoadSource

```ml
function trap_PC_LoadSource(gateway, filename)
```

trap_PC_LoadSource

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L295)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-readtoken-function-trap-pc-readtoken-gateway-handle-token-src-mq3-client-cgame-syscalls-ml-2012527445"></a>
### trap_PC_ReadToken

```ml
function trap_PC_ReadToken(gateway, handle, token)
```

trap_PC_ReadToken

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L299)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-sourcefileandline-function-trap-pc-sourcefileandline-gateway-handle-filename-line-src-mq3-client-cgame-syscalls-ml-1987395583"></a>
### trap_PC_SourceFileAndLine

```ml
function trap_PC_SourceFileAndLine(gateway, handle, filename, line)
```

trap_PC_SourceFileAndLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L301)

<a id="function-function-mq3-client-cgame-syscalls-trap-print-function-trap-print-gateway-fmt-src-mq3-client-cgame-syscalls-ml-100277051"></a>
### trap_Print

```ml
function trap_Print(gateway, fmt)
```

trap_Print

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `fmt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L139)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addadditivelighttoscene-function-trap-r-addadditivelighttoscene-gateway-origin-intensity-red-green-blue-src-mq3-client-cgame-syscalls-ml-617205121"></a>
### trap_R_AddAdditiveLightToScene

```ml
function trap_R_AddAdditiveLightToScene(gateway, origin, intensity, red, green, blue)
```

trap_R_AddAdditiveLightToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L249)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addlighttoscene-function-trap-r-addlighttoscene-gateway-origin-intensity-red-green-blue-src-mq3-client-cgame-syscalls-ml-145813657"></a>
### trap_R_AddLightToScene

```ml
function trap_R_AddLightToScene(gateway, origin, intensity, red, green, blue)
```

trap_R_AddLightToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L247)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addpolystoscene-function-trap-r-addpolystoscene-gateway-shader-numverts-verts-num-src-mq3-client-cgame-syscalls-ml-1915688091"></a>
### trap_R_AddPolysToScene

```ml
function trap_R_AddPolysToScene(gateway, shader, numVerts, verts, num)
```

trap_R_AddPolysToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `verts` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L243)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addpolytoscene-function-trap-r-addpolytoscene-gateway-shader-numverts-verts-src-mq3-client-cgame-syscalls-ml-2045359693"></a>
### trap_R_AddPolyToScene

```ml
function trap_R_AddPolyToScene(gateway, shader, numVerts, verts)
```

trap_R_AddPolyToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `verts` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L241)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addrefentitytoscene-function-trap-r-addrefentitytoscene-gateway-refentity-src-mq3-client-cgame-syscalls-ml-1228719374"></a>
### trap_R_AddRefEntityToScene

```ml
function trap_R_AddRefEntityToScene(gateway, refEntity)
```

trap_R_AddRefEntityToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `refEntity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L239)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-clearscene-function-trap-r-clearscene-gateway-src-mq3-client-cgame-syscalls-ml-564684602"></a>
### trap_R_ClearScene

```ml
function trap_R_ClearScene(gateway)
```

trap_R_ClearScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L237)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-drawstretchpic-function-trap-r-drawstretchpic-gateway-x-y-width-height-s1-t1-s2-t2-shader-src-mq3-client-cgame-syscalls-ml-1706119295"></a>
### trap_R_DrawStretchPic

```ml
function trap_R_DrawStretchPic(gateway, x, y, width, height, s1, t1, s2, t2, shader)
```

trap_R_DrawStretchPic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L255)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-inpvs-function-trap-r-inpvs-gateway-p1-p2-src-mq3-client-cgame-syscalls-ml-2021430035"></a>
### trap_R_inPVS

```ml
function trap_R_inPVS(gateway, p1, p2)
```

trap_R_inPVS

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L319)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-lerptag-function-trap-r-lerptag-gateway-tag-model-startframe-endframe-fraction-tagname-src-mq3-client-cgame-syscalls-ml-1481697335"></a>
### trap_R_LerpTag

```ml
function trap_R_LerpTag(gateway, tag, model, startFrame, endFrame, fraction, tagName)
```

trap_R_LerpTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `startFrame` | `dynamic` | — |  |
| `endFrame` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |
| `tagName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L259)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-lightforpoint-function-trap-r-lightforpoint-gateway-point-ambientlight-directedlight-lightdir-src-mq3-client-cgame-syscalls-ml-1118475931"></a>
### trap_R_LightForPoint

```ml
function trap_R_LightForPoint(gateway, point, ambientLight, directedLight, lightDir)
```

trap_R_LightForPoint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `ambientLight` | `dynamic` | — |  |
| `directedLight` | `dynamic` | — |  |
| `lightDir` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L245)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-loadworldmap-function-trap-r-loadworldmap-gateway-mapname-src-mq3-client-cgame-syscalls-ml-1666590635"></a>
### trap_R_LoadWorldMap

```ml
function trap_R_LoadWorldMap(gateway, mapname)
```

trap_R_LoadWorldMap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L225)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-modelbounds-function-trap-r-modelbounds-gateway-model-mins-maxs-src-mq3-client-cgame-syscalls-ml-1886039971"></a>
### trap_R_ModelBounds

```ml
function trap_R_ModelBounds(gateway, model, mins, maxs)
```

trap_R_ModelBounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L257)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registerfont-function-trap-r-registerfont-gateway-fontname-pointsize-font-src-mq3-client-cgame-syscalls-ml-2051606242"></a>
### trap_R_RegisterFont

```ml
function trap_R_RegisterFont(gateway, fontName, pointSize, font)
```

trap_R_RegisterFont

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `fontName` | `dynamic` | — |  |
| `pointSize` | `dynamic` | — |  |
| `font` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L235)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registermodel-function-trap-r-registermodel-gateway-name-src-mq3-client-cgame-syscalls-ml-1879620025"></a>
### trap_R_RegisterModel

```ml
function trap_R_RegisterModel(gateway, name)
```

trap_R_RegisterModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L227)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registershader-function-trap-r-registershader-gateway-name-src-mq3-client-cgame-syscalls-ml-832703571"></a>
### trap_R_RegisterShader

```ml
function trap_R_RegisterShader(gateway, name)
```

trap_R_RegisterShader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L231)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registershadernomip-function-trap-r-registershadernomip-gateway-name-src-mq3-client-cgame-syscalls-ml-1699868397"></a>
### trap_R_RegisterShaderNoMip

```ml
function trap_R_RegisterShaderNoMip(gateway, name)
```

trap_R_RegisterShaderNoMip

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L233)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registerskin-function-trap-r-registerskin-gateway-name-src-mq3-client-cgame-syscalls-ml-594257987"></a>
### trap_R_RegisterSkin

```ml
function trap_R_RegisterSkin(gateway, name)
```

trap_R_RegisterSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L229)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-remapshader-function-trap-r-remapshader-gateway-oldshader-newshader-timeoffset-src-mq3-client-cgame-syscalls-ml-418774427"></a>
### trap_R_RemapShader

```ml
function trap_R_RemapShader(gateway, oldShader, newShader, timeOffset)
```

trap_R_RemapShader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `oldShader` | `dynamic` | — |  |
| `newShader` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L261)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-renderscene-function-trap-r-renderscene-gateway-refdef-src-mq3-client-cgame-syscalls-ml-1000481654"></a>
### trap_R_RenderScene

```ml
function trap_R_RenderScene(gateway, refdef)
```

trap_R_RenderScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L251)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-setcolor-function-trap-r-setcolor-gateway-rgba-src-mq3-client-cgame-syscalls-ml-1337036580"></a>
### trap_R_SetColor

```ml
function trap_R_SetColor(gateway, rgba)
```

trap_R_SetColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L253)

<a id="function-function-mq3-client-cgame-syscalls-trap-realtime-function-trap-realtime-gateway-qtime-src-mq3-client-cgame-syscalls-ml-1474950064"></a>
### trap_RealTime

```ml
function trap_RealTime(gateway, qtime)
```

trap_RealTime

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `qtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L303)

<a id="function-function-mq3-client-cgame-syscalls-trap-removecommand-function-trap-removecommand-gateway-cmdname-src-mq3-client-cgame-syscalls-ml-627020691"></a>
### trap_RemoveCommand

```ml
function trap_RemoveCommand(gateway, cmdName)
```

trap_RemoveCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `cmdName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L173)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-addloopingsound-function-trap-s-addloopingsound-gateway-entitynum-origin-velocity-sfx-src-mq3-client-cgame-syscalls-ml-1133685397"></a>
### trap_S_AddLoopingSound

```ml
function trap_S_AddLoopingSound(gateway, entityNum, origin, velocity, sfx)
```

trap_S_AddLoopingSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `sfx` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L209)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-addrealloopingsound-function-trap-s-addrealloopingsound-gateway-entitynum-origin-velocity-sfx-src-mq3-client-cgame-syscalls-ml-967946705"></a>
### trap_S_AddRealLoopingSound

```ml
function trap_S_AddRealLoopingSound(gateway, entityNum, origin, velocity, sfx)
```

trap_S_AddRealLoopingSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `sfx` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L211)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-clearloopingsounds-function-trap-s-clearloopingsounds-gateway-killall-src-mq3-client-cgame-syscalls-ml-1619418529"></a>
### trap_S_ClearLoopingSounds

```ml
function trap_S_ClearLoopingSounds(gateway, killAll)
```

trap_S_ClearLoopingSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `killAll` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L207)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-registersound-function-trap-s-registersound-gateway-sample-compressed-src-mq3-client-cgame-syscalls-ml-1473847281"></a>
### trap_S_RegisterSound

```ml
function trap_S_RegisterSound(gateway, sample, compressed)
```

trap_S_RegisterSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `sample` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L219)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-respatialize-function-trap-s-respatialize-gateway-entitynum-origin-axis-inwater-src-mq3-client-cgame-syscalls-ml-1408081004"></a>
### trap_S_Respatialize

```ml
function trap_S_Respatialize(gateway, entityNum, origin, axis, inWater)
```

trap_S_Respatialize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `inWater` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L217)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-startbackgroundtrack-function-trap-s-startbackgroundtrack-gateway-intro-loopname-src-mq3-client-cgame-syscalls-ml-1975025765"></a>
### trap_S_StartBackgroundTrack

```ml
function trap_S_StartBackgroundTrack(gateway, intro, loopName)
```

trap_S_StartBackgroundTrack

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `intro` | `dynamic` | — |  |
| `loopName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L221)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-startlocalsound-function-trap-s-startlocalsound-gateway-sfx-channelnum-src-mq3-client-cgame-syscalls-ml-1516783862"></a>
### trap_S_StartLocalSound

```ml
function trap_S_StartLocalSound(gateway, sfx, channelNum)
```

trap_S_StartLocalSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `sfx` | `dynamic` | — |  |
| `channelNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L205)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-startsound-function-trap-s-startsound-gateway-origin-entitynum-entitychannel-sfx-src-mq3-client-cgame-syscalls-ml-283164432"></a>
### trap_S_StartSound

```ml
function trap_S_StartSound(gateway, origin, entityNum, entityChannel, sfx)
```

trap_S_StartSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `entityChannel` | `dynamic` | — |  |
| `sfx` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L203)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-stopbackgroundtrack-function-trap-s-stopbackgroundtrack-gateway-src-mq3-client-cgame-syscalls-ml-1515064830"></a>
### trap_S_StopBackgroundTrack

```ml
function trap_S_StopBackgroundTrack(gateway)
```

trap_S_StopBackgroundTrack

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L223)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-stoploopingsound-function-trap-s-stoploopingsound-gateway-entitynum-src-mq3-client-cgame-syscalls-ml-604828847"></a>
### trap_S_StopLoopingSound

```ml
function trap_S_StopLoopingSound(gateway, entityNum)
```

trap_S_StopLoopingSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L213)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-updateentityposition-function-trap-s-updateentityposition-gateway-entitynum-origin-src-mq3-client-cgame-syscalls-ml-58090693"></a>
### trap_S_UpdateEntityPosition

```ml
function trap_S_UpdateEntityPosition(gateway, entityNum, origin)
```

trap_S_UpdateEntityPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L215)

<a id="function-function-mq3-client-cgame-syscalls-trap-sendclientcommand-function-trap-sendclientcommand-gateway-text-src-mq3-client-cgame-syscalls-ml-92827161"></a>
### trap_SendClientCommand

```ml
function trap_SendClientCommand(gateway, text)
```

trap_SendClientCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L175)

<a id="function-function-mq3-client-cgame-syscalls-trap-sendconsolecommand-function-trap-sendconsolecommand-gateway-text-src-mq3-client-cgame-syscalls-ml-1415473777"></a>
### trap_SendConsoleCommand

```ml
function trap_SendConsoleCommand(gateway, text)
```

trap_SendConsoleCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L169)

<a id="function-function-mq3-client-cgame-syscalls-trap-setusercmdvalue-function-trap-setusercmdvalue-gateway-statevalue-sensitivityscale-src-mq3-client-cgame-syscalls-ml-1348189151"></a>
### trap_SetUserCmdValue

```ml
function trap_SetUserCmdValue(gateway, stateValue, sensitivityScale)
```

trap_SetUserCmdValue

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `stateValue` | `dynamic` | — |  |
| `sensitivityScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L277)

<a id="function-function-mq3-client-cgame-syscalls-trap-snapvector-function-trap-snapvector-gateway-vector-src-mq3-client-cgame-syscalls-ml-176306411"></a>
### trap_SnapVector

```ml
function trap_SnapVector(gateway, vector)
```

trap_SnapVector

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L305)

<a id="function-function-mq3-client-cgame-syscalls-trap-startcamera-function-trap-startcamera-gateway-time-src-mq3-client-cgame-syscalls-ml-233066587"></a>
### trap_startCamera

```ml
function trap_startCamera(gateway, time)
```

trap_startCamera -- dormant in the shipped source, ordinal preserved.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L324)

<a id="function-function-mq3-client-cgame-syscalls-trap-updatescreen-function-trap-updatescreen-gateway-src-mq3-client-cgame-syscalls-ml-1051710388"></a>
### trap_UpdateScreen

```ml
function trap_UpdateScreen(gateway)
```

trap_UpdateScreen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L177)
