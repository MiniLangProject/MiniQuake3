# `src/mq3/client/cgame_public.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_public`](Package-mq3-client-cgame-public-1101956992.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-client-cgame-public-cg-acos-const-cg-acos-111-src-mq3-client-cgame-public-ml-58630206"></a>
### CG_ACOS

```ml
const CG_ACOS = 111
```

CG engine-syscall ordinal used to evaluate inverse cosine for a VM numeric operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L229)

<a id="constant-constant-mq3-client-cgame-public-cg-addcommand-const-cg-addcommand-15-src-mq3-client-cgame-public-ml-1585516979"></a>
### CG_ADDCOMMAND

```ml
const CG_ADDCOMMAND = 15
```

CG engine-syscall ordinal used to register a console-command name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L56)

<a id="constant-constant-mq3-client-cgame-public-cg-argc-const-cg-argc-7-src-mq3-client-cgame-public-ml-80165358"></a>
### CG_ARGC

```ml
const CG_ARGC = 7
```

CG engine-syscall ordinal used to query the number of console-command arguments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L40)

<a id="constant-constant-mq3-client-cgame-public-cg-args-const-cg-args-9-src-mq3-client-cgame-public-ml-2000979376"></a>
### CG_ARGS

```ml
const CG_ARGS = 9
```

CG engine-syscall ordinal used to read the remaining console-command argument text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L44)

<a id="constant-constant-mq3-client-cgame-public-cg-argv-const-cg-argv-8-src-mq3-client-cgame-public-ml-1698963989"></a>
### CG_ARGV

```ml
const CG_ARGV = 8
```

CG engine-syscall ordinal used to read a console-command argument.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L42)

<a id="constant-constant-mq3-client-cgame-public-cg-atan2-const-cg-atan2-105-src-mq3-client-cgame-public-ml-1620183785"></a>
### CG_ATAN2

```ml
const CG_ATAN2 = 105
```

CG engine-syscall ordinal used to evaluate the angle of a two-component vector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L217)

<a id="constant-constant-mq3-client-cgame-public-cg-ceil-const-cg-ceil-108-src-mq3-client-cgame-public-ml-561962952"></a>
### CG_CEIL

```ml
const CG_CEIL = 108
```

CG engine-syscall ordinal used to round a VM numeric value up to an integer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L223)

<a id="constant-constant-mq3-client-cgame-public-cg-cin-drawcinematic-const-cg-cin-drawcinematic-77-src-mq3-client-cgame-public-ml-1373926967"></a>
### CG_CIN_DRAWCINEMATIC

```ml
const CG_CIN_DRAWCINEMATIC = 77
```

CG engine-syscall ordinal used to draw the current cinematic frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L181)

<a id="constant-constant-mq3-client-cgame-public-cg-cin-playcinematic-const-cg-cin-playcinematic-74-src-mq3-client-cgame-public-ml-906152024"></a>
### CG_CIN_PLAYCINEMATIC

```ml
const CG_CIN_PLAYCINEMATIC = 74
```

CG engine-syscall ordinal used to open and start a cinematic stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L175)

<a id="constant-constant-mq3-client-cgame-public-cg-cin-runcinematic-const-cg-cin-runcinematic-76-src-mq3-client-cgame-public-ml-150475738"></a>
### CG_CIN_RUNCINEMATIC

```ml
const CG_CIN_RUNCINEMATIC = 76
```

CG engine-syscall ordinal used to advance a cinematic decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L179)

<a id="constant-constant-mq3-client-cgame-public-cg-cin-setextents-const-cg-cin-setextents-78-src-mq3-client-cgame-public-ml-1991442156"></a>
### CG_CIN_SETEXTENTS

```ml
const CG_CIN_SETEXTENTS = 78
```

CG engine-syscall ordinal used to set a cinematic's screen rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L183)

<a id="constant-constant-mq3-client-cgame-public-cg-cin-stopcinematic-const-cg-cin-stopcinematic-75-src-mq3-client-cgame-public-ml-546818061"></a>
### CG_CIN_STOPCINEMATIC

```ml
const CG_CIN_STOPCINEMATIC = 75
```

CG engine-syscall ordinal used to stop a cinematic stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L177)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-boxtrace-const-cg-cm-boxtrace-25-src-mq3-client-cgame-public-ml-1118954264"></a>
### CG_CM_BOXTRACE

```ml
const CG_CM_BOXTRACE = 25
```

CG engine-syscall ordinal used to sweep a box through the collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L76)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-capsuletrace-const-cg-cm-capsuletrace-83-src-mq3-client-cgame-public-ml-1317657516"></a>
### CG_CM_CAPSULETRACE

```ml
const CG_CM_CAPSULETRACE = 83
```

CG engine-syscall ordinal used to sweep a capsule through the collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L193)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-inlinemodel-const-cg-cm-inlinemodel-20-src-mq3-client-cgame-public-ml-1040655959"></a>
### CG_CM_INLINEMODEL

```ml
const CG_CM_INLINEMODEL = 20
```

CG engine-syscall ordinal used to resolve an inline collision-model handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L66)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-loadmap-const-cg-cm-loadmap-18-src-mq3-client-cgame-public-ml-611402850"></a>
### CG_CM_LOADMAP

```ml
const CG_CM_LOADMAP = 18
```

