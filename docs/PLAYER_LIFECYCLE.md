# Spawnpunkte und Leichenverwaltung

Dieser Abschnitt von Schritt 6 überträgt die Spawnpunkt-Auswahl und die
Leichenverwaltung von `baseq3`. Die [Scoreboard-/Punkteregeln](SCORES.md) und
die anschließende [`player_die`-Integration](DEATHS.md) sind inzwischen umgesetzt.
Der Respawn-Wrapper ruft die Leichenkopie und den Teleport-Effekt in der richtigen
Reihenfolge auf; das vollständige `ClientSpawn`, `ClientThink` und `ClientEndFrame`
bleibt offen.

## Übertragene Regeln

| MiniLang | Original |
| --- | --- |
| `player_spawns.wouldTelefrag` | `SpotWouldTelefrag` |
| `nearest`, `randomDeathmatch` | `SelectNearestDeathmatchSpawnPoint`, `SelectRandomDeathmatchSpawnPoint` |
| `furthest`, `selectSpawn`, `initial` | `SelectRandomFurthestSpawnPoint`, `SelectSpawnPoint`, `SelectInitialSpawnPoint` |
| `randomTeam`, `ctf` | `SelectRandomTeamSpawnPoint`, `SelectCTFSpawnPoint` |
| `findIntermission`, `spectator` | `FindIntermissionPoint`, `SelectSpectatorSpawnPoint` |
| `bodies.initQueue`, `copyToQueue`, `sink` | `InitBodyQue`, `CopyToBodyQue`, `BodySink` |
| `vectorYaw`, `lookAtKiller`, `gib`, `die` | `vectoyaw`, `LookAtKiller`, `GibEntity`, `body_die` |
| `bounce`, `run` | `G_BounceItem`; ausschließlich der Leichenpfad von `G_RunItem` |

Spawnpunkte werden anhand ihres Klassennamens ohne Beachtung der Großschreibung
in Entity-Reihenfolge gesucht. Die Belegungsprüfung verwendet echte
`SV_AreaEntities`-Abfragen mit der ursprünglichen Spielerbox. Ein Client blockiert
den Punkt unabhängig von seiner Gesundheit; normale Entities ohne Client tun
das nicht. Sind sämtliche Punkte belegt, greift die ursprüngliche Rückfallregel
auf den ersten passenden Spawnpunkt.

Die Entfernungsauswahl behält höchstens 64 Punkte in absteigender Reihenfolge.
Gleiche Entfernungen behalten ihre Reihenfolge. Die Halbierung der Punktzahl
verwendet C-Ganzzahldivision; `random()` kann genau 1 liefern. Deshalb kann die
Auswahl auch den Eintrag direkt nach der vorderen Hälfte treffen. Die native
Windows-`rand`-Folge bleibt von der QVM-Zufallsfolge getrennt. Der ältere zufällige
Deathmatch-Selektor hat ein 128-Punkte-Array ohne ursprüngliche Überlaufprüfung;
MiniLang weist einen 129. freien Punkt kontrolliert zurück. Der Team-Selektor
begrenzt seine Auswahl wie C auf die ersten 32 freien Punkte.

Normale Spawnpositionen erhalten neun Einheiten zusätzliche Höhe. Der erste
Initial-Punkt mit Flag 1 hat Vorrang, sofern er frei ist. Team-Auswahl unterscheidet
Anfangs- und Wiederkehrpositionen. Zuschauer übernehmen die Intermission-Position;
ein vorhandenes Target bestimmt ihre Blickrichtung. Fehlt der Intermission-Punkt,
greift die normale Spawn-Auswahl. Fehlt auch ein erforderlicher Deathmatch-Punkt,
brechen Original und Port mit einem Fehler ab.

## Leichen und Physik

`initQueue` reserviert acht wiederverwendbare `neverFree`-Entities. Beim Kopieren
wird zunächst der Spieler ausgelinkt. Die No-Drop-Prüfung liest **`s.origin`**,
nicht `r.currentOrigin`. Nur danach wird der Ringindex weitergeschaltet und der
Leichenplatz ausgelinkt, beschrieben und erneut verknüpft.

