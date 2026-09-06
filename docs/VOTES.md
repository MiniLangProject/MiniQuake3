# Abstimmungen und Teamleiter

Stand: 2026-09-05. `src/mq3/game/vote_commands.ml` portiert die vier Baseq3-
Befehlshandler `Cmd_CallVote_f`, `Cmd_Vote_f`, `Cmd_CallTeamVote_f` und
`Cmd_TeamVote_f`. `src/mq3/game/votes.ml` portiert die unveränderten Baseq3-Regeln
von `CheckVote`, `CheckTeamVote`, `PrintTeam`, `SetLeader` und `CheckTeamLeader`
aus `g_main.c`. Globale und rote/blaue Team-Abstimmungen laufen in `G_RunFrame`
an ihren ursprünglichen Positionen nach dem Teamstatus und vor `CheckCvars`.

Globale Votes planen einen angenommenen Befehl für 3.000 ms später ein. Die
Ausführung erfolgt erst bei strikt größerer Levelzeit, auch wenn inzwischen eine
weitere Abstimmung läuft. Team-Votes führen den Befehl sofort aus oder rufen den
portierten Teamleiterwechsel auf. Die drei Vote-Configstrings werden zum
ursprünglichen Zeitpunkt geleert.

Bewahrt werden die beobachtbaren Besonderheiten des Originals:

- Ja braucht mehr als die ganzzahlige Hälfte; Nein braucht mindestens diese
  Hälfte. Bei ungeraden Spielerzahlen und bei null Stimmberechtigten ist dieser
  Unterschied sichtbar. Nach 30.000 ms hat der Timeout Vorrang vor einer Mehrheit.
- Team-Vote-Ergebnisse gehen an Empfänger `-1`. `PrintTeam` richtet dagegen jede
  Meldung an die einzelnen Teamslots und filtert dabei keine getrennten Clients.
- Ein Teamleiterwechsel meldet alte Leiter erst ab, aktualisiert danach den
  gewählten Leiter und sendet anschließend die Teamnachricht. Ein inzwischen
  getrennter oder zum anderen Team gewechselter Kandidat beendet trotzdem den
  bereits angenommenen Vote, mit der ursprünglichen Fehlermeldung.
- Der `leader`-Präfix ist groß-/kleinschreibungsabhängig; die Kandidatennummer
  wird ab Byte 7 mit der ursprünglichen CRT-`atoi`-Semantik gelesen.
- `CheckTeamLeader` führt beide ursprünglichen Suchschleifen aus. Steht ein Bot
  vor dem ersten menschlichen Mitglied, können beide Leiter werden. Diese
  automatische Wahl ruft im Original keine Userinfo-Aktualisierung auf.
- Zeitdifferenzen und die Ausführungszeit verwenden das geprüfte native
  32-Bit-Profil einschließlich Überlauf und der Bedeutung von Zeitwert null.

`scripts/test_votes.py` prüft **211 Szenarien**, **241 Aktionen**, **85.655 exakt
gleiche 32-Bit-Wörter** und **456 geordnete Nebenwirkungen** in **363.153 Bytes**.
Der Referenzhost extrahiert die fünf Funktionskörper unverändert. Er zeichnet
Konsolen-/Serverbefehle, Configstrings und `ClientUserinfoChanged` auf. Vor
Server-/Konsolenbefehlen und Userinfo-Aufrufen werden auch die aktuellen
Vote-Zeiten verglichen; nach jeder Aktion folgen sämtliche Vote-Felder,
Configstrings und Team-/Verbindungs-/Leiterdaten aller 64 Clients.

Die Fälle enthalten 168 Mehrheitskombinationen für globale und beide Team-Votes,
Timeout-/Ausführungsgrenzen, verkettete Frames, native Integergrenzen,
1.023-Byte-Befehle, Kandidatenfehler, Clientlimit und Slot 63. Elf ergänzende
Laufzeitverträge prüfen unter anderem Pflichtschnittstellen und unabhängige
Zustandsarrays. Ungültige Kandidaten außerhalb der 64 Slots, überlange oder
eingebettete NUL enthaltende Befehle sowie ein `leader`-Text ohne Byte 7 werden
kontrolliert abgewiesen. Unsichtbare Restbytes hinter einem C-String werden
nicht als MiniLang-Stringzustand modelliert.

