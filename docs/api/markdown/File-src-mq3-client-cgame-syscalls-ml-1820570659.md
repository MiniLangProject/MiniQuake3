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

CG engine-syscall ordinal used to register a console-command name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L40)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-argc-const-cg-argc-7-src-mq3-client-cgame-syscalls-ml-1880372270"></a>
### CG_ARGC

```ml
const CG_ARGC = 7
```

CG engine-syscall ordinal used to query the number of console-command arguments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L24)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-args-const-cg-args-9-src-mq3-client-cgame-syscalls-ml-731660664"></a>
### CG_ARGS

```ml
const CG_ARGS = 9
```

CG engine-syscall ordinal used to read the remaining console-command argument text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L28)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-argv-const-cg-argv-8-src-mq3-client-cgame-syscalls-ml-1021642089"></a>
### CG_ARGV

```ml
const CG_ARGV = 8
```

CG engine-syscall ordinal used to read a console-command argument.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L26)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-drawcinematic-const-cg-cin-drawcinematic-77-src-mq3-client-cgame-syscalls-ml-353454477"></a>
### CG_CIN_DRAWCINEMATIC

```ml
const CG_CIN_DRAWCINEMATIC = 77
```

CG engine-syscall ordinal used to draw the current cinematic frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L165)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-playcinematic-const-cg-cin-playcinematic-74-src-mq3-client-cgame-syscalls-ml-1826310182"></a>
### CG_CIN_PLAYCINEMATIC

```ml
const CG_CIN_PLAYCINEMATIC = 74
```

CG engine-syscall ordinal used to open and start a cinematic stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L159)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-runcinematic-const-cg-cin-runcinematic-76-src-mq3-client-cgame-syscalls-ml-1563788124"></a>
### CG_CIN_RUNCINEMATIC

```ml
const CG_CIN_RUNCINEMATIC = 76
```

CG engine-syscall ordinal used to advance a cinematic decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L163)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-setextents-const-cg-cin-setextents-78-src-mq3-client-cgame-syscalls-ml-172128106"></a>
### CG_CIN_SETEXTENTS

```ml
const CG_CIN_SETEXTENTS = 78
```

CG engine-syscall ordinal used to set a cinematic's screen rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L167)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cin-stopcinematic-const-cg-cin-stopcinematic-75-src-mq3-client-cgame-syscalls-ml-1602547951"></a>
### CG_CIN_STOPCINEMATIC

```ml
const CG_CIN_STOPCINEMATIC = 75
```

CG engine-syscall ordinal used to stop a cinematic stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L161)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-boxtrace-const-cg-cm-boxtrace-25-src-mq3-client-cgame-syscalls-ml-203397358"></a>
### CG_CM_BOXTRACE

```ml
const CG_CM_BOXTRACE = 25
```

CG engine-syscall ordinal used to sweep a box through the collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L60)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-capsuletrace-const-cg-cm-capsuletrace-83-src-mq3-client-cgame-syscalls-ml-1036656318"></a>
### CG_CM_CAPSULETRACE

```ml
const CG_CM_CAPSULETRACE = 83
```

CG engine-syscall ordinal used to sweep a capsule through the collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L177)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-inlinemodel-const-cg-cm-inlinemodel-20-src-mq3-client-cgame-syscalls-ml-995317981"></a>
### CG_CM_INLINEMODEL

```ml
const CG_CM_INLINEMODEL = 20
```

CG engine-syscall ordinal used to resolve an inline collision-model handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L50)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-loadmap-const-cg-cm-loadmap-18-src-mq3-client-cgame-syscalls-ml-1623606872"></a>
### CG_CM_LOADMAP

```ml
const CG_CM_LOADMAP = 18
```

CG engine-syscall ordinal used to load the map's collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L46)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-loadmodel-const-cg-cm-loadmodel-21-src-mq3-client-cgame-syscalls-ml-1700049720"></a>
### CG_CM_LOADMODEL

```ml
const CG_CM_LOADMODEL = 21
```

CG engine-syscall ordinal used to load a collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L52)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-markfragments-const-cg-cm-markfragments-27-src-mq3-client-cgame-syscalls-ml-813616966"></a>
### CG_CM_MARKFRAGMENTS

```ml
const CG_CM_MARKFRAGMENTS = 27
```

CG engine-syscall ordinal used to clip decal geometry against world surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L64)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-numinlinemodels-const-cg-cm-numinlinemodels-19-src-mq3-client-cgame-syscalls-ml-1965227873"></a>
### CG_CM_NUMINLINEMODELS

```ml
const CG_CM_NUMINLINEMODELS = 19
```

CG engine-syscall ordinal used to query the number of inline collision models.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L48)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-pointcontents-const-cg-cm-pointcontents-23-src-mq3-client-cgame-syscalls-ml-1055417378"></a>
### CG_CM_POINTCONTENTS

```ml
const CG_CM_POINTCONTENTS = 23
```

CG engine-syscall ordinal used to query collision contents at a world position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L56)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-tempboxmodel-const-cg-cm-tempboxmodel-22-src-mq3-client-cgame-syscalls-ml-470090409"></a>
### CG_CM_TEMPBOXMODEL

```ml
const CG_CM_TEMPBOXMODEL = 22
```

CG engine-syscall ordinal used to construct a temporary box collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L54)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-tempcapsulemodel-const-cg-cm-tempcapsulemodel-82-src-mq3-client-cgame-syscalls-ml-250586019"></a>
### CG_CM_TEMPCAPSULEMODEL

```ml
const CG_CM_TEMPCAPSULEMODEL = 82
```

CG engine-syscall ordinal used to construct a temporary capsule collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L175)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-transformedboxtrace-const-cg-cm-transformedboxtrace-26-src-mq3-client-cgame-syscalls-ml-499658099"></a>
### CG_CM_TRANSFORMEDBOXTRACE

```ml
const CG_CM_TRANSFORMEDBOXTRACE = 26
```

CG engine-syscall ordinal used to sweep a box against a transformed collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L62)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-transformedcapsuletrace-const-cg-cm-transformedcapsuletrace-84-src-mq3-client-cgame-syscalls-ml-1352912631"></a>
### CG_CM_TRANSFORMEDCAPSULETRACE

```ml
const CG_CM_TRANSFORMEDCAPSULETRACE = 84
```

CG engine-syscall ordinal used to sweep a capsule against a transformed collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L179)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cm-transformedpointcontents-const-cg-cm-transformedpointcontents-24-src-mq3-client-cgame-syscalls-ml-1239603469"></a>
### CG_CM_TRANSFORMEDPOINTCONTENTS

```ml
const CG_CM_TRANSFORMEDPOINTCONTENTS = 24
```

CG engine-syscall ordinal used to query point contents in a transformed model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L58)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-register-const-cg-cvar-register-3-src-mq3-client-cgame-syscalls-ml-258966066"></a>
### CG_CVAR_REGISTER

```ml
const CG_CVAR_REGISTER = 3
```

CG engine-syscall ordinal used to register a configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L16)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-set-const-cg-cvar-set-5-src-mq3-client-cgame-syscalls-ml-344905280"></a>
### CG_CVAR_SET

```ml
const CG_CVAR_SET = 5
```

CG engine-syscall ordinal used to set a configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L20)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-update-const-cg-cvar-update-4-src-mq3-client-cgame-syscalls-ml-1387091389"></a>
### CG_CVAR_UPDATE

```ml
const CG_CVAR_UPDATE = 4
```

CG engine-syscall ordinal used to refresh a mirrored configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L18)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-cvar-variablestringbuffer-const-cg-cvar-variablestringbuffer-6-src-mq3-client-cgame-syscalls-ml-832104603"></a>
### CG_CVAR_VARIABLESTRINGBUFFER

```ml
const CG_CVAR_VARIABLESTRINGBUFFER = 6
```

CG engine-syscall ordinal used to read a configuration variable as text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L22)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-error-const-cg-error-1-src-mq3-client-cgame-syscalls-ml-433341376"></a>
### CG_ERROR

```ml
const CG_ERROR = 1
```

CG engine-syscall ordinal used to raise an engine error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L12)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-fclosefile-const-cg-fs-fclosefile-13-src-mq3-client-cgame-syscalls-ml-1492262131"></a>
### CG_FS_FCLOSEFILE

```ml
const CG_FS_FCLOSEFILE = 13
```

CG engine-syscall ordinal used to close a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L36)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-fopenfile-const-cg-fs-fopenfile-10-src-mq3-client-cgame-syscalls-ml-373126088"></a>
### CG_FS_FOPENFILE

```ml
const CG_FS_FOPENFILE = 10
```

CG engine-syscall ordinal used to open a file in the virtual filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L30)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-read-const-cg-fs-read-11-src-mq3-client-cgame-syscalls-ml-567479369"></a>
### CG_FS_READ

```ml
const CG_FS_READ = 11
```

CG engine-syscall ordinal used to read bytes from a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L32)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-seek-const-cg-fs-seek-89-src-mq3-client-cgame-syscalls-ml-1267740894"></a>
### CG_FS_SEEK

```ml
const CG_FS_SEEK = 89
```