CG engine-syscall ordinal used to load the map's collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L62)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-loadmodel-const-cg-cm-loadmodel-21-src-mq3-client-cgame-public-ml-1576229654"></a>
### CG_CM_LOADMODEL

```ml
const CG_CM_LOADMODEL = 21
```

CG engine-syscall ordinal used to load a collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L68)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-markfragments-const-cg-cm-markfragments-27-src-mq3-client-cgame-public-ml-2129532336"></a>
### CG_CM_MARKFRAGMENTS

```ml
const CG_CM_MARKFRAGMENTS = 27
```

CG engine-syscall ordinal used to clip decal geometry against world surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L80)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-numinlinemodels-const-cg-cm-numinlinemodels-19-src-mq3-client-cgame-public-ml-1769972935"></a>
### CG_CM_NUMINLINEMODELS

```ml
const CG_CM_NUMINLINEMODELS = 19
```

CG engine-syscall ordinal used to query the number of inline collision models.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L64)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-pointcontents-const-cg-cm-pointcontents-23-src-mq3-client-cgame-public-ml-551074836"></a>
### CG_CM_POINTCONTENTS

```ml
const CG_CM_POINTCONTENTS = 23
```

CG engine-syscall ordinal used to query collision contents at a world position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L72)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-tempboxmodel-const-cg-cm-tempboxmodel-22-src-mq3-client-cgame-public-ml-1478894839"></a>
### CG_CM_TEMPBOXMODEL

```ml
const CG_CM_TEMPBOXMODEL = 22
```

CG engine-syscall ordinal used to construct a temporary box collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L70)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-tempcapsulemodel-const-cg-cm-tempcapsulemodel-82-src-mq3-client-cgame-public-ml-1144868009"></a>
### CG_CM_TEMPCAPSULEMODEL

```ml
const CG_CM_TEMPCAPSULEMODEL = 82
```

CG engine-syscall ordinal used to construct a temporary capsule collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L191)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-transformedboxtrace-const-cg-cm-transformedboxtrace-26-src-mq3-client-cgame-public-ml-988559553"></a>
### CG_CM_TRANSFORMEDBOXTRACE

```ml
const CG_CM_TRANSFORMEDBOXTRACE = 26
```

CG engine-syscall ordinal used to sweep a box against a transformed collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L78)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-transformedcapsuletrace-const-cg-cm-transformedcapsuletrace-84-src-mq3-client-cgame-public-ml-758817601"></a>
### CG_CM_TRANSFORMEDCAPSULETRACE

```ml
const CG_CM_TRANSFORMEDCAPSULETRACE = 84
```

CG engine-syscall ordinal used to sweep a capsule against a transformed collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L195)

<a id="constant-constant-mq3-client-cgame-public-cg-cm-transformedpointcontents-const-cg-cm-transformedpointcontents-24-src-mq3-client-cgame-public-ml-197741699"></a>
### CG_CM_TRANSFORMEDPOINTCONTENTS

```ml
const CG_CM_TRANSFORMEDPOINTCONTENTS = 24
```

CG engine-syscall ordinal used to query point contents in a transformed model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L74)

<a id="constant-constant-mq3-client-cgame-public-cg-console-command-const-cg-console-command-2-src-mq3-client-cgame-public-ml-1049534705"></a>
### CG_CONSOLE_COMMAND

```ml
const CG_CONSOLE_COMMAND = 2
```

CG VM entry-point ordinal used to handle a CGame console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L236)

<a id="constant-constant-mq3-client-cgame-public-cg-cos-const-cg-cos-104-src-mq3-client-cgame-public-ml-1643633754"></a>
### CG_COS

```ml
const CG_COS = 104
```

CG engine-syscall ordinal used to evaluate cosine for a VM numeric operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L215)

<a id="constant-constant-mq3-client-cgame-public-cg-crosshair-player-const-cg-crosshair-player-4-src-mq3-client-cgame-public-ml-632023509"></a>
### CG_CROSSHAIR_PLAYER

```ml
const CG_CROSSHAIR_PLAYER = 4
```

CG VM entry-point ordinal used to query the player currently under the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L240)

<a id="constant-constant-mq3-client-cgame-public-cg-cvar-register-const-cg-cvar-register-3-src-mq3-client-cgame-public-ml-1548467882"></a>
### CG_CVAR_REGISTER

```ml
const CG_CVAR_REGISTER = 3
```

CG engine-syscall ordinal used to register a configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L32)

<a id="constant-constant-mq3-client-cgame-public-cg-cvar-set-const-cg-cvar-set-5-src-mq3-client-cgame-public-ml-365262144"></a>
### CG_CVAR_SET

```ml
const CG_CVAR_SET = 5
```

CG engine-syscall ordinal used to set a configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L36)

<a id="constant-constant-mq3-client-cgame-public-cg-cvar-update-const-cg-cvar-update-4-src-mq3-client-cgame-public-ml-509282033"></a>
### CG_CVAR_UPDATE

```ml
const CG_CVAR_UPDATE = 4
```

CG engine-syscall ordinal used to refresh a mirrored configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L34)

<a id="constant-constant-mq3-client-cgame-public-cg-cvar-variablestringbuffer-const-cg-cvar-variablestringbuffer-6-src-mq3-client-cgame-public-ml-134796491"></a>
### CG_CVAR_VARIABLESTRINGBUFFER

```ml
const CG_CVAR_VARIABLESTRINGBUFFER = 6
```

CG engine-syscall ordinal used to read a configuration variable as text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L38)

