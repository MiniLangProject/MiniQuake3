# `src/mq3/client/cgame_console_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_console_commands`](Package-mq3-client-cgame-console-commands-494443117.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/command_buffer.ml` as `commands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-console-commands-absorb-function-absorb-runtime-effect-src-mq3-client-cgame-console-commands-ml-105590925"></a>
### absorb

```ml
function absorb(runtime, effect)
```

Calls `mq3.client.cgame_console_commands.emit`, `mq3.qcommon.cvar.set2`, `mq3.qcommon.command_buffer.argv` from client game console commands `absorb`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.registry`, `runtime.commandState`. |
| `effect` | `dynamic` | — | Record read through `effect.cvarSets`, `effect.consoleCommands`, `effect.clientCommands`, `effect.prints` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L456)

- [mq3.client.cgame_console_commands.Action](Type-mq3-client-cgame-console-commands-action-776542747.md) — struct
<a id="extern_function-extern-function-mq3-client-cgame-console-commands-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-console-commands-ml-653712726"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game console commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The converted integer; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L14)

<a id="function-function-mq3-client-cgame-console-commands-basecommands-function-basecommands-src-mq3-client-cgame-console-commands-ml-116374666"></a>
### baseCommands

```ml
function baseCommands()
```

Lists the 23 client game console commands base commands strings in their declared order, beginning with `"testgun"`, `"testmodel"`, `"nextframe"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L605)

<a id="function-function-mq3-client-cgame-console-commands-cg-camera-f-function-cg-camera-f-runtime-src-mq3-client-cgame-console-commands-ml-246164378"></a>
### CG_Camera_f

```ml
function CG_Camera_f(runtime)
```

CG_Camera_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `runtime.cameraMode`, `runtime.cameraStartTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L599)

<a id="function-function-mq3-client-cgame-console-commands-cg-confirmorder-f-function-cg-confirmorder-f-runtime-src-mq3-client-cgame-console-commands-ml-1533118516"></a>
### CG_ConfirmOrder_f

```ml
function CG_ConfirmOrder_f(runtime)
```

CG_ConfirmOrder_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`, `runtime.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L534)

<a id="function-function-mq3-client-cgame-console-commands-cg-consolecommand-function-cg-consolecommand-runtime-src-mq3-client-cgame-console-commands-ml-1807114690"></a>
### CG_ConsoleCommand

```ml
function CG_ConsoleCommand(runtime)
```

CG_ConsoleCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.missionpack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L630)

<a id="function-function-mq3-client-cgame-console-commands-cg-denyorder-f-function-cg-denyorder-f-runtime-src-mq3-client-cgame-console-commands-ml-2140685968"></a>
### CG_DenyOrder_f

```ml
function CG_DenyOrder_f(runtime)
```

CG_DenyOrder_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`, `runtime.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L537)

<a id="function-function-mq3-client-cgame-console-commands-cg-edithud-f-function-cg-edithud-f-runtime-src-mq3-client-cgame-console-commands-ml-1760717468"></a>
### CG_EditHud_f

```ml
function CG_EditHud_f(runtime)
```

CG_EditHud_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `runtime.eventHandling`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L594)

<a id="function-function-mq3-client-cgame-console-commands-cg-initconsolecommands-function-cg-initconsolecommands-runtime-src-mq3-client-cgame-console-commands-ml-111773592"></a>
### CG_InitConsoleCommands

```ml
function CG_InitConsoleCommands(runtime)
```

CG_InitConsoleCommands

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `runtime.registeredCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L619)

<a id="function-function-mq3-client-cgame-console-commands-cg-loadhud-f-function-cg-loadhud-f-runtime-src-mq3-client-cgame-console-commands-ml-1842842652"></a>
### CG_LoadHud_f

```ml
function CG_LoadHud_f(runtime)
```

CG_LoadHud_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.registry`, `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L510)

<a id="function-function-mq3-client-cgame-console-commands-cg-nextorder-f-function-cg-nextorder-f-runtime-src-mq3-client-cgame-console-commands-ml-259318420"></a>
### CG_NextOrder_f

```ml
function CG_NextOrder_f(runtime)
```

CG_NextOrder_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`, `runtime.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L531)

<a id="function-function-mq3-client-cgame-console-commands-cg-nextteammember-f-function-cg-nextteammember-f-runtime-src-mq3-client-cgame-console-commands-ml-425794184"></a>
### CG_NextTeamMember_f

```ml
function CG_NextTeamMember_f(runtime)
```

CG_NextTeamMember_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L525)

<a id="function-function-mq3-client-cgame-console-commands-cg-prevteammember-f-function-cg-prevteammember-f-runtime-src-mq3-client-cgame-console-commands-ml-340274056"></a>
### CG_PrevTeamMember_f

```ml
function CG_PrevTeamMember_f(runtime)
```

CG_PrevTeamMember_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L528)

<a id="function-function-mq3-client-cgame-console-commands-cg-scoresdown-f-function-cg-scoresdown-f-runtime-src-mq3-client-cgame-console-commands-ml-135391278"></a>
### CG_ScoresDown_f

