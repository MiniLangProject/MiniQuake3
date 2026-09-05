# Target-Ketten und Entity-Ereignisse

`game/targets.ml` überträgt `G_UseTargets`, Shader-Remaps, `target_delay`,
`target_relay`, `target_teleporter`, `trigger_multiple`, `trigger_always`,
`target_speaker`, `target_push`, `func_timer` und `target_location`.
Zusammen mit den bisherigen Klassen, den [Hurt-/Kill-/Laser-Objekten](COMBAT.md)
und den drei [Shooter-Klassen](MISSILES.md) sind
damit 34 der 48 baseq3-Spawn-Klassen
umgesetzt. Die übrigen 14 Klassen bleiben offen; alle 35 Item-Spawns sind in
[Items und Flaggen](ITEMS.md) portiert.

| Aufruf | Verhalten |
| --- | --- |
| `targets.useTargets(level, ent, activator)` | Shader-Wechsel und Aufruf aller passenden Targets in Entity-Reihenfolge |
| `targets.addRemap`, `shaderState` | Bis zu 128 Remaps; Update ohne Beachtung der ASCII-Großschreibung; originale Ausgabegrenzen |
| `targets.delayUse`, `delayThink` | Verzögerung, Zufallsvarianz und gespeicherter Auslöser |
| `targets.relayUse` | Teamfilter und optional zufällig eines der ersten 32 passenden Targets |
| `targets.teleporterUse` | Teleport des auslösenden Clients mit den vorhandenen originalen Zustandswechseln |
| `targets.multiTrigger`, `multiUse`, `multiTouch` | Wiederholbarer oder einmaliger Trigger mit Wartezeit und Teamfilter |
| `targets.alwaysThink` | Targets auslösen und den Trigger freigeben; Spawn plant dies nach 300 ms |
| `targets.speakerUse` | Loop-Sound umschalten oder normales/globales/Activator-Ereignis erzeugen |
| `targets.pushUse` | Client-Geschwindigkeit setzen, Flight/Bewegungstyp prüfen und Push-Sounds begrenzen |
| `targets.timerUse`, `timerThink` | Sofort einschalten, ausschalten und den nächsten Termin mit Zufallsvarianz planen |
| `targets.locationLinkup` | Ortsnummern, Configstrings und verkettete Liste nach dem Spawn aufbauen |
| `events.add`, `events.sound` | Externe Entity-/PlayerState-Ereignisse und temporäre Sound-Entity |
| `frame.runEntities(level)` | Entity-Schleife aus `G_RunFrame`: Ereignisablauf, Freigabe, Ausverlinkung und Think-/Handler-Auswahl |

Entity-Callbacks erhalten den Level-Kontext vor den Originalargumenten:
`ent.use(level, ent, other, activator)`, `ent.think(level, ent)` und
`ent.touch(level, ent, other, trace)`. `ent.activator` hält dieselbe Entity-
Instanz über eine Verzögerung hinweg. Eine Freigabe setzt auch die neuen Felder
`use`, `activator`, `unlinkAfterEvent`, `physicsObject`, `noise_index`,
`fly_sound_debounce_time` und `nextTrain` zurück.

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

`func_timer` liest für `wait` und `random` jeweils den Vorgabewert 1. Seine
Varianzkorrektur prüft im Unterschied zu `trigger_multiple` nicht zusätzlich
`wait >= 0`. Der Timer merkt sich den Auslöser auch beim Ausschalten. Beim
Einschalten ruft er seine Targets sofort auf; `START_ON` plant dagegen den
ersten Aufruf nach 100 ms und verwendet den Timer selbst als Auslöser.
Die doppelt genaue Zeitformel behält die Reihenfolge der Faktoren aus C bei.
Entfernt ein Target den Timer, schreibt die Think-Funktion danach trotzdem noch
`nextthink`. Ein späterer direkter `G_RunThink` trifft dann auf den freigegebenen
Think-Pointer und liefert wie C einen Fehler. Zwei getrennte Fehlerreplays
prüfen diesen Ablauf einschließlich sofortiger Platzwiederverwendung.

`target_speaker` verlangt einen vorhandenen `noise`-Schlüssel; ein leerer Wert
ist zulässig. Eine `.wav`-Endung wird nur ergänzt, wenn dieser case-sensitive
Teilstring nirgendwo im Namen vorkommt. Die Speicherung begrenzt den Namen auf
63 Bytes. Ein führendes `*` aktiviert den Activator-Modus. Loop-Flags haben
beim Auslösen Vorrang vor den Ereignismodi, der Activator-Modus vor dem globalen
Sound. Wait-/Random-Felder werden mit den ursprünglichen Float-Operationen in
`s.frame` und `s.clientNum` übertragen. Die Entity wird zur Ermittlung ihrer
Areas und Cluster verlinkt. Das ist serverseitiger Sound-Zustand, noch keine
Audiowiedergabe oder clientseitige Speaker-Automatik.

