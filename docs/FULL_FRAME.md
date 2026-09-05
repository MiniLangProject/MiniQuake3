# G_RunFrame

Stand: 2026-09-05. `frame.run` überträgt die vollständige äußere Reihenfolge von
Baseq3 `G_RunFrame`: Restart-Frühabbruch, Framezähler, Zeitübergang,
Cvar-Aktualisierung, Entity-Schleife, Client-Endframes, portierte Tournament-Prüfung,
portierte Matchende-Regeln und Teamstatus, portierte globale und Team-Votes
sowie die Passwortstatus-Nachverfolgung durch `CheckCvars`.

Die Entity-Schleife führt Raketen, Items, Leichen und Clients standardmäßig über
die portierten Implementierungen aus. Mover und sonstige Physics-Entities bleiben
bis zu ihren eigenen Portschritten am vorhandenen Entity-Callback.
`G_UpdateCvars` aktualisiert standardmäßig die registrierten VM-Cvar-Kopien
aus der portierten Engine-Registry. Die optionale `g_listEntity`-Schleife umfasst alle 1.024
Slots und setzt die Cvar wie das Original über die Host-Schnittstelle zurück.

`scripts/test_full_frame.py` extrahiert den unveränderten `G_RunFrame`-Körper aus
`g_main.c`. Sechs Szenarien vergleichen 3.231 32-Bit-Wörter in 12.992 Bytes exakt.
Enthalten sind normaler und leerer Frame, Restart, fälliges und zukünftiges Think,
32-Bit-Zeitgrenzen sowie die vollständige Entity-Liste. Drei Laufzeitverträge
prüfen Pflichtgrenzen, Clientlimit und den Restart-Frühabbruch.

Der separate [Vote-Vergleich](VOTES.md) ergänzt aktive globale und Team-Votes
innerhalb echter Frames, einschließlich Teamleiterwechsel, verzögerter
Befehlsausführung und mehrerer gleichzeitig auslaufender Abstimmungen.
Der [Teamstatus-Vergleich](TEAM_STATUS.md) ergänzt aktive Standort-/Overlay-
und Passwortfolgen in echten Frames. Die früheren Teamstatus-/CheckCvars-
Testmarker sind durch die tatsächlichen Funktionen und ihre Ausgaben ersetzt.

Diese älteren Suiten verwenden einen expliziten Cvar-Refresh-Override.
Der [Engine-/Spiel-Cvar-Vergleich](GAME_CVARS.md) prüft zusätzlich den
standardmäßigen Registry-Pfad innerhalb des unveränderten Frames mit
ausschließlich inaktiven Entities, einschließlich Passwort und Entity-Listen-Reset.

Test-Binary: `5a25faae934b1d6eb1ffc768d513f412385326e96584abf5a1d9da2fb94aa2e0`.
Native x86-Oracle: `81051414985a5ee1c7acb8e74363e3d3f5e3c19cdd922e95cc9b649fd2fd5a32`.

Ausführen:

```powershell
python scripts/test_full_frame.py
```

Für einen selbständig laufenden Dedicated Server fehlen weiterhin vollständige
Modulinitialisierung, weitere Mover-/Physics-Pfade, Engine-Frame und Netzwerk.