```ml
function CG_ScoresDown_f(runtime)
```

CG_ScoresDown_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`, `runtime.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L491)

<a id="function-function-mq3-client-cgame-console-commands-cg-scoresup-f-function-cg-scoresup-f-runtime-src-mq3-client-cgame-console-commands-ml-1968027592"></a>
### CG_ScoresUp_f

```ml
function CG_ScoresUp_f(runtime)
```

CG_ScoresUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`, `runtime.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L494)

<a id="function-function-mq3-client-cgame-console-commands-cg-scrollscoresdown-f-function-cg-scrollscoresdown-f-runtime-src-mq3-client-cgame-console-commands-ml-890902888"></a>
### CG_scrollScoresDown_f

```ml
function CG_scrollScoresDown_f(runtime)
```

CG_scrollScoresDown_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L513)

<a id="function-function-mq3-client-cgame-console-commands-cg-scrollscoresup-f-function-cg-scrollscoresup-f-runtime-src-mq3-client-cgame-console-commands-ml-1254128838"></a>
### CG_scrollScoresUp_f

```ml
function CG_scrollScoresUp_f(runtime)
```

CG_scrollScoresUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L516)

<a id="function-function-mq3-client-cgame-console-commands-cg-sizedown-f-function-cg-sizedown-f-runtime-src-mq3-client-cgame-console-commands-ml-491454014"></a>
### CG_SizeDown_f

```ml
function CG_SizeDown_f(runtime)
```

CG_SizeDown_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L485)

<a id="function-function-mq3-client-cgame-console-commands-cg-sizeup-f-function-cg-sizeup-f-runtime-src-mq3-client-cgame-console-commands-ml-1826881748"></a>
### CG_SizeUp_f

```ml
function CG_SizeUp_f(runtime)
```

CG_SizeUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L482)

<a id="function-function-mq3-client-cgame-console-commands-cg-splose-f-function-cg-splose-f-runtime-src-mq3-client-cgame-console-commands-ml-855037256"></a>
### CG_spLose_f

```ml
function CG_spLose_f(runtime)
```

CG_spLose_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L522)

<a id="function-function-mq3-client-cgame-console-commands-cg-spwin-f-function-cg-spwin-f-runtime-src-mq3-client-cgame-console-commands-ml-411380688"></a>
### CG_spWin_f

```ml
function CG_spWin_f(runtime)
```

CG_spWin_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L519)

<a id="function-function-mq3-client-cgame-console-commands-cg-startorbit-f-function-cg-startorbit-f-runtime-src-mq3-client-cgame-console-commands-ml-2013914216"></a>
### CG_StartOrbit_f

```ml
function CG_StartOrbit_f(runtime)
```

CG_StartOrbit_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.registry`, `runtime.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L582)

<a id="function-function-mq3-client-cgame-console-commands-cg-targetcommand-f-function-cg-targetcommand-f-runtime-src-mq3-client-cgame-console-commands-ml-193193576"></a>
### CG_TargetCommand_f

```ml
function CG_TargetCommand_f(runtime)
```

CG_TargetCommand_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.commandState`, `runtime.targetNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L479)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskcamp-f-function-cg-taskcamp-f-runtime-src-mq3-client-cgame-console-commands-ml-102919232"></a>
### CG_TaskCamp_f

```ml
function CG_TaskCamp_f(runtime)
```

CG_TaskCamp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L549)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskdefense-f-function-cg-taskdefense-f-runtime-src-mq3-client-cgame-console-commands-ml-1574471312"></a>
### CG_TaskDefense_f

```ml
function CG_TaskDefense_f(runtime)
```

CG_TaskDefense_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L543)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskescort-f-function-cg-taskescort-f-runtime-src-mq3-client-cgame-console-commands-ml-491935566"></a>
### CG_TaskEscort_f

```ml
function CG_TaskEscort_f(runtime)
```

CG_TaskEscort_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L558)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskfollow-f-function-cg-taskfollow-f-runtime-src-mq3-client-cgame-console-commands-ml-1667072300"></a>
### CG_TaskFollow_f

```ml
function CG_TaskFollow_f(runtime)
```

CG_TaskFollow_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L552)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskoffense-f-function-cg-taskoffense-f-runtime-src-mq3-client-cgame-console-commands-ml-658043140"></a>
### CG_TaskOffense_f

```ml
function CG_TaskOffense_f(runtime)
```

CG_TaskOffense_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.state.gametype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L540)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskownflag-f-function-cg-taskownflag-f-runtime-src-mq3-client-cgame-console-commands-ml-360277852"></a>
### CG_TaskOwnFlag_f

```ml
function CG_TaskOwnFlag_f(runtime)
```

CG_TaskOwnFlag_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L561)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskpatrol-f-function-cg-taskpatrol-f-runtime-src-mq3-client-cgame-console-commands-ml-1862377602"></a>
### CG_TaskPatrol_f

```ml
function CG_TaskPatrol_f(runtime)
```

CG_TaskPatrol_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L546)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskretrieve-f-function-cg-taskretrieve-f-runtime-src-mq3-client-cgame-console-commands-ml-1530859518"></a>
### CG_TaskRetrieve_f