`target_push` berechnet eine Geschwindigkeit aus Richtung und Speed oder lässt
nach 100 ms das bereits portierte `AimAtTarget` einen Scheitelpunkt anpeilen.
Die Richtungsberechnung verändert `s.origin2`, nicht das gesonderte `movedir`-
Feld. Nur Clients mit `PM_NORMAL` und ohne Flight werden beschleunigt. Die
Soundsperre liegt auf dem auslösenden Client und wird damit von verschiedenen
Push-Targets gemeinsam benutzt. Ein Sound entsteht erst, wenn sein Termin
streng kleiner als die aktuelle Zeit ist; danach beträgt die Sperre 1.500 ms.

`target_location` plant die Verknüpfung nach 200 ms. Die erste fällige Funktion
legt einmalig `CS_LOCATIONS = "unknown"`, fortlaufende Ortsnummern in `health`
und die Liste über `nextTrain`/`level.locationHead` an. Der originale Suchlauf
berücksichtigt passende Klassennamen auch ohne `inuse` und begrenzt die Zahl
nicht auf `MAX_LOCATIONS`; der Test überschreitet diese 64er-Grenze bewusst.
Ein fehlendes `message` wird wie ein NULL-Configstring als leer gespeichert;
der beobachtete Trap-Aufruf behält dabei sein ursprüngliches NULL-Argument.
Dies ist der lokale Speichervertrag aus `SV_SetConfigstring`, keine Abnahme
seiner Netzwerkverteilung. Die Auswahl des sichtbaren/nächsten Ortes und
Team-Overlays folgen mit den übrigen Teamregeln.

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
belegte Entities. Der Aufrufer setzt `level.previousTime` und `level.time` und
aktualisiert Cvars zuvor. Ohne externen Handler laufen Missile-Entities über die
[portierte Projektilverarbeitung](MISSILES.md); nicht als Item markierte
`bodyque`-Entities mit `physicsObject` führen die [Leichenphysik](PLAYER_LIFECYCLE.md)
aus. Die übrigen Kategorien benötigen
weiterhin `level.runEntityFn(level, kind, ent)`: `2` sonstige Item-/Physics-Entities, `3` Mover,
`4` Client. Ein gesetzter Handler übernimmt außerdem Kategorie `1` Missile.
Der Target-Test beobachtet alle vier Kategorien; die gesonderte Projektilprüfung
führt den echten Missile-Zweig aus. `G_RunFrame` als Ganzes,
`ClientEndFrame`, die Frame-Einbindung der [Matchende-Regeln](SCORES.md),
Vote-Prüfungen, Item-Aufnahme, `ClientSpawn` und Mover-Pushing bleiben offen.
Der ET_ITEM-Zweig läuft in der gesonderten [Item-Prüfung](ITEMS.md) mit echter
Physik. `target_teleporter` ist über KillBox inzwischen mit der
[portierten Schadensberechnung](COMBAT.md) verbunden.

Die Referenz extrahiert vollständige Originalfunktionen. Für den Frame kopiert
sie den unveränderten Entity-Schleifenblock aus `G_RunFrame` in einen Testaufruf;
die Originaldatei bleibt unangetastet. Tests vergleichen nach jeder Aktion
EntityStates, Game-/Serverfelder, Client-PlayerStates, Strings und beobachtete
Aufrufreihenfolge. Fälle umfassen Löschung und Wiederverwendung während einer
Kette, 1.024 Verzögerungsproben, Teamfilter, einmalige Trigger, Teleports,
Ereignis-Sequenzen, Zeitgrenzen, Handler-Prioritäten, live angelegte Entities
sowie Shader-Halbwerte und Puffergrenzen. Aktuelle Zahlen und Hashes stehen im
[Prüfbericht](PARITY_AUDIT.md).

Die erweiterten Fälle decken alle 16 Speaker-Flag-Kombinationen, Dateinamen-
und Zahlenkonvertierungen, Push-Richtungen und -Scheitelpunkte, alle sieben
Bewegungstypen, Flight und Sound-Zeitgrenzen ab. Hinzu kommen 512 Timer-
Präzisionsproben, Änderungen während eines Timer-Aufrufs und 71 Ortsmarkierungen.
Ein eigener C-/MiniLang-Fehlerlauf bestätigt den fehlenden Speaker-Noise-Schlüssel.

```powershell
python scripts/test_targets.py
python scripts/test_combat.py --data-root D:/Quake3
python scripts/test_spawn_values.py
python scripts/test_spawn.py D:/Quake3
```
