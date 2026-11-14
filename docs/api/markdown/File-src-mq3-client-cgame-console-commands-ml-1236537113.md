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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `effect` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L177)

- [mq3.client.cgame_console_commands.Action](Type-mq3-client-cgame-console-commands-action-776542747.md) — struct
<a id="extern_function-extern-function-mq3-client-cgame-console-commands-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-console-commands-ml-653712726"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L11)

<a id="function-function-mq3-client-cgame-console-commands-basecommands-function-basecommands-src-mq3-client-cgame-console-commands-ml-116374666"></a>
### baseCommands

```ml
function baseCommands()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L285)

<a id="function-function-mq3-client-cgame-console-commands-cg-camera-f-function-cg-camera-f-runtime-src-mq3-client-cgame-console-commands-ml-246164378"></a>
### CG_Camera_f

```ml
function CG_Camera_f(runtime)
```

CG_Camera_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L280)

<a id="function-function-mq3-client-cgame-console-commands-cg-confirmorder-f-function-cg-confirmorder-f-runtime-src-mq3-client-cgame-console-commands-ml-1533118516"></a>
### CG_ConfirmOrder_f

```ml
function CG_ConfirmOrder_f(runtime)
```

CG_ConfirmOrder_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L234)

<a id="function-function-mq3-client-cgame-console-commands-cg-consolecommand-function-cg-consolecommand-runtime-src-mq3-client-cgame-console-commands-ml-1807114690"></a>
### CG_ConsoleCommand

```ml
function CG_ConsoleCommand(runtime)
```

CG_ConsoleCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L303)

<a id="function-function-mq3-client-cgame-console-commands-cg-denyorder-f-function-cg-denyorder-f-runtime-src-mq3-client-cgame-console-commands-ml-2140685968"></a>
### CG_DenyOrder_f

```ml
function CG_DenyOrder_f(runtime)
```

CG_DenyOrder_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L236)

<a id="function-function-mq3-client-cgame-console-commands-cg-edithud-f-function-cg-edithud-f-runtime-src-mq3-client-cgame-console-commands-ml-1760717468"></a>
### CG_EditHud_f

```ml
function CG_EditHud_f(runtime)
```

CG_EditHud_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L276)

<a id="function-function-mq3-client-cgame-console-commands-cg-initconsolecommands-function-cg-initconsolecommands-runtime-src-mq3-client-cgame-console-commands-ml-111773592"></a>
### CG_InitConsoleCommands

```ml
function CG_InitConsoleCommands(runtime)
```

CG_InitConsoleCommands

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L296)

<a id="function-function-mq3-client-cgame-console-commands-cg-loadhud-f-function-cg-loadhud-f-runtime-src-mq3-client-cgame-console-commands-ml-1842842652"></a>
### CG_LoadHud_f

```ml
function CG_LoadHud_f(runtime)
```

CG_LoadHud_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L218)

<a id="function-function-mq3-client-cgame-console-commands-cg-nextorder-f-function-cg-nextorder-f-runtime-src-mq3-client-cgame-console-commands-ml-259318420"></a>
### CG_NextOrder_f

```ml
function CG_NextOrder_f(runtime)
```

CG_NextOrder_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L232)

<a id="function-function-mq3-client-cgame-console-commands-cg-nextteammember-f-function-cg-nextteammember-f-runtime-src-mq3-client-cgame-console-commands-ml-425794184"></a>
### CG_NextTeamMember_f

```ml
function CG_NextTeamMember_f(runtime)
```

CG_NextTeamMember_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L228)

<a id="function-function-mq3-client-cgame-console-commands-cg-prevteammember-f-function-cg-prevteammember-f-runtime-src-mq3-client-cgame-console-commands-ml-340274056"></a>
### CG_PrevTeamMember_f

```ml
function CG_PrevTeamMember_f(runtime)
```

CG_PrevTeamMember_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L230)

<a id="function-function-mq3-client-cgame-console-commands-cg-scoresdown-f-function-cg-scoresdown-f-runtime-src-mq3-client-cgame-console-commands-ml-135391278"></a>
### CG_ScoresDown_f

```ml
function CG_ScoresDown_f(runtime)
```

CG_ScoresDown_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L205)

<a id="function-function-mq3-client-cgame-console-commands-cg-scoresup-f-function-cg-scoresup-f-runtime-src-mq3-client-cgame-console-commands-ml-1968027592"></a>
### CG_ScoresUp_f

```ml
function CG_ScoresUp_f(runtime)
```

CG_ScoresUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L207)

<a id="function-function-mq3-client-cgame-console-commands-cg-scrollscoresdown-f-function-cg-scrollscoresdown-f-runtime-src-mq3-client-cgame-console-commands-ml-890902888"></a>
### CG_scrollScoresDown_f

```ml
function CG_scrollScoresDown_f(runtime)
```

CG_scrollScoresDown_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L220)

<a id="function-function-mq3-client-cgame-console-commands-cg-scrollscoresup-f-function-cg-scrollscoresup-f-runtime-src-mq3-client-cgame-console-commands-ml-1254128838"></a>
### CG_scrollScoresUp_f

```ml
function CG_scrollScoresUp_f(runtime)
```

CG_scrollScoresUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L222)

<a id="function-function-mq3-client-cgame-console-commands-cg-sizedown-f-function-cg-sizedown-f-runtime-src-mq3-client-cgame-console-commands-ml-491454014"></a>
### CG_SizeDown_f

```ml
function CG_SizeDown_f(runtime)
```

CG_SizeDown_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L201)

<a id="function-function-mq3-client-cgame-console-commands-cg-sizeup-f-function-cg-sizeup-f-runtime-src-mq3-client-cgame-console-commands-ml-1826881748"></a>
### CG_SizeUp_f

```ml
function CG_SizeUp_f(runtime)
```

CG_SizeUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L199)

<a id="function-function-mq3-client-cgame-console-commands-cg-splose-f-function-cg-splose-f-runtime-src-mq3-client-cgame-console-commands-ml-855037256"></a>
### CG_spLose_f

```ml
function CG_spLose_f(runtime)
```

CG_spLose_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L226)

<a id="function-function-mq3-client-cgame-console-commands-cg-spwin-f-function-cg-spwin-f-runtime-src-mq3-client-cgame-console-commands-ml-411380688"></a>
### CG_spWin_f

```ml
function CG_spWin_f(runtime)
```

CG_spWin_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L224)

<a id="function-function-mq3-client-cgame-console-commands-cg-startorbit-f-function-cg-startorbit-f-runtime-src-mq3-client-cgame-console-commands-ml-2013914216"></a>
### CG_StartOrbit_f

```ml
function CG_StartOrbit_f(runtime)
```

CG_StartOrbit_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L266)

<a id="function-function-mq3-client-cgame-console-commands-cg-targetcommand-f-function-cg-targetcommand-f-runtime-src-mq3-client-cgame-console-commands-ml-193193576"></a>
### CG_TargetCommand_f

```ml
function CG_TargetCommand_f(runtime)
```

CG_TargetCommand_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L197)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskcamp-f-function-cg-taskcamp-f-runtime-src-mq3-client-cgame-console-commands-ml-102919232"></a>
### CG_TaskCamp_f

```ml
function CG_TaskCamp_f(runtime)
```

CG_TaskCamp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L244)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskdefense-f-function-cg-taskdefense-f-runtime-src-mq3-client-cgame-console-commands-ml-1574471312"></a>
### CG_TaskDefense_f

```ml
function CG_TaskDefense_f(runtime)
```

CG_TaskDefense_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L240)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskescort-f-function-cg-taskescort-f-runtime-src-mq3-client-cgame-console-commands-ml-491935566"></a>
### CG_TaskEscort_f

```ml
function CG_TaskEscort_f(runtime)
```

CG_TaskEscort_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L250)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskfollow-f-function-cg-taskfollow-f-runtime-src-mq3-client-cgame-console-commands-ml-1667072300"></a>
### CG_TaskFollow_f

```ml
function CG_TaskFollow_f(runtime)
```

CG_TaskFollow_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L246)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskoffense-f-function-cg-taskoffense-f-runtime-src-mq3-client-cgame-console-commands-ml-658043140"></a>
### CG_TaskOffense_f

```ml
function CG_TaskOffense_f(runtime)
```

CG_TaskOffense_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L238)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskownflag-f-function-cg-taskownflag-f-runtime-src-mq3-client-cgame-console-commands-ml-360277852"></a>
### CG_TaskOwnFlag_f

```ml
function CG_TaskOwnFlag_f(runtime)
```

CG_TaskOwnFlag_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L252)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskpatrol-f-function-cg-taskpatrol-f-runtime-src-mq3-client-cgame-console-commands-ml-1862377602"></a>
### CG_TaskPatrol_f

```ml
function CG_TaskPatrol_f(runtime)
```

CG_TaskPatrol_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L242)

<a id="function-function-mq3-client-cgame-console-commands-cg-taskretrieve-f-function-cg-taskretrieve-f-runtime-src-mq3-client-cgame-console-commands-ml-1530859518"></a>
### CG_TaskRetrieve_f

```ml
function CG_TaskRetrieve_f(runtime)
```

CG_TaskRetrieve_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L248)

<a id="function-function-mq3-client-cgame-console-commands-cg-tasksuicide-f-function-cg-tasksuicide-f-runtime-src-mq3-client-cgame-console-commands-ml-394841584"></a>
### CG_TaskSuicide_f

```ml
function CG_TaskSuicide_f(runtime)
```

CG_TaskSuicide_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L254)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntdeathinsult-f-function-cg-tauntdeathinsult-f-runtime-src-mq3-client-cgame-console-commands-ml-734503910"></a>
### CG_TauntDeathInsult_f

```ml
function CG_TauntDeathInsult_f(runtime)
```

CG_TauntDeathInsult_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L262)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntgauntlet-f-function-cg-tauntgauntlet-f-runtime-src-mq3-client-cgame-console-commands-ml-45852232"></a>
### CG_TauntGauntlet_f

```ml
function CG_TauntGauntlet_f(runtime)
```

CG_TauntGauntlet_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L264)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntkillinsult-f-function-cg-tauntkillinsult-f-runtime-src-mq3-client-cgame-console-commands-ml-1037838636"></a>
### CG_TauntKillInsult_f

```ml
function CG_TauntKillInsult_f(runtime)
```

CG_TauntKillInsult_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L256)

<a id="function-function-mq3-client-cgame-console-commands-cg-tauntpraise-f-function-cg-tauntpraise-f-runtime-src-mq3-client-cgame-console-commands-ml-1155292124"></a>
### CG_TauntPraise_f

```ml
function CG_TauntPraise_f(runtime)
```

CG_TauntPraise_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L258)

<a id="function-function-mq3-client-cgame-console-commands-cg-taunttaunt-f-function-cg-taunttaunt-f-runtime-src-mq3-client-cgame-console-commands-ml-1978862092"></a>
### CG_TauntTaunt_f

```ml
function CG_TauntTaunt_f(runtime)
```

CG_TauntTaunt_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L260)

<a id="function-function-mq3-client-cgame-console-commands-cg-teammenu-f-function-cg-teammenu-f-runtime-src-mq3-client-cgame-console-commands-ml-290392168"></a>
### CG_TeamMenu_f

```ml
function CG_TeamMenu_f(runtime)
```

The next three bodies are disabled in the shipped source, but preserving their documented state transitions covers their Ledger symbols without registering dormant console commands. CG_TeamMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L272)

<a id="function-function-mq3-client-cgame-console-commands-cg-tellattacker-f-function-cg-tellattacker-f-runtime-src-mq3-client-cgame-console-commands-ml-1283994288"></a>
### CG_TellAttacker_f

```ml
function CG_TellAttacker_f(runtime)
```

CG_TellAttacker_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L211)

<a id="function-function-mq3-client-cgame-console-commands-cg-telltarget-f-function-cg-telltarget-f-runtime-src-mq3-client-cgame-console-commands-ml-1984956888"></a>
### CG_TellTarget_f

```ml
function CG_TellTarget_f(runtime)
```

CG_TellTarget_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L209)

<a id="function-function-mq3-client-cgame-console-commands-cg-viewpos-f-function-cg-viewpos-f-runtime-src-mq3-client-cgame-console-commands-ml-2057431972"></a>
### CG_Viewpos_f

```ml
function CG_Viewpos_f(runtime)
```

CG_Viewpos_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L203)

<a id="function-function-mq3-client-cgame-console-commands-cg-voicetellattacker-f-function-cg-voicetellattacker-f-runtime-src-mq3-client-cgame-console-commands-ml-1701736776"></a>
### CG_VoiceTellAttacker_f

```ml
function CG_VoiceTellAttacker_f(runtime)
```

CG_VoiceTellAttacker_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L215)

<a id="function-function-mq3-client-cgame-console-commands-cg-voicetelltarget-f-function-cg-voicetelltarget-f-runtime-src-mq3-client-cgame-console-commands-ml-139001692"></a>
### CG_VoiceTellTarget_f

```ml
function CG_VoiceTellTarget_f(runtime)
```

CG_VoiceTellTarget_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L213)

<a id="function-function-mq3-client-cgame-console-commands-client-function-client-effect-text-src-mq3-client-cgame-console-commands-ml-1669452224"></a>
### client

```ml
function client(effect, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L32)

