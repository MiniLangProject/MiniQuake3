# Client-Befehle, Chat und Spielkommandos

Stand: 2026-09-06. Der vollständige Baseq3-Dispatcher `ClientCommand` und seine
bisher fehlenden Handler sind in MiniLang implementiert. Er übernimmt die vom
Engine-Host bereits zerlegte Argumentliste einschließlich `argv[0]`.

| Original | MiniLang-Datei |
| --- | --- |
| `ClientCommand` | `src/mq3/game/client_commands.ml` |
| `ConcatArgs`, Argumentkopien | `src/mq3/game/command_args.ml` |
| Textchat, Voice, Taunts, `gc`, `where` | `src/mq3/game/chat_commands.ml` |
| Cheats, `give`, `kill`, `teamtask`, `levelshot`, `setviewpos`, `stats` | `src/mq3/game/utility_commands.ml` |
| `Team_GetLocationMsg` | `src/mq3/game/team_status.ml` |
| `Info_RemoveKey`, `Info_SetValueForKey` | `src/mq3/shared/info.ml` |

Die bestehenden Score-, Team-, Follow- und Vote-Handler werden direkt aufgerufen.
Die Implementierung verwendet keine vereinfachte zweite Fassung dieser Spielregeln.
Engine-Tokenizer, Command-Buffer und die Netzwerkzustellung bleiben offen.

## Dispatch und Argumente

Ein noch nicht gebundener Client kehrt vor dem Lesen der Argumente zurück.
`inuse` und Verbindungszustand bilden wie im Original keine zusätzlichen
Dispatcher-Sperren. Die erste Argumentkopie ist auf 1023 Bytes begrenzt; die
Befehlsnamen werden ohne Beachtung der ASCII-Großschreibung verglichen.

Textchat, Voice, Taunts und Scoreboard werden vor der Intermission-Prüfung
verarbeitet. Bei aktiver Intermission wird jeder andere Befehl einschließlich
seines Namens als öffentlicher Chat behandelt. Außerhalb der Intermission
erzeugt ein unbekannter Befehl die ursprüngliche `unknown cmd`-Meldung.
`stats` bleibt eine leere Funktion: Ihr gesamter Originalkörper ist auskommentiert.

`ConcatArgs` behält die vom Host gelieferten Tokengrenzen bei. Es kopiert jedes
Argument mit der ursprünglichen Bytegrenze und prüft die Gesamtlänge vor dem
Anfügen. Deshalb kann ein abgewiesenes späteres Argument ein bereits angefügtes
Leerzeichen hinterlassen. Eingebettete NUL-Bytes werden zusätzlich abgewiesen.

## Textchat und Voice

Textchat vergleicht die ursprüngliche Reihenfolge von Logausgabe, Ortsabfrage,
Namensformatierung, Dedicated-Ausgabe und Empfängerzustellung. Farbsteuerzeichen,
Name- und Nachrichtengrenzen werden als Bytes behandelt. Teamchat fällt in
Nicht-Teamspielmodi auf öffentlichen Chat zurück. Im Duell kann ein Zuschauer
keine Textnachricht an aktive Spieler senden.

Tells verwenden die numerische Zielauswertung des Originals. Der Absender
erhält bei fremdem Ziel eine zweite Zustellung, sofern er kein Bot ist. Die
Ortsabfrage wird dabei erneut ausgeführt. Ortsfarben verändern den ursprünglichen
`count`-Wert durch Begrenzung auf 0 bis 7; Ort und Name können nacheinander eigene
Formatkürzungen und Diagnosen auslösen.

Voice-Kommandos gehören auch zu Baseq3. Ihre Empfängerprüfung unterscheidet sich
vom Textchat: Sie verlangt keinen vollständig verbundenen Client. Im Duell
wird Voice grundsätzlich unterdrückt. Voice-only, Team- und Tell-Modi behalten
ihre jeweiligen Nutzlasten und Echo-Regeln.

Taunts priorisieren den jüngsten tödlichen Gegner, das zuletzt getötete Opfer,
einen ausgezeichneten Teamkameraden und zuletzt die allgemeine Taunt-Nachricht.
Bot-Filter, die 64er-Teamkameradensuche und die Zeitpunkte der Gegner-/Opfer-
Rücksetzungen entsprechen dem Original. Audio und Bot-Reaktionen sind damit
noch nicht implementiert.

`gc` benutzt alle sieben Originalbefehle und eine Zielgrenze von 64 unabhängig
von `level.maxclients`. `where` formatiert `s.origin`, nicht die Kollisionsposition.
Das gemeinsame `entities.vtos` bildet die originale Integerkonvertierung und
den 32-Byte-Formatpuffer ab.

## Spielbefehle und tatsächliche Spielabläufe

`god`, `notarget`, `noclip`, `give` und `levelshot` prüfen zuerst den Cheat-Cvar,
danach die Lebenspunkte. Schalteränderungen erfolgen vor ihrer Antwortnachricht.
`give health` schreibt ausschließlich `ent.health`; das PlayerState-Stat wird
erst durch normale Spielverarbeitung synchronisiert. Waffen, Munition, Rüstung,
`all` und die fünf Auszeichnungszähler übernehmen die Originalregeln samt
32-Bit-Überlauf.

Alle 35 Baseq3-Items werden über ihren Pickup-Namen gesucht. Benannte Items
laufen durch die tatsächliche Entity-Erzeugung, `G_SpawnItem`,
`FinishSpawningItem`, `Touch_Item` und die anschließende Freigabe. CTF- und
Powerup-Regeln bleiben dadurch die vorhandenen Regeln des Item-Ports.

