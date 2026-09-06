# ClientBegin

Stand: 2026-09-05. `client_spawn.clientBegin` überträgt den vollständigen
Baseq3-Eintritt eines Clients aus `g_client.c`. Die Routine trennt eine bereits
verlinkte Spieler-Entity, initialisiert ihren Slot, bindet den persistenten
Client erneut und setzt Verbindung, Eintrittszeit und Teamstatus. Der
`playerState_t` wird vollständig geleert, wobei `eFlags` wie im Original erhalten
bleibt.

Danach laufen der portierte `ClientSpawn` und `CalculateRanks` tatsächlich. Für
aktive Spieler entsteht das Teleport-In-Ereignis; außerhalb von Tournament wird
die Eintrittsmeldung versandt. Zuschauer erhalten weder Ereignis noch Meldung.
Der Game-Log-Eintrag und die Ranglisten-/Configstring-Aktualisierung folgen in
der ursprünglichen Reihenfolge. `ClientSpawn` installiert `ClientBegin` zugleich
als Standard-Callback für den Zuschauer-Fallback in `ClientEndFrame`.

`scripts/test_client_begin.py` extrahiert `ClientBegin` unverändert und verbindet
ihn im nativen x86-Orakel mit dem ebenfalls unveränderten `ClientSpawn` und
`CalculateRanks`. Zehn Szenarien vergleichen 3.637 32-Bit-Wörter in 15.163 Bytes
exakt und prüfen 116 geordnete Host-, Configstring- und Link-Ereignisse. Die
Userinfo-Fälle führen die gemeinsame, ASCII-groß-/kleinschreibungsunabhängige
Handicap-Suche und einen am ursprünglichen Pufferende abgeschnittenen Wert
durch den vollständigen Eintrittspfad. Fünf
Laufzeitverträge prüfen Slotgrenzen, fehlende Pflichtschnittstellen und die
Standardregistrierung des Callbacks.

Test-Binary: `2df48bb64faffad137190fb9c053c384205e4c9b7ba4d39bdcd5b9761b317510`.
Native x86-Oracle: `bf341634200dbd35e528b1a0316a9699e500a512b4c7f8ac40f08e21017de7a6`.

Userinfo, Usercmd, ServerCommand und Game-Log werden an geordneten Host-Grenzen
zugestellt. Spawnwahl, Kollision, Targets, PlayerState-Konvertierung,
Entity-Verlinkung, Ereignis-Erzeugung und Rangberechnung laufen auf beiden Seiten
als echte Implementierungen. [`G_RunFrame`](FULL_FRAME.md) ist inzwischen
separat geprüft. [`ClientConnect` und Sitzungs-Persistenz](CLIENT_CONNECT.md)
sind ebenfalls portiert und vergleichen Userinfo, Teamwahl und Rangberechnung
im Anmeldepfad. [Teamwechsel und `ClientDisconnect`](TEAM_CHANGES.md) sind
ebenfalls separat geprüft; `SetTeam` verwendet den tatsächlichen Begin-/Spawn-
Ablauf. Die neue [Intermission-Suite](INTERMISSION.md) führt Begin/Spawn auch
über den tatsächlichen Duell-Verliererwechsel aus. Die bestehenden isolierten
Tests behalten ihre Frame- und Intermission-Overrides. Die Engine-Zustellung
von Connect zu Begin, tatsächliche Engine-Kartenwechsel, Netzwerk und Missionpack
bleiben eigene Portschritte.

Ausführen:

```powershell
python scripts/test_client_begin.py
```