<a id="function-function-mq3-client-cgame-console-commands-cmd-argv-function-cmd-argv-runtime-index-src-mq3-client-cgame-console-commands-ml-837574398"></a>
### Cmd_Argv

```ml
function Cmd_Argv(runtime, index)
```

Cmd_Argv is mentioned by the original command contract and maps directly to the qcommon token state shared by every native command body.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L194)

<a id="function-function-mq3-client-cgame-console-commands-confirmorder-function-confirmorder-state-time-src-mq3-client-cgame-console-commands-ml-808025716"></a>
### confirmOrder

```ml
function confirmOrder(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L122)

<a id="function-function-mq3-client-cgame-console-commands-console-function-console-effect-text-src-mq3-client-cgame-console-commands-ml-1352436262"></a>
### console

```ml
function console(effect, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L31)

<a id="function-function-mq3-client-cgame-console-commands-create-function-create-src-mq3-client-cgame-console-commands-ml-552388390"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L26)

<a id="function-function-mq3-client-cgame-console-commands-createruntime-function-createruntime-registry-missionpack-retailactive-src-mq3-client-cgame-console-commands-ml-2090403739"></a>
### createRuntime

```ml
function createRuntime(registry, missionpack, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L171)

<a id="function-function-mq3-client-cgame-console-commands-cvarset-function-cvarset-effect-name-value-src-mq3-client-cgame-console-commands-ml-183353999"></a>
### cvarSet

```ml
function cvarSet(effect, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L30)