<a id="constant-constant-mq3-client-cgame-public-cg-draw-active-frame-const-cg-draw-active-frame-3-src-mq3-client-cgame-public-ml-1629620020"></a>
### CG_DRAW_ACTIVE_FRAME

```ml
const CG_DRAW_ACTIVE_FRAME = 3
```

CG VM entry-point ordinal used to render a CGame frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L238)

<a id="constant-constant-mq3-client-cgame-public-cg-error-const-cg-error-1-src-mq3-client-cgame-public-ml-1157417080"></a>
### CG_ERROR

```ml
const CG_ERROR = 1
```

CG engine-syscall ordinal used to raise an engine error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L28)

<a id="constant-constant-mq3-client-cgame-public-cg-event-handling-const-cg-event-handling-8-src-mq3-client-cgame-public-ml-824305761"></a>
### CG_EVENT_HANDLING

```ml
const CG_EVENT_HANDLING = 8
```

CG VM entry-point ordinal used to switch CGame event-handling mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L248)

<a id="constant-constant-mq3-client-cgame-public-cg-floor-const-cg-floor-107-src-mq3-client-cgame-public-ml-486535563"></a>
### CG_FLOOR

```ml
const CG_FLOOR = 107
```

CG engine-syscall ordinal used to round a VM numeric value down to an integer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L221)

<a id="constant-constant-mq3-client-cgame-public-cg-fs-fclosefile-const-cg-fs-fclosefile-13-src-mq3-client-cgame-public-ml-1681346373"></a>
### CG_FS_FCLOSEFILE

```ml
const CG_FS_FCLOSEFILE = 13
```

CG engine-syscall ordinal used to close a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L52)

<a id="constant-constant-mq3-client-cgame-public-cg-fs-fopenfile-const-cg-fs-fopenfile-10-src-mq3-client-cgame-public-ml-2019542098"></a>
### CG_FS_FOPENFILE

```ml
const CG_FS_FOPENFILE = 10
```

CG engine-syscall ordinal used to open a file in the virtual filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L46)

<a id="constant-constant-mq3-client-cgame-public-cg-fs-read-const-cg-fs-read-11-src-mq3-client-cgame-public-ml-1137276063"></a>
### CG_FS_READ

```ml
const CG_FS_READ = 11
```

CG engine-syscall ordinal used to read bytes from a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L48)

<a id="constant-constant-mq3-client-cgame-public-cg-fs-seek-const-cg-fs-seek-89-src-mq3-client-cgame-public-ml-1344846488"></a>
### CG_FS_SEEK

```ml
const CG_FS_SEEK = 89
```

CG engine-syscall ordinal used to seek within a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L205)

<a id="constant-constant-mq3-client-cgame-public-cg-fs-write-const-cg-fs-write-12-src-mq3-client-cgame-public-ml-1279488852"></a>
### CG_FS_WRITE

```ml
const CG_FS_WRITE = 12
```

CG engine-syscall ordinal used to write bytes to a virtual file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L50)

<a id="constant-constant-mq3-client-cgame-public-cg-get-entity-token-const-cg-get-entity-token-86-src-mq3-client-cgame-public-ml-218562131"></a>
### CG_GET_ENTITY_TOKEN

```ml
const CG_GET_ENTITY_TOKEN = 86
```

CG engine-syscall ordinal used to read the next map-entity token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L199)

<a id="constant-constant-mq3-client-cgame-public-cg-getcurrentcmdnumber-const-cg-getcurrentcmdnumber-54-src-mq3-client-cgame-public-ml-2140988462"></a>
### CG_GETCURRENTCMDNUMBER

```ml
const CG_GETCURRENTCMDNUMBER = 54
```

CG engine-syscall ordinal used to query the latest local user-command sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L134)

<a id="constant-constant-mq3-client-cgame-public-cg-getcurrentsnapshotnumber-const-cg-getcurrentsnapshotnumber-51-src-mq3-client-cgame-public-ml-129393175"></a>
### CG_GETCURRENTSNAPSHOTNUMBER

```ml
const CG_GETCURRENTSNAPSHOTNUMBER = 51
```

CG engine-syscall ordinal used to query the latest available snapshot sequence and server time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L128)

<a id="constant-constant-mq3-client-cgame-public-cg-getgamestate-const-cg-getgamestate-50-src-mq3-client-cgame-public-ml-1990148074"></a>
### CG_GETGAMESTATE

```ml
const CG_GETGAMESTATE = 50
```

CG engine-syscall ordinal used to read server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L126)

<a id="constant-constant-mq3-client-cgame-public-cg-getglconfig-const-cg-getglconfig-49-src-mq3-client-cgame-public-ml-99882398"></a>
### CG_GETGLCONFIG

```ml
const CG_GETGLCONFIG = 49
```

CG engine-syscall ordinal used to read the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L124)

<a id="constant-constant-mq3-client-cgame-public-cg-getservercommand-const-cg-getservercommand-53-src-mq3-client-cgame-public-ml-719570165"></a>
### CG_GETSERVERCOMMAND

```ml
const CG_GETSERVERCOMMAND = 53
```

CG engine-syscall ordinal used to read a reliable server command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L132)

<a id="constant-constant-mq3-client-cgame-public-cg-getsnapshot-const-cg-getsnapshot-52-src-mq3-client-cgame-public-ml-1363989124"></a>
### CG_GETSNAPSHOT