```ml
function CG_TaskRetrieve_f(runtime)
```

CG_TaskRetrieve_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L555)

<a id="function-function-mq3-client-cgame-console-commands-cg-tasksuicide-f-function-cg-tasksuicide-f-runtime-src-mq3-client-cgame-console-commands-ml-394841584"></a>
### CG_TaskSuicide_f

```ml
function CG_TaskSuicide_f(runtime)
```

CG_TaskSuicide_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.targetNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L564)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntdeathinsult-f-function-cg-tauntdeathinsult-f-runtime-src-mq3-client-cgame-console-commands-ml-734503910"></a>
### CG_TauntDeathInsult_f

```ml
function CG_TauntDeathInsult_f(runtime)
```

CG_TauntDeathInsult_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L576)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntgauntlet-f-function-cg-tauntgauntlet-f-runtime-src-mq3-client-cgame-console-commands-ml-45852232"></a>
### CG_TauntGauntlet_f

```ml
function CG_TauntGauntlet_f(runtime)
```

CG_TauntGauntlet_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L579)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntkillinsult-f-function-cg-tauntkillinsult-f-runtime-src-mq3-client-cgame-console-commands-ml-1037838636"></a>
### CG_TauntKillInsult_f

```ml
function CG_TauntKillInsult_f(runtime)
```

CG_TauntKillInsult_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L567)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntpraise-f-function-cg-tauntpraise-f-runtime-src-mq3-client-cgame-console-commands-ml-1155292124"></a>
### CG_TauntPraise_f

```ml
function CG_TauntPraise_f(runtime)
```

CG_TauntPraise_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L570)

<a id="function-function-mq3-client-cgame-console-commands-cg-taunttaunt-f-function-cg-taunttaunt-f-runtime-src-mq3-client-cgame-console-commands-ml-1978862092"></a>
### CG_TauntTaunt_f

```ml
function CG_TauntTaunt_f(runtime)
```

CG_TauntTaunt_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.absorb`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L573)

<a id="function-function-mq3-client-cgame-console-commands-cg-teammenu-f-function-cg-teammenu-f-runtime-src-mq3-client-cgame-console-commands-ml-290392168"></a>
### CG_TeamMenu_f

```ml
function CG_TeamMenu_f(runtime)
```

The next three bodies are disabled in the shipped source, but preserving their documented state transitions covers their Ledger symbols without registering dormant console commands. CG_TeamMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `runtime.eventHandling`, `runtime.keyCatcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L589)

<a id="function-function-mq3-client-cgame-console-commands-cg-tellattacker-f-function-cg-tellattacker-f-runtime-src-mq3-client-cgame-console-commands-ml-1283994288"></a>
### CG_TellAttacker_f

```ml
function CG_TellAttacker_f(runtime)
```

CG_TellAttacker_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.commandState`, `runtime.attackerNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L500)

<a id="function-function-mq3-client-cgame-console-commands-cg-telltarget-f-function-cg-telltarget-f-runtime-src-mq3-client-cgame-console-commands-ml-1984956888"></a>
### CG_TellTarget_f

```ml
function CG_TellTarget_f(runtime)
```

CG_TellTarget_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.commandState`, `runtime.targetNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L497)

<a id="function-function-mq3-client-cgame-console-commands-cg-viewpos-f-function-cg-viewpos-f-runtime-src-mq3-client-cgame-console-commands-ml-2057431972"></a>
### CG_Viewpos_f

```ml
function CG_Viewpos_f(runtime)
```

CG_Viewpos_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.viewOrigin`, `runtime.viewYaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L488)

<a id="function-function-mq3-client-cgame-console-commands-cg-voicetellattacker-f-function-cg-voicetellattacker-f-runtime-src-mq3-client-cgame-console-commands-ml-1701736776"></a>
### CG_VoiceTellAttacker_f

```ml
function CG_VoiceTellAttacker_f(runtime)
```

CG_VoiceTellAttacker_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.commandState`, `runtime.attackerNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L506)

<a id="function-function-mq3-client-cgame-console-commands-cg-voicetelltarget-f-function-cg-voicetelltarget-f-runtime-src-mq3-client-cgame-console-commands-ml-139001692"></a>
### CG_VoiceTellTarget_f

```ml
function CG_VoiceTellTarget_f(runtime)
```

CG_VoiceTellTarget_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.commandState`, `runtime.targetNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L503)

<a id="function-function-mq3-client-cgame-console-commands-client-function-client-effect-text-src-mq3-client-cgame-console-commands-ml-1669452224"></a>
### client

```ml
function client(effect, text)
```