<a id="function-function-mq3-client-cgame-console-commands-delegated-function-delegated-runtime-name-src-mq3-client-cgame-console-commands-ml-660279877"></a>
### delegated

```ml
function delegated(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L301)

<a id="function-function-mq3-client-cgame-console-commands-denyorder-function-denyorder-state-time-src-mq3-client-cgame-console-commands-ml-1755213320"></a>
### denyOrder

```ml
function denyOrder(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L126)

<a id="function-function-mq3-client-cgame-console-commands-dispatchbase-function-dispatchbase-registry-commandstate-targetnum-attackernum-state-src-mq3-client-cgame-console-commands-ml-1336489186"></a>
### dispatchBase

```ml
function dispatchBase(registry, commandState, targetNum, attackerNum, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `commandState` | `dynamic` | — |  |
| `targetNum` | `dynamic` | — |  |
| `attackerNum` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L152)

<a id="function-function-mq3-client-cgame-console-commands-emit-function-emit-runtime-boundary-kind-name-text-text2-number-src-mq3-client-cgame-console-commands-ml-663925668"></a>
### emit

```ml
function emit(runtime, boundary, kind, name, text, text2, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `text2` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L174)

<a id="constant-constant-mq3-client-cgame-console-commands-gt-1fctf-const-gt-1fctf-5-src-mq3-client-cgame-console-commands-ml-1256973974"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L21)