```ml
const CG_GETSNAPSHOT = 52
```

CG engine-syscall ordinal used to read a server snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L130)

<a id="constant-constant-mq3-client-cgame-public-cg-getusercmd-const-cg-getusercmd-55-src-mq3-client-cgame-public-ml-1493809299"></a>
### CG_GETUSERCMD

```ml
const CG_GETUSERCMD = 55
```

CG engine-syscall ordinal used to read a local user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L136)

<a id="constant-constant-mq3-client-cgame-public-cg-init-const-cg-init-0-src-mq3-client-cgame-public-ml-806061453"></a>
### CG_INIT

```ml
const CG_INIT = 0
```

CG VM entry-point ordinal used to initialize the CGame VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L232)

<a id="constant-constant-mq3-client-cgame-public-cg-key-event-const-cg-key-event-6-src-mq3-client-cgame-public-ml-340587467"></a>
### CG_KEY_EVENT

```ml
const CG_KEY_EVENT = 6
```

CG VM entry-point ordinal used to deliver a key event to CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L244)

<a id="constant-constant-mq3-client-cgame-public-cg-key-getcatcher-const-cg-key-getcatcher-61-src-mq3-client-cgame-public-ml-1936940510"></a>
### CG_KEY_GETCATCHER

```ml
const CG_KEY_GETCATCHER = 61
```

CG engine-syscall ordinal used to read the active input-capture bitmask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L149)

<a id="constant-constant-mq3-client-cgame-public-cg-key-getkey-const-cg-key-getkey-63-src-mq3-client-cgame-public-ml-1235477944"></a>
### CG_KEY_GETKEY

```ml
const CG_KEY_GETKEY = 63
```

CG engine-syscall ordinal used to find a key bound to a command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L153)

<a id="constant-constant-mq3-client-cgame-public-cg-key-isdown-const-cg-key-isdown-60-src-mq3-client-cgame-public-ml-1353572043"></a>
### CG_KEY_ISDOWN

```ml
const CG_KEY_ISDOWN = 60
```

CG engine-syscall ordinal used to query whether an engine key is currently pressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L147)

<a id="constant-constant-mq3-client-cgame-public-cg-key-setcatcher-const-cg-key-setcatcher-62-src-mq3-client-cgame-public-ml-1218211049"></a>
### CG_KEY_SETCATCHER

```ml
const CG_KEY_SETCATCHER = 62
```

CG engine-syscall ordinal used to replace the active input-capture bitmask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L151)

<a id="constant-constant-mq3-client-cgame-public-cg-last-attacker-const-cg-last-attacker-5-src-mq3-client-cgame-public-ml-1202648816"></a>
### CG_LAST_ATTACKER

```ml
const CG_LAST_ATTACKER = 5
```

CG VM entry-point ordinal used to query the latest attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L242)

<a id="constant-constant-mq3-client-cgame-public-cg-memcpy-const-cg-memcpy-101-src-mq3-client-cgame-public-ml-802022985"></a>
### CG_MEMCPY

```ml
const CG_MEMCPY = 101
```

CG engine-syscall ordinal used to copy a VM memory range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L209)

<a id="constant-constant-mq3-client-cgame-public-cg-memory-remaining-const-cg-memory-remaining-58-src-mq3-client-cgame-public-ml-586958382"></a>
### CG_MEMORY_REMAINING

```ml
const CG_MEMORY_REMAINING = 58
```

CG engine-syscall ordinal used to query remaining VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L143)

<a id="constant-constant-mq3-client-cgame-public-cg-memset-const-cg-memset-100-src-mq3-client-cgame-public-ml-581771592"></a>
### CG_MEMSET

```ml
const CG_MEMSET = 100
```

CG engine-syscall ordinal used to fill a VM memory range with a byte value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L207)

<a id="constant-constant-mq3-client-cgame-public-cg-milliseconds-const-cg-milliseconds-2-src-mq3-client-cgame-public-ml-836900991"></a>
### CG_MILLISECONDS

```ml
const CG_MILLISECONDS = 2
```

CG engine-syscall ordinal used to query the engine millisecond timer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L30)

<a id="constant-constant-mq3-client-cgame-public-cg-mouse-event-const-cg-mouse-event-7-src-mq3-client-cgame-public-ml-240401726"></a>
### CG_MOUSE_EVENT

```ml
const CG_MOUSE_EVENT = 7
```

CG VM entry-point ordinal used to deliver pointer motion to CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L246)

<a id="constant-constant-mq3-client-cgame-public-cg-pc-add-global-define-const-cg-pc-add-global-define-64-src-mq3-client-cgame-public-ml-643737851"></a>
### CG_PC_ADD_GLOBAL_DEFINE

```ml
const CG_PC_ADD_GLOBAL_DEFINE = 64
```

CG engine-syscall ordinal used to add a preprocessor definition to the script parser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L155)

<a id="constant-constant-mq3-client-cgame-public-cg-pc-free-source-const-cg-pc-free-source-66-src-mq3-client-cgame-public-ml-580598881"></a>
### CG_PC_FREE_SOURCE

```ml
const CG_PC_FREE_SOURCE = 66
```

CG engine-syscall ordinal used to release a script-parser source handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L159)

<a id="constant-constant-mq3-client-cgame-public-cg-pc-load-source-const-cg-pc-load-source-65-src-mq3-client-cgame-public-ml-321407382"></a>
### CG_PC_LOAD_SOURCE