CG engine-syscall ordinal used to seek within a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L189)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-fs-write-const-cg-fs-write-12-src-mq3-client-cgame-syscalls-ml-1568244790"></a>
### CG_FS_WRITE

```ml
const CG_FS_WRITE = 12
```

CG engine-syscall ordinal used to write bytes to a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L34)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-get-entity-token-const-cg-get-entity-token-86-src-mq3-client-cgame-syscalls-ml-1368800893"></a>
### CG_GET_ENTITY_TOKEN

```ml
const CG_GET_ENTITY_TOKEN = 86
```

CG engine-syscall ordinal used to read the next map-entity token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L183)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getcamerainfo-const-cg-getcamerainfo-92-src-mq3-client-cgame-syscalls-ml-1518989812"></a>
### CG_GETCAMERAINFO

```ml
const CG_GETCAMERAINFO = 92
```

CG engine-syscall ordinal used to read position and view data from the camera system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L196)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getcurrentcmdnumber-const-cg-getcurrentcmdnumber-54-src-mq3-client-cgame-syscalls-ml-1487634728"></a>
### CG_GETCURRENTCMDNUMBER

```ml
const CG_GETCURRENTCMDNUMBER = 54
```

CG engine-syscall ordinal used to query the latest local user-command sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L118)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getcurrentsnapshotnumber-const-cg-getcurrentsnapshotnumber-51-src-mq3-client-cgame-syscalls-ml-940337513"></a>
### CG_GETCURRENTSNAPSHOTNUMBER

```ml
const CG_GETCURRENTSNAPSHOTNUMBER = 51
```

CG engine-syscall ordinal used to query the latest available snapshot sequence and server time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L112)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getgamestate-const-cg-getgamestate-50-src-mq3-client-cgame-syscalls-ml-1326621440"></a>
### CG_GETGAMESTATE

```ml
const CG_GETGAMESTATE = 50
```

CG engine-syscall ordinal used to read server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L110)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getglconfig-const-cg-getglconfig-49-src-mq3-client-cgame-syscalls-ml-1445140384"></a>
### CG_GETGLCONFIG

```ml
const CG_GETGLCONFIG = 49
```

CG engine-syscall ordinal used to read the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L108)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getservercommand-const-cg-getservercommand-53-src-mq3-client-cgame-syscalls-ml-93627355"></a>
### CG_GETSERVERCOMMAND

```ml
const CG_GETSERVERCOMMAND = 53
```

CG engine-syscall ordinal used to read a reliable server command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L116)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getsnapshot-const-cg-getsnapshot-52-src-mq3-client-cgame-syscalls-ml-384293362"></a>
### CG_GETSNAPSHOT

```ml
const CG_GETSNAPSHOT = 52
```

CG engine-syscall ordinal used to read a server snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L114)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-getusercmd-const-cg-getusercmd-55-src-mq3-client-cgame-syscalls-ml-1678390317"></a>
### CG_GETUSERCMD

```ml
const CG_GETUSERCMD = 55
```

CG engine-syscall ordinal used to read a local user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L120)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-getcatcher-const-cg-key-getcatcher-61-src-mq3-client-cgame-syscalls-ml-977229728"></a>
### CG_KEY_GETCATCHER

```ml
const CG_KEY_GETCATCHER = 61
```

CG engine-syscall ordinal used to read the active input-capture bitmask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L133)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-getkey-const-cg-key-getkey-63-src-mq3-client-cgame-syscalls-ml-159841974"></a>
### CG_KEY_GETKEY

```ml
const CG_KEY_GETKEY = 63
```

CG engine-syscall ordinal used to find a key bound to a command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L137)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-isdown-const-cg-key-isdown-60-src-mq3-client-cgame-syscalls-ml-810906097"></a>
### CG_KEY_ISDOWN

```ml
const CG_KEY_ISDOWN = 60
```

CG engine-syscall ordinal used to query whether an engine key is currently pressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L131)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-key-setcatcher-const-cg-key-setcatcher-62-src-mq3-client-cgame-syscalls-ml-1796560883"></a>
### CG_KEY_SETCATCHER

```ml
const CG_KEY_SETCATCHER = 62
```

CG engine-syscall ordinal used to replace the active input-capture bitmask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L135)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-loadcamera-const-cg-loadcamera-90-src-mq3-client-cgame-syscalls-ml-1090969080"></a>
### CG_LOADCAMERA

```ml
const CG_LOADCAMERA = 90
```

These three were shipped commented out in both cg_public.h and cg_syscalls.c. Their dormant sequential ABI slots are kept so the Ledger candidates remain callable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L192)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-memory-remaining-const-cg-memory-remaining-58-src-mq3-client-cgame-syscalls-ml-908883828"></a>
### CG_MEMORY_REMAINING

```ml
const CG_MEMORY_REMAINING = 58
```

CG engine-syscall ordinal used to query remaining VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L127)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-milliseconds-const-cg-milliseconds-2-src-mq3-client-cgame-syscalls-ml-341443739"></a>
### CG_MILLISECONDS

```ml
const CG_MILLISECONDS = 2
```

CG engine-syscall ordinal used to query the engine millisecond timer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L14)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-add-global-define-const-cg-pc-add-global-define-64-src-mq3-client-cgame-syscalls-ml-1144670713"></a>
### CG_PC_ADD_GLOBAL_DEFINE

```ml
const CG_PC_ADD_GLOBAL_DEFINE = 64
```

CG engine-syscall ordinal used to add a preprocessor definition to the script parser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L139)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-free-source-const-cg-pc-free-source-66-src-mq3-client-cgame-syscalls-ml-227350979"></a>
### CG_PC_FREE_SOURCE

```ml
const CG_PC_FREE_SOURCE = 66
```

CG engine-syscall ordinal used to release a script-parser source handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L143)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-load-source-const-cg-pc-load-source-65-src-mq3-client-cgame-syscalls-ml-1666952176"></a>
### CG_PC_LOAD_SOURCE

```ml
const CG_PC_LOAD_SOURCE = 65
```

CG engine-syscall ordinal used to open a script-parser source handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L141)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-read-token-const-cg-pc-read-token-67-src-mq3-client-cgame-syscalls-ml-1601496398"></a>
### CG_PC_READ_TOKEN

```ml
const CG_PC_READ_TOKEN = 67
```

CG engine-syscall ordinal used to read the next preprocessed source token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L145)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-pc-source-file-and-line-const-cg-pc-source-file-and-line-68-src-mq3-client-cgame-syscalls-ml-1030584407"></a>
### CG_PC_SOURCE_FILE_AND_LINE

```ml
const CG_PC_SOURCE_FILE_AND_LINE = 68
```

CG engine-syscall ordinal used to query the source location for a parser handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L147)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-print-const-cg-print-0-src-mq3-client-cgame-syscalls-ml-1925946239"></a>
### CG_PRINT

```ml
const CG_PRINT = 0
```

CG engine-syscall ordinal used to print text through the engine console.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L10)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addadditivelighttoscene-const-cg-r-addadditivelighttoscene-85-src-mq3-client-cgame-syscalls-ml-269690012"></a>
### CG_R_ADDADDITIVELIGHTTOSCENE

```ml
const CG_R_ADDADDITIVELIGHTTOSCENE = 85
```

CG engine-syscall ordinal used to append an additive dynamic light to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L181)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addlighttoscene-const-cg-r-addlighttoscene-43-src-mq3-client-cgame-syscalls-ml-1605418226"></a>
### CG_R_ADDLIGHTTOSCENE

```ml
const CG_R_ADDLIGHTTOSCENE = 43
```

CG engine-syscall ordinal used to append a dynamic light to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L96)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addpolystoscene-const-cg-r-addpolystoscene-87-src-mq3-client-cgame-syscalls-ml-1096876876"></a>
### CG_R_ADDPOLYSTOSCENE

```ml
const CG_R_ADDPOLYSTOSCENE = 87
```

CG engine-syscall ordinal used to append several polygons to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L185)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addpolytoscene-const-cg-r-addpolytoscene-42-src-mq3-client-cgame-syscalls-ml-1922262857"></a>
### CG_R_ADDPOLYTOSCENE

```ml
const CG_R_ADDPOLYTOSCENE = 42
```

CG engine-syscall ordinal used to append a polygon to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L94)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-addrefentitytoscene-const-cg-r-addrefentitytoscene-41-src-mq3-client-cgame-syscalls-ml-729073800"></a>
### CG_R_ADDREFENTITYTOSCENE

```ml
const CG_R_ADDREFENTITYTOSCENE = 41
```

CG engine-syscall ordinal used to append a renderer entity to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L92)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-clearscene-const-cg-r-clearscene-40-src-mq3-client-cgame-syscalls-ml-754609087"></a>
### CG_R_CLEARSCENE

```ml
const CG_R_CLEARSCENE = 40
```

CG engine-syscall ordinal used to clear the renderer's pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L90)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-drawstretchpic-const-cg-r-drawstretchpic-46-src-mq3-client-cgame-syscalls-ml-702204865"></a>
### CG_R_DRAWSTRETCHPIC

```ml
const CG_R_DRAWSTRETCHPIC = 46
```