Der vollständige EntityState wird als Wert kopiert, einschließlich beider
Trajektorien und aller Vektoren. Ereignis, Powerups und Loop-Sound werden
zurückgesetzt, Todesanimationen in ihre jeweiligen Endbilder überführt und
Kollisionsmaske, Besitzer sowie Think-/Death-Handler gesetzt. Einige private
Felder bleiben wie im Original vom vorherigen Gebrauch erhalten, insbesondere
`body.health`. Die Tests vergleichen diesen alten Wert ausdrücklich.

In der Luft übernimmt die Leiche die Client-Geschwindigkeit und eine
Schwerkraft-Trajektorie. Am Boden wird die Trajektorie stationär. Der erste
Sinktermin liegt fünf Sekunden später. Solange der Zeitabstand höchstens
6.500 ms beträgt, sinkt die gespeicherte Basis um eine Einheit und erhält einen
Termin 100 ms später. Erst bei einem größeren Abstand wird die Leiche ausgelinkt
und `physicsObject` ausgeschaltet. `BodySink` allein bewegt nicht zusätzlich
die räumliche Serverposition und führt keinen neuen Link aus.

`frame.runEntities` verarbeitet Leichen mit Klasse `bodyque`, `physicsObject`
und einem Entity-Typ ungleich `ET_ITEM` ohne externen Handler. Die Implementierung
führt den ursprünglichen Nicht-Item-Pfad von `G_RunItem` aus: Trajektorie,
Server-Trace, Startsolid-Korrektur, Link, Think, No-Drop-Prüfung und Abprall in
dieser Reihenfolge. Der Abprall verwendet die ursprüngliche Float-Rundung und
Win32-Snap-Regel. Entfernen aus einer No-Drop-Zone respektiert `neverFree`.
Items, Team-Item-Rückgabe und sonstige Physikobjekte bleiben offene Frame-Grenzen.

`body_die` reagiert ab Gesundheit −40. Mit deaktiviertem `g_blood` setzt die
Funktion Gesundheit auf −39; andernfalls erzeugt sie `EV_GIB_PLAYER` und
deaktiviert Schaden sowie Kollisionsinhalt. `GibEntity` übernimmt auch die im
Baseq3-Quelltext enthaltene Suche nach dem ersten passenden Kamikaze-Timer.
Das ist keine vollständige Missionpack-Abnahme. `LookAtKiller` berücksichtigt
Angreifer, Schadensquelle und als Rückfall die eigene Blickrichtung.

## Nachweis und Grenzen

```powershell
python scripts/test_bodies.py --data-root D:/Quake3
```

Der C-Testhost extrahiert unveränderte Originalfunktionen und verwendet die
ursprüngliche Server- und BSP-Kollision. Er beobachtet vollständige EntityStates,
PlayerStates, Leichenplätze, private Felder, Verknüpfungen, Auswahlwerte, Traces
und den folgenden Zufallswert. Der Host ersetzt diese Regeln nicht durch ein
vereinfachtes Modell. Der nicht portierte Team-Item-Pfad bricht im Host bei einem
unerwarteten Aufruf ausdrücklich ab.

Prüfumfang und Ergebnis werden im [Prüfbericht](PARITY_AUDIT.md) sowie in
`reference/evidence.json` festgehalten. Die Fälle umfassen Auswahlgrenzen,
belegte Punkte, Gleichstände, Zufallsendpunkt, Team-/Intermission-Rückfälle,
alle EntityState-Felder, Ringumlauf, Schadens- und Zeitgrenzen, echte Gibs,
No-Drop-Geometrie, fallende Leichen und Kartenproben aus allen 31 CD-Karten.
Zehn zusätzliche Laufzeitverträge prüfen Initialisierung, Wertkopien und
kontrollierte Fehler. Der C-Arrayüberlauf wird nicht als definierte Parität
ausgegeben.

Auf CD-Karten werden vorhandene Spieler-, Team- und Intermission-Punkte sowie
passende Positions-Targets übernommen und Leichen mit der tatsächlichen
Kartengeometrie simuliert. Das sind gezielte Kartenproben, keine vollständigen
Matches. Bot-/Human-Spawnfilter aus `ClientSpawn`, tatsächliche Item-Entities und
Flag-Resets, Respawn-Eingaben, Client-Frames und die grafische Darstellung
bleiben Gegenstand der weiteren Integration. Todesmeldungen, Drop-Entscheidungen
und Score-Einbindung sind in [DEATHS.md](DEATHS.md) nachgewiesen.