Die Frame-Fälle führen inzwischen auch den portierten Teamstatus und
`CheckCvars` aus. Ihre früheren Testmarker entfallen; die tatsächliche
`g_needpass`-Ausgabe wird verglichen. Dadurch ändern sich Wort-/Effektzahlen
bei unverändertem Vote-Szenarienumfang.

Test-Binary: `3b0e70c699336b23f1cf8ba97f5372bdaa2313c9a795ed93f976633f347713b0`.
Native x86-Oracle: `bf341634200dbd35e528b1a0316a9699e500a512b4c7f8ac40f08e21017de7a6`.

```powershell
python scripts/test_votes.py
python scripts/test_votes.py --case frame_votes_and_delayed_command
```

Die isolierte Suite beobachtet `ClientUserinfoChanged` über einen ausdrücklichen
Override. Der normale Leiterwechsel führt jetzt die portierte
[Userinfo-Verarbeitung](CLIENT_INFO.md) aus; deren separate Suite prüft die
vollständige Team-Vote-Folge einschließlich Spieler-Configstrings.
Server- und Konsolenbefehle enden an expliziten Host-Schnittstellen.
Die Engine führt die im Test beobachteten Befehle nicht aus.
Die Aufruf-/Stimmhandler `Cmd_CallVote_f`, `Cmd_Vote_f` und ihre Team-Pendants
sind inzwischen separat geprüft, wie nachfolgend beschrieben.
[`ClientConnect` und Sitzungs-Persistenz](CLIENT_CONNECT.md) sind inzwischen
separat portiert. [Teamwechsel und `ClientDisconnect`](TEAM_CHANGES.md) sind
ebenfalls geprüft, einschließlich der tatsächlichen Leiter-/Userinfo-Abläufe.
Im Frame erfolgt wie im Original ausschließlich die Vote-Auflösung.

## Aufrufe und Stimmabgabe

Die MiniLang-Einstiegspunkte heißen `callVote`, `castVote`, `callTeamVote` und
`castTeamVote`. Sie erhalten Level, Caller-Entity und die bereits tokenisierte
Argumentliste einschließlich Befehlsname an Position null. Beispiele:

```minilang
voteCommands.callVote(level,level.entities[0],["callvote","map","q3dm1"])
voteCommands.castVote(level,level.entities[1],["vote","yes"])
voteCommands.callTeamVote(level,level.entities[0],["callteamvote","leader","Team","Mate"])
```

`cvars.register`/`cvars.update` versorgen `level.allowVote` aus `g_allowVote`.
Für `map` und `nextmap` wird der aktuelle Text direkt aus
`level.spawner.cvars` gelesen. Map-Votes erhalten die bisherige Rotation über
`set nextmap`; Ausführungstext und sichtbarer Vote-Text werden getrennt gehalten.
Alle zwölf Vote-Configstrings haben die ursprünglichen Indizes und Schreibfolgen.

Auch hier bleiben die beobachtbaren Originalregeln erhalten:

- `g_allowVote`, laufender Vote, Aufruflimit und Zuschauerstatus werden in dieser
  Reihenfolge geprüft. Team-Aufrufe verlassen zuvor den Handler lautlos, wenn
  der Caller keinem roten/blauen Team angehört. Eine deaktivierte `g_allowVote`
  blockiert die Stimmabgabe in einem bereits laufenden Vote nicht.
- Beide Aufrufhandler prüfen ein Limit von drei Aufrufen, erhöhen die
  gespeicherten Aufrufzähler aber selbst nicht. Eine erfolgreiche Initiierung
  setzt die Stimmen auf Ja=1/Nein=0 und markiert den Caller automatisch.
- Die ursprüngliche Ja-Prüfung liest kleines `y` an Byteposition 0, großes
  `Y` und `1` dagegen an Position 1. Daher zählen `y`, `yes`, `xY` und `x1`
  als Ja; `Y`, `Yes` und `1` zählen als Nein. Kurze Argumente werden wie
  `Q_strncpyz` mit Nullbytes ergänzt.