CG engine-syscall ordinal used to draw a shader-backed rectangle with texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L102)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-inpvs-const-cg-r-inpvs-88-src-mq3-client-cgame-syscalls-ml-1287989469"></a>
### CG_R_INPVS

```ml
const CG_R_INPVS = 88
```

CG engine-syscall ordinal used to test renderer potential visibility between positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L187)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-lerptag-const-cg-r-lerptag-48-src-mq3-client-cgame-syscalls-ml-1497554495"></a>
### CG_R_LERPTAG

```ml
const CG_R_LERPTAG = 48
```

CG engine-syscall ordinal used to interpolate an attachment tag between model animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L106)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-lightforpoint-const-cg-r-lightforpoint-73-src-mq3-client-cgame-syscalls-ml-486732865"></a>
### CG_R_LIGHTFORPOINT

```ml
const CG_R_LIGHTFORPOINT = 73
```

CG engine-syscall ordinal used to sample renderer lighting at a world position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L157)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-loadworldmap-const-cg-r-loadworldmap-36-src-mq3-client-cgame-syscalls-ml-1731157292"></a>
### CG_R_LOADWORLDMAP

```ml
const CG_R_LOADWORLDMAP = 36
```

CG engine-syscall ordinal used to load the level's renderer world data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L82)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-modelbounds-const-cg-r-modelbounds-47-src-mq3-client-cgame-syscalls-ml-1288242518"></a>
### CG_R_MODELBOUNDS

```ml
const CG_R_MODELBOUNDS = 47
```

CG engine-syscall ordinal used to query a model's axis-aligned bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L104)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registerfont-const-cg-r-registerfont-59-src-mq3-client-cgame-syscalls-ml-1130423757"></a>
### CG_R_REGISTERFONT

```ml
const CG_R_REGISTERFONT = 59
```

CG engine-syscall ordinal used to register a font resource and its glyph metrics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L129)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registermodel-const-cg-r-registermodel-37-src-mq3-client-cgame-syscalls-ml-829008619"></a>
### CG_R_REGISTERMODEL

```ml
const CG_R_REGISTERMODEL = 37
```

CG engine-syscall ordinal used to register a model resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L84)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registershader-const-cg-r-registershader-39-src-mq3-client-cgame-syscalls-ml-889445275"></a>
### CG_R_REGISTERSHADER

```ml
const CG_R_REGISTERSHADER = 39
```

CG engine-syscall ordinal used to register a shader resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L88)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registershadernomip-const-cg-r-registershadernomip-57-src-mq3-client-cgame-syscalls-ml-1990682547"></a>
### CG_R_REGISTERSHADERNOMIP

```ml
const CG_R_REGISTERSHADERNOMIP = 57
```

CG engine-syscall ordinal used to register a shader without mipmapped image sampling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L125)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-registerskin-const-cg-r-registerskin-38-src-mq3-client-cgame-syscalls-ml-171486826"></a>
### CG_R_REGISTERSKIN

```ml
const CG_R_REGISTERSKIN = 38
```

CG engine-syscall ordinal used to register a skin resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L86)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-remap-shader-const-cg-r-remap-shader-79-src-mq3-client-cgame-syscalls-ml-1908642671"></a>
### CG_R_REMAP_SHADER

```ml
const CG_R_REMAP_SHADER = 79
```

CG engine-syscall ordinal used to remap a shader to a replacement shader and time offset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L169)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-renderscene-const-cg-r-renderscene-44-src-mq3-client-cgame-syscalls-ml-803781585"></a>
### CG_R_RENDERSCENE

```ml
const CG_R_RENDERSCENE = 44
```

CG engine-syscall ordinal used to render the accumulated scene through a view definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L98)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-r-setcolor-const-cg-r-setcolor-45-src-mq3-client-cgame-syscalls-ml-1509468890"></a>
### CG_R_SETCOLOR

```ml
const CG_R_SETCOLOR = 45
```

CG engine-syscall ordinal used to set the color modulation used by subsequent 2D drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L100)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-real-time-const-cg-real-time-70-src-mq3-client-cgame-syscalls-ml-441726898"></a>
### CG_REAL_TIME

```ml
const CG_REAL_TIME = 70
```

CG engine-syscall ordinal used to read the host calendar and clock.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L151)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-removecommand-const-cg-removecommand-72-src-mq3-client-cgame-syscalls-ml-705279282"></a>
### CG_REMOVECOMMAND

```ml
const CG_REMOVECOMMAND = 72
```

CG engine-syscall ordinal used to unregister a console-command name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L155)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-addloopingsound-const-cg-s-addloopingsound-31-src-mq3-client-cgame-syscalls-ml-226059715"></a>
### CG_S_ADDLOOPINGSOUND

```ml
const CG_S_ADDLOOPINGSOUND = 31
```

CG engine-syscall ordinal used to submit an entity's looping positional sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L72)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-addrealloopingsound-const-cg-s-addrealloopingsound-80-src-mq3-client-cgame-syscalls-ml-1047105003"></a>
### CG_S_ADDREALLOOPINGSOUND

```ml
const CG_S_ADDREALLOOPINGSOUND = 80
```

CG engine-syscall ordinal used to submit a continuous looping positional sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L171)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-clearloopingsounds-const-cg-s-clearloopingsounds-30-src-mq3-client-cgame-syscalls-ml-395012998"></a>
### CG_S_CLEARLOOPINGSOUNDS

```ml
const CG_S_CLEARLOOPINGSOUNDS = 30
```

CG engine-syscall ordinal used to clear the frame's looping-sound submissions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L70)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-registersound-const-cg-s-registersound-34-src-mq3-client-cgame-syscalls-ml-319603298"></a>
### CG_S_REGISTERSOUND

```ml
const CG_S_REGISTERSOUND = 34
```

CG engine-syscall ordinal used to register a sound resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L78)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-respatialize-const-cg-s-respatialize-33-src-mq3-client-cgame-syscalls-ml-245014785"></a>
### CG_S_RESPATIALIZE

```ml
const CG_S_RESPATIALIZE = 33
```

CG engine-syscall ordinal used to update the listener origin and orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L76)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-startbackgroundtrack-const-cg-s-startbackgroundtrack-35-src-mq3-client-cgame-syscalls-ml-1017582571"></a>
### CG_S_STARTBACKGROUNDTRACK

```ml
const CG_S_STARTBACKGROUNDTRACK = 35
```

CG engine-syscall ordinal used to start the background music introduction and loop tracks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L80)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-startlocalsound-const-cg-s-startlocalsound-29-src-mq3-client-cgame-syscalls-ml-2124676356"></a>
### CG_S_STARTLOCALSOUND

```ml
const CG_S_STARTLOCALSOUND = 29
```

CG engine-syscall ordinal used to play a non-positional local sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L68)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-startsound-const-cg-s-startsound-28-src-mq3-client-cgame-syscalls-ml-1659707157"></a>
### CG_S_STARTSOUND

```ml
const CG_S_STARTSOUND = 28
```

CG engine-syscall ordinal used to play a positional sound event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L66)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-stopbackgroundtrack-const-cg-s-stopbackgroundtrack-69-src-mq3-client-cgame-syscalls-ml-801727146"></a>
### CG_S_STOPBACKGROUNDTRACK

```ml
const CG_S_STOPBACKGROUNDTRACK = 69
```

CG engine-syscall ordinal used to stop background music playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L149)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-stoploopingsound-const-cg-s-stoploopingsound-81-src-mq3-client-cgame-syscalls-ml-42084806"></a>
### CG_S_STOPLOOPINGSOUND

```ml
const CG_S_STOPLOOPINGSOUND = 81
```

CG engine-syscall ordinal used to stop the looping sound associated with an entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L173)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-s-updateentityposition-const-cg-s-updateentityposition-32-src-mq3-client-cgame-syscalls-ml-691275512"></a>
### CG_S_UPDATEENTITYPOSITION

```ml
const CG_S_UPDATEENTITYPOSITION = 32
```

CG engine-syscall ordinal used to update an entity position used for sound spatialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L74)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-sendclientcommand-const-cg-sendclientcommand-16-src-mq3-client-cgame-syscalls-ml-2107399158"></a>
### CG_SENDCLIENTCOMMAND

```ml
const CG_SENDCLIENTCOMMAND = 16
```

CG engine-syscall ordinal used to send a reliable client command to the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L42)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-sendconsolecommand-const-cg-sendconsolecommand-14-src-mq3-client-cgame-syscalls-ml-2121346208"></a>
### CG_SENDCONSOLECOMMAND

```ml
const CG_SENDCONSOLECOMMAND = 14
```

CG engine-syscall ordinal used to queue an engine console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L38)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-setusercmdvalue-const-cg-setusercmdvalue-56-src-mq3-client-cgame-syscalls-ml-1997617714"></a>
### CG_SETUSERCMDVALUE

```ml
const CG_SETUSERCMDVALUE = 56
```

CG engine-syscall ordinal used to set the CGame value and sensitivity multiplier attached to user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L123)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-snapvector-const-cg-snapvector-71-src-mq3-client-cgame-syscalls-ml-2056662755"></a>
### CG_SNAPVECTOR