<a id="constant-constant-mq3-client-cgame-console-commands-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-console-commands-ml-976769185"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L20)

<a id="function-function-mq3-client-cgame-console-commands-isnativebasecommand-function-isnativebasecommand-name-src-mq3-client-cgame-console-commands-ml-244235199"></a>
### isNativeBaseCommand

```ml
function isNativeBaseCommand(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L149)

<a id="function-function-mq3-client-cgame-console-commands-loadhud-function-loadhud-state-hudfile-src-mq3-client-cgame-console-commands-ml-1751807632"></a>
### loadHud

```ml
function loadHud(state, hudFile)
```

Team Arena (MISSIONPACK) bodies.  Baseq3 does not register these commands, but keeping their state transitions here makes the native port complete and lets a future missionpack host enable the same implementation unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `hudFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L96)

<a id="function-function-mq3-client-cgame-console-commands-missionpackcommands-function-missionpackcommands-src-mq3-client-cgame-console-commands-ml-1595503604"></a>
### missionpackCommands

```ml
function missionpackCommands()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L288)

<a id="function-function-mq3-client-cgame-console-commands-nextorder-function-nextorder-state-time-src-mq3-client-cgame-console-commands-ml-739486554"></a>
### nextOrder

```ml
function nextOrder(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L113)

