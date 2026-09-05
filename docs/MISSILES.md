# Projektile, Grappling-Hook und Shooter

`game/missiles.ml` überträgt die baseq3-Funktionen von `g_missile.c` sowie
`SnapVectorTowards`, `Weapon_HookFree` und `Weapon_HookThink` aus `g_weapon.c`.
`game/shooters.ml` und `spawn_functions.ml` ergänzen die drei Shooter-Klassen.
Alle Spielregeln und Kollisionsabfragen laufen in MiniLang; die unveränderten
C-Funktionen werden ausschließlich im Vergleichshost ausgeführt.

| Projektil | Waffen-ID | Geschwindigkeit | Ablauf nach | Direkter / Radius-Schaden | Radius |
| --- | --- | --- | --- | --- | --- |
| Granate | 4 | 700 | 2.500 ms | 100 / 100 | 150 |
| Rakete | 5 | 900 | 15.000 ms | 100 / 100 | 120 |
| Plasma | 8 | 2.000 | 10.000 ms | 20 / 15 | 20 |
| BFG | 9 | 2.000 | 10.000 ms | 100 / 100 | 120 |
| Grappling-Hook | 10 | 800 | 10.000 ms | 0 / 0 | 0 |

Die gemeinsamen Zuweisungen der fünf `fire_*`-Funktionen stehen in
`missiles.fire(level, owner, start, dir, weapon)`. Der Aufruf normalisiert den
übergebenen Richtungsvektor, setzt den Bahnstart auf `level.time - 50` und rundet
die Geschwindigkeit mit dem ursprünglichen `SnapVector`. Granaten folgen einer
Schwerkraftbahn und tragen `EF_BOUNCE_HALF`; die anderen Bahnen sind linear.
Die Erzeugung selbst verlinkt das Projektil noch nicht.

## Flug, Aufprall und Explosion

`missiles.run` berechnet die aktuelle Bahnposition und verfolgt die Strecke mit
der tatsächlichen Server-/BSP-Kollision. Es gelten die ursprünglichen Owner-
und `target_ent`-Filter. Bei `startsolid` oder `allsolid` folgt eine zweite,
stationäre Abfrage, bevor die Entity verlinkt wird. `SURF_NOIMPACT` entfernt das
Projektil ohne Aufprallereignis. Andernfalls folgt `missiles.impact`; nach einem
Abprall wird der fällige Think-Aufruf weiter ausgeführt.

`missiles.bounce` bestimmt den Treffzeitpunkt aus `level.previousTime`, der
aktuellen Zeit und dem Trace-Anteil mit Float-Zwischenrechnungen und abschließendem
Integer-Cast. Die Geschwindigkeit wird an der Treffebene gespiegelt. Der Faktor
`0.65` bei halben Abprallern ist dagegen eine Double-Konstante. Unter 40 Einheiten
Geschwindigkeit und bei einer ausreichend nach oben gerichteten Ebene setzt das
Original die Granate auf eine stationäre Bahn; der Port übernimmt diese Grenze.

Direktschaden, Trefferstatistik und Radius-Schaden folgen der ursprünglichen
Reihenfolge. Das direkt getroffene Objekt wird vom Radius-Schaden ausgenommen.
Ein wertbarer Direkttreffer plus weitere Radius-Treffer erhöhen `accuracy_hits`
zusammen nur einmal. Auch durch Schutzregeln abgewehrter Schaden kann wie in
`LogAccuracyHit` bereits als Treffer zählen. `splashRadius` ist ein **Integer**
im ursprünglichen Entity-Typ und wird erst beim Aufruf von `G_RadiusDamage`
zum Float konvertiert.

Treffer auf Clients, normale Flächen und Metall erhalten die unterschiedlichen
Missile-Ereignisse. `DirToByte` verwendet die 162 ursprünglichen Normalen;
`generate_directions.py` überträgt deren Float-Werte aus dem gepinnten Original.
`SnapVectorTowards` bewahrt auch bei negativen Koordinaten die tatsächliche
C-Rechnung aus Integer-Cast und gegebenenfalls `+1`.

Zeitgesteuerte Explosionen werten zunächst die Bahn aus und runden den Ursprung.
Das Projektil wird zur normalen Entity mit `freeAfterEvent`. Die vorhandene
Entity-Schleife gibt es nach mehr als 300 ms frei. Ohne externen
`level.runEntityFn` führt diese Schleife Missile-Entities jetzt direkt über
`missiles.run` aus; ein ausdrücklich gesetzter Handler bleibt als Beobachtungs-
oder Integrationsschnittstelle verfügbar. Item-, Mover- und Client-Handler
sowie die vollständige `G_RunFrame`-Verwaltung bleiben offen. Der Aufrufer muss
`level.previousTime` und `level.time` vor der Schleife aktualisieren.