```ml
const CG_PC_LOAD_SOURCE = 65
```

CG engine-syscall ordinal used to open a script-parser source handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L157)

<a id="constant-constant-mq3-client-cgame-public-cg-pc-read-token-const-cg-pc-read-token-67-src-mq3-client-cgame-public-ml-2123694036"></a>
### CG_PC_READ_TOKEN

```ml
const CG_PC_READ_TOKEN = 67
```

CG engine-syscall ordinal used to read the next preprocessed source token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L161)

<a id="constant-constant-mq3-client-cgame-public-cg-pc-source-file-and-line-const-cg-pc-source-file-and-line-68-src-mq3-client-cgame-public-ml-170414677"></a>
### CG_PC_SOURCE_FILE_AND_LINE

```ml
const CG_PC_SOURCE_FILE_AND_LINE = 68
```

CG engine-syscall ordinal used to query the source location for a parser handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L163)

<a id="constant-constant-mq3-client-cgame-public-cg-print-const-cg-print-0-src-mq3-client-cgame-public-ml-979984999"></a>
### CG_PRINT

```ml
const CG_PRINT = 0
```

CG engine-syscall ordinal used to print text through the engine console.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L26)

<a id="constant-constant-mq3-client-cgame-public-cg-r-addadditivelighttoscene-const-cg-r-addadditivelighttoscene-85-src-mq3-client-cgame-public-ml-1938484694"></a>
### CG_R_ADDADDITIVELIGHTTOSCENE

```ml
const CG_R_ADDADDITIVELIGHTTOSCENE = 85
```

CG engine-syscall ordinal used to append an additive dynamic light to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L197)

<a id="constant-constant-mq3-client-cgame-public-cg-r-addlighttoscene-const-cg-r-addlighttoscene-43-src-mq3-client-cgame-public-ml-1285098228"></a>
### CG_R_ADDLIGHTTOSCENE

```ml
const CG_R_ADDLIGHTTOSCENE = 43
```

CG engine-syscall ordinal used to append a dynamic light to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L112)

<a id="constant-constant-mq3-client-cgame-public-cg-r-addpolystoscene-const-cg-r-addpolystoscene-87-src-mq3-client-cgame-public-ml-1454923006"></a>
### CG_R_ADDPOLYSTOSCENE

```ml
const CG_R_ADDPOLYSTOSCENE = 87
```

CG engine-syscall ordinal used to append several polygons to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L201)

<a id="constant-constant-mq3-client-cgame-public-cg-r-addpolytoscene-const-cg-r-addpolytoscene-42-src-mq3-client-cgame-public-ml-342737247"></a>
### CG_R_ADDPOLYTOSCENE

```ml
const CG_R_ADDPOLYTOSCENE = 42
```

CG engine-syscall ordinal used to append a polygon to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L110)

<a id="constant-constant-mq3-client-cgame-public-cg-r-addrefentitytoscene-const-cg-r-addrefentitytoscene-41-src-mq3-client-cgame-public-ml-859282262"></a>
### CG_R_ADDREFENTITYTOSCENE

```ml
const CG_R_ADDREFENTITYTOSCENE = 41
```

CG engine-syscall ordinal used to append a renderer entity to the pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L108)

<a id="constant-constant-mq3-client-cgame-public-cg-r-clearscene-const-cg-r-clearscene-40-src-mq3-client-cgame-public-ml-925712881"></a>
### CG_R_CLEARSCENE

```ml
const CG_R_CLEARSCENE = 40
```

CG engine-syscall ordinal used to clear the renderer's pending scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L106)

<a id="constant-constant-mq3-client-cgame-public-cg-r-drawstretchpic-const-cg-r-drawstretchpic-46-src-mq3-client-cgame-public-ml-1345073671"></a>
### CG_R_DRAWSTRETCHPIC

```ml
const CG_R_DRAWSTRETCHPIC = 46
```

CG engine-syscall ordinal used to draw a shader-backed rectangle with texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L118)

<a id="constant-constant-mq3-client-cgame-public-cg-r-inpvs-const-cg-r-inpvs-88-src-mq3-client-cgame-public-ml-22242311"></a>
### CG_R_INPVS

```ml
const CG_R_INPVS = 88
```

CG engine-syscall ordinal used to test renderer potential visibility between positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L203)

<a id="constant-constant-mq3-client-cgame-public-cg-r-lerptag-const-cg-r-lerptag-48-src-mq3-client-cgame-public-ml-95663225"></a>
### CG_R_LERPTAG

```ml
const CG_R_LERPTAG = 48
```

CG engine-syscall ordinal used to interpolate an attachment tag between model animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L122)

<a id="constant-constant-mq3-client-cgame-public-cg-r-lightforpoint-const-cg-r-lightforpoint-73-src-mq3-client-cgame-public-ml-1703051867"></a>
### CG_R_LIGHTFORPOINT

```ml
const CG_R_LIGHTFORPOINT = 73
```

CG engine-syscall ordinal used to sample renderer lighting at a world position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L173)

<a id="constant-constant-mq3-client-cgame-public-cg-r-loadworldmap-const-cg-r-loadworldmap-36-src-mq3-client-cgame-public-ml-1149213210"></a>
### CG_R_LOADWORLDMAP

```ml
const CG_R_LOADWORLDMAP = 36
```

CG engine-syscall ordinal used to load the level's renderer world data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L98)

