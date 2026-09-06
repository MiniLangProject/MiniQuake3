# Portalflächen und Portalkameras

`src/mq3/game/portals.ml` überträgt die drei Baseq3-Funktionen aus dem
festgeschriebenen `code/game/g_misc.c`. Der Spawn-Dispatcher bindet die beiden
Klassen `misc_portal_surface` und `misc_portal_camera` ein.

| Originalfunktion | MiniLang-Aufruf |
| --- | --- |
| `SP_misc_portal_surface` | `portals.surface(level,ent)` |
| `SP_misc_portal_camera` | `portals.camera(level,ent)` |
| `locateCamera` | `portals.locateCamera(level,ent)` |

## Spawn und verzögerte Auswahl

Beide Spawnfunktionen nullen `r.mins` und `r.maxs` und rufen anschließend den
bereits portierten Entity-Link einschließlich Serverraum- und Clusterberechnung
auf. Diese Reihenfolge ist beobachtbar: Beim Link besitzt eine Portalfläche noch
ihre bisherigen Flags und ihren bisherigen Entity-Typ. Erst danach setzt sie
`r.svFlags` auf genau `SVF_PORTAL` (64) und `s.eType` auf `ET_PORTAL` (6).
Vorhandene andere Serverflags werden dabei überschrieben.

Ohne Target kopiert die Fläche `s.origin` nach `s.origin2`; das bezeichnet den
Spiegelfall. Mit einem Target setzt sie den Think-Callback auf `locateCamera`
und den Termin auf `level.time + 100`. Ein leerer Targetstring zählt als
vorhandener Pointer und plant deshalb ebenfalls die Suche. Der Spiegelfall
löscht keine zuvor vorhandene Think-Funktion oder Denkzeit. Die Kamera verändert
weder diese Felder noch Portalflags oder Entity-Typ. Keine der drei Funktionen
ruft im Original `G_SetOrigin` auf; insbesondere bleiben Trajektorie und
`r.currentOrigin` erhalten.

`locateCamera` verwendet die reale `G_PickTarget`-Portierung. Sie berücksichtigt
die ersten 32 lebenden Treffer in Entity-Reihenfolge und vergleicht Targetnamen
ohne Beachtung der ASCII-Großschreibung. Jeder erfolgreiche Pick verbraucht
genau einen Wert des vorhandenen Windows-CRT-Zufallszustands, auch bei einem
einzigen Treffer. Ein fehlender Name oder ein erfolgloser Suchlauf verbraucht
keinen Zufallswert. Der Kamera-Spawn selbst verbraucht ebenfalls keinen.

Fehlt die erste ausgewählte Entity, folgt auf die G_PickTarget-Diagnose die
zusätzliche originale Meldung
`Couldn't find target for misc_partal_surface\n`, einschließlich des Tippfehlers.
Erst danach läuft `game.free`. Dadurch bleiben auch dessen Unlink-Reihenfolge
und `neverFree`-Verhalten erhalten. Diagnosen verwenden den vorhandenen
`level.gamePrintFn`, sofern der Host ihn bereitstellt.

## Kameraausrichtung und Zustandsfelder

Die ausgewählte Entity muss nicht die Klasse `misc_portal_camera` besitzen.
Ihre Entity-Nummer wird nach `r.ownerNum`, ihre `s.origin` nach `s.origin2` und
ihr `s.clientNum` nach `s.clientNum` der Fläche kopiert. Bei Spawnflag 1 erhält
die Fläche `s.frame = 25`, andernfalls bei Flag 2 den Wert 75. Flag 1 hat somit
bei gesetzten beiden Bits Vorrang. Ohne diese beiden Flags bleibt ein bereits
vorhandener Frame-Wert bestehen. Flag 4 setzt `s.powerups` auf 0; ohne dieses
Flag wird es 1.

Ein zweiter echter G_PickTarget-Aufruf sucht nach dem Target der Kamera, auch
wenn dessen Name NULL ist. Bei Erfolg wird die Differenz der beiden
`s.origin`-Vektoren mit binären 32-Bit-Operationen gebildet und durch die
vorhandene `VectorNormalize`-Portierung normalisiert. `r.currentOrigin` ist
hierfür ohne Bedeutung. Deckungsgleiche Positionen behalten den Nullvektor;
`DirToByte` liefert dafür den ursprünglichen Index 0.

Findet die Kamera kein Ziel, folgt nach der Suchdiagnose der G_SetMovedir-Pfad.
Der gemeinsame `shared.directions.movedirVector` erkennt `(0,-1,0)` als aufwärts
und `(0,-2,0)` als abwärts. Alle anderen Winkel verwendet er mit dem vorhandenen
`AngleVectors`. Anschließend nullt der Portalcode die drei Komponenten von
`owner.s.angles`, entsprechend der Mutation durch G_SetMovedir. Das gesonderte
`owner.movedir` wird dabei nicht verändert. Ein erneuter Kamera-Lookup kann
deshalb bereits die gelöschten Winkel sehen.

