# Punkte, Ranglisten, Scoreboards und Matchende

Dieser Abschnitt von Schritt 6 überträgt die ursprünglichen Baseq3-Regeln für
Punktevergabe, Client-Rangfolge, Scoreboard-Nachrichten und Matchende-Entscheidungen.
Die Funktionen laufen in MiniLang; unveränderte C-Funktionskörper liefern die
Vergleichsergebnisse. Die Einbindung in [`player_die`](DEATHS.md) ist inzwischen
ebenfalls exakt verglichen. Item-Pickups und CTF-Capture verwenden diese
Punkte-/Ranglistenpfade inzwischen in ihrer eigenen C-Differenzsuite. Client- und
Game-Frames sind separat portiert. Netzwerktransport und tatsächliche
Kartenwechsel durch die Engine bleiben offen.

## Schnittstellen und Originalfunktionen

| MiniLang in `game/scores.ml` | Original |
| --- | --- |
| `scorePlum`, `addScore` | `ScorePlum`, `AddScore` |
| `compareRanks`, `calculateRanks` | `SortRanks`, `CalculateRanks` |
| `scoreboard`, `commandScore`, `sendAll` | `DeathmatchScoreboardMessage`, `Cmd_Score_f`, `SendScoreboardMessageToAllClients` |
| `scoreIsTied`, `checkExitRules` | `ScoreIsTied`, `CheckExitRules` |
| `logExit`, `checkIntermissionExit` | `LogExit`, `CheckIntermissionExit` |

`level.clients` enthält 64 voneinander unabhängige Client-Zustände. Eine aktive
Entity wird mit `game.bindClient(level, ent, client)` an ihren Zustand gebunden.
Freigeben der Entity löscht ihre Client-Referenz, behält aber den separaten
Client-Zustand wie das ursprüngliche `level.clients`-Array. `level.maxclients`
und der Cvar-Wert `level.maxclientsCvar` bleiben getrennt, weil die Funktionen
unterschiedliche Schleifengrenzen verwenden.

`level.spawner` stellt die vorhandenen Spielmodus-, Warmup- und Configstring-Felder
bereit. Die neuen Felder umfassen Teamscores, sortierte Client-Indizes,
Client-/Wählerzahlen, Follow-Auswahl, Matchlimits und Intermission-Bereitschaft.
Zeitwerte und Punktesummen behalten das geprüfte native 32-Bit-Verhalten.

| Callback | Vertrag |
| --- | --- |
| `level.serverCommandFn(level, recipient, text)` | Vollständiger Serverbefehl; Empfänger −1 bedeutet Broadcast |
| `level.gameLogFn(level, text)` | Fertig formatiertes Nutzargument eines `G_LogPrintf`-Aufrufs |
| `level.matchTransitionFn(level, kind)` | Optionaler Override: `1` für `BeginIntermission`, `2` für `ExitLevel` |

Ohne Übergangs-Override ruft `matchBoundary` die portierten
[`intermission.begin` und `intermission.exitLevel`](INTERMISSION.md) auf.
Benötigte ServerCommand- und Game-Log-Schnittstellen bleiben Pflicht; fehlen sie,
entsteht ein kontrollierter Fehler. Der isolierte Testhost zeichnet weiterhin
die Übergangsargumente auf. Zwei gesonderte Fälle verändern im Override gezielt
`intermissiontime`, um die anschließende Abfrage in `CalculateRanks` zu prüfen.
Die zusätzliche Intermission-Suite verwendet die tatsächlichen Game-Übergänge.
Zeitstempel, Dateiausgabe und Dedicated-Console-Ausgabe von
`G_LogPrintf` sind ebenfalls noch nicht enthalten; geprüft werden seine
formatierten Nutztexte an der Aufrufgrenze.

## Punkte und Rangfolge

`AddScore` kehrt bei fehlendem Client oder aktivem Warmup ohne Änderung zurück.
Ansonsten entsteht zuerst die temporäre Score-Plum-Entity. Nach deren Link
werden `SVF_SINGLECLIENT`, Empfänger, Punktwert und betroffener Client gesetzt.
Der Empfänger stammt aus `ent.s.number`; ein Scoreboard verwendet dagegen den
Entity-Slot. Die Tests unterscheiden diese beiden Werte ausdrücklich.