```ml
const CG_SNAPVECTOR = 71
```

CG engine-syscall ordinal used to round a vector using the native protocol convention.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L153)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-startcamera-const-cg-startcamera-91-src-mq3-client-cgame-syscalls-ml-1041869279"></a>
### CG_STARTCAMERA

```ml
const CG_STARTCAMERA = 91
```

CG engine-syscall ordinal used to start playback of a scripted camera sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L194)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-testprintfloat-const-cg-testprintfloat-110-src-mq3-client-cgame-syscalls-ml-964334535"></a>
### CG_TESTPRINTFLOAT

```ml
const CG_TESTPRINTFLOAT = 110
```

CG engine-syscall ordinal used to print a floating-point value through the VM diagnostic interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L200)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-testprintint-const-cg-testprintint-109-src-mq3-client-cgame-syscalls-ml-2027204309"></a>
### CG_TESTPRINTINT

```ml
const CG_TESTPRINTINT = 109
```

CG engine-syscall ordinal used to print an integer through the VM diagnostic interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L198)

<a id="constant-constant-mq3-client-cgame-syscalls-cg-updatescreen-const-cg-updatescreen-17-src-mq3-client-cgame-syscalls-ml-910221407"></a>
### CG_UPDATESCREEN

```ml
const CG_UPDATESCREEN = 17
```

CG engine-syscall ordinal used to request an immediate screen update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L44)

- [mq3.client.cgame_syscalls.DispatcherContext](Type-mq3-client-cgame-syscalls-dispatchercontext-699380433.md) — struct
<a id="function-function-mq3-client-cgame-syscalls-dispatchexisting-function-dispatchexisting-context-words-src-mq3-client-cgame-syscalls-ml-995297610"></a>
### dispatchExisting

```ml
function dispatchExisting(context, words)
```

Calls `mq3.compat.numeric.writeU32`, `mq3.vm.syscall_cgame.dispatch` from client game syscalls `dispatchExisting`. The final path returns `syscallCgame.dispatch(context.host,context.vm,context.base)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.vm`, `context.host`, `context.base`, `context.vm.data`. |
| `words` | `dynamic` | — | Sequence read at `words[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L264)

<a id="function-function-mq3-client-cgame-syscalls-dllentry-function-dllentry-context-syscallfn-retailactive-src-mq3-client-cgame-syscalls-ml-1991466447"></a>
### dllEntry

```ml
function dllEntry(context, syscallFn, retailActive)
```

dllEntry

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | context record passed to the client game syscalls helper calls. |
| `syscallFn` | `dynamic` | — | Callback invoked by `dllEntry` for syscall. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L244)

<a id="function-function-mq3-client-cgame-syscalls-fail-function-fail-message-src-mq3-client-cgame-syscalls-ml-493417971"></a>
### fail

```ml
function fail(message)
```

Creates the client game syscalls error `7904` with diagnostic text `"cgame syscalls: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"cgame syscalls: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L238)

- [mq3.client.cgame_syscalls.Gateway](Type-mq3-client-cgame-syscalls-gateway-430823991.md) — struct
- [mq3.client.cgame_syscalls.Invocation](Type-mq3-client-cgame-syscalls-invocation-1585376181.md) — struct
<a id="function-function-mq3-client-cgame-syscalls-invoke-function-invoke-gateway-opcode-arguments-src-mq3-client-cgame-syscalls-ml-99646206"></a>
### invoke

```ml
function invoke(gateway, opcode, arguments)
```

Updates `gateway.calls` during client game syscalls `invoke`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Mutable client game syscalls record/storage; this routine assigns `gateway.calls`. |
| `opcode` | `dynamic` | — | Value used by `if gateway.retailActive then gateway.calls=gateway.calls+[Invocation(opcode,arguments,0,false)]`. |
| `arguments` | `dynamic` | — | Value used by `if arguments==void then arguments=[] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L253)

<a id="function-function-mq3-client-cgame-syscalls-passfloat-function-passfloat-value-src-mq3-client-cgame-syscalls-ml-608707271"></a>
### PASSFLOAT

```ml
function PASSFLOAT(value)
```

PASSFLOAT

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.i32`; passed as `numeric.floatBits(numeric.f32(value))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L279)

<a id="function-function-mq3-client-cgame-syscalls-qvmgateway-function-qvmgateway-host-vm-base-retailactive-src-mq3-client-cgame-syscalls-ml-399777517"></a>
### qvmGateway

```ml
function qvmGateway(host, vm, base, retailActive)
```

Adapts `mq3.client.cgame_syscalls.dllEntry` to client game syscalls `qvmGateway`, returning its result for `DispatcherContext(host,vm,base), dispatchExisting, retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Argument 1 of `mq3.client.cgame_syscalls.dllEntry`; passed as `DispatcherContext(host,vm,base)`. |
| `vm` | `dynamic` | — | Argument 1 of `mq3.client.cgame_syscalls.dllEntry`; passed as `DispatcherContext(host,vm,base)`. |
| `base` | `dynamic` | — | Argument 1 of `mq3.client.cgame_syscalls.dllEntry`; passed as `DispatcherContext(host,vm,base)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_syscalls.dllEntry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L275)

<a id="function-function-mq3-client-cgame-syscalls-testprintfloat-function-testprintfloat-gateway-text-value-src-mq3-client-cgame-syscalls-ml-752897300"></a>
### testPrintFloat

```ml
function testPrintFloat(gateway, text, value)
```

testPrintFloat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `text` | `dynamic` | — | Text consumed or emitted by `testPrintFloat` in the client game syscalls path. |
| `value` | `dynamic` | — | Value used by `invoke(gateway,CG_TESTPRINTFLOAT,[text,PASSFLOAT(value)])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L675)

<a id="function-function-mq3-client-cgame-syscalls-testprintint-function-testprintint-gateway-text-value-src-mq3-client-cgame-syscalls-ml-1012513280"></a>
### testPrintInt

```ml
function testPrintInt(gateway, text, value)
```

testPrintInt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `text` | `dynamic` | — | Text consumed or emitted by `testPrintInt` in the client game syscalls path. |
| `value` | `dynamic` | — | Value used by `invoke(gateway,CG_TESTPRINTINT,[text,value])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L670)

<a id="function-function-mq3-client-cgame-syscalls-trap-addcommand-function-trap-addcommand-gateway-cmdname-src-mq3-client-cgame-syscalls-ml-1023185799"></a>
### trap_AddCommand

```ml
function trap_AddCommand(gateway, cmdName)
```

trap_AddCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `cmdName` | `dynamic` | — | Value used by `invoke(gateway,CG_ADDCOMMAND,[cmdName])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L363)

<a id="function-function-mq3-client-cgame-syscalls-trap-argc-function-trap-argc-gateway-src-mq3-client-cgame-syscalls-ml-530445916"></a>
### trap_Argc

```ml
function trap_Argc(gateway)
```

trap_Argc

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L316)

<a id="function-function-mq3-client-cgame-syscalls-trap-args-function-trap-args-gateway-buffer-bufferlength-src-mq3-client-cgame-syscalls-ml-241503576"></a>
### trap_Args

```ml
function trap_Args(gateway, buffer, bufferLength)
```

trap_Args

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `buffer` | `dynamic` | — | Value used by `invoke(gateway,CG_ARGS,[buffer,bufferLength])`. |
| `bufferLength` | `dynamic` | — | Value used by `invoke(gateway,CG_ARGS,[buffer,bufferLength])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L327)

<a id="function-function-mq3-client-cgame-syscalls-trap-argv-function-trap-argv-gateway-index-buffer-bufferlength-src-mq3-client-cgame-syscalls-ml-91294300"></a>
### trap_Argv

```ml
function trap_Argv(gateway, index, buffer, bufferLength)
```

trap_Argv

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `index` | `dynamic` | — | Value used by `invoke(gateway,CG_ARGV,[index,buffer,bufferLength])`. |
| `buffer` | `dynamic` | — | Value used by `invoke(gateway,CG_ARGV,[index,buffer,bufferLength])`. |
| `bufferLength` | `dynamic` | — | Value used by `invoke(gateway,CG_ARGV,[index,buffer,bufferLength])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L322)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-drawcinematic-function-trap-cin-drawcinematic-gateway-handle-src-mq3-client-cgame-syscalls-ml-1606571544"></a>
### trap_CIN_DrawCinematic

```ml
function trap_CIN_DrawCinematic(gateway, handle)
```

trap_CIN_DrawCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `trap_CIN_DrawCinematic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L745)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-playcinematic-function-trap-cin-playcinematic-gateway-name-x-y-width-height-bits-src-mq3-client-cgame-syscalls-ml-420753899"></a>
### trap_CIN_PlayCinematic

```ml
function trap_CIN_PlayCinematic(gateway, name, x, y, width, height, bits)
```

trap_CIN_PlayCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `name` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`. |
| `x` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`. |
| `width` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`. |
| `height` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`. |
| `bits` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L733)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-runcinematic-function-trap-cin-runcinematic-gateway-handle-src-mq3-client-cgame-syscalls-ml-2106637574"></a>
### trap_CIN_RunCinematic

```ml
function trap_CIN_RunCinematic(gateway, handle)
```

trap_CIN_RunCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `handle` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L741)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-setextents-function-trap-cin-setextents-gateway-handle-x-y-width-height-src-mq3-client-cgame-syscalls-ml-668059128"></a>
### trap_CIN_SetExtents

```ml
function trap_CIN_SetExtents(gateway, handle, x, y, width, height)
```

trap_CIN_SetExtents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `trap_CIN_SetExtents`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `trap_CIN_SetExtents`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `trap_CIN_SetExtents`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `trap_CIN_SetExtents`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `trap_CIN_SetExtents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L753)

