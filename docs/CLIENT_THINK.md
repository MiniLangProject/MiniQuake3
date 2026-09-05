# ClientThink

Stand: 2026-09-05. `src/mq3/game/client_active.ml` überträgt die Baseq3-Funktionen
`ClientImpacts`, `SpectatorThink`, `ClientInactivityTimer`, `ClientTimerActions`,
`ClientIntermissionThink`, `ClientEvents`, `ClientThink_real`, `ClientThink` und
`G_RunClient` aus `code/game/g_active.c`.

Der Port klemmt Usercmd-Zeiten wie das Original, rundet feste Pmove-Schritte,
wählt Normal-, Noclip-, Tot- und Zuschauermodus und führt das gemeinsame Pmove
mit der dynamischen Serverkollision aus. Danach erzeugt er den EntityState,
sendet ausstehende vorhersagbare Ereignisse, verlinkt den Spieler, berührt
Trigger und Pmove-Kontakte, aktualisiert Button-Latches und führt Sekundentimer
oder Respawn aus. Haste, Grappling-Hook-Freigabe, Gauntlet-Prüfung,
Zwangsgesten, Inaktivitätswarnung/-Kick, Fallschaden, Waffenfeuer, Medkit und
persönlicher Teleporter einschließlich Flag-Drop sind enthalten.

`ClientSpawn` verwendet diesen Ablauf standardmäßig. Beim ersten Spawn wird
außerdem der bereits portierte Respawn-Pfad gebunden; er legt die Leiche in die
Body Queue, ruft erneut `ClientSpawn` auf und erzeugt den Teleport-In-Effekt.
Tests können alle äußeren Aufrufe weiterhin mit Callbacks beobachten.

`scripts/test_client_think.py` extrahiert die neun Originalfunktionen unverändert
und baut sie zusammen mit originalem `Pmove`, BSP-/Serverkollision und
PlayerState-Konvertierung als MSVC-x86-Referenz (`/Od /fp:strict /arch:SSE2`).
27 Szenarien vergleichen 7.357 exakt gleiche 32-Bit-Wörter und 29.702
Ausgabe-Bytes sowie 77 geordnete Engine-/Link-Nebenwirkungen. Drei zusätzliche
Laufzeitverträge prüfen fehlende Usercmd-/Waffenfeuer-Schnittstellen und die
Kontakt-Deduplizierung.

Test-Binary: `d1e157d2a984fad6200d6329bde5a4e981df879cc9be5c126369c1b767e2b1ed`.
Native x86-Oracle: `c85bca4d0e6b14f0deb96ec86447cb0bfee1a8c0f8a7088856a362370b3cf678`.

Engine-seitige Usercmd-Zustellung, Cvar-Schreiben, Client-Drop,
Gauntlet-/Waffenaufrufe und AAS-Prüfung enden an geordnet getesteten Callbacks.
Die isolierte Suite beobachtet weiterhin einen Follow-Override. Standardmäßig
führt die Zuschauer-Angriffstaste jetzt die [portierte Follow-Auswahl](FOLLOW_TOURNAMENT.md)
aus; zusätzliche Vergleiche prüfen ihre Pmove- und Tastenfolgen.
[`BeginIntermission` und `MoveClientToIntermission`](INTERMISSION.md) setzen
inzwischen den Zustand, den `ClientIntermissionThink` verarbeitet.
Die neue Intermission-Suite verwendet dafür den echten Game-Übergang und
die tatsächliche ClientSpawn-Platzierung; isolierte Tests behalten ihre Overrides.
Weitere Waffenfunktionen, Bot-AI, Netzwerk-Snapshots und Missionpack bleiben
eigene Portschritte. [`G_RunFrame`](FULL_FRAME.md) ist separat portiert. Der vollständige Eintrittspfad ist
inzwischen unter [ClientBegin](CLIENT_BEGIN.md) geprüft.

Ausführen:

```powershell
python scripts/test_client_think.py
```