`kill` löscht den God-Schalter, setzt die beiden Gesundheitsfelder auf -999
und führt den echten `player_die`-Pfad aus. `levelshot` beginnt die tatsächliche
Intermission und sendet erst danach `clientLevelShot`.

`setviewpos` prüft Cheats und Argumentzahl, lässt aber wie im Original tote
Spieler zu. Die Zahlen werden über die native-kompatiblen Text-/binary32-Helfer
eingelesen. Die echte Teleportfunktion führt Ereignisse, Unlink/Link und
gegebenenfalls KillBox aus.

`teamtask` verwendet die Identität des persistenten Clientobjekts zur Auswahl
des Userinfo-Slots. Nach dem Lesen und der 1023-Byte-Kopie wird der erste exakt
geschriebene Schlüssel entfernt und der neue Wert vorne angefügt. Die neue
Host-Schnittstelle `userinfoSetFn(level,slot,text)` speichert den Text vor dem
anschließenden echten `ClientUserinfoChanged`. Doppelte Schlüssel, abweichende
Großschreibung, unvollständige Paare und die ursprünglichen Längenprüfungen
bleiben beobachtbar.

Die Spiel-Cvar-Registrierung und jeder Refresh übertragen `sv_cheats` und
`dedicated` über ihre VM-Kopien nach `Level.cheats` und `Level.dedicated`.
Die Cvar-Suite prüft auch ausstehende Änderungen, Rebind und Frame-Refresh.

## Referenz und Grenzen

Die C-Referenz extrahiert die unveränderten Funktionskörper, die `gc_orders`-
Tabelle und die fünf Voice-Strings aus dem festgeschriebenen Originalcheckout.
Die Game-Funktionen laufen mit der ursprünglichen Server-/BSP-Kollision.
Das gemeinsame Harness für Teamwechsel, Follow und Intermission erhält einen
eigenen Commands-Modus; die älteren Vergleichsmodi behalten ihre Prüfumfänge.

Bei jedem Host-Aufruf und nach jeder Aktion werden alle modellierten Clients,
EntityStates und ausgewählte private/räumliche Entity-Felder verglichen.
Hinzu kommen Vote-Zustände, Configstrings, Sitzungs-Cvars, alle Userinfo-Texte,
`nextmap` sowie Ortsnachrichten und Ortsverkettung. Der Userinfo-Host speichert
vor der Beobachtung, damit auch der Zustand während der Zustellung geprüft wird.

Der Commands-Modus beobachtet neben `G_Printf` auch `Com_Printf`. Dadurch werden
Formatdiagnosen langer Chat-/Orts-/Vote-Texte und Info-Längenfehler sichtbar.
Die Startsolid-Diagnose beim Item-Spawning erfolgt vor der Freigabe; der danach
vom Original ausgelöste Fehler wird mit dem bis dahin erreichten Zustand geprüft.
Ältere isolierte Hosts können diese Diagnosen weiterhin ausklammern.

Native undefinierte Fälle werden getrennt behandelt: `gc` akzeptiert im C-Code
versehentlich den Index 7 hinter seiner Tabelle; ungültige Taunt-Zeiger und
Team-Tells ohne Client können unzulässigen Speicher lesen. Exakt 1024 Info-Bytes
würden das abschließende NUL-Byte außerhalb des Puffers schreiben. MiniLang
weist solche Fälle kontrolliert zurück und beansprucht dafür keine C-Parität.
Ein langer überlappender strcpy-Rest bei Info_RemoveKey kann im nativen CRT
zusätzlich undefiniertes Verhalten auslösen; dieser Fall ist kein zugesicherter
Paritätsumfang. Strings besitzen eigenen Speicher; die Aliaswirkung nativer statischer
Textpuffer wird nicht nachgebildet.

Host-Schnittstellen für Serverbefehle, Userinfo, Logausgaben, Cvars und
Konsolenbefehle werden mit exakter Reihenfolge und Nutzlast geprüft. Die
isolierten Spawn-Think-/Endframe-Aufrufe und Bot-/Einzelspieler-Hooks bleiben
beobachtete Grenzen. Netzwerktransport, Engine-Mapausführung, Missionpack und
ein spielbarer Gesamtport sind weiterhin offene Aufgaben.

## Prüflauf

```powershell
python scripts/test_client_commands.py
python scripts/verify.py --data-root D:/Quake3
```

Der Ergebnisbericht liegt unter `build/reference/client_commands/result.json`
und wird zusammen mit den Quellhashes in `docs/reference/evidence.json` archiviert.

## Ergebnisse

`scripts/test_client_commands.py` besteht mit **221 Szenarien**, **687 Aktionen**, **42.518.499 exakt gleichen 32-Bit-Wörtern**, **1.333 geordneten Nebenwirkungen** und **203.944.229 Ausgabe-Bytes**.
**43 Laufzeitverträge** prüfen zusätzliche Speicher-/Schnittstellengrenzen.
Ein originaler Com_Error-Abbruch nach Startsolid beim Item-Give wird
einschließlich Diagnose, Freigabe und erreichtem Teilzustand verglichen.

Der aktuelle Nachweis der regulären und erweiterten Gesamtsuite einschließlich
der CD-Kartenvergleiche steht in [PARITY_AUDIT.md](PARITY_AUDIT.md).

Test-Binary: `0d913cb078cfebe64cc4cf3b1c664901169f16e443c9785a925781b92b91ce97`.
Native x86-Oracle: `bf341634200dbd35e528b1a0316a9699e500a512b4c7f8ac40f08e21017de7a6`.
Fixture-Karte: `22631605b62b568cab3cec99ccfdf71a64ce9964f12b5e4256329ef30a769c3c`.
