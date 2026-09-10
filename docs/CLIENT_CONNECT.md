# Spieleranmeldung und Sitzungsdaten

Stand: 2026-09-05. `src/mq3/game/client_connect.ml` portiert den Baseq3-Körper
von `ClientConnect`. `src/mq3/game/session.ml` überträgt alle fünf Funktionen
aus `g_session.c` sowie `BroadcastTeamChange` aus `g_cmds.c`. Teamwahl,
Userinfo-Verarbeitung und Rangberechnung laufen bereits als echte Portierungen.

## Anmeldung

`clientConnect.connect(level,slot,firstTime,isBot)` liefert bei Erfolg `void`,
sonst den originalen Ablehnungstext. Die Engine liefert zuerst höchstens
1.023 Userinfo-Bytes. Die IP-Filterentscheidung kommt vor der Passwortprüfung.
Eine IP- oder Passwortablehnung verändert die vorhandenen Clientdaten nicht.

Die Passwortausnahme prüft das bereits vorhandene Entity-Flag `SVF_BOT`,
nicht das Argument `isBot`. Ebenso befreit ausschließlich die exakte
IP-Zeichenfolge `localhost` von der Prüfung. Leeres Serverpasswort oder
ASCII-groß-/kleinschreibungsunabhängig `none` lässt den Client passieren;
das eigentliche Passwort muss dagegen exakt übereinstimmen.

Danach bindet der Ablauf den persistenten Clientslot und setzt alle 66
modellierten Clientfelder einschließlich des gesamten PlayerState zurück.
Das Clientobjekt selbst behält seine Identität. Auf `CON_CONNECTING` folgen
gegebenenfalls Sitzungsinitialisierung und anschließend immer das Lesen der
Sitzung. Bei Bots werden Entity-Flag und Aktivität vor der Bot-Einrichtung
gesetzt. Deren Fehlschlag liefert `BotConnectfailed` und bewahrt diese bereits
vorgenommenen Änderungen, wie C.

Es folgen Connect-Log, echte `ClientUserinfoChanged`-Verarbeitung, gegebenenfalls
die erste Verbindungsnachricht, Teamnachricht und echte `CalculateRanks`-Ausführung.
Auch Rang-Configstrings und Scoreboards während der Intermission werden geprüft.
Der spätere Engine-Aufruf von [`ClientBegin`](CLIENT_BEGIN.md) bleibt ein
separater, bereits portierter Eintrittspunkt.

## Sitzungsablauf

| MiniLang | Original |
| --- | --- |
| `sessions.writeClient` | `G_WriteClientSessionData` |
| `sessions.readClient` | `G_ReadSessionData` |
| `sessions.initClient` | `G_InitSessionData` |
| `sessions.initWorld` | `G_InitWorldSession` |
| `sessions.writeWorld` | `G_WriteSessionData` |
| `sessions.broadcastTeamChange` | `BroadcastTeamChange` |

`session0` bis `session63` speichern sieben ganze Zahlen: Team, Zuschauerzeit,
Zuschauerstatus, beobachteter Clientslot, Siege, Niederlagen und Teamleiterwert.
Die Cvar `session` speichert den Spielmodus. Lesen verwendet dieselbe native
CRT-`%i`-Konvertierung wie C, einschließlich Hex-/Oktalnotation, Überläufen und
zulässigen Restzeichen. Auch ein nicht auf 0 oder 1 normalisierter Leiterwert
bleibt bei erneutem Speichern und im Spieler-Configstring erhalten.

Neue Teamsitzungen starten als Zuschauer, solange `g_teamAutoJoin` aus ist.
Bei aktivierter Automatik entscheidet der portierte `PickTeam`-Ablauf und sendet
sofort eine Teamnachricht. Innerhalb von `ClientConnect` geschieht dies vor dem
Einlesen des Spielernamens; später folgt dort eine zweite Teamnachricht mit Namen.
Andere Modi beachten ein kleines `s` am Anfang des Teamwerts, die Tournament-
Grenze von zwei Spielern beziehungsweise `g_maxGameClients`. Verbindende Clients
zählen bei der Teamwahl und den vorhandenen Spielerkapazitäten bereits mit.
`g_teamAutoJoin` und `g_maxGameClients` werden durch die registrierten VM-Cvars
und deren normale Aktualisierung versorgt.

