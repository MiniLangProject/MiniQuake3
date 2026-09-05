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

Test-Binary: `967409215e9b999d3907b51af06718acb46338e28e390bf9fc71e94b674fa849`.
Native x86-Oracle: `a325d5af9190117fd4bbb59b3e81e84e83e7cb13b018e1aa4be4b92c1f0b778f`.

Userinfo, Usercmd, ServerCommand und Game-Log werden an geordneten Host-Grenzen
zugestellt. Spawnwahl, Kollision, Targets, PlayerState-Konvertierung,
Entity-Verlinkung, Ereignis-Erzeugung und Rangberechnung laufen auf beiden Seiten
als echte Implementierungen. [`G_RunFrame`](FULL_FRAME.md) ist inzwischen
separat geprüft. Vollständige Anmeldung über `ClientConnect`, Sitzungs-Persistenz,
Netzwerkzustellung und Missionpack bleiben eigene Portschritte.

Ausführen:

```powershell
python scripts/test_client_begin.py
```
