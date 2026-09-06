# Intermission und Levelwechsel

Stand: 2026-09-06. Die drei Baseq3-Funktionen für Intermission-Platzierung,
Matchabschluss und die Anforderung des nächsten Levels sind in MiniLang
implementiert und gegen die unveränderten C-Funktionskörper geprüft.

| Original | MiniLang-Einstieg |
| --- | --- |
| `MoveClientToIntermission` | `intermission.moveClient(level,ent)` |
| `BeginIntermission` | `intermission.begin(level)` |
| `ExitLevel` | `intermission.exitLevel(level)` |

Die Implementierung liegt in `src/mq3/game/intermission.ml`. Die Originalkörper
stammen aus `code/game/g_main.c` des festgeschriebenen Quake-III-Quellstands.

## Tatsächliche Aufrufketten

`scores.checkExitRules` und `scores.checkIntermissionExit` rufen über
`scores.matchBoundary` standardmäßig die neue Intermission-Implementierung auf.
`matchTransitionFn` bleibt als ausdrücklicher Override erhalten. `ClientSpawn`
verwendet bei aktiver Intermission standardmäßig die tatsächliche Platzierung;
`moveIntermissionFn` bleibt ebenfalls verfügbar.

| Originalhelfer | Bereits portierter Aufruf |
| --- | --- |
| `FindIntermissionPoint` | `player_spawns.findIntermission` |
| `StopFollowing` | `team_changes.stopFollowing` |
| `AdjustTournamentScores` | `tournament.adjustScores` |
| `RemoveTournamentLoser` | `tournament.removeLoser` |
| `respawn` und `ClientSpawn` | `client_spawn.respawn` und `client_spawn.spawn` |
| `SendScoreboardMessageToAllClients` | `scores.sendAll` |
| `G_WriteSessionData` | `session.writeWorld` |

Damit laufen Duellpunkte, Userinfo-Aktualisierung, Teamwechsel, Leichenablage,
Spawn, Rangberechnung, Scoreboard und Sitzungsschreiben durch ihre vorhandenen
Ports. `begin` berücksichtigt ausdrücklich gesetzte `respawnFn`- und
`moveIntermissionFn`-Overrides. Ohne diese verwendet es die realen Helfer.

## Platzierung und Beginn

Ein Zuschauer im Follow-Zustand wird zuerst mit `StopFollowing` aus diesem Zustand
genommen. Dieser Schritt setzt auch Team, persistentes Team, Clientnummer und
Follow-Flag zurück und entfernt gegebenenfalls das Bot-Flag am Entity.

Die Platzierung kopiert Intermission-Origin nach `s.origin` und `ps.origin` sowie
die Blickrichtung nach `ps.viewangles`. Sie setzt `PM_INTERMISSION`, löscht alle
PlayerState-Powerups und die beiden `eFlags`. Im EntityState werden Typ, Modell,
Schleifensound und Ereignis zurückgesetzt, außerdem `r.contents`. Die Original-
Funktion führt dabei kein Link/Unlink aus und schreibt weder `r.currentOrigin`
noch `s.pos.trBase` oder `s.angles`. Andere PlayerState-Ereignisfelder bleiben
erhalten.

`begin` kehrt bei bereits gesetzter Intermissionzeit sofort zurück. Im Duell
werden zuerst Sieg und Niederlage mit den tatsächlichen Userinfo-Aufrufen
verbucht. Erst danach wird `intermissiontime` auf `level.time` gesetzt und der
Intermissionpunkt gesucht. Die bestehende Punktsuche berücksichtigt Ziel-Entities
und den ursprünglichen Deathmatch-Spawn-Fallback.

Der anschließende Clientdurchlauf verwendet `level.maxclients` und prüft allein
`inuse`. Verbindungszustand und Team sind keine zusätzlichen Filter. Bei
`ent.health <= 0` wird der Client respawnt. Danach folgt immer die Intermission-
Platzierung, auch wenn `ClientSpawn` sie beim Respawn bereits ausgeführt hat.
Zum Schluss erhalten alle vollständig verbundenen Clients das Scoreboard.

Die ursprüngliche Bedeutung von null bleibt erhalten: Bei `level.time == 0`
setzt ein Beginn keinen von null verschiedenen Aktivitätsmarker; ein erneuter
Aufruf führt die Arbeit deshalb nochmals aus.

## Verlassen des Levels

`ExitLevel` ruft zuerst die Schnittstelle für `BotInterbreedEndMatch` auf. Das
gilt auch dann, wenn im Duell bereits `restarted` gesetzt ist.

Im Duell wird beim ersten Exit der tatsächliche Verlierer zu den Zuschauern
verschoben. Danach wird mit `EXEC_APPEND` der Befehl `map_restart 0\n` angefordert.
Anschließend werden `restarted` gesetzt sowie `changemap` und `intermissiontime`
gelöscht. Ein weiterer Exit führt nach dem Bot-Aufruf keine dieser Aktionen
erneut aus. Dieser Zweig setzt weder Scores zurück noch schreibt er Sitzungen
oder stellt Clients auf `CON_CONNECTING` um.

Andere Spielmodi fordern `vstr nextmap\n` an, löschen `changemap` und die
Intermissionzeit und setzen ausschließlich die roten und blauen Teamscores
zurück. Persönliche Scores werden für vollständig verbundene Clients innerhalb
von `maxclientsCvar` gelöscht. Danach schreibt `session.writeWorld` die Welt- und
Client-Sitzungen; seine Clientspanne ist wie im Original `level.maxclients`.
Erst nach diesen Cvar-Schreibvorgängen werden vollständig verbundene Clients
innerhalb von `maxclientsCvar` auf `CON_CONNECTING` gesetzt.

