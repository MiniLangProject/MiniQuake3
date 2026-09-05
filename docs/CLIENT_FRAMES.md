# ClientEndFrame

Stand: 2026-09-05. Der Baseq3-Abschluss eines Client-Serverframes liegt in
src/mq3/game/client_frame.ml vor. ClientSpawn verwendet ihn standardmäßig;
ein gesetzter Callback bleibt für isolierte Tests und spätere Moduladapter
erhalten.

Übertragen sind ClientEndFrame, SpectatorClientEndFrame, P_WorldEffects,
P_DamageFeedback, G_SetClientSound und SendPendingPredictableEvents. Der Ablauf
lässt Powerups exakt bei powerupTime kleiner level.time auslaufen, verarbeitet
Ertrinken, Lava, Slime, Battlesuit und Noclip, erzeugt Schadensrichtung und
Pain-Ereignis, setzt den Loop-Sound und wandelt den PlayerState wahlweise
interpoliert oder extrapoliert in den EntityState um. Ausstehende vorhersagbare
Ereignisse werden als temporäre Ereignis-Entities für alle Clients außer dem
Urheber markiert.

Zuschauer können einem direkten Client sowie follow1 und follow2 folgen. Dabei
wird der vollständige PlayerState wie im C-Code als unabhängige Kopie übernommen;
die eigenen Vote-Flags bleiben erhalten. Scoreboard-, freie und dedizierte
Kamera-Zustände folgen den originalen Flagregeln. Verliert ein Zuschauer ein
explizites gültiges Ziel, ruft der Ablauf den inzwischen portierten und beim
Spawn registrierten `ClientBegin`-Pfad auf.

scripts/test_client_frame.py extrahiert die sechs Originalfunktionen unverändert
aus code/game/g_active.c und baut sie als MSVC-x86-Referenz mit
/Od /fp:strict /arch:SSE2. 17 Szenariogruppen mit insgesamt 272 Frame-Ausführungen
vergleichen vollständige PlayerStates, EntityStates, Umwelt-/Schadensfelder und
alle erzeugten Ereignis-Entities. Der aktuelle Nachweis umfasst 51.275 exakt
gleiche 32-Bit-Wörter, 205.122 Ausgabe-Bytes, sechs geordnete Nebenwirkungen und
zwei zusätzliche Laufzeitverträge. Davon bilden 256 Fälle eine Matrix für
Schadensrichtung, Kappung, Godmode und Pain-Debounce.

Test-Binary: `9a4c8867955400cfaa854e19f5755e121c59a60f8d0ee4c01cff2c1cc15abbfe`.
Native x86-Oracle: `5338d207d78a383c6fe14cd22e0d2e4baf549ac655cade8bea5d6e8e8509eb61`.

Die Usercmd-/Pmove-Orchestrierung, ClientEvents und ClientTimerActions sind
inzwischen gesondert unter [ClientThink](CLIENT_THINK.md) geprüft. Die vollständige
Eintrittsverbindung ist unter [ClientBegin](CLIENT_BEGIN.md) geprüft. Offen bleiben
weitere Waffenpfade sowie die tatsächliche
Snapshot- und Netzwerkzustellung. Missionpack-Code gehört nicht zu dieser Baseq3-Abnahme.

Ausführen:

```powershell
python scripts/test_client_frame.py
```
