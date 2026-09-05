# Dynamische Server-Kollision

`src/mq3/server/world.ml` überträgt die räumlichen Funktionen von `sv_world.c`.
Die Klasse `Entity` enthält die von diesen Funktionen verwendeten Felder. Sie ist
noch kein vollständiger `entityState_t`-Netzwerkcodec und keine Game-Entity mit
Lebenspunkten, Touch-/Think-Callbacks oder Spawn-Logik.
`game/entitystate.ml` enthält inzwischen die vollständigen 208 Speicherbytes;
`game/entities.ml` verbindet diese über `s` mit den räumlichen Feldern `r`.
Die Delta-Kodierung auf dem Netzwerk bleibt ein eigener Planabschnitt.

| MiniLang-Aufruf | Bedeutung |
| --- | --- |
| `create(world)` | Neue Szene mit 1.024 Entity-Plätzen und den 31 ursprünglichen Sektoren |
| `getEntity(scene,number)` | Veränderbare räumliche Entity-Daten; Nummer muss dem Platz entsprechen |
| `linkEntity(scene,number)` | Alten Eintrag lösen; Solid-Größe, absolute Grenzen, Cluster/Areas berechnen; vorn in die Sektorliste eintragen |
| `unlinkEntity(scene,number)` | Aus der Sektorliste entfernen; ursprüngliche Link-Metadaten bleiben erhalten |
| `areaEntities(scene,mins,maxs,capacity)` | Überlappende absolute Boxen in ursprünglicher Besuchsreihenfolge |
| `trace(scene,start,end,mins,maxs,passEntity,mask,capsule)` | Welt und dynamische Entities gemeinsam prüfen; liefert `movement.Collision` |
| `clipToEntity(...)` | Dieselben Trace-Parameter, mit Ziel-Entity statt `passEntity`; prüft auch unverlinkte Entities |
| `pointContents(scene,point,passEntity)` | Weltinhalt mit den Inhalten überlappender Entity-Modelle vereinigen |
| `pmoveTrace`, `pmoveContents` | Callbacks für `pmove.create(ps,...,scene)` |

Vor `linkEntity` setzt der Aufrufer `currentOrigin`, `currentAngles`, `mins`,
`maxs`, `contents` und `ownerNum`. BSP-Entities verwenden zusätzlich `bmodel=true`
und `modelindex`. Boxen drehen sich bei Traces nicht. Die temporären Boxhüllen
tragen stets `CONTENTS_BODY`; `contents` dient beim Server-Trace als Vorfilter.
Ein `ownerNum` von 1.023 bedeutet kein Besitzer. Die Nullinitialisierung verwendet
wie C den Wert 0; ein Aufrufer muss unbesessene Entities daher ausdrücklich setzen.

Die Reihenfolge ist Teil des Verhaltens: neu verlinkte Entities stehen vorn;
Sektoren werden positiv vor negativ besucht; gleiche Trefferbruchteile ersetzen
einen vorherigen Treffer nicht. Selbst- und Besitzerfilter, `startsolid`-Vereinigung,
sofortiger Welt-Treffer und die strikten Sektorgrenzen entsprechen dem Original.
Die Clusterliste bleibt auf 16 Einträge begrenzt, die Blattabfrage auf 128.

`SV_PointContents` verwendet im Original `s.origin`/`s.angles`, während Verlinkung
und Traces `r.currentOrigin`/`r.currentAngles` benutzen. Im MiniLang-Datensatz sind
das `origin`/`angles` und `currentOrigin`/`currentAngles`. Auch dieser Unterschied
bleibt erhalten. Er darf beim späteren Anschluss der Spiel-Entities nicht durch
automatisches Gleichsetzen verdeckt werden.

Das Originalprofil weist temporäre Kapsel-Zielmodelle mit Handle 254 kontrolliert
zurück, weil die festgehaltene C-Revision diesen Handle nicht auflösen kann.
`capsule=true` für das bewegte Abfragevolumen gegen BSP/Boxen ist davon getrennt.
Eine spätere Fehlerkorrektur benötigt ein eigenes Referenzprofil.

`game/trajectory.ml` liefert die sechs ursprünglichen Bewegungsbahnen, ihre
Geschwindigkeitsabfrage und die asymmetrische Item-Kontaktbox. Die ursprüngliche
Sinus-Geschwindigkeitsformel bleibt unverändert, einschließlich des Faktors 0,5.
Sinusbahnen mit Dauer 0 werden kontrolliert abgewiesen.

`game/jumppad.ml` verändert Geschwindigkeit, Sprungpad-Merker und Ereignisring wie
`BG_TouchJumpPad`; Zuschauer und fliegende Spieler bleiben unverändert. Der Test
mischt aufgezeichnete Touch-Aufrufe mit echten Pmove-Aufrufen. Zusätzlich prüft
`test_transitions.py` jetzt `G_TouchTriggers`: Kandidatensuche, genaue Kontakte,
Item-Sonderfall, Zuschauer-/Bot-Verhalten und das Zurücksetzen der Merker beim
Verlassen. Teleport-Zustände und Telefrag-Aufrufe sind ebenfalls enthalten.
Das [Spawn-Parsing](SPAWNING.md) legt inzwischen auch echte Karten-Trigger an und
richtet Sprungpads verzögert auf ihre Targets aus. Die zusätzliche
[Schadensprüfung](COMBAT.md) verbindet KillBox/Teleport mit Rüstung, Rückstoß und
Teamschutz. Die [Spieler-Todesfolge](DEATHS.md) verwendet nun außerdem die echte
PVS-/Area-Abfrage für Team-Boni. Item-Entities verwenden die Kollision inzwischen
für Drop-Physik und No-Drop-Flächen. Weitere Spawn-Klassen, Item-Aufnahme,
`ClientSpawn`, Mover-Pushing und vollständige Serverframes bleiben offen;
siehe [GAME_TRANSITIONS.md](GAME_TRANSITIONS.md).

Die C-Prüfung bindet `sv_world.c` unverändert ein und kompiliert ursprüngliche
Kollisions- und Bewegungsdateien. Drei vollständige Adressierungsfunktionen aus
`sv_game.c` werden unverändert extrahiert. Der Testhost liefert Entity-Speicher,
Dateien, Diagnoseausgaben und protokollierte Änderungen; er ersetzt keine
Kollisionsalgorithmen. Lokale Kartenauszüge bleiben unter `build/reference/`.
