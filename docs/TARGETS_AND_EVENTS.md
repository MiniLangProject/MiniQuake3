# Target-Ketten und Entity-Ereignisse

`game/targets.ml` überträgt `G_UseTargets`, Shader-Remaps, `target_delay`,
`target_relay`, `target_teleporter`, `trigger_multiple` und `trigger_always`.
Zusammen mit den bisherigen Klassen sind damit 24 der 48 baseq3-Spawn-Klassen
umgesetzt. Die übrigen 24 Klassen und alle Item-Spawns bleiben offen.

| Aufruf | Verhalten |
| --- | --- |
| `targets.useTargets(level, ent, activator)` | Shader-Wechsel und Aufruf aller passenden Targets in Entity-Reihenfolge |
| `targets.addRemap`, `shaderState` | Bis zu 128 Remaps; Update ohne Beachtung der ASCII-Großschreibung; originale Ausgabegrenzen |
| `targets.delayUse`, `delayThink` | Verzögerung, Zufallsvarianz und gespeicherter Auslöser |
| `targets.relayUse` | Teamfilter und optional zufällig eines der ersten 32 passenden Targets |
| `targets.teleporterUse` | Teleport des auslösenden Clients mit den vorhandenen originalen Zustandswechseln |
| `targets.multiTrigger`, `multiUse`, `multiTouch` | Wiederholbarer oder einmaliger Trigger mit Wartezeit und Teamfilter |
| `targets.alwaysThink` | Targets auslösen und den Trigger freigeben; Spawn plant dies nach 300 ms |
| `events.add`, `events.sound` | Externe Entity-/PlayerState-Ereignisse und temporäre Sound-Entity |
| `frame.runEntities(level)` | Entity-Schleife aus `G_RunFrame`: Ereignisablauf, Freigabe, Ausverlinkung und Think-/Handler-Auswahl |

Entity-Callbacks erhalten den Level-Kontext vor den Originalargumenten:
`ent.use(level, ent, other, activator)`, `ent.think(level, ent)` und
`ent.touch(level, ent, other, trace)`. `ent.activator` hält dieselbe Entity-
Instanz über eine Verzögerung hinweg. Eine Freigabe setzt auch die neuen Felder
`use`, `activator`, `unlinkAfterEvent` und `physicsObject` zurück.

`G_UseTargets` sucht nach jedem Aufruf erneut im aktuellen Entity-Bestand.
Ein Callback kann den Target-Namen ändern, spätere Ziele entfernen oder neue
Entities anlegen. Der nächste Suchlauf berücksichtigt diese Änderungen und die
aktuelle Entity-Anzahl. Nach Entfernung der auslösenden Entity endet die Kette;
wird derselbe Platz sofort wiederverwendet, gelten die neuen Felder wie beim
ursprünglichen C-Pointer. Ein Selbsttreffer wird übersprungen. Fehlende Ziele oder
fehlende Use-Callbacks bleiben wirkungslos. Konsolendiagnosen sind nicht Teil
dieser Vergleichsabnahme.

Die Zeitrechnung behält die ursprünglichen Typwechsel bei: `random()` dividiert
als Float, `crandom()` und der anschließende Term rechnen wegen der C-Literale
in doppelter Genauigkeit. Erst das Endergebnis wird zum Integer. Wiederholtes
Auslösen von `target_delay` ersetzt Termin und Auslöser. Beim Mehrfachtrigger
wird der Auslöser sogar dann aktualisiert, wenn die Wartezeit noch läuft. Der
Originalcode korrigiert `random >= wait` mit `wait - FRAMETIME`, also minus
**100**, nicht minus 0,1; der Port bewahrt dieses Verhalten.

Shader-Zeiten verwenden `%5.2f` und die Standardrundung der festgelegten MSVC-
Referenz. MiniLang übergibt die exakte Float-zu-Double-Promotion über die x64-
Varargs-Schnittstelle an die Windows-C-Laufzeit. Die Grenze pro Ausgabezeile
beträgt 132 Bytes, die Gesamtgrenze 4.095 Bytes. Namen, die beim ursprünglichen
`strcpy` den 64-Byte-Puffer überschreiben würden, werden vor diesem Schreibpfad
kontrolliert zurückgewiesen. Bei voller Tabelle bleiben neue Einträge wie im
Original wirkungslos. Dies zeichnet Shader-Configstrings auf; ein Renderer ist
noch nicht vorhanden.

`events.add` erhöht die beiden Ereignis-Sequenzbits auch bei wiederholtem
Ereignis. Clients erhalten die Werte in `ps.externalEvent*`; andere Entities
in `s.event*`. Ereignis 0 ändert nichts. `events.sound` erzeugt die ursprüngliche
temporäre Sound-Entity; die Funktion benutzt ihren Kanalparameter nicht.
Damit ist die serverseitige Ereigniserzeugung übertragen, noch keine Audiowiedergabe.

Die Entity-Schleife entfernt alte Ereignisse erst bei einem Abstand **größer
als 300 ms**. Sie setzt `ps.externalEvent` nur dann zurück, wenn auch `s.event`
ungleich 0 war; vorhergesagte Ereignisse bleiben erhalten. `freeAfterEvent`
hat Vorrang vor `unlinkAfterEvent`. Temporäre Entities denken nicht, und
ausverlinkte `neverFree`-Entities werden übersprungen. Während der Schleife
angelegte Entities können noch im selben Durchlauf denken.

**Grenze des Frames:** `frame.runEntities` ist ausschließlich die Schleife über
belegte Entities. Der Aufrufer setzt `level.time` und aktualisiert Cvars zuvor.
Für die noch nicht portierten Handler verlangt der Port
`level.runEntityFn(level, kind, ent)`: `1` Missile, `2` Item/Physics, `3` Mover,
`4` Client. Ohne Handler entsteht ein Fehler. Die C-/MiniLang-Tests zeichnen diese
Aufrufe auf; sie simulieren keine Ersatzphysik. `G_RunFrame` als Ganzes,
`ClientEndFrame`, Match-/Vote-Prüfungen, Schäden, Items und Mover-Pushing bleiben
offen. Auch `target_teleporter` benutzt weiterhin die dokumentierte
[Telefrag-Schadensgrenze](GAME_TRANSITIONS.md).

Die Referenz extrahiert vollständige Originalfunktionen. Für den Frame kopiert
sie den unveränderten Entity-Schleifenblock aus `G_RunFrame` in einen Testaufruf;
die Originaldatei bleibt unangetastet. Tests vergleichen nach jeder Aktion
EntityStates, Game-/Serverfelder, Client-PlayerStates, Strings und beobachtete
Aufrufreihenfolge. Fälle umfassen Löschung und Wiederverwendung während einer
Kette, 1.024 Verzögerungsproben, Teamfilter, einmalige Trigger, Teleports,
Ereignis-Sequenzen, Zeitgrenzen, Handler-Prioritäten, live angelegte Entities
sowie Shader-Halbwerte und Puffergrenzen. Aktuelle Zahlen und Hashes stehen im
[Prüfbericht](PARITY_AUDIT.md).

```powershell
python scripts/test_targets.py
python scripts/test_spawn_values.py
python scripts/test_spawn.py D:/Quake3
```