Die resultierende Richtung wird durch das vorhandene `DirToByte` auf die
162 Originalnormalen abgebildet und in `s.eventParm` geschrieben. Es wird weder
ein linearer Winkelquantisierer noch eine eigene Richtungstabelle verwendet.
Oberfläche, Kamera und zweites Ziel dürfen dabei dieselbe Entity sein; die
Zugriffe und Winkelmutation bleiben in Originalreihenfolge. Nach erfolgreicher
Suche erfolgt kein zusätzlicher Link. Ein direkter `locateCamera`-Aufruf löscht
auch seinen Think-Callback und Termin nicht; beim regulären Denken löscht das
gemeinsame `game.runThink` den Termin vor dem Callback.

## Rollwinkel und definierte Grenzen

Der Kamera-Spawn liest `roll` erst nach dem Link mit dem originalen Default
`"0"`. Die vorhandene SpawnFloat-Funktion verwendet CRT-`atof` und speichert
das Ergebnis als binären 32-Bit-Float. Die anschließende Originalformel
`roll / 360.0 * 256` rechnet wegen `360.0` dagegen in doppelter Genauigkeit.
Erst die Zuweisung nach `s.clientNum` schneidet den Bruchteil gegen null ab.
Der Port verwendet hierfür `textnumbers.truncDouble32` und fügt keinen
Float-Zwischenspeicher ein.

`s.clientNum` ist an dieser Stelle ein vorzeichenbehafteter 32-Bit-Integer.
Der Code maskiert ihn nicht auf ein Byte und normalisiert den Winkel nicht:
360 Grad ergeben 256, -360 Grad ergeben -256. Werte zwischen -1 und 1 im
skalierten Ausdruck ergeben 0.

NaN, Unendlich und Ergebnisse mit nicht als `int32` darstellbarem Ganzzahlteil
haben bei der C-Konvertierung kein definiertes Ergebnis. MiniLang weist diese
Fälle mit einem eigenen Vertrag ab. Die Grenze des skalierten Ausdrucks ist
streng größer als -2.147.483.649 und streng kleiner als 2.147.483.648. Für die
tatsächlich erreichbaren binary32-Rollwerte entspricht dies dem Intervall
**[-3.019.898.880, 3.019.898.880)**. Die untere Grenze ergibt exakt `INT_MIN`;
der größte gültige positive Float 3.019.898.624 ergibt 2.147.483.465. Der Vertrag
greift nach dem ursprünglichen Link und lässt den bisherigen `s.clientNum`
unverändert. Solche Fälle sind MiniLang-Verträge und zählen nicht als
Differenznachweis gegen undefiniertes natives Verhalten.

Die Engine-Hooks können vor der Fortsetzung Entity-Felder oder Spawnwerte
ändern. Der Portalcode liest die betroffenen Werte nach dem jeweiligen Hook
erneut. Die Diagnose- und Link-Reihenfolge bleibt auch dann erhalten, wenn ein
Hook die Entity freigibt oder denselben Platz wiederverwendet. Übergroße
G_PickTarget-Diagnosen jenseits des originalen G_Printf-Puffers gehören nicht
zum definierten Vergleichsbereich.

## Referenz und verbleibende Integration

Die gemeinsame Map-Objekt-Suite verwendet die unveränderten Originalfunktionen
aus `g_misc.c` und den tatsächlichen G_PickTarget-, Mathematik-, Link- und
Free-Code des nativen Referenzhosts. Sie beobachtet alle im Host modellierten
Zustände, konkrete Callback-Identitäten, geordnete Engine-Ausgaben und den
Zufallszustand. Interne Trace-Payloads werden in anderen Suiten separat geprüft.
Der Referenzbuild verwendet das festgelegte x86/MSVC-Profil; Originalcheckout
und eingefrorener MiniLang-Compiler bleiben unverändert.

```powershell
python scripts/test_map_objects.py
```

Der Portal-Fallkatalog enthält 68 definierte Szenarien mit 405 Aktionen und
1.140 ergänzenden semantischen Assertions. Er prüft unter anderem 18 gültige
Rollwerte, beide Grenzen von 32 Zielkandidaten mit anschließender Zufallsfolge,
alle acht Kombinationen der Kameraflags, wiederholten Winkelverbrauch,
Diagnose-/Free-Reihenfolge, Selbsttreffer und Änderungen in Engine-Hooks.
Ein später direkter Kameraaufruf benötigt für einen abweichenden Rollwert
einen ausdrücklich gesetzten Spawnvars-Kontext; nach dem abschließenden
Map-Parser-EOF sind die aktiven Spawnvariablen leer.

Der kanonische Bericht liegt unter `build/reference/map_objects/result.json`.
Er enthält die Messwerte und Hashes der gemeinsamen Prüfung der Portal- und
Target-Klassen. Dieser Port erzeugt den serverseitigen Portalzustand. Die
Darstellung durch `CG_Portal`, Sichtberechnung für Portalansichten im vollständigen
Snapshot-System und der Renderer werden dadurch noch nicht vollständig
portiert. Die unter `MISSIONPACK` stehenden Portalgegenstände und deren
Teleportlogik gehören nicht zu diesen Baseq3-Mapklassen.
