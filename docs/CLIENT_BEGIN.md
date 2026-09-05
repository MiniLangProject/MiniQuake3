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

Test-Binary: `9a703824f0bdc49affc1bea1969f1687f4000711b4b78b898c66074af367e388`.
Native x86-Oracle: `61df38a5752d72b3a67a663c3da274f9766c3df09904706d955c6ba645d55aa8`.

Userinfo, Usercmd, ServerCommand und Game-Log werden an geordneten Host-Grenzen
zugestellt. Spawnwahl, Kollision, Targets, PlayerState-Konvertierung,
Entity-Verlinkung, Ereignis-Erzeugung und Rangberechnung laufen auf beiden Seiten
als echte Implementierungen. [`G_RunFrame`](FULL_FRAME.md) ist inzwischen
separat geprüft. [`ClientConnect` und Sitzungs-Persistenz](CLIENT_CONNECT.md)
sind ebenfalls portiert und vergleichen Userinfo, Teamwahl und Rangberechnung
im Anmeldepfad. Die Engine-Zustellung von Connect zu Begin, `ClientDisconnect`,
Netzwerk und Missionpack bleiben eigene Portschritte.

Ausführen:

```powershell
python scripts/test_client_begin.py
```
