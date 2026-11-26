# `mq3.client.ui_atoms_missionpack.PostGameInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-atoms-missionpack-ml-2145955256.md)

<a id="struct-struct-mq3-client-ui-atoms-missionpack-postgameinfo-struct-postgameinfo-src-mq3-client-ui-atoms-missionpack-ml-1630937201"></a>
## PostGameInfo

```ml
struct PostGameInfo
```

Stores UI atoms missionpack post game info record, including `score`, `redScore`, `blueScore`, `perfects`, `accuracy`, `impressives` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L30)

## Members

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-accuracy-accuracy-src-mq3-client-ui-atoms-missionpack-ml-1011090159"></a>
### accuracy

```ml
accuracy
```

Percentage of successful weapon hits reported in the scoreboard data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L40)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-assists-assists-src-mq3-client-ui-atoms-missionpack-ml-862668709"></a>
### assists

```ml
assists
```

Assist-award count stored in the postgame score record and published to UI cvars.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L48)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-basescore-basescore-src-mq3-client-ui-atoms-missionpack-ml-1257139629"></a>
### baseScore

```ml
baseScore
```

Unmodified match score parsed from the postgame command before time, shutout, and skill bonuses are applied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L65)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-bluescore-bluescore-src-mq3-client-ui-atoms-missionpack-ml-913835509"></a>
### blueScore

```ml
blueScore
```

Blue team's final score used in the postgame result text and victory or shutout checks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L36)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-captures-captures-src-mq3-client-ui-atoms-missionpack-ml-232589131"></a>
### captures

```ml
captures
```

Number of flag captures credited to this player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L52)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-defends-defends-src-mq3-client-ui-atoms-missionpack-ml-1432480001"></a>
### defends

```ml
defends
```

Defense-award count stored in the postgame score record and published to UI cvars.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L46)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-excellents-excellents-src-mq3-client-ui-atoms-missionpack-ml-117340091"></a>
### excellents

```ml
excellents
```

Excellent-award count stored in the postgame score record and published to UI cvars.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L44)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-gauntlets-gauntlets-src-mq3-client-ui-atoms-missionpack-ml-1372001605"></a>
### gauntlets

```ml
gauntlets
```

Gauntlet-award count stored in the postgame score record and published to UI cvars.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L50)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-impressives-impressives-src-mq3-client-ui-atoms-missionpack-ml-1047532325"></a>
### impressives

```ml
impressives
```

Impressive-award count stored in the postgame score record and published to UI cvars.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L42)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-perfects-perfects-src-mq3-client-ui-atoms-missionpack-ml-1259352293"></a>
### perfects

```ml
perfects
```

Perfect-game result count published to the postgame score cvars.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L38)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-redscore-redscore-src-mq3-client-ui-atoms-missionpack-ml-1138249011"></a>
### redScore

```ml
redScore
```

Red team's final score used in the postgame result text and victory or shutout checks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L34)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-score-score-src-mq3-client-ui-atoms-missionpack-ml-98595285"></a>
### score

```ml
score
```

Final postgame score: base score plus shutout and time bonuses, multiplied by the skill bonus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L32)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-shutoutbonus-shutoutbonus-src-mq3-client-ui-atoms-missionpack-ml-602170391"></a>
### shutoutBonus

```ml
shutoutBonus
```

Bonus points granted when the red team wins while the blue team has no positive score.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L59)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-skillbonus-skillbonus-src-mq3-client-ui-atoms-missionpack-ml-1301660745"></a>
### skillBonus

```ml
skillBonus
```

Positive difficulty multiplier derived from the single-player skill setting and applied to the postgame subtotal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L62)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-time-time-src-mq3-client-ui-atoms-missionpack-ml-357742075"></a>
### time

```ml
time
```

Completed match duration in seconds, computed from the match end time and ui_matchStartTime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L54)

<a id="field-field-mq3-client-ui-atoms-missionpack-postgameinfo-timebonus-timebonus-src-mq3-client-ui-atoms-missionpack-ml-1795029757"></a>
### timeBonus

```ml
timeBonus
```

Bonus points for finishing before the map's target completion time, at ten points per remaining second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L57)