<a id="function-function-mq3-client-cgame-console-commands-nextteammember-function-nextteammember-state-src-mq3-client-cgame-console-commands-ml-1017332161"></a>
### nextTeamMember

```ml
function nextTeamMember(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L107)

<a id="function-function-mq3-client-cgame-console-commands-prevteammember-function-prevteammember-state-src-mq3-client-cgame-console-commands-ml-1839387697"></a>
### prevTeamMember

```ml
function prevTeamMember(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L110)

<a id="function-function-mq3-client-cgame-console-commands-result-function-result-handled-src-mq3-client-cgame-console-commands-ml-946718590"></a>
### result

```ml
function result(handled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L29)

- [mq3.client.cgame_console_commands.Result](Type-mq3-client-cgame-console-commands-result-2015927704.md) — struct
- [mq3.client.cgame_console_commands.Runtime](Type-mq3-client-cgame-console-commands-runtime-604676639.md) — struct
<a id="function-function-mq3-client-cgame-console-commands-scoresdown-function-scoresdown-state-time-src-mq3-client-cgame-console-commands-ml-55971592"></a>
### scoresDown

```ml
function scoresDown(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L54)

<a id="function-function-mq3-client-cgame-console-commands-scoresup-function-scoresup-state-time-src-mq3-client-cgame-console-commands-ml-784408824"></a>
### scoresUp

```ml
function scoresUp(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L62)

<a id="function-function-mq3-client-cgame-console-commands-scrollscores-function-scrollscores-state-down-src-mq3-client-cgame-console-commands-ml-1525395997"></a>
### scrollScores

```ml
function scrollScores(state, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L100)

<a id="function-function-mq3-client-cgame-console-commands-servercommands-function-servercommands-src-mq3-client-cgame-console-commands-ml-1453530186"></a>
### serverCommands

```ml
function serverCommands()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L291)

<a id="function-function-mq3-client-cgame-console-commands-singleplayerresult-function-singleplayerresult-won-src-mq3-client-cgame-console-commands-ml-258400104"></a>
### singlePlayerResult

```ml
function singlePlayerResult(won)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `won` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L103)

<a id="function-function-mq3-client-cgame-console-commands-sizedown-function-sizedown-registry-src-mq3-client-cgame-console-commands-ml-115489709"></a>
### sizeDown

```ml
function sizeDown(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L45)

<a id="function-function-mq3-client-cgame-console-commands-sizedownstate-function-sizedownstate-state-src-mq3-client-cgame-console-commands-ml-82113473"></a>
### sizeDownState

```ml
function sizeDownState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L50)

<a id="function-function-mq3-client-cgame-console-commands-sizeup-function-sizeup-registry-src-mq3-client-cgame-console-commands-ml-165169037"></a>
### sizeUp

```ml
function sizeUp(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L41)

<a id="function-function-mq3-client-cgame-console-commands-sizeupstate-function-sizeupstate-state-src-mq3-client-cgame-console-commands-ml-1316105591"></a>
### sizeUpState

```ml
function sizeUpState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L49)