<a id="function-function-mq3-client-cgame-syscalls-trap-cin-stopcinematic-function-trap-cin-stopcinematic-gateway-handle-src-mq3-client-cgame-syscalls-ml-1374217532"></a>
### trap_CIN_StopCinematic

```ml
function trap_CIN_StopCinematic(gateway, handle)
```

trap_CIN_StopCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `handle` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L737)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-boxtrace-function-trap-cm-boxtrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-src-mq3-client-cgame-syscalls-ml-1527336492"></a>
### trap_CM_BoxTrace

```ml
function trap_CM_BoxTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask)
```

trap_CM_BoxTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `results` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask])`. |
| `start` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask])`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game syscalls operation. |
| `brushmask` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L417)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-capsuletrace-function-trap-cm-capsuletrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-src-mq3-client-cgame-syscalls-ml-1551950220"></a>
### trap_CM_CapsuleTrace

```ml
function trap_CM_CapsuleTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask)
```

trap_CM_CapsuleTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `results` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask])`. |
| `start` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask])`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game syscalls operation. |
| `brushmask` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L427)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-inlinemodel-function-trap-cm-inlinemodel-gateway-index-src-mq3-client-cgame-syscalls-ml-174103730"></a>
### trap_CM_InlineModel

```ml
function trap_CM_InlineModel(gateway, index)
```

trap_CM_InlineModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `index` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L385)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-loadmap-function-trap-cm-loadmap-gateway-mapname-src-mq3-client-cgame-syscalls-ml-181819887"></a>
### trap_CM_LoadMap

```ml
function trap_CM_LoadMap(gateway, mapname)
```

trap_CM_LoadMap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `mapname` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_LOADMAP,[mapname])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L378)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-markfragments-function-trap-cm-markfragments-gateway-numpoints-points-projection-maxpoints-pointbuffer-maxfragments-fragmentbuffer-src-mq3-client-cgame-syscalls-ml-1162104153"></a>
### trap_CM_MarkFragments

```ml
function trap_CM_MarkFragments(gateway, numPoints, points, projection, maxPoints, pointBuffer, maxFragments, fragmentBuffer)
```

trap_CM_MarkFragments

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `numPoints` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`. |
| `points` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `maxPoints` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`. |
| `pointBuffer` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`. |
| `maxFragments` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`. |
| `fragmentBuffer` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L461)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-numinlinemodels-function-trap-cm-numinlinemodels-gateway-src-mq3-client-cgame-syscalls-ml-904228362"></a>
### trap_CM_NumInlineModels

```ml
function trap_CM_NumInlineModels(gateway)
```

trap_CM_NumInlineModels

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L381)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-pointcontents-function-trap-cm-pointcontents-gateway-point-model-src-mq3-client-cgame-syscalls-ml-1016605835"></a>
### trap_CM_PointContents

```ml
function trap_CM_PointContents(gateway, point, model)
```

trap_CM_PointContents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `point` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model]`. |
| `model` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L400)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-tempboxmodel-function-trap-cm-tempboxmodel-gateway-mins-maxs-src-mq3-client-cgame-syscalls-ml-261502816"></a>
### trap_CM_TempBoxModel

```ml
function trap_CM_TempBoxModel(gateway, mins, maxs)
```

trap_CM_TempBoxModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L390)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-tempcapsulemodel-function-trap-cm-tempcapsulemodel-gateway-mins-maxs-src-mq3-client-cgame-syscalls-ml-163091876"></a>
### trap_CM_TempCapsuleModel

```ml
function trap_CM_TempCapsuleModel(gateway, mins, maxs)
```

trap_CM_TempCapsuleModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L395)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-transformedboxtrace-function-trap-cm-transformedboxtrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-origin-angles-src-mq3-client-cgame-syscalls-ml-994020954"></a>
### trap_CM_TransformedBoxTrace

```ml
function trap_CM_TransformedBoxTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask, origin, angles)
```

trap_CM_TransformedBoxTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `results` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |
| `start` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game syscalls operation. |
| `brushmask` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `angles` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L439)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-transformedcapsuletrace-function-trap-cm-transformedcapsuletrace-gateway-results-start-endpoint-mins-maxs-model-brushmask-origin-angles-src-mq3-client-cgame-syscalls-ml-711029090"></a>
### trap_CM_TransformedCapsuleTrace

```ml
function trap_CM_TransformedCapsuleTrace(gateway, results, start, endPoint, mins, maxs, model, brushmask, origin, angles)
```

trap_CM_TransformedCapsuleTrace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `results` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |
| `start` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game syscalls operation. |
| `brushmask` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `angles` | `dynamic` | — | Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L451)

<a id="function-function-mq3-client-cgame-syscalls-trap-cm-transformedpointcontents-function-trap-cm-transformedpointcontents-gateway-point-model-origin-angles-src-mq3-client-cgame-syscalls-ml-457511103"></a>
### trap_CM_TransformedPointContents

```ml
function trap_CM_TransformedPointContents(gateway, point, model, origin, angles)
```

trap_CM_TransformedPointContents

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `point` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model,origin,angles]`. |
| `model` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model,origin,angles]`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `angles` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model,origin,angles]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L407)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-register-function-trap-cvar-register-gateway-vmcvar-varname-defaultvalue-flags-src-mq3-client-cgame-syscalls-ml-1291586178"></a>
### trap_Cvar_Register

```ml
function trap_Cvar_Register(gateway, vmCvar, varName, defaultValue, flags)
```

trap_Cvar_Register

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `vmCvar` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`. |
| `varName` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`. |
| `defaultValue` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`. |
| `flags` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L298)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-set-function-trap-cvar-set-gateway-varname-value-src-mq3-client-cgame-syscalls-ml-1187682359"></a>
### trap_Cvar_Set

```ml
function trap_Cvar_Set(gateway, varName, value)
```

trap_Cvar_Set

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `varName` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_SET,[varName,value])`. |
| `value` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_SET,[varName,value])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L307)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-update-function-trap-cvar-update-gateway-vmcvar-src-mq3-client-cgame-syscalls-ml-1895592585"></a>
### trap_Cvar_Update

```ml
function trap_Cvar_Update(gateway, vmCvar)
```

trap_Cvar_Update

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `vmCvar` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_UPDATE,[vmCvar])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L302)

<a id="function-function-mq3-client-cgame-syscalls-trap-cvar-variablestringbuffer-function-trap-cvar-variablestringbuffer-gateway-varname-buffer-bufsize-src-mq3-client-cgame-syscalls-ml-1325644306"></a>
### trap_Cvar_VariableStringBuffer

```ml
function trap_Cvar_VariableStringBuffer(gateway, varName, buffer, bufsize)
```

trap_Cvar_VariableStringBuffer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `varName` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize])`. |
| `buffer` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize])`. |
| `bufsize` | `dynamic` | — | Value used by `invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L313)

<a id="function-function-mq3-client-cgame-syscalls-trap-error-function-trap-error-gateway-fmt-src-mq3-client-cgame-syscalls-ml-424426299"></a>
### trap_Error

```ml
function trap_Error(gateway, fmt)
```

trap_Error

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `fmt` | `dynamic` | — | Value used by `invoke(gateway,CG_ERROR,[fmt])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L288)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-fclosefile-function-trap-fs-fclosefile-gateway-filehandle-src-mq3-client-cgame-syscalls-ml-1379919298"></a>
### trap_FS_FCloseFile

```ml
function trap_FS_FCloseFile(gateway, fileHandle)
```

trap_FS_FCloseFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `fileHandle` | `dynamic` | — | Value used by `invoke(gateway,CG_FS_FCLOSEFILE,[fileHandle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L349)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-fopenfile-function-trap-fs-fopenfile-gateway-qpath-filehandle-mode-src-mq3-client-cgame-syscalls-ml-1677859303"></a>
### trap_FS_FOpenFile

```ml
function trap_FS_FOpenFile(gateway, qpath, fileHandle, mode)
```

trap_FS_FOpenFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `qpath` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qpath,fileHandle,mode]`. |
| `fileHandle` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qpath,fileHandle,mode]`. |
| `mode` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qpath,fileHandle,mode]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L333)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-read-function-trap-fs-read-gateway-buffer-length-filehandle-src-mq3-client-cgame-syscalls-ml-1590540544"></a>
### trap_FS_Read

```ml
function trap_FS_Read(gateway, buffer, length, fileHandle)
```