Updates `effect.clientCommands` during client game console commands `client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `effect.clientCommands`. |
| `text` | `dynamic` | — | Text consumed or emitted by `client` in the client game console commands path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L134)

<a id="function-function-mq3-client-cgame-console-commands-cmd-argv-function-cmd-argv-runtime-index-src-mq3-client-cgame-console-commands-ml-837574398"></a>
### Cmd_Argv

```ml
function Cmd_Argv(runtime, index)
```

Cmd_Argv is mentioned by the original command contract and maps directly to the qcommon token state shared by every native command body.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.commandState`. |
| `index` | `dynamic` | — | Argument 2 of `mq3.qcommon.command_buffer.argv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L475)

<a id="function-function-mq3-client-cgame-console-commands-confirmorder-function-confirmorder-state-time-src-mq3-client-cgame-console-commands-ml-808025716"></a>
### confirmOrder

```ml
function confirmOrder(state, time)
```

Updates `state.acceptOrderTime` during client game console commands `confirmOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.acceptOrderTime`. |
| `time` | `dynamic` | — | Value used by `if time<state.acceptOrderTime then effect.clientCommands=effect.clientCommands+["teamtask "+str(state.acceptTask)+"\\n"]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L284)

<a id="function-function-mq3-client-cgame-console-commands-console-function-console-effect-text-src-mq3-client-cgame-console-commands-ml-1352436262"></a>
### console

```ml
function console(effect, text)
```

Updates `effect.consoleCommands` during client game console commands `console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `effect.consoleCommands`. |
| `text` | `dynamic` | — | Text consumed or emitted by `console` in the client game console commands path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L130)

<a id="function-function-mq3-client-cgame-console-commands-create-function-create-src-mq3-client-cgame-console-commands-ml-552388390"></a>
### create

```ml
function create()
```

Creates a `mq3.client.cgame_console_commands.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L116)

<a id="function-function-mq3-client-cgame-console-commands-createruntime-function-createruntime-registry-missionpack-retailactive-src-mq3-client-cgame-console-commands-ml-2090403739"></a>
### createRuntime

```ml
function createRuntime(registry, missionpack, retailActive)
```

Creates a `mq3.client.cgame_console_commands.Runtime` record. Assigns `registry` from `registry`, `missionpack` from `missionpack`, `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used to initialize `Runtime.registry`. |
| `missionpack` | `dynamic` | — | Value used to initialize `Runtime.missionpack`. |
| `retailActive` | `dynamic` | — | Value used to initialize `Runtime.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L439)

<a id="function-function-mq3-client-cgame-console-commands-cvarset-function-cvarset-effect-name-value-src-mq3-client-cgame-console-commands-ml-183353999"></a>
### cvarSet

```ml
function cvarSet(effect, name, value)
```

Updates `effect.cvarSets` during client game console commands `cvarSet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `effect.cvarSets`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game console commands resource. |
| `value` | `dynamic` | — | Value used by `effect.cvarSets=effect.cvarSets+[[name,value]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L126)

<a id="function-function-mq3-client-cgame-console-commands-delegated-function-delegated-runtime-name-src-mq3-client-cgame-console-commands-ml-660279877"></a>
### delegated

```ml
function delegated(runtime, name)
```

Calls `mq3.client.cgame_console_commands.emit`, `mq3.qcommon.command_buffer.args`, `mq3.client.cgame_console_commands.result` from client game console commands `delegated`. The final path returns `result(true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.commandState`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game console commands resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L627)

<a id="function-function-mq3-client-cgame-console-commands-denyorder-function-denyorder-state-time-src-mq3-client-cgame-console-commands-ml-1755213320"></a>
### denyOrder

```ml
function denyOrder(state, time)
```

Updates `state.acceptOrderTime` during client game console commands `denyOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.acceptOrderTime`. |
| `time` | `dynamic` | — | Value used by `if time<state.acceptOrderTime then state.acceptOrderTime=0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L291)

<a id="function-function-mq3-client-cgame-console-commands-dispatchbase-function-dispatchbase-registry-commandstate-targetnum-attackernum-state-src-mq3-client-cgame-console-commands-ml-1336489186"></a>
### dispatchBase

```ml
function dispatchBase(registry, commandState, targetNum, attackerNum, state)
```

Calls `std.string.toLowerAscii`, `mq3.qcommon.command_buffer.argv`, `mq3.client.cgame_console_commands.targetCommand` and additional helpers from client game console commands `dispatchBase`. The final path returns `result(false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `if key=="startorbit" then return startOrbitState(registry,state) end if`. |
| `commandState` | `dynamic` | — | commandState record passed to the client game console commands helper calls. |
| `targetNum` | `dynamic` | — | Value used by `if key=="tcmd" then return targetCommand(commandState,targetNum) end if`. |
| `attackerNum` | `dynamic` | — | Value used by `if key=="tell_attacker" then return tellAttacker(commandState,attackerNum) end if`. |
| `state` | `dynamic` | — | Shared client game console commands state passed to the helper calls in `dispatchBase`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L346)

<a id="function-function-mq3-client-cgame-console-commands-emit-function-emit-runtime-boundary-kind-name-text-text2-number-src-mq3-client-cgame-console-commands-ml-663925668"></a>
### emit

```ml
function emit(runtime, boundary, kind, name, text, text2, number)
```

Appends a client game console commands action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `runtime.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game console commands resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the client game console commands path. |
| `text2` | `dynamic` | — | Value used by `action=Action(boundary,kind,name,text,text2,number,not runtime.retailActive)`. |
| `number` | `dynamic` | — | Value used by `action=Action(boundary,kind,name,text,text2,number,not runtime.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L450)

