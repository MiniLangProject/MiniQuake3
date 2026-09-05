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

Test-Binary: `7d2b4b75c42701a4203f453ce9964b012381f47fd72167cf5ecdc4718323c257`.
Native x86-Oracle: `cd54abf841fbae410f8daf19554d4b0b85f0265b3dbb31edad44610df123b416`.

Engine-seitige Usercmd-Zustellung, Cvar-Schreiben, Client-Drop, Zuschauer-Follow,
Gauntlet-/Waffenaufrufe und AAS-Prüfung enden an geordnet getesteten Callbacks.
Die Waffenfunktionen selbst, Bot-AI, Netzwerk-Snapshots, `G_RunFrame` und
Missionpack bleiben eigene Portschritte. Der vollständige Eintrittspfad ist
inzwischen unter [ClientBegin](CLIENT_BEGIN.md) geprüft.

Ausführen:

```powershell
python scripts/test_client_think.py
```