<a id="constant-constant-mq3-client-cgame-public-cg-r-modelbounds-const-cg-r-modelbounds-47-src-mq3-client-cgame-public-ml-819238688"></a>
### CG_R_MODELBOUNDS

```ml
const CG_R_MODELBOUNDS = 47
```

CG engine-syscall ordinal used to query a model's axis-aligned bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L120)

<a id="constant-constant-mq3-client-cgame-public-cg-r-registerfont-const-cg-r-registerfont-59-src-mq3-client-cgame-public-ml-1927152723"></a>
### CG_R_REGISTERFONT

```ml
const CG_R_REGISTERFONT = 59
```

CG engine-syscall ordinal used to register a font resource and its glyph metrics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L145)

<a id="constant-constant-mq3-client-cgame-public-cg-r-registermodel-const-cg-r-registermodel-37-src-mq3-client-cgame-public-ml-1843015309"></a>
### CG_R_REGISTERMODEL

```ml
const CG_R_REGISTERMODEL = 37
```

CG engine-syscall ordinal used to register a model resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L100)

<a id="constant-constant-mq3-client-cgame-public-cg-r-registershader-const-cg-r-registershader-39-src-mq3-client-cgame-public-ml-672635457"></a>
### CG_R_REGISTERSHADER

```ml
const CG_R_REGISTERSHADER = 39
```

CG engine-syscall ordinal used to register a shader resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L104)

<a id="constant-constant-mq3-client-cgame-public-cg-r-registershadernomip-const-cg-r-registershadernomip-57-src-mq3-client-cgame-public-ml-1376633397"></a>
### CG_R_REGISTERSHADERNOMIP

```ml
const CG_R_REGISTERSHADERNOMIP = 57
```

CG engine-syscall ordinal used to register a shader without mipmapped image sampling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L141)

<a id="constant-constant-mq3-client-cgame-public-cg-r-registerskin-const-cg-r-registerskin-38-src-mq3-client-cgame-public-ml-859244052"></a>
### CG_R_REGISTERSKIN

```ml
const CG_R_REGISTERSKIN = 38
```

CG engine-syscall ordinal used to register a skin resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L102)

<a id="constant-constant-mq3-client-cgame-public-cg-r-remap-shader-const-cg-r-remap-shader-79-src-mq3-client-cgame-public-ml-877971021"></a>
### CG_R_REMAP_SHADER

```ml
const CG_R_REMAP_SHADER = 79
```

CG engine-syscall ordinal used to remap a shader to a replacement shader and time offset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L185)

<a id="constant-constant-mq3-client-cgame-public-cg-r-renderscene-const-cg-r-renderscene-44-src-mq3-client-cgame-public-ml-1990158775"></a>
### CG_R_RENDERSCENE

```ml
const CG_R_RENDERSCENE = 44
```

CG engine-syscall ordinal used to render the accumulated scene through a view definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L114)

<a id="constant-constant-mq3-client-cgame-public-cg-r-setcolor-const-cg-r-setcolor-45-src-mq3-client-cgame-public-ml-1724583760"></a>
### CG_R_SETCOLOR

```ml
const CG_R_SETCOLOR = 45
```

CG engine-syscall ordinal used to set the color modulation used by subsequent 2D drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L116)

<a id="constant-constant-mq3-client-cgame-public-cg-real-time-const-cg-real-time-70-src-mq3-client-cgame-public-ml-598943692"></a>
### CG_REAL_TIME

```ml
const CG_REAL_TIME = 70
```

CG engine-syscall ordinal used to read the host calendar and clock.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L167)

<a id="constant-constant-mq3-client-cgame-public-cg-removecommand-const-cg-removecommand-72-src-mq3-client-cgame-public-ml-1669785564"></a>
### CG_REMOVECOMMAND

```ml
const CG_REMOVECOMMAND = 72
```

CG engine-syscall ordinal used to unregister a console-command name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L171)

<a id="constant-constant-mq3-client-cgame-public-cg-s-addloopingsound-const-cg-s-addloopingsound-31-src-mq3-client-cgame-public-ml-1677584109"></a>
### CG_S_ADDLOOPINGSOUND

```ml
const CG_S_ADDLOOPINGSOUND = 31
```

CG engine-syscall ordinal used to submit an entity's looping positional sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L88)

<a id="constant-constant-mq3-client-cgame-public-cg-s-addrealloopingsound-const-cg-s-addrealloopingsound-80-src-mq3-client-cgame-public-ml-1093370989"></a>
### CG_S_ADDREALLOOPINGSOUND

```ml
const CG_S_ADDREALLOOPINGSOUND = 80
```

CG engine-syscall ordinal used to submit a continuous looping positional sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L187)

<a id="constant-constant-mq3-client-cgame-public-cg-s-clearloopingsounds-const-cg-s-clearloopingsounds-30-src-mq3-client-cgame-public-ml-2069144032"></a>
### CG_S_CLEARLOOPINGSOUNDS

```ml
const CG_S_CLEARLOOPINGSOUNDS = 30
```

CG engine-syscall ordinal used to clear the frame's looping-sound submissions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L86)

<a id="constant-constant-mq3-client-cgame-public-cg-s-registersound-const-cg-s-registersound-34-src-mq3-client-cgame-public-ml-1561883192"></a>
### CG_S_REGISTERSOUND

```ml
const CG_S_REGISTERSOUND = 34
```

CG engine-syscall ordinal used to register a sound resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L94)