<a id="constant-constant-mq3-client-cgame-console-commands-gt-1fctf-const-gt-1fctf-5-src-mq3-client-cgame-console-commands-ml-1256973974"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Native game-type identifier selecting one-flag capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L34)

<a id="constant-constant-mq3-client-cgame-console-commands-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-console-commands-ml-976769185"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when determining which team and flag commands are available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L32)

<a id="function-function-mq3-client-cgame-console-commands-isnativebasecommand-function-isnativebasecommand-name-src-mq3-client-cgame-console-commands-ml-244235199"></a>
### isNativeBaseCommand

```ml
function isNativeBaseCommand(name)
```

Calls `std.string.toLowerAscii` from client game console commands `isNativeBaseCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game console commands resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L337)

<a id="function-function-mq3-client-cgame-console-commands-loadhud-function-loadhud-state-hudfile-src-mq3-client-cgame-console-commands-ml-1751807632"></a>
### loadHud

```ml
function loadHud(state, hudFile)
```

Team Arena (MISSIONPACK) bodies.  Baseq3 does not register these commands, but keeping their state transitions here makes the native port complete and lets a future missionpack host enable the same implementation unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.hudFile`. |
| `hudFile` | `dynamic` | — | Value assigned to `state.hudFile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L243)

<a id="function-function-mq3-client-cgame-console-commands-missionpackcommands-function-missionpackcommands-src-mq3-client-cgame-console-commands-ml-1595503604"></a>
### missionpackCommands

```ml
function missionpackCommands()
```

Lists the 24 client game console commands missionpack commands strings in their declared order, beginning with `"loadhud"`, `"nextTeamMember"`, `"prevTeamMember"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L609)

<a id="function-function-mq3-client-cgame-console-commands-nextorder-function-nextorder-state-time-src-mq3-client-cgame-console-commands-ml-739486554"></a>
### nextOrder

```ml
function nextOrder(state, time)
```

Updates `state.currentOrder`, `state.orderPending`, `state.orderTime` during client game console commands `nextOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.currentOrder`, `state.orderPending`, `state.orderTime`. |
| `time` | `dynamic` | — | Value assigned to `state.orderTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L272)

<a id="function-function-mq3-client-cgame-console-commands-nextteammember-function-nextteammember-state-src-mq3-client-cgame-console-commands-ml-1017332161"></a>
### nextTeamMember

```ml
function nextTeamMember(state)
```

Updates `state.selectedPlayer` during client game console commands `nextTeamMember`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.selectedPlayer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L261)

<a id="function-function-mq3-client-cgame-console-commands-prevteammember-function-prevteammember-state-src-mq3-client-cgame-console-commands-ml-1839387697"></a>
### prevTeamMember

```ml
function prevTeamMember(state)
```

Updates `state.selectedPlayer` during client game console commands `prevTeamMember`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.selectedPlayer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L266)

<a id="function-function-mq3-client-cgame-console-commands-result-function-result-handled-src-mq3-client-cgame-console-commands-ml-946718590"></a>
### result

```ml
function result(handled)
```

Creates a `mq3.client.cgame_console_commands.Result` record. Assigns `handled` from `handled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handled` | `dynamic` | — | Value used to initialize `Result.handled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L121)

- [mq3.client.cgame_console_commands.Result](Type-mq3-client-cgame-console-commands-result-2015927704.md) — struct
- [mq3.client.cgame_console_commands.Runtime](Type-mq3-client-cgame-console-commands-runtime-604676639.md) — struct
<a id="function-function-mq3-client-cgame-console-commands-scoresdown-function-scoresdown-state-time-src-mq3-client-cgame-console-commands-ml-55971592"></a>
### scoresDown

```ml
function scoresDown(state, time)
```

Updates `state.scoresRequestTime`, `state.showScores`, `state.numScores` during client game console commands `scoresDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.scoresRequestTime`, `state.showScores`, `state.numScores`. |
| `time` | `dynamic` | — | Value assigned to `state.scoresRequestTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L172)

<a id="function-function-mq3-client-cgame-console-commands-scoresup-function-scoresup-state-time-src-mq3-client-cgame-console-commands-ml-784408824"></a>
### scoresUp

```ml
function scoresUp(state, time)
```

Updates `state.showScores`, `state.scoreFadeTime` during client game console commands `scoresUp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.showScores`, `state.scoreFadeTime`. |
| `time` | `dynamic` | — | Value assigned to `state.scoreFadeTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L183)

<a id="function-function-mq3-client-cgame-console-commands-scrollscores-function-scrollscores-state-down-src-mq3-client-cgame-console-commands-ml-1525395997"></a>
### scrollScores

```ml
function scrollScores(state, down)
```

Calls `mq3.client.cgame_console_commands.result` from client game console commands `scrollScores`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scoreboardShowing`. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L250)

<a id="function-function-mq3-client-cgame-console-commands-servercommands-function-servercommands-src-mq3-client-cgame-console-commands-ml-1453530186"></a>
### serverCommands

```ml
function serverCommands()
```

Lists the 27 client game console commands server commands strings in their declared order, beginning with `"kill"`, `"say"`, `"say_team"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L613)

