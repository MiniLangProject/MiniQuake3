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
`CalculateRanks`. Acht Szenarien vergleichen 2.907 32-Bit-Wörter in 12.111 Bytes
exakt und prüfen 92 geordnete Host-, Configstring- und Link-Ereignisse. Fünf
Laufzeitverträge prüfen Slotgrenzen, fehlende Pflichtschnittstellen und die
Standardregistrierung des Callbacks.

Test-Binary: `bfe9baf503bfa60b08f8141beecd26a6dc3c2396bf88ad500641cac389524eff`.
Native x86-Oracle: `dd6df58daf7e4f21ccace9b6a85a496091f9d7b77bf2b0733b878b4dee05d9ca`.

Userinfo, Usercmd, ServerCommand und Game-Log werden an geordneten Host-Grenzen
zugestellt. Spawnwahl, Kollision, Targets, PlayerState-Konvertierung,
Entity-Verlinkung, Ereignis-Erzeugung und Rangberechnung laufen auf beiden Seiten
als echte Implementierungen. `G_RunFrame`, Netzwerkzustellung und Missionpack
bleiben eigene Portschritte.

Ausführen:

```powershell
python scripts/test_client_begin.py
```