`initClient` setzt Team, Zuschauerstatus und Zeit; andere bestehende Sitzungswerte
bleiben erhalten. `initWorld` setzt `newSession` bei einem geänderten Spielmodus,
löscht ein bereits gesetztes Flag bei Übereinstimmung aber nicht. `writeWorld`
schreibt zuerst den Spielmodus und danach ausschließlich vollständig verbundene
Clients unterhalb von `level.maxclients`.

Der normale Lesepfad greift auf `level.spawner.cvars` zu. `cvarStringFn` erlaubt
eine beobachtete Engine-Lesegrenze; `cvarSetFn` wird durch die bestehende
Cvar-Modulanbindung bereitgestellt. Beim Aufbau eines neuen Levels muss die
Engine dieselbe Registry übernehmen. Die Tests bauen das Level neu auf und
verbinden anschließend anhand der erhaltenen Sitzungswerte erneut.

## Nachweis und Grenzen

```powershell
python scripts/test_client_connect.py
python scripts/test_client_connect.py --case shutdown_reset_reconnect
```

**268 Szenarien**, **377 Aktionen**, **26.734.597 exakt gleiche 32-Bit-Wörter**,
**1.771 geordnete Nebenwirkungen** und **111.455.661 Ausgabe-Bytes** sind gegen
die unverändert extrahierten Originalfunktionen geprüft. Jeder Host-Aufruf und
jede Aktion vergleicht sämtliche modellierten Clientfelder aller 64 Slots,
einschließlich aller 117 PlayerState-Wörter, sowie Bindungen, Sitzungs-Cvars,
Ränge und Spieler-/Score-Configstrings. Nicht betroffene Felder tragen zuvor
gezielte Kontrollwerte, sodass ein unvollständiger Reset sichtbar wird.

Die Fälle umfassen Ablehnungspriorität, Bot-/Passwortkombinationen, Erst- und
Wiederverbindung, automatische Teams, Kapazitäten, Sitzungs-Rundläufe,
Ganzzahlgrenzen, Namens-/Userinfo-Puffer, Slot 63, Clientlimit null,
Spielmoduswechsel und Schreiben → Level-Neuaufbau → Wiederverbindung.
**27 Laufzeitverträge** ergänzen Bindungen, Pflichtschnittstellen, Registry-
Integration, Cvar-Refresh und ungültige Sitzungsdaten.

Unvollständiges `sscanf` würde im Original nicht initialisierte lokale Variablen
lesen. MiniLang verlangt deshalb alle sieben Konvertierungen und meldet einen
Fehler, bevor es Sitzungsfelder ändert. Solche Eingaben zählen nicht als gültige
Differenzfälle. Eingebettete NUL-Bytes werden ebenfalls kontrolliert abgewiesen.

Test-Binary: `1b30a8e44850fbb244e50bfdee510c8e6da6557a913f45dece8a7c8a96fa1ff9`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Einzelbericht: `build/reference/client_connect/result.json`.

Der native Host modelliert die Session-Cvar-Speicherung; MiniLang verwendet seine
tatsächliche Registry, deren Engine-Regeln separat geprüft sind. Die [IP-Filter](IP_FILTERS.md)
sind inzwischen implementiert und liefern die Standardentscheidung. Die ältere
Differentialsuite behält ihren beobachteten IP-Override; zusätzliche Verträge
prüfen tatsächliche Ban-/Whitelist-Ablehnungen. Bot-Userinfo wird standardmäßig
über den portierten `G_BotConnect`-Pfad in Characterdatei, Skill und Team zerlegt.
`BotAISetupClient` und `BotAIShutdownClient` verwalten Character-, Goal-, Weapon-,
Chat- und Move-Ressourcen mit der originalen Fehler- und Cleanup-Reihenfolge. Die
Botlib-Dienste, Userinfo-Zustellung, Log und Serverbefehle enden an ausdrücklich
beobachteten Schnittstellen. Configstrings werden lokal gespeichert;
Netzwerkübertragung, kompletter Modulstart/-shutdown, Dateipersistenz,
tatsächliche Kartenwechsel durch die Engine und Missionpack bleiben offen.
[`ExitLevel`](INTERMISSION.md) verwendet inzwischen die portierte
Sitzungsspeicherung vor dem Wechsel verbundener Clients auf `CON_CONNECTING`.
Die neue Intermission-Suite führt diesen Ablauf mit der tatsächlichen Registry aus.
[Follow-Befehle und Tournament-Nachrücken](FOLLOW_TOURNAMENT.md) sind separat geprüft.
[Teamwechsel und `ClientDisconnect`](TEAM_CHANGES.md) sind inzwischen separat
mit tatsächlicher Userinfo-, Spawn- und Rangverarbeitung geprüft.