<a id="function-function-mq3-client-cgame-console-commands-singleplayerresult-function-singleplayerresult-won-src-mq3-client-cgame-console-commands-ml-258400104"></a>
### singlePlayerResult

```ml
function singlePlayerResult(won)
```

Calls `mq3.client.cgame_console_commands.result` from client game console commands `singlePlayerResult`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `won` | `dynamic` | — | Value used by `if won then effect.sounds=effect.sounds+["winner"]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L255)

<a id="function-function-mq3-client-cgame-console-commands-sizedown-function-sizedown-registry-src-mq3-client-cgame-console-commands-ml-115489709"></a>
### sizeDown

```ml
function sizeDown(registry)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeDown`. The final path returns `cvarSet(effect,"cg_viewsize",str(value-10))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `value=cvar.get(registry,"cg_viewsize","100",0).integer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L153)

<a id="function-function-mq3-client-cgame-console-commands-sizedownstate-function-sizedownstate-state-src-mq3-client-cgame-console-commands-ml-82113473"></a>
### sizeDownState

```ml
function sizeDownState(state)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeDownState`. The final path returns `cvarSet(effect,"cg_viewsize",str(state.viewsize-10))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.viewsize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L162)

<a id="function-function-mq3-client-cgame-console-commands-sizeup-function-sizeup-registry-src-mq3-client-cgame-console-commands-ml-165169037"></a>
### sizeUp

```ml
function sizeUp(registry)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeUp`. The final path returns `cvarSet(effect,"cg_viewsize",str(value+10))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `value=cvar.get(registry,"cg_viewsize","100",0).integer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L147)

<a id="function-function-mq3-client-cgame-console-commands-sizeupstate-function-sizeupstate-state-src-mq3-client-cgame-console-commands-ml-1316105591"></a>
### sizeUpState

```ml
function sizeUpState(state)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `sizeUpState`. The final path returns `cvarSet(effect,"cg_viewsize",str(state.viewsize+10))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.viewsize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L159)

<a id="function-function-mq3-client-cgame-console-commands-startorbit-function-startorbit-registry-src-mq3-client-cgame-console-commands-ml-988283073"></a>
### startOrbit

```ml
function startOrbit(registry)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `startOrbit`. The final path returns `cvarSet(effect,"cg_thirdPersonRange","100")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `developer=cvar.get(registry,"developer","0",0).integer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L214)

<a id="function-function-mq3-client-cgame-console-commands-startorbitstate-function-startorbitstate-registry-state-src-mq3-client-cgame-console-commands-ml-227214834"></a>
### startOrbitState

```ml
function startOrbitState(registry, state)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.qcommon.cvar.get`, `mq3.client.cgame_console_commands.cvarSet` from client game console commands `startOrbitState`. The final path returns `cvarSet(effect,"cg_thirdPersonRange","100")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value used by `developer=cvar.get(registry,"developer","0",0).integer`. |
| `state` | `dynamic` | — | Record read through `state.cameraOrbit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L226)

- [mq3.client.cgame_console_commands.State](Type-mq3-client-cgame-console-commands-state-6632410.md) — struct
<a id="function-function-mq3-client-cgame-console-commands-syncvmcvars-function-syncvmcvars-state-registry-src-mq3-client-cgame-console-commands-ml-2056382652"></a>
### syncVmCvars

```ml
function syncVmCvars(state, registry)
```

Updates `state.viewsize`, `state.cameraOrbit` during client game console commands `syncVmCvars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game console commands record/storage; this routine assigns `state.viewsize`, `state.cameraOrbit`. |
| `registry` | `dynamic` | — | Value used by `state.viewsize=cvar.get(registry,"cg_viewsize","100",0).integer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L234)

<a id="function-function-mq3-client-cgame-console-commands-targetcommand-function-targetcommand-commandstate-targetnum-src-mq3-client-cgame-console-commands-ml-548081141"></a>
### targetCommand

```ml
function targetCommand(commandState, targetNum)
```

CG_TargetCommand_f deliberately preserves the original !targetNum test: player zero is ignored while -1 is passed through to the generated command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the client game console commands helper calls. |
| `targetNum` | `dynamic` | — | Value used by `if targetNum==0 then return effect end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L140)

<a id="function-function-mq3-client-cgame-console-commands-task-function-task-order-voice-src-mq3-client-cgame-console-commands-ml-379784332"></a>
### task