Nur `GT_TEAM` addiert den Wert zusätzlich zu `level.teamScores`. Den Teamindex
liefert dabei `ps.persistant[PERS_TEAM]`, nicht `sessionTeam`. Anschließend
werden Ränge, Follow-Clients und Wählerzahlen neu berechnet, die beiden
Score-Configstrings gesetzt und die Matchende-Regeln geprüft.

Die Client-Reihenfolge berücksichtigt besondere Zuschauer, verbindende Clients,
normale Zuschauer mit ihrer Wartezeit und schließlich Punkte. Gleiche Scores
erzeugen das ursprüngliche `RANK_TIED_FLAG`; im Einzelspielermodus erhält auch
der einzige aktive Spieler dieses Flag. Teamränge beschreiben für alle
verbundenen Clients den roten Sieg, blauen Sieg oder Gleichstand. Bot-Flags
beeinflussen Wahlberechtigung, nicht die Zahl aktiver Spieler.

### Festgelegtes Sortierprofil

Die native Referenz verwendet das Windows-UCRT-`qsort`. Dessen Verhalten bei
gleichen Werten ist nicht stabil, und der ursprüngliche `SortRanks`-Vergleich
liefert für zwei verbindende oder besondere Clients kein symmetrisches Ergebnis.
Ein beliebiger Ersatz-Sortierer könnte deshalb trotz gleicher Punkte andere
Client-Indizes an den Anfang stellen.

`game/rank_sort.ml` bildet den Vergleichs- und Partitionierungsablauf dieses
nativen Profils auf Client-Indizes ab. Geprüft werden beide Sortierzweige an
der Grenze acht/neun, Arrays bis 64 Clients, Gleichstände und alle verbindenden
bzw. besonderen Clients. SDK-Version, Hash der lokal herangezogenen
`ucrt/stdlib/qsort.cpp`, Compiler-Hash und Hash der statischen UCRT-Bibliothek
stehen im Ergebnisbericht. Es wird keine C-Sortierfunktion in die
MiniLang-Spielimplementierung eingebunden.

Das ist ein Nachweis für das festgelegte native Windows-Profil. Die separate
`qsort`-Implementierung der ursprünglichen QVM-Laufzeit ist damit nicht portiert
oder als reihenfolgegleich abgenommen.

### Ursprünglicher Überlauf beim Zurücksetzen der Wählerzahlen

`CalculateRanks` setzt im Original vier `numteamVotingClients`-Einträge zurück,
obwohl `g_local.h` nur zwei definiert. Im geprüften nativen Speicherlayout
löschen die beiden zusätzlichen Schreibzugriffe `level.spawning` und
`level.numSpawnVars`. Das ist undefiniertes C-Verhalten; für andere Compiler,
Optimierungen oder Speicherlayouts wird keine Gleichheit behauptet.

MiniLang besitzt genau zwei Team-Wählerzähler und bildet die beobachteten
Nebenwirkungen durch ausdrückliches Zurücksetzen des Spawn-Flags und der
aktiven Spawnvariablen ab. Es erfolgt kein Zugriff außerhalb eines Arrays.
Der Referenzadapter prüft die betroffenen Feldabstände beim Kompilieren und
liest nur die beiden gültigen Zähler. Ein gesondertes Szenario setzt vorher
Spawn-Flag und Variablenzahl, prüft deren Löschung und den unveränderten
Zeichenzähler mit beiden Spielmoduszweigen.

## Nachrichten und Matchende

Das Scoreboard enthält die ursprünglichen 14 Ganzzahlfelder pro Spieler:
Clientnummer, Score, Ping, Minuten, Scoreflags, Powerup-Bits, Genauigkeit,
Auszeichnungen, Perfect-Flag und Captures. Verbindende Clients erhalten Ping −1;
andere Pings werden nur nach oben auf 999 begrenzt. Genauigkeit und Minuten
verwenden Division mit Abschneiden gegen null. Multiplikation und Subtraktion
behalten das native 32-Bit-Verhalten des geprüften Builds.