<a id="constant-constant-mq3-client-cgame-public-cg-s-respatialize-const-cg-s-respatialize-33-src-mq3-client-cgame-public-ml-1713329779"></a>
### CG_S_RESPATIALIZE

```ml
const CG_S_RESPATIALIZE = 33
```

CG engine-syscall ordinal used to update the listener origin and orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L92)

<a id="constant-constant-mq3-client-cgame-public-cg-s-startbackgroundtrack-const-cg-s-startbackgroundtrack-35-src-mq3-client-cgame-public-ml-351315081"></a>
### CG_S_STARTBACKGROUNDTRACK

```ml
const CG_S_STARTBACKGROUNDTRACK = 35
```

CG engine-syscall ordinal used to start the background music introduction and loop tracks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L96)

<a id="constant-constant-mq3-client-cgame-public-cg-s-startlocalsound-const-cg-s-startlocalsound-29-src-mq3-client-cgame-public-ml-22248686"></a>
### CG_S_STARTLOCALSOUND

```ml
const CG_S_STARTLOCALSOUND = 29
```

CG engine-syscall ordinal used to play a non-positional local sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L84)

<a id="constant-constant-mq3-client-cgame-public-cg-s-startsound-const-cg-s-startsound-28-src-mq3-client-cgame-public-ml-2040745247"></a>
### CG_S_STARTSOUND

```ml
const CG_S_STARTSOUND = 28
```

CG engine-syscall ordinal used to play a positional sound event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L82)

<a id="constant-constant-mq3-client-cgame-public-cg-s-stopbackgroundtrack-const-cg-s-stopbackgroundtrack-69-src-mq3-client-cgame-public-ml-1887146492"></a>
### CG_S_STOPBACKGROUNDTRACK

```ml
const CG_S_STOPBACKGROUNDTRACK = 69
```

CG engine-syscall ordinal used to stop background music playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L165)

<a id="constant-constant-mq3-client-cgame-public-cg-s-stoploopingsound-const-cg-s-stoploopingsound-81-src-mq3-client-cgame-public-ml-1845145140"></a>
### CG_S_STOPLOOPINGSOUND

```ml
const CG_S_STOPLOOPINGSOUND = 81
```

CG engine-syscall ordinal used to stop the looping sound associated with an entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L189)

<a id="constant-constant-mq3-client-cgame-public-cg-s-updateentityposition-const-cg-s-updateentityposition-32-src-mq3-client-cgame-public-ml-752092534"></a>
### CG_S_UPDATEENTITYPOSITION

```ml
const CG_S_UPDATEENTITYPOSITION = 32
```

CG engine-syscall ordinal used to update an entity position used for sound spatialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L90)

<a id="constant-constant-mq3-client-cgame-public-cg-sendclientcommand-const-cg-sendclientcommand-16-src-mq3-client-cgame-public-ml-1505214936"></a>
### CG_SENDCLIENTCOMMAND

```ml
const CG_SENDCLIENTCOMMAND = 16
```

CG engine-syscall ordinal used to send a reliable client command to the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L58)

<a id="constant-constant-mq3-client-cgame-public-cg-sendconsolecommand-const-cg-sendconsolecommand-14-src-mq3-client-cgame-public-ml-242703450"></a>
### CG_SENDCONSOLECOMMAND

```ml
const CG_SENDCONSOLECOMMAND = 14
```

CG engine-syscall ordinal used to queue an engine console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L54)

<a id="constant-constant-mq3-client-cgame-public-cg-setusercmdvalue-const-cg-setusercmdvalue-56-src-mq3-client-cgame-public-ml-329898436"></a>
### CG_SETUSERCMDVALUE

```ml
const CG_SETUSERCMDVALUE = 56
```

CG engine-syscall ordinal used to set the CGame value and sensitivity multiplier attached to user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L139)

<a id="constant-constant-mq3-client-cgame-public-cg-shutdown-const-cg-shutdown-1-src-mq3-client-cgame-public-ml-1242956944"></a>
### CG_SHUTDOWN

```ml
const CG_SHUTDOWN = 1
```

CG VM entry-point ordinal used to shut down the CGame VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L234)

<a id="constant-constant-mq3-client-cgame-public-cg-sin-const-cg-sin-103-src-mq3-client-cgame-public-ml-2094325687"></a>
### CG_SIN

```ml
const CG_SIN = 103
```

CG engine-syscall ordinal used to evaluate sine for a VM numeric operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L213)

<a id="constant-constant-mq3-client-cgame-public-cg-snapvector-const-cg-snapvector-71-src-mq3-client-cgame-public-ml-1047185561"></a>
### CG_SNAPVECTOR

```ml
const CG_SNAPVECTOR = 71
```

CG engine-syscall ordinal used to round a vector using the native protocol convention.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L169)

<a id="constant-constant-mq3-client-cgame-public-cg-sqrt-const-cg-sqrt-106-src-mq3-client-cgame-public-ml-408779198"></a>
### CG_SQRT

```ml
const CG_SQRT = 106
```

CG engine-syscall ordinal used to evaluate a square root for a VM numeric operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L219)

<a id="constant-constant-mq3-client-cgame-public-cg-strncpy-const-cg-strncpy-102-src-mq3-client-cgame-public-ml-1601769388"></a>
### CG_STRNCPY

```ml
const CG_STRNCPY = 102
```

