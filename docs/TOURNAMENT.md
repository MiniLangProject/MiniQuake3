# Tournament und Warmup

Stand: 2026-09-06. `tournament.check` überträgt Baseq3 `CheckTournament`
einschließlich der verwendeten `TeamCount`-Abfrage. Der Port behandelt den
Zwei-Spieler-Tournamentmodus, FFA-/Team-Bereitschaft und die zusätzlichen
Rot-/Blau-Voraussetzungen für CTF. Änderungen an `g_warmup` starten den Countdown
neu; ein abgelaufener Countdown setzt `g_restarted` und fordert wie das Original
`map_restart 0` an.

Configstring-Zustellung, `Warmup`-Log, Cvar-Schreibzugriff und Konsolenbefehl
sind explizite Host-Schnittstellen. `AddTournamentPlayer` ist inzwischen portiert
und standardmäßig eingebunden. [192 zusätzliche Vergleichsszenarien](FOLLOW_TOURNAMENT.md)
prüfen Follow, Duell-Warteschlange, Rangentfernung und Siege/Niederlagen mit
tatsächlichem Teamwechsel, Userinfo, Spawn und Rangberechnung. Die isolierte
Bereitschaftssuite behält ihren Promotion-Override. `G_RunFrame` ruft die Prüfung
weiterhin an der ursprünglichen Stelle vor `CheckExitRules` auf.

`scripts/test_tournament.py` extrahiert die unveränderten Körper von
`CheckTournament` und `TeamCount` aus dem fixierten C-Quellstand. Zwölf Szenarien
vergleichen **115 32-Bit-Wörter in 547 Bytes** exakt. Sie umfassen keine Spieler,
warten auf einen zweiten Tournamentspieler, erfolgreiche Promotion, deaktiviertes
Warmup, Cvar-Änderung, abgelaufenen Countdown, FFA-Bereitschaft, fehlendes
CTF-Team, Singleplayer und einen 32-Bit-Zeitüberlauf. Drei Laufzeitverträge prüfen
Spawn-Zustand, leere Warteschlange ohne Override und Clientlimit.

Test-Binary: `6647bc1446bc2d8aecc22e9970cb54202fd3629e08e3a3f4c484cdb1062cf621`.
Native x86-Oracle: `521abdafbaef527d00e46f84e2bc81768dccfa05be44b5b5faee1b328fc364cc`.

Ausführen:

```powershell
python scripts/test_tournament.py
```

Die [Vote-Auflösung](VOTES.md) ist inzwischen ebenfalls portiert. Teamstatus und
allgemeine Cvar-Wartung sind ebenfalls separat geprüft.
[`BeginIntermission` und `ExitLevel`](INTERMISSION.md) binden inzwischen
`AdjustTournamentScores` beziehungsweise `RemoveTournamentLoser` tatsächlich ein.
`RemoveTournamentWinner` bleibt als gesondert portierter Helfer verfügbar.
Die neue Intermission-Suite führt Wertung, Userinfo, Verliererwechsel und
Begin/Spawn zusammenhängend aus; die vorhandene Bereitschaftssuite behält
ihren Promotion-Override. Bot-Interbreeding und Singleplayer-Nachbereitung
benötigen weiterhin die Pflicht-Hooks `botInterbreedEndMatchFn`,
`updateTournamentInfoFn` und `spawnVictoryPadsFn`. Netzwerkzustellung sowie
die tatsächliche Ausführung von Engine-Kartenwechsel und `map_restart`
folgen mit der weiteren Serverintegration.