```ml
function task(order, voice)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.console` from client game console commands `task`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `order` | `dynamic` | — | Value used by `effect.clientCommands=effect.clientCommands+["teamtask "+str(order)+"\\n"]`. |
| `voice` | `dynamic` | — | Value used by `console(effect,"cmd vsay_team "+voice+"\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L298)

<a id="function-function-mq3-client-cgame-console-commands-taskcamp-function-taskcamp-src-mq3-client-cgame-console-commands-ml-180494002"></a>
### taskCamp

```ml
function taskCamp()
```

Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskCamp`, returning its result for `TEAMTASK_CAMP, "oncamp"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L309)

<a id="function-function-mq3-client-cgame-console-commands-taskdefense-function-taskdefense-src-mq3-client-cgame-console-commands-ml-1603089328"></a>
### taskDefense

```ml
function taskDefense()
```

Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskDefense`, returning its result for `TEAMTASK_DEFENSE, "ondefense"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L305)

<a id="function-function-mq3-client-cgame-console-commands-taskescort-function-taskescort-src-mq3-client-cgame-console-commands-ml-158873914"></a>
### taskEscort

```ml
function taskEscort()
```

Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskEscort`, returning its result for `TEAMTASK_ESCORT, "onfollowcarrier"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L315)

<a id="function-function-mq3-client-cgame-console-commands-taskfollow-function-taskfollow-src-mq3-client-cgame-console-commands-ml-782829046"></a>
### taskFollow

```ml
function taskFollow()
```

Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskFollow`, returning its result for `TEAMTASK_FOLLOW, "onfollow"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L311)

<a id="function-function-mq3-client-cgame-console-commands-taskoffense-function-taskoffense-gametype-src-mq3-client-cgame-console-commands-ml-1810763610"></a>
### taskOffense

```ml
function taskOffense(gametype)
```

Calls `mq3.client.cgame_console_commands.task` from client game console commands `taskOffense`. The final path returns `task(TEAMTASK_OFFENSE,"onoffense")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L303)

<a id="function-function-mq3-client-cgame-console-commands-taskownflag-function-taskownflag-src-mq3-client-cgame-console-commands-ml-1459663596"></a>
### taskOwnFlag

```ml
function taskOwnFlag()
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.console` from client game console commands `taskOwnFlag`. The final path returns `console(effect,"cmd vsay_team ihaveflag\n")`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L317)

<a id="function-function-mq3-client-cgame-console-commands-taskpatrol-function-taskpatrol-src-mq3-client-cgame-console-commands-ml-1586905614"></a>
### taskPatrol

```ml
function taskPatrol()
```

Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskPatrol`, returning its result for `TEAMTASK_PATROL, "onpatrol"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L307)

<a id="function-function-mq3-client-cgame-console-commands-taskretrieve-function-taskretrieve-src-mq3-client-cgame-console-commands-ml-762391038"></a>
### taskRetrieve

```ml
function taskRetrieve()
```

Adapts `mq3.client.cgame_console_commands.task` to client game console commands `taskRetrieve`, returning its result for `TEAMTASK_RETRIEVE, "onreturnflag"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L313)

<a id="function-function-mq3-client-cgame-console-commands-tasksuicide-function-tasksuicide-targetnum-src-mq3-client-cgame-console-commands-ml-1355570969"></a>
### taskSuicide

```ml
function taskSuicide(targetNum)
```

Calls `mq3.client.cgame_console_commands.result` from client game console commands `taskSuicide`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetNum` | `dynamic` | — | Value used by `if targetNum!=-1 then effect.clientCommands=effect.clientCommands+["tell "+str(targetNum)+" suicide"] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L320)

<a id="function-function-mq3-client-cgame-console-commands-taunt-function-taunt-text-src-mq3-client-cgame-console-commands-ml-402599577"></a>
### taunt

```ml
function taunt(text)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.console` from client game console commands `taunt`. The final path returns `console(effect,text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `taunt` in the client game console commands path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L323)

<a id="function-function-mq3-client-cgame-console-commands-tauntdeathinsult-function-tauntdeathinsult-src-mq3-client-cgame-console-commands-ml-1522346182"></a>
### tauntDeathInsult

```ml
function tauntDeathInsult()
```

Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntDeathInsult`, returning its result for `"cmd vsay death_insult\n"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L331)

<a id="function-function-mq3-client-cgame-console-commands-tauntgauntlet-function-tauntgauntlet-src-mq3-client-cgame-console-commands-ml-781924102"></a>
### tauntGauntlet

```ml
function tauntGauntlet()
```

Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntGauntlet`, returning its result for `"cmd vsay kill_guantlet\n"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L333)

<a id="function-function-mq3-client-cgame-console-commands-tauntkillinsult-function-tauntkillinsult-src-mq3-client-cgame-console-commands-ml-105310820"></a>
### tauntKillInsult

```ml
function tauntKillInsult()
```

Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntKillInsult`, returning its result for `"cmd vsay kill_insult\n"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L325)

<a id="function-function-mq3-client-cgame-console-commands-tauntpraise-function-tauntpraise-src-mq3-client-cgame-console-commands-ml-2084713578"></a>
### tauntPraise

```ml
function tauntPraise()
```

Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntPraise`, returning its result for `"cmd vsay praise\n"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L327)

<a id="function-function-mq3-client-cgame-console-commands-taunttaunt-function-taunttaunt-src-mq3-client-cgame-console-commands-ml-288287358"></a>
### tauntTaunt

```ml
function tauntTaunt()
```