`intermissionQueued`, `readyToExit`, `exitTime` und die Intermission-Configstring
werden durch `ExitLevel` selbst nicht zusätzlich zurückgesetzt. Das neue
`Level.changemap` bildet den gelöschten Mapzeiger als `void` ab.

## Schnittstellen und Prüfgrenzen

Drei Aufrufe betreffen weiterhin fehlende Spielmodule. Sie sind ausdrücklich
erforderliche Schnittstellen und werden im Referenzharness beobachtet:

| Level-Schnittstelle | Noch fehlendes Spielmodul |
| --- | --- |
| `botInterbreedEndMatchFn(level)` | `BotInterbreedEndMatch`, Bot-Zuchtzustand und Botlib-Arbeit |
| `updateTournamentInfoFn(level)` | `UpdateTournamentInfo`, Baseq3-Einzelspieler-Postgame-Auswertung |
| `spawnVictoryPadsFn(level)` | `SpawnModelsOnVictoryPads`, Podiumsmodelle und Siegesanimationen |

Die beiden Einzelspieler-Aufrufe erfolgen nur bei `GT_SINGLE_PLAYER`, nach dem
Setzen der Intermissionzeit und der Punktsuche. Fehlende Schnittstellen melden
einen Fehler an ihrer Aufrufposition; ein vorhandener Postgame-Aufruf wird vor
der Prüfung der Podiumsschnittstelle ausgeführt. Die Prüfung dieser Reihenfolge
ersetzt keinen Port der dahinterliegenden Spielmodule. Missionpack ist nicht
Gegenstand dieses Schritts.

Davon getrennt bleiben Engine-Aufgaben: `consoleCommandFn` nimmt die
Mapwechsel-/Restart-Befehle entgegen; `cvarSetFn` liefert die tatsächlich
formatierten Sitzungswerte an den Host. `serverCommandFn` übernimmt Scoreboard-
Nachrichten. Diese Zustellungen werden mit ihrer Reihenfolge und ihrem Inhalt
beobachtet. Das tatsächliche Laden einer Map, ein Engine-Neustart, die
Netzwerkübertragung und die Darstellung sind damit noch nicht implementiert.

Die bisherigen isolierten Scores-, ClientSpawn- und Teamchange-/Follow-Prüfungen
behalten ihre bisherigen Übergangs- beziehungsweise Platzierungs-Overrides.
Die neue Intermission-Suite schaltet diese Overrides aus und verwendet die
Default-Aufrufketten. Auch der native `ClientSpawn`-Wrapper verwendet in diesem
Modus den Originalkörper, sodass der Respawn keinen vereinfachten Spawn-Stub
aufruft. Die getrennten Spawn-Think-/Endframe-Aufrufe bleiben beobachtete
Schnittstellen dieser Suite.

Zusätzliche MiniLang-Verträge begrenzen Clientspannen auf 0 bis 64 und lehnen
fehlende Clientobjekte oder erforderliche Anschlüsse ab. Für solche zusätzlichen
Fehlerpfade wird keine native Gleichheit bei ungültigen C-Zugriffen behauptet.
Dieser Schritt belegt keine vollständige Spielbarkeit.

## Nachweis

Prüfaufruf:

```powershell
python scripts/test_intermission.py
```

**85 Szenarien**, **182 Aktionen**, **14.213.657 exakt gleiche 32-Bit-Wörter**,
**503 geordnete Nebenwirkungen** und **57.981.936 Ausgabe-Bytes** stimmen mit C
überein. **18 Laufzeitverträge** ergänzen die gültigen Originalabläufe.

Geprüft werden alle modellierten Clients, PlayerStates, EntityStates und ausgewählte
private/räumliche Felder bei jeder Host-Nebenwirkung und nach jeder Aktion.
Zusätzlich werden Kamera, `changemap`, Restart, beide Clientlimits, Bereitschaft,
Punktelimits, Configstrings und alle 65 Sitzungs-Cvars verglichen. Die Sitzungskopie
verwendet in MiniLang die tatsächliche Cvar-Registry; der native Host modelliert
die Speicherung. Er formatiert seine Beobachtungsmeldung in einem eigenen Puffer,
damit die originalen wechselnden `va`-Puffer nicht überschrieben werden.

Enthalten sind wiederholter Beginn, Zeit null, verbundene und nicht verbundene
aktive Entities, tote Spieler/Zuschauer, Slot 63, leere Clientspannen,
Kameraziel und Spawnpunkt-Fallback, eintretende Clients, Duellpunkte und
Nachrücken, normale Maprotation sowie Bereitschafts-/Punktelimit-Ketten.
Bei einem fehlenden Kameraziel wird auch die ursprüngliche `G_PickTarget`-
Diagnose verglichen. `gamePrintFn` nimmt diese Meldung an; ältere isolierte Hosts
ohne Print-Schnittstelle vergleichen weiterhin keine Diagnoseausgaben.

Test-Binary: `5ee99bc1fa67e847b07935d6968d26371e179e06d6a5c3d640f406f9e0d2f7a1`.
Native x86-Oracle: `bf341634200dbd35e528b1a0316a9699e500a512b4c7f8ac40f08e21017de7a6`.
Einzelbericht: `build/reference/intermission/result.json`.
Die reguläre Gesamtsuite umfasst jetzt 38 Prüfbereiche, die erweiterte 53.
Der aktuelle reguläre Lauf steht in `build/verify-client-commands.log`; die letzte
erweiterte Vollprüfung bleibt bei 43 Gates am Stand `f8cdf9a`.