CG engine-syscall ordinal used to copy a bounded string inside VM memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L211)

<a id="constant-constant-mq3-client-cgame-public-cg-testprintfloat-const-cg-testprintfloat-110-src-mq3-client-cgame-public-ml-1809122791"></a>
### CG_TESTPRINTFLOAT

```ml
const CG_TESTPRINTFLOAT = 110
```

CG engine-syscall ordinal used to print a floating-point value through the VM diagnostic interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L227)

<a id="constant-constant-mq3-client-cgame-public-cg-testprintint-const-cg-testprintint-109-src-mq3-client-cgame-public-ml-1414327609"></a>
### CG_TESTPRINTINT

```ml
const CG_TESTPRINTINT = 109
```

CG engine-syscall ordinal used to print an integer through the VM diagnostic interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L225)

<a id="constant-constant-mq3-client-cgame-public-cg-updatescreen-const-cg-updatescreen-17-src-mq3-client-cgame-public-ml-1646664281"></a>
### CG_UPDATESCREEN

```ml
const CG_UPDATESCREEN = 17
```

CG engine-syscall ordinal used to request an immediate screen update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L60)

<a id="constant-constant-mq3-client-cgame-public-cgame-event-edithud-const-cgame-event-edithud-3-src-mq3-client-cgame-public-ml-1088692870"></a>
### CGAME_EVENT_EDITHUD

```ml
const CGAME_EVENT_EDITHUD = 3
```

CGame event-handling mode selecting the edithud interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L23)

<a id="constant-constant-mq3-client-cgame-public-cgame-event-none-const-cgame-event-none-0-src-mq3-client-cgame-public-ml-1866954469"></a>
### CGAME_EVENT_NONE

```ml
const CGAME_EVENT_NONE = 0
```

CGame event-handling mode selecting the none interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L17)

<a id="constant-constant-mq3-client-cgame-public-cgame-event-scoreboard-const-cgame-event-scoreboard-2-src-mq3-client-cgame-public-ml-465599703"></a>
### CGAME_EVENT_SCOREBOARD

```ml
const CGAME_EVENT_SCOREBOARD = 2
```

CGame event-handling mode selecting the scoreboard interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L21)

<a id="constant-constant-mq3-client-cgame-public-cgame-event-teammenu-const-cgame-event-teammenu-1-src-mq3-client-cgame-public-ml-1648609000"></a>
### CGAME_EVENT_TEAMMENU

```ml
const CGAME_EVENT_TEAMMENU = 1
```

CGame event-handling mode selecting the teammenu interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L19)

<a id="constant-constant-mq3-client-cgame-public-cgame-import-api-version-const-cgame-import-api-version-4-src-mq3-client-cgame-public-ml-1391616625"></a>
### CGAME_IMPORT_API_VERSION

```ml
const CGAME_IMPORT_API_VERSION = 4
```

Version of the engine-import interface expected by the CGame adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L14)

<a id="constant-constant-mq3-client-cgame-public-cmd-backup-const-cmd-backup-64-src-mq3-client-cgame-public-ml-658717851"></a>
### CMD_BACKUP

```ml
const CMD_BACKUP = 64
```

Number of recent user commands retained in the command-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L7)

<a id="constant-constant-mq3-client-cgame-public-cmd-mask-const-cmd-mask-63-src-mq3-client-cgame-public-ml-1639598704"></a>
### CMD_MASK

```ml
const CMD_MASK = 63
```

Mask that maps a user-command sequence number into the command-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L9)

<a id="constant-constant-mq3-client-cgame-public-max-entities-in-snapshot-const-max-entities-in-snapshot-256-src-mq3-client-cgame-public-ml-1077999786"></a>
### MAX_ENTITIES_IN_SNAPSHOT

```ml
const MAX_ENTITIES_IN_SNAPSHOT = 256
```

Capacity limit for the entities in snapshot collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L12)

- [mq3.client.cgame_public.Snapshot](Type-mq3-client-cgame-public-snapshot-1252766950.md) — struct
<a id="function-function-mq3-client-cgame-public-typenames-function-typenames-src-mq3-client-cgame-public-ml-276437044"></a>
### typeNames

```ml
function typeNames()
```

Lists the type names catalog for client game public in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L275)

<a id="function-function-mq3-client-cgame-public-validcommandnumber-function-validcommandnumber-current-requested-src-mq3-client-cgame-public-ml-527157575"></a>
### validCommandNumber

```ml
function validCommandNumber(current, requested)
```

Computes `requested>current-CMD_BACKUP and requested<=current` for client game public `validCommandNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | `dynamic` | — | Value used by `return requested>current-CMD_BACKUP and requested<=current`. |
| `requested` | `dynamic` | — | Value used by `return requested>current-CMD_BACKUP and requested<=current`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L282)

<a id="function-function-mq3-client-cgame-public-valideventhandling-function-valideventhandling-value-src-mq3-client-cgame-public-ml-1465816601"></a>
### validEventHandling

```ml
function validEventHandling(value)
```

Computes `value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD` for client game public `validEventHandling`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L285)

<a id="function-function-mq3-client-cgame-public-validsnapshotentitycount-function-validsnapshotentitycount-count-src-mq3-client-cgame-public-ml-1519252191"></a>
### validSnapshotEntityCount

```ml
function validSnapshotEntityCount(count)
```

Computes `count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT` for client game public `validSnapshotEntityCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Value used by `return count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L278)
