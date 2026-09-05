# G_RunFrame

Stand: 2026-09-05. `frame.run` überträgt die vollständige äußere Reihenfolge von
Baseq3 `G_RunFrame`: Restart-Frühabbruch, Framezähler, Zeitübergang,
Cvar-Aktualisierung, Entity-Schleife, Client-Endframes, Tournament-Prüfung,
portierte Matchende-Regeln, Teamstatus, globale und Team-Votes sowie
Cvar-Nachverfolgung.

Die Entity-Schleife führt Raketen, Items, Leichen und Clients standardmäßig über
die portierten Implementierungen aus. Mover und sonstige Physics-Entities bleiben
bis zu ihren eigenen Portschritten am vorhandenen Entity-Callback. Tournament-,
Team-, Vote- und Cvar-Wartung werden als eine typisierte, geordnet geprüfte
Frame-Grenze geführt. Die optionale `g_listEntity`-Schleife umfasst alle 1.024
Slots und setzt die Cvar wie das Original über die Host-Schnittstelle zurück.

`scripts/test_full_frame.py` extrahiert den unveränderten `G_RunFrame`-Körper aus
`g_main.c`. Sechs Szenarien vergleichen 3.301 32-Bit-Wörter in 13.217 Bytes exakt.
Enthalten sind normaler und leerer Frame, Restart, fälliges und zukünftiges Think,
32-Bit-Zeitgrenzen sowie die vollständige Entity-Liste. Drei Laufzeitverträge
prüfen Pflichtgrenzen, Clientlimit und den Restart-Frühabbruch.

Test-Binary: `7f4afdbba3066613bf494f2357688a39807ea4989f27ba219e7a73e57a1754c8`.
Native x86-Oracle: `dd6df58daf7e4f21ccace9b6a85a496091f9d7b77bf2b0733b878b4dee05d9ca`.

Ausführen:

```powershell
python scripts/test_full_frame.py
```

Für einen selbständig laufenden Dedicated Server fehlen weiterhin die
Implementierungen der genannten Wartungsgrenzen, weitere Mover-/Physics-Pfade,
Engine-Frame, Netzwerk und Modulzustellung.
