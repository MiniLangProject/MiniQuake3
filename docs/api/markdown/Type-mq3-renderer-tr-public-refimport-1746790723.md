# `mq3.renderer.tr_public.RefImport`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-public-ml-911183383.md)

<a id="struct-struct-mq3-renderer-tr-public-refimport-struct-refimport-src-mq3-renderer-tr-public-ml-1076302969"></a>
## RefImport

```ml
struct RefImport
```

Callback table for `mq3.renderer.tr_public.RefImport`; exposes `Printf`, `Error`, `Milliseconds`, `Hunk_AllocDebug`, `Hunk_Alloc`, `Hunk_AllocateTempMemory`, and 21 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L73)

## Members

<a id="field-field-mq3-renderer-tr-public-refimport-cin-playcinematic-cin-playcinematic-src-mq3-renderer-tr-public-ml-168635555"></a>
### CIN_PlayCinematic

```ml
CIN_PlayCinematic
```

Engine service callback used to open a cinematic and start playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L126)

<a id="field-field-mq3-renderer-tr-public-refimport-cin-runcinematic-cin-runcinematic-src-mq3-renderer-tr-public-ml-1712691677"></a>
### CIN_RunCinematic

```ml
CIN_RunCinematic
```

Engine service callback used to advance a cinematic to the current engine time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L128)

<a id="field-field-mq3-renderer-tr-public-refimport-cin-uploadcinematic-cin-uploadcinematic-src-mq3-renderer-tr-public-ml-222876847"></a>
### CIN_UploadCinematic

```ml
CIN_UploadCinematic
```

Engine service callback used to upload the latest decoded cinematic frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L124)

<a id="field-field-mq3-renderer-tr-public-refimport-cm-drawdebugsurface-cm-drawdebugsurface-src-mq3-renderer-tr-public-ml-499085315"></a>
### CM_DrawDebugSurface

```ml
CM_DrawDebugSurface
```

Engine service callback used to enumerate collision surfaces for renderer debug drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L107)

<a id="field-field-mq3-renderer-tr-public-refimport-cmd-addcommand-cmd-addcommand-src-mq3-renderer-tr-public-ml-1143129741"></a>
### Cmd_AddCommand

```ml
Cmd_AddCommand
```

Engine service callback used to register a renderer console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L97)

<a id="field-field-mq3-renderer-tr-public-refimport-cmd-argc-cmd-argc-src-mq3-renderer-tr-public-ml-483011603"></a>
### Cmd_Argc

```ml
Cmd_Argc
```

Engine service callback used to read the argument count of the current console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L101)

<a id="field-field-mq3-renderer-tr-public-refimport-cmd-argv-cmd-argv-src-mq3-renderer-tr-public-ml-1966399757"></a>
### Cmd_Argv

```ml
Cmd_Argv
```

Engine service callback used to read one argument of the current console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L103)

<a id="field-field-mq3-renderer-tr-public-refimport-cmd-executetext-cmd-executetext-src-mq3-renderer-tr-public-ml-1398111791"></a>
### Cmd_ExecuteText

```ml
Cmd_ExecuteText
```

Engine service callback used to schedule command text for engine execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L105)

<a id="field-field-mq3-renderer-tr-public-refimport-cmd-removecommand-cmd-removecommand-src-mq3-renderer-tr-public-ml-1550801235"></a>
### Cmd_RemoveCommand

```ml
Cmd_RemoveCommand
```

Engine service callback used to remove a registered renderer console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L99)

<a id="field-field-mq3-renderer-tr-public-refimport-cvar-get-cvar-get-src-mq3-renderer-tr-public-ml-921305393"></a>
### Cvar_Get

```ml
Cvar_Get
```

Engine service callback used to find or register a console variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L93)

<a id="field-field-mq3-renderer-tr-public-refimport-cvar-set-cvar-set-src-mq3-renderer-tr-public-ml-932583081"></a>
### Cvar_Set

```ml
Cvar_Set
```

Engine service callback used to update the string value of a console variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L95)

<a id="field-field-mq3-renderer-tr-public-refimport-error-error-src-mq3-renderer-tr-public-ml-1124016811"></a>
### Error

```ml
Error
```

Engine service callback used to report a renderer error through the engine error handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L77)

<a id="field-field-mq3-renderer-tr-public-refimport-free-free-src-mq3-renderer-tr-public-ml-1042901791"></a>
### Free

