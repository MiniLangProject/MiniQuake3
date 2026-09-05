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

Test-Binary: `7f8e1824396b906ea2d77f0f7b1a4ade2fbb37d8b376eeea15bc25cea1ede094`.
Native x86-Oracle: `5fc02d42a91704bd7e1856c809282582cc6979c83ad078e3489fc2460f2495ae`.

Userinfo, Usercmd, ServerCommand und Game-Log werden an geordneten Host-Grenzen
zugestellt. Spawnwahl, Kollision, Targets, PlayerState-Konvertierung,
Entity-Verlinkung, Ereignis-Erzeugung und Rangberechnung laufen auf beiden Seiten
als echte Implementierungen. `G_RunFrame`, Netzwerkzustellung und Missionpack
bleiben eigene Portschritte.

Ausführen:

```powershell
python scripts/test_client_begin.py
```
