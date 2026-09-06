# Follow-Befehle und Duell-Warteschlange

Stand: 2026-09-06. Acht weitere Baseq3-Funktionen sind portiert und mit ihren
tatsächlichen Team-, Todes-, Spawn-, Userinfo- und Rangabläufen gegen C geprüft.

| Original | MiniLang-Einstieg |
| --- | --- |
| `SanitizeString` | `followCommands.sanitize(text)` |
| `ClientNumberFromString` | `followCommands.clientNumber(level,ent,text)` |
| `Cmd_Follow_f` | `followCommands.follow(level,ent,argv)` |
| `Cmd_FollowCycle_f` | `followCommands.cycle(level,ent,direction)` |
| `AddTournamentPlayer` | `tournament.addPlayer(level)` |
| `RemoveTournamentLoser` | `tournament.removeLoser(level)` |
| `RemoveTournamentWinner` | `tournament.removeWinner(level)` |
| `AdjustTournamentScores` | `tournament.adjustScores(level)` |

Die Implementierungen liegen in `src/mq3/game/follow_commands.ml` und
`src/mq3/game/tournament.ml`. `argv` enthält den Befehlsnamen und die bereits
zerlegten Argumente. Die vollständige [ClientCommand-Verteilung](CLIENT_COMMANDS.md) ist separat portiert und geprüft.

## Zielsuche und Follow

Eine führende Ziffer aktiviert die ursprüngliche `atoi`-Slotsuche, einschließlich
akzeptierter Restzeichen. Der Slot muss innerhalb von `level.maxclients` liegen
und vollständig verbunden sein. Die Namenssuche verwendet den ersten vollständig
verbundenen Treffer. Fehlermeldungen gehen an den Entity-Slot des Aufrufers.

`SanitizeString` überspringt ESC (Byte 27) zusammen mit dem folgenden Byte,
entfernt Steuerzeichen unter 32 und normalisiert ASCII-Großbuchstaben. Wegen
vorzeichenbehafteter x86-`char`-Werte entfernt es auch Bytes ab 128. `^`-Farbcodes
und Byte 127 bleiben erhalten. Diese Unterschiede zur Vote-Namensreinigung sind
direkt gegen C geprüft.

`follow` beendet bei einer Argumentzahl ungleich zwei eine bestehende Verfolgung.
Bei gültigem Ziel schließt es Selbstverfolgung und andere Zuschauer aus, zählt
gegebenenfalls zuerst eine Tournament-Niederlage und führt den tatsächlichen
Wechsel zu Zuschauern aus. Danach setzt es das konkrete Ziel. Die Fünf-Sekunden-
Sperre des `team`-Befehls gilt hier wie im Original nicht.

Die zyklische Auswahl zählt ebenfalls zuerst eine mögliche Niederlage. Ihr
Teamwechsel hängt am Zuschauerzustand `SPECTATOR_NOT`, nicht am Team. Erst danach
prüft sie die Richtung. Sie sucht vorwärts oder rückwärts nach vollständig
verbundenen Nicht-Zuschauern. Negative automatische Follow-Ziele und 32-Bit-
Grenzen sind im Referenzvergleich enthalten.

`SpectatorThink` ruft beim neuen Druck auf die Angriffstaste standardmäßig den
portierten Zyklus auf. `followCycleFn` erlaubt weiterhin einen Test-Override.
Gehaltene Taste, Loslassen und erneutes Drücken sind mit tatsächlichem
`SpectatorThink` und Pmove verglichen.

## Nachrücken und Duellpunkte

`AddTournamentPlayer` arbeitet bei weniger als zwei spielenden Clients außerhalb
der Intermission. Es wählt den vollständig verbundenen Zuschauer mit der kleinsten
Zuschauerzeit; bei Gleichstand gewinnt der frühere Slot. Scoreboard-Clients und
negative Follow-Ziele sind ausgeschlossen. Vor `SetTeam("f")` setzt es Warmup
auf −1. Kapazitätsgrenzen gelten weiterhin im tatsächlichen Teamwechsel.

`CheckTournament` verwendet diesen Ablauf jetzt standardmäßig; `tournamentAddFn`
bleibt als Test-Override erhalten. Auswahl, Userinfo, Begin/Spawn, Rangberechnung,
Countdown und angeforderter Maprestart sind zusammenhängend verglichen.

Gewinner-/Verliererentfernung verlangt genau zwei spielende Clients und einen
vollständig verbundenen Client im jeweiligen Rangslot. Die Punktefunktion prüft
dagegen nur die Verbindungszustände: erst Sieg, dann Niederlage, jeweils mit
echtem Userinfo-Update. Dieselbe Person in beiden Rangslots und Ganzzahlüberläufe
sind getestet. Die automatische Einbindung dieser Helfer in `BeginIntermission`
und `ExitLevel` ist im [Intermission-Port](INTERMISSION.md) umgesetzt und wird
dort mit eigenständigen Ablauffolgen geprüft.

## Nachweis und Grenzen

```powershell
python scripts/test_follow_tournament.py
python scripts/test_follow_tournament.py --case loser_then_next_player
```

**192 Szenarien**, **331 Aktionen**, **28.312.377 exakt gleiche 32-Bit-Wörter**,
**1.034 geordnete Nebenwirkungen** und **115.548.855 Ausgabe-Bytes** stimmen mit
den unveränderten Originalkörpern überein. Bei jedem Host-Aufruf und jeder Aktion
werden alle modellierten Clients, PlayerStates, EntityStates und ausgewählte
private/räumliche Felder verglichen. Warmup, Ränge, Leichen und Configstrings sind
eingeschlossen. **Vier originale Fehlerabbrüche** vergleichen auch den Zustand
nach allen Nebenwirkungen vor der ungültigen Richtungsangabe.

**23 Laufzeitverträge** prüfen Bindungen, Puffer-/Slotgrenzen und drei bewusst
begrenzte Originalprobleme: Ein abschließendes ESC liest über den C-String hinaus;
eine leere Clientspanne kann ungültige Zugriffe auslösen; ein ungültiger Startslot
ohne verfügbares Ziel kann endlos suchen. MiniLang meldet dafür Fehler. Bei
regulärem Startslot ohne Kandidaten bleibt die Verfolgung wie in C unverändert.
Für die zusätzlichen Fehlerpfade wird keine native Verhaltensgleichheit behauptet.

Die üblichen Spawn-Think-/Endframe- und Intermission-Callbacks werden in dieser
Suite beobachtet; die Angriffstastenfälle führen `SpectatorThink` und Pmove
tatsächlich aus. Die Intermission-Suite prüft die tatsächlichen Übergangsfunktionen.
Bot-/Engine-Zustellung, Engine-Mapausführung,
Netzwerk und Missionpack bleiben offen. Der aktuelle Nachweis der regulären
und erweiterten Gesamtsuite steht in [PARITY_AUDIT.md](PARITY_AUDIT.md).

Test-Binary: `0d913cb078cfebe64cc4cf3b1c664901169f16e443c9785a925781b92b91ce97`.
Native x86-Oracle: `bf341634200dbd35e528b1a0316a9699e500a512b4c7f8ac40f08e21017de7a6`.
Einzelbericht: `build/reference/follow_tournament/result.json`.