Adapts `mq3.client.cgame_console_commands.taunt` to client game console commands `tauntTaunt`, returning its result for `"cmd vtaunt\n"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L329)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-camp-const-teamtask-camp-7-src-mq3-client-cgame-console-commands-ml-867214870"></a>
### TEAMTASK_CAMP

```ml
const TEAMTASK_CAMP = 7
```

Team-order identifier assigning the player the camp tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L29)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-defense-const-teamtask-defense-2-src-mq3-client-cgame-console-commands-ml-1685949707"></a>
### TEAMTASK_DEFENSE

```ml
const TEAMTASK_DEFENSE = 2
```

Team-order identifier assigning the player the defense tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L19)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-escort-const-teamtask-escort-6-src-mq3-client-cgame-console-commands-ml-572763903"></a>
### TEAMTASK_ESCORT

```ml
const TEAMTASK_ESCORT = 6
```

Team-order identifier assigning the player the escort tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L27)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-follow-const-teamtask-follow-4-src-mq3-client-cgame-console-commands-ml-1577843729"></a>
### TEAMTASK_FOLLOW

```ml
const TEAMTASK_FOLLOW = 4
```

Team-order identifier assigning the player the follow tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L23)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-offense-const-teamtask-offense-1-src-mq3-client-cgame-console-commands-ml-1261265388"></a>
### TEAMTASK_OFFENSE

```ml
const TEAMTASK_OFFENSE = 1
```

Team-order identifier assigning the player the offense tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L17)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-patrol-const-teamtask-patrol-3-src-mq3-client-cgame-console-commands-ml-831059098"></a>
### TEAMTASK_PATROL

```ml
const TEAMTASK_PATROL = 3
```

Team-order identifier assigning the player the patrol tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L21)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-retrieve-const-teamtask-retrieve-5-src-mq3-client-cgame-console-commands-ml-78287588"></a>
### TEAMTASK_RETRIEVE

```ml
const TEAMTASK_RETRIEVE = 5
```

Team-order identifier assigning the player the retrieve tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L25)

<a id="function-function-mq3-client-cgame-console-commands-tell-function-tell-commandstate-clientnum-voice-src-mq3-client-cgame-console-commands-ml-2108981193"></a>
### tell

```ml
function tell(commandState, clientNum, voice)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.client.cgame_console_commands.client`, `mq3.qcommon.command_buffer.argsBuffer` from client game console commands `tell`. The final path returns `client(effect,prefix+str(clientNum)+" "+commands.argsBuffer(commandState,128))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the client game console commands helper calls. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `voice` | `dynamic` | — | Value used by `if voice then prefix="vtell " end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L190)

<a id="function-function-mq3-client-cgame-console-commands-tellattacker-function-tellattacker-commandstate-attackernum-src-mq3-client-cgame-console-commands-ml-1820204331"></a>
### tellAttacker

```ml
function tellAttacker(commandState, attackerNum)
```

Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `tellAttacker`, returning its result for `commandState, attackerNum, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.tell`. |
| `attackerNum` | `dynamic` | — | Argument 2 of `mq3.client.cgame_console_commands.tell`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L202)

<a id="function-function-mq3-client-cgame-console-commands-telltarget-function-telltarget-commandstate-targetnum-src-mq3-client-cgame-console-commands-ml-268756257"></a>
### tellTarget

```ml
function tellTarget(commandState, targetNum)
```

Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `tellTarget`, returning its result for `commandState, targetNum, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.tell`. |
| `targetNum` | `dynamic` | — | Argument 2 of `mq3.client.cgame_console_commands.tell`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L198)

<a id="function-function-mq3-client-cgame-console-commands-viewpos-function-viewpos-origin-yaw-src-mq3-client-cgame-console-commands-ml-687157875"></a>
### viewpos

```ml
function viewpos(origin, yaw)
```

Calls `mq3.client.cgame_console_commands.result`, `mq3.compat.numeric.trunc32` from client game console commands `viewpos`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `yaw` | `dynamic` | — | Value used by `effect.prints=effect.prints+["("+str(n.trunc32(origin[0]))+" "+str(n.trunc32(origin[1]))+" "+str(n.trunc32(origin[2]))+") : "+str(n.trunc32(ya...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L166)

<a id="function-function-mq3-client-cgame-console-commands-voicetellattacker-function-voicetellattacker-commandstate-attackernum-src-mq3-client-cgame-console-commands-ml-1472043307"></a>
### voiceTellAttacker

```ml
function voiceTellAttacker(commandState, attackerNum)
```

Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `voiceTellAttacker`, returning its result for `commandState, attackerNum, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.tell`. |
| `attackerNum` | `dynamic` | — | Argument 2 of `mq3.client.cgame_console_commands.tell`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L210)

<a id="function-function-mq3-client-cgame-console-commands-voicetelltarget-function-voicetelltarget-commandstate-targetnum-src-mq3-client-cgame-console-commands-ml-1954076537"></a>
### voiceTellTarget

```ml
function voiceTellTarget(commandState, targetNum)
```

Adapts `mq3.client.cgame_console_commands.tell` to client game console commands `voiceTellTarget`, returning its result for `commandState, targetNum, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Argument 1 of `mq3.client.cgame_console_commands.tell`. |
| `targetNum` | `dynamic` | — | Argument 2 of `mq3.client.cgame_console_commands.tell`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_console_commands.ml#L206)