<a id="function-function-mq3-client-cgame-console-commands-startorbit-function-startorbit-registry-src-mq3-client-cgame-console-commands-ml-988283073"></a>
### startOrbit

```ml
function startOrbit(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L75)

<a id="function-function-mq3-client-cgame-console-commands-startorbitstate-function-startorbitstate-registry-state-src-mq3-client-cgame-console-commands-ml-227214834"></a>
### startOrbitState

```ml
function startOrbitState(registry, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L84)

- [mq3.client.cgame_console_commands.State](Type-mq3-client-cgame-console-commands-state-6632410.md) — struct
<a id="function-function-mq3-client-cgame-console-commands-syncvmcvars-function-syncvmcvars-state-registry-src-mq3-client-cgame-console-commands-ml-2056382652"></a>
### syncVmCvars

```ml
function syncVmCvars(state, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L89)

<a id="function-function-mq3-client-cgame-console-commands-targetcommand-function-targetcommand-commandstate-targetnum-src-mq3-client-cgame-console-commands-ml-548081141"></a>
### targetCommand

```ml
function targetCommand(commandState, targetNum)
```

CG_TargetCommand_f deliberately preserves the original !targetNum test: player zero is ignored while -1 is passed through to the generated command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `targetNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L36)

<a id="function-function-mq3-client-cgame-console-commands-task-function-task-order-voice-src-mq3-client-cgame-console-commands-ml-379784332"></a>
### task

```ml
function task(order, voice)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `order` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L130)

<a id="function-function-mq3-client-cgame-console-commands-taskcamp-function-taskcamp-src-mq3-client-cgame-console-commands-ml-180494002"></a>
### taskCamp

```ml
function taskCamp()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L136)

<a id="function-function-mq3-client-cgame-console-commands-taskdefense-function-taskdefense-src-mq3-client-cgame-console-commands-ml-1603089328"></a>
### taskDefense

```ml
function taskDefense()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L134)

<a id="function-function-mq3-client-cgame-console-commands-taskescort-function-taskescort-src-mq3-client-cgame-console-commands-ml-158873914"></a>
### taskEscort

```ml
function taskEscort()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L139)

<a id="function-function-mq3-client-cgame-console-commands-taskfollow-function-taskfollow-src-mq3-client-cgame-console-commands-ml-782829046"></a>
### taskFollow

```ml
function taskFollow()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L137)

<a id="function-function-mq3-client-cgame-console-commands-taskoffense-function-taskoffense-gametype-src-mq3-client-cgame-console-commands-ml-1810763610"></a>
### taskOffense

```ml
function taskOffense(gametype)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L133)

<a id="function-function-mq3-client-cgame-console-commands-taskownflag-function-taskownflag-src-mq3-client-cgame-console-commands-ml-1459663596"></a>
### taskOwnFlag

```ml
function taskOwnFlag()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L140)

<a id="function-function-mq3-client-cgame-console-commands-taskpatrol-function-taskpatrol-src-mq3-client-cgame-console-commands-ml-1586905614"></a>
### taskPatrol

```ml
function taskPatrol()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L135)

<a id="function-function-mq3-client-cgame-console-commands-taskretrieve-function-taskretrieve-src-mq3-client-cgame-console-commands-ml-762391038"></a>
### taskRetrieve

```ml
function taskRetrieve()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L138)

<a id="function-function-mq3-client-cgame-console-commands-tasksuicide-function-tasksuicide-targetnum-src-mq3-client-cgame-console-commands-ml-1355570969"></a>
### taskSuicide

```ml
function taskSuicide(targetNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L141)

<a id="function-function-mq3-client-cgame-console-commands-taunt-function-taunt-text-src-mq3-client-cgame-console-commands-ml-402599577"></a>
### taunt

```ml
function taunt(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L142)

<a id="function-function-mq3-client-cgame-console-commands-tauntdeathinsult-function-tauntdeathinsult-src-mq3-client-cgame-console-commands-ml-1522346182"></a>
### tauntDeathInsult

```ml
function tauntDeathInsult()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L146)