trap_FS_Read

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `buffer` | `dynamic` | — | Value used by `invoke(gateway,CG_FS_READ,[buffer,length,fileHandle])`. |
| `length` | `dynamic` | — | Value used by `invoke(gateway,CG_FS_READ,[buffer,length,fileHandle])`. |
| `fileHandle` | `dynamic` | — | Value used by `invoke(gateway,CG_FS_READ,[buffer,length,fileHandle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L339)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-seek-function-trap-fs-seek-gateway-filehandle-offset-origin-src-mq3-client-cgame-syscalls-ml-551180919"></a>
### trap_FS_Seek

```ml
function trap_FS_Seek(gateway, fileHandle, offset, origin)
```

trap_FS_Seek

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `fileHandle` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[fileHandle,offset,origin]`. |
| `offset` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[fileHandle,offset,origin]`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L355)

<a id="function-function-mq3-client-cgame-syscalls-trap-fs-write-function-trap-fs-write-gateway-buffer-length-filehandle-src-mq3-client-cgame-syscalls-ml-1831385958"></a>
### trap_FS_Write

```ml
function trap_FS_Write(gateway, buffer, length, fileHandle)
```

trap_FS_Write

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `buffer` | `dynamic` | — | Value used by `invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle])`. |
| `length` | `dynamic` | — | Value used by `invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle])`. |
| `fileHandle` | `dynamic` | — | Value used by `invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L345)

<a id="function-function-mq3-client-cgame-syscalls-trap-getcamerainfo-function-trap-getcamerainfo-gateway-time-origin-angles-src-mq3-client-cgame-syscalls-ml-1248755701"></a>
### trap_getCameraInfo

```ml
function trap_getCameraInfo(gateway, time, origin, angles)
```

trap_getCameraInfo -- dormant in the shipped source, ordinal preserved.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `time` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[time,origin,angles]`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `angles` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[time,origin,angles]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L778)

<a id="function-function-mq3-client-cgame-syscalls-trap-getcurrentcmdnumber-function-trap-getcurrentcmdnumber-gateway-src-mq3-client-cgame-syscalls-ml-1958166074"></a>
### trap_GetCurrentCmdNumber

```ml
function trap_GetCurrentCmdNumber(gateway)
```

trap_GetCurrentCmdNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L655)

<a id="function-function-mq3-client-cgame-syscalls-trap-getcurrentsnapshotnumber-function-trap-getcurrentsnapshotnumber-gateway-snapshotnumber-servertime-src-mq3-client-cgame-syscalls-ml-690237997"></a>
### trap_GetCurrentSnapshotNumber

```ml
function trap_GetCurrentSnapshotNumber(gateway, snapshotNumber, serverTime)
```

trap_GetCurrentSnapshotNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `snapshotNumber` | `dynamic` | — | Value used by `invoke(gateway,CG_GETCURRENTSNAPSHOTNUMBER,[snapshotNumber,serverTime])`. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L643)

<a id="function-function-mq3-client-cgame-syscalls-trap-getentitytoken-function-trap-getentitytoken-gateway-buffer-buffersize-src-mq3-client-cgame-syscalls-ml-177230215"></a>
### trap_GetEntityToken

```ml
function trap_GetEntityToken(gateway, buffer, bufferSize)
```

trap_GetEntityToken

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `buffer` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[buffer,bufferSize]`. |
| `bufferSize` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[buffer,bufferSize]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L758)

<a id="function-function-mq3-client-cgame-syscalls-trap-getgamestate-function-trap-getgamestate-gateway-gamestate-src-mq3-client-cgame-syscalls-ml-1829349037"></a>
### trap_GetGameState

```ml
function trap_GetGameState(gateway, gameState)
```

trap_GetGameState

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `gameState` | `dynamic` | — | Value used by `invoke(gateway,CG_GETGAMESTATE,[gameState])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L638)

<a id="function-function-mq3-client-cgame-syscalls-trap-getglconfig-function-trap-getglconfig-gateway-glconfig-src-mq3-client-cgame-syscalls-ml-993102283"></a>
### trap_GetGlconfig

```ml
function trap_GetGlconfig(gateway, glconfig)
```

trap_GetGlconfig

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `glconfig` | `dynamic` | — | Value used by `invoke(gateway,CG_GETGLCONFIG,[glconfig])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L634)

<a id="function-function-mq3-client-cgame-syscalls-trap-getservercommand-function-trap-getservercommand-gateway-servercommandnumber-src-mq3-client-cgame-syscalls-ml-1137832049"></a>
### trap_GetServerCommand

```ml
function trap_GetServerCommand(gateway, serverCommandNumber)
```

trap_GetServerCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `serverCommandNumber` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[serverCommandNumber]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L652)

<a id="function-function-mq3-client-cgame-syscalls-trap-getsnapshot-function-trap-getsnapshot-gateway-snapshotnumber-snapshot-src-mq3-client-cgame-syscalls-ml-1622627959"></a>
### trap_GetSnapshot

```ml
function trap_GetSnapshot(gateway, snapshotNumber, snapshot)
```

trap_GetSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `snapshotNumber` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[snapshotNumber,snapshot]`. |
| `snapshot` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[snapshotNumber,snapshot]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L648)

<a id="function-function-mq3-client-cgame-syscalls-trap-getusercmd-function-trap-getusercmd-gateway-cmdnumber-usercmd-src-mq3-client-cgame-syscalls-ml-1320579262"></a>
### trap_GetUserCmd

```ml
function trap_GetUserCmd(gateway, cmdNumber, usercmd)
```

trap_GetUserCmd

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `cmdNumber` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[cmdNumber,usercmd]`. |
| `usercmd` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[cmdNumber,usercmd]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L660)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-getcatcher-function-trap-key-getcatcher-gateway-src-mq3-client-cgame-syscalls-ml-1611388426"></a>
### trap_Key_GetCatcher

```ml
function trap_Key_GetCatcher(gateway)
```

trap_Key_GetCatcher

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L685)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-getkey-function-trap-key-getkey-gateway-binding-src-mq3-client-cgame-syscalls-ml-798385819"></a>
### trap_Key_GetKey

```ml
function trap_Key_GetKey(gateway, binding)
```

trap_Key_GetKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `binding` | `dynamic` | — | Command text associated with an input key. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L693)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-isdown-function-trap-key-isdown-gateway-keynum-src-mq3-client-cgame-syscalls-ml-398957423"></a>
### trap_Key_IsDown

```ml
function trap_Key_IsDown(gateway, keynum)
```

trap_Key_IsDown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `keynum` | `dynamic` | — | Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L682)

<a id="function-function-mq3-client-cgame-syscalls-trap-key-setcatcher-function-trap-key-setcatcher-gateway-catcher-src-mq3-client-cgame-syscalls-ml-1745487660"></a>
### trap_Key_SetCatcher

```ml
function trap_Key_SetCatcher(gateway, catcher)
```

trap_Key_SetCatcher

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `catcher` | `dynamic` | — | Value used by `invoke(gateway,CG_KEY_SETCATCHER,[catcher])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L689)

<a id="function-function-mq3-client-cgame-syscalls-trap-loadcamera-function-trap-loadcamera-gateway-name-src-mq3-client-cgame-syscalls-ml-816341775"></a>
### trap_loadCamera

```ml
function trap_loadCamera(gateway, name)
```

trap_loadCamera -- dormant in the shipped source, ordinal preserved.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `name` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L768)

<a id="function-function-mq3-client-cgame-syscalls-trap-memoryremaining-function-trap-memoryremaining-gateway-src-mq3-client-cgame-syscalls-ml-1147766054"></a>
### trap_MemoryRemaining

```ml
function trap_MemoryRemaining(gateway)
```

trap_MemoryRemaining

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L678)

<a id="function-function-mq3-client-cgame-syscalls-trap-milliseconds-function-trap-milliseconds-gateway-src-mq3-client-cgame-syscalls-ml-71449854"></a>
### trap_Milliseconds

```ml
function trap_Milliseconds(gateway)
```

trap_Milliseconds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L291)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-addglobaldefine-function-trap-pc-addglobaldefine-gateway-definetext-src-mq3-client-cgame-syscalls-ml-2005838772"></a>
### trap_PC_AddGlobalDefine

```ml
function trap_PC_AddGlobalDefine(gateway, defineText)
```

trap_PC_AddGlobalDefine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `defineText` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[defineText]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L697)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-freesource-function-trap-pc-freesource-gateway-handle-src-mq3-client-cgame-syscalls-ml-1661270712"></a>
### trap_PC_FreeSource

```ml
function trap_PC_FreeSource(gateway, handle)
```

trap_PC_FreeSource

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `handle` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L705)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-loadsource-function-trap-pc-loadsource-gateway-filename-src-mq3-client-cgame-syscalls-ml-216817495"></a>
### trap_PC_LoadSource

```ml
function trap_PC_LoadSource(gateway, filename)
```

trap_PC_LoadSource

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. Forwarded to `mq3.client.cgame_syscalls.invoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L701)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-readtoken-function-trap-pc-readtoken-gateway-handle-token-src-mq3-client-cgame-syscalls-ml-2012527445"></a>
### trap_PC_ReadToken

```ml
function trap_PC_ReadToken(gateway, handle, token)
```

