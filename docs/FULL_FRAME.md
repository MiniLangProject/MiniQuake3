# G_RunFrame

Stand: 2026-09-05. `frame.run` überträgt die vollständige äußere Reihenfolge von
Baseq3 `G_RunFrame`: Restart-Frühabbruch, Framezähler, Zeitübergang,
Cvar-Aktualisierung, Entity-Schleife, Client-Endframes, portierte Tournament-Prüfung,
portierte Matchende-Regeln, Teamstatus, globale und Team-Votes sowie
Cvar-Nachverfolgung.

Die Entity-Schleife führt Raketen, Items, Leichen und Clients standardmäßig über
die portierten Implementierungen aus. Mover und sonstige Physics-Entities bleiben
bis zu ihren eigenen Portschritten am vorhandenen Entity-Callback. Team-, Vote-
und Cvar-Wartung werden als eine typisierte, geordnet geprüfte Frame-Grenze
geführt. Die optionale `g_listEntity`-Schleife umfasst alle 1.024
Slots und setzt die Cvar wie das Original über die Host-Schnittstelle zurück.

`scripts/test_full_frame.py` extrahiert den unveränderten `G_RunFrame`-Körper aus
`g_main.c`. Sechs Szenarien vergleichen 3.286 32-Bit-Wörter in 13.157 Bytes exakt.
Enthalten sind normaler und leerer Frame, Restart, fälliges und zukünftiges Think,
32-Bit-Zeitgrenzen sowie die vollständige Entity-Liste. Drei Laufzeitverträge
prüfen Pflichtgrenzen, Clientlimit und den Restart-Frühabbruch.

Test-Binary: `b15c1e576e2f054fb86123464bc7530c993268201a648c4544075282b05103b9`.
Native x86-Oracle: `07f35976b9312ffd0763d051da0288a92321eeb5bddc82e0c6c3aeba3e9512ba`.

Ausführen:

```powershell
python scripts/test_full_frame.py
```

Für einen selbständig laufenden Dedicated Server fehlen weiterhin die
Implementierungen der Team-/Vote-/Cvar-Wartungsgrenzen, weitere Mover-/Physics-Pfade,
Engine-Frame, Netzwerk und Modulzustellung.