<a id="function-function-mq3-client-cgame-console-commands-tauntgauntlet-function-tauntgauntlet-src-mq3-client-cgame-console-commands-ml-781924102"></a>
### tauntGauntlet

```ml
function tauntGauntlet()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L147)

<a id="function-function-mq3-client-cgame-console-commands-tauntkillinsult-function-tauntkillinsult-src-mq3-client-cgame-console-commands-ml-105310820"></a>
### tauntKillInsult

```ml
function tauntKillInsult()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L143)

<a id="function-function-mq3-client-cgame-console-commands-tauntpraise-function-tauntpraise-src-mq3-client-cgame-console-commands-ml-2084713578"></a>
### tauntPraise

```ml
function tauntPraise()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L144)

<a id="function-function-mq3-client-cgame-console-commands-taunttaunt-function-taunttaunt-src-mq3-client-cgame-console-commands-ml-288287358"></a>
### tauntTaunt

```ml
function tauntTaunt()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L145)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-camp-const-teamtask-camp-7-src-mq3-client-cgame-console-commands-ml-867214870"></a>
### TEAMTASK_CAMP

```ml
const TEAMTASK_CAMP = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L19)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-defense-const-teamtask-defense-2-src-mq3-client-cgame-console-commands-ml-1685949707"></a>
### TEAMTASK_DEFENSE

```ml
const TEAMTASK_DEFENSE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L14)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-escort-const-teamtask-escort-6-src-mq3-client-cgame-console-commands-ml-572763903"></a>
### TEAMTASK_ESCORT

```ml
const TEAMTASK_ESCORT = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L18)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-follow-const-teamtask-follow-4-src-mq3-client-cgame-console-commands-ml-1577843729"></a>
### TEAMTASK_FOLLOW

```ml
const TEAMTASK_FOLLOW = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L16)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-offense-const-teamtask-offense-1-src-mq3-client-cgame-console-commands-ml-1261265388"></a>
### TEAMTASK_OFFENSE

```ml
const TEAMTASK_OFFENSE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L13)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-patrol-const-teamtask-patrol-3-src-mq3-client-cgame-console-commands-ml-831059098"></a>
### TEAMTASK_PATROL

```ml
const TEAMTASK_PATROL = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L15)

<a id="constant-constant-mq3-client-cgame-console-commands-teamtask-retrieve-const-teamtask-retrieve-5-src-mq3-client-cgame-console-commands-ml-78287588"></a>
### TEAMTASK_RETRIEVE

```ml
const TEAMTASK_RETRIEVE = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L17)

<a id="function-function-mq3-client-cgame-console-commands-tell-function-tell-commandstate-clientnum-voice-src-mq3-client-cgame-console-commands-ml-2108981193"></a>
### tell

```ml
function tell(commandState, clientNum, voice)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L65)

<a id="function-function-mq3-client-cgame-console-commands-tellattacker-function-tellattacker-commandstate-attackernum-src-mq3-client-cgame-console-commands-ml-1820204331"></a>
### tellAttacker

```ml
function tellAttacker(commandState, attackerNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `attackerNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L71)

<a id="function-function-mq3-client-cgame-console-commands-telltarget-function-telltarget-commandstate-targetnum-src-mq3-client-cgame-console-commands-ml-268756257"></a>
### tellTarget

```ml
function tellTarget(commandState, targetNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `targetNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L70)

<a id="function-function-mq3-client-cgame-console-commands-viewpos-function-viewpos-origin-yaw-src-mq3-client-cgame-console-commands-ml-687157875"></a>
### viewpos

```ml
function viewpos(origin, yaw)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `yaw` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L51)

<a id="function-function-mq3-client-cgame-console-commands-voicetellattacker-function-voicetellattacker-commandstate-attackernum-src-mq3-client-cgame-console-commands-ml-1472043307"></a>
### voiceTellAttacker

```ml
function voiceTellAttacker(commandState, attackerNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `attackerNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L73)

<a id="function-function-mq3-client-cgame-console-commands-voicetelltarget-function-voicetelltarget-commandstate-targetnum-src-mq3-client-cgame-console-commands-ml-1954076537"></a>
### voiceTellTarget

```ml
function voiceTellTarget(commandState, targetNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `targetNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L72)