trap_PC_ReadToken

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `handle` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,token]`. |
| `token` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,token]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L710)

<a id="function-function-mq3-client-cgame-syscalls-trap-pc-sourcefileandline-function-trap-pc-sourcefileandline-gateway-handle-filename-line-src-mq3-client-cgame-syscalls-ml-1987395583"></a>
### trap_PC_SourceFileAndLine

```ml
function trap_PC_SourceFileAndLine(gateway, handle, filename, line)
```

trap_PC_SourceFileAndLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `handle` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,filename,line]`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `line` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,filename,line]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L716)

<a id="function-function-mq3-client-cgame-syscalls-trap-print-function-trap-print-gateway-fmt-src-mq3-client-cgame-syscalls-ml-100277051"></a>
### trap_Print

```ml
function trap_Print(gateway, fmt)
```

trap_Print

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `fmt` | `dynamic` | — | Value used by `invoke(gateway,CG_PRINT,[fmt])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L284)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addadditivelighttoscene-function-trap-r-addadditivelighttoscene-gateway-origin-intensity-red-green-blue-src-mq3-client-cgame-syscalls-ml-617205121"></a>
### trap_R_AddAdditiveLightToScene

```ml
function trap_R_AddAdditiveLightToScene(gateway, origin, intensity, red, green, blue)
```

trap_R_AddAdditiveLightToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `intensity` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDADDITIVELIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)])`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L589)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addlighttoscene-function-trap-r-addlighttoscene-gateway-origin-intensity-red-green-blue-src-mq3-client-cgame-syscalls-ml-145813657"></a>
### trap_R_AddLightToScene

```ml
function trap_R_AddLightToScene(gateway, origin, intensity, red, green, blue)
```

trap_R_AddLightToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `intensity` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDLIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)])`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L581)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addpolystoscene-function-trap-r-addpolystoscene-gateway-shader-numverts-verts-num-src-mq3-client-cgame-syscalls-ml-1915688091"></a>
### trap_R_AddPolysToScene

```ml
function trap_R_AddPolysToScene(gateway, shader, numVerts, verts, num)
```

trap_R_AddPolysToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `numVerts` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num])`. |
| `verts` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num])`. |
| `num` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L566)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addpolytoscene-function-trap-r-addpolytoscene-gateway-shader-numverts-verts-src-mq3-client-cgame-syscalls-ml-2045359693"></a>
### trap_R_AddPolyToScene

```ml
function trap_R_AddPolyToScene(gateway, shader, numVerts, verts)
```

trap_R_AddPolyToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `numVerts` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDPOLYTOSCENE,[shader,numVerts,verts])`. |
| `verts` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDPOLYTOSCENE,[shader,numVerts,verts])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L559)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-addrefentitytoscene-function-trap-r-addrefentitytoscene-gateway-refentity-src-mq3-client-cgame-syscalls-ml-1228719374"></a>
### trap_R_AddRefEntityToScene

```ml
function trap_R_AddRefEntityToScene(gateway, refEntity)
```

trap_R_AddRefEntityToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `refEntity` | `dynamic` | — | Value used by `invoke(gateway,CG_R_ADDREFENTITYTOSCENE,[refEntity])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L553)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-clearscene-function-trap-r-clearscene-gateway-src-mq3-client-cgame-syscalls-ml-564684602"></a>
### trap_R_ClearScene

```ml
function trap_R_ClearScene(gateway)
```

trap_R_ClearScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L549)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-drawstretchpic-function-trap-r-drawstretchpic-gateway-x-y-width-height-s1-t1-s2-t2-shader-src-mq3-client-cgame-syscalls-ml-1706119295"></a>
### trap_R_DrawStretchPic

```ml
function trap_R_DrawStretchPic(gateway, x, y, width, height, s1, t1, s2, t2, shader)
```

trap_R_DrawStretchPic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `trap_R_DrawStretchPic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `trap_R_DrawStretchPic`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `trap_R_DrawStretchPic`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `trap_R_DrawStretchPic`. |
| `s1` | `dynamic` | — | Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`. |
| `t1` | `dynamic` | — | Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`. |
| `s2` | `dynamic` | — | Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`. |
| `t2` | `dynamic` | — | Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L609)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-inpvs-function-trap-r-inpvs-gateway-p1-p2-src-mq3-client-cgame-syscalls-ml-2021430035"></a>
### trap_R_inPVS

```ml
function trap_R_inPVS(gateway, p1, p2)
```

trap_R_inPVS

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `p1` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[p1,p2]`. |
| `p2` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[p1,p2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L763)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-lerptag-function-trap-r-lerptag-gateway-tag-model-startframe-endframe-fraction-tagname-src-mq3-client-cgame-syscalls-ml-1481697335"></a>
### trap_R_LerpTag

```ml
function trap_R_LerpTag(gateway, tag, model, startFrame, endFrame, fraction, tagName)
```

trap_R_LerpTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `tag` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`. |
| `model` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`. |
| `startFrame` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`. |
| `endFrame` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `tagName` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L624)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-lightforpoint-function-trap-r-lightforpoint-gateway-point-ambientlight-directedlight-lightdir-src-mq3-client-cgame-syscalls-ml-1118475931"></a>
### trap_R_LightForPoint

```ml
function trap_R_LightForPoint(gateway, point, ambientLight, directedLight, lightDir)
```

trap_R_LightForPoint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `point` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`. |
| `ambientLight` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`. |
| `directedLight` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`. |
| `lightDir` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L573)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-loadworldmap-function-trap-r-loadworldmap-gateway-mapname-src-mq3-client-cgame-syscalls-ml-1666590635"></a>
### trap_R_LoadWorldMap

```ml
function trap_R_LoadWorldMap(gateway, mapname)
```

trap_R_LoadWorldMap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `mapname` | `dynamic` | — | Value used by `invoke(gateway,CG_R_LOADWORLDMAP,[mapname])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L524)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-modelbounds-function-trap-r-modelbounds-gateway-model-mins-maxs-src-mq3-client-cgame-syscalls-ml-1886039971"></a>
### trap_R_ModelBounds

```ml
function trap_R_ModelBounds(gateway, model, mins, maxs)
```

trap_R_ModelBounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game syscalls operation. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L615)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registerfont-function-trap-r-registerfont-gateway-fontname-pointsize-font-src-mq3-client-cgame-syscalls-ml-2051606242"></a>
### trap_R_RegisterFont

```ml
function trap_R_RegisterFont(gateway, fontName, pointSize, font)
```

trap_R_RegisterFont

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `fontName` | `dynamic` | — | Value used by `invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font])`. |
| `pointSize` | `dynamic` | — | Value used by `invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font])`. |
| `font` | `dynamic` | — | Value used by `invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L546)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registermodel-function-trap-r-registermodel-gateway-name-src-mq3-client-cgame-syscalls-ml-1879620025"></a>
### trap_R_RegisterModel

```ml
function trap_R_RegisterModel(gateway, name)
```

trap_R_RegisterModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `name` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L528)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registershader-function-trap-r-registershader-gateway-name-src-mq3-client-cgame-syscalls-ml-832703571"></a>
### trap_R_RegisterShader

```ml
function trap_R_RegisterShader(gateway, name)
```

trap_R_RegisterShader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `name` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L536)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registershadernomip-function-trap-r-registershadernomip-gateway-name-src-mq3-client-cgame-syscalls-ml-1699868397"></a>
### trap_R_RegisterShaderNoMip

```ml
function trap_R_RegisterShaderNoMip(gateway, name)
```

trap_R_RegisterShaderNoMip

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `name` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L540)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-registerskin-function-trap-r-registerskin-gateway-name-src-mq3-client-cgame-syscalls-ml-594257987"></a>
### trap_R_RegisterSkin

```ml
function trap_R_RegisterSkin(gateway, name)
```

trap_R_RegisterSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `name` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L532)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-remapshader-function-trap-r-remapshader-gateway-oldshader-newshader-timeoffset-src-mq3-client-cgame-syscalls-ml-418774427"></a>
### trap_R_RemapShader

```ml
function trap_R_RemapShader(gateway, oldShader, newShader, timeOffset)
```

trap_R_RemapShader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `oldShader` | `dynamic` | — | Value used by `invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset])`. |
| `newShader` | `dynamic` | — | Value used by `invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset])`. |
| `timeOffset` | `dynamic` | — | Value used by `invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L630)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-renderscene-function-trap-r-renderscene-gateway-refdef-src-mq3-client-cgame-syscalls-ml-1000481654"></a>
### trap_R_RenderScene

```ml
function trap_R_RenderScene(gateway, refdef)
```

trap_R_RenderScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `refdef` | `dynamic` | — | Value used by `invoke(gateway,CG_R_RENDERSCENE,[refdef])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L593)

<a id="function-function-mq3-client-cgame-syscalls-trap-r-setcolor-function-trap-r-setcolor-gateway-rgba-src-mq3-client-cgame-syscalls-ml-1337036580"></a>
### trap_R_SetColor

```ml
function trap_R_SetColor(gateway, rgba)
```