Die Grenze von 1.024 Bytes gilt für den zusammengesetzten Eintragstext und
schließt den `scores ...`-Kopf nicht ein. Nur vollständige Einträge werden
übernommen. Die Tests decken insbesondere exakt 1.024 und 1.025 Bytes ab.
Beim Versenden an alle werden nur vollständig verbundene Clients ausgewählt.

`CheckExitRules` verarbeitet zuerst eine laufende Intermission, dann eine
bereits angekündigte Intermission. Nach 1.000 ms wird deren Queue-Wert vor dem
Aufruf von `BeginIntermission` beziehungsweise seinem Test-Override gelöscht.
Ohne Intermission verhindert ein Gleichstand mit
mindestens zwei aktiven Spielern jedes Limit-Ende: Sudden Death hat Vorrang.
Danach folgen Zeitlimit, Mindestspielerzahl, Fraglimit und Capturelimit in der
ursprünglichen Reihenfolge. Ein Warmup blockiert das Zeitlimit; Frag- und
Capturelimit besitzen hier keine zusätzliche Warmup-Prüfung.

`LogExit` protokolliert den Grund, setzt Queue-Zeit und Intermission-Configstring
und betrachtet höchstens die ersten 32 sortierten Clients für Score-Logzeilen.
Zuschauer und verbindende Clients werden dabei übersprungen. Bei einem
individuellen Fraglimit erscheint die Logfolge vor der öffentlichen Meldung;
bei Team- und Zeitlimits ist die Reihenfolge umgekehrt.

`CheckIntermissionExit` überspringt den Einzelspielermodus. In anderen Modi
zählen verbundene Nicht-Bots einschließlich Zuschauern für die Bereitschaft.
Die Bot-Abfrage verwendet `ps.clientNum`; die Ready-Maske enthält nur Slots
unter 16, wird aber an alle verbundenen Clients geschrieben. Vor fünf Sekunden
findet kein Übergang statt. Sind alle bereit, erfolgt er sofort danach; ist
niemand bereit, wird der Timer zurückgesetzt. Andernfalls beginnt mit dem ersten
bereiten Client die Frist von zehn Sekunden.

## Nachweis und offene Integration

```powershell
python scripts/test_scores.py
```

Der Runner vergleicht nach jeder Aktion alle 64 vollständigen Client-PlayerStates,
die neuen Client-/Level-Felder, Entity-Zustände, Empfänger, Texte, Configstrings
und Übergangsargumente. Die C-Referenz verwendet Originalfunktionen und ihr
tatsächliches `qsort`; die Nachrichten und Übergänge werden beobachtet.
Ergebniszahlen und Build-Hashes stehen in [PARITY_AUDIT.md](PARITY_AUDIT.md)
und `reference/evidence.json`.

Die Prüfung umfasst bis zu 64 Clients, sortierte und zufällige Zustände,
Client-Neubindung, Warmup, Score-Überlauf, Bots, Zuschauer, Scoreboard-Limits,
Sudden Death, Limit-Priorität, Zeitgrenzen und Callback-Reihenfolgen. Zwölf
Laufzeitverträge prüfen Speicherbindung und kontrollierte Fehler. Insbesondere
werden Division durch null, `INT_MIN / -1` und ungültige Client-Indizes nicht
als definierte C-Parität ausgegeben.

Spieler-Tod, Team-Fragboni, Drop-Entscheidungen und der Respawn-Wrapper rufen diese
Bausteine inzwischen auf. [Vote-Aufrufe, Stimmabgabe und Auflösung](VOTES.md)
sowie die [G_RunFrame-Steuerung](FULL_FRAME.md) sind separat geprüft.
[`BeginIntermission`, `MoveClientToIntermission` und `ExitLevel`](INTERMISSION.md)
sind inzwischen portiert und standardmäßig angebunden. Die neue
`scripts/test_intermission.py` verbindet die Matchende-Regeln mit den echten
Respawn-/Spawn-, Follow-, Duell- und Sitzungsabläufen. Bot-Interbreeding und die
Singleplayer-Nachbereitung benötigen weiterhin Host-Schnittstellen.
Netzwerkzustellung, Scoreboard-Grafik, der tatsächliche Engine-Kartenwechsel
und die vollständige Serverintegration bleiben offen.
Ein vollständig spielbarer MiniQuake3-Client/Server steht noch aus.