- Ein zur Ausführung vorgemerkter Alt-Vote wird nach der erlaubten
  Befehlsnamenprüfung sofort ausgegeben, bevor ungültiger Spielmodus oder
  fehlende `nextmap` einen neuen Aufruf noch ablehnen können.
- Globale Calls lesen nur Argumente 1 und 2. Team-Calls verbinden sämtliche
  Argumente ab Position 2 mit Leerzeichen. Die Semikolonprüfung erfolgt nach
  den originalen Bytekopien; Anführungszeichen und Zeilenumbrüche werden nicht
  zusätzlich normalisiert. Ausgabe-Texte werden wie `Com_sprintf` auf 1.023
  Bytes begrenzt; dessen reine Überlaufdiagnose ist kein Vergleichsereignis.
- Teamleiter werden über Slots oder bereinigte Namen gesucht. Schon drei
  führende Ziffern wählen den numerischen Pfad, auch mit nachfolgendem Text.
  Dieser prüft Slot und `inuse`; der Namenspfad prüft Verbindung und Team,
  entfernt Farbcodes/nicht druckbare Bytes und ignoriert ASCII-Großschreibung.
  Ohne Kandidat wird `ps.clientNum` verwendet.
- Der Aufruftext wird vor dem Zurücksetzen von Stimmen/Flags gesendet.
  Globale Calls löschen nur `EF_VOTED` unterhalb `level.maxclients`, Team-Calls
  nur `EF_TEAMVOTED` in diesem Team. Andere Bits bleiben erhalten.

`scripts/test_vote_commands.py` besteht mit **337 Szenarien**, **428 Aktionen**,
**967.073 exakt gleichen 32-Bit-Wörtern**, **1.149 geordneten Nebenwirkungen**
und **4.319.535 Ausgabe-Bytes**. Der Host extrahiert die vier Spiel-Funktionskörper,
die Spielmodusnamen und `Cmd_Argc`/`Cmd_Argv`/`Cmd_ArgvBuffer` unverändert.
Jede Server-/Konsolen-/Userinfo-Grenze und jeder Configstring-Schreibvorgang
vergleicht den vollständigen Vote-Zustand, die relevanten Daten aller 64
Clients sowie alle zwölf Configstrings; dieselbe Prüfung folgt nach jeder Aktion.

Die Folgen enthalten Aufruf → Stimmabgabe → Auflösung → fällige Ausführung,
erneute Calls, gleichzeitige globale/rote/blaue Votes, Kandidatenwechsel und
Trennung, Berechtigungsprioritäten, native Integergrenzen, Byte-Trunkierung
einschließlich Mehrbyte-Texten sowie Clientlimit null und Slot 63.
**19 ergänzende Laufzeitverträge** prüfen fehlende Schnittstellen, ungültige
Bindings/Limits, NUL-Zeichen und die tatsächliche Cvar-Integration samt Refresh
und Modul-Rebind. Ist der originale Teamargument-Puffer voll und ein weiteres
Argument würde `strcat` überlaufen lassen, gibt MiniLang einen kontrollierten
Fehler zurück. Dieses undefinierte C-Speicherschreiben wird nicht ausgeführt.

Test-Binary: `6859b8cd50552742b31c50fbb5579cc235fb0bd24bed893aa53e688274ea196b`.
Native x86-Oracle: `bf341634200dbd35e528b1a0316a9699e500a512b4c7f8ac40f08e21017de7a6`.

```powershell
python scripts/test_vote_commands.py
python scripts/test_vote_commands.py --case global_call_cast_resolve_execute
```

Die vollständige [ClientCommand-Verteilung](CLIENT_COMMANDS.md) samt Chat während
der Intermission ist inzwischen portiert und gegen C geprüft. Engine-Kommando-
Tokenisierung, Netzwerkzustellung und die tatsächliche Ausführung des
Konsolenbefehls bleiben offen. Diese vier Handler bilden den Vote-Teil. Im nativen Testhost ist die
`nextmap`-Abfrage eine gespeicherte Engine-Antwort; MiniLang nutzt bereits die
tatsächliche portierte Registry. Die isolierte Befehlssuite verwendet ebenfalls
den beobachteten `ClientUserinfoChanged`-Override. Den realen Standardpfad und
seine Einbindung in beide Team-Votes prüft `test_client_info.py`.