```ml
Free
```

Engine service callback used to release engine-managed heap storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L91)

<a id="field-field-mq3-renderer-tr-public-refimport-fs-fileexists-fs-fileexists-src-mq3-renderer-tr-public-ml-112517907"></a>
### FS_FileExists

```ml
FS_FileExists
```

Engine service callback used to test whether a virtual file exists.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L122)

<a id="field-field-mq3-renderer-tr-public-refimport-fs-fileisinpak-fs-fileisinpak-src-mq3-renderer-tr-public-ml-1979977133"></a>
### FS_FileIsInPAK

```ml
FS_FileIsInPAK
```

Engine service callback used to test whether a virtual file is provided by a package archive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L109)

<a id="field-field-mq3-renderer-tr-public-refimport-fs-freefile-fs-freefile-src-mq3-renderer-tr-public-ml-1670306507"></a>
### FS_FreeFile

```ml
FS_FreeFile
```

Engine service callback used to release storage returned by a virtual file read.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L113)

<a id="field-field-mq3-renderer-tr-public-refimport-fs-freefilelist-fs-freefilelist-src-mq3-renderer-tr-public-ml-1355028479"></a>
### FS_FreeFileList

```ml
FS_FreeFileList
```

Engine service callback used to release a file-name list returned by the virtual filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L118)

<a id="field-field-mq3-renderer-tr-public-refimport-fs-listfiles-fs-listfiles-src-mq3-renderer-tr-public-ml-586907325"></a>
### FS_ListFiles

```ml
FS_ListFiles
```

Engine service callback used to enumerate virtual files matching the requested directory and extension.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L116)

<a id="field-field-mq3-renderer-tr-public-refimport-fs-readfile-fs-readfile-src-mq3-renderer-tr-public-ml-935919219"></a>
### FS_ReadFile

```ml
FS_ReadFile
```

Engine service callback used to read a complete virtual file into engine-managed storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L111)

<a id="field-field-mq3-renderer-tr-public-refimport-fs-writefile-fs-writefile-src-mq3-renderer-tr-public-ml-236543885"></a>
### FS_WriteFile

```ml
FS_WriteFile
```

Engine service callback used to write bytes to a file through the engine filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L120)

<a id="field-field-mq3-renderer-tr-public-refimport-hunk-alloc-hunk-alloc-src-mq3-renderer-tr-public-ml-1367139387"></a>
### Hunk_Alloc

```ml
Hunk_Alloc
```

Engine service callback used to allocate persistent hunk memory owned by the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L83)

<a id="field-field-mq3-renderer-tr-public-refimport-hunk-allocatetempmemory-hunk-allocatetempmemory-src-mq3-renderer-tr-public-ml-1692414371"></a>
### Hunk_AllocateTempMemory

```ml
Hunk_AllocateTempMemory
```

Engine service callback used to allocate temporary engine hunk memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L85)

<a id="field-field-mq3-renderer-tr-public-refimport-hunk-allocdebug-hunk-allocdebug-src-mq3-renderer-tr-public-ml-1352824143"></a>
### Hunk_AllocDebug

```ml
Hunk_AllocDebug
```

Engine service callback used to allocate persistent hunk memory with source-location tracking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L81)

<a id="field-field-mq3-renderer-tr-public-refimport-hunk-freetempmemory-hunk-freetempmemory-src-mq3-renderer-tr-public-ml-1655685155"></a>
### Hunk_FreeTempMemory

```ml
Hunk_FreeTempMemory
```

Engine service callback used to release a temporary engine hunk allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L87)

<a id="field-field-mq3-renderer-tr-public-refimport-malloc-malloc-src-mq3-renderer-tr-public-ml-2082535011"></a>
### Malloc

```ml
Malloc
```

Engine service callback used to allocate engine-managed heap storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L89)

<a id="field-field-mq3-renderer-tr-public-refimport-milliseconds-milliseconds-src-mq3-renderer-tr-public-ml-620728979"></a>
### Milliseconds

```ml
Milliseconds
```

Engine service callback used to read the engine clock in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L79)

<a id="field-field-mq3-renderer-tr-public-refimport-printf-printf-src-mq3-renderer-tr-public-ml-1415359181"></a>
### Printf

```ml
Printf
```

Engine service callback used to send a renderer diagnostic message to the engine console.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L75)
