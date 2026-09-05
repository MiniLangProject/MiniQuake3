# Tournament und Warmup

Stand: 2026-09-05. `tournament.check` überträgt Baseq3 `CheckTournament`
einschließlich der verwendeten `TeamCount`-Abfrage. Der Port behandelt den
Zwei-Spieler-Tournamentmodus, FFA-/Team-Bereitschaft und die zusätzlichen
Rot-/Blau-Voraussetzungen für CTF. Änderungen an `g_warmup` starten den Countdown
neu; ein abgelaufener Countdown setzt `g_restarted` und fordert wie das Original
`map_restart 0` an.

Configstring 5, `Warmup`-Log, Cvar-Schreibzugriff, Konsolenbefehl und
`AddTournamentPlayer` sind explizite Host-Schnittstellen. Die
Spielerpromotion bleibt bis zum Port ihrer Queue- und Sitzungslogik eine
beobachtete Grenze. `G_RunFrame` ruft die portierte Prüfung bereits an der
ursprünglichen Stelle vor `CheckExitRules` auf.

`scripts/test_tournament.py` extrahiert die unveränderten Körper von
`CheckTournament` und `TeamCount` aus dem fixierten C-Quellstand. Zwölf Szenarien
vergleichen **115 32-Bit-Wörter in 547 Bytes** exakt. Sie umfassen keine Spieler,
warten auf einen zweiten Tournamentspieler, erfolgreiche Promotion, deaktiviertes
Warmup, Cvar-Änderung, abgelaufenen Countdown, FFA-Bereitschaft, fehlendes
CTF-Team, Singleplayer und einen 32-Bit-Zeitüberlauf. Drei Laufzeitverträge prüfen
Spawn-Zustand, Promotion-Schnittstelle und Clientlimit.

Test-Binary: `8c83ed1e9c85df9cea975cf6b0786b0e907cfa9d3e7666aa3426b1898ea8397f`.
Native x86-Oracle: `3f3b09e05c46bb4d05f67cbe5f4ea6dba86a48fa2a5fe0d5e9ad388bbe31d243`.

Ausführen:

```powershell
python scripts/test_tournament.py
```

Die [Vote-Auflösung](VOTES.md) ist inzwischen ebenfalls portiert. Teamstatus und
allgemeine Cvar-Wartung bleiben eigene Portschritte. Netzwerkzustellung und der tatsächliche Engine-Maprestart
folgen mit der Server- und Protokollintegration.
