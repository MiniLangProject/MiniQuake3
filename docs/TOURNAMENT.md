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

Test-Binary: `47de1392470ee97c210795369d7b27937e48f71fd763c0a633691b38f71ee930`.
Native x86-Oracle: `07f35976b9312ffd0763d051da0288a92321eeb5bddc82e0c6c3aeba3e9512ba`.

Ausführen:

```powershell
python scripts/test_tournament.py
```

Teamstatus, Votes und allgemeine Cvar-Wartung im restlichen Frame sind weiterhin
eigene Portschritte. Netzwerkzustellung und der tatsächliche Engine-Maprestart
folgen mit der Server- und Protokollintegration.