trap_R_SetColor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `rgba` | `dynamic` | — | Value used by `invoke(gateway,CG_R_SETCOLOR,[rgba])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L597)

<a id="function-function-mq3-client-cgame-syscalls-trap-realtime-function-trap-realtime-gateway-qtime-src-mq3-client-cgame-syscalls-ml-1474950064"></a>
### trap_RealTime

```ml
function trap_RealTime(gateway, qtime)
```

trap_RealTime

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `qtime` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qtime]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L720)

<a id="function-function-mq3-client-cgame-syscalls-trap-removecommand-function-trap-removecommand-gateway-cmdname-src-mq3-client-cgame-syscalls-ml-627020691"></a>
### trap_RemoveCommand

```ml
function trap_RemoveCommand(gateway, cmdName)
```

trap_RemoveCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `cmdName` | `dynamic` | — | Value used by `invoke(gateway,CG_REMOVECOMMAND,[cmdName])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L367)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-addloopingsound-function-trap-s-addloopingsound-gateway-entitynum-origin-velocity-sfx-src-mq3-client-cgame-syscalls-ml-1133685397"></a>
### trap_S_AddLoopingSound

```ml
function trap_S_AddLoopingSound(gateway, entityNum, origin, velocity, sfx)
```

trap_S_AddLoopingSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `sfx` | `dynamic` | — | Value used by `invoke(gateway,CG_S_ADDLOOPINGSOUND,[entityNum,origin,velocity,sfx])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L484)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-addrealloopingsound-function-trap-s-addrealloopingsound-gateway-entitynum-origin-velocity-sfx-src-mq3-client-cgame-syscalls-ml-967946705"></a>
### trap_S_AddRealLoopingSound

```ml
function trap_S_AddRealLoopingSound(gateway, entityNum, origin, velocity, sfx)
```

trap_S_AddRealLoopingSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `sfx` | `dynamic` | — | Value used by `invoke(gateway,CG_S_ADDREALLOOPINGSOUND,[entityNum,origin,velocity,sfx])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L491)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-clearloopingsounds-function-trap-s-clearloopingsounds-gateway-killall-src-mq3-client-cgame-syscalls-ml-1619418529"></a>
### trap_S_ClearLoopingSounds

```ml
function trap_S_ClearLoopingSounds(gateway, killAll)
```

trap_S_ClearLoopingSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `killAll` | `dynamic` | — | Value used by `invoke(gateway,CG_S_CLEARLOOPINGSOUNDS,[killAll])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L477)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-registersound-function-trap-s-registersound-gateway-sample-compressed-src-mq3-client-cgame-syscalls-ml-1473847281"></a>
### trap_S_RegisterSound

```ml
function trap_S_RegisterSound(gateway, sample, compressed)
```

trap_S_RegisterSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`. |
| `sample` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[sample,compressed]`. |
| `compressed` | `dynamic` | — | Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[sample,compressed]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L512)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-respatialize-function-trap-s-respatialize-gateway-entitynum-origin-axis-inwater-src-mq3-client-cgame-syscalls-ml-1408081004"></a>
### trap_S_Respatialize

```ml
function trap_S_Respatialize(gateway, entityNum, origin, axis, inWater)
```

trap_S_Respatialize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `axis` | `dynamic` | — | Value used by `invoke(gateway,CG_S_RESPATIALIZE,[entityNum,origin,axis,inWater])`. |
| `inWater` | `dynamic` | — | Value used by `invoke(gateway,CG_S_RESPATIALIZE,[entityNum,origin,axis,inWater])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L507)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-startbackgroundtrack-function-trap-s-startbackgroundtrack-gateway-intro-loopname-src-mq3-client-cgame-syscalls-ml-1975025765"></a>
### trap_S_StartBackgroundTrack

```ml
function trap_S_StartBackgroundTrack(gateway, intro, loopName)
```

trap_S_StartBackgroundTrack

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `intro` | `dynamic` | — | Value used by `invoke(gateway,CG_S_STARTBACKGROUNDTRACK,[intro,loopName])`. |
| `loopName` | `dynamic` | — | Value used by `invoke(gateway,CG_S_STARTBACKGROUNDTRACK,[intro,loopName])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L517)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-startlocalsound-function-trap-s-startlocalsound-gateway-sfx-channelnum-src-mq3-client-cgame-syscalls-ml-1516783862"></a>
### trap_S_StartLocalSound

```ml
function trap_S_StartLocalSound(gateway, sfx, channelNum)
```

trap_S_StartLocalSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `sfx` | `dynamic` | — | Value used by `invoke(gateway,CG_S_STARTLOCALSOUND,[sfx,channelNum])`. |
| `channelNum` | `dynamic` | — | Value used by `invoke(gateway,CG_S_STARTLOCALSOUND,[sfx,channelNum])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L473)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-startsound-function-trap-s-startsound-gateway-origin-entitynum-entitychannel-sfx-src-mq3-client-cgame-syscalls-ml-283164432"></a>
### trap_S_StartSound

```ml
function trap_S_StartSound(gateway, origin, entityNum, entityChannel, sfx)
```

trap_S_StartSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `entityChannel` | `dynamic` | — | Value used by `invoke(gateway,CG_S_STARTSOUND,[origin,entityNum,entityChannel,sfx])`. |
| `sfx` | `dynamic` | — | Value used by `invoke(gateway,CG_S_STARTSOUND,[origin,entityNum,entityChannel,sfx])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L468)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-stopbackgroundtrack-function-trap-s-stopbackgroundtrack-gateway-src-mq3-client-cgame-syscalls-ml-1515064830"></a>
### trap_S_StopBackgroundTrack

```ml
function trap_S_StopBackgroundTrack(gateway)
```

trap_S_StopBackgroundTrack

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L520)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-stoploopingsound-function-trap-s-stoploopingsound-gateway-entitynum-src-mq3-client-cgame-syscalls-ml-604828847"></a>
### trap_S_StopLoopingSound

```ml
function trap_S_StopLoopingSound(gateway, entityNum)
```

trap_S_StopLoopingSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L495)

<a id="function-function-mq3-client-cgame-syscalls-trap-s-updateentityposition-function-trap-s-updateentityposition-gateway-entitynum-origin-src-mq3-client-cgame-syscalls-ml-58090693"></a>
### trap_S_UpdateEntityPosition

```ml
function trap_S_UpdateEntityPosition(gateway, entityNum, origin)
```

trap_S_UpdateEntityPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L500)

<a id="function-function-mq3-client-cgame-syscalls-trap-sendclientcommand-function-trap-sendclientcommand-gateway-text-src-mq3-client-cgame-syscalls-ml-92827161"></a>
### trap_SendClientCommand

```ml
function trap_SendClientCommand(gateway, text)
```

trap_SendClientCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `text` | `dynamic` | — | Text consumed or emitted by `trap_SendClientCommand` in the client game syscalls path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L371)

<a id="function-function-mq3-client-cgame-syscalls-trap-sendconsolecommand-function-trap-sendconsolecommand-gateway-text-src-mq3-client-cgame-syscalls-ml-1415473777"></a>
### trap_SendConsoleCommand

```ml
function trap_SendConsoleCommand(gateway, text)
```

trap_SendConsoleCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `text` | `dynamic` | — | Text consumed or emitted by `trap_SendConsoleCommand` in the client game syscalls path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L359)

<a id="function-function-mq3-client-cgame-syscalls-trap-setusercmdvalue-function-trap-setusercmdvalue-gateway-statevalue-sensitivityscale-src-mq3-client-cgame-syscalls-ml-1348189151"></a>
### trap_SetUserCmdValue

```ml
function trap_SetUserCmdValue(gateway, stateValue, sensitivityScale)
```

trap_SetUserCmdValue

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `stateValue` | `dynamic` | — | Value used by `invoke(gateway,CG_SETUSERCMDVALUE,[stateValue,PASSFLOAT(sensitivityScale)])`. |
| `sensitivityScale` | `dynamic` | — | Value used by `invoke(gateway,CG_SETUSERCMDVALUE,[stateValue,PASSFLOAT(sensitivityScale)])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L665)

<a id="function-function-mq3-client-cgame-syscalls-trap-snapvector-function-trap-snapvector-gateway-vector-src-mq3-client-cgame-syscalls-ml-176306411"></a>
### trap_SnapVector

```ml
function trap_SnapVector(gateway, vector)
```

trap_SnapVector

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `vector` | `dynamic` | — | Value used by `invoke(gateway,CG_SNAPVECTOR,[vector])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L724)

<a id="function-function-mq3-client-cgame-syscalls-trap-startcamera-function-trap-startcamera-gateway-time-src-mq3-client-cgame-syscalls-ml-233066587"></a>
### trap_startCamera

```ml
function trap_startCamera(gateway, time)
```

trap_startCamera -- dormant in the shipped source, ordinal preserved.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |
| `time` | `dynamic` | — | Value used by `invoke(gateway,CG_STARTCAMERA,[time])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L772)

<a id="function-function-mq3-client-cgame-syscalls-trap-updatescreen-function-trap-updatescreen-gateway-src-mq3-client-cgame-syscalls-ml-1051710388"></a>
### trap_UpdateScreen

```ml
function trap_UpdateScreen(gateway)
```

trap_UpdateScreen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gateway` | `dynamic` | — | Native syscall gateway carrying the dispatcher callback and its host context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L374)