## Grappling-Hook und Shooter

Der Hook verknüpft sich mit seinem Besitzer, erzeugt beim Aufprall eine separate
Ereignis-Entity und wird zu `ET_GRAPPLE`. Bei Client-Treffern übernimmt er den
Mittelpunkt der aktuellen Bounding-Box; andernfalls den Treffpunkt. Er setzt
`PMF_GRAPPLE_PULL` und `grapplePoint`. `Weapon_HookThink` verfolgt ein Ziel bei
seinem Aufruf weiter, plant aber im Original keinen weiteren Think-Termin.
Freigabe entfernt die Besitzerverknüpfung und das Pull-Flag. Diese Serverzustände
ersetzen noch keine clientseitige Darstellung des Seils oder Waffensteuerung.

`shooter_rocket`, `shooter_grenade` und `shooter_plasma` wählen nach 500 ms ihr
Ziel, sofern ein Target-Feld vorhanden ist. Ihre Streuung benutzt die ursprüngliche
Windows-Zufallsfolge, `PerpendicularVector`, `CrossProduct` und die genaue Folge
der Float-/Double-Rechnungen. Jeder Use-Aufruf erzeugt das passende Projektil und
ein Feuerereignis. Die Waffen-Item-Suche und `RegisterItem` setzen die ursprünglichen
Registrierungsbits. Karten- und Drop-Items sind inzwischen portiert;
`SaveRegisteredItems` und die clientseitige Vorabladung fehlen noch.

## Vergleich und Grenzen

`test_missiles.py` vergleicht Entity-/PlayerStates, private Projektilfelder,
Hook-Verknüpfungen, Trefferzähler, Item-Registrierung, Callback-Eintrittszustände,
alle Trace-Eingaben und -Ergebnisse sowie die abschließende Zufallsfolge.
Die Tests umfassen 670 Projektil-Erzeugungen, Richtungs- und Cast-Grenzen,
512 Abprallproben, direkte/radiale Treffer, Schutzregeln, veränderte spätere
Trefferkandidaten, zeitgesteuerte Explosionen und Ereignisfreigabe. Getrennte
Fälle verlangen echte Client-Treffer, Granaten-Abpraller, Start-in-Solid-Abfragen
und Himmels-/Metallreaktionen. Shooter-Tests enthalten 256 weitere Präzisionsfolgen.

Alle 31 CD-Karten werden mit aktiven Kurven geladen. Pro Karte fliegen alle fünf
Projektiltypen von zwei ausgewählten Entity-Positionen durch acht Zeitschritte.
Dabei laufen die echte Missile-Verarbeitung und die portierte Entity-Schleife.
Die übrigen Karten-Spielobjekte werden in diesen Replays nicht vollständig
gespawnt; die vollständige Karten-/Serverabnahme bleibt offen.

Acht Laufzeitverträge prüfen Initialisierung, Freigabe und ungültige Besitzer-/
Waffen-/Item-Zustände. **Kontrollierte Abweichung:** Gibt ein künstlicher
Pain-Callback das angreifende Projektil frei, verlinkt C es später mit der nun
auf 0 gesetzten Entity-Nummer und benutzt fremde Server-Metadaten. MiniLang
weist diesen Link weiterhin zurück. Der gesonderte Lauf vergleicht die
Beobachtungen bis zu dieser Grenze und zählt nicht als vollständige Parität.

Die Richtungsproben deckten außerdem einen Fehler der gemeinsamen Float-
Subtraktion auf: Ein NaN als zweiter Operand muss sein Vorzeichen behalten.
`numeric.subBits` korrigiert dies. Die Zahlenprüfung enthält jetzt 101.445
Vergleichsergebnisse einschließlich positiver/negativer Quiet-NaNs sowie 20.289
zusätzliche Prüfungen des tatsächlichen `fsub`-Aufrufs. Der QVM-Interpreter nutzt
dieselbe Korrektur für `SUBF`; zwölf zusätzliche QVM-Fälle prüfen die NaN-Operanden.
Beliebige NaN-Payloads
und Signaling-NaNs sind weiterhin kein vollständig geprüfter Eingabeumfang.

`player_die` räumt den portierten Grappling-Hook inzwischen über diesen Pfad auf;
siehe [DEATHS.md](DEATHS.md). `ClientThink` löst Waffen- und Gauntlet-Aufrufe
inzwischen in der Originalreihenfolge aus. Offen bleiben deren vollständige
Spieler-Waffenimplementierungen, Hitscan-Waffen, Mover-Pushing,
Missionpack-Projektile und die vollständige Server-/Clientintegration. Summen und Binary-Hashes stehen im
[Prüfbericht](PARITY_AUDIT.md).

```powershell
python scripts/test_missiles.py --data-root D:/Quake3
python scripts/verify.py --data-root D:/Quake3 --extended
```
