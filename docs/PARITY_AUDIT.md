# MiniQuake3: überprüfter Stand

Stand: 2026-11-21. Der Port ist **in Arbeit; eine interaktive Vorschau ist spielbar**.
Ein erfolgreicher Referenzlauf ist ein Lauf der ursprünglichen C-Engine,
kein Nachweis einer schon vollständig portierten MiniLang-Engine.

## BSP-Extraktion und Ladezeit, 21. November 2026

Der produktive `bsp_render_data`-Extraktor kopierte bisher beim Anfügen jedes
Dreiecks die bisherige Ergebnisliste und suchte bereits besuchte Flächen
linear. Dreiecke werden nun in einer wachsenden Liste gesammelt und die
Duplikatprüfung nutzt für mehrteilige Eingaben eine indexierte Markierung.
Der Retained-World-Pfad extrahiert einzelne Flächen und legt deshalb keine
Markierung an. Patch-Kontrollpunkte und die feste Dreiecks-Eckliste werden
direkt befüllt. Ausgabereihenfolge, Budget- und Fehlersemantik sind durch
`test_bsp_render_data.py` (63 Verträge, 7 Lighting- und 75 Patch-Normalen-
Referenzdatensätze), `test_world_surface_selection.py` (39 Verträge) und
`test_retained_world_batch.py` (51 Verträge) geprüft.

Ein isolierter Windows-A/B-Lauf gegen den Extraktor von `a9f5c8b` mit 5.000
synthetischen planaren Flächen und drei Wiederholungen ergab 219–235 ms für
den alten und 46–62 ms für den neuen Code; beide lieferten 15.000 Dreiecke.
Der für den Retained-World-Cache repräsentativere Einzel-Flächen-Lauf mit
15.000 Aufrufen lag bei 62–63 ms gegenüber 47–63 ms; hier ist der Gewinn
kleiner und nicht in jedem Lauf messbar. Das belegt den Extraktor, keine
reale Kartenladezeit oder Bildrate. Die
Retail-PK3 unter `D:/Quake3/baseq3` ist weiterhin nicht verfügbar.
Der Haupt-Build und die BSP-/World-Teiltests bestehen. Die erneute
Gesamtabnahme `python scripts/verify.py --data-root D:/Quake3` stoppt wie
zuvor am unveränderten Compilerfehler in `test_message_state_delta.py`
(`unknown data patch target: switch_case_body_22681_0`), vor den Retail-Gates.

## Bot-Zielwahl, 20. November 2026

Die produktiven Botlib-Traps 535/536 verwenden nach dem bereits eingeführten
Fuzzy-Gewicht-Cache nun einen wiederverwendeten Ergebnisdatensatz pro
Zielwahl. Dadurch entfallen die kurzlebigen zweielementigen Arrays für jedes
geprüfte Kartenitem. Die neue Regression prüft zwei Instanzen derselben
Itemklasse und die Invalidierung des Caches zwischen zwei Zielwahlen.
`scripts/test_ai_goal_selection.py` besteht mit acht nativen
Baseq3-Szenarien/35 Beobachtungen und 34 MiniLang-Verträgen. Der vollständige
Bot-Testlauf stößt beim unveränderten `bot_ai_frame`-Vertrag auf den
Compilerfehler `unknown data patch target: switch_case_body_146653_0`.
`python scripts/verify.py --data-root D:/Quake3` baut die Haupt-EXE und
besteht die vorausgehenden Core-, Numeric-, Cvar- und Message-Gates, endet
aber bei `test_message_state_delta.py` am gleichen Compilerfehlertyp
(`switch_case_body_22681_0`).
Ein Retail-FPS-Vergleich für diese Änderung steht aus: `D:/Quake3/baseq3`
enthält auf diesem Rechner derzeit keine `pak0.pk3`. Die früher gemessenen
37,73 FPS auf q3dm0 gelten weiterhin als letzte grafische Bot-Basis und
sind kein Leistungsnachweis für diese Änderung.

## Bot-Leistung, 16. November 2026

Nachprüfung des produktiven Fensterpfads: `runServerFrame` führte die von
`G_InitBots` eingereihten `addbot`-Befehle nicht aus. Der frühere grafische
q3dm1-Lauf mit 98,91 FPS maß daher keinen tatsächlich gestarteten Arena-Bot.
Mit ausgeführter Befehlsqueue bestätigt die Retail-Probe den Bot Crash auf
der ersten Singleplayer-Karte `q3dm0` und Ranger auf `q3dm1`. Nach 200 Frames
ist der Bot aktiv; `+scores` läuft durch die originale Cgame-QVM und Qagame
meldet Spieler 0 und Bot 1 in `scores 2`. Der Bot ist in beiden Karten
räumlich verknüpft; im untersuchten Frame ist er auf `q3dm1` im menschlichen
Snapshot, auf `q3dm0` außerhalb der aktuellen Sichtbarkeitszone. Der neue
grafische q3dm0-Lauf mit Bot erreicht **37,73 FPS über 2.000 Bilder**
(P95 86 ms, P99 171 ms).
Ein weiterer q3dm1-Lauf mit dem nun tatsächlich aktiven Ranger erreicht
**87,81 FPS über 1.000 Bilder** (P95 26 ms). Die Arenen sind wegen ihrer
unterschiedlichen Geometrie keine direkte Vorher-nachher-Messung.
Simulation, Geometrie und Renderer kosten im Mittel 9,22, 6,07 und 10,14 ms
je Bild. Das ist die nun maßgebliche, deutlich ungenügende Leistungsbasis.
Ein zusätzlicher 500-Bild-Lauf mit `MQ3_RENDER_PROFILE=1` misst im nativen
Renderer 1,76 ms für `hardwareDrawBatch` und 0,04 ms für `SwapBuffers` je
Profilbild; rund 9,74 ms liegen zwischen diesen Aufrufen im MiniLang-
Renderpfad und weiteren nativen Routinen. Der Flaschenhals ist damit nicht
die Bildübergabe an Windows. Der nächste Optimierungsschritt muss diese
Renderaufrufe genauer auflösen und zusammenfassen.
Die Konsolen-Zeichenlisten wachsen jetzt linear; ein 2.000-Bild-Lauf mit
gesendeter `^`-Taste endet ohne Absturz bei 37,89 FPS. Eine interaktive
Sichtprüfung des Bots und des Scoreboards steht noch aus.
Die Win32-Softwareansicht gibt für vollständig außerhalb liegende Viewports
jetzt 0 gezeichnete Dreiecke zurück. Die nativen Viewport- und
Stencil-Regressionsfälle prüfen wieder tatsächlich ungültige oder vollständig
unsichtbare Rechtecke; `test_win_shared_complete.py` besteht.
Die Mess- und Testwerte sind in
[`verification/2026-11-16-singleplayer-console-score.json`](verification/2026-11-16-singleplayer-console-score.json)
festgehalten.

Das QVM-Profil isolierte bei 200 Bot-Frames 205.824 AAS-Entity-Updates und
teure Zielwahl- und Bewegungs-Traps. `edgeAllowed` liest nun einmal beim
AAS-Laden berechnete Reise- und Flächenflags, statt pro geprüfter Kante eine
neue Flag-Tabelle zu erzeugen. Der QVM-Host vermeidet außerdem das Anlegen
eines leeren Botlib-Serviceobjekts je Entity-Update und wiederholtes Leeren
bereits leerer Area-Link-Arrays. 12 gewichtete Routing-Verträge, sechs
Retail-Routen, 30 Routingcache-Verträge, 15 originale Botlib-Records,
26 Botlib-Verträge und die Retail-AAS-/Qagame-Abnahme bestehen.

Der frühere grafische Retail-Singleplayer-Lauf mit q3dm1 erreichte
**5.000 Bilder in 50,552 s: 98,91 FPS, P95 25 ms, P99 50 ms**.
Die mittlere Spielsimulation benötigt 2,17 ms und der Renderer 2,17 ms je
Bild. Die frühere 2.000-Bild-Probe erreichte 51,24 FPS und 8,97 ms
Spielsimulation; die Kartenansichten und Laufzeiten unterscheiden sich, also
ist das kein bildgenauer A/B-Vergleich. Der 200-Frame-Qagame-Bot-Test sank
von etwa 4,8 s auf etwa 1,5 s. Mehrere hundert FPS, längere Mehrbot-Matches
und die menschliche interaktive Abnahme sind weiterhin offen.

Singleplayer-Korrektur: Das originale `spmap` setzt vor `G_InitGame`
`g_gametype=2`; der bisherige Menüpfad verlor diese Unterscheidung und damit
die automatische Arena-Botliste. Die Menü-zu-Match-Übergabe setzt nun den
Spielmodus, bewahrt ausstehende `addbot`-Befehle vor dem Leeren der Menüqueue
und liefert `score` an `GAME_CLIENT_COMMAND`. Die Retail-Probe mit q3dm1
prüft Ranger als Gegner, den menschlichen CS_PLAYERS-Eintrag und die
Scoreboard-Antwort. Die neue Score-Antwort lautet bei q3dm1
`scores 2 ... 0 ... 1 ...`: Beide Client-IDs werden als menschlicher
Spieler und Ranger durch die originale Qagame ausgegeben. Ein visueller
Scoreboard-Test im laufenden Fenster steht noch aus.

Der AAS-Cache verwendet jetzt Hash-Indizes für Routen, Cluster- und
Portaltabellen und aktualisiert LRU-Zeitstempel ohne Array-Kopie pro Treffer.
Die 30 Routing-Verträge und fünf Retail-Routenprüfungen bestehen. Die
200-Frame-Botprobe sank in ihren vier 50-Frame-Abschnitten von
625/3078/3688/2312 ms auf 453/1593/1766/1703 ms. Der Hardware-Lauf mit
Retail-q3dm1 und Singleplayer-Bot erreichte 2.000 Bilder in 39,033 s
(51,24 FPS), P95 49 ms; mittlere Spielsimulation 8,97 ms, Renderer 3,29 ms.
Vor der Änderung fielen 958 Bilder auf 3,62 FPS mit 258,76 ms Qagame-Zeit
pro Bild. Die Testlängen sind verschieden, daher ist das ein
Engpassnachweis und keine exakt kontrollierte FPS-Ratio. Mehrere hundert
FPS, lange Bot-Matches und der vollständige menschliche Scoreboard-UI-Test
bleiben offen.

Bots sind jetzt auch beim normalen Menüstart eingeschaltet (`bot_enable=1`).
Das Start-Server-Menü sendet `map` und danach verzögerte `addbot`-Befehle;
der Menü-zu-Match-Übergang übernimmt nur diese Bot-Befehle in den neuen
Command-Puffer. Der Retail-Sarge-Test startet über denselben Standard-Boot
und besteht 18 Spawn-Verträge sowie 512 Bot-Frames bis zum echten Usercmd.
Ein interaktiver Mehrbot- und Langzeittest bleibt offen.

Die Startbelegung ist jetzt im gemeinsamen UI-/Match-Keyzustand gesetzt:
WASD, Sprung, Ducken, Feuer, Zoom, Chat, Punktetafel und Waffen 1–9.
`m_pitch` startet mit `-0.022` für invertierte vertikale Mausbewegung.
Das Menü reicht geänderte Bindings und Cvars beim Kartenwechsel weiter.
Der frische Windows-Build stimmt mit allen eingefrorenen MiniLang-Eingaben
überein; 95 Frame-Input-, 29 App-Routing- und 22 Binding-Dispatch-Verträge
sowie ein fehlerfrei beendeter CLI-Aufruf des Retail-QVM-Pfads mit q3dm1
über zwei Frames wurden geprüft. Ein interaktiver Tastaturtest steht noch aus.

## Abschließender Fix für Controls und bewegungsabhängige Hänger

Der Controls-Absturz ist im vollständigen Retail-/Hardware-Pfad korrigiert:
Das originale, teilweise außerhalb des Fensters liegende Spieler-Viewport
behält seine Projektion; nur Raster-/Scissorgrenzen werden abgeschnitten.
Escape → Setup → Controls besteht mit tatsächlichen 3D-Modelldraws. Auch die
originalen Settings-Tests mit Sensitivity/Crosshair-Persistenz und laufendem
Cgame sind grün.

Für die Hänger waren zwei Laufzeitfehler maßgeblich. Die ursprüngliche
Freilistensuche verlor bei wechselnden Allokationsgrößen ihren Suchfortschritt;
zwölf Live-Samples der zwischenzeitlichen BSP-Regression lagen ausschließlich
im Allocator. Der geprüfte 16-Slot-Suchcache erhält passende Prefixe getrennt.
Der GC interpretierte außerdem Innenzeiger als Objektanfänge: Im gemessenen
Fall wurde `RenderVertex.shaderTime` als Struct-Header und das vorherige
Pointerfeld als Blockgröße verstanden. 243 von 266 Struct-Samples betrafen
solche Phantome mit bis zu 31.656.590 Feldern. Eine separate Startbitmap aus
einem geprüften echten Heap-Headerlauf ordnet erkannte Innenreferenzen jetzt
ihrem tatsächlichen Owner zu. Objektlayout, Tagged-Value-ABI, Standardbibliothek
und GC-Schwellen bleiben unverändert.

Beide Bootstrap-Stufen bestehen 144 neue Owner-/Child-Liveness-Verträge,
zehn alte GC-/Thread-/TLAB-Verträge und zwei byteidentische MLO-/Monolith-
Vergleiche. Die alte Version reproduziert fünf gezielte Liveness-Fehler.
Vier Allocator-Search- und sieben Größenmischungsproben prüfen weiterhin
Payloads und Wiederverwendung. Die abschließende Spielprobe enthält keine
Phantomobjekte: größter beobachteter Struct-Scan 24 Felder; ein Heapwalk
bestätigt den echten Owneranfang. Diese suspendierende Diagnose wird nicht
als FPS-Abnahme verwendet.

Zusätzlich teilt der private Weltcache identische BSP-Vertices innerhalb
einer Fläche wie das Original. q3dm1 hält dadurch 12.164 Vertex-Structs und
85.148 Attributarrays weniger. Alle 31 Retail-Karten mit 530.276 Dreiecken
stimmen gegen den eingefrorenen Extractor überein, einschließlich aller
Vertexfelder, Budgets, Fehlerfälle und unveränderter öffentlicher Aliase.
Interne Snapshots sammeln Entitynummern in einer Standard-Liste mit
Anfangskapazität 32; frische lokale Ringe folgen der tatsächlichen Entityzahl.
Öffentliche APIs, 1.024er-Grenze, Markierungsreihenfolge, Portal-Callbacks und
persistente Netzwerk-History bleiben erhalten. 34 eingefrorene Fälle mit
19.739 expliziten Ausgabelinien und die C-/Public-Verträge sind grün. Der
354-Dateien-MD3-Abgleich ist auch mit dem final installierten Compiler grün.

| Abschließende echte Retail-Messung | Ergebnis |
| --- | --- |
| Bewegung/Schießen, 30.000 Frames | 164,68 FPS; P95 9 ms; P99 11 ms |
| Größtes Bild im bewegten Lauf | 172 ms im zweiten Bild; danach keines über 100 ms |
| Privater Prozessspeicher | etwa 626 MB, über den Lauf stabil |
| Haupt-EXE, 5.000 Standframes, vollständige Szene | 169,65 FPS; P95 8 ms; maximal 163 ms |
| Normales originales Hauptmenü | 0,42 s |
| Direkter Matchstart | 2,641 s |

Die 1.000-ms-Latenzschranke besteht; der fortschreitende Einbruch auf 2 FPS
tritt im vollständigen bewegten Lauf nicht mehr auf. **Die 200-FPS-Abnahme
bleibt fehlgeschlagen**, und die dokumentierte Gesamtparität ist weiterhin
offen. Messgrenzen, fehlgeschlagene Zwischenstände, Quell-/Binärhashes und
Originaldaten stehen im [finalen Nachweis](verification/2026-11-15-runtime-safety.json).
Die Runtime basiert weiterhin auf `738d830`; der installierte Compiler hat
SHA-256 `147ba1627567408800b3bd5ddb42afe93b5ccc4f6b613c5435ee4b3846c89eaa`.
`scripts/bootstrap_allocator_toolchain.py --stage2 --install` verwendet den
vollständigen geprüften Runtime-Patch. Die historischen Patchdateien sind
alternative Diffs gegen dieselbe Basis, keine nacheinander anzuwendende Serie.

Die folgenden Abschnitte bewahren die vorherigen Zwischenstände und Fehler.

## Gepackte MD3-Animationsdaten statt dauerhaftem Vertex-Objektgraph

Die Heap-Typzählung nach einer beobachteten GC findet 295.317 einzelne
`surface_md3.PackedVertex`-Structs samt XYZ-Arrays. Ihre 590.634 Feldslots
stellen 47,6 % der Struct-Feldslots dieses Snapshots. Der Port decodierte
sämtliche Animationsframes im Voraus, obwohl der native Interpolationspfad
anschließend wieder Bytepuffer daraus bildete. Das Original hält dagegen
kontinuierliche `md3XyzNormal_t`-Records mit acht Bytes je Vertex.

Der produktive Basis-/LOD-Loader verwendet jetzt `loadPacked`: derselbe
vollständige Parser speichert direkt diese Framebytes. Die öffentliche
`load`-API bleibt eager; Referenzzugriffe auf packed-only Modelle decodieren
nur den angefragten Frame temporär und behalten keinen wachsenden Cache.
Ein unabhängiger eingefrorener Parser und Surface-Kernel aus `98a4d50`
bestätigen 354 Retail-Dateien, elf gültige Randfixtures und 40 Fehlerfälle:
50.371 Framebytefolgen mit 6.162.725 Vertexrecords stimmen vollständig
überein. Zusätzlich bestehen 3.684 native und 1.228 bitgenaue Referenz-
Interpolationsvergleiche, Eingabe-Alias-/Signed-XYZ-Prüfungen und die gezielt
fehlschlagende Eager-Fallback-Negativkontrolle. Geometrie, Retail-Match,
Ingame-Setup/Controls/System/GameOptions und C-Cull-/Retail-LOD sind grün.

Der folgende Heap-Snapshot des echten Spiels enthält **null PackedVertex-
Objekte**. Die unterschiedlichen Aufnahmephasen erlauben keine pauschale
Prozentbehauptung über den gesamten lebenden Speicher. Der bewegte Lauf
beendet alle 30.000 Frames mit 115,19 FPS, P95 13 ms und maximal 1.157 ms;
die unveränderte 1.000-ms-Abnahme bleibt fehlgeschlagen. Der separate
5.000-Frame-Standlauf erreicht 150,28 FPS, P95 10 ms, maximal 166 ms und
3,236 s Matchstart; auch die 200-FPS-/8-ms-Abnahme bleibt offen. Das normale
Hauptmenü erreicht 0,42 s. Ein weiterer, separat geprüfter Ansatz betrifft
doppelte Vertexobjekte innerhalb derselben BSP-Fläche; er wird nicht als
bereits abgenommener Fix gezählt. Nachweis:
[Packed-MD3-Abgleich und Messungen](verification/2026-11-15-packed-md3.json).

Die folgenden Abschnitte dokumentieren den vorherigen Fehlerkorrekturstand
und bewahren dessen teilweise fehlgeschlagene Messungen.

## Controls-Absturz im vollständigen Renderer und bewegte Langläufe

Der bisherige UI-/Cgame-Test ohne vollständige Geometrieaufbereitung war
für den erneut gemeldeten Controls-Absturz unzureichend. Ein neuer Test
übernimmt den produktiven Spielcode und fügt nur deterministische Eingaben
und Messausgaben ein. Er reproduziert auf echter Retail-q3dm1 mit OpenGL
Escape → Setup → Controls und Fehler 7691: Das originale UI-Spielermodell
verwendet bei 1280×720 ein Viewport `760,-60,480,840`. Dieses gültige,
teilweise außerhalb liegende Rechteck wurde irrtümlich zurückgewiesen.

Die Korrektur erhält das vollständige Projektionsrechteck einschließlich
Zentrum und FOV und schneidet ausschließlich Scissor-/Rastergrenzen auf den
Framebuffer. GL, serielle/parallele CPU-Rasterisierung und Stencilschatten
behandeln leere Schnittmengen und Endpunkte mit sicheren 64-Bit-Zwischenwerten.
23 Viewport-Verträge und unabhängige vollständige GL-Framebuffervergleiche
prüfen dies einschließlich des tatsächlichen Offscreen-Controls-Rechtecks.

Für Bewegung werden gleich große Material-Arrays und Dreieckswrapper
wiederverwendet. Die weiterhin begrenzten MD3-Pose-/Transform-Caches mit je
256 Einträgen besitzen jetzt Hashindizes statt vollständiger Ringsuchen;
Hashkollisionen prüfen nach wie vor den vollständigen Schlüssel. Transform-
Schlüssel besitzen ihre eigenen Positions-/Achsenwerte, damit spätere
Änderungen eines Aufrufers keinen Treffer mit veralteten Vertices erzeugen.
Ein exakter Vergleich über 3.000 Posen besucht 1.641 statt 680.500 Kandidaten.
Dies ist kein Nachweis eines entsprechenden Spiel-FPS-Gewinns und entfernt
die Transform-Allokation selbst nicht.

Ein 30.000-Frame-Standlauf des vorherigen Builds endet nach rund 180 Sekunden
ohne den gemeldeten dauernden FPS-Abfall. Nach 40 Sekunden bleibt der private
Speicher bei ungefähr 726 MB. Dieser Befund schließt den vom Benutzer
bestätigten bewegungs-/kampfabhängigen Fehler ausdrücklich nicht aus.
Der neue bewegte Replay prüft echte Positionsänderungen, Angriffs-Cmds und
verbrauchte Munition; ein reiner Kameralauf oder ein Standlauf genügt nicht.
Dieser Replay reproduziert nach ungefähr 6.500 Frames den gemeldeten
Einbruch auf wenige FPS und bis zu 14.049 ms pro Bild. Der Hauptthread wird
zwölfmal in der linearen Freilisten-Suche des Allocators erfasst; der
Aufrufer lässt sich im tatsächlichen Binary auf `collision.world.throughTree`
zurückführen. Diese Routine reservierte pro Trace einen Stack für alle
BSP-Knoten statt für die kleine DFS-Front. `throughTree` und `positionTest`
verwenden jetzt lokale, geometrisch wachsende Standard-Listen. Besuchsfolge
und Grenzfälle bleiben durch die Differentialtests überprüfbar; es wird
kein globaler Scratchpuffer eingeführt.
35 fokussierte Verträge erhalten unter anderem die alte DFS-/Pruning-
Semantik und prüfen einen über 32 Einträge wachsenden Stack. Ein schmaler
Trace in einem synthetischen BSP mit 4.096 Knoten allokiert 456 statt
32.936 Bytes. Zusätzlich bestehen jeweils 4.548 Differentialfälle gegen
den unveränderten Retail-C-Code mit Kurven an und aus (9.096 Fälle).

Die weitere Laufzeitdiagnose fand dieselbe Freilistensuche auch bei den
Trace-Besuchsmarkierungen und dem vorab reservierten 1.024-Entity-Ergebnis.
Besuchsmarkierungen verwenden jetzt private Bytepuffer; Bereichsabfragen
sammeln Treffer in geometrisch wachsenden Standard-Listen und geben ein
exaktes Array zurück. 23 zusätzliche Verträge einschließlich Rollback-
Negativkontrollen messen 3.160 statt 24.736 Bytes für Trace-Markierungen und
768 statt 8.664 Bytes für eine dünn besetzte Bereichsabfrage. Der unveränderte
C-Code bestätigt 4.628 Server-Weltoperationen mit 236.874 exakten Werten.
Nach den letzten Änderungen bestehen außerdem 17.920 Pmove-Kommandos mit
2.974.720 verglichenen Ausgabefeldern, jeweils mit und ohne Kurven.

Zusätzlich enthält der eingefrorene MiniLang-Compiler einen isolierten
53-Zeilen-Backport der Allocator-Suche aus `a40d726` auf Basis `738d830`.
Frontend, Standardbibliothek, ABI und GC-Auslösepolitik bleiben unverändert.
Der Patch liegt unter `patches/minilang-738d830-allocator-search.patch`;
`scripts/bootstrap_allocator_toolchain.py --stage2` reproduziert den
zweistufigen Bootstrap. Der installierte Compiler hat SHA-256
`280135a508ed0c113e62be6464e6812826afdfc239ae20d9d369b15666561113`.
Zehn unveränderte GC-/Thread-/TLAB-Verträge bestehen sowohl mit dem alten
als auch dem neuen Compiler; MLO und monolithischer Build liefern für die
separaten Pipeline-Proben identische Programme. Vier Fragmentierungsfälle
prüfen Inhalt und Wiederverwendung. Der Compilerpatch allein reichte im
bewegten Spiel nicht aus; die Datenstrukturkorrekturen sind ebenfalls nötig.
`heap_bytes_used()` bezeichnet den Heap-Höchststand einschließlich freier
Lücken, nicht lebende Objekte oder den Nachweis eines Speicherlecks.

Ein erster vollständiger Lauf des kombinierten Builds erreicht mit echten
Positionsänderungen, 15.000 Angriffskommandos und 87 Munitionsabnahmen alle
30.000 Frames: 117,99 FPS, Work-P50/P95/P99 7/13/20 ms. Der private Speicher
stabilisiert sich gegen Ende bei etwa 802 MB; der fortschreitende Einbruch auf
2 FPS bleibt aus. Dieser Lauf besteht die Latenzabnahme trotzdem **nicht**:
Ein Bild benötigt 1.855 ms bei einer unveränderten Schranke von 1.000 ms.
Die Rohdaten unter `build/reference/moving-final-query-storage` bleiben als
fehlgeschlagener Latenzlauf erhalten. Das beseitigt weder die offene
200-FPS-Abnahme noch ersetzt es eine allgemeine Langzeit-/Netzwerkabnahme.

Die Phasenmessung reproduziert auch ohne parallele Builds eine Spitze von
1.353 ms, davon 1.334 ms Geometrie bei unveränderter Texturzahl. Ein separater
5.000-Frame-Samplinglauf lokalisiert die verbleibende Pause tatsächlich in
`fn_gc_collect`: 115 aufeinanderfolgende Stichproben über etwa 1.201 ms,
davon 111 beim Markieren lebender Objekte und vier beim Sweep/Rebuild. Die
Sampler-Unterbrechungen summieren sich darin auf nur 9,34 ms. Die Zuordnung
zum Frame beruht auf Reihenfolge und Dauer, nicht auf exakten stdout-Zeiten.
Die vorherigen mehrsekündigen Freilisten-Suchen treten in dieser Form nicht
mehr auf. Der produktive MD3-Cache hält jetzt 32 statt 256 Einträge; verdrängte Posen
werden vollständig neu berechnet. API und Geometrie-/Dreieckbudgets bleiben
unverändert. Ein Vergleich mit sechs echten Retail-MD3-Teilen prüft über
96 bewegte Frames 768 Transformationen, 108.960 Vertices und 101.952
Dreiecke: Positionen und Normalen sind bitweise, Farben komponentengenau
identisch. Im gehaltenen Cachegraphen sinken Vertices von 36.320 auf 4.540,
Arrays von 109.728 auf 13.716 und Floatwerte von 217.920 auf 27.240. Auch
bereits vorbereitete Ansichten bleiben nach Verdrängung unverändert. Dies
belegt geringere Retention, die Spiel-Latenzabnahme folgt separat; das
GC-Limit wird nicht angehoben.
Der unabhängige Haupt-EXE-Lauf vor dieser Cacheanpassung misst 110,82 FPS,
3,949 s Matchstart, Work-P95 15 ms und maximal 194 ms bei 5.000 Standframes;
die 200-FPS-/8-ms-Abnahme besteht ausdrücklich nicht.

Der abschließende bewegte Lauf mit Cachegrenze 32 beendet wiederum alle
30.000 Frames: 108,44 FPS, Work-P50/P95/P99 8/13/21 ms, privater Speicher
ab etwa einer Minute stabil bei rund 811 MB. Die maximale GC-/Framepause
beträgt jedoch 1.968 ms: **Latenzabnahme weiterhin fehlgeschlagen**. Der
kleinere Modellcache ist daher keine vollständige Behebung der Reststopps.
Der neue vollständige Controls-/Renderer-Replay besteht 120 Frames; der
normale Hauptmenüstart erreicht 0,44 s. Die Untersuchung der tatsächlich
gehaltenen Heap-Typen läuft weiter. Die aktuellen und früheren Ergebnisse
sind im [zusammengefassten Buildnachweis](verification/2026-11-15-controls-stalls.json)
getrennt gekennzeichnet.

Der separat gemessene finale Haupt-EXE-Lauf mit Cachegrenze 32 erreicht
133,41 FPS über 5.000 Frames bei 3,350 s Matchstart, Work-P95 11 ms und
maximal 178 ms. Die vollständige getestete Szene enthält drei Views, fünf
Modelle und 524 Modelldreiecke. Die unveränderten 200-FPS-/8-ms-Schranken
bleiben fehlgeschlagen; diese Standmessung ersetzt den bewegten Lauf nicht.

## Mausprojektion und Setup im laufenden Match

Die originale `refdef.viewaxis[1]` zeigt nach links. Der Fenster-Renderer
erwartet eine Rechtsachse; die direkte Übernahme spiegelte daher die
horizontale Ansicht. `qvm_viewport` negiert diese Achse jetzt einmal an der
Projektionsgrenze. Native Maus-X/Y-Ereignisse bleiben unverändert: X steuert
Yaw, Y steuert Pitch. Richtungstests prüfen beide Achsen unabhängig.
Die Wolken verwenden dieselbe korrigierte Refdef-Basis; die eigenständige
Kamera mit bereits vorhandener Rechtsachse bleibt unverändert.

Ein weiterer Retail-Test reproduziert den Controls-Abbruch: unbelegte
Tasten lieferten bei `UI_KEY_GETBINDINGBUF` einen Nullwert statt der
originalen leeren, NUL-terminierten Zeichenkette. Der UI-Trap normalisiert
diesen Wert jetzt nur an dieser Grenze; der interne nullable Binding-Store
und die originale `Key_GetKey`-Semantik bleiben erhalten.

Der Matchhost berücksichtigt jetzt `UI_IS_FULLSCREEN`: Setup/Controls
erhalten einen eigenen 2D-Kommandostrom, und vorher eingereichte Cgame-Welt,
3D-HUD und Spiel-Cinematics werden darunter nicht gezeichnet. Nachfolgende
3D-Ansichten des UI bleiben erhalten. Das ursprüngliche Ingame-Menü bleibt
ein Overlay. Dies ist keine vollständige Abnahme aller Systemoptionen.
Die Prüfungen bestehen mit 13 Projektions-, 31 Himmel-, 20 Retail-Eingabe-
und 64 UI-Trap-Verträgen. Der erweiterte Retail-UI-Lauf öffnet Setup aus
dem laufenden Spiel, speichert Controls-Empfindlichkeit und Game-Options-
Fadenkreuz, öffnet System und kehrt ins Ingame-Overlay zurück. Tatsächliche
Cgame-Draws liegen zwischen den Interaktionen. Ein vorheriger Lauf belegt
den reproduzierten Null-Binding-Abbruch. Nachweise:
[`Mausachsen`](verification/2026-11-15-mouse-axes.json) und
[`Ingame-Setup`](verification/2026-11-15-ingame-setup.json).
Der eingefrorene neue Windows-Build besteht den produktiven Retail-Capture
mit fünf Modellen und 524 Modelldreiecken. Der neue 5.000-Frame-Lauf misst
157,27 FPS, 2,639 s Matchstart, Work-P95 9 ms und maximal 153 ms; die
200-FPS-/8-ms-Schranke besteht **nicht**. Die Ursache der Differenz zur
202-FPS-Basis ist noch nicht isoliert; beide Messungen bleiben erhalten.
Die funktionalen Korrekturen sind geprüft, die Leistungsabnahme ist offen.
Siehe [`Buildnachweis`](verification/2026-11-15-mouse-menu-build.json).

## Clientframe-Eingabe vom 15. November 2026

Auf der geprüften Renderer-/QVM-Basis `d7a7934` erzeugt der produktive
Host jetzt genau einen Usercmd samt `ClientThink` pro Clientframe.
Serverframes und Snapshots bleiben bei 20 Hz. Zuvor war auch die
Maus-/Blickbewegung auf diesen 50-ms-Takt begrenzt: Hohe Render-FPS
allein behoben diesen Bedienfehler nicht. Der echte Retailtest prüft
250 Ansichtsänderungen bei 250 Frames à 4 ms, zugleich exakt 20 Snapshots,
12 zusätzliche `cg_nopredict`-Ansichten und einen kurzen Schuss zwischen
zwei Serverticks.

Die lokale Winkelbasis wird einmal aus dem ersten Snapshot abgeleitet.
Neue Delta-Winkel bei Teleports werden danach nicht wieder neutralisiert.
Der lokale Cmd-Ring enthält ausschließlich den festen lokalen Client 0;
Botbefehle behalten eigene Usercmds/Thinks, auch beim Zuschauen eines Bots.
Cmdzeit und spätere Cgame-Drawzeit bleiben wie bei `CL_SendCmd` vor
`CL_SetCGameTime` getrennt; legitime Serverzeitkorrekturen dürfen eine neue
Cmdzeitepoche beginnen. Engine-Hostzeit und Cmdzeit sind ebenfalls getrennt.

Raw-UI-/Console-/Cgame-Ereignisse werden genau einmal in Zeitreihenfolge
verteilt. Key-ups lösen Bindings auch unter Catchern; Chat-Escape öffnet
kein zweites Menü, Menü-Escape lässt keinen zusätzlichen Angriff durch.
UI-Töne vor dem Cgame-Draw bleiben erhalten. Unbekannte Cgame-Plusbindungen
wie `+zoom` werden weitergereicht und bei Key-Clear wieder gelöst.
Zwölf originale Controls-Cvars werden vor `UI_Init` registriert und über
dieselben Cvarobjekte ohne neue Suchen pro Frame in die vorhandene
Input-Config übernommen. Hauptmenü-Shift, ganzzahlige Halbframes und die
unsigned 16-Bit-Winkelwerte in `usercmd_t`-32-Bit-Feldern stimmen wieder.

95 Kern-, 29 aus dem produktiven Appcode erzeugte Routingverträge,
7 unveränderte und unmaskierte C-Records sowie 18 Retail-Verträge prüfen
diesen Anschluss. Der neue unverfälschte 5.000-Frame-Matchlauf erreicht
bei gleicher Hardware/Auflösung **202,06 FPS**, Work-P95 7 ms, P99 9 ms,
Matchstart 2,499 s, weiterhin fünf Modelle und 524 Modelldreiecke.
Der kurze 1.000-Frame-Lauf erreicht 184,74 FPS und besteht dieselbe
200-FPS-Schranke nicht; beide Ergebnisse bleiben erhalten. Die früheren
219 FPS bezeichneten die Renderer-Basis mit fehlerhaftem 20-Hz-Input.
Der normale Hauptmenüstart besteht separat mit 0,30 s.
Einzelne Spitzen bis 151 ms und die vollständige Pause-/Joystick-/
`mlook`-/Centerview-, Netzwerk-, Bot-, Audio- und Langzeitabnahme bleiben
offen. Unit-Pauseflags belegen keine verdrahtete ganze Matchpause.
Die Nachweise stehen in
[`verification/2026-11-15-client-input.json`](verification/2026-11-15-client-input.json).
Zusätzlich bestehen auf diesem Stand sieben erneute Integrationsgates für
Cgame-Uhr, Cgame-Zeit, Prediction, Retail-Match, Original-UI, 512 Botframes
und die produktive Konsole. Die bestehenden Eingabe-, Binding-, UI- und
vollständigen `cl_input`-Gates sind ebenfalls grün. Das neue Clientframe-Gate
ist im Standard-Verifier registriert; die gesamte Suite wurde danach nicht
noch einmal vollständig ausgeführt.

## Hardwarepfad, Clipping und QVM-Basis vom 15. November 2026

Die integrierte Basis-Abnahme auf Ryzen 9 9900X / RTX 5080
erreicht mit q3dm1 bei 1280×720 **218,67 FPS über 5.000 vollständige
Spielbilder**, fünf Modellen und 524 Modelldreiecken. Der direkte Matchstart
benötigt 2,615 s; Work-P95 beträgt 6 ms, P99 8 ms, die größte Spitze 167 ms.
Die explizite Schranke `--min-fps 200 --max-work-p95-ms 8` besteht.
Dies sind frische Prozesse bei bereits vorhandenen OS-/Treiber-Caches,
ohne Capture/Trace/Profiler und ohne parallel laufenden eigenen Verifier.
Ein 5.000-Frame-Smoke ersetzt keine interaktive Langzeitabnahme; einzelne
größere Frame-Spitzen bleiben sichtbar. Der normale Nullargument-Start
erreicht das originale Hauptmenü separat nach 0,42 s. Der CPU-Referenzpfad
besteht ebenfalls einen produktiven Retail-Smoke, dient aber keiner
Hardware-FPS-Abnahme.

Die separate Rendererprobe dreht dieselbe Kamera in 360 Schritten und
wechselt dabei 250-mal die Faceauswahl. Im selben Testbinary und mit denselben
DLLs sinkt die mittlere Renderzeit von 18,514 auf 1,938 ms, P95 von
67,011 auf 4,495 ms und die größte Spitze von 570,393 auf 39,031 ms.
Beide Pfade behalten kumuliert 757.423 Dreiecke, ohne Budgetauslassungen.
Der Test hält den PVS-Cluster fest und enthält weder QVM noch Modelle,
Gameplay oder Audio: Seine 516 Renderer-FPS sind **keine Spiel-FPS**.
Die versionierten Messdaten stehen in
[`verification/2026-11-15-performance.json`](verification/2026-11-15-performance.json),
die vollständigen Rohdaten unter `build/reference/perf-2026-11-15/`.
Alle 522 Einträge des damaligen Standard-Verifiers sind über vier
fortgesetzte Fail-fast-Läufe und 13 nachträglich registrierte Gates grün;
dies ist kein einzelner ununterbrochener Neuaufruf. Die behobenen
Harnessprobleme und vollständige Gate-Liste stehen in
[`verification/2026-11-15-gates.json`](verification/2026-11-15-gates.json).

Der produktive Windows-Renderer zeichnet den bestehenden 128-Byte-Batch jetzt
direkt mit OpenGL auf der GPU. Welttransformation, Near-Clipping,
perspektivische Texturinterpolation und Depth-/Stencilprüfung erfolgen dort;
der normale Bildwechsel benötigt weder CPU-Rasterisierung noch `glDrawPixels`
oder GPU-Readback. Zwei Textureinheiten verknüpfen Retail-Basistexturen und
Lightmaps. Alpha, alle 72 Blendfaktorkombinationen, Mipmaps, Polygonoffset,
Depthhack, Scissor/Viewport, Stencilschatten und HUD besitzen echte WGL-Tests.
Ein wiederverwendeter Clientarray-Puffer fasst höchstens 4.096 Dreiecke je
Submission zusammen. 16 vollständige Framebuffervergleiche gegen den
vorherigen Immediate-Pfad sind exakt; auch fremde Array-/VBO-/TMU-Zustände
werden restauriert. Der isolierte 768-Dreiecke-Test misst 0,039 statt
0,027 ms: Diese Umstellung allein ist ausdrücklich kein gemessener FPS-Gewinn.
`MQ3_RENDERER=software` wählt den bisherigen Referenzpfad. Dieser schneidet
Dreiecke an der Near-Ebene, statt bei einem einzigen dahinterliegenden Vertex
die ganze Wandfläche zu verwerfen. Die seriellen und parallelen CPU-Ergebnisse
stimmen einschließlich interpolierter Vertexfarben und Depth exakt überein.
Auch die Frustum-Sphärentests berücksichtigen jetzt die Länge der
Seitennormalen und verwerfen sichtbare Wandränder nicht länger zu früh.

QVM-Lifecycle und Engine-Traps bleiben in MiniLang. Ein begrenzter nativer
Bytecodedispatcher führt die validierten QVM-Instruktionen aus und kehrt für
Traps nach MiniLang zurück; rekursive Aufrufe besitzen getrennte
Fortsetzungszustände. Dies ist kein Maschinencode-JIT. Der verwaltete
Interpreter bleibt als Referenz erhalten: 404 unveränderte C-Fälle vergleichen
Rückgabewert, vollständigen VM-Speicher, Zähler und Stack; weitere 26.934
Verträge prüfen unter anderem binary32, NaNs, Rekursion und Speichergrenzen.
Die Instruktionsadressentabelle wird einmal exakt groß angelegt. Kompakte
native Pläne, unveränderte-C-geprüfte Patch-Plane-Kandidaten und der entfallene
doppelte MD4-Durchlauf verkürzen den Mapboot.

Ein begrenzter FIFO-Cache hält 64 unveränderliche Welt-Traces und 32
Markfragment-Ergebnisse (höchstens 64 KiB pro Markeintrag). Temporäre,
Inline- und transformierte Modelle bleiben auf dem Referenzpfad; Map-/BSP-
und CM-Konfigurationswechsel invalidieren den Cache. Neue VM-Pointer werden
auch bei Treffern geprüft, Ausgabebytes werden kopiert und unbenutzte
Pufferenden erhalten. 42 Verträge und 360 tatsächliche Retail-Queries über
120 Cgame-Frames vergleichen die Ergebnisse exakt. Wiederholte Traces sinken
isoliert von 25,34 auf 1,35 µs, Marks von 121,34 auf 1,45 µs; dies sind
Dienstzeiten, keine FPS. 251 weitere native Grenzverträge unter 16
Rundungs-/FTZ-/DAZ-Modi sichern Kamera-/Achsen-/Plane-Konvertierung,
MXCSR-Restaurierung und überlaufsichere Größenprüfungen einschließlich
`INT_MAX`. Die dabei behobenen Randfälle konnten zuvor falsche Faces wählen
oder einen nativen Speicherzugriff auslösen. Die 404/26.934/384/7.168
bestehenden VM-, Float-, Sichtbarkeits- und MD3-Prüfungen bleiben grün.

Der Weltcache hält für genau eine Map vollständige Materialtemplates und
sammelt gewählte 128-Byte-Records sowie deren Metadaten in wiederverwendete
Puffer. Face-, Material- und Dreiecksreihenfolge bleiben erhalten;
Shaderupdates bearbeiten nur aktive Dreiecke. Statische Stufen werden einmal
vorbereitet. Autosprites, Portalansichten und übergroße Full-Map-Caches
verwenden weiterhin den ursprünglichen ausgewählten Builder. 51 Verträge
und 288 Retail-Vergleiche auf q3dm1/q3ctf1 prüfen auch Nebel, dynamische
Lichter, leere Maps/Auswahlen, Epochwechsel und die Fallbacks. Der native
Gather prüft alle Spans und überlappende Daten-/Metadatenpuffer vor dem
ersten Schreibzugriff. Dies beseitigt die großen Neubau-/GC-Spitzen beim
Drehen, ohne die Sichtbarkeitsentscheidung zu verschärfen.

Ein unabhängiger Vergleich mit direkten Original-GL-Aufrufen deckte außerdem
einen falschen `SRC_ALPHA/ONE`-Alias auf: Additive Shader verwenden jetzt
`ONE/ONE`. 240 vollständige GPU-Framebuffervergleiche prüfen die acht Aliase
und 72 Faktorkombinationen mit partieller, gefilterter und null Alpha.
448 Softwarevergleiche sichern dieselben Aliase; Shaderbatches verwerfen
Alpha null nur bei explizitem Alpha-Test und erhalten korrekte Depthwrites.
Die direkte Font-API behält ihren transparenten Zeichenpfad.

Die MD3-Interpolation und Welttransformation verwenden gepackte native
Puffer, geprüft über 7.168 exakte Vektoren. 160 zusätzliche native Aufrufe
unter 16 Rundungs-/FTZ-/DAZ-Modi prüfen vom Aufrufer unabhängige Berechnung
und exakte MXCSR-Restaurierung. Der Sichtbarkeitsfilter arbeitet
bei einem Budget für die vollständige Karte auf gehaltenen Face-Daten;
PVS-Ermittlung, begrenzte Budgets und Sortierregeln bleiben in MiniLang.
384 Retail-q3dm1-Vergleiche erhalten Face-Reihenfolge und alle
Ablehnungszähler. Es werden keine Dreiecke für eine höhere FPS-Zahl ausgelassen.
Batchvertices werden gesammelt geschrieben; Himmel-Geometrie und
Kameraachsen werden wiederverwendet. Die Himmelsschichten verwenden wieder
die originale opake beziehungsweise `GL_ONE + GL_ONE`-Mischung, ohne
Depthwrite; 27 Verträge, drei Retailkarten mit sechs Schichten und ein nativer
Farbvergleich einschließlich gemeinsamer Dreieckskante bestehen. Der
CPU-Rasterizer füllt gemeinsame Kanten halb offen, sodass additive Flächen
dort nicht doppelt eingefärbt werden. Ein leerer Face-Vergleich greift nicht
länger über eine absteigende `0..-1`-Schleife auf ein leeres Array zu.

Der Mono-Loopcache wurde bisher fälschlich mit `for each` über ein
`std.ds.list.List` gesucht. Dadurch wurde derselbe Sound immer wieder
dekodiert und der Cache wuchs pro Frame. Eine direkte Handle-Tabelle hält
nun genau einen Eintrag; 46 Audioverträge sichern auch später registrierte
Handles ab. Bei sechs Retail-`fire1`-Loops über 20 Bilder sank der isolierte
Test von 171 auf 16 ms und von 120 auf einen Cacheeintrag.
Die Buildflags verwenden außerdem ein GC-Allokationsintervall von 256 MiB;
das zuvor zu kleine Intervall erzeugte im integrierten Build dauernde
Collections. Heapreserve und initialer Commit bleiben getrennte Einstellungen.

Der Menüwechsel behält HWND und WGL-Kontext bei. Der Retail-HUD-Kopf erhält
jetzt den Namens-/Skin-Katalog statt des Modelobjekt-Arrays; der neue
Retailtest verlangt 117 texturierte Kopfdreiecke ohne Ersatzmaterial. Beim
Laden wird kein künstlicher Vorwärtsbefehl mehr eingespeist.

Ein längerer Integrationstest deckte einen weiteren wesentlichen Fehler auf:
Die Szene sammelte Entities über mehrere Bilder, obwohl `RE_ClearScene` nur
Subscenes desselben Frames trennt. Nach 1.022 Einreichungen verschwanden
Waffe und 3D-HUD. Der Host setzt jetzt die Scene-, View- und 2D-Queues genau
einmal pro Rendererframe zurück; UI-Ausgabe hängt anschließend an die
Cgame-Subscenes an. Die neue Retail-Regression besteht über 120 Cgame-Frames
mit 1.868 kumulierten Entities bei maximal 17 pro Frame, anschließend weiterhin
16 Modell-Einreichungen und 1.617 texturierten Dreiecken. 240 UI-only
Player-Setup-Frames mit 1.200 kumulierten Entities behalten ihre fünf Modelle.
Die vorherige 120-Frame-Messung mit null Modellen ist deshalb keine gültige
Performance-Abnahme und wird nicht als Beschleunigung gewertet.

Konsolenbuchstaben werden in einem gehaltenen, geometrisch wachsenden
Glyphbatch gesammelt statt mit zwei Einzelaufrufen pro Zeichen ausgegeben.
Dabei gelten die Original-Charset-Mischung `SRC_ALPHA/ONE_MINUS_SRC_ALPHA`
und Vertexfarben; der alte opake weiße Text war falsch. Vierzehn Layout-/
Wachstumsverträge und ein exakter nativer Farb-, Alpha-, Schatten- und
Depthvergleich prüfen diesen Pfad, zusätzlich zu den 38 bestehenden
Displayverträgen und der Retail-Atlasprüfung.

Die produktiven binary32-Grundoperationen verwenden SSE2 mit festgelegtem
Rundungs- und Denormalmodus; der vollständige MXCSR-Zustand des Aufrufers
wird restauriert. Der unabhängige MiniLang-Bitpfad bleibt Differentialreferenz.
517.640 Ergebnisvergleiche und 583.296 ABI-/Kontrollaufrufe unter 32 Modi
prüfen Werte, NaNs, Operandenreihenfolge und Ausnahmemasken. Zusätzlich bleiben
101.445 Original-C-Zahlenvergleiche und die Pmove-, Shader-, View- und
MD3-Gates grün. Dies beseitigt einen wesentlichen CPU-Hotpath, ohne die
originale Floatsemantik durch gewöhnliche binary64-Arithmetik zu ersetzen.

MD3-Dreiecke behalten ihre echten Meshvertex-IDs durch Geometrie und
Shaderbatches. Identische Framepaare setzen wie `RB_SurfaceMesh` den Backlerp
auf null. Seams, Entities und Surfaces bleiben getrennt; geänderte Indizes
invalidieren den Stagecache. 16 neue Verträge vergleichen auch die nativen
Replaybytes. In der 120-Frame-Retailprobe mit weiterhin fünf Modellen und
524 Dreiecken sank die isolierte Stage-Auswertung von 1,042 auf 0,483 ms.
Weitere 11 Ownership-Verträge sichern die Wiederverwendung eigener
MD3-Null-UVs und frische feste Vertexfarbarrays bei Lichtwechseln ab;
Inline-BSP-Daten und ältere Viewfarben werden dabei nicht überschrieben.
Zwei vor jeder Stagecache-Abfrage erzeugte und anschließend stets
überschriebene Arrays pro Corner entfallen. 216 relevante Verträge, vier
Original-C-Datensätze und eine 120-Frame-Retailprobe erhalten sämtliche
nativen Stagebytes. Ein unbedingtes zusätzliches `sleep(1)` nach jedem
Frame entfällt ebenfalls; nur Arbeit unter einer Millisekunde gibt die
verbleibende Zeit ab.
Die FPS-Abnahme dieses Basis-Checkpoints misst Renderframes. Er erzeugte
Usercmds noch nur im 50-ms-Servertakt; die oben dokumentierte Folgearbeit
behebt diesen konkreten Eingabeanschluss. Die Render-Abnahme allein
belegt keine abgeschlossene 1:1-Bedienung.
Licht- und Nebelquellen werden außerdem exakt groß angelegt statt quadratisch
konkateniert; leere Portalgeometrie und `RDF_NOWORLDMODEL` vermeiden einen
unnötigen BSP-Durchlauf.

Der Eingabehost reicht bereits normalisierte Quake-Tastencodes direkt an
Bindings und UI weiter. Die zuvor doppelte Windows-Übersetzung machte zum
Beispiel `w` zu einer Funktionstaste. Fokusverlust löst gehaltene Tasten und
Angriff zuverlässig; inaktive Raw-/Legacy-Mausereignisse werden verworfen.
Absolute Raw-Mauskoordinaten werden auf den richtigen Desktop umgerechnet
und beim Geräte-/Moduswechsel neu verankert. Native Regressionen sowie
256 Quake-Key-Abbildungen prüfen diese Pfade. Begrenzte Smoke-Läufe pumpen
weiter Fensternachrichten, nehmen aber keine physische Spielsteuerung an;
der unbeschränkte interaktive Spielstart verwendet normale Eingaben.

Die Retailtests laufen in dieser Sitzung mit `--data-root build` und dem
legal vorhandenen `build/baseq3/pak0.pk3` (479.493.658 Bytes, SHA-256
`7ce8b3910620cd50a09e4f1100f426e8c6180f68895d589f80e6bd95af54bcae`).
Die ursprünglichen 1.32b-QVMs werden aus dem unveränderten Originalbaum
neu gebaut. Der alte lcc-Treiber konnte dabei absolute Pfade mit Leerzeichen
nicht an seinen Präprozessor weiterreichen; relative Buildpfade beheben dies
ohne Änderungen an den Originalquellen. Native Buildausgaben und identische
MiniLang-Zielausgaben sind gegen parallele Schreibzugriffe gesperrt.

Die folgenden Abschnitte dokumentieren ältere Zwischenstände. Insbesondere
die dort genannte Beschränkung auf reine CPU-Rasterisierung ist durch den
neuen Hardwarepfad überholt. Eine vollständige visuelle, Netzwerk-, Audio-
und Langzeitabnahme sowie das Ziel mehrerer hundert FPS bleiben gesonderte
Anforderungen; bestandene Teiltests ersetzen diese Abnahmen nicht.
Gewöhnliche shaderabhängige Front-/Back-Cullmodi samt Spiegelumkehr werden
im gehaltenen Batch-ABI noch nicht bis OpenGL weitergereicht. BSP-/Modell-
Frustumculling und Stencil-Cullzustände funktionieren; dies ist eine konkrete
verbleibende Renderer-Paritätslücke.
Die UI-only-Player-Preview hält ihre Retail-3D-Submissions jetzt zuverlässig;
der Menühost gibt bislang aber nur deren 2D-Befehle sichtbar aus. Der
Lifecycle-Test belegt somit keine vollständige sichtbare 3D-Menü-Parität.

## Produktiver Frame-Hotpath vom 4. November 2026

Der produktive QVM-Matchpfad führt die nur für Differentialbeobachtung
vorgesehenen nativen Game-/Cgame-Spiegel nicht länger in jedem Bild aus. Der
Audiomischer besitzt einen nativen, bitgenau gegen den bisherigen MiniLang-Pfad
geprüften Paint-Block. Renderbefehle wachsen über `std.ds.list` und werden erst
nach dem QVM-Aufruf einmal materialisiert, statt bei jedem `RE_SetColor` und
`RE_StretchPic` das vollständige Array zu kopieren. Das native Fenster packt
die beiden Dreiecke eines HUD-Rechtecks in einem Aufruf; bei unveränderter
QVM-2D-Topologie überschreibt der Renderer die bestehenden Batchbytes direkt.
Statische Weltshaderstufen behalten ihre fertig berechneten Achsen-, Farb- und
Fogwerte, während animierte, deformierte, umgebungs-, Wellen-, Portal- und
Nebelstufen weiterhin pro Bild aktualisiert werden.

Die gezielten Gates bestehen mit 43 QVM-Audioverträgen, 18 exakten
Sound-Paint-Datensätzen, 62 Weltbatch-, 35 QVM-2D- und 32
Rendercommand-Verträgen; außerdem bleiben 21 unveränderte-C-`ComputeColors`-
Datensätze mit 14 Verträgen und alle elf Hotpath-Wächter grün. Der reale
20-Frame-q3dm1-Lauf in
`build/reference/playable_perf/optimized-hud-topology-20.log` misst im Mittel
30,3 ms Simulation, 18,05 ms Geometrie, 35,15 ms Batchpflege, 25,55 ms Rendern
und 1,95 ms Audio, insgesamt 111 ms pro Bild. Gegenüber dem unmittelbar davor
gemessenen stabilen Stand von 129,45 ms sind das rund 14 Prozent weniger; die
Vorschau läuft damit ungefähr mit 9 FPS, nicht mit den angestrebten mehreren
hundert FPS. Der Boot des direkten Match-Smokes benötigt weiterhin 25,47 s;
der normale Nullargument-Start bleibt durch das verzögerte Weltladen schneller.

Die verbleibende Rendergrenze ist strukturell: `native/playable_win32.c`
rasterisiert Welt und Modelle noch auf der CPU in einen Pixelpuffer und benutzt
OpenGL anschließend nur für `glDrawPixels`. Schon der gemessene reine
Renderanteil begrenzt diesen Pfad auf unter 40 FPS. Eine ehrliche Abnahme mit
mehreren hundert FPS setzt daher einen hardwarebeschleunigten OpenGL-Batchpfad
mit Texturen, Depth-, Blend-, Alpha-, Stencil-, Scissor- und Portalzuständen
voraus; diese Umstellung und ihre visuelle A/B-Abnahme sind noch offen. Der
frisch gebaute Windows-Stand hat SHA-256
`f5638b26334ab3cb455cb296505a26dbb87a13d503260d612e298ea1aeb21840`.

## Auditkorrekturen vom 1. November 2026

Ein zusätzlicher Laufzeit- und Fehleraudit hat vier produktive Hotspots
geschlossen. Der Netzwerkpump besitzt nun je Socket dauerhafte Daten- und
Adresspuffer; ein leerer nichtblockierender Poll allokiert nicht länger zwei
Puffer, und Transport- sowie Paket-Callbackfehler werden bis zum Engine-Frame
weitergereicht statt als erfolgreich verarbeitet zu gelten. Die verzögerte
Server-Netchan-FIFO verwendet `std.ds.queue` mit O(1)-Enqueue/Dequeue statt
Arraykopien. Der Snapshotbau kopiert einmal in einen exakt großen Puffer und
sortiert bis zu 1.024 Entitynummern mit `std.sort` in O(n log n), einschließlich
Duplikatprüfung und vom Aufrufer getrennter Ausgabe. Snapshot-Runtime und
Serverwelt wachsen beziehungsweise allozieren ihre Entity-, Cluster-, Stack-
und Ergebnisfelder einmal statt in den inneren Schleifen zu konkatenieren oder
zu slicen.

22 Network-Pump-, 26 Server-Netchan- und 27 Snapshot-Verträge bestehen; der
Maximalsnapshot prüft alle 1.024 Entities. Der q3dm1-Serverweltvergleich stimmt
mit und ohne Kurven über jeweils 2.250 Operationen und 116.243 exakte Wörter.
Der vollständige Windows-Build hat SHA-256
`8bcb49ecd0731292c80d4bcccc14cc53e37238b5eebb5ac6db228bbe7093a7da`;
das Originalmenü erschien im Nullargument-Start nach 0,92 Sekunden. Der
gekoppelte Retail-QVM-Match bestand erneut über acht Frames mit 2.345
texturierten Dreiecken, 17 Renderpässen, 301 Cgame-Assets, 26 Sounds und null
nicht unterstützten Entities. Die breite Prüfkette deckt weiterhin nur
automatisierbare Verträge und Retail-Replays ab: belastbare Langzeitläufe,
Original-Server/Port-Client-Interoperabilität sowie visuelle und akustische
A/B-Abnahmen bleiben Voraussetzungen für eine ehrliche vollständige
1:1-Freigabe. Die gesamte registrierte Retail-Prüfkette wurde nach jeder dabei
gefundenen Fixture-Korrektur exakt am betroffenen Gate fortgesetzt und endete
mit grünem CM-Load über 31 Karten, 434 exakten Datensätzen und dem produktiven
Spatial-Lauf über 141 exakte Felder.

Der Prüfharness löst `--data-root` jetzt vor dem Wechsel in Test-Unterordner
absolut auf. Sechs veraltete Whole-Program-Fixtures erhielten kollisionsfreie
Helpernamen, und die Mark-Fragment-World-Fixture bildet die aktuelle
vollständige Collision-World-Struktur ab. Damit messen die betroffenen Gates
wieder den Port statt Pfad- oder Symbolauflösungsfehler des eingefrorenen
Compilers.

Der Doppelklick-Starter verwendet nun tatsächlich denselben portablen
Nullargument-Pfad wie die EXE: `baseq3/pak*.pk3` und `qvms/*.qvm` werden neben
`MiniQuake3.exe` gesucht, ohne fest verdrahtetes Laufwerk und ohne `q3dm1` vor
dem Hauptmenü zu laden. Der zuvor widersprüchliche Startertest bildet diesen
Original-Startfluss wieder korrekt ab.

Im dauerhaften Original-UI-Pfad werden verarbeitete Sound- und Hostbefehle
jetzt pro Frame geleert. Zuvor blieben beide Arrays während der gesamten
Menüsitzung erhalten, sodass jeder neue QVM-Befehl den kompletten Verlauf
kopierte. Der Audioplayer besitzt zusätzlich eine direkte, bei späterer
Registrierung nachwachsende Handle-Tabelle; One-shots und Loops durchsuchen
nicht länger für jeden Start den ganzen Soundkatalog. Der räumliche Mixer und
die pro Frame erzeugten View-/Portal-Sammlungen verwenden `std.ds.list` statt
wiederholter Array-Konkatenation. Der neue vollständige Hauptbuild hat
SHA-256 `bfb4bcf3b750464b042467beaa3b5b2437f1de1b70af58e2fa6016095dbe22d1`.
41 QVM-Audio- und 43 Spatial-Mixer-Verträge, die Starter-/Menügates und der
reale Nullargument-Windows-Start sind grün; das Originalmenü erschien nach
1,12 Sekunden. Der gekoppelte Retail-QVM-Match bestand über acht Frames mit
2.345 texturierten Dreiecken, 17 Renderpässen, 301 Cgame-Assets, 26 Sounds
und null nicht unterstützten Entities. Die vollständige 1:1-Abnahme bleibt von den
unten dokumentierten Netzwerk-, Renderer-, Audio- und Langzeitgates abhängig.

## Laufzeit-, Start- und Zustandskorrekturen vom 31. Oktober 2026

Der Standardstart öffnet jetzt zuerst die originale `ui.qvm`, ohne bereits
`q3dm1` samt Weltshadern zu laden. Erst der originale `map`-/`spmap`-Befehl
startet `qagame.qvm` und `cgame.qvm`; ausgewählte Karte, Cvars, Userinfos und
Tastenbelegungen werden dabei in den Matchzustand übernommen. `pak*.pk3`
werden in originaler Reihenfolge aus `baseq3` neben der EXE gestapelt, wobei
spätere Pakete frühere Dateien überschreiben. Qpath-Zugriffe werden gegen
Verzeichnisausbruch geprüft.

Die beim minutenlangen Start sichtbaren quadratischen Kopierpfade sind
entfernt: Shader-/PK3-Indizes, PVS-Sichtmengen, MD3-Frames, 2D-Batches und
dekodierte Mono-Samples werden wiederverwendet; Snapshot- und Audioqueues
verwenden Listen beziehungsweise Cursor statt wiederholter Array-
Konkatenation und `slice`. Weltgeometrie wird bei unveränderter Face-Auswahl
nicht erneut abgeflacht. Der native Rasterpfad unterstützt nun sämtliche
gültigen Baseq3-`blendFunc`-Faktorkombinationen statt unbekannte Kombinationen
stillschweigend opak zu zeichnen. Game-/UI-VM-Lifecycle und Bot-Snapshots
behandeln Lade-, Restart-, Shutdown- und Client-Reset-Fehler explizit.

Der frische produktive Build hat SHA-256
`144426dc44002765926f36eea321b56c2f082d59453f0b5bc82bdd12e8e99129`.
Gezielte Regressionen sind grün: 63 Material-, 55 Szenengeometrie-, 33
Weltselektions-, 40 Audio-, 32 2D-Batch-, 12 Bot-Bridge-, 22 Game-VM- und 23
UI-VM-Verträge; außerdem Retail-Original-UI und ein nativer QVM-Renderframe.
Eine erneute breite Gesamtabnahme mit `D:/Quake3` lief ohne Regression durch
Kern-, Netzwerk-, VM-, Archiv-, Collision-, Shared-Game-, Game-Lifecycle-,
Bot-, Kartenobjekt-, Target- und Combat-Bereiche. Der abschließende gekoppelte
Retail-QVM-Match ist ebenfalls grün: acht Frames, 2.345 texturierte
Dreiecke, 17 Renderpässe, 301 Cgame-Assets, 26 Sounds und keine nicht
unterstützten Entities. Ein dabei gefundener Testfehler
vergleicht `ColorBytes3` jetzt nur noch über die drei vom Original definierten
Bytes; das vierte Byte ist in der C-Funktion absichtlich uninitialisiert.

Der Build besitzt zusätzlich einen inhaltsadressierten MiniLang-Cache. Ein
unveränderter 766-Modul-Hauptbuild wird dadurch nicht bei jeder Verifikation
erneut kompiliert; Änderungen an irgendeiner MiniLang-Quelle, am eingefrorenen
Compiler oder am Toolchainprofil invalidieren den Cache vollständig.

Die zuletzt vollständig ausgeführte Retail-Prüfauswahl umfasste **408 Gates**
(`python scripts/verify.py --data-root D:/Quake3`) und bestand vollständig am
22. Oktober 2026 mit dem eingebundenen Retail-`pak0.pk3`. Der dabei frisch
gebaute `MiniQuake3.exe`-Build hat SHA-256
`c53284b8d10e5d8aa811adb1efe241089185ee9359e35d8d3b8fbb696320192b`,
das zugehörige `build/verification.json` SHA-256
`52d4c214a166500abb36d2aa0eea775f2c521b12a54833c7296684d3ffab6218`.
Der Lauf enthält den zusammenhängenden Retail-qagame/cgame/ui-Boot mit neun
Prediction-Traces, 2.345 vollständig texturierten Szenendreiecken, 17
Renderpässen, 26 Soundbefehlen und interaktiver Original-UI sowie den
512-Frame-Bot-Spawn, alle 31 BSP-Karten und die produktiven Windows-Grenzen.

Der native Quellenabgleich portiert jetzt außerdem die zuvor unbegonnenen
Botlib-Basisdateien `l_crc.c/.h` und `l_libvar.c/.h` vollständig. Der gemeinsame
CRC-16/CCITT-Pfad berechnet produktiv die AAS-Routingcache-Prüfsummen; die
originale LibVar-Semantik mit Groß-/Kleinschreibungs-unabhängiger Suche,
Default-Erzeugung, Zahlenwert und Modified-Zustand versorgt den produktiven
Botlib-Lifecycle. 21 Datensätze aus unverändert extrahierten Originalfunktionen
und 18 zusätzliche MiniLang-Verträge belegen diesen Block.

Vier weitere zuvor unbegonnene Originaldateien sind vollständig nativ
zugeordnet. `cg_ents.c` verarbeitet jeden produktiven Retail-Snapshot durch
einen privaten Cent-/Snapshot-Observer mit allen Entitytypen, Interpolation,
Moverkorrektur, Tags, Sounds und Lichtern. `cg_effects.c` erhält die neuen
Ereignisse aus demselben Matchpfad und bildet Lebenszeiten, Trajektorien,
Medien, Zufallszweige, Licht-, Mark- und Audiofelder nach. `cg_localents.c`
stellt den 512er Pool samt Freelist, Fragmenten, Bounce, Trails, Fadevarianten,
Explosionen, Score-Plums und Missionpack-Effekten bereit. Solange die Retail-
`cgame.qvm` aktiv ist, markieren alle drei nativen Spiegel ihre sichtbaren und
hörbaren Grenzen als unterdrückt, sodass kein Effekt doppelt ausgegeben wird.
`ui_sparena.c` bildet zusätzlich Mindest-Clients, Training-/Finalauswahl,
Tierzahl, `ui_spSelection` und den angehängten `spmap`-Befehl exakt ab. Die
Fokustests bestehen mit 27 Datensätzen aus unveränderten C-Funktionen und 98
MiniLang-Verträgen. Ein anschließender produktiver Hauptbuild und das Retail-
QVM-Match bestanden mit neun Prediction-Traces, 2.345 texturierten Dreiecken,
301 Cgame-Assets und 26 Sounds. Die vollständige 283-Gate-Auswahl wurde für
diesen inkrementellen Block nicht erneut ausgeführt.

Der anschließende Block schließt fünf weitere Originaldateien. `cg_weapons.c`
deckt Registrierung, Auswahl, View-/Player-Weapon, Mündungsfeuer, Trails,
Hülsen, Treffer, Tracer und das Shotgun-Muster ab; die produktiv dekodierten
Retail-Ereignisse speisen diesen nativen, nicht doppelt dispatchenden Spiegel.
`cg_view.c` führt für jeden Retail-Snapshot die originale Kamera-, Bobbing-,
Damage-, FOV-, Zoom-, Audio- und `CG_DrawActiveFrame`-Reihenfolge aus.
`cg_drawtools.c` enthält die 640x480-Skalierung, Quake-Farbcodes, Bilder,
Rahmen, Kachelung sowie feste und proportionale Fonts. `tr_animation.c`
implementiert vollständige MD4-Oberflächenabgabe, 3x4-Bonematrix-Interpolation
und gewichtetes Skinning; `ui_credits.c` liefert das komplette Credits-Menü.
35 Datensätze aus unveränderten C-Funktionen und 141 native Verträge bestehen.
Der danach frisch gebaute Hauptstand hat SHA-256
`4c33d861d9b88458d1ea83e997806f77ed1e6058ae73f5839d2d8ac85c5af640`;
das Retail-QVM-Match bleibt mit neun Prediction-Traces, 2.345 texturierten
Dreiecken, 301 Cgame-Assets und 26 Sounds grün. Das Inventar zählt nun 26
vollständig portierte Originaldateien, 118 partielle und 191 noch nicht
begonnene Dateien im Runtime-/Plattformumfang.

Der neue Quellenblock schließt weitere fünf Originaldateien. `cg_draw.c` bildet den kompletten HUD-/2D-Pfad einschließlich Statusleiste, Scoreboard, Lagometer, Crosshair, Teamoverlay, Votes, Warmup und aktiver Stereo-Szene ab. `cg_particles.c` portiert den 8.192-Slot-Pool mit allen Spawn-, Update-, Recycling- und Renderpfaden. `cg_servercmds.c` verarbeitet Configstrings, Scores, Chat, Voicechat, Shader-Remaps und Map-Restarts. Die beiden Originalmenüs `ui_display.c` und `ui_sound.c` enthalten ihre vollständige Konstruktion, Cvar- und Restart-Semantik. Insgesamt bestehen 36 unveränderte C-Datensätze und 135 native Verträge. Serverbefehle, Partikel und Draw-State laufen aus dem produktiven Retail-QVM-Match als nicht doppelt ausgebende Beobachter. Der frische Hauptbuild hat SHA-256 `bae4743ee1d0f48ec9dcd5feb3514f7c0183ad63d6330c7523a1b742a37bfb1f`; das Retail-QVM-Match bleibt bei neun Prediction-Traces, 2.345 texturierten Dreiecken, 301 Cgame-Assets und 26 Sounds grün. Das Runtime-/Plattforminventar zählt jetzt 31 portierte, 118 partielle und 186 nicht begonnene Originaldateien.

Der nächste Abgleich schließt `cg_main.c`, `cg_marks.c`, `ui_qmenu.c`,
`ui_network.c` und `ui_options.c`. Der native Cgame-Hauptpfad bildet Lifecycle,
VM-Dispatch, Cvars sowie Sound-, Grafik-, Client- und Menüregistrierung ab und
läuft im produktiven Retail-Match als unterdrückbarer Begleiter der QVM.
`cg_marks.c` enthält den vollständigen 256er Mark-Pool, Fragmentprojektion,
Impact-Erzeugung, Lebenszeit, Farbe und Fade; produktive Trefferereignisse und
Frames speisen diesen Zustand. Der QMenu-Port umfasst Menü- und Item-Lifecycle,
Cursor/Fokus, Felder, Listen, Slider, Spin-/Radio-Controls und alle Drawpfade.
Netzwerk- und Systemoptionen übernehmen die vollständige Cvar- und
Menüsemantik. 27 Datensätze aus unveränderten C-Funktionen, 108 native
Verhaltensverträge und 44 zusätzliche `cg_main`-Symbolverträge prüfen den
Block. Der frisch gebaute Hauptstand hat SHA-256
`04be50c8ffd913b86a638e54237cbcdba8e4605afd04f81869cad3c19bbd8031`;
das Retail-QVM-Gate besteht über acht Frames weiterhin mit neun
Prediction-Traces, 2.345 texturierten Dreiecken, 301 Cgame-Assets, 26 Sounds
und aktivem nativen Cgame-Hauptzustand. Die neuen Fokustests, der Hauptbuild
und das Retail-QVM-Gate wurden ausgeführt; die vollständige 283-Gate-Auswahl
wurde für diesen inkrementellen Block nicht erneut ausgeführt. Das
Runtime-/Plattforminventar zählt jetzt 36 portierte, 118 partielle und 181
nicht begonnene Originaldateien.

Der folgende Fünferblock portiert `cg_players.c`, `cg_newdraw.c`,
`ui_gameinfo.c`, `tr_sky.c` und `tr_init.c`. Spieler-Clientinfos, Modell-/Skin-
Suche, Animationen, Lerpframes, Tags, Powerups, Flaggen, Schatten und die
vollständige Spielerassembly liegen damit nativ vor; der produktive Retail-
Snapshot führt diesen Pfad als unterdrückbaren Begleiter aus und erzeugt fünf
beobachtete, nicht doppelt ausgegebene Player-Aktionen. Der Missionpack-
OwnerDraw-Pfad deckt Werte, Sichtbarkeit, Team-/Player-HUD, Orders, Voice,
Chat und Menüsteuerung ab. Die UI lädt und nummeriert Arenen und Bots aus den
echten Retail-Dateien und verwaltet Scores, Awards, Tiers und Videos. Der
Renderer enthält nun die vollständige Sky-Polygonprojektion, sechs Skybox-
Seiten, Wolkenkoordinaten/-geometrie, Sonne und Stage-Reihenfolge sowie den
Renderer-Lifecycle mit Cvars, Commands, GL-Defaultzustand, Screenshots,
Levelshots und der kompletten `GetRefAPI`-Tabelle. 115 Werte und Datensätze aus
unveränderten C-Funktionen, 144 native Verträge und sieben Retail-Verträge
prüfen den Block; `pak0.pk3` liefert dabei 30 Arenen, 32 Bots, 24
Einzelspielerarenen und sechs Tiers. Der frische Hauptbuild hat SHA-256
`76edc5435dc6d79555b72bd71b5dc0ddc553d7cb67a64fa7d314549230d7f322`; das Retail-QVM-Gate bleibt über acht Frames mit neun
Prediction-Traces, 2.345 texturierten Dreiecken, 301 Cgame-Assets, 26 Sounds
und fünf nativen Player-Aktionen grün. Die neuen Fokustests, der Hauptbuild
und das Retail-QVM-Gate wurden ausgeführt; die vollständige 283-Gate-Auswahl
wurde für diesen inkrementellen Block nicht erneut ausgeführt. Das
Runtime-/Plattforminventar zählt jetzt 41 portierte, 117 partielle und 177
nicht begonnene Originaldateien.

Der folgende native UI-Block schließt `ui_startserver.c`, `ui_splevel.c`,
`ui_sppostgame.c`, `ui_spreset.c`, `ui_spskill.c` und `ui_team.c` vollständig.
Map- und Gametype-Filter, Server- und Botoptionen, Spieler-/Teamslots,
Bot-Sortierung und Paging, Level-/Tierauswahl, Training und Finale, Scores,
Medaillen, Podium und Postgame-Phasen, Reset, Schwierigkeitswahl und
Teamwechsel sind damit als MiniLang-Zustandsmaschinen vorhanden. 37
Datensätze aus unverändert extrahierten C-Funktionen und 127 native Verträge
bestehen; alle 87 Ledger-Symbole sind zugeordnet. Der Hauptbuild bleibt bei
SHA-256 `76edc5435dc6d79555b72bd71b5dc0ddc553d7cb67a64fa7d314549230d7f322`;
das Retail-QVM-Match besteht weiterhin mit neun Prediction-Traces, 2.345
texturierten Dreiecken, 301 Cgame-Assets und 26 Sounds. Die nativen Module
geben Renderer-, Audio-, Cvar-, Command- und Menüoperationen als typisierte,
unterdrückbare Host-Aktionen aus. Deren vollständige produktive Ausführung ist
weiter offen; bei aktiver Retail-UI entstehen keine doppelten Ausgaben. Die
sechs Fokustests sind in `scripts/verify.py` aufgenommen. Der vollständige
Retail-Gesamtlauf mit jetzt 314 Gates besteht einschließlich Retail-QVM,
512-Frame-Botlauf, aller 31 Karten sowie Windows-Grafik- und Audiogrenzen. Das
Runtime-/Plattforminventar zählt jetzt 47 portierte, 117 partielle und 171
nicht begonnene Originaldateien.

Der nächste parallele UI-Abgleich schließt acht weitere Originaldateien:
`ui_menu.c`, `ui_ingame.c`, `ui_confirm.c`, `ui_setup.c`, `ui_controls2.c`,
`ui_video.c`, `ui_players.c` und `ui_playermodel.c`. Haupt- und Ingame-Menü,
Bestätigungs-/Meldungsdialoge und Setup-Navigation liegen damit vollständig als
native Zustandsmaschinen vor. Das Controls-Menü enthält alle 34 Bindings,
Zwei-Tasten-, Konflikt-, Capture-, Default- und Cvar-Regeln. Die Grafikoptionen
bilden die fünf Qualitätsvorlagen, abhängige Auswahlzustände, vollständige
Renderer-Cvar-Schreibfolge und `vid_restart` ab. Player-Vorschau und
Modelauswahl lösen echte MD3-, Skin- und `animation.cfg`-Dateien auf, führen
Lerpframes, Tags, Waffen und Winkelmathematik aus und zeigen das originale
4x4-Modellraster. 23 Datensätze aus unverändert extrahierten C-Funktionen, 161
native Verträge und acht Retail-Verträge bestehen; die Retail-Probe findet 89
Spielermodelle und alle 31 Animationsslots. Alle 99 Ledger-Symbole der acht
Dateien sind zugeordnet. Der frisch gebaute Hauptstand bleibt bei SHA-256
`76edc5435dc6d79555b72bd71b5dc0ddc553d7cb67a64fa7d314549230d7f322`;
das Retail-QVM-Match besteht mit neun Prediction-Traces, 2.345 texturierten
Dreiecken, 301 Cgame-Assets und 26 Sounds. Das Runtime-/Plattforminventar zählt
nun 55 portierte, 117 partielle und 163 nicht begonnene Originaldateien. Die
acht neuen Gates sind in `scripts/verify.py` aufgenommen; der dadurch auf 322
Gates angewachsene Gesamtlauf wurde für diesen inkrementellen Block noch nicht
vollständig wiederholt. Die nativen UI-Ausgaben bleiben typisierte,
unterdrückbare Host-Aktionen; deren vollständiger produktiver Dispatcher ist
weiter eine offene Integrationsgrenze.

Der folgende UI-/Serverbrowser-Block schließt sieben weitere Originaldateien:
`ui_servers2.c`, `ui_addbots.c`, `ui_removebots.c`, `ui_teamorders.c`,
`ui_serverinfo.c`, `ui_preferences.c` und `ui_mods.c`. Der native Browser
unterstützt nun Localhost, Internet, MPlayer und Favoriten samt fünf
Sortierungen, Leer-/Voll-/Gametype-Filtern, Ping- und Refreshzuständen,
Timeouts, Favoritenpersistenz, Auswahl, Connect/Specify/Create/Remove und
PunkBuster-Dialogen. Die Bot-Menüs verwenden die 32 echten Retail-Bots,
originale Sortierung, Paging, Teams, Skill/Delay und exakte `addbot`- bzw.
`clientkick`-Befehle. Teamorders bildet Bot-/Spielerauswahl, CTF-/Teamtexte und
Voicebefehle ab; Serverinfo erhält geordnete Info-Paare, Refresh und
Favoritendeduplizierung. Spieloptionen und Modauswahl enthalten alle originalen
Cvar-Regeln, Crosshairs, die 64er Modgrenze und den `fs_game`-/`vid_restart`-
Ablauf. 20 Datensätze aus unverändert extrahierten C-Funktionen, zusätzliche
Serverbrowser-C-Entscheidungsoracles und 129 native Verträge bestehen. Retail-
Proben bestätigen 32 Bots und 24 verwendete Menü-/Browserassets; beim im
Retail-Pak fehlenden `pblogo` bleibt der originale `unknownmap`-Fallback aktiv.
Alle 74 Ledger-Symbole sind zugeordnet. Das Runtime-/Plattforminventar zählt
jetzt 62 portierte, 117 partielle und 156 nicht begonnene Originaldateien. Die
sieben neuen Gates sind in `scripts/verify.py` aufgenommen; der Gesamtlauf
umfasst damit 329 Gates und wurde für diesen inkrementellen Block noch nicht
vollständig wiederholt. Die produktive Original-UI bleibt aktiv, bis der native
Hostdispatcher alle typisierten UI-, LAN-, Renderer-, Cvar- und
Command-Aktionen vollständig ausführt.

Der nächste UI-Abgleich schließt vierzehn weitere Originaldateien:
`ui_mfield.c`, `ui_playersettings.c`, `ui_cdkey.c`, `ui_cinematics.c`,
`ui_demo2.c`, `ui_loadconfig.c`, `ui_saveconfig.c`, `ui_specifyserver.c`,
`ui_rankings.c`, `ui_rankstatus.c`, `ui_login.c`, `ui_signup.c` und
`ui_specifyleague.c` und `ui_main.c`. Editierfelder unterstützen Cursor/Scroll,
Insert/Overstrike, Löschen, Home/End, Emacs-Kürzel und Clipboard-Paste. Die
Spielereinstellungen speichern Name, Handicap, Farbe und Modellvorschau. CD-
Key-Lesen/-Prüfen/-Schreiben, alle freigeschalteten Cinematics, Retail-Demos,
Konfigurationsladen/-speichern und direkter Server-Connect sind vollständig
abgebildet. Login, Signup, Rankings, Rankstatus und Leagueauswahl enthalten
ihre originalen Status-, Feld-, Filter-, Poll- und Navigationsabläufe. 40
Datensätze aus unverändert extrahierten C-Funktionen, zusätzliche MField- und
PlayerSettings-C-Entscheidungsoracles sowie 172 native Verträge bestehen. Der
UI-VM-Einstieg enthält außerdem alle 47 Original-Cvars und dispatcht sämtliche
Exporte 0 bis 10 mit unverändert abgeglichener Rückgabesemantik.
Retail-Proben bestätigen 32 Menüassets, alle elf erwarteten RoQ-Dateien und
beide Retail-Demos. Alle 78 Ledger-Symbole sind zugeordnet. Das Runtime-/
Plattforminventar zählt nun 76 portierte, 117 partielle und 142 nicht begonnene
Originaldateien; im `q3_ui`-Bereich sind 43 von 47 Dateien vollständig
portiert. Die vierzehn Gates sind in `scripts/verify.py` aufgenommen und
erhöhen den Gesamtlauf auf 343 Gates; er wurde für diesen inkrementellen Block
noch nicht vollständig wiederholt. Die typisierten nativen UI-Aktionen bleiben
bis zur Dispatcher-Integration neben der produktiven Retail-UI unterdrückt.

Der nachfolgende Datei-Abgleich beendet die beiden verbleibenden `q3_ui`-
C-Quellen `ui_atoms.c` und `ui_connect.c`: Text- und Bannerlayout, 640er-
Skalierung, Farbcodes, Menüstapel, Eingabe, Cache/Lifecycle sowie sämtliche
Verbindungs-, Download-, Raten- und ETA-Zustände liegen jetzt nativ vor. Auch
`cg_consolecmds.c` enthält alle Baseq3- und Missionpack-Registrierungen,
Dispatchzweige und typisierten Hostaktionen; die drei im Original
auskommentierten Bodies bleiben erwartungsgemäß unregistriert. Unveränderte
C-Oracles, 74 registrierte Missionpack-Kommandos, 27 Verträge und der Retail-
QVM-Lauf belegen diesen Pfad.

Botlib erhält gleichzeitig vollständige Dateiports für Alternative-Routen,
AAS-Optimierung, Log, Speicherverwaltung und den Strukturleser/-schreiber.
Alternative-Routen besitzen nun den originalen Workarray-Lifecycle und
Clusterflood; der Optimierer erhält signierte Edge-/Face-Referenzen, Ladder-
Filter und unveränderte Reachability-Typen. Log und Speicher verwenden sichere
typisierte Handles an der Hostgrenze. Der Strukturparser deckt verschachtelte
Definitionen, Arrays, Bounds, 16-Bit-Grenzen und Precompiler-Quellen ab; zwei
Speicherfehler des C-Originals werden bewusst sicher korrigiert. Eine Retail-
Probe liest 30 AAS-Dateien mit 559.999 Faces und 125.731 Reachabilities.
Missionpacks `ui_gameinfo.c` ergänzt schließlich Arena-/Bot-Dateien,
Skirmish-Nummern und alle Spieltypfilter; `pak0.pk3` liefert 30 Arenen und 32
Bots. Insgesamt sind in diesem Paket neun Originaldateien und 131 Symbole durch
198 native Verträge abgedeckt. Das Inventar zählt 85 portierte, 114 partielle
und 136 nicht begonnene Runtime-/Plattformdateien. `q3_ui` steht bei 45 von 47;
die zwei Restzeilen sind Header ohne Funktionskörper. Sieben neue Gates erhöhen
den Gesamtlauf auf 350. Die zentralen nativen UI-/Cgame-Hostdispatcher bleiben
die nächste Integrationsgrenze, während die Retail-QVM produktiv und gegen
doppelte Effekte abgesichert bleibt.

Die drei großen Syscall-Wrapperdateien sind nun vollständig nativ abgebildet:
`cg_syscalls.c` mit 96 Symbolen, `g_syscalls.c` mit 185 Symbolen und
Missionpacks `ui_syscalls.c` mit 89 Symbolen. Zusammen führen 357 echte
Trap-Wrapper sämtliche Originalordinals, Argumentwörter, opaque 32-Bit-Pointer,
`PASSFLOAT`-Bitmuster und Float-Rückgaben fort. Cgame schreibt seine Wörter in
den bestehenden `syscall_cgame.dispatch`; qagame nutzt den vorhandenen Common-,
Server-, World-, Botlib-, AAS-, EA-, AI- und Parserhost. Die Missionpack-UI
deckt Renderer, Sound, FS, Cvars, LAN, Eingabe, Cinematics, CD-Key und Parser
ab. Die x86-Oracles kompilieren die unveränderten Originalwrapper und prüfen
alle Symbol-/Opcodezuordnungen. Retail-Proben beobachten echte Cgame-Traps,
zwölf qagame-Lifecycle-Verträge sowie zwölf UI-Verträge. PunkBuster bleibt als
ABI-Aktion erhalten, weil der veröffentlichte GPL-Quellcode keinen PB-Client
enthält; die drei auskommentierten Cgame-Kamerawrapper benötigen bei einer
Aktivierung noch einen Hostadapter.

Missionpacks `ui_atoms.c` ergänzt 26 native Symbole für Postgame-Scores,
versionierte Demos, ConsoleCommands und den Displaycontext. Win32s
`win_gamma.c` bildet Hardwareerkennung, 3Dfx-/Desktop-Rampen, den Windows-2000-
Clamp, monotone Rampen und Crash-Restaurierung mit einer unterdrückbaren
Hostgrenze ab. Sieben unveränderte Win32-Datensätze und 17 Verträge bestehen;
die tatsächliche Betriebssystem-Gammarampenwirkung bleibt beim Plattformhost.
Insgesamt fügt dieser Block fünf vollständig portierte Originaldateien, 400
Symbole und 196 native Verträge hinzu. Das Inventar zählt jetzt 90 portierte,
114 partielle und 131 nicht begonnene Runtime-/Plattformdateien; die fünf Gates
erhöhen den Gesamtlauf auf 355.

Dieser Vollstand enthält auch die produktive
`AAS_BestReachableFromJumpPadArea`-Platzierung: benannte Map-Boots laden die
passende Retail-AAS, `trigger_push`-Ballistik wird 30 Frames gegen die Item-BBox
simuliert und die größte überlappende Jumppad-Area über das originale
Flächenvolumen gewählt. Der gezielte `q3dm17`-Probe bestätigt alle acht
schwebenden Items mit erreichbaren Zielbereichen.

Der bestätigte Stand erzeugt sein ansprechbares
Win32-Fenster vor dem PK3-/BSP-Laden und zeigt Ladephasen. Außerdem sind der
vollständige serverseitige Reliable-Downloadbefehlspfad, Intro-zu-Loop-Musik mit
Stereoerhalt, zielzentrierte Area- und Portal-AAS-Cachepropagation, originale
Cvar-/`q3config.cfg`-Persistenz im produktiven Engine-Frame, vier weitere
qagame-Plattformtraps, vier zustandsbehaftete Cgame-Tastaturtraps, Baseq3s vollständige 256-Tasten-Namens- und Rückübersetzung samt Overstrike-Zustand, alle fünf
Cgame-PC-Parsertraps und ein UI-LAN-/Serverbrowser mit
Connectionless-Antwortverarbeitung, exakter `servercache.dat`-Persistenz und
einem vollständigen ausgehenden Query-Zustandsautomaten samt produktiver
Windows-DNS-/UDP-Anbindung ergänzt. Hinzugekommen sind der echte Zwei-Client-Challenge-/Connect-Aufbau, die vollständigen Cgame-LerpFrame-Zustände, komprimierte ADPCM-/MuLaw-/Wavelet-SFX-Paintpfade und persistente, CRC-geprüfte AAS-Routingcaches. Physische Tastenübergänge aktualisieren den
gemeinsamen Cgame-/UI-Zustand nun auch bei geschlossenem Menü. Alle sieben
`uiMenuCommand_t`-Zustände und beide Overlay-Modi von `UI_DRAW_CONNECT_SCREEN`
werden nun durch den produktiven Original-UI-Adapter weitergereicht. Das von Cgame
gesetzte Usercmd-Waffenbyte und dessen Mausempfindlichkeit erreichen den
produktiven QVM-Spielpfad. MD3-Frames werden wie im Original gewrappt oder
repariert; registrierte 8-/16-Bit-Mono-Sounds durchlaufen Baseq3s exakten
22050-Hz-Resampler. Zusätzlich laufen die vollständigen Cvar-Konsolenbefehle.
Die von der Retail-Cgame registrierten Abschlussbefehle liegen jetzt ebenfalls
im produktiven `Cmd_ExecuteString`-Register: dieselbe Tokenisierung ruft
`CG_CONSOLE_COMMAND`, danach Server-Game und UI in Baseq3-Reihenfolge auf und
leitet weiterhin unbekannte Befehle an den verbundenen Server. Neun Aufrufe des
unveränderten C-Dispatch-Bodys stimmen mit der Retail-QVM überein. Zusätzlich
sind die elf aktiven Baseq3-Bodies aus `cg_consolecmds.c` als MiniLang-Funktionen
portiert und in zwölf unveränderten C-Differenzdatensätzen abgenommen. Die
extern wirksamen Befehle (`tcmd`, Größenänderung, Tell/Voice-Tell und
`startOrbit`) laufen produktiv nativ; ihr `vmCvar_t`-Cache wird wie im Original
erst mit dem Cgame-Frame aktualisiert. Scoreboard und `viewpos` bleiben bis zur
vollständigen nativen Cgame-Zustandsübernahme im Retail-QVM, damit kein zweiter
inkonsistenter HUD-Zustand entsteht. Die 24 Team-Arena-Bodies liegen mit ihren
Order-, Teamtask-, Taunt-, Score- und Singleplayer-Übergängen bereit, werden von
Baseq3 aber originalgetreu nicht registriert. Der CD-Test bestätigt 63
registrierte Befehle, native `sizeup`-Nebenwirkungen und Server-Forwarding.
Außerdem laufen
der `CL_SendCmd`-Ausgangspfad samt sieben verlust- und duplikatgetesteten
Client/Server-UDP-Frames, ein echter Zwei-Client-Serverpfad mit gegenseitig
geparsten Spielerentities, der vollständige Cgame-Reliable-Command-Verbrauch
und die originale Cgame-Framezeit, QVM-Rail-/Lightning-/Beam-Geometrie sowie
Portal-Welt-/Entity-Komposition jetzt durch die produktiven Pfade. Baseq3s
räumliche Links-/Rechts-Abmischung, 96-Kanal-Auswahl und gruppierte Loop-Kanäle
werden gemeinsam im originalen 24.8-Integer-Paintbuffer gemischt. RoQ-DPCM-Ton
durchläuft nun ebenfalls `S_RawSamples`: fünf unveränderte C-Differentialfälle
und zehn Verträge prüfen Formatkonvertierung, Resampling, den 16.384-Frame-Ring
und das gleichzeitige Mischen mit QVM-Musik und Spieleffekten.
Die abschließende Shaderfarbberechnung folgt nun auch der originalen
`ComputeColors`-Reihenfolge. Der produktive `alphaGen lightingSpecular`-Pfad
verwendet dabei Baseq3s festen Lichtursprung, schnelle Normalisierung,
Reflexionsvektor und Abfall in vierter Potenz auf den tatsächlich deformierten
Vertexnormalen. 21 Datensätze aus den unveränderten `ComputeColors`- und
`RB_CalcSpecularAlpha`-Funktionen sowie 14 fokussierte Verträge decken
Identity-Light-Skalierung, Entity-, Konstant- und Vertex-Alpha sowie positive,
negative und schräge Specular-Konstellationen ab.
Additive, strikte Alpha-, inverse Quellfarben- und vormultiplizierte
Alpha-Stufen erhalten vor dem abschließenden Fog-Pass nun außerdem Baseq3s
positionsabhängige RGB-, Alpha- oder RGBA-Dämpfung. Drei unveränderte
C-Differentialdatensätze und 18 Verträge prüfen Modulation, vollständige
`FinishShader`-Blendklassifikation und den produktiven Retained-Batch.
`refEntity_t.shaderTime` transportiert nun gemeinsam mit `shaderTexCoord` den
vollständigen Entity-Zeitversatz durch QVM-Geometrie, Portal-Clipping und den
Retained-Batch. Animierte Bildstufen, Farb-Waves, Vertex-/Normal-Deformationen
und alle zeitabhängigen `tcMod`-Operationen verwenden damit wie Baseq3 dieselbe
pro Entity verschobene Uhr. Shader-Remaps reichen zusätzlich ihr `timeOffset`
bis in bereits registrierte QVM-Materialien durch; das geparste `clampTime`
friert Bildfolge, Waves, Deformationen, Normalen und UVs gemeinsam an Baseq3s
`RB_BeginSurface`-Grenze ein. Sechzehn Datensätze aus den unveränderten
`RB_CalcScrollTexCoords`-, `R_BindAnimatedImage`- und `RB_BeginSurface`-Funktionen
plus 104 Verträge prüfen Frameauswahl, Entity-/Remap-Zeitversatz, Clamp,
negatives Wrapping und die produktiven Bild-, Farb-, Geometrie- und UV-Ausgaben.
Zwei zusätzliche Regressionen belegen, dass ein Remap auf denselben Shader mit
geändertem `timeOffset` auch ohne Batch-Neuaufbau den bereits gehaltenen
QVM-Szenenpass und dessen gemeinsame Shaderuhr aktualisiert.
Die vierdimensionale Renderer-Rauschfunktion aus `tr_noise.c` ist jetzt als
vollständiger nativer Dateiport belegt. Der produktive Normal-Deformationspfad
verwendet dieselbe mit 1001 initialisierte MSVC-Zufallsfolge, 256 Einträge,
maskierte Permutationsindizes sowie räumliche und zeitliche Interpolation wie
Baseq3. Acht Datensätze aus den drei unverändert extrahierten C-Funktionen
decken positive, negative und über 256 umlaufende Koordinaten ab.
Der QVM-2D-Pfad übernimmt dasselbe Zeitmodell nun für HUD und Original-UI:
`DrawStretchPic`-Materialien werden bei einem laufenden Shader-Remap neu aus dem
PK3 dekodiert und hochgeladen; `timeOffset` und `clampTime` steuern ihre
animierten Bilder, Farb-Waves und `tcMod`-UVs. 32 Verträge einschließlich eines
synthetischen PK3-Wechsels prüfen diesen produktiven Pfad.

Der letzte archivierte Lauf mit den CD-Daten bestand aus **46 regulären Prüfbereichen**
(`verify.py --data-root D:/Quake3`), einschließlich Engine-/Spielmodul-Cvars, Teamstandorten/-overlay,
Passwortstatus, Userinfo/Namen/Teamwahl, ClientConnect/Sitzungsdaten,
Team-/Zuschauerwechsel, ClientDisconnect, Follow-Befehle, Duell-Warteschlange,
Intermission und Levelende-Steuerung, vollständiger Baseq3-Client-Befehlsverteilung,
Textchat/Voice, Cheats, Spielkommandos, allen Baseq3-Waffen,
Serverkonsole, IP-Sperren, Spielarena, Item-/Teaminitialisierung,
Modulstart/-shutdown, Logformatierung, Give-/Powerup-/Score-/Print-Targets und
Portalflächen/-kameras,
Vote-Aufrufen/Stimmabgabe und Vote-/Teamleiterregeln,
Spawnpunkten, Leichen, Punkten, Spieler-Tod, Items/Flaggen, vollständigen
Client-Abläufen ab `ClientBegin`, `CheckTournament`, `G_RunFrame` und CLI-Laufzeitvergleichen.
Alle 31 CD-Karten werden geladen; Schadens-, Projektil- und Leichenfälle laufen
ebenfalls auf den CD-Karten.

Die letzte erweiterte CD-Vollprüfung bestand mit **61/61 Gates**. Sie enthält
alle 46 regulären Prüfbereiche und die zusätzlichen Kollisions-, Bewegungs-,
Pmove-, Sichtbarkeits-, Serverwelt-, Trigger- und Spawnvergleiche auf den
31 CD-Karten, einschließlich der Profile mit und ohne Kurven.
Der Lauf ist in `build/verify-map-objects-extended.log` protokolliert.
Der finale MiniQuake3-Build hat SHA-256
`3a8c6f394b337404511f826e34404d0fd5f9c3011af6b7a4b2a96cc5321d99fb`.
Der Gesamtbericht und die Einzelbelege sind in `reference/evidence.json` archiviert.

Alle **251 Quellen** unter `src/`, `native/`, `scripts/` und `tests/` blieben
während und nach dieser Vollprüfung unverändert. Der Quellstand ist vor dem
Lauf in `build/map-objects-full-run-sources.json` festgehalten; dessen SHA-256 ist
`50248031b37942ed1e798de513f9d648ff1d47b65eede5e9cc9c01308b588220`.
Historische Zusatzbelege früherer 58- und 60-Gate-Läufe werden nicht als
aktuelle Nachweise übernommen. Für diesen Lauf war keine nachträgliche
Quellenänderung oder ergänzende Wiederholungsprüfung erforderlich.

Der abschließende Nachweisaudit `build/map-objects-release-audit.json` bestätigt
**64 archivierte Berichte**, **1.647 eingebettete Quell-/Artefakthashes**,
**1.783 Szenarioartefakte** und **zehn Programmhashes**. 3.161 bestehende
Szenarioausgaben sind bei unveränderten Eingaben identisch. Die 168 Spawn-Replays
verwenden ebenfalls dieselben Karten und Eingaben: 55 Ausgaben bleiben identisch,
113 ändern sich durch die sechs neuen Klassen und die nun beobachteten
Originaldiagnosen. Die verbleibenden Mover-Aufrufzahlen sind unverändert.
Der Original-Checkout ist sauber und auf derselben festgeschriebenen Revision.

Der spielbare Renderer transportiert inzwischen unabhängige RGBA-Farben je
Dreiecksvertex bis in den nativen Batch und interpoliert sie perspektivisch
korrekt. MiniLang wertet dafür `rgbGen vertex`, `exactVertex`,
`oneMinusVertex`, `entity`, `oneMinusEntity`, `const` und `wave` sowie die entsprechenden `alphaGen`-Modi
pro Frame aus. Die endgültige RGB-/Alpha-Reihenfolge entspricht dabei
`ComputeColors`, einschließlich Identity-Light-Skalierung und der besonderen
Alpha-Erhaltung für `rgbGen vertex`. Blended-only Materialien dämpfen ihre
RGB- oder Alpha-Beiträge außerdem pro Vertex anhand der Fog-Dichte, bevor der
abschließende Fog-Pass die Nebelfarbe aufträgt. Lightmapped BSP-Flächen werden nur noch mit der originalen
Lightmap moduliert; unlightmapped Flächen behalten ihre getrennten RGB-Vertexfarben.
Explizite und aus Blend-/Depth-Write-/PolygonOffset-Zuständen abgeleitete
Shader-Sortwerte ordnen die World-Passes stabil wie in Baseq3. Die Abnahme
Geparste `depthWrite`- und `depthFunc equal`-Zustände werden pro Stage bis an den
nativen Rasterzustand weitergegeben. `polygonOffset` nutzt zusätzlich Baseq3s
steigungsabhängigen Decal-Tiefenbias im inversen Tiefenpuffer. Die Abnahme umfasst
59 Material-, 15 Batch-Layout- und 44 World-Batch-Verträge sowie einen
nativen Pixelvergleich unter `/W4 /WX`. Textur- und Lightmap-Abtastung arbeitet
bilinear mit OpenGL-Texelzentren und getrenntem Repeat-/Clamp-Randverhalten.
Vollständige Boxfilter-Mipketten und eine UV-Gradienten-basierte Levelwahl
reduzieren zusätzlich das Distanzflimmern. Geparste `nomipmaps`-Shader sowie
HUD-, Menü- und Fontbilder bleiben wie in Baseq3 auf der Basisebene.
`deformVertexes move` und `bulge` laufen zusätzlich mit Original-Waveform bzw.
Basis-U-Sinusphase; q3dm4 und q3dm16 dienen als Retail-Abnahme.

| Schritt | Stand | Vorliegender Nachweis / noch fehlende Abnahme |
| --- | --- | --- |
| 1. Referenz | Grundabnahme bestanden | Originale x86-Engine, drei native Module, drei neu gebaute QVMs; MiniLang-Build; 1.409 Dateien inventarisiert; 120 Frames mit zwei Bots aufgezeichnet und zweimal bytegleich wiedergegeben |
| 2. Zahlen/Plattform | In Arbeit | 101.445 binäre Float-Ergebnisse, 53.248 bisherige q_math-Ergebnisse, 65.536 AngleVectors-/SnapVector-Fälle und 26 Snap-Grenzfälle stimmen; Windows-Dateizugriff, nichtblockierende UDP-Grenze, Desktop-Framehost und eine mit 2 C-Fällen plus 26 Verträgen geprüfte Eingabequeue sind vorhanden; Win32-DIB-Previewhost und WinMM-Audiogrenze bestehen ihre `/W4 /WX`-Lifecycle-Tests; ein eigener UI-Thread hält das früh erzeugte Ladefenster mit 2--100-Prozent-Phasen ansprechbar; produktives OpenGL bleibt offen |
| 3. Engine-Kern/VFS | In Arbeit | 513 Cvar-Operationen, Engine-/VM-Cvar-Registrierung/-Aktualisierung und Spielmodul-Tabelle, 3 bytegenaue `Cvar_WriteVariables`-Differentialdatensätze plus 17 Config-Persistenzverträge, 13 exakte `Cvar_Restart_f`-Datensätze plus 17 Verträge sowie 11 exakte Datensätze plus 15 Verträge für `toggle`, `set`, `sets`, `setu`, `seta`, `reset`, `cvarlist` und direkte Cvar-Befehle; 448 Parseraufrufe, Info-Schlüsselsuche/-Validierung, 28 bytegenaue `cmd.c`-Puffer-/Tokenizer-, 16 Registry-/Builtin- und 10 Startup-Differentialdatensätze plus 32 Verträge, 84 ZIP/DEFLATE-Vergleiche sowie 48 direkte C-Vergleiche der MD4-basierten Pak-Prüfsummen und 25 Suchpfad-/Pure-/Referenz-/Downloadvergleichsverträge bestanden; Config-Befehle und `writeconfig` laufen über den produktiven Command-Puffer, archivierte Cvars werden vor Events, Netzwerk und Simulation geschrieben; automatische Pak-Aushandlung, UTF-16-Dateinamen und die vollständige Engine-Schleife fehlen |
| 4. QVM | In Arbeit | 404 Interpretervergleiche und 17 Runtime-Verträge; vorberechnete Instruktionsbreiten/Stackanforderungen laufen durch dieselben Differentialfälle; gemeinsame Traps 4/44; qagame-Servertraps 4/47 plus binäre Welttraps 5/37 und Lifecycle 11/22, einschließlich Dateilisten, Debug-Polygonen, 36-Byte-`qtime_t`, `G_SNAPVECTOR` und produktivem `G_FS_SEEK`; cgame-Lifecycle 12/20 plus 19 Kerntraps 4/37, vier Tastaturtraps 4/37 mit gemeinsamem UI-/Cgame-Zustand plus 259 exakt verglichene `Key_KeynumToString`-/`Key_StringToKeynum`-Werte und produktive Overstrike-/Clear-State-Anbindung sowie alle fünf `CG_PC_*`-Traps mit drei exakten ABI-Datensätzen und 29 Verträgen; `CG_SETUSERCMDVALUE` speist nun Waffenwahl und Mausempfindlichkeit in den produktiven QVM-Spielpfad, belegt durch fünf Originalanker und 12 Verträge; die produktive Vorschau bindet `CL_FirstSnapshot`/`CL_AdjustTimeDelta`/`CL_SetCGameTime` mit vier exakten Datensätzen, 26 Kern- und 19 Integrationsverträgen vor `CG_DRAW_ACTIVE_FRAME` ein; Snapshot-Sequenzen und `CG_GETSERVERCOMMAND` liefern Reliable Commands, zusammengesetzte große Configstrings, Configstring-Updates und Restart-/Disconnect-Policy in acht Originalankern plus 22 Verträgen an die Retail-Cgame; Cgame-Abschlussbefehle werden über 63 echte `CG_ADDCOMMAND`-Registrierungen und die vollständige `Cmd_ExecuteString`-Kette ausgeführt, in neun unveränderten C-Datensätzen sowie einer Retail-QVM-Abnahme geprüft; UI-Lifecycle 14/22 plus 39 Kerntraps 7/61 und 16 Medien-/Spezialtraps 5/42; PC-Parser einschließlich Bedingungen, Funktionsmakros, fortgesetzten Direktiven, Winkelklammer-Includes und den vier festen Baseq3-Makros 58 Verträge; Botlib-Lifecycle 200–211, AAS 300–318, Elementary Actions 400–423 und die zum Retail-Botsetup benötigten 500er AI-Traps sind angeschlossen; weitere AI-, Renderer-3D- und seltene Plattformtraps fehlen |
| 5. Kollision/Pmove | In Arbeit | BSP-/Kurvenkollision, räumliche Abfragen, dynamische Entities, Bewegungsbahnen, geometrische Trigger-Erkennung, Sprungpad-/Teleport-Replays, ClientBegin und G_RunFrame-Einbindung geprüft; der spielbare Pfad nutzt zusätzlich 800er Gravitation, Bodenprobe, Sprung, Quake-Reibung/-Beschleunigung, Collision-Slide und 18-Unit-Step in 26 Verträgen; Gegner verwenden ebenfalls Spielerhülle, Wall-Slide, Step und Bodenbindung, in 22 Verträgen plus q3dm1-Probe geprüft; komplette Match-Telefrag-Replays fehlen |
| 6. Spiel/Server | In Arbeit | Entity-Verwaltung, Spawn-Regeln, Worldspawn, alle 48 Spawn-Klassen und 35 Item-Spawns, Mover-Zustände/Trigger/Züge samt aktiven Retail-Türen/Buttons und vollständigen Retail-Rider-Frames, Target-Ketten, `G_RunFrame`, Schaden, Waffen, Client-/Match-/CTF-Abläufe, Einzelspieler-Postgame/Podium, Bot-Lifecycle, Bot-/Arena-Registry, Spawnqueue, Minimum-Player, Bot-Erzeugung/-Entfernung und BotConnect/SetupClient/ShutdownClient, Serverkonsole, IP-Filter, Spielarena sowie G_InitGame/G_ShutdownGame vorhanden; der spielbare Slice lädt 18 q3dm1-Pickups und fünf Ziele mit Hitscan-Schaden, Tod, Fragwertung und Respawn; BSP-Sichtprüfung steuert Patrouille, Verfolgung, Strafe und Angriffe; Gegner feuern ihre sichtbare Machinegun im originalen 100-ms-Takt mit 7 Schaden, beginnend am animierten Retail-`tag_flash` und durch einen abschließenden BSP-Trace abgeschirmt; der neue Pfad besteht 12 Verträge; Armor, Spieler-Tod, Spawnwechsel, Schutz und Respawn sind integriert; Engine-VM-Neuladen und Netzwerkzustellung fehlen |
| 7. Netzwerk/Client | In Arbeit | Message/OOB, Protokoll-68-Huffman, Deltas, Snapshots, Downloads, Demo-Framing, Netchan und Windows-UDP sind implementiert; der äußere `CL_Frame` stimmt in 13 C-Datensätzen überein und besteht 28 Verträge; `CL_SendCmd` ist daran produktiv gebunden und deckt Command-Erzeugung, Paketpacing, Reliable-Replay, `cl_packetdup`, `cl_maxpackets`, Move/NoDelta, Checksum-Key, Delta-Usercmds, OutPacket-Buchhaltung und Netchan-Übertragung in acht Originalankern plus 39 Verträgen ab. Der gemeinsam verwendete 64er Usercmd-Ring stimmt für `CL_CreateNewCommands`, `CL_GetCurrentCmdNumber` und `CL_GetUserCmd` in neun unveränderten C-Datensätzen plus 11 Verträgen überein. Der davorliegende produktive QVM-Eingabekern portiert Tasten-Teilframezeiten, Lauf-/Gehbewegung, Winkelsteuerung, Mausfilter/-beschleunigung, Cgame-Sensitivität, Joystick, Buttonbits und FinishMove. Seine Tastenbelegung ist über den mit `ui.qvm` geteilten Binding-Zustand frei konfigurierbar; sechs unveränderte Binding-Dispatch-Datensätze plus 14 Verträge bestehen. Der Win32-UI-Thread stellt dafür zeitgestempelte Tastatur-, Maustasten- und Mausbewegungsereignisse über einen threadsicheren 256er Ring bereit; fünf unveränderte C-Datensätze, 38 MiniLang-Verträge und ein nativer Überlauftest bestehen. Sieben echte Localhost-Winsock-Clientframes führen Clientbefehle über Server-Ingress und `SV_UserMove` zu Reliable Commands und Full-/Delta-Snapshots; neun Quellanker plus 48 Live-Verträge belegen verlorene und duplizierte Clientpakete, `packetdup`-Recovery ohne doppelte Spieleingabe, verlorene und duplizierte Server-Snapshots, Delta-Promotion über eine ältere Basis und vollständige `cl_nodelta`-Recovery. Ein geteilter Server-Ingress führt zusätzlich zwei gleichzeitige Clients mit unabhängigen Sockets, QPorts, Sequenzen, Usercmds, Reliable-Ringen und Snapshot-Acks. Davor durchlaufen beide echten Sockets jetzt den vollständigen `getchallenge`-/`challengeResponse`-/komprimierten `connect`-/`connectResponse`-Austausch; Challenge, QPort, Quelladresse und zugeordneter Server-Slot werden geprüft, und der anschließende Netchan behält seine Sequenzen. Elf Originalanker plus 67 Live-Verträge prüfen diesen Aufbau, gegenseitig geparste Spielerentities sowie unabhängiges Voranschreiten. Ein zusätzlicher 384-Frame-Lauf führt 768 Usercmds genau einmal aus, kompensiert 22 verlorene Clientpakete sowie 20 verlorene Snapshots, verwirft 29 Duplikate und hält die Reliable-Ringe über ihren Umlauf hinweg synchron; die UDP-Zustände werden dabei mit den produktiven CL_Frame-/SV_Frame-Timeoutmodellen abgeglichen. Snapshot-/cgame-Zeit einschließlich Drift, Pause, Demo und Timedemo besteht 4 Headerwerte plus 26 Verträge; der vollständige Reliable-Downloadbefehlspfad für `download`/`nextdl`/`stopdl`/`donedl` ist live; Internet-Mehrclient-Abnahme der vollständigen Match-Schleife fehlt |
| 8. Renderer/Cgame | In Arbeit | Shader-Index 10/10, Shaderparser 36/36 und TGA 5/22; Bildverarbeitung 10/19 und Bildcache 8/29; Polychain 3/21, Triangle/Face 3/30, MD3-Mesh 3/31, MD3-Tags/Bounds 7/26, Sprite-Quads 6/31 und Grid 5/30; View-Transformation/Culling 11/36; Texturzustände 18/30; Commandqueue 7/29; Szene Polys/Entities/Lichter 6/24; interaktiver BSP-Vertical-Slice mit texturierten Bezier-Patches, originalem Baseq3-HUD, echten Pickup-Modellen, Projektilen und texturierten First-Person-Waffen; Retail-Shader mit `alphaFunc GT0`, `LT128` und `GE128` werden bis in den nativen Rasterizer übernommen, sodass etwa Banner und Gitter ihre ausgeschnittenen Konturen behalten; additive, Alpha- und multiplikative `filter`-Blends besitzen eigene Rasterpfade, explizite Lightmap-Stufen verwenden ihre BSP-Slots und UVs in Originalreihenfolge, einschließlich GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA und fortgeschriebenem Framebuffer-Alpha; `clampMap` schaltet die native Texturabtastung auf Rand-Clamping, während normale Maps weiterhin wiederholen; `deformVertexes wave` und `bulge` bewegen Geometrie entlang der BSP-Normalen, `move` verschiebt ganze Flächen per Waveform; mehrere Deformationen laufen in Originalreihenfolge; sieben geladene q3dm1-Materialien mit `cull disable` umgehen die planare Rückseitenverwerfung des Sichtbarkeitscaches; `tcMod scroll`, `scale`, `rotate`, `stretch`, `transform`, `entityTranslate` und die weltpositionsabhängige `turb`-Verzerrung laufen in Shader-Reihenfolge; QVM-Entities behalten dabei `shaderTexCoord` und `shaderTime` bis zu den produktiven Bildframes, Farb-Waves, Deformationen, Normalen und UVs. Das schließt die Lava- und Bluteffekte von q3dm1 sowie die zweifach transformierten Wasserlagen von q3dm2 ein; kameraabhängiges `tcGen environment` verwendet die originalgetreue Reflexion an den BSP-Vertexnormalen; Viewmodel-Dreiecke werden samt UV-/Lichtwerten an der Nah-Ebene geschnitten und über den originalen 0..0,3-Depthhack-Bereich gegen die Welt getestet; Retail-Hand-Tags animieren Angriff, Absenken und Anheben; Gauntlet, Machinegun und BFG besitzen angehängte, beschleunigende und auslaufende Retail-Läufe; der Retail-Sarge wird aus Lower/Upper/Head über Tags zusammengesetzt, interpoliert, mit zwei PK3-Skinbildern texturiert und im Nahbereich mit allen 795 Dreiecken gezeichnet; jeder sichtbare Gegner trägt zusätzlich die echte Machinegun samt separatem, zustandsbehaftetem Barrel am interpolierten `tag_weapon`; Idle/Walk/Run/Attack/Pain/Death/Respawn folgen Gameplay-Ereignissen; vorberechnete Projektion, direkte MD3-Transformation und paralleles scanline-begrenztes Rasterisieren liefern im aktuellen q3dm1-Smoke etwa 15–20 FPS; Baseq3s MD3-Projektionsradius/LOD-Wahl sowie `RF_WRAP_FRAMES`- und Invalid-Frame-Reparatur bestehen sechs exakte Datensätze plus 24 Verträge und laufen vor der produktiven QVM-Interpolation; `RT_RAIL_CORE`, `RT_RAIL_RINGS` und `RT_LIGHTNING` erzeugen Baseq3s sichtbare QVM-Geometrie samt Shader, UVs und Vertexfarben, belegt durch zwei exakte Datensätze plus 26 Verträge. `RT_BEAM` erzeugt zusätzlich den originalen geschlossenen Sechsseiten-Strip mit 14 Vertices und 12 Dreiecken über ein echtes additives Vertex-Color-Material; zwei exakte Datensätze plus 13 Verträge prüfen Geometrie, Farbe und Null-Längen-Auslassung. `RT_PORTALSURFACE`-Marker liefern Spiegel-/Remote-Kamera, PVS, Rotation, Clipplane und First-/Third-Person-Entityfilter in drei exakten Datensätzen plus 17 Verträgen. Der produktive Software-Renderer baut Portalwelt und portalabhängige Cgame-Entities aus dieser Kamera, clippt BSP-/QVM-Dreiecke an der Zielebene und komponiert Portal, Tiefenlöschung und Hauptansicht in Originalreihenfolge; 21 weitere Verträge prüfen den auf eine Ebene begrenzten Pass. MD3-Frame-0-Modellgrenzen sowie korrekte cgame-Traps für Cinematics, Shader-Remap, R_InPVS und FS_SEEK sind ergänzt; CG_SetLerpFrameAnimation, CG_RunLerpFrame und CG_ClearLerpFrame laufen mit Initial-Lerp, Togglewechsel, Loop, Reverse, Flipflop, Speedscale, Hitch-Clamp und bitgenauem backlerp in 16 C-Differentialfällen plus 10 Verträgen; der produktive Preview-Gegner verwendet persistente Lower-/Upper-Zustände. `rgbGen entity`/`oneMinusEntity` und `alphaGen entity`/`oneMinusEntity` bewahren `shaderRGBA` getrennt von Lightgrid-/Vertexfarben und stimmen in vier C-Datensätzen plus acht Verträgen. `ComputeColors` und `alphaGen lightingSpecular` stimmen einschließlich schneller Normalisierung, Reflexionsvektor und Abfall in vierter Potenz in 21 unveränderten C-Datensätzen plus 14 Verträgen. Additive, strikte Alpha-, inverse Quellfarben- und vormultiplizierte Alpha-Stufen werden im Nebel jetzt vor dem Fog-Pass pro Vertex gedämpft; drei unveränderte C-Datensätze plus 18 Verträge prüfen diesen produktiven Pfad. Vollständige Shaderstufen und Cgame-Präsentation fehlen |
| 9. Bots/Audio/UI | In Arbeit | Alle 30 Retail-AAS-Dateien werden direkt gelesen; Punktsuche, Area-/Entity-Abfragen, Trace-Areas, Reachability-Iteration, gewichtete Routen, Routing-Sperren, Client-Movement-Prediction und Sichtpositionsvorhersage sind vorhanden. Movement-Prediction benutzt produktiv den originalen iterativen `AAS_TraceClientBBox`-Knotenpfad mit Presence-/Playerclip-Sperren, Plane-Epsilon und vollständigen Trefferfeldern sowie Entity-Kollision für nichtnegative Pass-Entities; acht Grenzverträge und der 512-Frame-Sarge-Lauf prüfen ihn. Botlib-Lifecycle, Serverbridge und Elementary Actions führen `addbot Sarge 3` durch das vollständige originale `BotAISetupClient`; Character-, Item-/Weapon-Weight- und Chatprofile werden aus pak0 geladen, alle vier AI-State-Handles sind gebunden und 512 Bot-Frames laufen bis zur regulären `BOTLIB_USER_COMMAND`-Übergabe. Alle 15 Travelhandler des Baseq3-Release-Switches sind echte MoveToGoal-Pfade; Fuzzy-Evolution, zwölf q3dm1-Kartenorte und Chat-Ausgabe 513–516 sind implementiert. Ein invalidierbarer LRU, Reverse-Reachabilities, Area-Reisezeitmatrizen und Portal-Maximalzeiten bilden die statische Original-Routingstruktur nach. Retail-Chat lädt 175 Synonymgruppen, 138 Match-Templates, 244 Zufallsgruppen und 456 Reply-Regeln; der Nachrichtenheap folgt dem live gelesenen `max_messages` mit Originalstandard 1024. UI-Lifecycle und 55 UI-Traps einschließlich Sound/Cinematics/LAN sind vorhanden; das Original-Steuerungsmenü erhält über `UI_KEY_KEYNUMTOSTRINGBUF` jetzt Baseq3s echte Namen für alle 256 Tastencodes, gemeinsam mit Bindings, Overstrike- und Down-State; Original-UI-Menüs, RoQ-Video/DPCM-Audio, WinMM-WAV- und Umgebungsklang laufen. Alle sieben Baseq3-Menüzustände und beide Connect-Screen-Overlaymodi sind produktiv verdrahtet und in 27 Session-Verträgen geprüft. `UI_GETCLIENTSTATE` liefert das exakte 3.084-Byte-ABI mit realem Verbindungszustand; die originale Screen-Matrix für Connect, Challenge, Loading, Active, Cinematic, Fullscreen und Key-Catcher besteht einen ABI-Datensatz plus 20 Verträge. Die zielzentrierten `AAS_UpdateAreaRoutingCache`- und `AAS_UpdatePortalRoutingCache`-Pfade teilen Routen über Ursprünge und Cluster; der produktive Botlib-Pfad persistiert die Zielcaches nun mit dem originalen RCD-v2-Header, Area-/Cluster-CRC und einer deterministischen zeigerfreien Nutzlast; offen bleibt die noch kompaktere interne Reachability-Ablage. Der UI-LAN-Kern verwaltet Serverlisten, Sichtbarkeit, Pingqueue, Status und Originalsortierung; vier exakte Ingress-Datensätze plus 60 Verträge prüfen Protokoll-68-Info-/Status-/Masterlisten-Antworten, Pingabschluss und Deduplizierung. Die produktive UI liest und schreibt das exakte 661.520-Byte-Baseq3-x86-`servercache.dat`; 24 Verträge vergleichen den vollständigen Binärinhalt mit einer C-Referenz. Ein weiterer Zustandsautomat deckt in 23 Verträgen lokale Discovery, Master-Queries, manuelle und sichtbare Pings sowie Status-Resends ab. Windows-DNS, zwei nichtblockierende Sockets, IPv4-Broadcast und Antwort-Pump sind im produktiven UI-Lifecycle angeschlossen und bestehen 18 Live-Verträge. Hintergrundmusik bewahrt Stereo, spielt das Intro einmal und wechselt danach in den Retail-Loop. Registrierte Mono-Effekte laufen durch Baseq3s exakten 22050-Hz-Resampler mit acht C-Differentialdatensätzen und 19 Verträgen; `S_SpatializeOrigin` liefert über zwölf exakte Datensätze plus 19 Verträge die originale 80-Unit-Vollpegelzone, Distanzdämpfung und Links-/Rechts-Achssemantik. One-shots verwenden produktiv Baseq3s 96-Kanal-Free-list, 50-ms-Duplikatverhalten, identische-Sound-Limits, Entitäts-/Globalersetzung und Listener-/Announcer-Schutz; zehn exakte Datensätze plus 18 Verträge belegen den Pfad. Gleichartige Loops werden mit originalen Masterlautstärken, Doppler-Regeln, 255er-Klemme, 96-Kanal-Limit und gemeinsamer Painted-Time-Phase gruppiert; sechs exakte Datensätze plus 17 Verträge bestehen. Musik, One-shots und diese Loops laufen produktiv durch Baseq3s gemeinsamen 24.8-Paintbuffer, `S_PaintChannelFrom16`, `s_volume` 0,8 und exakte signed-16-Sättigung; drei exakte Pipeline-Datensätze plus 18 Verträge bestehen. Derselbe produktive Pfad decodiert jetzt außerdem IMA-ADPCM, MuLaw und Daubechies-Wavelets und malt sie mit den originalen 24.8-Routinen; fünf exakte C-Differentialfälle, 14 Kompressionsverträge und 40 QVM-Wiedergabeverträge bestehen. Geschwindigkeitsvektoren von QVM-Loops steuern über Baseq3s quadrierte Distanzformel den Doppler-Pitch; fünf weitere C-Differentialfälle und sechs Verträge belegen den Pfad. RoQ-Audio läuft nun über Baseq3s 16.384-Frame-S_RawSamples-Ring in denselben Paintbuffer; fünf C-Differentialdatensätze und zehn Verträge prüfen Formatkonvertierung, Resampling und gleichzeitige Spieleffekte. Die vollständige Audio- und UI-Parität bleibt offen. |
| 10. Gesamtparität | Offen | Hängt von allen vorangehenden Abnahmen ab |

Aktualisierung zu Zeile 8: Die Commandqueue steht am 4. November bei sieben
exakten C-Datensätzen plus 32 Verträgen. Die aktuelle produktive
20-Frame-Messung erreicht ungefähr 9 FPS; die ältere Angabe 15--20 FPS bezog
sich auf einen anderen Preview-Slice und ist keine Abnahme des heutigen
Original-QVM-Pfads. Der noch CPU-seitige Rasterizer bleibt die maßgebliche
Renderer- und Performance-Lücke.

115 zusätzliche Tests prüfen beschädigte Dateieingaben, VM-Limits, räumliche
Abfrageparameter, Portalzustände und die
Wiederherstellung des VM-Stacks nach einem fehlerhaften Syscall. Dies ist eine
gezielte Testsammlung, keine vollständige Fuzzing- oder Sicherheitsabnahme.

## Referenzprofile

- Upstream unverändert: `dbe4ddb10315479fc00086f08e25d968b4b43c49`.
- C-Referenz: MSVC x86, `/Od /fp:strict /arch:SSE2 /MT`, native Game-Module
  und QVM-Interpreter getrennt. Moderne Compiler ergeben kein ungeprüftes
  Versprechen identischer Retail-Binaries oder identischen x87-Verhaltens.
- QVM-Build: originale mitgelieferte `lcc`, `q3cpp`, `q3rcc`; `q3asm` aus
  Originalquellen neu gebaut. Alle Outputs entstehen unter `build/`.
- Replay: `q3dm1`, Sarge und Major auf Skill 3, `com_fixedtime=50`, `sv_fps=20`,
  `bot_thinktime=100`, QVM-Interpreter. Die originale Event-Journalfunktion
  zeichnet die Eingaben auf. Ein Beobachter nach `Com_Frame` serialisiert
  verknüpfte EntityStates und aktive PlayerStates mit dem Original-Protokollwriter.
  Es werden keine Pointer oder Paddingbytes verglichen. Private Bot-/Spielzustände
  sind in diesem Nachweis noch nicht vollständig enthalten.
- Der Beobachter wird ausschließlich in eine gesonderte C-Test-Executable
  eingebunden. Die Kopie von `win_main.c` erhält eine Deklaration und einen Aufruf
  nach `Com_Frame`; der Original-Checkout bleibt unverändert. Der Beobachter
  beendet den Prozess nach 120 Frames. Build und Hook sind in
  `scripts/build_reference.py --observer` und `tests/reference/frame_observer.c` lesbar.
- MiniLang: Binary und Standardbibliothek unter `artifacts/toolchain/` eingefroren;
  Hashes und Quellzustand in `reference/toolchain.json`. Die genaue Herkunft des
  bereits vorhandenen Compiler-Binaries ist damit nicht rückwirkend bewiesen.

## Festgestellte Unterschiede und Grenzen

- Die CD-QVMs sind älter als die neu gebauten 1.32b-QVMs. Zum Beispiel liefert
  der UI-Einstieg der CD Version 3, der neu gebaute baseq3-UI-Einstieg Version 4.
  Tests und spätere Modulverträge müssen diese Profile auseinanderhalten.
- Im eingefrorenen Compiler verfälscht `toFloat()` bestimmte bereits als Float
  vorliegende große ganzzahlige Werte, etwa `3.8889514618448773e18`.
  `tests/numeric_probe.ml` reproduziert den Effekt. Die Port-Arithmetik verwendet
  deshalb eine eigene MiniLang-Implementierung von binary32 mit expliziter
  Rundung; die native DLL enthält nur drei ABI-Konvertierungen. Engine-Rechnungen
  müssen diese Helfer verwenden, statt implizite MiniLang-Zahlenpromotion anzunehmen.
- Float-Tests decken endliche Werte, Subnormalzahlen, Rundung, Über-/Unterlauf,
  signed zero, Quadratwurzel und entstehende Unendlichkeiten/NaNs ab. Beliebige NaN-Payloads als
  Eingangswerte sind noch nicht vollständig gegen sämtliche Referenzpfade geprüft.
- Der Originalinterpreter schreibt bei `OP_BCOM` in `opStack[-1]`. MiniLang
  reproduziert dieses beobachtbare Verhalten im Interpreterprofil. Eine spätere
  Entscheidung zur Korrektur muss getrennt von Paritätsaussagen erfolgen.
- QVM-Lader und Speicherzugriffe weisen gefährliche oder ungültige Eingaben
  kontrolliert zurück. Der Originalparser kann bei überlangen quoted tokens
  seinen C-Puffer überschreiten; MiniLang weist diese Eingabe zurück.
- ZIP64, verschlüsselte und mehrteilige ZIPs sowie Nicht-ASCII-Dateinamen sind
  noch kein zugesicherter Kompatibilitätsumfang. PK3-Pfadpriorität, Dateilisten
  und Pure-Server-MD4-Prüfsummen sind für explizit vom Host aufgelistete Paks
  umgesetzt; automatische Verzeichnissuche, Downloads, Restrict-Modus und
  referenzierte-Pak-Verhandlung fehlen. Details stehen in [FILESYSTEM.md](FILESYSTEM.md).
- BSP-Lesen, Welt-/Inline-Modellkollision, Kurvenflächen, Transformationen,
  temporäre Boxen, Sichtbarkeitsdaten und Areaportale haben eigene Vergleichstests.
  Bewegte Entities sind mit Pmove verbunden; Türsteuerung und lineares
  Mover-Pushing, Drehmitnahme, Client-Yaw und Areaportal-Umschaltung sind implementiert.
  Differentialreplays für komplexe Blockaden sowie Rendering sind noch offen.
- Die x86-Referenz verwendet in `BoxOnPlaneSide` die originale x87-Assemblerfassung.
  Der Port vergleicht die Summen hier ohne Zwischenrundung auf binary32. Die
  getesteten CD-Koordinaten stimmen; das ist keine pauschale Zusage für beliebige
  extreme oder speziell konstruierte Koordinaten anderer Karten.
- Patch-Traces überschreiben im Original nur Normale und Distanz, während
  Plane-Typ und Signbits aus dem vorherigen Treffer erhalten bleiben können.
  Dieses Verhalten sowie der besondere stationäre Punkt-Test werden bewahrt.
  Für nicht definierte Originalzugriffe bei vollständig degenerierten Patch-Zellen
  liefert der Port deterministisch keine Kante. Übergroße Grids, nicht endliche
  Koordinaten, zyklische BSP-Bäume und ungültige Trace-Parameter werden abgewiesen.

## Kollision und Bewegung

`test_patches.py` lässt den unveränderten ursprünglichen Kartenlader alle
Kurvennetze erzeugen. Danach erzeugt MiniLang diese Netze eigenständig aus den
BSP-Kontrollpunkten. 6.091 Netze aus allen 31 CD-Karten stimmen in 1.352.159 Feldern
überein: Ebenen, Facets, Bevels, Begrenzungen und aktive Border-Flags. Das C-Ergebnis
wird ausschließlich als Testvergleich gelesen, nicht als Laufzeitgeometrie benutzt.

`test_collision.py` ruft die vollständigen ursprünglichen `CM_BoxTrace`-,
`CM_PointLeafnum`- und `CM_PointContents`-Funktionen auf. Neben Zufallspositionen
werden die Mittelpunkte quadratischer Kontrollzellen gezielt durchquert. Pro
Kurvenprofil entstehen 56.108 Traces mit 897.728 verglichenen Feldern. Darin
enthalten sind asymmetrische Boxen, Punkte, Kapseln, stehende Abfragen, Start-in-Solid,
Inhaltsmasken und Inline-Modelle. Diese Abnahme gilt für statische BSP-Modelle.
Bei identischen Eingaben ändern aktive Kurven 4.991 Trace-Ergebnisse gegenüber
dem Profil ohne Kurven; diese Kontakte werden im Vergleich tatsächlich ausgeübt.

`test_movement.py` bindet die ursprünglichen Dateien `bg_pmove.c`, `bg_slidemove.c`
und `bg_misc.c` in die C-Testreferenz ein. Geprüft werden `PM_ClipVelocity`,
`PM_Friction`, `PM_Accelerate`, `PM_CmdScale`, `PM_SlideMove`, `PM_StepSlideMove`,
Touch-Listen und der Ereignisring. Vier Karten, unabhängige Eingaben und verkettete
64-Frame-Folgen prüfen Position, Geschwindigkeit, Aufprallstärke, Kontakte und
Ereignisse. Je 16.384 Operationen mit/ohne Kurven ergeben insgesamt 1.540.096
identische Felder. Mit aktiven Kurven entstehen dabei 162 echte Stufenereignisse
aus der Bewegung, zusätzlich zu den separaten Tests des Ereignisrings.
Die Testreferenz kollidiert mit C, der Port mit seiner MiniLang-Kollision.
Diese bisherigen Kerntests werden durch die vollständigen Befehlsvergleiche ergänzt.

`test_pmove.py` ruft nun den unveränderten `Pmove`-/`PmoveSingle`-Code auf und
vergleicht ihn mit `src/mq3/game/pmove.ml`. Enthalten sind Ground-Checks,
Start-in-Solid-Korrektur, Sprünge, Ducken, Luft-/Wasser-/Flug-/Noclip-Bewegung,
Grapple-Pull, Landungen, Timer, Waffenwechsel, Munition, Holdables, Gesten und
Animations-/Ereigniszähler. Verglichen werden alle 468 Bytes des PlayerState
sowie die veränderten Usercmd- und relevanten Pmove-Ausgaben: 166 Wörter pro Befehl.
Die C-Referenz prüft außerdem Größe und Offset aller 45 PlayerState-Felder unabhängig
mit `sizeof` und `offsetof`. Der generierte MiniLang-Codec ist kein Netzwerkprotokoll.

Vier CD-Karten liefern je 4.096 unabhängige oder verkettete Befehle; eine assetfreie
BSP-Testkarte ergänzt 4.864 gezielte Befehle. Ihre Fälle decken Wassersprung,
alle vier Wasserstände, Schleim/Lava, Stufen, niedrige Decke, blockiertes Aufstehen,
Start-in-Solid, Materialflags, Landungen sowie alle zehn Waffen mit Haste,
unendlicher Munition und Munitionsende ab. Die Profile mit und ohne Kurven ergeben
zusammen 42.496 Befehle und 7.054.336 identische Wörter. Die Prüfung erfolgt nach
jedem äußeren Befehl; zusätzliche direkte `PmoveSingle`-Fälle prüfen Einzelaufrufe.
Sie ist noch kein Replay eines vollständigen MiniLang-Servers oder Clients.

`AngleVectors` und `SnapVector` liefern in 65.536 Fällen 786.432 identische Werte.
26 zusätzliche Snap-Proben enthalten Halbwerte, signed zero, Integergrenzen,
Unendlichkeiten und NaNs. Die Referenz kompiliert den unveränderten
`Sys_SnapVector`-Funktionskörper aus `win32/win_shared.c`: x87 `FISTP`, nächste
Ganzzahl, bei Gleichstand gerade. MiniLang führt diese Rundung selbst aus.
`sin`, `cos` und die doppelt genaue Wurzel in der Landungsformel werden dagegen
direkt aus `ucrtbase.dll` aufgerufen. Diese ausdrücklich abgegrenzten C-Laufzeit-
Mathematikfunktionen ersetzen keine Bewegungslogik. Die native Projekt-DLL bleibt
auf die bisherigen drei Float-/Bit-Konvertierungen beschränkt.

Alle 36 ursprünglichen baseq3-Item-Tags werden aus der Quelltabelle übertragen
und gegen C geprüft. `MISSIONPACK` ist nicht Bestandteil dieses Pmove-Profils;
die auch in baseq3 kompilierten Invulnerability-Zweige sind enthalten. Zwölf
Vertragstests weisen fehlerhafte Befehle, Feldgrößen und Indizes zurück; zwei weitere
prüfen alte bzw. unveränderte Command-Zeitstempel. Feste Intervalle außerhalb
1–200 ms werden im Port abgewiesen, insbesondere statt einer Endlosschleife bei 0.

`--pmove-map` verarbeitet TSV-Befehle direkt mit PK3-Lader, MiniLang-Kollision und
Pmove. Der zugehörige Ende-zu-Ende-Test vergleicht 268 Befehle in 4.020 ausgegebenen
Feldern mit C. Dieser Aufruf enthält weder dynamische Entities noch Server-Spielregeln.

## Transformierte Modelle, temporäre Boxen und Sichtbarkeit

`test_spatial.py` vergleicht `CM_TransformedBoxTrace`,
`CM_TransformedPointContents`, temporäre Boxen und Modellgrenzen auf allen 31 Karten.
Pro Kurvenprofil werden 63.488 Fälle geprüft, zusammen 126.976 Fälle mit 3.047.424
identischen Wörtern. Die Fälle enthalten Drehungen auf allen drei Achsen,
Translationen, asymmetrische Boxen, Punkte, bewegte Kapseln, stehende Abfragen,
Inhaltsmasken und den wiederverwendeten temporären Modellplatz.

Die Originalbesonderheiten bleiben erhalten: Bei Boxen wird die Abfragelinie
gedreht, die Box selbst bleibt entlang der Achsen ausgerichtet. Bewegte Kapseln
erhalten den ursprünglichen gedrehten Kugelversatz. Bei einem Treffer wird die
Normale zurückgedreht; Distanz, Typ und Signbits bleiben in der ursprünglichen
Darstellung. Negative Ebenen temporärer Boxen verwenden die Typen 3, 4 und 5.
Eine temporäre Kapselanforderung aktualisiert die Modellgrenzen, lässt aber die
bisherigen Boxebenen bestehen. Die Tests prüfen auch diesen Zustand.

**Originalfehler beim Kapselmodell:** `CM_TempBoxModel(..., true)` liefert Handle
254. `CM_ClipHandleToModel` erkennt im festgehaltenen Original jedoch nur die
temporäre Box 255. Ein separater unveränderter C-Lauf bricht auf jeder CD-Karte
beim Trace mit Handle 254 ab. Der Port liefert dafür einen kontrollierten Fehler;
die unerreichbaren Kapsel-gegen-Kapsel-Routinen werden nicht als portiert behauptet.
Dies betrifft das temporäre Zielmodell, nicht die bereits geprüften bewegten
Kapseln gegen BSP/Brushes. Für eine spätere Erweiterung ist ein eigenes, sichtbar
vom Original abweichendes Referenzprofil erforderlich. Karten mit mehr als 254
Modellen weist der Port zurück, damit Inline-Indizes nicht mit den reservierten
Handles 254/255 kollidieren; das Original lässt diese problematische Überlappung zu.

`test_visibility.py` prüft alle PVS-Zeilen einschließlich ungültiger Clusterindizes,
Modellgrenzen und Blatt-/Bereichszuordnungen. Auf 31 CD-Karten und zwei assetfreien
Testkarten stimmen 2.821.274 Wörter und 12.414.636 PVS-/Bereichsbytes überein.
16.896 Boxabfragen vergleichen Blatt- und Brush-Listen samt Reihenfolge,
Kapazitätsüberschreitung und `lastLeaf`. 17.296 Portaloperationen prüfen den
vollständigen Referenzzählergraphen, Flutnummern, Zusammenhang und die Vereinigung
von Bereichsbits mit bereits belegten Ausgabepuffern. Enthalten sind Selbstkanten,
mehrfaches Öffnen/Schließen, `cm_noAreas`, negative Bereichsparameter und fehlende PVS.

Ohne PVS rundet der ursprüngliche Lader die Clusterzahl auf ein Vielfaches von
32 **Bytes**, ohne vorher durch acht zu teilen. Ungültige Cluster liefern bei
vorhandener PVS die erste Zeile. Beides wird bewahrt. Beschädigte Cluster-/Bereichs-
Zuordnungen und zu kurze Sichtbarkeitszeilen werden kontrolliert abgewiesen.
Ein fehlerhaftes Schließen eines Portals verändert im Port den Graphen nicht;
das C-Original würde nach dem Fehler die Karte abbrechen.

Die neuen CLI-Aufrufe `--trace-model` und `--inspect-visibility` sind über
PK3-Lader und MiniLang-Laufzeit zusätzlich in 141 Feldern gegen C geprüft.
Sie sind räumliche Entwicklungsabfragen, keine vollständige Server-/Render-Abnahme.

## Dynamische Entities und gemeinsame Spielreaktionen

`server/world.ml` überträgt die Sektoraufteilung und Entity-Verlinkung aus
`sv_world.c`, einschließlich Solid-Größenkodierung, gedrehter Modellgrenzen,
PVS-/Area-Zuordnung und der Grenzen von 128 Blättern bzw. 16 Clustern. Die
Sektorlisten behalten Einfügereihenfolge und Besuchsreihenfolge. Trace-Gleichstände,
Besitzerfilter, `startsolid`-Vereinigung und frühe Welt-Treffer bleiben unverändert.

`test_server_world.py` bindet den ursprünglichen Server-Kollisionscode direkt ein.
Es vergleicht Ein-/Um-/Ausverlinkungen, Area-Abfragen, Entity-/Welt-Traces,
Point-Contents und komplette Pmove-Zustände. Geprüft werden alle 31 CD-Karten
und eine assetfreie Testkarte, jeweils mit und ohne Kurven. Drei vollständige
Adressierungshelfer aus `sv_game.c` werden unverändert extrahiert; die übrigen
VM-/Server-Funktionen dieser Datei werden nicht als abgenommen gezählt.

Beide Profile zusammen ergeben 357.696 Operationen und 9.585.476 identische
32-Bit-Wörter. Darin enthalten sind 32.768 vollständige Pmove-Befehle sowie 1.536
aufgezeichnete Sprungpad-Aufrufe. Die Folgen erzeugen 2.914 dynamische
Entity-Kontakte in Pmove. Beide Profile verwenden dasselbe MiniLang-Testbinary
(`bde87bd5915be6a99aa38ad3d4c9da9ec24eb57c8d057d956a47cb6b028c6860`).

Der Testhost bewegt Entities mit aufgezeichneten Änderungen und ruft Sprungpads
an festgelegten Befehlsgrenzen auf. Die tatsächlichen Traces, Pmove-Schritte und
Sprungpad-Zustandswechsel führt jeweils C bzw. MiniLang aus. Das ist noch keine
Trigger-Erkennung oder Mover-Push-Simulation eines vollständigen Game-Servers.
Diese älteren Aufruf-Replays bleiben separat erhalten. Die nachfolgend beschriebenen
Game-Übergangstests prüfen inzwischen auch geometrische Trigger-Erkennung und das
Zurücksetzen der Sprungpad-Merker beim Verlassen.

`test_shared_game.py` prüft zusätzlich 16.384 Fälle und 2.113.536 Wörter für
`BG_EvaluateTrajectory`, `BG_EvaluateTrajectoryDelta`, `BG_PlayerTouchesItem`,
`BG_TouchJumpPad`, `vectoangles` und beide Winkel-Normalisierungen. Alle sechs
Bewegungsbahnen, Stop-Zeitgrenzen, die asymmetrische Item-Box, beide Sprungpad-
Effekte, wiederholte Kontakte, Zuschauer und Flight sind enthalten. Die originale
Sinus-Geschwindigkeitsformel mit Faktor 0,5 wird bewahrt. Sechs Fehlerproben weisen
unbekannte Trajektorientypen und Sinusdauer 0 zurück; weitere sechs prüfen die
Entity-Schnittstelle. Dies erweitert die getrennte Sammlung von 115 Fehlerproben.

`atan2` kommt wie `sin` und `cos` aus der C-Laufzeit. Winkelrechnung und
Zustandswechsel bleiben MiniLang. Die direkte Multiplikation eines negativen
Nullwerts mit einem Integer verliert im eingefrorenen Compiler das Vorzeichen;
der Port bewahrt es im Winkelpfad ausdrücklich und prüft es gegen C.

Die räumlichen Entity-Felder bilden noch keinen vollständigen Netzwerkcodec.
`SV_PointContents` bewahrt die Originalverwendung von `s.origin`/`s.angles`,
während Link/Trace aktuelle räumliche Koordinaten benutzen. Schnittstellen und
weitere Grenzen stehen in [SERVER_COLLISION.md](SERVER_COLLISION.md).

Das Originalprofil ist für temporäre Kapsel-Zielmodelle festgelegt: kontrollierter
Fehler bei Handle 254. Eine Korrektur des Originalfehlers würde ein zusätzliches
Erweiterungsprofil erhalten und ist keine Voraussetzung für Gleichheit mit dem
festgehaltenen C-Stand. Die inzwischen geprüften Teleport-Übergänge und ihre Grenze
an der Schadensfunktion sind im folgenden Abschnitt beschrieben.

## EntityState, Trigger-Erkennung und Teleport-Übergänge

`test_entitystate.py` prüft 16.384 Fälle mit 2.916.352 identischen Ergebniswörtern
und weiteren 851.968 unveränderten Codec-Wörtern. Der vollständige `entityState_t`
hat 28 Felder und 208 Bytes. Die C-Referenz bestätigt 36 aufgelöste Feldpositionen
einschließlich der beiden Trajektorien. Beide `BG_PlayerStateToEntityState`-
Varianten, externe/gepufferte Ereignisse, Sequenzbits, lebende/tote Spieler,
Powerups, unberührte Felder und `SetClientViewAngle` werden verglichen. Zwei
zusätzliche Proben weisen abgeschnittene Puffer und negative Offsets zurück.

`test_transitions.py` verbindet die vollständigen Originalfunktionen
`G_TouchTriggers`, `TeleportPlayer`, `G_KillBox`, `G_TempEntity`,
`SetClientViewAngle`, die Platzverwaltung sowie die beiden Push-/Teleporter-
Touch-Funktionen mit dem originalen SV-/CM-/Pmove-Code. Enthalten sind:

- Geometrische Box-/BSP-Kontakte, gedrehte Modelle, der Item-Sonderfall,
  Zuschauer-/Bot-Filter und Touch-Callback-Reihenfolge.
- Wiederholte Sprungpad-Kontakte, Verlassen, erneuter Eintritt sowie Teleports
  während einer bereits laufenden Kandidatenschleife.
- Temporäre Ereignis-Entities, genaue und abgeschnittene Positionen, Blickwinkel-
  Deltas, Teleport-Bit, Knockback-Zeit und Unlink-/Link-Reihenfolge.
- Aktive Target-Namen, Groß-/Kleinschreibung, die ersten 32 Kandidaten und das
  native Win32-Rand-Profil; außerdem Freigabe, Wachstum, Sperrfrist und `neverFree`.

Beide Kurvenprofile zusammen vergleichen 147.136 Operationen und 24.340.128
identische 32-Bit-Wörter. Darin enthalten sind 16.384 Pmove-/Link-/Touch-Befehle
und 3.072 aufgezeichnete Telefrag-Schadensaufrufe. Die Bewegungsfolgen haben
4.608 Frames mit aktivem und 11.776 Frames mit zurückgesetztem Sprungpad-Merker.
Beide Profile verwenden dasselbe MiniLang-Testbinary
(`77c505b7e9666a9a17f03470986affb9262c53bd5d79bac914af2d29c1deec07`).

Die Tests initialisieren Game-Entities gezielt auf allen 31 CD-Karten und einer
assetfreien Karte. Das Pmove/Link/Touch-Protokoll stammt aus dem Vergleichshost;
es ersetzt noch keinen vollständigen `ClientThink`-/Serverframe und kein
ursprüngliches Spawn-Parsing. Ereignis-Entities erhalten die Originalmerker für
spätere Freigabe; ihre automatische Entfernung ist inzwischen in der gesonderten
Target-/Entity-Schleifenprüfung abgedeckt. Client- und Spielmodul-Frames sind
inzwischen separat geprüft; durchgängige Engine-/Match-Replays bleiben offen.

**Telefrag-Grenze:** Kandidaten, Aufrufreihenfolge, Schaden 100.000, Flags und
`MOD_TELEFRAG` stimmen mit `G_KillBox` überein. Die Funktion `G_Damage` ist hier
eine aufgezeichnete Callback-Grenze. Dieser ältere Test deckt keine Schadensfolgen ab; die zusätzliche Kampfprüfung
unten vergleicht inzwischen Schaden, Rüstung, Teamschutz und Telefrag-Integration.
Die Spieler-Todesregeln und Score-Einbindung werden inzwischen in der gesonderten
Todesprüfung bis `G_Damage → player_die` verglichen. Ein vollständiger
KillBox-/Match-Replay mit dieser Folge bleibt offen. Ein fehlender Schadenscallback
wird in MiniLang bei einem betroffenen Client als Fehler behandelt.

Der Original-Allocator bricht im vollen Normalbereich auch bei einem zu kürzlich
freigegebenen Platz ab; seine nominelle zweite Suchrunde erreicht diese Grenze
nicht. Zwei separate C-Läufe prüfen diesen Fehler, fünf MiniLang-Vertragsproben
prüfen Erschöpfung, Wiederverwendung genau nach 1.000 ms und Teleport ohne Client.
Details der Schnittstellen stehen in [GAME_TRANSITIONS.md](GAME_TRANSITIONS.md).

## Spawn-Parsing, Worldspawn und verzögerte Zielausrichtung

Die neue Referenz kompiliert das vollständige ursprüngliche `g_spawn.c`.
`test_spawn_values.py` vergleicht 4.096 Fälle, 800.360 Ergebniswörter und
1.767.499 String-Bytes für alle 20 Feldregeln und die Spawn-Getter. Doppelte
Schlüssel, Groß-/Kleinschreibung, Backslash-Regeln, Vorgabewerte, partielle Getter-
Vektoren und CRT-Zahlengrenzen sind enthalten. Sechs separate C-Läufe bestätigen
Parserfehler; 30 Laufzeitverträge prüfen weitere Grenzen der MiniLang-Schnittstelle,
einschließlich fehlender Frame-Handler, überlanger Shader-Remap-Namen, fehlendem
Speaker-Noise-Schlüssel und NULL-Configstring-Speicherung.
1.024 direkte `G_RunThink`-Vergleiche stimmen in 2.048 Wörtern überein, darunter
Zeitwerte an der binary32-Grenze um 16.777.216 und an den signed-int-Grenzen.
Ein separater C-Lauf bestätigt den Fehler eines fälligen, fehlenden Think-Callbacks.

`test_spawn.py` prüft 168 Karten-/Spielmodus-Replays: alle 31 CD-Karten in den
fünf Modi FFA, Tournament, Single Player, Team Deathmatch und CTF; zusätzlich
eine konstruierte Karte mit zehn Moduswerten und drei Schwerkraftvarianten.
16.469.869 Wörter und 2.052.662 String-Bytes stimmen exakt. Nach 849 Kontaktproben
an tatsächlich geladenen Triggern tragen 754 PlayerStates einen Sprungpad-Merker
und 139 das Teleport-Bit. Eine Probe kann durch überlappende Trigger beide Merker
tragen; diese Zahlen zählen Ergebniszustände, nicht die Zahl einzelner Callbacks.
Feld-, Think- und Kartenprüfung verwenden dasselbe MiniLang-Testbinary
(`eb2b7b0a14844c61c0833ec957124a4bd48a515daf5841705cd3d1c12c3eacf5`).

Alle 48 Spawn-Klassen führen übertragene Originalfunktionen aus.
Worldspawn-Effekte, alle Spielmodusfilter, die frühe Brush-Modell-Verlinkung,
die 100-ms-Zielausrichtung der Sprungpads und komplette PlayerStates nach
Trigger-Kontakten sind enthalten. Einige originale Positions-/CTF-Spawn-Funktionen
sind leer; manche andere geben ihre Entity unmittelbar frei. Die Abnahme bewahrt
diese Funktionen, ohne damit bereits Spieler-Respawn oder CTF-Regeln zu behaupten.

**Mover-Abnahme:** Die acht Mover-Klassen laufen inzwischen durch echte Spawn- und
Framepfade. Lineares und rotierendes Schieben, Client-Yaw, Rückrolldaten und
Areaportal-Referenzzähler besitzen Laufzeitverträge; drei `func_rotating`-Achsen
werden außerdem exakt gegen das unveränderte C-Orakel verglichen. Alle 35 Item-Aufrufe laufen durch `G_SpawnItem`; Platzierung und
späteres Verhalten prüft die gesonderte Item-Suite. Der Testhost stellt Speicher
und Configstring-/Cvar-Schnittstellen bereit; Netzwerkverteilung und vollständige
Karten-Replays komplexer Blockaden des Mover-Schiebekerns bleiben offen. Die Item-Suite prüft inzwischen
Aufnahme, Pickup-Targets und Respawn. Ereignisfreigabe wird in
der nachfolgend beschriebenen Entity-Schleife geprüft.

Unvollständige Feldvektoren und ein abschließender `G_NewString`-Backslash haben
im Original kein verlässlich initialisiertes Ergebnis und werden im Port
abgewiesen. Getrennte Referenzprofile wären für andere CRTs, Locales oder QVM-
Zahlentext-Konvertierungen nötig. Schnittstellen und Details: [SPAWNING.md](SPAWNING.md).

## Target-Ketten, Ereignisse und Entity-Schleife

`test_targets.py` vergleicht 28 Szenarien mit 9.691 Aktionen, 40.453.187 identischen
32-Bit-Wörtern und 4.721.815 identischen String-Bytes. Ausgeführt werden originale
Use-/Think-/Spawn-Funktionen für `target_delay`, `target_relay`,
`target_teleporter`, `trigger_multiple`, `trigger_always`, `target_speaker`,
`target_push`, `func_timer` und `target_location`, außerdem
`G_UseTargets`, Shader-Remaps, `G_AddEvent` und `G_Sound`.

Die Fälle prüfen die laufende Suche nach Targets, veränderte Namen, entfernte
Ziele, sofort wiederverwendete Plätze und während eines Frames angelegte Entities.
1.024 Verzögerungsproben decken native Zufallszahlen, doppelt genaue
Zwischenrechnungen und große Zeitwerte ab. Teamfilter, überschriebene Auslöser,
einmalige Trigger, Ereignis-Sequenzbits, temporäre Sounds und Teleports sind
enthalten. Shader-Tests prüfen Halbwerte, signed zero, kleine/große Floats,
128 Remaps und die ursprünglichen Ausgabegrenzen. Die Windows-C-Laufzeit wird
mit der zur MSVC-Referenz passenden Standardrundung aufgerufen; eine native
Implementierung von Spielregeln wurde dafür nicht ergänzt.

Die Erweiterung prüft alle 16 Speaker-Flag-Kombinationen, Loop-/Ereignispriorität,
Dateinamensgrenzen, Wait-/Random-Konvertierung und fehlende Noise-Schlüssel.
Push-Targets werden mit Richtungen, Speed, Scheitelpunkten, allen sieben
Bewegungstypen, Flight sowie gemeinsam benutzter Soundsperre verglichen.
512 zusätzliche Timer-Präzisionsproben ergänzen Start-On, sofortiges Auslösen,
Ausschalten und Änderungen während der Target-Kette. Zwei gesonderte Fehlerläufe
bestätigen den späteren fehlenden Think-Callback eines durch sein Target
freigegebenen Timers. 71 Ortsmarkierungen prüfen verzögerten Listenaufbau,
fehlende Nachrichten, die fehlende Inuse-/64er-Begrenzung und spätere Freigaben.
Die lokale NULL-zu-Leerstring-Behandlung des Configstring-Hosts bildet den
entsprechenden Vertrag aus `SV_SetConfigstring` ab; dessen vollständige Original-
Implementierung und Netzwerkverteilung werden noch nicht verglichen.

Für `frame.runEntities` wird der Entity-Schleifenblock unverändert aus
`G_RunFrame` extrahiert. Geprüft sind der strikte Ablauf nach mehr als 300 ms,
Freigabe-/Unlink-Priorität, `neverFree`, ausbleibende Think-Aufrufe für temporäre
Entities und die Auswahl der weiteren Handler. In diesem Target-Test bleiben die
Missile-, Item-, Mover- und Client-Handler aufgezeichnete Aufrufgrenzen. Die
gesonderten Projektil- und Item-Prüfungen führen ihre jeweiligen Zweige mit der
echten portierten Verarbeitung aus. Dies ist
**keine vollständige G_RunFrame-Abnahme**: Cvar-/Zeitverwaltung, ClientEndFrame,
Matchende und Votes werden inzwischen durch die getrennten Frame-/Gameplay-Suiten
geprüft. Die vollständige Serverintegration bleibt offen.
Schnittstellen und genaue Grenzen: [TARGETS_AND_EVENTS.md](TARGETS_AND_EVENTS.md).

## Schadensberechnung und Karten-Gefahren

`test_combat.py` vergleicht 57 Szenarien mit 19.543 Aktionen,
31.607.620 identischen 32-Bit-Wörtern und 1.790.052 String-Bytes.
Dabei werden 2.681 Sichtlinien-/Laser-Traces vollständig beobachtet. Enthalten sind die
baseq3-Spielregeln von `G_Damage`, `CheckArmor`, `OnSameTeam`,
`Team_CheckHurtCarrier`, `CanDamage`, `G_RadiusDamage`, `LogAccuracyHit`,
`trigger_hurt`, `target_kill` und `target_laser`. Der Vergleich erfasst
Gesundheit, Rüstung, Rückstoß, Trefferzähler, Schadensakkumulatoren,
Battlesuit-Ereignisse, CTF-Trägerdaten sowie Pain-/Death-/Mover-Aufrufe in
Originalreihenfolge. Der Träger-Zeitmerker wird als Float-Bits verglichen.

Die Fälle prüfen unter anderem Schutzkombinationen, Selbstschaden, Handicap,
negative Werte, 1024 numerische Schadensproben, große Spielzeiten, alle 32
Hurt-Flags und gemeinsame Trigger-Sperrzeiten. Räumliche Trigger-Kontakte und
KillBox-/Teleport-Folgen sind mit der tatsächlichen SV-/CM-Kollision und der
echten Schadensfunktion verbunden. Acht zusätzliche Laufzeitverträge prüfen
die Bindung, die Float-Parametergrenzen und kontrollierte Fehler bei fehlenden
oder ungültigen Handlerzuständen.

Pain-, Death- und Mover-Callbacks beobachten in dieser isolierten Suite ihre
Argumente und Eintrittszustände; einzelne Test-Callbacks geben die Entity frei.
Die anschließende Todes-Suite verwendet stattdessen den echten `player_die`-Port.
Die [Baseq3-Waffen](WEAPONS.md) verbinden inzwischen die Treffer- und
Genauigkeitsregeln mit echtem Schaden. Die vollständige Engine-Serverintegration bleibt offen. Schadensfeedback am Frame-Ende ist
inzwischen durch die gesonderte ClientEndFrame-Prüfung abgedeckt.
`G_Printf`-Diagnosen und Missionpack gehören nicht zu dieser Abnahme.
Der Rüstungsport verwendet die CRT-Mathematikfunktion `ceil`; die Spielregeln
bleiben MiniLang und die Projekt-DLL bleibt unverändert.
Schnittstellen, numerisches Profil und offene Grenzen: [COMBAT.md](COMBAT.md).

Die Erweiterung beobachtet alle Sichtlinien-/Laser-Traces mit Eingaben und
vollständigen Ergebnisfeldern. Echte Inline-BSP-Hindernisse erzwingen die
ursprünglichen ein bis fünf Sichtlinien-Abfragen; Radiusgrenzen, 512 numerische
Radius-Proben, lebend veränderte Kandidaten und der Treffer-Rückgabewert vor
Schutzregeln sind enthalten. Laser-Tests prüfen Start/Umschaltung, das erste
aktive Ziel, fortlaufende Zielverfolgung, Entity 0, Owner-Filter und 256
Subnormal-Proben für die doppelt genauen `VectorMA`-Zwischenrechnungen.
Sichtlinien und Radius-Schaden werden zusätzlich auf allen 31 CD-Karten verglichen.

**Kontrollierte Abweichung:** Ein Test-Callback gibt den angreifenden Laser frei.
Das Original verlinkt ihn danach mit `s.number = 0` und benutzt damit fremde
Server-Metadaten. MiniLang weist die unpassende Entity-/Slot-Nummer weiterhin ab.
Der Ablauf stimmt bis zu dieser Grenze überein; sein restlicher C-Pfad wird
nicht als portiert gezählt. Der gesonderte Fehlerlauf und seine Eingaben sind
im Nachweis festgehalten.


## Projektile, Grappling-Hook und Shooter

`test_missiles.py` vergleicht 71 Szenarien mit 20.623 Aktionen,
51.274.574 identischen 32-Bit-Wörtern und 2.612.912 String-Bytes.
1.260 vollständige Traces verbinden Projektilflug, reale SV-/CM-Kollision und
die Schadensfunktion. Alle 31 CD-Karten werden mit Kurven geprüft.

Enthalten sind alle fünf baseq3-Projektil-Erzeugungen, `G_RunMissile`,
`G_BounceMissile`, `G_MissileImpact`, `G_ExplodeMissile`, die Hook-Think-/Free-
Funktionen, drei Shooter-Klassen sowie deren Item-Suche und Registrierung.
670 Erzeugungen, 512 numerische Abprallproben, 256 Shooter-Präzisionsfolgen,
Direkt-/Radius-Treffer, Schutzregeln, Callback-Änderungen, Owner-Filter,
Start-in-Solid, Metall/Himmel, Timeouts und Ereignisfreigabe werden verglichen.
Acht zusätzliche Laufzeitverträge prüfen Felder und kontrollierte Fehlergrenzen.

Eine absichtlich im Pain-Callback freigegebene Projektil-Entity reproduziert
die bekannte Link-Grenze: C verwendet danach fremde Server-Metadaten, MiniLang
weist die falsche Entity-/Slot-Nummer zurück. Dieser separate Ablauf zählt
ausschließlich bis zur kontrollierten Abweichung als verglichen.

Die neuen Richtungsproben haben außerdem die NaN-Vorzeichenerhaltung der
Float-Subtraktion korrigiert. Zusätzlich zu den 101.445 binären Ergebnissen
prüft der Zahlentest nun 20.289 tatsächliche `fsub`-Aufrufe.
Details, Schnittstellen und verbleibende Abnahmen: [MISSILES.md](MISSILES.md).

## Spawnpunkte und Leichenverwaltung (Schritt 6)

`scripts/test_bodies.py --data-root D:/Quake3` besteht mit **65 Szenarien**,
**10.333 Aktionen**, **51.664.671 exakt gleichen 32-Bit-Wörtern**,
**5.772.168 String-Bytes** und **305 Traces**. Darin enthalten
sind gezielte Spawnpunkt-/Leichenproben mit echter BSP-Geometrie aus allen 31
CD-Karten. Zehn Laufzeitverträge und die beidseitige Zurückweisung einer fehlenden
Spawnposition ergänzen die gültigen Vergleichsfälle.

Übertragen sind Deathmatch-, Initial-, Team- und Zuschauer-Auswahl,
`FindIntermissionPoint`, die acht Leichenplätze, `BodySink`, `LookAtKiller`,
`GibEntity` und `body_die`. Die Entity-Schleife führt den Nicht-Item-Leichenpfad
von `G_RunItem` mit echtem Server-Trace, Think-/Link-Reihenfolge und Abprall aus.
Die Tests vergleichen auch alle EntityState-Felder, alte Leichengesundheit,
Ringumlauf, No-Blood/No-Drop, Zufallsendpunkt und signierte Zeitgrenzen.

Test-Binary: `eb2b7b0a14844c61c0833ec957124a4bd48a515daf5841705cd3d1c12c3eacf5`. Regeln, Grenzen und Quellzuordnung stehen in
[PLAYER_LIFECYCLE.md](PLAYER_LIFECYCLE.md). Die Überschreitung des ursprünglichen
128er-Deathmatch-Arrays wird kontrolliert zurückgewiesen; dieser undefinierte
C-Pfad wird nicht als identisches Verhalten ausgewiesen. `player_die` und der
Respawn-Wrapper sind inzwischen in [DEATHS.md](DEATHS.md) integriert; Item-Entities
und ihre Physik sowie Pickup-Regeln stehen in [ITEMS.md](ITEMS.md). `ClientSpawn`
ist inzwischen separat geprüft. Die Client-Frames sind in
[CLIENT_THINK.md](CLIENT_THINK.md) und [CLIENT_FRAMES.md](CLIENT_FRAMES.md)
verglichen; vollständige Engine-/Match-Replays bleiben offen.

## Punkte, Ranglisten und Matchende (Schritt 6)

`scripts/test_scores.py` besteht mit **53 Szenarien**,
**6.241 Aktionen**, **66.851.297 exakt gleichen 32-Bit-Wörtern**,
**2.606.540 String-Bytes**, **412 Servernachrichten**
und **70 Logzeilen**. Zwölf Laufzeitverträge ergänzen die gültigen
Vergleichsfälle. Geprüft werden nach jeder Aktion alle 64 vollständigen
Client-PlayerStates, Client-/Level-Felder, Entity-Zustände, Empfänger,
Configstrings und die Reihenfolge der Nachrichten und Übergangsargumente.

Übertragen sind `ScorePlum`, `AddScore`, `SortRanks`, `CalculateRanks`,
`DeathmatchScoreboardMessage`, `Cmd_Score_f`,
`SendScoreboardMessageToAllClients`, `ScoreIsTied`, `CheckExitRules`,
`LogExit` und `CheckIntermissionExit`. Die Vergleichsfälle umfassen
Bots, Zuschauer, verbindende Clients, bis zu 64 Clients, Score-Überlauf,
Warmup, Scoreboard-Texte an der Grenze von exakt 1.024/1.025 Bytes,
Sudden Death, Limit-Priorität, Bereitschaft und signierte Zeitgrenzen.

Die Rangsortierung verwendet einen MiniLang-Port des Vergleichs- und
Partitionierungsablaufs des nativen Windows-UCRT-Profils. Die C-Referenz ruft
ihr tatsächliches `qsort` auf. SDK-Version, Quell-, Compiler- und
statischer Runtime-Hash sind im Bericht festgehalten. Die separate
QVM-Sortierung ist nicht als reihenfolgegleich abgenommen.

Der ursprüngliche Reset schreibt über sein Array mit zwei Team-Wählerzählern
hinaus und löscht im geprüften nativen Layout zusätzlich `spawning` und
`numSpawnVars`. MiniLang bildet diese beobachteten Nebenwirkungen durch sichere
Feldzuweisungen ab. Ein eigener Vergleichsfall und Layout-Prüfungen im
Referenzadapter sichern dieses ausdrücklich auf den nativen Build begrenzte
Verhalten ab; es ist keine Zusage definierten oder portablen C-Verhaltens.

Test-Binary: `eb2b7b0a14844c61c0833ec957124a4bd48a515daf5841705cd3d1c12c3eacf5`. Regeln und Grenzen stehen in
[SCORES.md](SCORES.md). `BeginIntermission` und `ExitLevel` bleiben explizite
Callbacks; geprüft werden die Entscheidungen und Zustandsänderungen vor und
nach ihrem Aufruf. Logtexte und Serverbefehle werden an der Aufrufgrenze
beobachtet. Zeitstempel und Log-Ausgabereihenfolge sind inzwischen separat in
[GAME_LOGGING.md](GAME_LOGGING.md) geprüft. Tatsächliche Kartenwechsel,
Datei-/Netzwerkzustellung und Scoreboard-Grafik sind noch offen. Spieler-Tod,
Team-Fragboni, Drop-Entscheidungen und der Respawn-Wrapper binden diese
Bausteine inzwischen ein. Item-Aufnahme und CTF-Capture verwenden sie ebenfalls;
vollständige Client-/Server-Pfade
bleiben offen.

## Spieler-Tod, Team-Fragboni und Respawn-Wrapper (Schritt 6)

`scripts/test_deaths.py` besteht mit **23 Szenarien**, **330 Aktionen**,
**3.887.033 exakt gleichen 32-Bit-Wörtern** und **40.921 String-Bytes**.
Acht Laufzeitverträge ergänzen die gültigen Vergleichsfälle. Nach jeder Aktion
werden die vollständigen Score-/Entity-/PlayerState-Daten sowie Todesfelder,
Handler, Feind- und Hook-Referenzen verglichen.

Übertragen sind `TossClientItems`, `CheckAlmostCapture`, `CheckAlmostScored`,
`player_die`, `OtherTeam`, `TeamName`, `Team_FragBonuses`, `SV_inPVS` und der
`respawn`-Wrapper. Die Tests umfassen alle Obituary-Namen, Welt-, Eigen-, Team-
und normale Kills, Gauntlet/Excellent, Team- und Flaggenträgerboni, PVS-/
Distanzgrenzen, Flaggenpriorität, No-Drop, Todesanimationen, Gibs, Blutoption,
Hook-Freigabe, Zuschauer-Scoreboards und den tatsächlichen Pfad
`G_Damage → player_die`. Der originale Trägerschutz überschreibt einen
Entfernungsvektor; dieses beobachtete Baseq3-Verhalten wird exakt bewahrt.

`Drop_Item` und `Team_ReturnFlag` laufen in diesen Todesfällen als echte portierte
Entity-Pfade. Der C-Host protokolliert weiterhin `PrintMsg` und den für diese
isolierte Suite eingesetzten `ClientSpawn`-Override;
Score-, Body-, Hook-, BSP-/PVS- und Entity-Code laufen tatsächlich. Der
Respawn-Test verändert im `ClientSpawn`-Callback absichtlich Position und
Clientnummer und weist dadurch nach, dass der nachfolgende Teleport-Effekt die
Rückgabewerte verwendet. Der normale Respawn führt inzwischen den echten
MiniLang-`ClientSpawn` aus. Item-Aufnahme und CTF-Capture sind separat verbunden;
Client-Frames, Netzwerkzustellung und Missionpack bleiben offen. Details:
[DEATHS.md](DEATHS.md).

## ClientSpawn (Schritt 6)

`scripts/test_client_spawn.py` besteht mit **21 Szenarien**, **5.766 exakt
gleichen 32-Bit-Wörtern**, **23.190 Ausgabe-Bytes** und **144 geordneten
Host-/Link-Ereignissen**. Acht Laufzeitverträge prüfen die Initialisierung,
Info-Strings, fehlende Pflichtgrenzen und die Standardverbindung aus `respawn`.

Der Port deckt FFA-, Initial-, CTF-, Team- und Zuschauerpositionen,
Bot-/Human-Filter, Persistenz und Transient-Reset, Handicap, Spawnzähler,
Startwaffen, Gesundheit, Teleport-/Vote-Flags, KillBox, Verlinkung, Spawn-Targets,
Waffenwahl und beide PlayerState-zu-EntityState-Konvertierungen ab. Die gemeinsame
Info-Schlüsselsuche und die 1.023-Byte-Userinfo-Kopie sind auch mit wechselnder
Schreibweise, Duplikaten und abgeschnittenen Handicap-Werten geprüft. Die native
Referenz führt den unveränderten `ClientSpawn`-Funktionskörper aus.
`trap_GetUserinfo`, `trap_GetUsercmd`, `ClientThink`, `ClientEndFrame` und
`MoveClientToIntermission` bleiben in dieser isolierten ClientSpawn-Suite
explizit beobachtete Host-Grenzen; der normale MiniLang-Pfad ruft inzwischen
die portierten Think-/Frame-Abschlüsse und Intermission-Platzierung auf. Details:
[CLIENT_SPAWN.md](CLIENT_SPAWN.md).

## ClientBegin (Schritt 6)

`scripts/test_client_begin.py` besteht mit **zehn Szenarien**, **3.637 exakt
gleichen 32-Bit-Wörtern**, **15.163 Ausgabe-Bytes** und **116 geordneten
Host-/Configstring-/Link-Ereignissen**. Fünf Laufzeitverträge prüfen Slotgrenzen,
Pflichtschnittstellen und die Registrierung als Standard-Callback.

Der Vergleich führt `ClientBegin`, `ClientSpawn` und `CalculateRanks` auf beiden
Seiten als echte Implementierungen aus. Geprüft sind Unlink/Reinitialisierung,
persistent gebundener Client, vollständiger PlayerState-Reset mit erhaltenen
`eFlags`, Spawn, Teleport-In-Ereignis, Eintrittsmeldung, Log und Ränge. Tournament,
Zuschauer, Intermission, CTF, ein weiterer Ranglisten-Client und 32-Bit-Zeitgrenzen
sind enthalten, ebenso die gemeinsame Userinfo-Suche und die ursprüngliche
Puffergrenze im Eintrittspfad. Details: [CLIENT_BEGIN.md](CLIENT_BEGIN.md).

## Userinfo, Spielernamen und Teamwahl (Schritte 3 und 6)

`scripts/test_client_info.py` besteht mit **195 Szenarien**, **1.947 Aktionen**,
**7.925.495 exakt gleichen 32-Bit-Wörtern**, **32.887.041 Ausgabe-Bytes** und
**722 geordneten Nebenwirkungen**. 18 Laufzeitverträge und zwei native
Fehlerfälle ergänzen den Vergleich.

Geprüft sind `ClientCleanName`, `ClientUserinfoChanged`, `TeamLeader`, `PickTeam`,
`Info_ValueForKey` und `Info_Validate`: bytegenaue Namen/Farben/Leerzeichen,
ASCII-Schlüsselsuche, originale Puffergrenzen, lokaler Clientstatus, Vorhersage,
Umbenennungsreihenfolge, Handicap, Modelle, Bot-Anzeigeteam, Overlay und exakte
Spieler-Configstrings samt Log. Jeder Host-Aufruf und jede zustandsändernde
Aktion vergleicht sämtliche 117 PlayerState-Wörter aller 64 Clients, relevante
Client-/Sitzungs-/Entity-Felder, Spieler-Configstrings und Team-Vote-Zustand.
Reine Hilfsfunktionen haben eigene Ergebnisvergleiche.

Die tatsächliche Standardverbindung aus `SetLeader` läuft in vollständigen
roten und blauen Team-Vote-Folgen; Userinfo-Änderungen steuern anschließend auch
die echten Overlay-Nachrichten. Engine-Userinfo-Zustellung, Serverbefehle,
Configstring-Netzwerktransport und Logdatei bleiben Host-Grenzen. `ClientConnect`
und Sitzungs-Persistenz sind inzwischen separat portiert; deren Suite prüft
zusätzlich nicht normalisierte Leiterwerte. Details: [CLIENT_INFO.md](CLIENT_INFO.md).

## ClientConnect und Sitzungsdaten (Schritt 6)

`scripts/test_client_connect.py` besteht mit **268 Szenarien**, **377 Aktionen**,
**26.734.597 exakt gleichen 32-Bit-Wörtern**, **111.455.661 Ausgabe-Bytes** und
**1.771 geordneten Nebenwirkungen**. 27 Laufzeitverträge ergänzen den Vergleich.

`ClientConnect`, alle fünf Funktionen aus `g_session.c` und `BroadcastTeamChange`
sind gegen ihre unveränderten Originalkörper geprüft. Enthalten sind IP-/
Passwortreihenfolge, die Passwortausnahme anhand des bestehenden Bot-Flags,
vollständiger Reset aller modellierten Clientfelder, Sitzungsinitialisierung
und -lesen, Bot-Rückgabe, echte Userinfo-Verarbeitung, Teamnachrichten und echte
Rangberechnung. Alle 66 modellierten Clientfelder in sämtlichen 64 Slots,
einschließlich aller 117 PlayerState-Wörter, sowie Sitzungs-Cvars, Ränge und
Configstrings werden an jeder Host-Grenze und nach jeder Aktion verglichen.

Sitzungsfälle prüfen sieben native CRT-`%i`-Konvertierungen, Hex-/Oktalwerte,
Integergrenzen und unveränderte Leiter-Integer, automatische Teamwahl,
Spielerkapazität, das erhaltene `newSession`-Flag und das Speichern ausschließlich
verbundener Clients. Schreiben → Level-Neuaufbau → Wiederverbindung erhält die
tatsächliche MiniLang-Registry. Die Verbindung mit registrierten und aktualisierten
`g_teamAutoJoin`-/`g_maxGameClients`-Kopien ist zusätzlich geprüft.

Der native Host modelliert Session-Cvar-Speicherung und behält seinen
beobachteten IP-Override. Die portierten IP-Filter liefern jetzt die
Standardentscheidung und sind separat geprüft; zusätzliche Connect-Verträge
prüfen echte Ban-/Whitelist-Ablehnungen. Bot-Userinfo und Setup-Einstellungen laufen
standardmäßig durch `G_BotConnect` und den portierten `BotAISetupClient`-
Ressourcenpfad. `BotAIShutdownClient` ist ebenfalls Lifecycle-Default; die einzelnen
Botlib-, Userinfo-, Server- und Logdienste bleiben explizite Host-Schnittstellen. Unvollständige
Scans werden vor einer MiniLang-Zustandsänderung kontrolliert abgewiesen;
der Originalcode würde dabei nicht initialisierte lokale Variablen lesen.
Vollständiger Engine-/Modullebenszyklus, Engine-Mapausführung,
Dateipersistenz und Netzwerk bleiben offen. Die Intermission-Steuerung,
Teamwechsel und `ClientDisconnect`
sind im folgenden Nachweis separat erfasst.
Details: [CLIENT_CONNECT.md](CLIENT_CONNECT.md).

## Teamwechsel und ClientDisconnect (Schritt 6)

`SetTeam`, `StopFollowing`, `Cmd_Team_f` und `ClientDisconnect` bestehen
**227 Szenarien**, **266 Aktionen**, **78.057.316 exakt gleiche Wörter**,
**318.595.344 Ausgabe-Bytes** und **3.494 geordnete Nebenwirkungen**.
Weitere **15 Laufzeitverträge** prüfen Bindungen, Pflichtschnittstellen und
`g_teamForceBalance`-Refresh. Teamgrößen/Kapazitäten, Leichen, Waffen-/Powerup-
Drops, CTF-Rückgaben, Leiterwechsel, Cooldown/Überläufe, Duell-Siegpunkte und
Zuschauerfreigabe laufen mit tatsächlichen portierten Spielabläufen.

Alle modellierten Clientfelder aller 64 Slots, alle PlayerStates, die EntityStates
sämtlicher allokierter Entities und ausgewählte private/räumliche Felder werden
bei jedem Host-Aufruf und nach jeder Aktion verglichen. Dazu kommen Rang-,
Configstring-, Item- und Leichenwarteschlangen-Zustände. Ein Null-Clientlimit-Fall
belegt die Korrektur einer rückwärts laufenden Zuschauer-Schleife in `playerDie`.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Bot-Queue/-Shutdown und Engine-Zustellung bleiben Pflichtschnittstellen;
Bewegung, Endframe und Intermission werden in dieser Integrationssuite beobachtet.
Follow-Befehle und Tournament-Nachrücken sind inzwischen separat geprüft.
Die tatsächlichen Intermission-/Levelende-Funktionen sind separat verbunden.
Die vollständige [ClientCommand-Verteilung](CLIENT_COMMANDS.md) ist separat geprüft;
Engine-Mapausführung bleibt offen.
Details: [TEAM_CHANGES.md](TEAM_CHANGES.md).

## Follow-Befehle und Duell-Warteschlange (Schritt 6)

`SanitizeString`, `ClientNumberFromString`, beide Follow-Handler,
`AddTournamentPlayer`, `RemoveTournamentLoser`, `RemoveTournamentWinner` und
`AdjustTournamentScores` bestehen **192 Szenarien** mit **331 Aktionen**,
**28.312.377 exakt gleichen Wörtern**, **115.548.855 Ausgabe-Bytes** und
**1.034 geordneten Nebenwirkungen**. **23 Laufzeitverträge** ergänzen Bindungen,
Puffer-/Slotgrenzen und begrenzte Fehlerpfade für problematische Originaleingaben.

Die Vergleiche führen tatsächliche Teamwechsel, Tod, Leichen-/Itemverwaltung,
Userinfo, Begin/Spawn und Ränge aus. Die Zuschauer-Angriffstaste verwendet den
echten `SpectatorThink`-/Pmove-Pfad. Duellfolgen vergleichen Nachrücken,
Gewinner-/Verliererwechsel und Countdown/Restart über den tatsächlichen
`CheckTournament`-Ablauf. **Vier originale Richtungsfehler** vergleichen auch
den Zustand nach allen vorherigen Änderungen. Die Original-Namenssuche behält
`^`-Farbcodes und entfernt wegen signed-char-Semantik Bytes ab 128.

Ein abschließendes ESC, leere Clientspannen und ungültige Zyklus-Startslots ohne
Kandidaten können in C ungültig lesen oder endlos suchen. MiniLang meldet dafür
begrenzte Fehler; diese Pfade zählen nicht als native Verhaltensgleichheit.
Spawn-Think-/Endframe-/Intermission-Callbacks bleiben hier beobachtet;
Die Intermission-/Levelende-Funktionen sind im nächsten Nachweis direkt verbunden.
Die vollständige [Befehlsverteilung](CLIENT_COMMANDS.md) ist separat geprüft.
Engine-Zustellung bleibt offen.
Details: [FOLLOW_TOURNAMENT.md](FOLLOW_TOURNAMENT.md).

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.

## Intermission und Levelende (Schritt 6)

`MoveClientToIntermission`, `BeginIntermission` und `ExitLevel` bestehen
**85 Szenarien** mit **182 Aktionen**, **14.213.657 exakt gleichen Wörtern**,
**57.981.936 Ausgabe-Bytes**, **503 geordneten Nebenwirkungen** und
**18 Laufzeitverträgen**.

Die Standardaufrufe aus Matchende-Prüfung und `ClientSpawn` verwenden nun die
tatsächlichen Ports. Verglichen sind Follow-Bereinigung, Kamera mit Ziel/Fallback,
echter Respawn, neue Clients während der Intermission, Duell-Siege/Niederlagen,
Verliererentfernung und Nachrücken, Scoreboards sowie Sitzungsspeicherung vor
`CON_CONNECTING`. Unterschiedliche `maxclients`-/Cvar-Limits, wiederholtes Begin/Exit,
Bereitschaft, Wartezeiten, Punktelimits und alle Sitzungs-Cvars sind eingeschlossen.
Die neue Integration ergänzt auch die zuvor fehlende `G_PickTarget`-Diagnose
bei vorhandenem Print-Host.

Der Einzelspieler-Postgame-/Podiumspfad ist als echter Standard implementiert,
mit 22 Verträgen geprüft und stimmt in fünf direkten Szenarien mit 1.343 Wörtern
gegen das unveränderte `g_arenas.c`. Bot-Interbreeding läuft standardmäßig über
den portierten Bot-Lifecycle-Kern. Die Engine
erhält `map_restart` beziehungsweise `vstr nextmap`, führt diese Befehle im Port
aber noch nicht als vollständigen Kartenwechsel aus. Spawn-Think-/Endframe bleiben
hier isolierte Overrides. Details: [INTERMISSION.md](INTERMISSION.md).

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.

## ClientCommand, Chat und Spielkommandos (Schritt 6)

`scripts/test_client_commands.py` besteht mit **221 Szenarien**, **687 Aktionen**, **42.518.499 exakt gleichen 32-Bit-Wörtern**, **1.333 geordneten Nebenwirkungen** und **203.944.229 Ausgabe-Bytes**.
**43 Laufzeitverträge** prüfen zusätzliche Speicher-/Schnittstellengrenzen.
Ein originaler Com_Error-Abbruch nach Startsolid beim Item-Give wird
einschließlich Diagnose, Freigabe und erreichtem Teilzustand verglichen.

Die aktuelle erweiterte Gesamtsuite besteht mit **61/61 Gates** einschließlich
aller **46 regulären Gates** und der zusätzlichen CD-Kartenvergleiche.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Fixture-Karte: `22631605b62b568cab3cec99ccfdf71a64ce9964f12b5e4256329ef30a769c3c`.

Alle 37 Funktionskörper aus g_cmds.c sind im nativen Vergleichshost
enthalten. Der neue Dispatcher verbindet die bisherigen Score-, Team-,
Follow- und Vote-Ports mit Textchat/Voice, Taunts, Cheats, Item-Give,
Suicide, Levelshot, Teamtask und Setviewpos. Argumente und Servermeldungen
werden bytegenau, Zustände vor und nach jeder Host-Zustellung verglichen.
Info-Mutation, Ortsfarben, native Formatdiagnosen, Userinfo-Speicherung
und Cheat-/Dedicated-Cvar-Spiegel sind integriert. Netzwerkzustellung,
Engine-Tokenizer/Command-Buffer, VM-Neuladen und weitere Spielsysteme
bleiben offen. Details und bewusste Grenzen: [CLIENT_COMMANDS.md](CLIENT_COMMANDS.md).

## Serververwaltung und Karteninitialisierung (Schritt 6)

| Bereich | Szenarien | Aktionen | Exakte Wörter | Geordnete Effekte |
| --- | ---: | ---: | ---: | ---: |
| [Spielarena und Spawn-Strings](GAME_MEMORY.md) | 53 | 1.566 | 125.480 | 412 |
| [Item- und Entity-Teaminitialisierung](GAME_INITIALIZATION.md) | 71 | 223 | 202.891 | 189 |
| [IP-Sperren und VM-Persistenz](IP_FILTERS.md) | 99 | 1.057 | 3.671.989 | 652 |
| [Serverkonsole und echte Teamwechsel](SERVER_COMMANDS.md) | 182 | 315 | 51.110.232 | 1.543 |

19 weitere Originalfunktionen sind portiert: sämtliche elf Funktionen aus
g_svcmds.c, drei Arena-Funktionen sowie fünf Funktionen für Item-Registrierung,
CTF-Initialisierung und Entity-Teams. G_NewString und der normale F_LSTRING-
Spawnpfad verwenden jetzt die echte MiniLang-Spielarena. Die Standardentscheidung
bei ClientConnect verwendet die portierten IP-Filter. forceteam führt tatsächliche
Team-, Todes-, Spawn- und Rangabläufe aus.

107 zusätzliche Laufzeitverträge prüfen definierte Schnittstellengrenzen.
Die Initialisierung normalisiert ausdrücklich 18 einzelne undefinierte CTF-Bytes;
die unveränderten nativen Rohbytes sind archiviert. Dafür wird keine exakte
Parität behauptet. Boterstellung und Botliste benötigen weiterhin ihre
ausdrücklichen Schnittstellen; Registry, Spawnqueue und Connect-Glue sind portiert,
und der Podium-Abbruch besitzt den echten Baseq3-
Standardpfad. [Modulstart/-shutdown](GAME_LIFECYCLE.md) ist
inzwischen verbunden; Engine-Kartenwechsel und VM-Neuladen, die vollständige Mover-Differentialabnahme,
Netzwerk, Darstellung und Bot-KI bleiben offen.

## Spielmodulstart, Shutdown und Protokollausgabe (Schritt 6)

| Bereich | Szenarien | Aktionen | Exakte Wörter | Geordnete Effekte |
| --- | ---: | ---: | ---: | ---: |
| [G_InitGame und G_ShutdownGame](GAME_LIFECYCLE.md) | 95 | 371 | 378.489.370 | 10.053 |
| [G_LogPrintf](GAME_LOGGING.md) | 106 | 783 | 12.779 | 1.359 |

Die Orchestrierung ruft die realen portierten Cvar-, IP-, Arena-, Session-,
Bodyqueue-, Spawn-, Item- und Teamfunktionen auf. Getrennte Level-/Entity-/
Clientresets, wiederholte Aufrufe im selben Modul, Logöffnung/-schluss,
Ressourcenregistrierung und die Bot-Schnittstellenreihenfolge werden gegen
unveränderte Originalkörper verglichen. 110 Lifecycle- und 13 Loggerverträge
prüfen zusätzlich Speicher-, Argument- und Hostgrenzen. Der Logger besitzt
4.148 ergänzende semantische Assertions; Konsole und Datei werden bytegenau
verglichen, einschließlich negativer Zeitstempel und rekursiver Callbacks.

Der integrierte Vergleich korrigierte die Startup-Versionsmeldung, die
schrittweise Ersetzung der acht Bodyqueue-Pointer und fehlende Spawn-Diagnosen.
Neun zusätzliche IP-Fälle sichern tatsächliche VM-Pufferkopien bei unverändertem
sichtbarem Text/Zähler ab. Drei zusätzliche Cvar-Fehlerfälle vergleichen den
bereits geänderten Zähler vor dem Abbruch bei 256 Bytes, während alte Werte und
Pufferinhalt erhalten bleiben; 1.615 Wörter, 24 semantische Assertions und neun
Mini-Verträge ergänzen die bisherigen Cvar-Nachweise.

Zehn einzelne undefinierte erste CTF-Statusbytes werden im Lifecyclevergleich
normalisiert und mit den nativen Rohbytes archiviert. Das ist kein Anspruch
auf Parität mit undefiniertem C-Speicher. Tatsächliches Engine-VM-Neuladen,
Kartenwechsel, Betriebssystem-Dateidienste, Bot-KI und die vollständige Mover-Abnahme
bleiben offen. Der Port ist weiterhin nicht spielbar.

## Weitere Karten-Targets und Portale (Schritt 6)

`scripts/test_map_objects.py` vergleicht **186 definierte Szenarien**, **2.699
Aktionen**, **647.091.128 exakte 32-Bit-Wörter** und **14.943 geordnete
Game-Delivery-Effekte**. 122 MiniLang-Verträge ergänzen diesen Vergleich.
Drei NULL-Formatierungsfälle mit 11.226.198 gleichen Wörtern sind getrennte
MSVC-CRT-Profilnachweise. Drei weitere Fälle archivieren native `va`-Überlappung
mit 11.962.468 Wörtern; sie zählen nicht als C-definierte Parität. Die Rohtexte
bleiben unverändert archiviert. 19 erste undefinierte CTF-Statusbytes werden
wie im Lifecycle-Host einzeln normalisiert und gesondert aufbewahrt.

Test-Binary: `7b533b848fa3047ebd278fec9647ae759744503d964087afd99c1f58897dd27f`.
Native x86-Oracle: `2cc10cbf9091f16d57da37d4d6bc08ab3275bfd224a7cd1a36d9af1abf133992`.
Kanonischer Bericht: `build/reference/map_objects/result.json`.

Die vier [Give-/Powerup-/Score-/Print-Targets](MAP_TARGETS.md) und die beiden
[Portal-Klassen](PORTALS.md) schließen die verbliebenen Nicht-Mover-Klassen.
Die zentrale Spawn-Auswahl enthält damit alle 48 Baseq3-Klassen und weiterhin
alle 35 Karten-Items. Die acht Mover-Klassen besitzen echte Spawn- und Framepfade.

Der neue Vergleich startet über das tatsächliche `G_InitGame` und führt die
unveränderten nativen Use-/Think-Körper aus. Item-Aufnahme, Flaggenrückgabe,
Punktevergabe, Teamfilter, Zufallszielsuche und Server-/Kollisionsverlinkung
laufen über die vorhandenen Originalports. Modellierter Zustand, konkrete
Callback-Identität, Meldungsbytes und geordnete Game-Delivery-Effekte werden
beobachtet. Die internen Trace-Payloads werden in den bestehenden Item-,
Combat- und Kollisionssuiten separat geprüft.

Die Portalregeln bewahren insbesondere den Link vor Flags und Entity-Typ,
fehlende und leere Targets, zwei getrennte Zufallsziehungen, Winkelverbrauch
im Fallback und die Double-Zwischenrechnung des Rollwinkels. `target_give`
löscht den Think-Termin und entfernt das Item aus der Serverweltverlinkung,
auch wenn die Aufnahme verweigert wurde. `target_remove_powerups` führt höchstens eine Flaggenrückgabe
mit Rot-vor-Blau-vor-Neutral-Vorrang aus und löscht danach sämtliche Powerups.
Die bisher fehlende NULL-Basisdiagnose von `Team_ReturnFlagSound` ist ergänzt.
Die CD-Spawn-Replays beobachten nun zusätzlich die Originaldiagnosen, darunter
Timer-/Multiple-Warnungen und fehlende Path-Corner-/Teleporter-/Laserziele;
entsprechende bisher stumme MiniLang-Pfade sind ergänzt. Bei identischen
Kartendaten und Eingaben bleiben 55 der 168 Spawnströme unverändert. 113
ändern sich durch 279 ersetzte Klassen-Aufrufgrenzen und 228 nun beobachtete
Diagnosen. Die Mover-Funktionen werden ebenfalls direkt durch das C-Orakel gebaut.
`scripts/test_mover_push.py` vergleicht fünf Schiebeszenarien mit der unveränderten
Originaldatei: linearen Erfolg, 90-Grad-Rotation mit Client-Yaw, blockierten
Rollback, `EF_MOVER_STOP` und den vollständigen Rollback eines zweiteiligen Teams.
Alle 545 verglichenen Zustandswörter stimmen exakt; 30 native Area-, Trace-, Link-
und Callback-Beobachtungen sind zusätzlich fest geprüft.

Verschachtelte `va`-Pufferüberlappung bei mehrfachem Teamempfang ist kein
ISO-C-definierter Vergleichsfall. Native Beobachtungen werden getrennt geführt;
MiniLang stellt den gespeicherten Text allen passenden Spielern zu.
Nicht darstellbare Roll-Casts und überlaufende Formatpuffer erhalten eigene
Verträge. `scripts/test_retail_movers.py` prüft zusätzlich die echten Entity-Lumps
von `q3ctf4`, `q3dm15` und `q3dm0`: Bobbing, drei Pendel, zwei rotierende Mover,
ein aktiviertes zweiteiliges Türteam und ein Button stimmen in 77.073.336 Wörtern
und 1.684 geordneten Effekten. q3ctf4 trägt zusätzlich einen gelinkten Spieler und
ein physikalisches Item über fünf vollständige Original-/MiniLang-Frames jeweils
664 Einheiten. Netzwerkzustellung und Portalansichten in Cgame/Renderer bleiben offen.

## Baseq3-Waffen (Schritt 6)

`scripts/test_weapons.py` besteht mit **235 Szenarien**,
**1.080 Aktionen**, **47.541.055 exakt gleichen 32-Bit-Wörtern**,
**589 Waffentraces**, **528 geordneten Nebenwirkungen**
und **226.841.083 Ausgabe-Bytes**. **14 Laufzeitverträge** prüfen
zusätzliche Schnittstellen- und Zustandsgrenzen. Der separate Protokollleser
bestätigt tatsächlich erreichte Treffer, Schaden, NoImpact-Flächen, Rail-Limit
und die einmalige Accuracy-Gutschrift bei direktem Raketen- plus Explosionsschaden.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Fixture weapons-0.bsp: `98064ce978246d76db75ff41849a23f2bb76dea5c5513da16a85eb60c7c16657`.
Fixture weapons-16.bsp: `075c0ae49b3ad2148fde3426f66bf869c3f0228085afe850006bb6c6074ab391`.

Alle 21 Baseq3-Funktionen aus g_weapon.c sind zugeordnet; 17 davon kommen
in diesem Abschnitt hinzu. Die Standardaufrufe aus ClientEvents und
ClientThink führen echte Schadens-/Todes- und Projektilpfade aus.
Die gemeinsame Zielbasis, Mündung, Quad-Faktor, Zufallsfolge, Schuss- und
Trefferzähler werden mit dem unveränderten C-Code verglichen.
Ein dabei gefundener Aliasfehler wurde korrigiert: Pmove erhält eine eigene
Usercmd-Kopie, sodass TALK die später gelesenen ursprünglichen Tasten
nicht verändert. Netzwerk, Darstellung, Modulneustart und Missionpack
bleiben offen. Details: [WEAPONS.md](WEAPONS.md).

## Vollständiger Spielserverframe (Schritt 6)

`scripts/test_full_frame.py` besteht mit **sechs Szenarien**, **3.231 exakt
gleichen 32-Bit-Wörtern** und **12.992 Ausgabe-Bytes**. Drei Laufzeitverträge
prüfen Pflichtgrenzen, Clientlimit und Restart-Frühabbruch.

Geprüft sind Framezähler und Zeit, Cvar-Aktualisierung, die vorhandene
Entity-Schleife, Client-Endframes, die echten Tournament- und Matchende-Prüfungen
und anschließend Teamstatus, globale und Team-Votes sowie Cvar-Nachverfolgung. Auch
die 1.024 Einträge von `g_listEntity` und dessen Cvar-Reset laufen in der
Originalreihenfolge. Globale und Team-Votes führen inzwischen ihre portierten
Regeln aus; aktive Vote-Framefolgen sind zusätzlich in `test_votes.py` geprüft.
Teamstatus und `CheckCvars` führen inzwischen ebenfalls ihre portierten Regeln
aus; aktive Overlay-/Passwortfolgen sind in `test_team_status.py` geprüft.
`G_UpdateCvars` nutzt standardmäßig die portierte Engine-Registry und wird
zusätzlich in `test_game_cvars.py` in Frames ohne aktive Entities verglichen.
Die älteren Gameplay-Suiten behalten einen expliziten Refresh-Override;
Mover-/sonstige Physics-Ausführung bleibt eine Callback-Grenze. Details:
[FULL_FRAME.md](FULL_FRAME.md).

## Tournament und Warmup (Schritt 6)

`scripts/test_tournament.py` besteht mit **zwölf Szenarien**, **115 exakt
gleichen 32-Bit-Wörtern** und **547 Ausgabe-Bytes**. Drei Laufzeitverträge prüfen
Spawn-Zustand, leere Warteschlange ohne Override und Clientlimit.

Der unveränderte C-Code und MiniLang stimmen für Zwei-Spieler-Tournament,
FFA-/Team-Bereitschaft, CTF-Teamvoraussetzungen, `g_warmup`-Änderungen,
Countdown, Configstring/Log und `map_restart` überein. Auch der ursprüngliche
32-Bit-Zeitüberlauf ist abgedeckt. Die isolierte Suite verwendet einen
Promotion-Override; standardmäßig läuft der separat verglichene echte
`AddTournamentPlayer`-Ablauf. Engine-Zustellung bleibt eine Host-Grenze. Details: [TOURNAMENT.md](TOURNAMENT.md).

## Abstimmungen und Teamleiter (Schritt 6)

`scripts/test_votes.py` besteht mit **211 Szenarien**, **241 Aktionen**,
**85.655 exakt gleichen 32-Bit-Wörtern**, **363.153 Ausgabe-Bytes** und **456
geordneten Nebenwirkungen**. Elf Laufzeitverträge ergänzen die Differenzprüfung.

Geprüft sind `CheckVote`, `CheckTeamVote`, `PrintTeam`, `SetLeader` und
`CheckTeamLeader`: Mehrheiten, Timeout, verzögerte globale und sofortige
Team-Befehle, Configstring-Löschung, alle Empfänger, Leiterwechsel und die beiden
originalen Suchschleifen der automatischen Leiterwahl. Die Tests vergleichen
Vote-Zeiten an Host-Aufrufen und sämtliche Vote-/Team-/Leiterdaten nach jeder
Aktion. Echte Framefolgen prüfen die Einbindung in `G_RunFrame`.

`scripts/test_vote_commands.py` ergänzt **337 Szenarien**, **428 Aktionen**,
**967.073 exakt gleiche 32-Bit-Wörter** und **1.149 geordnete Nebenwirkungen**.
Weitere **19 Laufzeitverträge** prüfen Pflichtschnittstellen, Speichergrenzen und
die Integration mit registrierten Engine-/VM-Cvars.

Die vier ursprünglichen globalen/Team-Befehlshandler werden einschließlich
Argumentkopien, Berechtigungsreihenfolge, Maprotation, Namenssuche, Anzeigen,
Zählern und Flags verglichen. Jeder Host-Aufruf und jede Aktion prüft den
Vote-Zustand, alle 64 Clients und sämtliche zwölf Vote-Configstrings.
Aufruf, Stimmabgabe, Auflösung und fällige Befehlsausführung laufen gemeinsam.
Die originalen Besonderheiten bei `msg[1]`, nicht erhöhten Aufrufzählern und
vorzeitig ausgeführten Alt-Votes bleiben erhalten. Das mögliche Überlaufen
von `strcat` bei Teamargumenten wird kontrolliert abgewiesen.

Die isolierten Vote-Suiten verwenden einen `ClientUserinfoChanged`-Override;
die reale Standardverbindung mit Spieler-Configstrings wird jetzt separat in
`test_client_info.py` geprüft. Der vollständige [ClientCommand-Dispatcher](CLIENT_COMMANDS.md)
samt Intermission-Verhalten ist inzwischen verbunden. Kommando-Tokenisierung und
Netzwerk-/Engine-Zustellung bleiben offen. Details: [VOTES.md](VOTES.md).

## Teamstandorte, Overlay und Passwortstatus (Schritt 6)

`scripts/test_team_status.py` besteht mit **80 Szenarien**, **618 Aktionen**,
**59.233 exakt gleichen 32-Bit-Wörtern**, **275.011 Ausgabe-Bytes** und **288
geordneten Nebenwirkungen**. Zwölf Laufzeitverträge ergänzen die Differenzprüfung.

Die unveränderten Funktionen `Team_GetLocation`, `SortClients`,
`TeamplayInfoMessage`, `CheckTeamStatus` und `CheckCvars` werden mit der echten
originalen PVS-/Areaportal-Prüfung verglichen. Enthalten sind Float-Distanzen
und Gleichstände, strikt mehr als 1.000 ms Aktualisierungsabstand, getrennte
Cvar-/Level-Clientlimits, 32er-Overlay und Slot-Reihenfolge, Empfängerfilter,
alle Standorte vor dem ersten Paket, Passwortzähler und Modulzustand über
Level-Resets. Aktive Framefolgen prüfen die Einbindung.

Der Engine-Cvar-Refresh ist inzwischen separat portiert; Netzwerkzustellung und Clientanzeige bleiben offen;
formatierte Ortsnamen über `Team_GetLocationMsg` sind inzwischen mit den
[Chat- und Tell-Befehlen](CLIENT_COMMANDS.md) portiert und geprüft.
Details und Zustandslebensdauer: [TEAM_STATUS.md](TEAM_STATUS.md).

## Engine- und Spiel-Cvars (Schritte 3 und 6)

`scripts/test_game_cvars.py` besteht mit **94 Szenarien**, **1.087 Aktionen**,
**961.431 exakt gleichen 32-Bit-Wörtern**, **4.196.674 Ausgabe-Bytes** und
**20.271 geordneten Nebenwirkungen**. 13 Laufzeitverträge und vier native
Fehlerfälle prüfen zusätzlich ungültige Handles, Speichergrenzen und
Modulinitialisierung.

Geprüft sind die originale Engine-Registry mit `Cvar_Register`/`Cvar_Update`,
sämtliche 46 Baseq3-Cvar-Zeilen und 43 VM-Kopien sowie `G_RegisterCvars` und
`G_UpdateCvars`. Enthalten sind Latching, Neu-Registrierung, exakte Meldungen,
Warnung und Rücksetzen bei ungültigem Spielmodus, Zählerüberlauf, erhaltene
Snapshots und die Zuordnung zu den portierten Gameplay-Feldern. Der
standardmäßige Registry-Pfad läuft außerdem in `G_RunFrame`-Vergleichen ohne
aktive Entities; der Native-Host begrenzt Match-/Vote-Pfade auf den inaktiven Zustand.

Der Baseq3-Körper von `G_RemapTeamShaders` ist leer. Modulstart/-shutdown ist
inzwischen separat integriert. `cvar_restart` sowie `toggle`, `set`, `sets`,
`setu`, `seta`, `reset`, `cvarlist` und der direkte Cvar-Befehl laufen über den
produktiven Engine-Commandpuffer. Elf exakte Originaldatensätze und 15 Verträge
prüfen dabei Ausgabe, Flags, Mehrwortwerte, Filter, Reset und Latch-Anzeige.
Missionpack, Engine-VM-Neuladen und weitere QVM-Trap-Zustellung bleiben offen.
Details und Build-Datumsprofil: [GAME_CVARS.md](GAME_CVARS.md).

## ClientThink (Schritt 6)

`scripts/test_client_think.py` besteht mit **27 Szenarien**, **7.357 exakt
gleichen 32-Bit-Wörtern**, **29.702 Ausgabe-Bytes** und **77 geordneten
Nebenwirkungen**. Drei Laufzeitverträge prüfen die fehlende Usercmd-Schnittstelle,
echtes Raketenfeuer ohne Waffen-Override und Kontakt-Deduplizierung.

Enthalten sind Befehlszeit-Klemmung und feste Zeitschritte, vollständiges Pmove
mit dynamischer Kollision, normale/Noclip-/tote Spieler, freie und folgende
Zuschauer, Inaktivität, Regeneration, Haste, Gesten, Gauntlet, Hook-Freigabe,
Snapshots, Trigger/Kontakte, Button-Latches, Fallschaden, Waffenereignis, Medkit
und Teleporter mit Flag-Drop. `ClientThink` und `G_RunClient` sind als äußere
Zeitplaner geprüft. Die Referenz führt alle neun unveränderten Funktionskörper
aus `g_active.c` aus. Details: [CLIENT_THINK.md](CLIENT_THINK.md).

## ClientEndFrame (Schritt 6)

`scripts/test_client_frame.py` besteht mit **17 Szenariogruppen und 272
Frame-Ausführungen**, **51.275 exakt gleichen 32-Bit-Wörtern**, **205.122
Ausgabe-Bytes** und **sechs geordneten Nebenwirkungen**. Zwei Laufzeitverträge
prüfen die unabhängige vollständige PlayerState-Kopie und den isolierten
`ClientBegin`-Aufruf. Dieser ist inzwischen mit dem portierten Eintrittspfad verbunden.

Enthalten sind Powerup-Ablauf, Schadensrichtung, 255er-Kappung, Pain-Debounce,
Godmode/Tod, Noclip, Ertrinken, Lava/Slime, Battlesuit, Loop-Sound,
Intermission, normale und extrapolierte EntityStates, vorhersagbare
Ereignis-Entities sowie direktes und teambezogenes Zuschauer-Follow. Eine
256-Fälle-Matrix variiert Schadensvektor, -summe, -rückstoß, Godmode und Debounce.
Die native Referenz führt die unveränderten Funktionskörper von
`ClientEndFrame`, `SpectatorClientEndFrame`, `P_WorldEffects`,
`P_DamageFeedback`, `G_SetClientSound` und
`SendPendingPredictableEvents` aus. Details:
[CLIENT_FRAMES.md](CLIENT_FRAMES.md).

## Items, Pickups und CTF-Flaggen (Schritt 6)

`scripts/test_items.py` besteht mit **20 Szenarien**, **307 Aktionen**,
**451.312 exakt gleichen 32-Bit-Wörtern** und **30.625 String-Bytes**. Zwölf
Laufzeitverträge ergänzen die gültigen Vergleichsfälle. Nach jeder Aktion werden
vollständige Entity-/Client-/Level-Zustände, Configstrings, Registrierungsbits,
Nachrichten und der Zufallszustand verglichen.

Übertragen sind `RegisterItem`, `G_SpawnItem`, `FinishSpawningItem`, `RespawnItem`,
`Use_Item`, `Touch_Item`, sämtliche Baseq3-`Pickup_*`-Funktionen, `LaunchItem`,
`Drop_Item`, der ET_ITEM-Zweig von `G_RunItem`, `G_BounceItem` sowie Flaggenstatus,
Basis-Reset, Take-/Return-/Capture-Sounds und die vollständigen CTF-Punkte- und
Assist-Effekte. Die Fälle umfassen alle 35 Baseq3-Items, Aufnahmegrenzen,
Powerup-Denial, Ereignisse, Targets, Respawn, Teamketten, Abprall und echte
Serverkollision. Die Todes-Suite verwendet dieselben Drop-/Flaggenpfade.

[`ClearRegisteredItems`, `SaveRegisteredItems` und `G_CheckTeamItems`](GAME_INITIALIZATION.md)
sind inzwischen separat geprüft. Die native Paritätsprüfung
nichtnulliger Item-Deaktivierungs-Cvars, tatsächliche `PrintMsg`-Netzwerkzustellung
und Missionpack bleiben offen. Details: [ITEMS.md](ITEMS.md).

## Nachrichten-Huffman (Schritt 7)

`test_huffman_message.py` prüft den adaptiven Grundcodec aus `huffman.c` und
den mit 1.053.340 Baseq3-Häufigkeitsreferenzen initialisierten
`MSG_WriteBits`-/`MSG_ReadBits`-Pfad. Acht direkte Datensätze vergleichen
vollständige Bitströme und Ergebnisse aus unveränderten C-Funktionskörpern;
83 Verträge ergänzen Baumzustand, alle gültigen Breiten, Vorzeichen, Cursor und
Überlauf. Skalare, Usercmd-, EntityState- und PlayerState-Deltacodecs sind
inzwischen separat direkt gegen `msg.c` geprüft.
Der byteorientierte `msg_t`-Pfad deckt nun außerdem `MSG_Copy`, exakte
Binary32-Werte einschließlich negativem Nullwert und NaN-Nutzbits, 8-/16-Bit-
Winkel sowie normale und 8.192-Byte-große Strings ab. Kopien besitzen einen
eigenen Zielpuffer und bewahren Cursor, Flags und die originale `maxsize`-
Semantik. 23 Datensätze aus unveränderten `msg.c`-Funktionskörpern und 37
MiniLang-Verträge prüfen die vollständigen Bytes, Grenzwerte und Lesecursor.
Details: [MESSAGE_IO.md](MESSAGE_IO.md).

## Entity-/PlayerState-Deltas (Schritt 7)

`message_state_delta.ml` bildet alle 51 Entity- und 48 Player-Netfields in
Originalreihenfolge ab. 108 direkte Orakeldatensätze vergleichen vollständige
Huffman-Paketbytes und die rekonstruierten Zustandswörter. Sie decken Skip,
Force, Remove, frühe und späte `lc`-Grenzen, Null-, integrale und vollständige
Floats, signierte Felder sowie alle vier Arraymasken ab. 28 MiniLang-Verträge
ergänzen Strukturgrenzen, Kopiersemantik und ungültige Feldzähler.

## Netchan-Sequenzen und Fragmentierung (Schritt 7)

`test_netchan.py` kompiliert fünf unveränderte Funktionskörper aus
`qcommon/net_chan.c` in einem isolierten Host und vergleicht sie mit
`qcommon/netchan.ml`. 29 Datensätze mit vollständigen hexadezimalen Paketbytes prüfen Setup, Client-/Serverheader, qport,
leere und kurze Nachrichten, 1300-Byte-Grenze, Null-Endfragment, Dropzählung,
Duplikate, Fragmentlücken, Retries, Sequenzwechsel während Teilmontagen und
vollständige Empfangsmontage. 29 MiniLang-Verträge ergänzen Dienst- und
Puffergrenzen sowie einen `message.ml`-Integrationstest. Der Zielpuffer wird
bewusst einschließlich des rekonstruierten Vier-Byte-Sequenzheaders geprüft;
damit schließt der Port einen Vier-Byte-Überlauf der Originalroutine. Der echte UDP-Versand bleibt im
Netchan als `sendPacketFn` injiziert. Der Client-Payloadcodec ist separat geprüft. Die
Client-Schicht aus `client/cl_net_chan.c` ist nun mit
allen fünf `CL_Netchan_*`-Funktionen portiert: neun direkte C-Orakeldatensätze
vergleichen vollständige Bytes und Zustände, 18 Verträge sichern Encode/Decode,
EOF, Fragmentweitergabe, Process und Größenfortschreibung. UDP und OOB bleiben
Hostgrenzen des Protokollmoduls. Details: [NETCHAN.md](NETCHAN.md).

`client/connectionless.ml` bildet Client-OOB und Resend aus `cl_main.c` ab.
17 direkte Datensätze führen `CL_CheckForResend`, `CL_DisconnectPacket` und
`CL_ConnectionlessPacket` unverändert aus; 27 Verträge prüfen Zustände,
Adressen, Timeouts, Callbacks und die vollständige Connect-Nutzlast. UDP-Empfang
und die Browserdatenhaltung bleiben eigene Grenzen. Details:
[CLIENT_CONNECTIONLESS.md](CLIENT_CONNECTIONLESS.md).

Die Serverschicht `server/netchan.ml` portiert alle fünf `SV_Netchan_*`-Pfade:
XOR-Encode/Decode, Process, `svc_EOF`, Fragmentfortsetzung und die unkodierte
FIFO mit sequenzabhängiger Kodierung beim Pop. Zwölf direkte Datensätze führen
die unveränderten Serverkörper gemeinsam mit den unveränderten Netchan-, MSG-
und Huffman-Körpern aus und vergleichen vollständige Paketbytes sowie Cursor-,
Sequenz-, Fragment- und Queuezustände. 26 Verträge prüfen zusätzlich beide
Process-Headerbreiten, Schlüsselsonderzeichen, Queuefehler und mehrstufigen
Fragmentdrain. Die interne Offset-null-Sicht hinter dem byteausgerichteten
4-/6-Byte-Header ist separat abgenommen und byteidentisch zum globalen C-Bitzeiger.

Die [Windows-UDP-Plattform](UDP_PLATFORM.md) implementiert den darunterliegenden
rohen Transport als kleine x64-DLL um Winsock 2.2 und als MiniLang-Wrapper.
Zwei nichtblockierende Localhost-Sockets übertragen in 13 Verträgen exakte
9- und 2.048-Byte-Payloads in beide Richtungen; Quelladresse, Quellport und
leere Receive-Queue werden ebenfalls geprüft. Noch offen ist die Live-Verkabelung
dieser Plattformaufrufe mit den `sendPacketFn`-Callbacks und dem Engine-Polling.

## Reproduzieren

Aus dem MiniQuake3-Verzeichnis, mit Python 3 und Visual Studio C++-Toolchain:

```powershell
python scripts/inventory.py
python scripts/assets.py D:/Quake3
python scripts/build_reference.py
python scripts/build_qvms.py
python scripts/reference_smoke.py D:/Quake3 --vm interpreter
python scripts/build_reference.py --observer
python scripts/reference_replay.py D:/Quake3
python scripts/build.py
python scripts/test_numeric.py
python scripts/test_math.py
python scripts/test_core.py
python scripts/test_vm.py
python scripts/test_retail_vm.py
python scripts/test_retail_vm.py --qvm-root build/reference/qvms
python scripts/test_archives.py --data-root D:/Quake3
python scripts/test_maps.py D:/Quake3
python scripts/test_rejections.py
python scripts/test_brush.py
python scripts/test_patches.py D:/Quake3
python scripts/test_collision.py D:/Quake3 --no-curves
python scripts/test_collision.py D:/Quake3
python scripts/test_movement.py D:/Quake3 --count 4096 --no-curves
python scripts/test_movement.py D:/Quake3 --count 4096
python scripts/test_pmove.py D:/Quake3 --count 4096 --no-curves
python scripts/test_pmove.py D:/Quake3 --count 4096
python scripts/test_runtime_trace.py D:/Quake3
python scripts/test_runtime_pmove.py D:/Quake3
python scripts/test_spatial.py D:/Quake3 --no-curves
python scripts/test_spatial.py D:/Quake3
python scripts/test_visibility.py D:/Quake3
python scripts/test_runtime_spatial.py D:/Quake3
python scripts/test_shared_game.py
python scripts/test_server_world.py D:/Quake3 --no-curves
python scripts/test_server_world.py D:/Quake3
python scripts/test_entitystate.py
python scripts/test_transitions.py D:/Quake3 --no-curves
python scripts/test_transitions.py D:/Quake3
python scripts/test_spawn_values.py
python scripts/test_game_memory.py
python scripts/test_initialization.py
python scripts/test_ip_filters.py
python scripts/test_server_commands.py
python scripts/test_targets.py
python scripts/test_combat.py --data-root D:/Quake3
python scripts/test_missiles.py --data-root D:/Quake3
python scripts/test_bodies.py --data-root D:/Quake3
python scripts/test_scores.py
python scripts/test_deaths.py
python scripts/test_items.py
python scripts/test_votes.py
python scripts/test_vote_commands.py
python scripts/test_team_status.py
python scripts/test_game_cvars.py
python scripts/test_full_frame.py
python scripts/test_spawn.py D:/Quake3
```

`inventory.py` aktualisiert bewusst den eingefrorenen Compilerstand. Für die
Wiederholung derselben Vergleichsbasis diesen ersten Befehl auslassen.
Tests und Builds nacheinander ausführen: Windows sperrt geladene native DLLs.
Vergleichsdaten und Logs liegen in `build/reference/` und `artifacts/reference/`.
Original-CD-Dateien werden ausschließlich gelesen; lokale Auszüge werden nicht eingecheckt.

Der Brush-Test isoliert den unveränderten Funktionskörper von
`CM_TraceThroughBrush` aus der Originaldatei in eine generierte C-Datei.
Seine Abhängigkeiten bleiben die Originalheader. Testfälle übergeben vorbereitete
Brush-Planes und Trace-Parameter; das ist keine vollständige `CM_BoxTrace`-Abnahme.
Die zusätzliche Kartenprüfung baut die vollständigen ursprünglichen Kollisionsdateien;
ihr Testhost stellt nur Speicher, Dateizugriff, Cvars und Diagnoseausgaben bereit.
Ein nicht verwendeter Debug-Callback bricht ab, falls er unerwartet aufgerufen wird.
Der abschließende CLI-Test prüft den gesamten Weg von `pak0.pk3` über den
MiniLang-Lader bis zur formatierten Trace-Ausgabe gegen zwölf ursprüngliche C-Felder.
Der dabei aufgezeichnete Binary-Hash bezeichnet den finalen Build; reine
Ausgabeformatänderungen können einen neueren Hash als der vorherige Kern-Testlauf haben.
### Server-Snapshot-Deltakette

`src/mq3/server/snapshot_build.ml` portiert `SV_AddEntToSnapshot`,
`SV_QsortEntityNumbers`, `SV_AddEntitiesVisibleFromPoint` und
`SV_BuildClientSnapshot`. Sechs Hostcallbacks grenzen Collision-Leafs, PVS,
Areabits und Area-Verbindungen ab. Fünf direkte Szenarien führen die vier
unveränderten Originalkörper aus und stimmen bei Entityfiltern, Broadcast,
Portalrekursion, Deduplizierung, Sortierung, Viewpoint, Areabit-Invertierung
und zirkulärer Ringablage überein. Hinzu kommen 26 MiniLang-Verträge.

`src/mq3/server/snapshot_runtime.ml` stellt die produktive Adaptergrenze zu
`collision.world`, `collision.visibility`, `server.world` und den Game-Level-
Entities her. 16 assetfreie Verträge prüfen Mapping, Synchronisierung, Wachstum,
Schrumpfen, Zählererhalt und Fehlergrenzen. Ein Retail-Lauf auf `q3dm0` verwendet
den Player-Spawn `(-984, -1056, 128)`, löst Leaf 2623, Cluster 1287 und Area 3
auf und kodiert die PVS-sichtbare Entity 64 plus Broadcast-Entity 65 als
sendefertiges 62-Byte-Paket. Der geprüfte BSP-Hash ist
`05e9540c598c9b1704c9853d61f2cd60c571735abcbf166609fcb4931fcde39b`.

`src/mq3/server/snapshot_delta.ml` portiert den sortierten Packet-Entity-Merge
aus `SV_EmitPacketEntities` einschließlich Baseline-Add, Remove, unverändertem
Skip, Entity-Delta, Ring-Wrap und Protokollterminator. Außerdem bildet das Modul
die unmittelbar anschließende Snapshot-Payload mit `svc_snapshot`, Serverzeit,
Lastframe, Flags, Areabits, Playerstate und Packetentities ab. Die Auswahl und
Speicherung der Clientframes sowie UDP-Scheduling bleiben Server-Hostgrenzen.

`test_snapshot_delta.py` extrahiert den unveränderten Originalkörper aus
`code/server/sv_snapshot.c` und vergleicht sechs vollständige komprimierte
Bytefolgen. Alle sechs Orakel-Datensätze und 26 MiniLang-Verträge sind grün.
`src/mq3/server/reliable_commands.ml` portiert außerdem
`SV_UpdateServerCommandsToClient`, die 64er-Ringadressierung und die zugehörige
Sequenz-/Acknowledgement-Semantik. Sieben komprimierte Streams aus dem
unveränderten Originalkörper stimmen vollständig überein; 19 MiniLang-Verträge
decken Resend, Acknowledge-Grenze, Einfügeüberlauf, Ring-Wrap und Hostfehler ab.
`src/mq3/server/snapshot_send.ml` führt den vollständigen Nachrichtenpfad vom
Client-Command-Acknowledgement bis zum Netchan-Callback aus. Die Deltaauswahl,
Rate-/Inactive-Flags, Padding, Downloadreihenfolge, `svc_EOF`, Frame-Metadaten
und Rate-/Snapshot-Terminierung liegen dabei in MiniLang. Sechs vollständige
komprimierte Nachrichten aus den unveränderten Funktionen
`SV_UpdateServerCommandsToClient`, `SV_WriteSnapshotToClient` und
`SV_EmitPacketEntities` stimmen bytegenau überein; 25 Verträge decken zusätzlich
Loopback/LAN, Rategrenzen, Inaktivität, Bot-Skip, Übertragungsgrenze und Fehler ab.
Der dabei aufgerufene Downloadcallback besitzt nun eine MiniLang-Implementierung
in `src/mq3/server/download.ml`. Zwölf direkte Datensätze aus unverändertem
`SV_WriteDownloadToClient`, `SV_NextDownload_f` und `SV_CloseDownload` stimmen
einschließlich komprimierter Paketbytes und Zustandsübergänge überein. 19
Verträge prüfen Achtblockfenster, 2.048-Byte-Blöcke, EOF, Acks, Timeout-Resend,
Rate- und Nachrichtenbudget sowie Ablehnungen.
`src/mq3/client/snapshot_parse.ml` ergänzt den Gegenpfad aus `CL_DeltaEntity`
und `CL_ParsePacketEntities`; 15 Verträge dekodieren darunter denselben
gemischten Original-Serverstream vollständig und prüfen Ring-, Baseline-,
Remove-, Tail-Copy-, Reihenfolge- und Trunkierungssemantik.

`src/mq3/client/snapshot_command.ml` bildet den davon getrennten äußeren
`CL_ParseSnapshot`-Zustandsübergang ab. `test_snapshot_command.py` extrahiert
`CL_DeltaEntity`, `CL_ParsePacketEntities` und `CL_ParseSnapshot` unverändert aus
`client/cl_parse.c`. Vier vollständige Übergänge prüfen Vollsnapshot, gültiges
Delta, ungültiges und dennoch vollständig konsumiertes Delta sowie die
Parse-Entity-Altersgrenze. Zehn Verträge ergänzen Header, 32-Byte-Areamask,
Clientframe-Ring, Lückenentwertung, Ping, Demo-Warteflag und Wertkopiersemantik.
`src/mq3/client/server_message.ml` portiert darüber `CL_ParseCommandString` und
`CL_ParseServerMessage`. Drei direkte Übergänge aus den unveränderten
Originalkörpern prüfen einen vollständigen Reliable-plus-Snapshot-Stream,
veraltete Acknowledgement-Reparatur, Duplikatunterdrückung, Ringmaskierung und
Gamestate-/Download-Dispatch. Zehn Verträge ergänzen `nop`, `EOF`, Trunkierung
und ungültige Opcodes. `src/mq3/client/download.ml` portiert zusätzlich
`CL_ParseDownload` mit Block-/Größenprüfung, Serverfehlertext, Dateiübergängen,
`stopdl`/`nextdl`, Zähler und EOF-Acknowledgement. Vier direkte unveränderte
C-Zustandsfolgen und 20 Verträge bestehen.
`src/mq3/client/gamestate.ml` ergänzt `CL_ParseGamestate`. Ein unveränderter
Original-C-Übergang und zwölf Verträge decken Configstring-Offsets und den
16000-Byte-Speicher, BigString, Baselines, Servercommand-Sequenz, `clientNum`,
`checksumFeed`, Reset und Abschlusscallbacks ab. `src/mq3/client/system_info.ml`
portiert die anschließende `CL_SystemInfoChanged`-Policy: Server-ID und Demo-
Schranke, Cheat-Reset, geladene und referenzierte Pure-Paks, geordnete Cvar-
Übernahme, case-insensitive `fs_game`-Erkennung/-Leerung und den über
`Cvar_VariableValue` gelesenen Pure-Zustand. Fünf Übergänge führen den
unveränderten Originalkörper samt unveränderten Info-Helfern aus; 22 Verträge
prüfen zusätzlich Fehler- und Gamestate-Bindungsgrenzen. Konkrete Cvar-/
Dateisystemdienste, Dateisystem-Neustart und Downloadinitialisierung bleiben Hostdienste.
`src/mq3/client/protocol_runtime.ml` installiert die konkreten Gamestate- und
Downloadhandler im Dispatcher und synchronisiert danach Baselines, Reliable-
Sequenz und Snapshotzustand. Zwölf Integrationsverträge führen Gamestate,
Downloadblock und Snapshot in einer Nachricht aus. Echte
Dateizugriffe und Live-Netzwerkzustellung bleiben Hostgrenzen.

`src/mq3/client/demo.ml` portiert das Protocol-68-Dateiframing von
`CL_WriteDemoMessage`, die Namensbildung von `CL_DemoFilename` und die
Wiedergabeübergänge von `CL_ReadDemoMessage`. Zwölf direkte Datensätze führen
diese drei Funktionskörper unverändert aus und vergleichen vollständige
Datensatzbytes, fünf Namensfälle sowie Erfolg, EOF und drei Trunkierungsgrenzen.
27 MiniLang-Verträge ergänzen Headerentfernung, verkettete Datensätze,
Größenablehnung, Sequenz-/Zeitstatus und den synthetischen Start-Gamestate. Die
historische Rückgabe `demo9999.tga` für ungültige Nummern ist dabei ausdrücklich
abgenommen. Dateisystemintegration und die laufende Demo-/Timedemo-Schleife sind
noch offen.

### Produktiver Client-Input

`src/mq3/client/input_command.ml` portiert den zusammenhängenden
`CL_CreateCmd`-Eingabekern aus `client/cl_input.c`: Zwei physische Quellen pro
Taste, zeitanteilige `CL_KeyState`-Werte, Lauf-/Gehgeschwindigkeit,
Tastaturwinkel, Mausfilter und -beschleunigung, die von
`CG_SETUSERCMDVALUE` gelieferte Sensitivität, Joystickachsen, kurz innerhalb
eines Frames gedrückte Buttons, Catcher-/Any-Key-Bits, die 90-Grad-Pitchgrenze
und die abschließenden Usercmd-Felder sind vorhanden. Die produktive
Retail-QVM-Vorschau erzeugt ihre Befehle über diesen Pfad statt über feste
WASD- und Mausformeln. Fünf Datensätze führen `CL_KeyState`, `CL_KeyMove`,
`CL_MouseMove` und `CL_JoystickMove` unverändert aus und vergleichen exakte
Floatbits und Befehlsfelder. Der Win32-UI-Thread schreibt Tastatur-,
Maustasten- und Mausbewegungsübergänge samt Hostzeit in einen threadsicheren
256er Ring mit der Überlaufregel von `Sys_QueEvent`; der QVM-Spielpfad legt sie
erst vor dem zeitlich passenden Simulationstick an `CL_KeyState` an. Fokusverlust
erzeugt Freigaben, Wiederholungen werden unterdrückt und der Menü-Catcher leert
den Spielzustand. 38 Verträge sowie native `/W4 /WX`-Lifecycle-, FIFO-,
Deduplizierungs- und Überlauftests ergänzen die C-Vergleiche.
Der native Retail-QVM-Lauf mit `D:/Quake3` besteht weiterhin mit 2.393
Dreiecken, 18 Texturen, 35 HUD-Quads und 125 Sounds. Der gemeinsame 64er
Usercmd-Ring bindet `CL_CreateNewCommands` jetzt an den Paketversand und an
`CG_GETCURRENTCMDNUMBER`/`CG_GETUSERCMD`; neun Datensätze führen die drei
Originalfunktionen unverändert aus und 11 Verträge prüfen Hitch-Clamp,
Ringumlauf, Altgrenze und Future-Fehler. Frei konfigurierbare Spielbindings
sind nun produktiv: Der native Pfad übersetzt Windows-Tasten in
Quake-Keynummern, liest denselben von `ui.qvm` änderbaren Binding-Zustand und
erweitert `+`/`-`- sowie Semikolon-Befehle mit Keynummer und Zeitstempel. Sechs
unveränderte `CL_KeyEvent`-/`CL_AddKeyUpCommands`-Datensätze und 14 Verträge
bestehen. `src/mq3/client/console_input.ml` ergänzt den vollständigen
256-Byte-Field-Editor mit Einfügen/Überschreiben, Cursor, horizontalem Scrollen,
Zwischenablage, 32er History, Console-Scrollsteuerung sowie `Console_Key`- und
`Message_Key`-Semantik für Befehle, Say/Team-Say und Tell. Der Zustand gehört
dem produktiven Local-QVM-Host und kann über dessen Key-/Char-Eingang bedient
werden. `src/mq3/client/key_bindings_config.ml` registriert `bind`, `unbind`,
`unbindall` und `bindlist` im echten Command-Registry, lädt cfg-Text durch den
Command-Buffer und serialisiert die 256 Bindings im originalen
`Key_WriteBindings`-Format für `config_persistence`. Sieben Datensätze führen
`Field_CharEvent`, `Field_KeyDownEvent` und `Key_WriteBindings` unverändert aus;
22 Integrationsverträge bestehen. Das reale 38-Byte-`q3config.cfg` unter
`D:/Quake3/baseq3` wird vom Retail-Probe vollständig eingelesen. Der produktive
Windows-Pfad erzeugt jetzt wie `win_wndproc.c` aus `WM_CHAR` ein separates,
bereits durch Tastaturlayout, Shift und Caps Lock aufgelöstes Zeichenereignis.
Physische Key- und Char-Ereignisse erreichen getrennt den hosteigenen Editor;
Gravis/Tilde schaltet den Console-Catcher hartkodiert um, Escape beendet Chat,
und `messagemode`/`messagemode2` sind echte Engine-Kommandos. Aktive Console-,
Say-, Team-Say- und Tell-Zeilen werden mit `gfx/2d/bigchars` aus `pak0.pk3`,
Scrollfenster und blinkendem Cursor über dem Retail-QVM-Bild dargestellt.
Sieben unveränderte C-Datensätze, 30 Editor-/Anzeigeverträge und der native
`/W4 /WX`-Queue-/Lifecycle-Test bestehen. Vollständiger Console-Transcript,
Notify-Zeilen und animiertes Herunterfahren der Console bleiben im separaten
`cl_console.c`-Umfang offen.

### OOB-Challenge und Direct Connect

`src/mq3/server/oob_connect.ml` portiert `SV_GetChallenge` und den Kern von
`SV_DirectConnect`: 1.024er Challenge-Ring, Wiederverwendung und ältester Slot,
LAN-/Authorize-Timeout, Protokoll 68, Challenge-/Ping-/Reconnect-Prüfung sowie
öffentliche, private und lokale Bot-Slotwahl. 13 direkte Datensätze führen beide
unveränderten Baseq3-Körper aus; 26 Verträge prüfen zusätzliche Ring-, Slot- und
Fehlergrenzen. `src/mq3/server/connectionless.ml` ergänzt den unveränderten
Dispatch von `SV_ConnectionlessPacket`: OOB-Markierung, tokenbasierte und
case-insensitive Befehlswahl, Connect-Dekompression ab Byte 12 sowie direkte
Anbindung von `getchallenge` und `connect` an den portierten OOB-Kern. Acht
exakte C-Dispatch-Datensätze und 18 Verträge decken `getstatus`, `getinfo`,
`getchallenge`, `connect`, `ipAuthorize`, `rcon`, `disconnect` und unbekannte
Befehle ab. UDP-Empfang, Status-/Info-Payloadaufbau, Rcon-Ausführung, externe
Autorisierung und Game-VM-Aufnahme sind explizite Hostdienste.

### Client packet event and live UDP transport

`src/mq3/client/packet_event.ml` portiert den sequenzierten Paketeingang aus
`CL_PacketEvent` mit Adressprüfung, Netchan-Process, Serversequenz sowie
Parse- und Demo-Reihenfolge. Neun direkte Datensätze aus dem unveränderten
C-Körper und 23 Verträge decken OOB, Runt, falsche Absender, abgelehnte
Sequenzen, erfolgreiche Pakete und Demo-Wait ab.

`src/mq3/qcommon/net_transport.ml` verbindet die Protokollschichten mit dem
geprüften Winsock-Wrapper. 15 echte UDP-Verträge prüfen Netchan-Callback,
Quelladresse, OOB-Marker, Text und den komprimierten Connect-Roundtrip.
`Huff_Compress` und `Huff_Decompress` stimmen im erweiterten unveränderten
C-Orakel bytegenau überein; das Huffman-Gate umfasst nun zehn Datensätze und
83 Verträge.

### Network runtime integration

`src/mq3/qcommon/network_pump.ml` leert beide nichtblockierenden UDP-Sockets
mit explizitem Framebudget und alternierender Priorität. 20 Verträge verwenden
echte Localhost-Sockets und prüfen FIFO, Fairness, leere Queues, Restbudget,
beide Richtungen und Binärdaten bis 2.048 Byte.

`src/mq3/server/packet_event.ml` portiert `SV_PacketEvent`: OOB-Routing,
Runt- und Adressprüfung, qport-Clientsuche, NAT-Portkorrektur, Netchan,
Zombie-Regel, Zeitstempel und ClientMessage-Callback. Zehn unveränderte
C-Datensätze und 28 Verträge sind grün. Der äußere Parser
`src/mq3/server/client_message.ml` ergänzt Server-ID-, Download- und
Acknowledgement-Policy, wiederholte ClientCommands, EOF sowie Move/NoDelta.
13 unveränderte C-Datensätze und 15 Verträge bestehen. Der anschließende
`SV_ExecuteClientCommand`-Dispatcher fängt alle acht Engine-Befehle ab und
leitet unbekannte Befehle nur bei aktivem Spielzustand und bestandener
Floodprüfung an die Game-VM weiter. Neun unveränderte C-Datensätze und 16
MiniLang-Verträge bestehen.

Der Reliable-Rumpf `SV_ClientCommand` behandelt Duplikate, Sequenzlücken,
Floodschutz und den für die Netchan-XOR-Kodierung maßgeblichen letzten Befehl.
Elf unveränderte C-Datensätze und 20 Verträge bestehen. Der produktive
`server.network_ingress`-Adapter führt UDP-Pump, PacketEvent, Netchan und
ClientMessage in 19 echten Localhost-End-to-End-Verträgen zusammen.

Der echte Localhost-Handshake besteht 20 weitere Verträge vom `getchallenge`
bis zum ersten serverseitig dekodierten Netchan-Paket. Dabei wurden quoted
Userinfo-Tokenisierung und das gültige OOB-Datagrammende ohne NUL gegen die
Originalsemantik korrigiert. `SV_UserMove` ergänzt keyed Usercmd-Decodierung,
Frame-Ack, Pure/CP-Gates, EnterWorld und ClientThink; zwölf unveränderte
C-Datensätze und 30 Verträge bestehen. 14 weitere Integrationsverträge
schließen ClientMessage, Reliable-Command, Dispatcher und UserMove über einen
gemeinsamen Clientzustand zusammen.

Der Client-Ingress verbindet den NetworkPump mit `CL_PacketEvent`,
Client-Netchan und `CL_ParseServerMessage`; 21 echte Localhost-Verträge prüfen
Reliable Commands, OOB, Demo-Grenze und beide Pumpseiten. Der Desktop-Framehost
ergänzt in 25 Verträgen Winsock-Lebenszyklus, Socket-Bindings, Pumpbudget,
gekappte Framezeit, Server-/Client-Reihenfolge, Rollback und Shutdown.
`SV_CalcPings` stimmt in vier unveränderten C-Datensätzen überein und besteht
16 MiniLang-Verträge. `SV_CheckTimeouts` ergänzt sechs unveränderte C-Fälle und
24 Verträge, `SV_CheckPaused` 23 und 22 sowie `SV_SendClientMessages` mit
`SV_RateMsec` drei und 19. Die äußere `SV_Frame`-Komposition stimmt in neun
unveränderten C-Datensätzen überein und besteht 28 Verträge, einschließlich
Kill/Restart, Residualzeit, Info-Config, Bot-/Game-Frames und Heartbeat.

`src/mq3/client/network_match_loop.ml` schließt den laufenden sequenzierten Pfad
in beiden Richtungen. Sieben echte Localhost-Winsock-Clientframes führen
Usercmds über `CL_SendCmd`, Netchan, Server-Ingress und `SV_UserMove`; der Server
antwortet mit Reliable Commands und Full-/Delta-Snapshots. Ein absichtlich
verlorenes Clientpaket wird durch `cl_packetdup 1` im Folgetelegramm
nachgeliefert, ohne dass ein später erneut eingespeistes Duplikat die Spieleingabe
zweimal ausführt. Nach einem verlorenen Server-Snapshot akzeptiert der Client den
nächsten Delta-Snapshot über die ältere, weiterhin gültige Basis; duplizierte
Snapshots verwirft er. `cl_nodelta` erzwingt anschließend die vollständige
Recovery. Neun Originalanker und 48 Live-Verträge prüfen Sequenzen,
Dropped-Zähler, Reliable-Ringe, Checksum-Key, OutPacket/Ping, Snapshot-Acks,
Command-Time und Rekonstruktionsbasen. Ein zweiter echter Client teilt denselben
Server-Ingress, behält jedoch eigene Socket-, QPort-, Netchan-, Reliable-, Usercmd-
und Snapshot-Zustände; beide Clients parsen die Entity des jeweils anderen.
Vor der Aktivierung absolvieren beide Sockets `getchallenge`,
`challengeResponse`, komprimiertes `connect` und `connectResponse`; Adresse,
Challenge, QPort und Server-Slot werden geprüft. Elf Originalanker plus 67
Live-Verträge prüfen den vollständigen Pfad. Ein anschließender 384-Frame-Lauf
liefert 768 Usercmds genau einmal aus, kompensiert 22 verlorene Clientpakete und
20 verlorene Snapshots, verwirft 16 Client- und 13 Snapshot-Duplikate und lässt
die Reliable-Ringe mit 77 Client- sowie 65 Serverbefehlen mehrfach umlaufen.
`network_match_loop` synchronisiert dabei die UDP-Verbindungszustände mit den
produktiven `CL_Frame`-/`SV_Frame`-Timeoutentscheidungen. Die Abnahme über das
öffentliche Internet bleibt offen.

### QVM-Renderfx und First-Person-Tiefenbereich

`src/mq3/renderer/qvm_scene_geometry.ml` bewahrt nun `refEntity_t.renderfx`
durch die produktive MD3-, Sprite-, Beam-, Rail- und Lightning-Expansion sowie
durch Portal-Clipping. `src/mq3/renderer/qvm_scene_batch.ml` trennt
`RF_DEPTHHACK`-Dreiecke in einen eigenen retained Material-Batch und zeichnet
ihn wie `RB_RenderDrawSurfList` mit dem Baseq3-Tiefenbereich 0..0.3; danach wird
der normale Weltbereich auch auf Fehlerpfaden wiederhergestellt. Damit nutzt
auch die unveränderte cgame-QVM für ihre First-Person-Waffen den vorgesehenen
Tiefenbereich. Neun Batch-Verträge prüfen Trennung, Geometrieerhalt und einen
Renderfx-Wechsel im Refresh-Pfad; 22 Portal-Verträge prüfen zusätzlich den
Metadatenerhalt beim Clipping. Der Batch-Benchmark mit 1.728 Dreiecken und 20
Refresh-Frames bleibt grün. `RF_SHADOW_PLANE` erzeugt jetzt zusätzlich für
animierte QVM-MD3-Flächen die Projektion aus `RB_ProjectionShadowDeform`. Die
Deformation läuft wie im Original zuerst im Entity-Koordinatensystem:
Weltlicht, Modellachsen, `shadowPlane` und die 0,5-Untergrenze für flache
Lichtrichtungen bleiben daher auch bei rotierten und nicht normalisierten
Achsen konsistent. Erst danach werden die Vertices in Weltkoordinaten
überführt. Die Materialauflösung setzt außerdem die `R_AddMD3Surfaces`-
Bedingung `shader->sort == SS_OPAQUE` durch; abgelehnte Schatten gelangen nicht
als untexturierte Fallback-Geometrie in den produktiven Batch. Ein zweiseitiges,
transparent-schwarzes Decal mit Polygon-Offset verhindert Z-Fighting. Fünf
Läufe des unveränderten `RB_ProjectionShadowDeform`, 48 Geometrie-, 22
Material- und 19 Batch-Verträge prüfen Achsentransformation, Clamp,
Opaque-Filter, produktive Draw-Surface sowie Blend-, Sortier- und
Offsetzustand. Retail-Proben laden das vollständige Sarge-Unterkörper-MD3 (191
Frames, 363 Vertices, 336 Dreiecke) und führen 20 Renderer-Trapklassen über
`D:/Quake3/baseq3/pak0.pk3` aus.

Für `cg_shadows 2` expandiert derselbe produktive MD3-Pfad jetzt die gerichteten
Kanten aus `R_AddEdgeDef` und verwirft mit `R_RenderShadowEdges` jede Kante, die
eine umgekehrte lichtzugewandte Partnerkante besitzt. Die verbleibenden
Silhouettenseiten werden entlang der entity-lokalen Lichtrichtung exakt 512
Einheiten extrudiert und erst danach in Weltkoordinaten überführt. Wie
`R_AddMD3Surfaces` schließen `RF_NOSHADOW`, `RF_DEPTHHACK`, Fog und nicht
deckende Shader den Stencil-Pass aus. Der native Software-Rasterizer hält einen
eigenen Stencil-Puffer, zählt sichtbare Vorder- und Rückseiten in zwei
tiefengeprüften Durchläufen, vertauscht die Culling-Reihenfolge in
Spiegelportalen, sättigt die Werte wie `GL_INCR`/`GL_DECR` im Bereich 0..255
und multipliziert anschließend jeden Pixel mit ungleich null genau einmal mit
0,6 wie `RB_ShadowFinish`. Drei Datensätze aus den
unveränderten Funktionen `R_AddEdgeDef`, `R_RenderShadowEdges` und
`RB_ShadowTessEnd`/`RB_ShadowFinish`, 48 Geometrie-, 19 Batch- sowie die nativen `/W4 /WX`-
Rasterverträge prüfen Silhouettenreihenfolge, Extrusion, Renderfx-Filter,
Opaque-/Fog-Policy, normale und gespiegelte Passrichtung und Finish-Farbe.
Die Retail-Probe expandiert `models/players/sarge/lower.md3` mit 336 Dreiecken
aus `D:/Quake3/baseq3/pak0.pk3` zu 208 echten Silhouettenseiten und bestätigt
die 512-Einheiten-Extrusion ohne Platzhaltergeometrie.

`R_ComputeFogNum` aus `tr_mesh.c` ist jetzt ebenfalls im produktiven MD3-Pfad
verdrahtet. Wie im Original prüft der Port die Kugel des ausgewählten,
normalisierten Animationsframes um `origin + localOrigin` in Reihenfolge gegen
die BSP-Fog-AABBs, überspringt Slot null, behandelt eine reine Berührung mit
`>= max` beziehungsweise `<= min` als außerhalb und liefert für
`RDF_NOWORLDMODEL` immer null. Haupt- und Portalansicht reichen den ermittelten
Fogindex bis in den vorhandenen Fog-Batch weiter. Fogged MD3s erzeugen gemäß
`R_AddMD3Surfaces` weder Projektions- noch Stencil-Schatten; die vorab
berechneten Geometrie- und Schattenkapazitäten folgen derselben Entscheidung.
Sechs Läufe der unveränderten C-Funktion, 51 Geometrieverträge und ein
Retail-Test mit `maps/q3ctf1.bsp` plus `models/players/sarge/lower.md3`
bestätigen 336 gefoggte Originaldreiecke ohne Schatten gegenüber 672 klaren
Original-/Projektionsdreiecken und 416 Stencil-Seitendreiecken.

Die übrige produktive Entscheidung aus `R_CullModel` und
`R_AddMD3Surfaces` ist nun ebenfalls angebunden. Die Modellregistrierung lädt
zusammenhängende `_1.md3`- und `_2.md3`-Geschwister, und Haupt- sowie
Portalansicht wählen daraus mit `ProjectRadius`, `r_lodscale` und
`r_lodbias` denselben LOD wie Baseq3. Der Cull-Pfad verwendet bei normalisierten
Achsen zuerst die Kugeln des aktuellen und alten Frames; widersprechen sie sich
oder schneiden sie den Frustum, entscheidet die vereinigte lokale Frame-Box.
Nicht normalisierte Achsen überspringen wie im Original die Kugelabkürzung.
Vollständig verworfene Modelle reservieren und erzeugen keine Geometrie. Die
Surface-Auswahl nutzt `skinNum % numShaders`, trennt `cg_shadows 2` (Stencil)
von `cg_shadows 3` (Projektion) und hält den Transform-Cache zwischen den LODs
getrennt. Sechs Ergebnisse aus der unveränderten C-Funktion stimmen exakt; 55
Geometrieverträge prüfen LOD, Frustum-Cull und Surface-Shader. Die Retail-Probe
lädt `maps/q3ctf1.bsp` sowie Sarges drei echte Unterkörper-LODs und bestätigt
336, 202 beziehungsweise 126 Dreiecke sowie null Dreiecke hinter dem
Betrachter.

### QVM-Inline-Brushmodelle

`R_LoadSubmodels`/`R_AddBrushModelSurfaces` besitzen nun einen produktiven
MiniLang-Pfad. Die Cgame-Registrierung von `*N` extrahiert exakt den im
BSP-`dmodel_t` angegebenen Bereich aus `firstSurface` und `numSurfaces` statt
nur einen String-Platzhalter abzulegen. Planare Flächen, Triangle-Soups und
Patches behalten Shadernamen, Vertexfarben, Basis- und Lightmap-UVs,
Lightmapindex sowie Fogindex. Beim QVM-Frame werden sie mit Origin und Achsen
der `refEntity_t` in Weltkoordinaten überführt und durch denselben
Mehrstufen-Materialbatch wie MD3-Entities gezeichnet. Der vorhandene
q3dm12-Beleg umfasst 63 Inline-Modelle, 200 Flächen und 425 vollständig
lightmapped Dreiecke. Ihr BSP-Fogindex speist jetzt außerdem im Haupt- und
Portalblick denselben abschließenden Nebel-Overlay und die stufenabhängige
Nebelabschwächung wie die statische Welt; der Retained-Refresh baut die
Nebelkoordinaten nach jeder Bewegung aus den aktuellen Weltpositionen neu auf.
`R_SetupFrustum` erzeugt aus `fov_x`, `fov_y`, Ursprung und Viewachsen die vier
originalen Seitenebenen. `R_AddBrushModelSurfaces` prüft die aus dem BSP-Modell
bewahrten Bounds mit `R_CullLocalBox` bereits vor der Transformation und lässt
vollständig außerhalb liegende Brushmodelle sowohl im Haupt- als auch im
Portalblick aus. Dadurch erreichen unsichtbare Türen und Plattformen weder
Geometrieexpansion noch Materialbatch. Der produktive QVM-Pfad übernimmt zudem
die BSP-`SURF_NODLIGHT`/`SURF_SKY`-Entscheidung und hängt nur deckende
Brushflächen an den vorhandenen `ProjectDlightTexture`-Pass. Bewegte Flächen
aktualisieren dabei ihre Projektionsgeometrie, Entity-Origin und Achsen pro Frame.
Wie `R_TransformDlights` wird jedes Weltlicht vor der S/T-Projektion und
Z-Abschwächung in das lokale Koordinatensystem auch gedrehter Brushmodelle
transformiert; die gezeichneten Vertices bleiben in Weltkoordinaten. MD3-Modelle
verbleiben auf ihrem eigenen Lightgrid-/Entity-Lichtpfad. Vor der Projektion
bildet der Port außerdem die drei achsenweisen Vergleiche von `R_DlightBmodel`
gegen die um den Lichtradius erweiterten lokalen Modellgrenzen nach. Dadurch
erreichen entfernte Lichter die Brushflächen nicht. Zwei unveränderte
C-Datensätze aus `R_TransformDlights`/`R_DlightBmodel`, 13 direkte
Dynamic-Light-Verträge, 63 BSP-, 42 Geometrie-, 15 Batch-,
15 unveränderte C-View-Math-Datensätze, 39 View-Math- und 23
Portalverträge prüfen zusätzlich Parsing, Transformation, Retained-Refresh und
Clipping der neuen Metadaten sowie sichtbare und rückwärtige Bounds.

### BSP-Lichtflares

`MST_FLARE`-Flächen werden jetzt wie `ParseFlare` aus Shader-/Fogindex,
`lightmapOrigin`, `lightmapVecs[0]` als Farbe und `lightmapVecs[2]` als Normale
in einen eigenen Katalog übernommen. Nach Welt und Cgame-Geometrie liest der
produktive Win32-Rasterizer die tatsächliche Augenraumtiefe am Flare-Mittelpunkt,
wendet die strikte 24-Einheiten-Sichtbarkeit aus `RB_TestFlare` an und führt den
zustandsbehafteten linearen `r_flareFade`-Übergang getrennt für Haupt- und
Portalansichten. Sichtbare Flares verwenden Baseq3s
`viewportWidth * (r_flareSize/640 + 8/-eyeZ)`-Größe, Normalenausrichtung,
additives Blending und das echte `flareShader`-Bild aus dem Retail-PK3. Fehlt
dieses Bild, wird kein Ersatz gezeichnet. Der archivierte `r_flares`-Cvar behält
den Originalstandard `0`; der Pass wird erst bei gesetztem Cvar aktiv. Wie
`RB_RenderFlare` reicht der Port den behaltenen Fogindex an den additiven
Flare-Shaderpfad weiter: die Baseq3-Fogdichte moduliert dabei RGB, während Alpha
unverändert bleibt. `RB_AddDlightFlares` läuft nun ebenfalls im produktiven
Cgame-Pfad: jedes Szenenlicht wird anhand der ersten einschließenden axialen
BSP-Foggrenzen oder Fog null eingeordnet und verwendet ohne
Oberflächen-Normalenfaktor denselben Tiefentest, Fadezustand und Flare-Shader.
Haupt- und Portalansichten halten dafür getrennte Zustände, sodass Waffen-,
Projektil- und sonstige Cgame-Lichter nicht zwischen Ansichten flackern. 22
Verträge prüfen Parsing, Fogoffset, Tieftoleranz, Ein-/Ausblenden, Größe,
Normalenfaktor, Fogmodulation, inklusive Foggrenzen, unabhängige dynamische
Ansichtszustände und das Verwerfen nicht erneut eingereichter Lichtslots. Der native `/W4 /WX`-Lifecycle-Test prüft zusätzlich gelöschte,
gesetzte und außerhalb liegende Depth-Samples. Ein explizit mit `r_flares 1`
abgenommener sichtbarer Retail-Lauf bleibt offen.

### Adaptive BSP-Patchgitter

Der produktive Weltpfad verwendet für `MST_PATCH` jetzt den Kern von
`R_SubdividePatchToGrid`: den senkrechten Abstand des Bézier-Mittelpunkts von
der Endpunktsehne, wiederholte de-Casteljau-Halbierung derselben Spanne, die
originale 65-Punkte-Grenze je Achse, den transponierten zweiten Achsendurchlauf,
`PutPointsOnCurve`, ganzzahlige Byte-Farbmittelung und das Entfernen kollinearer
Kontrollzeilen und -spalten. `MakeMeshNormals` rekonstruiert anschließend jede
Patchnormale aus bis zu acht Richtungen, sucht bis zu drei Punkte weit durch
degenerierte Nachbarn und verbindet geschlossene Patchränder wie das Original.
Die Auswahl sichtbarer Weltflächen berechnet ihr
Dreiecksbudget aus demselben adaptiven Gitter und kann deshalb keine anders
tessellierte Schätzung mehr verwenden. 63 BSP-Verträge prüfen unter anderem
das 5x5-Gitter einer stark gekrümmten Fläche, den groben 3x3-Fall, die Reduktion
einer ebenen 3x3-Fläche auf zwei Dreiecke und die Zwischenwerte. Der bewahrte
`q3dm1`-Probe verarbeitet 2.097 Flächen, davon 113 Patches, zu 17.723
Dreiecken. 75 auf sechs Dezimalstellen verglichene Datensätze aus der
unveränderten C-Funktion prüfen zusätzlich ein gekrümmtes und ein geschlossenes
5x5-Normalenfeld sowie eines mit degenerierten Nachbarn.
LOD-Fehlertabellen und das Stitching benachbarter LOD-Gruppen, die
Tristrip-Ausrichtungsoptimierung sowie `R_GridInsertRow/Column` bleiben offen.

### QVM-Modelllicht ohne Weltmodell

`playable_light_grid.noWorldEntitySample` bildet nun den Fallback aus
`R_SetupEntityLighting` für `RDF_NOWORLDMODEL` nach: bei der im Softwarepfad
verwendeten `identityLight` 1.0 sind dies 150 Einheiten Umgebungs- und
gerichtetes Licht, der im Original bedingungslos aktive 32er Mindestlichtanteil
und die normalisierte Standard-Sonnenrichtung `(0.45, 0.3, 0.9)`. Aktive
dynamische Lichter werden wie im C-Pfad anschließend aufaddiert. Die produktive
QVM-Geometrie wählt diesen Pfad für Menü- und modellfreie Refdefs. Der produktive
Lightmap- und Light-Grid-Decoder verwendet außerdem die unveränderte
`R_ColorShiftLightingBytes`-Rechnung: ohne Hardware-Gammaramp wird Baseq3s
Standarddifferenz `r_mapOverBrightBits(2) - tr.overbrightBits(0)` angewandt und
helle RGB-Werte werden proportional normalisiert statt weiß abgeschnitten. Sieben
unveränderte C-Datensätze, 63 BSP-, 23 Light-Grid- und 42 QVM-Geometrieverträge
prüfen Konstanten, Bytewerte, Richtung, dynamisches Licht und die tatsächlichen
MD3-Vertexfarben. Map-spezifische `q3map_sun`-Richtungen und die Laufzeitbindung
frei konfigurierbarer Overbright-Cvars bleiben als Teil der vollständigen
Renderer-Parität offen.

Der vollständige alte Baseq3-Scoreboardpfad aus `cg_scoreboard.c` liegt nun als
nativer MiniLang-Dateiport vor: Clientzeilen, Teamfilter/-reihenfolge,
Normal-/Interleave-Layout, lokales Highlight, Ready-Markierung, Fade-/Pause-/Warmup-
Regeln, verzögertes Player-Laden sowie das große Tournament-Scoreboard. Der
spielbare Intermission-Pfad verwendet diese Layoutquelle produktiv. Drei Aufrufe
der unveränderten C-Zentrierungsfunktion, 21 Zustands-/Layoutverträge und die
vier Retail-Headergrafiken aus `pak0.pk3` bilden die Abnahme.

Auch `cg_info.c` ist vollständig als nativer Dateiport erfasst. Spieler- und
Item-Iconlimits, Fallback-Pfade, bereinigte Ansagenamen, Einzelspieler-Ansagen,
Levelshot-Fallback, Detail-Layer und alle Server-/Map-/Cheat-/Gametype-/Limitzeilen
folgen der Originalreihenfolge. Der produktive Windows-Ladevorgang führt seine
13 Phasen nun durch denselben `CG_LoadingString`-Zustand. 16 Aufrufe des
unveränderten C-Iconlayouts, 24 Zustandsverträge und drei echte Retail-Assets
prüfen den Port.

`cg_snapshot.c` ist als vollständige native Snapshot-Zustandsmaschine vorhanden.
Sie spiegelt Initialsnapshot, Entity-Reset/-Transition, Current-/Next-State,
Interpolation, Teleport-/Follow-/Servercount-Wechsel, Reliable-Command-Reihenfolge,
verlorene Snapshots, inaktive Frames und Zeitklemmen. Der produktive Matchhost
füttert sie an derselben Snapshotgrenze wie die Retail-Cgame. Vier Aufrufe der
unveränderten C-Entityfunktionen und 18 Zustandsverträge bestehen.

An dieser Grenze laufen jetzt auch die vollständigen nativen Dateipfade für
`cg_event.c`, `cg_playerstate.c` und `cg_predict.c`. Der Eventpfad decodiert die
gesamte Baseq3-Ereignistabelle, Eventbits und Event-only-Entities; 16
unveränderte C-Datensätze und 105 Verträge prüfen Audio-, Render-, HUD-,
Treffer-, Todes- und Powerup-Grenzen. Der Playerstate-Zustandsautomat deckt
Ammo-Warnungen, Damage-Feedback, Respawn, korrigierte vorhergesagte Events,
Reward-Stack und lokale Ansagen in sieben C-Datensätzen plus 23 Verträgen ab.
Der schreibgeschützte Prediction-Beobachter klassifiziert Solids und Trigger,
mischt Entity-Kollisionen, interpoliert Snapshots und spielt Usercmds durch den
geteilten Pmove-/Collision-Pfad; sechs C-Datensätze und elf Verträge bestehen.
Bei aktiver Retail-Cgame protokollieren Event- und Playerstate-Pfade ihre
Grenzaktionen, führen sie aber nicht nochmals aus. Der Retail-Lauf meldet neun
native Prediction-Traces ohne doppelte QVM-Effekte.

Das Retail-QVM-Gate mit `D:/Quake3` besteht über acht Frames: 13 Snapshot-
Entities durchlaufen den produktiven Matchpfad; zugleich bleiben 2.345
texturierte Welt-/Modell-Dreiecke, 19 Scene-Entities, 26 Sounds sowie Cgame- und
UI-2D-Ausgabe aktiv.

`tr_marks.c` ist jetzt als vollständiger nativer Dateipfad erfasst. Die
MiniLang-Implementierung übernimmt BSP-Bounds-Traversierung, Face-/Grid-Filter,
Polygon-Clipping, Fragmentgrenzen und die produktive `CG_R_MARKFRAGMENTS`-
Trap-Anbindung. Fünf Datensätze vergleichen Punktreihenfolge, Offsets und
Float-Bitmuster direkt mit den unveränderten C-Funktionen; 17 Verträge und eine
Retail-Projektion auf `q3dm1` prüfen den vollständigen Weltgeometriepfad.

### Team-Arena-Spieler, Bot-Voicecommands, Serveroperator und DirectSound

Vier weitere zuvor unbegonnene Originaldateien sind vollständig nativ
zugeordnet. `code/ui/ui_players.c` bildet getrennte Body-/Head-Modelle,
Team-Skins, die originale Head-Dateisuche, 31-Slot-Team-Arena-Animationen,
Lerp, Winkel, Tags, Waffen und Renderaktionen ab. Die vorhandenen Baseq3-
Retaildaten enthalten nur das ältere 25-Slot-Animationsformat; der Probe weist
die originale Ablehnung dieses Formats im Team-Arena-Pfad nach. Eine visuelle
Team-Arena-Abnahme benötigt weiterhin legale `missionpack`-Daten.

`code/game/ai_vcmd.c` deckt alle 16 Sprachbefehle, Zielkopien, Zeitfolge,
Leader- und Teamtask-Zustände für Baseq3 und Missionpack ab. `code/server/sv_ccmds.c`
enthält Kartenwechsel und -restart, Kick/Ban, Status- und Infoausgabe,
Konsolenchat, Heartbeat und Shutdown einschließlich des upstream absichtlich
wirkungslosen Remove-Pfads. `code/win32/win_snd.c` portiert DirectSound-8-/
Legacy-Auswahl, Hardware-/Softwarepuffer, Ringcursor, Lock/Restore/Retry,
Submit, Aktivierung und vollständiges Shutdown. Die Hostaktionen sind bei
aktiver Retail-QVM unterdrückbar, damit Ton und Servereffekte nicht doppelt
ausgegeben werden.

Die vier Fokustests bestehen mit 46 Datensätzen aus unverändertem C, 91
MiniLang-Verträgen und 23 Retail-Probes beziehungsweise kompilierten Retail-IDs.
Das erzeugte Inventar zählt nun 94 portierte, 114 partielle und 127 noch nicht
begonnene Runtime-/Plattformdateien. Der frisch gebaute Hauptstand mit SHA-256
`6203ea60375f534ec4172c8dca77926e8fb2ce4d6d5f5ee862f1e939f65cdf45`
und das Retail-QVM-Match über acht Frames bestehen; ein neuer vollständiger Lauf
aller Gates ist noch nicht als Gesamtnachweis dokumentiert.

### Gemeinsame UI, Missionpack-Hauptmenü, Botbefehle und Plattform-Debug

Fünf weitere zuvor unbegonnene Originaldateien sind vollständig als native
MiniLang-Dateipfade zugeordnet. `code/ui/ui_shared.c` umfasst Stringpool und
Parser, den vollständigen Display-/Menu-/Item-Lebenszyklus, Skripte und
Cvar-Gates, Bindings und Fokus, Capture, Listbox, Slider, Edit, Multi und
Yes/No sowie Ownerdraw, Feeder, Text, Modell, Bild, Transition, Orbit und
Cache/Paint. `code/ui/ui_main.c` umfasst Lifecycle und `vmMain`, Asset- und
Menüladen, Ownerdraw und Tastaturbehandlung, Arena-/Botparser, Serverbrowser,
Serverstatus, Spielersuche, Feeder, Skirmish-/Serverstart, alle 49
`UI_RunMenuScript`-Kommandos sowie Cinematic-, Connect- und Downloadzustände.
Die Hostgrenzen sind typisiert und bei aktiver Retail-QVM unterdrückbar.

`code/game/ai_cmd.c` deckt alle Match-Kontexte und Variablen, Adressaten-,
Client- und Gegnerauflösung, Zeitangaben, Patrouillen, Checkpoints, Formation,
Führung und Präferenzen sowie die LTG-Zuweisungen für CTF, One-Flag CTF,
Obelisk und Harvester ab. `code/botlib/be_aas_debug.c` portiert die Debuglinien-
und Polygonpools, Pfeile, Ebenenkreuze und Bounding-Boxen, Face-/Area-Polygone,
erreichbare Areas, Reachability-Darstellung und Cluster-Flood. Der Port von
`code/win32/win_syscon.c` enthält Erzeugung, Anzeige und Zerstörung der
Windows-Konsole, Eingabepuffer, Farbcodes und Zeilenumbrüche, Rollover,
Fehlerdialog sowie Aktivierungs-, Close-, Copy-, Clear- und Timersemantik.

Die fünf Fokustests bestehen mit allen 487 Originalsymbolen, 55 Datensätzen
beziehungsweise Funktionen aus unverändertem C und 139 nativen Verträgen. Die
Retail-Probes prüfen 3.539 echte UI-Assets, 138 Matchvorlagen sowie 30 AAS-
Dateien mit zusammen 559.999 Faces, 96.758 Areas und 125.731 Reachabilities.
Baseq3 enthält keine Team-Arena-`.menu`-Definitionen oder `missionpack.pk3`;
deren grafische Endabnahme bleibt deshalb weiterhin offen, während Parser- und
Zustandssemantik durch die C- und nativen Verträge abgedeckt ist. Das erzeugte
Inventar zählt nun 99 portierte, 114 partielle und 122 noch nicht begonnene
Runtime-/Plattformdateien.

Die fünf neuen Fokustests, der Hauptbuild mit SHA-256
`6203ea60375f534ec4172c8dca77926e8fb2ce4d6d5f5ee862f1e939f65cdf45`
und das Retail-QVM-Match über acht Frames bestehen. Der Retail-Lauf verarbeitet
13 Snapshot-Entities, 2.345 texturierte Dreiecke, 19 Scene-Entities und 26
Sounds. Ein neuer vollständiger Lauf aller Gates wurde für dieses Paket nicht
nochmals als einzelne Gesamtausführung gestartet.

### Vollständiger Bot-, AAS-, Gameplay-Chat- und Rankingblock

Der Abgleich vom 22. Oktober 2026 hebt 15 weitere Originaldateien auf den
Status `ported`: `be_aas_cluster.c`, `ai_chat.c`, `sv_rankings.c`,
`g_rankings.c`, `bg_lib.c`, `ai_dmq3.c`, `ai_team.c`, `ai_main.c`,
`be_ai_chat.c`, `be_ai_move.c`, `be_aas_reach.c`, `be_ai_goal.c`,
`be_aas_sample.c`, `be_aas_route.c` und `be_ai_weight.c`. Die Module decken
alle 638 im Ledger erfassten Symbole sowie `qsort` ab. 132 Datensätze,
Funktionen oder Beobachtungen aus unverändertem C prüfen die definierten
Originalentscheidungen; 404 native Verträge prüfen Lebenszyklen, Fehlerfälle,
Kapazitätsgrenzen, Zustandsübergänge und typisierte Hostaktionen.

Die Retail-Probes lesen die echten Daten unter `D:/Quake3`: alle 30 AAS-
Dateien mit 96.758 Areas und 125.731 Reachabilities, 32 Chatdateien,
175 Synonymgruppen, 138 Matchvorlagen, 244 Zufallsgruppen und 456 Reply-
Einträge. Der q3dm7-Clusteringpfad bildet 3.761 Areas, 62 Portale und 13
Cluster ab. q3dm1- und q3dm17-Probes prüfen Routing, Sampling, Mapziele,
Item-/Weapon-Weights und schwebende Jumppad-Items. Das Inventar zählt nun
**114 portierte, 104 partielle und 117 nicht begonnene** Runtime-/
Plattformdateien.

Der vollständige Befehl
`python scripts/verify.py --data-root D:/Quake3` besteht alle **378 Gates**.
Der frisch erzeugte `build/MiniQuake3.exe`-Stand hat SHA-256
`fa3a1cb6a2748466176d56a9c3145775749397a03fd143e74d1c092f50577c7d`;
`build/verification.json` hat SHA-256
`3fab71da55d1687233f9f32e1e8b375c0a466af4794c31439e17c8bb96d46047`.

Die verbleibenden Grenzen sind Teil der Abnahme und werden nicht als Parität
gezählt. Der historische proprietäre GRank-Backenddienst fehlt; der Port bildet
Anfragen, Antworten und Fehler deshalb als typisierte asynchrone
Hostschnittstelle ab. Legale Team-Arena-Assets fehlen, weshalb deren optische
Abnahme offen bleibt, obwohl Missionpack-Zustände durch C- und native Verträge
geprüft sind. Dynamische Engine-Entity-Kollision, Point-Contents und einzelne
Traces sind injizierte Hostdienste; die statischen AAS-/BSP-Pfade laufen nativ.
Release-AAS verwendet durch BSPC vorberechnete Reachabilities; ein erzwungener
nativer Neubau ist implementiert. RCD-v2 persistiert deterministisch ohne C-
Pointer. Die zehn upstream mit `#if 0` deaktivierten `bg_lib.c`-Funktionen sind
vollständig aufrufbar portiert, bleiben aber außerhalb des aktiven Q3_VM-Pfads.

### Vollständige Common-, Shader- und Bot-Zustandslaufzeit

Der Dateiabgleich vom 22. Oktober 2026 hebt `code/qcommon/common.c`,
`code/renderer/tr_shader.c` und `code/game/ai_dmnet.c` auf `ported`. Alle 152
Ledger-Symbole sind einem nativen MiniLang-Pfad zugeordnet. 60 Beobachtungen
aus unverändertem C und 102 native Verträge prüfen die neuen Dateipfade; die
bereits vorhandenen Shader-Parser-, Material- und Bot-Navigationstests bleiben
zusätzlich aktiv.

`common.ml` bildet Redirect und Ausgabe, Fehler und Quit, Filter und Hashing,
Zeitfassade, Journaling und Events, Startparameter, Initialisierung, Frame und
Shutdown, Konfiguration und CD-Key sowie Zone/Hunk und Bytefunktionen ab.
OS-Zeit und Kalender, Dateien, Prozessende, Systemevents und
Subsystem-Lebenszyklen sind typisierte Hostdienste. Verwaltete Allokationen
ersetzen rohe Pointer- und Assemblerlayouts; kontrollierte `CommonError`-Werte
ersetzen `setjmp`/`longjmp` und absichtliche Prozessabstürze.

`shader_runtime.ml` portiert die Parserfassaden, Sky-/Surface-/Sort-Auswertung,
`FinishShader`, Vertex-Light- und Multitexture-Kollaps, Iteratorwahl, stabile
Handles, sortierte Einfügung, Registrierung, Remap und Liste. Der Retail-Probe
liest 27 Shaderdateien mit 1.404 Definitionen und findet 28 explizite q3dm1-
Treffer. GPU-Upload, TMU-/Lightmap-Arrayzugriff und Backend-Commandbuffer-
Reparatur bleiben typisierte Hostgrenzen.

`ai_dmnet.ml` umfasst alle Baseq3- und Missionpack-Knoten, Node-Historie und
Überlauf, Aktivierungswaffen einschließlich Chaingun und Nailgun,
`BotClearPath` für Kamikaze und Prox-Minen, Führungsdispatch sowie One-Flag-
CTF-, Obelisk- und Harvesterzweige. Die Baseq3-Retaildaten liefern fünf direkte
Probes. Da `D:/Quake3` keine Team-Arena-Daten enthält, werden Missionpack-
Semantik und Grenzwerte durch Original-C- und native Verträge geprüft.
Dynamische Entity-/Trace-/EA-Aktionen bleiben typisierte Hostdienste.

Das erzeugte Inventar zählt jetzt **117 portierte, 101 partielle und 117 nicht
begonnene** Runtime-/Plattformdateien. Die drei Fokustests, die komplette
31-teilige Bot-Paritätssuite, der Hauptbuild und das Retail-QVM-Match über acht
Frames bestehen. Der Build hat SHA-256
`cfcff12bbb36b766ad02e93d974e3a06df0e65f0e65490b4fb9c43a7725a3b3b`.
Der letzte vollständige Lauf aller 378 bisherigen Gates bleibt grün; die drei
neuen Tests sind als Gates 379 bis 381 in `scripts/verify.py` eingetragen.

### Vollständige Mathe-, Dateisystem- und Client-Hauptpfade

Der Dateiabgleich vom 22. Oktober 2026 hebt `code/game/q_math.c`,
`code/qcommon/files.c`, `code/client/cl_input.c` und `code/client/cl_main.c`
auf `ported`. Alle 288 Ledger-Symbole sind nativen MiniLang-Modulen
zugeordnet. 71 gezielte Beobachtungen aus unverändertem C, 173 neue native
Verträge und die bestehenden 4.096 direkten C-Mathematikfälle prüfen das Paket.

`math.ml` deckt jetzt sämtliche Vektor-, Winkel-, Ebenen-, Bounds-, gepackten
Farb-, Byte-Normalen-, Rotations-, Normalisierungs- und Zufallsfunktionen ab.
Neben dem vollständigen Symbol- und Vertragsgate bleiben die umfangreichen
Shared-Game-, Missile- und Retail-Patchvergleiche grün.

`files_runtime.ml` portiert Suchpfade, PK3-Zugriff, Pure-/Referenzprüfung und
Pak-Reorder, 64 Handles mit Read, Read2, Write, Printf, Seek, Tell, Append,
AppendSync und Flush, Loose-/Serverpfade, Listen und Mod-Puffer sowie Init,
Startup, ConditionalRestart, Restart und Shutdown. 11 direkte C-Records,
44 Runtime-Verträge, 48 C-MD4-Werte, 84 ZIP-/DEFLATE-Bytevergleiche und zehn
Retail-Probes prüfen 31 BSPs, 27 Shaderdateien und drei Pak-Suchpfade. ZIP-
Streams werden pro Handle als validierte Bytes materialisiert; OS-Schreib-,
Rename- und Delete-Aktionen bleiben typisierte Hostgrenzen.

`cl_input.ml` deckt alle 59 Originalkommandos, duales Key-Timing, MLook und
CenterView, UI-/CGame-/Gameplay-Mausrouting, Joystick, Cmd-/Angle-/Weapon-/
ServerTime-Erzeugung, Command-Ring sowie Ready/Write/Send über Reliable,
Delta und Netchan ab. Sechs C-Differenzrecords, 31 Verträge und die echte
Retail-Cgame-QVM bestehen. OS-Fensterereignisse, VM-Mousecalls, Debuggraph und
UDP bleiben Hostcallbacks.

`client_main.ml` portiert Lifecycle, Reliable-Ring, Connect/Resend/OOB/Packet,
Demo, Downloads, Renderer/Sound/Hunk, Frame/Timeout/Userinfo, LAN/Ping/
Serverstatus, Pure/PK3, MOTD/Rcon und CD-Key. Der produktive Byte-/Netchan-/
QVM-Pfad ist über `attachNetworkIngress` und `CL_PacketEventLive` angebunden.
18 C-Beobachtungen, 47 native Verträge und sieben Retail-Probes bestehen.
UDP/DNS/Sockets, Dateihandles, Renderer-/Sound-Neustart, Speicherallokation und
OS-Umgebungsvariablen bleiben typisierte Hostaktionen. Der Port liest keinen
Retail-CD-Key; geprüft wird nur die originale lokale Syntax und Checksumme.

Das erzeugte Inventar zählt jetzt **121 portierte, 97 partielle und 117 nicht
begonnene** Runtime-/Plattformdateien. Die vier neuen Gates sind als Gates 382
bis 385 in `scripts/verify.py` eingetragen. Der Windows-Hauptbuild und die
fokussierten C-, Vertrags- und Retail-Prüfungen bestehen. Das kombinierte
Retail-QVM-Match läuft acht Frames mit 13 Snapshot-Entities, 2.345 texturierten
Dreiecken, 19 Scene-Entities, 26 Sounds und null nicht unterstützten Entities.
Der erzeugte `build/MiniQuake3.exe`-Stand hat SHA-256
`26b01d8d9c1191ef0ef045cf38c5e44e698a4bacde97d05b1df63e50491c395c`.

## 2026-10-22: `l_precomp.c`, `q_shared.c`, `msg.c` und `snd_dma.c` vollständig zugeordnet

Vier große partielle Originaldateien sind jetzt vollständige native MiniLang-Adapter. `l_precomp.c` deckt alle 82 Präprozessor-Einstiegspunkte ab und nutzt dieselbe Registry wie die produktiven CG_PC-QVM-Traps. `q_shared.c` stellt alle 59 Parser-, Endian-, Pfad-, String-, Matrix-, Format- und Info-String-Funktionen bereit. `msg.c` bildet alle 48 Protocol-68-Einstiegspunkte über die vorhandenen exakten Huffman- und Delta-Kerne ab. `snd_dma.c` liefert alle 42 Audio-Lifecycle- und Dispatch-Funktionen über die produktiven Kanal-, Spatial-, Loop-, Paint- und Raw-Stream-Module.

Nachweise:

- `test_l_precomp.py`: 82/82 Symbole, 25 unveränderte C-Beobachtungen, 49 native Verträge und sechs Retail-Proben mit echten pak0-Includes.
- `test_q_shared_runtime.py`: 59/59 Symbole, 13 exakte Datensätze aus 24 unveränderten C-Funktionen, 39 native Verträge und acht Retail-Prüfungen über 30 Arenen und 32 Bots.
- `test_msg_complete.py`: 48/48 Symbole, 152 unveränderte C-Differenzdatensätze, 223 Verträge und die Retail-cgame.qvm-Probe.
- `test_snd_dma_runtime.py`: 42/42 Symbole und 25 Lifecycle-Verträge. Die delegierten Audioalgorithmen bestehen zusätzlich 33 exakte Baseq3-Datensätze und 64 Kanal-/Loop-/Raw-/Spatial-Verträge; Paint, Doppler und der 40-Verträge-QVM-Audiopfad bleiben grün.
- `parity_inventory.py` und `test_parity_inventory.py`: 335 Runtime-/Plattformdateien, davon 125 portiert, 93 partiell und 117 nicht begonnen.

Sichere Abstraktionsgrenzen bleiben dokumentiert: Dateisystem-/PK3-Zugriff läuft über typisierte Hosts, verwaltete Strings und Bytearrays ersetzen C-Zeigeraliasing, und das Audio-Gerät bleibt die Plattformgrenze. Diese Unterschiede verändern die geprüften Baseq3-Laufzeitpfade nicht. Die vollständige Verify-Auswahl wurde für dieses Paket nicht erneut am Stück ausgeführt; Fokusgates, abhängige Regressionen, Hauptbuild und Retail-QVM-Match sind die Abnahmekriterien dieses inkrementellen Blocks.
Der frisch gebaute Hauptstand hat SHA-256 `109af343203c8eb540e2343c8fbcaf7700fc6e7f61666ba5da40c97e7cb34635`. Der anschließende Retail-QVM-Match besteht über acht Frames mit neun Prediction-Traces, 2.345 texturierten Dreiecken, 17 Renderpässen und 26 Soundbefehlen.

## 2026-10-22: 19 offene Gameplay-, Botlib- und Medienquellen geschlossen

Der vollständige Abgleich des letzten Reviews ist umgesetzt. Folgende
Originaldateien stehen im Ledger auf `ported` und besitzen eigene native
MiniLang-Adapter sowie fokussierte Regressionsgates:

- Gameplay und Match: `bg_pmove.c`, `g_team.c`, `g_cmds.c`, `g_main.c`,
  `g_mover.c`, `g_client.c`, `g_weapon.c`, `g_target.c`, `g_missile.c`,
  `g_items.c`, `g_active.c`, `g_combat.c`, `g_utils.c`, `g_trigger.c` und
  `g_misc.c`.
- Bots und Skripte: `g_bot.c` und `l_script.c`.
- Renderer und Medien: `tr_image.c` und `cl_cin.c`.

Die Integration beseitigt außerdem drei dabei sichtbar gewordene
Abweichungen: Entity-Slots gelten erst nach `G_FreeEntity` als frei,
Team-Kommandos formatieren ihre Nachricht erst beim ersten tatsächlichen
Empfänger, und Baseq3 wirft den neutralen Missionpack-Flag-Powerup nicht als
Baseq3-Item ab. Die Botlib-Hosts für Skript und Präprozessor verwenden getrennte
Typen, sodass die vollständige Cgame-Vertragsauswahl ohne Namenskollision baut.
Das Image-Register führt die originale `frameUsed`-Buchhaltung pro Frame.

Nachweis ist ein vollständiger Lauf von
`python scripts/verify.py --data-root D:/Quake3`: **408/408 Gates bestanden**.
`build/MiniQuake3.exe` hat SHA-256
`c53284b8d10e5d8aa811adb1efe241089185ee9359e35d8d3b8fbb696320192b`;
`build/verification.json` hat SHA-256
`52d4c214a166500abb36d2aa0eea775f2c521b12a54833c7296684d3ffab6218`.
Der Retail-QVM-Pfad läuft acht Frames mit 131 Entities, 13
Snapshot-Entities, neun Prediction-Traces, 301 Cgame-Assets, 19
Scene-Entities, 2.345 vollständig texturierten Dreiecken, 17 Renderpässen,
26 Sounds und null nicht unterstützten Entities. Alle 31 BSP-Karten, der
512-Frame-Botlauf und die produktiven Windows-Fenster-, Audio- und
Renderergrenzen bestehen ebenfalls.

Das generierte Inventar umfasst 335 Runtime-/Plattformdateien: **144 portiert,
74 partiell und 117 noch nicht begonnen**. Der vollständige 1:1-Port bleibt
damit offen. Die größten Restflächen liegen in weiteren Renderer-Backend-/GL-
und Plattformdateien, Client-/Server-/Netzwerkoberflächen, Botlib/AAS sowie der
grafischen Team-Arena-Abnahme. Die vorhandenen Retaildaten prüfen Baseq3 direkt.
Da `D:/Quake3` keine `missionpack`-Assets enthält, sind Team-Arena-Zweige über
unveränderte C-Differenzwerte und native Verträge belegt, aber noch nicht durch
einen vollständigen Team-Arena-Retaillauf abgenommen.

## 2026-10-22: Sieben weitere partielle Gameplay-Dateien vollständig geschlossen

Die produktiven MiniLang-Pfade besitzen jetzt C-namensgleiche Komplettfassaden
für `bg_misc.c`, `bg_slidemove.c`, `g_spawn.c`, `g_session.c`, `g_mem.c`,
`g_arenas.c` und `g_svcmds.c`. Damit sind sämtliche in diesen sieben Dateien
erkannten Originalsymbole im Ledger zugeordnet. Die Spawnintegration trennt die
48 Baseq3- von den 51 Missionpack-Klassen, wendet `notq3a` beziehungsweise
`notta` korrekt an und führt den produktiven Mapstart über die vollständige
`G_SpawnEntitiesFromString`-Fassade. Die Arena-Logik enthält nun auch die
Missionpack-Postgame-Felder und deren Team-/Duell-Auswertung.

Die fokussierte Abnahme umfasst:

- `bg_misc.c`: 12/12 Symbole und 15 native Verträge sowie die abhängigen
  Shared-Game-, Entitystate-, Item- und Retail-QVM-Regressionen.
- `bg_slidemove.c`: 2/2 Symbole und fünf native Verträge sowie die exakten
  unveränderten-C-Bewegungsvergleiche.
- `g_spawn.c`: 13 Funktionen, zwei Originaltabellen, 23 native/Retail-Verträge,
  512 unveränderte-C-Fälle, fünf `q3dm7`-Replays und 31 Retail-Karten. Der
  abhängige Lifecycle besteht 95 Szenarien, 378.562.214 exakte Wörter und 113
  Verträge.
- `g_mem.c`: 3/3 Symbole, 53 unveränderte-C-Szenarien, 1.566 Aktionen,
  125.480 exakte Wörter sowie je acht native und Retail-Verträge.
- `g_session.c`: 5/5 Symbole, sechs unveränderte-C-Fälle, 14 Aktionen,
  746.756 exakte Wörter sowie je neun native und Retail-Verträge.
- `g_arenas.c`: 8/8 Symbole, je sieben native und Retail-Verträge sowie fünf
  unveränderte-C-Szenarien mit 1.343 exakten Wörtern.
- `g_svcmds.c`: 11/11 Symbole, je zehn native und Retail-Verträge sowie 182
  unveränderte-C-Szenarien mit 315 Aktionen, 51.110.232 exakten Wörtern und
  1.543 geordneten Effekten.

Das Inventar zählt damit **151 portierte, 67 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Die sieben Fokusgates sind in `scripts/verify.py`
eingetragen. Dieses inkrementelle Paket wurde mit seinen Fokusgates, den
abhängigen Regressionen, dem Windows-Hauptbuild und dem kombinierten
Retail-QVM-Match abgenommen; die vollständige Verify-Auswahl des unmittelbar
vorherigen Pakets bleibt bei 408/408 Gates grün.
Der erneut gebaute Windows-Hauptstand hat SHA-256
`c53284b8d10e5d8aa811adb1efe241089185ee9359e35d8d3b8fbb696320192b`.
Der kombinierte Retail-QVM-Match läuft weiterhin acht Frames mit 131 Entities,
13 Snapshot-Entities, 2.345 texturierten Dreiecken, 17 Renderpässen, 26 Sounds
und null nicht unterstützten Entities.

## 2026-10-22: Renderer-Front-End, BSP-Welt und Audiomixer geschlossen

Fünf weitere große partielle Originaldateien sind vollständig zugeordnet.
`tr_main.c` stellt alle 32 Front-End-Funktionen für View-, Entity-, Portal-,
Projektions-, Fog-, Surface- und Renderreihenfolge bereit. `tr_shade_calc.c`
deckt alle 32 Wave-, Farb-, Fog-, Licht-, `tcGen`-, `tcMod`- und
Deformationspfade ab. `tr_bsp.c` lädt über 30 C-namensgleiche Einstiege die
vollständige BSP46-Welt mit Shadern, Lightmaps, PVS, Nodes/Leafs, vier
Surfacetypen, Fogs, Submodels und Lightgrid; Patch-LOD-Abgleich und
Crack-Stitching sind ebenfalls implementiert.

Der Audiopfad besitzt nun die vollständigen acht `snd_mix.c`-Einstiege für PCM,
ADPCM, Wavelet, MuLaw, Kanalakkumulation und DMA-Transfer. `snd_adpcm.c` deckt
Encoder, Decoder, Blockverkettung, Speicherberechnung und Samplezugriff ab.

Nachweise:

- `tr_main.c`: 32/32 Symbole, drei unveränderte-C-Datensätze, 24 native
  Verträge und alle 31 Retail-BSPs; die abhängigen View-, DrawSurf-, Portal-,
  QVM-Geometrie- und World-Selection-Prüfungen bestehen.
- `tr_shade_calc.c`: 32/32 Symbole, 27 native Verträge, 28 unveränderte-C-
  Farb-/Fog-/Specular-Differenzen, 60 World-Batch-Verträge, acht exakte
  C-Noise-Datensätze sowie Retail-Proben auf fünf Karten.
- `tr_bsp.c`: 30/30 Symbole, 19 unveränderte-C-Differenzdatensätze, 25 native
  Verträge und ein vollständiger Retail-Weltload auf `q3dm1`; BSP-, Lightgrid-,
  Fog-, Flare-, World-Selection- und QVM-Geometrie-Regressionen bestehen.
- `snd_mix.c`: 8/8 Symbole, zehn neue native Verträge und vier bestehende
  unveränderte-C-Regressionsgruppen für Transfer, PCM- und komprimierte Kanäle
  sowie den vollständigen Paint-Zyklus.
- `snd_adpcm.c`: vollständige Encoder-/Decoder-Oberfläche, drei exakte
  unveränderte-C-Encoderrecords, zehn native Verträge und die bestehende
  unveränderte-C-Decoderregression.

Das Inventar zählt jetzt **156 portierte, 62 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Die fünf neuen Einzelgates sind in
`scripts/verify.py` registriert. Der vollständige 1:1-Port bleibt offen; die
größten nativen Restflächen liegen im Renderer-Backend und den übrigen
Surface-/Shade-Dateien, in Client-/Server-/Netzwerkoberflächen, Botlib/AAS und
den Plattformdateien.

Alle fünf Fokusgates, ihre gezielten Abhängigkeiten, der Windows-Hauptbuild und
der kombinierte Retail-QVM-Match sind grün. Der Hauptbuild hat SHA-256
`c53284b8d10e5d8aa811adb1efe241089185ee9359e35d8d3b8fbb696320192b`.
Der Retail-Match läuft acht Frames mit 131 Entities, 13 Snapshot-Entities,
2.345 texturierten Dreiecken, 17 Renderpässen, 26 Sounds und null nicht
unterstützten Entities. Die vollständige Verify-Auswahl wurde für diesen
inkrementellen Block nicht erneut am Stück ausgeführt; der letzte vollständige
Lauf bleibt bei 408/408 Gates grün.

## 2026-10-22: Renderer-Backend, Surface-/Shade-Stufen und Wavelet-Codec geschlossen

Vier weitere partielle Originaldateien sind vollständig zugeordnet. Die neue
`tr_surface.c`-Fassade deckt alle World-, Patch-, Polygon-, MD3-, Sprite-,
Beam-, Rail- und Lightning-Surfaces einschließlich LOD- und Dispatchpfaden ab.
`tr_backend.c` besitzt alle GL-/TMU-Zustände, View-, Portal-, Sortier-, 2D-,
Cinematic-, Swap- und Renderthread-Einstiege. `tr_shade.c` schließt Element-
und Strip-Zeichnung, Surface-Lifecycle, Stage-Iterators, Dynamic Lights und Fog.
`snd_wavelet.c` ergänzt Encoder und Decoder für MuLaw und Daubechies-Wavelets
einschließlich der zustandsbehafteten Chunk-Verarbeitung im produktiven
komprimierten Audiopfad.

Nachweise:

- `tr_surface.c`: 24/24 Symbole, fünf unveränderte-C-LOD-Datensätze, 28 native
  Verträge und ein Retail-`q3dm1`-Probe mit 2.097 Surfaces, 113 Patches und
  17.723 Quelldreiecken. Acht abhängige Surface-/QVM-Gates bestehen.
- `tr_backend.c`: 21/21 Symbole, sieben unveränderte-C-Datensätze, 38 native
  Verträge, 31 erkannte Retail-BSPs sowie ein produktiver `q3dm1`-Probe mit
  94 Shadern und 64 Submissions. Sechs Renderer-Abhängigkeiten bestehen.
- `tr_shade.c`: 17/17 Symbole, 28 native Verträge, fünf eigene unveränderte-C-
  Strip-Datensätze und 39 bestehende C-Differenzdatensätze für Farben,
  Shaderzeit und Dynamic Lights. Material-, QVM-, World-Batch- und Retail-
  Proben auf fünf Karten sind grün.
- `snd_wavelet.c`: 9/9 Symbole, neun exakte C-MuLaw-Datensätze, zwölf native
  Codec-Verträge und die bestehende produktive Compressed-Paint-Regression.

Das Inventar zählt jetzt **160 portierte, 58 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Die vier Fokusgates sind in `scripts/verify.py`
registriert. Alle vier Fokusgates sowie der Windows-Hauptbuild und der
kombinierte Retail-QVM-Match wurden auf dem zusammengeführten Stand erneut
geprüft. Die vollständige Verify-Auswahl wurde für dieses inkrementelle Paket
nicht erneut am Stück ausgeführt; der letzte vollständige Lauf bleibt bei
408/408 Gates grün. Der Hauptbuild hat SHA-256
`6538d101f95ecc2fac936b773accf37bf71106c13878eeb3f296927b292eba66`.

## 2026-10-22: Renderer-Kommandos, Modelle, Welt und Kurven geschlossen

Vier weitere Rendererdateien sind vollständig zugeordnet. `tr_cmds.c` besitzt
den gesamten Front-End-Command-Lifecycle mit Kapazitätsgrenzen,
Frame-/Stereo-Steuerung, Zustandswechseln, Leistungszählern und synchroner wie
SMP-gestützter Übergabe. `tr_model.c` schließt Modellregistrierung, Handles,
MD3-LODs, MD4-Validierung, Tags und Bounds. `tr_world.c` bildet Frustum-,
Backface- und Dynamic-Light-Culling, Brushmodels, BSP-Rekursion und PVS-/
Areamask-Markierung ab. `tr_curve.c` liefert den vollständigen Patchpfad mit
Unterteilung, Normalen, LOD-Fehlertabellen und Grid-Stitching.

Nachweise:

- `tr_cmds.c`: 11/11 Symbole, sieben unveränderte-C-Datensätze, 37 native
  Lifecycle-Verträge und 32 QVM-2D-Verträge. Der Retail-QVM-Probe zeichnet 36
  Cgame- und 174 UI-Quads über 20 Batches und 16 echte Materialien.
- `tr_model.c`: 11/11 Symbole, sieben unveränderte-C-Datensätze, 23 native
  Verträge und vier echte Retail-Modelle mit zusammen 346 Frames, sechs
  Surfaces und 966 Dreiecken. MD3-, MD4-, Tag-, Bounds- und QVM-Renderer-
  Regressionen bestehen.
- `tr_world.c`: 15/15 Symbole, vier unveränderte-C-Dlight-Datensätze und 29
  native Verträge. World-Selection, QVM-Geometrie, Dynamic Lights und Retail-
  Proben auf `q3dm1`, `q3dm2`, `q3dm4`, `q3dm16` und `q3ctf1` sind grün.
- `tr_curve.c`: 11/11 Symbole, fünf unveränderte-C-Datensätze, 26 native
  Verträge und 31 erkannte Retail-BSPs. `q3dm1` umfasst 113 Patches mit 6.652
  Grid-Vertices und 9.744 Dreiecken; BSP-, World-Selection- und Surface-Grid-
  Regressionen bestehen.

Das Inventar zählt jetzt **164 portierte, 54 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Die vier Fokusgates sind in `scripts/verify.py`
registriert. Die vollständige Verify-Auswahl wurde für dieses inkrementelle
Paket nicht erneut am Stück ausgeführt; der letzte vollständige Lauf bleibt bei
408/408 Gates grün. Der zusammengeführte Windows-Hauptbuild hat SHA-256
`6538d101f95ecc2fac936b773accf37bf71106c13878eeb3f296927b292eba66`.
Der kombinierte Retail-QVM-Match bleibt mit acht Frames, 131 Entities, 2.345
texturierten Dreiecken, 17 Renderpässen, 26 Sounds und null nicht
unterstützten Entities grün.

## 2026-10-23: Renderer-C-Laufzeit vollständig zugeordnet

Die letzten vier partiellen Renderer-C-Dateien sind geschlossen. `tr_scene.c`
bildet den vollständigen Multi-Scene-Lifecycle von SMP-Frame-Reset über
Polygon-, Entity- und Lichtaufnahme bis zur Refdef-/Viewport-Erzeugung ab.
`tr_flares.c` besitzt Poolverwaltung, Projektion, Visibility-Test, Fade und
fogged Quad-Ausgabe. `tr_light.c` deckt Brush- und Entity-Licht, dynamische
Lichter, Lightgrid und Punktabfragen ab. `tr_font.c` implementiert den
vorgerenderten Font-ABI-Pfad sowie die backendgestützte FreeType-Erzeugung mit
Atlaspacking und TGA-/DAT-Ausgabe.

Nachweise:

- `tr_scene.c`: 9/9 Symbole, sechs exakte ABI-Datensätze, 32 native Verträge,
  55 QVM-Geometrie-, 19 Scene-Batch- und 20 erweiterte Cgame-Renderer-
  Verträge sowie der Retail-QVM-Renderer-Trap-Probe.
- `tr_flares.c`: 6/6 Symbole, vier unveränderte-C-Datensätze, 26 native
  Verträge und 31 Retail-BSPs. `q3dm0` belegt 128 Flare-Surfaces, 128
  Poolaufnahmen und 128 gerenderte Quads.
- `tr_light.c`: 6/6 reale Originalfunktionen, sechs unveränderte-C-Datensätze,
  19 native Verträge und ein Retail-`q3dm1`-Lightgrid mit 8.514 Punkten. Eine
  echte Abweichung beim Clamp-Interpolationsanteil wurde im produktiven
  Lightgrid korrigiert.
- `tr_font.c`: 9/9 Symbole, fünf unveränderte-C-Datensätze und 32 native
  Verträge. Retail `pak0.pk3` bestätigt den ausgelieferten Missing-Font-Pfad;
  der produktive Raster-Backend-Vertrag prüft deterministisch die
  FreeType-Erzeugung, da Baseq3 weder TTF noch `fontImage_*.dat` ausliefert.

Das Inventar zählt jetzt **168 portierte, 50 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Im Renderer stehen damit **23 portierte C-Dateien,
null partielle C-Dateien und vier nicht portierte Header-/Projektdateien**.
Die vier Fokusgates sind in `scripts/verify.py` registriert. Die vollständige
Verify-Auswahl wurde für dieses inkrementelle Paket nicht erneut am Stück
ausgeführt; der letzte vollständige Lauf bleibt bei 408/408 Gates grün. Der
zusammengeführte Windows-Hauptbuild hat SHA-256
`ee562f15de525fcf4a878b4d585bfa02b6d1ffcd58547b348019a2ddf9a3b959`.
Der kombinierte Retail-QVM-Match bleibt mit acht Frames, 131 Entities, 2.345
texturierten Dreiecken, 17 Renderpässen, 26 Sounds und null nicht
unterstützten Entities grün.

## 2026-10-23: Zentrale Client- und Sound-Cache-Oberflächen geschlossen

Vier bislang partielle Clientdateien sind vollständig zugeordnet. `cl_cgame.c`
besitzt jetzt eine C-namensgleiche Fassade über VM-Lifecycle, Cgame-Traps,
Serverkommandos, Configstrings, Usercmd-, Parse-Entity- und Snapshot-Ringe,
ABI-Puffer und Zeitsteuerung. `cl_keys.c` schließt sämtliche Key-, Binding-,
Field-, Konsole-, Chat-, Catcher- und timestamped `+/-`-Dispatchpfade.
`cl_ui.c` bündelt UI-QVM, Clientstate, Glconfig, Clipboard, Keys, CD-Key,
Configstrings sowie LAN-Katalog-, Cache-, Ping-, Status- und Querydienste.
`snd_mem.c` ergänzt den RIFF-Parser, den festen Soundpuffer-Pool, PCM-
Chunkketten, komprimierte Encode-Callbacks, Dateilebenszyklus und den bereits
exakt abgeglichenen Resampler.

Nachweise:

- `cl_cgame.c`: 22/22 Symbole, fünf unveränderte-C-Datensätze, 40 native
  Verträge und echter Retail-`cgame.qvm`-Lifecycle mit 29 Collision-Traps, 56
  2D-Draw- und 18 Soundkommandos. Sieben abhängige Lifecycle-, Syscall-, Zeit-,
  Ring-, Serverkommando- und Usercmd-Gates bestehen.
- `cl_keys.c`: 26/26 Symbole, 279 unveränderte-C-Datensätze, 32 native
  Verträge sowie echtes Retail-`default.cfg` mit 1.737 Bytes und 50 Bindings.
  Key-Trap-, Binding-Dispatch- und Konsolenregressionen sind grün.
- `cl_ui.c`: 35/35 Symbole, sechs unveränderte-C-Datensätze, 36 native und
  sieben Retail-Verträge. Die echte Retail-`ui.qvm` wird geladen und ihr
  `UI_GETAPIVERSION`-Export ausgeführt. Eine Null-Listen-Grenze im LAN-Cache
  wurde dabei im produktiven Pfad behoben.
- `snd_mem.c`: 12/12 Symbole, acht exakte unveränderte-C-Resamplingrecords,
  33 native Verträge und Loads von drei echten Retail-WAVs im vollständigen Sound-Cache-Contract.

Das Inventar zählt jetzt **172 portierte, 46 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Die vier Fokusgates sind in `scripts/verify.py`
registriert. Alle vier Fokusgates, der Windows-Hauptbuild und der kombinierte
Retail-QVM-Match wurden auf dem zusammengeführten Stand geprüft. Die
vollständige Verify-Auswahl wurde für dieses inkrementelle Paket nicht erneut
am Stück ausgeführt; der letzte vollständige Lauf bleibt bei 408/408 Gates
grün. Der Hauptbuild hat SHA-256
`f8c235741b5a609a2a6153110d8a2028f9fc0cd1260c785a6f6872d229e3eec4`.
Der Retail-Match läuft acht Frames mit 131 Entities, 13 Snapshot-Entities,
2.345 texturierten Dreiecken, 17 Renderpässen, 26 Sounds und null nicht
unterstützten Entities.

## 2026-10-23: Sämtliche Client-C-Laufzeitdateien geschlossen

Die drei letzten partiellen Client-C-Dateien sind vollständig zugeordnet.
`cl_console.c` besitzt nun den farbigen Ringpuffer für Transcript und Notify,
Zeilenumbruch und Resize-Erhalt, Scroll-/Dump-Befehle, animierte
Konsolendarstellung und sämtliche Message-Modi. Retail-VM-Ausgaben laufen im
produktiven Local-QVM-Pfad in diesen Puffer; der Windows-Frame zeichnet daraus
Transcript und Notify-Glyphen. `cl_parse.c` bündelt sämtliche Snapshot-,
Servermessage-, Gamestate-, Download- und Systeminfo-Pfade; `SHOWNET` Level
1–3 ist im produktiven Dispatcher einschließlich Snapshot- und Entity-
Zusammenfassungen aktiv. `cl_scrn.c` schließt 640-Skalierung, Bilder, Fills,
Atlas-Schriften, Demoanzeige, Debuggraph, alle Verbindungszustände,
Widescreen-Clear, Konsole, Stereo-Frames und Rekursionsschutz. Diese
`cl_scrn.c`-Oberfläche ist eine native Fassade über die produktiven Renderer-
und UI-Bausteine; der Windows-Hauptframe ruft die zugrunde liegenden Bausteine
weiterhin direkt auf und verwendet `SCR_UpdateScreen` noch nicht als obersten
Frame-Dispatcher.

Nachweise:

- `cl_console.c`: 22/22 Symbole, sechs unveränderte-C-Datensätze und 33
  native Verträge sowie neun produktive Verdrahtungsverträge. Der Retail-Probe
  prüft zusätzlich einmalige 1280×720-Skalierung, Scroll-/Catcher-/Demo-Loop-
  Pfade und den echten zweistufigen `console`-Shader aus `console01.tga` und
  `console02.jpg`.
- `cl_parse.c`: 9/9 Symbole, 18 unveränderte-C-Datensätze, 20 native und 21
  produktive localhost-UDP-Verträge. Ein Retail-Gamestate bewahrt 3.321 Bytes
  aus `pak0.pk3` exakt.
- `cl_scrn.c`: 18/18 Symbole, acht unveränderte-C-Datensätze und 35 native
  Verträge. Der Retail-Probe erzeugt aus drei echten Texturen 60 Quads und 120
  native Dreiecke aus dem Befehlsstrom der Fassade; die separat produktiv
  verwendeten Renderer-, UI-Lifecycle- und QVM-2D-Abhängigkeiten sind grün.

Das Inventar zählt jetzt **175 portierte, 43 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Im Client stehen damit **15 portierte C-Dateien,
null partielle C-Dateien und vier nicht portierte Headerdateien**. Die drei
Fokusgates sind in `scripts/verify.py` registriert. Alle Fokusgates, ihre
produktiven Abhängigkeiten, der Windows-Hauptbuild und der kombinierte
Retail-QVM-Match wurden auf dem zusammengeführten Stand geprüft. Die
vollständige Verify-Auswahl wurde für dieses inkrementelle Paket nicht erneut
am Stück ausgeführt; der letzte vollständige Lauf bleibt bei 408/408 Gates
grün. Der Hauptbuild hat SHA-256
`bfbb5d270af3983ecb9688a1d2f9e7f325cb562df1277ad73f571790e880918c`.
Der Retail-Match läuft acht Frames mit 131 Entities, 13 Snapshot-Entities,
2.345 texturierten Dreiecken, 17 Renderpässen, 26 Sounds und null nicht
unterstützten Entities.

## 2026-10-23: MD4 und drei Server-Laufzeitdateien geschlossen

Vier zuvor partielle Originaldateien sind nun vollständig nativ zugeordnet.
`md4.c` besitzt zusätzlich zu den produktiven Block-, Update- und
Dateiprüfsummenpfaden die originalen Little-Endian-Grenzen `Encode` und
`Decode`. `sv_net_chan.c` deckt Initialisierung, Transmit, Fragmentversand und
Fragmentempfang ab. `sv_snapshot.c` ordnet nun auch den produktiven
`SV_SendClientMessages`-Scheduler zu. `sv_world.c` ergänzt die originale
`SV_SectorList_f`-Auswertung und bindet den Konsolenbefehl `sectorlist` an die
laufende World-Sektorstruktur.

Nachweise:

- `md4.c`: 8/8 Symbole, drei unveränderte-C-Datensätze, neun native Verträge,
  24 direkte C-Prüfsummenfälle mit jeweils beiden Originalwerten sowie 25
  produktive Dateisystemverträge.
- `sv_net_chan.c`: 5/5 Funktionen, zwölf unveränderte-C-Datensätze, 26 native
  Verträge und 67 produktive localhost-UDP-/Match-Verträge.
- `sv_snapshot.c`: 11/11 Symbole, drei unveränderte-C-Datensätze und 25 native
  Verträge einschließlich produktiver Frame-, Snapshot- und Fragmentplanung.
- `sv_world.c`: 12/12 Symbole, 64 unveränderte-C-Sektordatensätze, acht native
  Verträge und ein Retail-`sectorlist`-Probe. Der bestehende vollständige
  q3dm1-World-Abgleich bleibt bei 2.250 Operationen und 116.243 exakten
  Ergebniswörtern grün.

Das Inventar zählt jetzt **179 portierte, 39 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Der Serverbereich steht bei **fünf portierten,
sechs partiellen und null nicht begonnenen C-Dateien**. Alle vier Fokusgates
sind in `scripts/verify.py` registriert und bestehen auf dem
zusammengeführten Stand. Die vollständige Verify-Auswahl wurde für dieses
inkrementelle Paket nicht erneut am Stück ausgeführt; der letzte vollständige
Lauf bleibt bei 408/408 Gates grün. Der frische Windows-Hauptbuild hat SHA-256
`3df435c2772c3b9ac4ac211759f3e877315c0d8f65aa38134ba81ea2807cf474`.
Der kombinierte Retail-QVM-Match läuft weiterhin acht Frames mit 131 Entities,
13 Snapshot-Entities, 2.345 texturierten Dreiecken, 17 Renderpässen, 26 Sounds
und null nicht unterstützten Entities.

## 2026-10-23: Client-, Game- und Main-Serverpfade vollständig geschlossen

Vier weitere partielle Originaldateien sind vollständig nativ zugeordnet.
`sv_client.c` deckt nun auch Autorisierung, Drop-Reihenfolge, Gamestate-
Übertragung, Enter-World, Disconnect, Pure-Prüfung/-Reset und Userinfo ab. Ein
Inventarfehler wurde dabei korrigiert: `SV_FinalMessage` ist in dieser Datei
nur eine Kommentarreferenz; die übersehene echte Definition ist
`SV_DropClient`. `sv_game.c` besitzt sämtliche qagame-seitigen Enginegrenzen
einschließlich Entity-/Clientadressierung, Serverbefehlen, Usercmds, PVS und
Areaportalen. `sv_main.c` schließt zuverlässige Serverbefehle, Masterverkehr,
Info/Status, Redirect und Rcon. `vm_interpreted.c` ergänzt die zwei originalen
Diagnosepfade für Einrückung und den begrenzten QVM-Stacktrace.

Nachweise:

- `sv_client.c`: 22/22 tatsächlich definierte Funktionen, sechs unveränderte-
  C-Datensätze und 29 native/produktive Verträge. Die Gamestate-Nachricht wird
  mit den produktiven Reliable-/Delta-Modulen erzeugt und vom echten
  Clientparser gelesen.
- `sv_game.c`: 24/24 Symbole; der neue Rest besteht sieben unveränderte-C-
  Transkripte und 33 native/produktive Verträge über reale qagame-Dispatcher.
- `sv_main.c`: 16/16 Symbole, 74 unveränderte-C-Datensätze, 166 native und acht
  produktive localhost-Winsock-UDP-Verträge bis durch PacketEvent und den
  Connectionless-Dispatcher.
- `vm_interpreted.c`: 4/4 Symbole, sieben unveränderte-C-Ausgaben, acht native
  Diagnoseverträge und weiterhin 404 Interpreter-Differentialfälle.

Das Inventar zählt jetzt **183 portierte, 35 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Der Serverbereich steht bei **acht portierten und
drei partiellen Dateien**; offen sind dort nur noch `server.h`, `sv_bot.c` und
`sv_init.c`. Alle vier neuen Fokusgates sind in `scripts/verify.py`
registriert. Die vollständige Verify-Auswahl wurde für dieses inkrementelle
Paket nicht erneut am Stück ausgeführt; der letzte vollständige Lauf bleibt
bei 408/408 Gates grün. Der frische Windows-Hauptbuild hat SHA-256
`e787b5a14d296b9c111c0baad7126685a6e9df6f62ee37375b77018517acaca7`.
Der kombinierte Retail-QVM-Match läuft weiterhin acht Frames mit 131 Entities,
13 Snapshot-Entities, 2.345 texturierten Dreiecken, 17 Renderpässen, 26 Sounds
und null nicht unterstützten Entities.

## 2026-10-23: Kommando-, Kollision- und Serverbereich geschlossen

Fünf weitere partielle Originaldateien sind vollständig nativ zugeordnet.
`cmd.c` besitzt die komplette Tokenizer-, Argument-, Puffer-, Registry-,
Dispatch-, Completion- und Builtin-Oberfläche im produktiven Kommandoverteiler.
`cm_test.c` deckt Punkt-/Boxabfragen, PVS und den zustandsbehafteten
Areaportal-Flood vollständig ab. Die letzten drei Serverlücken `server.h`,
`sv_bot.c` und `sv_init.c` schließen ABI und Deklarationen, sämtliche
Botlib-Importe sowie den vollständigen Server-Initialisierungs- und
Shutdown-Lifecycle.

Nachweise:

- `cmd.c`: 23/23 Funktionen, 44 Datensätze aus unverändert ausgeführten
  Baseq3-Funktionskörpern und 16 native Verträge. Derselbe Laufzeitpfad wird
  von Engine, Client, Server, UI und Game produktiv verwendet.
- `cm_test.c`: 15/15 Funktionen und interne Helfer. Der unveränderte
  C-Vergleich deckt sämtliche PVS-Bytes, Leaf-/Brush-Listen, Bounds,
  Portal-Referenzzähler, Konnektivität und Area-Bits ab. Der Retail-Lauf auf
  `q3dm1` prüft 13.318 Ergebniswörter und 115.824 PVS-/Area-Bytes zusätzlich
  zu den beiden synthetischen vised/unvised Fixtures.
- `server.h`: 7/7 Strukturen, sechs Konstanten, acht Enum-Werte, 25 Cvars und
  60/60 produktiv aufgelöste Prototypen. 124 MSVC-x86-ABI-Records stimmen
  exakt; 22 native/produktive Verträge bestehen. MiniLang verwendet verwaltete
  Werte und die vorhandenen expliziten Serializer an binären Grenzen.
- `sv_bot.c`: 28/28 Funktionen, vier unveränderte-C-Szenarien mit elf exakten
  Beobachtungen, 40 native und 30 Retail-Verträge. Der Originalbot läuft 512
  Frames bis `BOTLIB_USER_COMMAND`.
- `sv_init.c`: 14/14 Funktionen, zehn unveränderte-C-Records, 38 native und
  acht Retail-Verträge. Geprüft sind Configstring-Chunking und Filter,
  Userinfo, Baselines, Maxclients, Spawnreihenfolge, Reconnects, Pure-Paks,
  40 Server-Cvars, FinalMessage und idempotenter Shutdown mit echten
  `q3dm1.bsp`- und `cgame.qvm`-Daten.

Das Inventar zählt jetzt **188 portierte, 30 partielle und 117 nicht begonnene**
Runtime-/Plattformdateien. Der Serverbereich ist mit **11/11 Dateien
vollständig portiert**. Alle neuen Fokusgates sind in `scripts/verify.py`
registriert und bestehen auf dem zusammengeführten Stand.

Die vollständige Retail-Auswahl besteht **449/449 Gates**. Der dabei erzeugte
`build/verification.json`-Nachweis hat SHA-256
`f098ae92d0f21caf9d6fe770bd0aa7dd9c585c7234b0a76622259ae41b765453`.
Anschließend wurden die neuen Servermodule in den produktiven lokalen
Matchpfad eingebunden: Configstrings stammen nun aus der `server.h`-ABI-
Repräsentation, die Registry durchläuft `SV_Init`, und die Bot-QVM-Traps
209–211 werden über den vollständigen `sv_bot.c`-Importpfad verteilt. Danach
bestanden die fünf betroffenen Fokusgates, der Windows-Hauptbuild und das
Retail-QVM-Match erneut. Der finale `build/MiniQuake3.exe`-Stand hat SHA-256
`81273c46d6d5128e067388291469ad332c38fe1cd1cabf11bee91a5387798af4`;
das Match läuft acht Frames mit 131 Entities, 13 Snapshot-Entities, 2.345
texturierten Dreiecken, 17 Renderpässen, 26 Sounds und null nicht
unterstützten Entities.
## 2026-10-23: Cvar, Netchan, Winding und Botlib-Interface geschlossen

Vier zuvor partielle Originaldateien sind jetzt vollständig nativ zugeordnet.

- `code/qcommon/cvar.c`: alle 31 Symbole einschließlich VM-Register/Update-Traps,
  Latch-/Force-/Cheat-/Archivsemantik, Info-Strings, Befehle und Persistenz.
  24 Datensätze aus unverändertem C und 41 vollständige beziehungsweise
  produktive MiniLang-Verträge bestehen.
- `code/qcommon/net_chan.c`: vollständige Protocol-68-Übertragung mit
  Fragmentierung/Reassembly, Duplikatabweisung, Scrambling, IPv4/IPX-Adresspfaden,
  16-Slot-Loopback-Ringen, UDP und OOB-Ausgabe. 14 unveränderte C-Datensätze und
  16 produktive Verträge bestehen; ein 1.301-Byte-Paket durchläuft fragmentiert
  den Loopbackpfad.
- `code/qcommon/cm_polylib.c`: alle 17 Winding-Symbole und 21 native Verträge.
  Der vollständige Patch-Differentiallauf über 30 Retail-BSPs plus `test_bigbox`
  bestätigt 6.091 Patch-Meshes und 1.352.159 exakte Vergleichsfelder.
- `code/botlib/be_interface.c`: alle 16 Schnittstellensymbole und sämtliche
  134 API-v2-Exporte. 15 unveränderte C-Datensätze, 24 native Verträge, 134/134
  Tabellenprüfungen sowie 12 produktive Retail-`qagame.qvm`-Verträge auf q3dm1
  mit 18 Level-Items bestehen.

Die produktiven Windows-Fenster-, Raster-, Input- und WinMM-Audiogrenzen bauen
und bestehen ebenfalls. Das erzeugte Inventar zählt nun **192 portierte, 26
teilweise portierte und 117 noch nicht begonnene** Dateien von insgesamt 335.
Die letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf;
dieser Integrationsblock wurde zusätzlich mit den vier neuen Fokusgates, den
betroffenen Regressionstests, dem Hauptbuild und dem Retail-Match geprüft.
Der geprüfte Hauptbuild hat SHA-256 `089d21030259d9b15cb28dd6b6051260de550391bda78c76ccbc884d5c865004`; das Retail-Match meldet 131
Entities, 2.345 vollständig texturierte Dreiecke, 17 Renderpässe und 26
Soundbefehle. Der 512-Frame-Retail-Bot-Spawn endet mit einem echten
Bewegungs-Usercmd; die nativen Fenster-, Raster-, Input- und WinMM-Gates bestehen.
## 2026-10-23: VM, BSP-Lader, Windows-Input und Tasten-ABI geschlossen

Vier weitere Originaldateien sind vollständig nativ zugeordnet:

- `code/qcommon/vm.c`: 23/23 Symbole, 13 unveränderte-C-Datensätze und 31
  native/produktive Verträge. Init/Create/Restart/Free/Clear, drei VM-Slots,
  VMI-Modi mit Compiled-Fallback, Aufruf-/Syscallkontext, Pointerübersetzung,
  Profil/Info/Debug/Logging sowie Symbole einschließlich Developer-`.map` laufen.
  Die 404 Interpreter-Differentialfälle bleiben grün.
- `code/qcommon/cm_load.c`: 28/28 Symbole. 42 exakte unveränderte-x86-C-Records
  auf q3dm1, q3dm17 und q3tourney2 sowie 20 native Verträge prüfen die komplette
  BSP-/Lump-Pipeline, MD4-Prüfsummen, Modelle, Visibility, Entitystring,
  Null-Lumps, Cache/Clear und Abfragen. Der produktive Matchboot nutzt `CM_LoadMap`.
- `code/win32/win_input.c`: 31/31 Symbole, 19 unveränderte-C-Records, 21 native
  Verträge und 15 produktive Win32-Anker. Tastaturmapping, Wiederholungen,
  Fokus/Capture/Clip, Raw Input, Mausfallback, fünf Tasten/Wheel, Joystick, POV,
  Trackball und MIDI laufen im echten Fensterpfad; alle nativen Ziele linken
  `winmm.lib` und bestehen unter `/W4 /WX`.
- `code/client/keys.h`: beide Konstanten, `qkey_t`, acht Globals und zwölf
  Deklarationen sind auf den produktiven Key-/Binding-/Console-/Chatpfad
  abgebildet. Der gemeinsame Gate besteht 279 unveränderte-C-Records, 32 native
  Verträge und die echten Retail-`default.cfg`-Bindings.

Der zusammengeführte Hauptbuild, die neuen Vollständigkeitsgates, 404
Interpreterfälle, 38 Inputverträge, 25 spielbare Matchverträge und der
gekoppelte acht Frames lange Retail-QVM-Match bestehen. Das Match meldet 131
Entities, 2.345 vollständig texturierte Dreiecke, 17 Renderpässe, 26 Sounds und
null nicht unterstützte Entities. `build/MiniQuake3.exe` hat SHA-256
`5c46402ee19d38d5cebdb76e0862e006984e6b020230c3cce5eca0546638035c`. Die vollständige Gesamtauswahl bleibt der zuletzt dokumentierte
449-Gate-Lauf; die seitdem ergänzten Gates sind in `scripts/verify.py` registriert.

Das Inventar zählt jetzt **196 portierte, 23 teilweise portierte und 116 noch
nicht begonnene** Dateien von insgesamt 335.

## 2026-10-23: Patch-/Trace-Kollision, VM-ABI und Windows-WGL geschlossen

Vier weitere partielle Originaldateien sind vollständig nativ zugeordnet:

- `code/qcommon/cm_patch.c`: 27/27 Funktionen für Subdivision, Transpose,
  Degeneratenentfernung, Plane-/Facet-/Bevel-Erzeugung sowie Point-, Box- und
  Position-Traces. 12 unveränderte C-Kernel-Datensätze, 25 Verträge und 351
  Retail-Patches auf q3dm1, q3dm17 und q3tourney2 stimmen exakt.
- `code/qcommon/cm_trace.c`: alle 22 echten Funktionen für Capsule-, Box-,
  Brush-, Leaf-, Patch-, Sphere-, Cylinder-, Tree- und Transform-Traces. Der
  frühere Inventarkandidat `collision` war nur ein Kommentarwort. 4.096
  unveränderte C-Fälle mit 40.960 exakten Feldern und die produktiven
  Retail-Capsule-Verträge bestehen.
- `code/qcommon/vm_local.h`: alle 60 Opcode-Ordinalen, beide
  assemblerrelevanten Offsets, Symbol-/VM-Zustand und sämtliche internen
  Deklarationen sind zugeordnet. Drei x86-ABI-Datensätze und 64 Verträge
  bestehen.
- `code/win32/win_glimp.c`: 21/21 Symbole für Treiber-/PFD-/WGL-Kontext,
  Extensions, Swap, Gamma, Fullscreen, Aktivierung und Shutdown. Fünf
  unveränderte `GLW_CreatePFD`-Datensätze, 31 Verträge und der native
  `/W4 /WX`-WGL-Lifecycle bestehen.

Auf dem zusammengeführten Stand bestehen außerdem der Windows-Hauptbuild, 20
CGame-Renderer-Verträge, 25 spielbare Matchverträge, der q3dm1-Kollisionstest,
der produktive Runtime-Trace und der gekoppelte acht Frames lange
Retail-QVM-Match. Dieser meldet 131 Entities, 2.345 texturierte Dreiecke, 17
Renderpässe, 26 Sounds und null nicht unterstützte Entities. Der Hauptbuild
hat SHA-256 `a12ebd354db1d62f006d80a70ef9d6c453eef44bc191d46a0d6ddcbddf183697`.
Die letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf;
die vier neuen Vollständigkeitsgates sind zusätzlich in `scripts/verify.py`
registriert.

Das Inventar zählt jetzt **200 portierte, 19 teilweise portierte und 116 noch
nicht begonnene** Dateien von insgesamt 335.

## 2026-10-23: Gemeinsame ABI und vollständiger Windows-Host geschlossen

Fünf weitere partielle Originaldateien sind vollständig nativ zugeordnet:

- `code/game/q_shared.h`: alle 19 Funktionskandidaten, 18 ABI-Typen und 16
  Protokollkonstanten. Vier unveränderte-C-Datensätze und zwölf Verträge prüfen
  Endian-, Vektor- und portable PowerPC-Intrinsic-Semantik sowie die Größen von
  `playerState_t`, `entityState_t` und `usercmd_t`.
- `code/win32/win_main.c`: alle 33 echten Funktionen für Eventqueue,
  Verzeichnisse, Dateilisten, DLLs, Streamthread, Zwischenablage, Fehler-/Quit-
  Lifecycle und `WinMain`. Acht unveränderte-C-Datensätze, 22 MiniLang- und
  zwölf native `/W4 /WX`-Verträge bestehen. Der frühere Kandidat `systems` war
  nur ein Kommentarwort und wurde aus dem Inventar entfernt.
- `code/win32/win_net.c`: alle 21 Funktionen für Winsock 2.2, IPv4/DNS, UDP,
  Broadcast, Select, lokale Interfaces, Portsuche, LAN-Erkennung und SOCKS5
  einschließlich UDP-Relay. Vier unveränderte-C-, 34 vollständige und 13 echte
  UDP-Verträge bestehen; AF_IPX meldet auf aktuellem Windows deterministisch
  nicht verfügbar.
- `code/win32/win_shared.c`: alle zwölf Funktionen für Timer, Pfade, Benutzer,
  CPU-Featureklassifikation, `fastftol` und `Sys_SnapVector`. Sechs
  unveränderte-C-Datensätze, 14 MiniLang- und native Hostverträge bestehen.
- `code/win32/win_wndproc.c`: alle fünf Funktionen für `MapKey`, Aktivierung,
  Alt-Tab und `MainWndProc`. Neun unveränderte-C-Datensätze, 14 MiniLang- und
  native Fensterverträge bestehen.

Der frische Windows-Hauptbuild, die fünf neuen Vollständigkeitsgates sowie
Input-, UDP-, Localhost-Handshake-, Netzwerk-Match- und spielbare
Matchregressionen sind grün. Der gekoppelte Retail-QVM-Match läuft acht Frames
mit 131 Entities, 13 Snapshot-Entities, 2.345 vollständig texturierten
Dreiecken, 17 Renderpässen, 26 Sounds und null nicht unterstützten Entities.
`build/MiniQuake3.exe` hat SHA-256
`fe2130bfa759a1bd141c27cce7d596dbd55ecc204f0292adc874ceca45c4380a`. Die
letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf; die
fünf neuen Gates sind zusätzlich in `scripts/verify.py` registriert.

Das Inventar zählt jetzt **205 portierte, 14 teilweise portierte und 116 noch
nicht begonnene** Dateien von insgesamt 335.

## 2026-10-23: Archive, Botaktionen und AAS-Bewegung geschlossen

Vier weitere partielle Originaldateien sind vollständig nativ zugeordnet:

- `code/qcommon/unzip.c`: 48/48 Inventarkandidaten. 41 gehören zum aktiven
  Minizip-/DEFLATE-Pfad; sieben stammen aus Kommentaren oder deaktiviertem
  zlib-Code und besitzen ebenfalls kompatible Fassaden. Stateful Navigation,
  Metadaten, Kommentare, Extra-Felder, SFX-Präfixe, Chunk-Lesen, Cursor,
  Reopen, Headerkohärenz und der begrenzte RFC1951-Decoder laufen. Vier
  unveränderte-C-Datensätze, 23 Verträge und 84 Retail-Archivfälle bestehen.
- `code/botlib/be_ea.c`: alle 32 Elementaraktionen einschließlich Setup,
  Shutdown, Chat-, Item-/Inventarbefehlen, Eingabelatches, Sicht, Bewegung,
  Waffenwahl und Reset. 17 unveränderte-C-Datensätze, elf Verträge und zwölf
  Retail-`qagame.qvm`-Botlib-Verträge bestehen.
- `code/botlib/be_aas_bspq3.c`: alle 21 BSP-/AAS-Brückensymbole mit
  originalgetreuen, einsbasierten BSP-Entitäten, `worldspawn=1`, Epair-Abfragen,
  Modellgrenzen und Point-Contents. Sieben unveränderte-C-Datensätze, 17
  Verträge und eine q3dm1-Probe mit 161 Entitäten und sechs Deathmatch-Spawns
  bestehen.
- `code/botlib/be_aas_move.c`: alle 19 Symbole für Einstellungen, Boden-,
  Wasser- und Leiterabfragen, Bounding-Box-Kollision, Reibung/Beschleunigung,
  Waffen-/Sprungbahnen und vollständige Client-Bewegungsvorhersage. Fünf
  unveränderte-C-Szenarien mit 17 exakten Beobachtungen, 16 neue sowie zwölf
  bestehende Bewegungskontrakte bestehen.

Der sequentielle Windows-Hauptbuild, Archiv-/Filesystem-, Elementary-Action-,
AAS-Syscall- und Bewegungsregressionen sind grün. Der gekoppelte Retail-QVM-Match
läuft acht Frames mit 131 Entities, 13 Snapshot-Entities, 2.345 vollständig
texturierten Dreiecken, 17 Renderpässen, 26 Sounds und null nicht unterstützten
Entities. `build/MiniQuake3.exe` hat SHA-256
`93b20aad754c6f7e16cdcad74c1a98238534e549b5f7ed884bb367c334b6d49b`. Die
letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf; die
vier neuen Vollständigkeitsgates sind zusätzlich in `scripts/verify.py`
registriert.

Das Inventar zählt jetzt **209 portierte, 10 teilweise portierte und 116 noch
nicht begonnene** Dateien von insgesamt 335.

## 2026-10-23: Öffentliche Spiel-ABI und AAS-/Botlib-Kern geschlossen

Neun weitere partielle Originaldateien sind vollständig nativ zugeordnet:

- `code/qcommon/qfiles.h`, `code/game/g_public.h` und
  `code/game/bg_public.h`: 32 Dateiformattypen und 54 Konstanten, 194
  Game-Import-/Export-Ordinalen mit elf Serverflags sowie 405 gemeinsame
  Spielkonstanten, 20 Typen und zehn öffentliche BG-Funktionen. Die produktiven
  BSP-, QVM-, Server-, Snapshot-, Pmove- und Entitystate-Pfade verwenden diese
  gemeinsamen Definitionen.
- `code/botlib/aasfile.h` und `code/botlib/be_aas_file.c`: 72 Konstanten,
  16 ABI-Layouts und alle acht Dateifunktionen. Alle 30 Retail-AAS-Dateien
  durchlaufen einen verlustfreien v5-Roundtrip mit 59.580.980 Bytes und
  6.235.985 Datensätzen.
- `code/botlib/be_aas_entity.c` und `code/botlib/be_aas_main.c`: alle 15
  Entity- und 17 Lifecycle-/Indexsymbole. Die q3dm1-Retailprobe umfasst 1.933
  Areas und 2.029 Reachabilities; der Retail-`qagame.qvm`-Lifecycle besteht.
- `code/botlib/be_ai_char.c` und `code/botlib/be_ai_weap.c`: alle 19
  Charakter- und 14 Waffensymbole. Unveränderte C-Orakel, Retail-Sarge-
  Charakterwerte, Waffenweights, Projektilzuordnung und das 552-Byte-
  `weaponinfo_t`-ABI stimmen mit dem Original überein.

Die neun Vollständigkeitsgates, 404 QVM-Interpreterfälle, der vollständige
Retail-Spielübergangslauf, der Windows-Hauptbuild und der gekoppelte acht Frames
lange Retail-QVM-Match sind grün. Das Match meldet 131 Entities, 13
Snapshot-Entities, 2.345 vollständig texturierte Dreiecke, 17 Renderpässe, 26
Sounds und null nicht unterstützte Entities. `build/MiniQuake3.exe` hat SHA-256
`fbdeed15fe92ec2fc5292ad20c2f9009974c9de52632b7b2caa625a4e53f133a`. Die
letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf; die
neun neuen Gates sind in `scripts/verify.py` registriert.

Das Inventar zählt jetzt **218 portierte, eine teilweise portierte und 116 noch
nicht begonnene** Dateien von insgesamt 335. Die einzige verbleibende partielle
Datei ist `code/game/g_local.h`.

## 2026-10-23: Spiel-, CGame-, Renderer- und Q3UI-Header geschlossen

Elf weitere Originalheader sind vollständig nativ zugeordnet:

- `code/game/g_local.h`: 43 Konstanten und Enumwerte, elf Typen, 328
  Deklarationen und 152 Recordfelder. `gentity_t`, `gclient_t`,
  `level_locals_t`, Session-, Team- und Botzustände sowie alle lokalen Spiel-
  und Trapdeklarationen besitzen eine produktive Fassade. Bodyqueue- und
  Spawnlimits verwenden sie im laufenden Spielpfad.
- `code/cgame/cg_public.h` und `code/cgame/tr_types.h`: 157 Konstanten und
  Enumwerte sowie 13 ABI-Typen für Snapshot, CGame-Import/-Export, Szene,
  Renderer, Modelle, Polys, Fonts, Refdefs und GL-Konfiguration. CGame-VM und
  Scene-Queue verwenden die zentralen Definitionen.
- `code/q3_ui/keycodes.h` und `code/q3_ui/ui_local.h`: 155 Defines und
  Keycodes, 16 Typen, 226 Funktionen und 79 Globals. QMenu und die produktive
  Retail-UI-Eingabesitzung verwenden die gemeinsame UI-ABI. Die echte
  `ui.qvm`-Probe besteht Start, Navigation, Ingame-Menü sowie Key-, Char- und
  Mausereignisse.
- `code/game/surfaceflags.h`, `inv.h`, `chars.h`, `syn.h`, `match.h` und
  `g_team.h`: 332 numerische Makros, das Match-Escapezeichen und 17 öffentliche
  Teamfunktionen. Die kanonischen Definitionen sind in 19 produktive
  Gameplay-, Bot-, Bewegungs-, Treffer-, Trigger- und Teamdateien eingebunden.
  Dabei wurden sechs falsche Bot-Charakterindizes korrigiert: Angriff,
  Springen, Ducken, Weapon-Jumping, View-Faktor und maximale Sichtänderung.

Die sechs gebündelten Vollständigkeitsgates bestehen unveränderte 32-Bit-C-
Orakel, Layout-/Offsetprüfungen und 68 neue Verträge. Zusätzlich sind der
Windows-Hauptbuild, der vollständige Retail-Bodies-Sweep über alle Karten, 95
Lifecycle-Szenarien mit 378.562.214 exakten Wörtern, 71
Initialisierungsszenarien und der acht Frames lange Retail-QVM-Match grün. Der
Match meldet 131 Entities, 13 Snapshot-Entities, 2.345 vollständig texturierte
Dreiecke, 17 Renderpässe, 26 Sounds und null nicht unterstützte Entities.
`build/MiniQuake3.exe` hat SHA-256
`09fae7e3b6520315f73e533e7f92d2eac96b8f828ff6f0cf404fe2134d91e040`.
Die letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf;
die normale Retail-Auswahl in `scripts/verify.py` umfasst inzwischen 483 Gates.

Das generierte Inventar zählt nun **229 portierte, keine teilweise portierte
und 106 noch nicht begonnene** Dateien von insgesamt 335. Die verbleibenden
Quellportlücken liegen vor allem in Botlib-/AAS-Interna, Renderer-Backends,
Client-/QCommon-Resten sowie Unix-, macOS-, Null- und weiteren Plattformpfaden.

## 2026-10-23: Lokale CGame-, Client-, Sound-, Renderer- und Spiel-AI-Header geschlossen

Fünfzehn weitere Originalheader sind vollständig nativ zugeordnet:

- `code/cgame/cg_local.h`: 47 Defines, 37 Enumwerte, 21 Typen mit 600
  Feldern, 243 Funktionen und 114 Globals. 47 unveränderte x86-ABI-Datensätze
  und 15 Verträge bestehen. Neun produktive CGame-Module verwenden die
  Fassade. Dabei wurden die Local-Entity-Ordinalwerte, `LAND_DEFLECT_TIME`
  und das originale Mark-Polygonlimit korrigiert.
- `code/client/client.h`, `snd_local.h` und `snd_public.h`: 17 Typen, 135
  Deklarationen und 62 Externs. 166 unveränderte Win32-x86-ABI-Datensätze, 20
  Verträge und 575 Retail-Sounds bestehen. Client-Retransmit, Soundkanäle und
  QVM-Audiowiedergabe verwenden die gemeinsamen Definitionen.
- `code/renderer/tr_public.h`, `tr_local.h`, `qgl.h` und `qgl_linked.h`: 377
  GL-/WGL-/GLX-/fxMesa-Einstiegspunkte, 334 QGL-Aliase, 73 Makros, 111
  Enumwerte, 61 lokale Typen, 159 Funktionen und 98 Globals. Das x86-C-Orakel,
  24 Verträge, Retail-QVM-/BSP-Proben sowie die `tr_init`-, Backend- und
  WinGL-Regressionen bestehen.
- `code/game/ai_chat.h`, `ai_cmd.h`, `ai_dmnet.h`, `ai_dmq3.h`, `ai_main.h`,
  `ai_team.h` und `ai_vcmd.h`: 55 Konstanten, drei Typen, 135 Deklarationen,
  16 Globals und 163 Recordfelder. Das unveränderte C-Orakel und 16 Verträge
  bestehen. Die produktiven Kampf-, Navigation- und Team-Module verwenden die
  Originalwerte; falsche Werte für `BFL_STRAFERIGHT`, `PATROL_BACK`,
  `TEAMTP_DEFENDER` und `TEAMTP_ATTACKER` wurden behoben.

Alle vier neuen Vollständigkeitsgates sowie die zugehörigen CGame-, Client-,
Audio-, Renderer-, Botkommando-, Botnavigation-, Botkampf- und Retail-
Botspawnregressionen sind grün. Der sequentielle Windows-Hauptbuild besteht.
Der gekoppelte acht Frames lange Retail-QVM-Match meldet 131 Entities, 13
Snapshot-Entities, 2.345 vollständig texturierte Dreiecke, 17 Renderpässe, 26
Sounds und null nicht unterstützte Entities. `build/MiniQuake3.exe` hat
SHA-256 `0d8bd3f87329040466737976a342c08c74950093c904ada5904efb03f6489df0`.
Die letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf;
die normale Retail-Auswahl in `scripts/verify.py` umfasst inzwischen 487 Gates.

Das generierte Inventar zählt nun **244 portierte, keine teilweise portierte
und 91 noch nicht begonnene** Dateien von insgesamt 335. Die verbleibenden
Quellportlücken liegen vor allem in Botlib-/AAS-Interna, QCommon-Resten,
Plattformpfaden sowie sechs UI- und einem CGame-Build-/Syscall-Header.

## 2026-10-23: Botlib-, QCommon- und interne Spielheader geschlossen

Vier gebündelte Vollständigkeitspakete schließen 40 weitere Originalheader:

- Die neun öffentlichen Botlib-Header von `be_aas.h` bis `botlib.h` besitzen
  nun eine produktive Fassade mit 156 Konstanten, 25 Typen, 113 Deklarationen
  und 333 Structfeldern. 181 unveränderte C-Orakelrecords, 20 Verträge,
  q3dm1-Routing, Sarge-Retail-Chat, 134/134 Botlib-Exporte und 73
  Move-Runtime-Verträge bestehen. `TFL_DEFAULT` enthält wieder das originale
  `TFL_ELEVATOR`-Bit und hat den Wert `0x011c0fbe`.
- Alle 22 internen Botlib-Header sind mit 119 Makros, 110 auswertbaren
  Konstanten, 25 Typen, 227 Deklarationen, fünf Globals, 236 Feldern und 25
  MSVC-x86-ABI-Größen erfasst. 23 Verträge und der Retail-Corpus über 30
  AAS-Dateien, 96.758 Areas und 125.731 Reachabilities bestehen. Die
  `INDENT_*`-Werte verwenden wieder die Bitmasken 1/2/4/8/16;
  `MAX_EPAIRKEY` wurde von 144 auf den Originalwert 128 korrigiert. Die im
  Original nur deklarierten, aber nirgends definierten oder aufgerufenen
  Einstiege `AAS_PrintFreeBSPLinks` und `AAS_AreasConnected` bleiben als
  ausdrücklich getestete, inerte ABI-Kompatibilitätseinstiege erhalten.
- `cm_local.h`, `cm_patch.h`, `cm_polylib.h`, `cm_public.h`, `qcommon.h` und
  `unzip.h` sind mit 75 Makros, 46 Enumwerten, 45 Typen, 343 Funktionen, 32
  Globals und 222 Feldern vollständig zugeordnet. 44 unveränderte x86-ABI-
  Records, 18 Verträge, 113 Retail-Patches und 84 Retail-Archive bestehen. Die
  öffentlichen `CM_ClipHandleToModel`- und `CM_ModelBounds`-Pfade lehnen das
  interne `CAPSULE_MODEL_HANDLE` nun wie `cm_load.c` ab; internes
  Capsule-Tracing bleibt unverändert funktionsfähig.
- `bg_lib.h`, `bg_local.h` und `g_rankings.h` sind über 17 Makros, drei Typen,
  36 Deklarationen, 14 Globals, zwölf `pml_t`-Felder und alle 257 Baseq3- und
  Missionpack-Rankingschlüssel abgedeckt. Das unveränderte C-Orakel, 16
  Headerverträge, die vollständige `bg_lib`-Regression, Retail-Pmove über vier
  Karten mit je 256 Befehlen und der Ranking-Subsystemtest sind grün.

Alle vier neuen Gates wurden zusammen erneut ausgeführt. Der sequentielle
Windows-Hauptbuild und der gekoppelte acht Frames lange Retail-QVM-Match
bestehen ebenfalls. Der Match meldet 131 Entities, 13 Snapshot-Entities, 2.345
vollständig texturierte Dreiecke, 17 Renderpässe, 26 Sounds und null nicht
unterstützte Entities. `build/MiniQuake3.exe` hat SHA-256
`d327538fdd7d8a194e486cd0b3458028eea8e158fba18bcca121cf77944cf941`.
Die letzte vollständige Gesamtauswahl bleibt der dokumentierte 449-Gate-Lauf;
die normale Retail-Auswahl in `scripts/verify.py` umfasst inzwischen 491 Gates.

Das generierte Inventar zählt nun **284 portierte, keine teilweise portierte
und 51 noch nicht begonnene** Dateien von insgesamt 335. Botlib ist mit 53/53
Dateien vollständig; QCommon steht bei 24/27 und Spielcode bei 64/65. Die
verbleibenden Quellportlücken konzentrieren sich auf drei QCommon-JIT-Dateien,
einen CGame- und einen Game-Build-/Syscall-Pfad, sechs UI-Dateien sowie
Unix-, macOS-, Null- und vier Windows-Plattformpfade.

## 2026-10-31: Win32-Header und vollständiger QGL-Lader geschlossen

Die letzten vier offenen Windows-Dateien `code/win32/glw_win.h`,
`win_local.h`, `resource.h` und `win_qgl.c` sind vollständig nativ zugeordnet.
`win_headers.ml` bewahrt Feldreihenfolge, x86-Größen und Offsets von
`glwstate_t` und `WinVars_t`, beide DirectX-Versionswerte, zwölf
Ressourcenmakros und alle 17 lokalen Funktionsdeklarationen. Ein unverändertes
MSVC-x86-Orakel vergleicht die vollständigen Layout- und Konstantenrecords.

`win_qgl_runtime.ml` besitzt den DLL-/Registry-Lebenszyklus, verzögert die acht
Erweiterungseinstiege bis zur Extension-Erkennung, bildet die sechs originalen
Formathelfer ab und projiziert sämtliche **336** `log*`-Wrapper verlustfrei auf
das bereits vollständige QGL-Einstiegspunktinventar. Das Hilfsorakel wird aus
den unveränderten Originalfunktionen extrahiert; 13 zusätzliche Verträge
prüfen Fehlerpfad, vollständige Core-/WGL-Bindung, Logging-Countdown,
Dispatch, Extension-Sperre und Shutdown. `win_glimp_runtime.ml` verwendet den
neuen Loader und den kanonischen GLW-Zustand im Start- und Abschaltpfad.

Das neue Vollständigkeitsgate, der vorhandene 21/21-`win_glimp`-Abgleich mit
31 Verträgen, der `/W4 /WX`-WGL-Build und der frische Windows-Hauptbuild sind
grün. `build/MiniQuake3.exe` hat SHA-256
`d327538fdd7d8a194e486cd0b3458028eea8e158fba18bcca121cf77944cf941`.
Der Retail-QVM-Match konnte in diesem inkrementellen Lauf nicht erneut starten,
weil das zuvor verwendete Laufwerk `D:` nicht mehr eingebunden war; der letzte
dokumentierte Retail-Lauf desselben Binärhashes bleibt grün. Die normale
Retail-Auswahl in `scripts/verify.py` umfasst jetzt 492 Gates.

Das generierte Inventar zählt **288 portierte, keine teilweise portierte und
47 noch nicht begonnene** Dateien von insgesamt 335, also 86,0 % native
Dateiparität. Win32 ist mit 13/13 vollständig. Offen bleiben drei
QCommon-JIT-Dateien, je ein CGame- und Game-Syscall-/Buildpfad, sechs
Legacy-UI-Dateien sowie Unix-, macOS-, Null- und Spline-Plattformpfade.

## 2026-10-31: Legacy-Missionpack-UI-ABI vollständig geschlossen

Die sechs noch offenen Dateien unter `code/ui` sind nativ zugeordnet:
`keycodes.h`, `ui_local.h`, `ui_public.h`, `ui_shared.h`, `ui_syscalls.asm`
und die absichtlich codefreie `ui_util.c`. Die neue kanonische Fassade
`ui_legacy_abi.ml` enthält vollständige, direkt aus den Originalen abgeglichene
Inventare für 112 Tastencodes, 97 UI-Imports, Menü-/Export-/Sortordinalen,
Header-Defines, Typen, Deklarationen und Globals. Alle 97 Assembly-Einstiege
bewahren ihre exakten QVM-Ordinalen von -1 bis -88 beziehungsweise -101 bis
-109. Der bislang fehlende öffentliche Kompatibilitätseintrag
`UI_CM_LOADMODEL=30` ist in der nativen Syscall-Fassade ergänzt.

Das neue Gate vergleicht alle Inventare bei jedem Lauf erneut mit den sechs
unveränderten Originaldateien. Zwölf ausführbare Verträge prüfen API-Version,
3.084-Byte-ClientState-ABI, Menü-/Export-/Sortwerte, Import- und
Assemblyordinalen sowie die vollständigen Headeroberflächen. Das Gate und der
MiniLang-Build sind grün. Ein erneuter Retail-Assetlauf ist weiterhin nicht
möglich, weil Laufwerk `D:` nicht eingebunden ist.

Das generierte Inventar zählt damit **294 portierte, keine teilweise portierte
und 41 noch nicht begonnene** Dateien von insgesamt 335, also 87,8 % native
Dateiparität. Der Legacy-UI-Bereich steht bei 12/12; `scripts/verify.py`
enthält nun 493 Gates. Die verbleibenden Lücken sind drei QCommon-JIT-Dateien,
je ein CGame- und Game-Syscall-/Buildpfad sowie Unix-, macOS-, Null- und
Spline-Plattformcode.

## 2026-10-31: CGame- und QAGame-QVM-Assembly-ABI geschlossen

Die letzten beiden offenen Spielmoduldateien `code/cgame/cg_syscalls.asm`
und `code/game/g_syscalls.asm` sind vollständig nativ zugeordnet. Die neue
Fassade `qvm_assembly_abi.ml` bewahrt alle **102 CGame-** und **194
QAGame-Imports** in Originalreihenfolge mit ihren exakten negativen
q3asm-Ordinalen. Die historische doppelte Ordinale `-546` für
`trap_BotFreeItemWeights` und `trap_BotSaveGoalFuzzyLogic` bleibt
absichtlich unverändert.

Das Vollständigkeitsgate gleicht Namen und Ordinalen bei jedem Lauf mit den
unveränderten ASM-Dateien ab, verlangt produktive MiniLang-Wrapper für jeden
Laufzeit-Trap und führt zehn ABI-Verträge aus. Nur fünf im Original
assembly-only deklarierte Kompatibilitätseinstiege werden ausdrücklich als
solche geführt; die produktiven CGame-/QAGame-Wrapper und VM-Dispatcher
besitzen die eigentliche Laufzeitimplementierung. Gate, Verträge sowie die
vorhandenen CGame- und Game-Syscallregressionen sind grün.
Der sequentielle Windows-Hauptbuild ist ebenfalls grün;
`build/MiniQuake3.exe` hat unverändert SHA-256
`d327538fdd7d8a194e486cd0b3458028eea8e158fba18bcca121cf77944cf941`.

Das generierte Inventar zählt nun **296 portierte, keine teilweise portierte
und 39 noch nicht begonnene** Dateien von insgesamt 335, also **88,4 %**
native Dateiparität. CGame steht bei 25/25, Game bei 65/65 und
`scripts/verify.py` enthält 494 Gates. Ein erneuter Retail-Assetlauf bleibt
in diesem inkrementellen Lauf aus, weil Laufwerk `D:` nicht eingebunden ist.
Offen sind ausschließlich drei QCommon-JIT-, acht Spline- sowie
Unix-, macOS- und Null-Plattformdateien.

## 2026-10-31: Architektur-QVM-Compiler vollständig zugeordnet

Die drei letzten QCommon-Lücken `vm_x86.c`, `vm_ppc.c` und `vm_ppc_new.c`
sind über `jit_compat.ml` und den produktiven `vm/runtime.ml`-Lifecycle
geschlossen. Alle **47 inventarisierten Symbole** sind abgebildet, darunter
`VM_Compile`, `VM_CallCompiled`, x86-Byteemitter und -Peepholes sowie die alten
und neuen PPC-Instruktions- und Operand-Stackhelfer.

Der MiniLang-Pfad bewahrt die beobachtbare QVM-Semantik, vollständige
Decode-/Branchvalidierung, Instruction-Pointer-Tabelle, Compiled-Aufruf,
Syscallgrenze und Restart-Datenerhalt. Er emittiert bewusst keinen
architekturspezifischen Code in beschreibbaren ausführbaren Speicher, sondern
verwendet einen speichersicheren vorab dekodierten Plan. Diese portable
Entsprechung ist im Ledger ausdrücklich dokumentiert und gilt für x86, beide
PPC-Varianten und den Windows-x64-Host.

Das neue Gate vergleicht die drei Symboloberflächen, baut eine synthetische
QVM und führt 14 Verträge für Little-Endian-Emitter, PPC-Bitfelder,
Konstantendekodierung, Instruction-Pointer, Compiled-Aufruf und Fehlerpfade
aus. Das Gate sowie die 17 VM-Runtime- und 31 vollständigen VM-Verträge sind
grün. Der sequentielle Windows-Hauptbuild besteht ebenfalls;
`build/MiniQuake3.exe` hat SHA-256
`a31aa0ea0ec797e34ae6245d357e5b6506302e70fc6212ea79a5266dd855d72d`.

Das Inventar zählt nun **299 portierte, keine teilweise portierte und 36 noch
nicht begonnene** Dateien von 335, also **89,3 %** native Dateiparität.
QCommon steht bei 27/27; `scripts/verify.py` enthält 495 Gates. Laufwerk `D:`
ist weiterhin nicht eingebunden, daher war kein neuer Retail-Assetlauf
möglich. Die verbleibenden Quelllücken sind acht Spline-, 13 Unix-, acht
macOS- und sieben Null-Plattformdateien.

## 2026-10-31: Öffentliche Spline-Laufzeitoberfläche geschlossen

Die acht im Runtime-Inventar geführten Spline-Header `math_angles.h`,
`math_matrix.h`, `math_quaternion.h`, `math_vector.h`, `q_shared.h`,
`splines.h`, `util_list.h` und `util_str.h` sind nativ zugeordnet. Die neue
Fassade `mq3.splines.headers` bildet alle **50 inventarisierten Symbole** ab
und implementiert die produktiven Daten- und Rechenpfade für Vektoren,
Winkel, Quaternionen, 3x3-Matrizen, Bounds, Listen und Strings.

Zwanzig ausführbare Verträge prüfen Länge und Normalisierung, Skalar- und
Kreuzprodukt, Interpolation, Winkel-/Achsenkonvertierung, Quaternionen,
Identitäts-, Schief- und orthonormalisierte Matrizen, Bounds-Wachstum und
-Schnitt, Granularitätswachstum, eindeutiges Einfügen, Sortieren, Entfernen
und ASCII-Stringoperationen. Das neue Vollständigkeitsgate vergleicht die
acht Symbolinventare bei jedem Lauf mit dem Ledger; Gate und Windows-
Hauptbuild sind grün. Das eigenständige historische C++-Spline-Editorwerkzeug
ist kein Bestandteil des spielbaren Windows-Runtimepfads und wird nicht als
Gameplay-Abdeckung ausgegeben.
Der Hauptbuild bleibt binär unverändert bei SHA-256
`a31aa0ea0ec797e34ae6245d357e5b6506302e70fc6212ea79a5266dd855d72d`.

Das generierte Runtime-/Plattforminventar zählt **307 portierte, keine
teilweise portierte und 28 noch nicht begonnene** Dateien von 335, also
**91,6 %**. `splines` steht bei 8/8 und `scripts/verify.py` bei 496 Gates.
Im gezählten Inventar bleiben ausschließlich acht macOS-, sieben Null- und
13 Unix-Plattformdateien offen. Laufwerk `D:` ist weiterhin nicht
eingebunden; eine neue Retail-Assetabnahme war daher nicht möglich.

## 2026-10-31: Headless-/Null-Plattform vollständig geschlossen

Alle sieben Dateien unter `code/null` sind nativ zugeordnet: beide
Loopback-Netzwerkvarianten, Null-Client, Null-GL, Null-Eingabe, Null-System und
Null-Audio. `null_runtime.ml` besitzt alle **64 inventarisierten Symbole** mit
den Originalrückgaben und -Nebenwirkungen: Client-/Input-/GL-Lifecycle,
erfolglose Game-/UI-Kommandos, immer gültige Null-CD-Keys, Loopback-only-
Adressauflösung, keine eingehenden Pakete, deaktiviertes DMA, Soundhandle null,
stabile Systemnullwerte und inerte Datei-/DLL-Einstiege.

Für sichere automatisierte Nutzung ersetzt der Port den endlosen C-`main`-
Loop durch eine begrenzte Headless-Frame-Schleife; `Sys_Error` liefert einen
auswertbaren Fehler und `Sys_Quit` einen überprüfbaren Quit-Zustand, statt den
Testprozess abzuschießen. Zwanzig Verträge prüfen alle Oberflächen sowie
Client, GL, Eingabe, Loopback-Pakete, Audio, Systemwerte, Frames, Quit und
Fehler. Vollständigkeitsgate, Windows-Hauptbuild und Inventarprüfung sind grün.
Der Hauptbuild bleibt bei SHA-256
`a31aa0ea0ec797e34ae6245d357e5b6506302e70fc6212ea79a5266dd855d72d`.

Das Inventar zählt jetzt **314 portierte, keine teilweise portierte und 21
noch nicht begonnene** Dateien von 335, also **93,7 %**. `null` steht bei 7/7
und `scripts/verify.py` bei 497 Gates. Offen sind nur noch 13 Unix- und acht
macOS-Plattformdateien. Laufwerk `D:` ist weiterhin nicht eingebunden; ein
neuer Retail-Assetlauf bleibt daher aus.

## 2026-10-31: Unix-Plattform vollständig geschlossen

Alle 13 im Runtime-Inventar gezählten Dateien unter `code/unix` sind nativ
zugeordnet. `unix_runtime.ml` besitzt die vollständige Oberfläche aus
`linux_common.c`, `linux_glimp.c`, `linux_joystick.c`, `linux_local.h`,
`linux_qgl.c`, `linux_signals.c`, `linux_snd.c`, `qasm.h`, `unix_glw.h`,
`unix_main.c`, `unix_net.c`, `unix_shared.c` und `vm_x86.c`. Damit sind alle
**471 inventarisierten Symbole** erfasst: Speicherhelfer, X11/GL-Lifecycle,
QGL-Laden und -Logging, Eingabe und Joystick, Signale, DMA-Audio,
Konsolenhistorie, Systemereignisse, UDP-Adressen und -Pakete, Pfade und Zeit
sowie der x86-QVM-Compile-/Call-Lifecycle.

Der Port bildet die beobachtbare Unix-Semantik portabel und deterministisch
ab. Direkte POSIX-, X11-, OpenGL- und Socket-Hostaufrufe sind auf Windows nicht
aktiv und bleiben eine ausdrücklich dokumentierte Hostadaptergrenze; sie
werden nicht als produktive Windows-Treiber ausgegeben. Der QVM-Pfad delegiert
an den bereits geprüften speichersicheren Decoded-Plan-Compiler. Das neue Gate
vergleicht jede Symboloberfläche exakt mit dem Ledger, baut eine synthetische
QVM und führt **28 Verträge** für Speicher, GL/QGL, Eingabe, Signale, DMA,
Historie, Events, Adressen, LAN-Erkennung, Pakete, Pfade, Systemwerte,
Numerik, QVM-Aufrufe und die begrenzte Unix-Hauptschleife aus.

Vollständigkeitsgate, Inventarprüfung und der sequentielle Windows-Hauptbuild
sind grün. Da die neue Unix-Fassade nicht in den Windows-Hostpfad eingebunden
ist, bleibt `build/MiniQuake3.exe` binär unverändert bei SHA-256
`a31aa0ea0ec797e34ae6245d357e5b6506302e70fc6212ea79a5266dd855d72d`.
Das Inventar zählt jetzt
**327 portierte, keine teilweise portierte und acht noch nicht begonnene**
Dateien von 335, also **97,6 %** native Dateiparität. `unix` steht bei 13/13
und `scripts/verify.py` bei 498 Gates. Offen sind ausschließlich acht
macOS-Plattformdateien. Laufwerk `D:` ist weiterhin nicht eingebunden; ein
neuer Retail-Assetlauf war deshalb nicht möglich.

## 2026-10-31: Retail-Datenträger wieder verfügbar und Collision-Grenzen gehärtet

`D:/Quake3/baseq3` ist wieder verfügbar. Die Abnahme verwendet die echten
Retailarchive `pak0.pk3` (479.493.658 Bytes) und `pak1.pk3` (10.782 Bytes).
Der sequentielle Lauf bestand den Engine-/Netzwerk-/Snapshot-/Game-Lifecycle,
alle 31 Retail-BSP-Patch-, Facet- und Bevelvergleiche, 4.096 Brush- und 4.096
unveränderte C-Tracefälle, die vollständige 32-teilige Bot-Suite mit 30
Retail-AAS-Dateien und 145 Botdateien sowie die folgenden Gameplay-, Client-,
Waffen-, Vote-, Header-, QCommon-, Renderer-, Audio-, PK3- und Dateisystemgates.
Der restliche unveränderte 498-Gate-Satz wurde in diesem inkrementellen Block
nicht erneut vollständig bis zum Ende ausgeführt; die betroffenen Fokusgates
und der native Hauptbuild sind grün.

Die Abnahme deckte zwei konkrete Fehler auf. Erstens dürfen BSP-Submodelle die
reservierten Handles 254/255 nicht überschatten; der Loader verwirft solche
malformierten Modelltabellen nun an der Vertrauensgrenze. Zweitens speichert
der temporäre Collision-Hull explizit, ob `CM_TempBoxModel` ein Capsule-Modell
initialisiert hat. Dadurch wird ein nacktes Handle 254 sicher abgelehnt,
während Capsule-gegen-Capsule und der originale reziproke
Box-gegen-Capsule-Pfad nach Initialisierung vollständig funktionieren.
`test_rejections.py` besteht 115 Negativfälle, `test_cm_trace_complete.py`
4.096 C-Differenzfälle plus alle Capsule-Verträge und
`test_cm_load_complete.py` die Retail-q3dm1-Ladeverträge.

Ein unabhängiger Namenskonflikt im BotAI-Vertrag wurde ebenfalls beseitigt;
das direkte C-Orakel und alle 30 BotAI-Kommando-/Statusverträge bestehen.
`scripts/verify.py --start-at <gate.py>` erlaubt nun, lange Retail-Läufe nach
einem behobenen Gate deterministisch fortzusetzen. Inventarprüfung und
Python-Syntaxprüfung sind grün. Der frisch gebaute
`build/MiniQuake3.exe`-Stand hat SHA-256
`08b5b6bc75d2a66688b2e7265dd2e952f710e8d0740ab4a932e3218d96eacd80`.

## 2026-10-31: Gezählte macOS-Header und Dateiinventar vollständig

Die letzten acht im Runtime-/Plattforminventar offenen Dateien sind nativ
zugeordnet: `CGMouseDeltaFix.h`, `CGPrivateAPI.h`, `Q3Controller.h`,
`macosx_display.h`, `macosx_glimp.h`, `macosx_local.h`, `macosx_qgl.h` und
`macosx_timers.h`. Die portable Fassade `mq3.platform.macosx_headers` bildet
Mouse-Delta-Zustand, die private Event-ABI, Controller-Lifecycle,
Displayauswahl, Gamma und Fades, Input und Systemevents, Fensterverbergen,
GL-Kontext und verschachteltes Pause/Resume sowie optionale Timer ab.

Die generierte QGL-Oberfläche besitzt alle **337 Originalnamen in exakter
Reihenfolge**. Die 334 bereits produktiv gebundenen GL-Aliase werden
wiederverwendet; `_glGetError`, `qglGetTexEnvfv` und `qglGetTexEnviv` schließen
die drei macOS-spezifischen Differenzen. Begin/End-Grenzen, verzögerte
Fehlerprüfung und Dispatchprotokoll sind ausführbar. Cocoa-, CoreGraphics- und
OmniTimer-Aufrufe bleiben auf dem Windows-Zielhost bewusst abstrahierte
Hostadapter und werden nicht als native macOS-Anwendung ausgegeben.

Das neue Vollständigkeitsgate vergleicht Ledger und QGL-Oberfläche und führt
**24 Verträge** aus. Inventarprüfung und der vollständige Original-/Portbericht
sind grün. Das generierte Inventar zählt nun **335 portierte, keine teilweise
portierte und keine nicht begonnene Datei von 335**, also **100 % native
Dateiparität**. `macosx` steht bei 8/8 und `scripts/verify.py` bei 499 normalen
Gates. Dies schließt die Datei-Warteschlange, ersetzt aber nicht die weiterhin
erforderliche spielbare Langzeit-, Netzwerk-, Renderer-, Audio-, UI- und
Performance-Abnahme für den übergeordneten 1:1-Anspruch.

## 2026-10-31: Produktiver Windows-Spielstart gegen Fehler 7481 gehärtet

Der reale `--play`-Start deckte eine Lücke auf, die der bisherige reine
C-Lifecycle nicht sehen konnte: Der eingefrorene MiniLang-Compiler übergab den
neunparametrigen, ausschließlich aus Zeiger- und Integerwerten bestehenden
`playable_window_gl_configure`-Aufruf fehlerhaft. Die native Funktion und der
WGL-Lifecycle waren grün, der produktive MiniLang-Pfad erhielt dennoch `0` und
brach vor der Fenstererzeugung mit Fehler 7481 ab.

Der Standardstart verwendet nun direkt die identischen nativen Standardwerte
24 Bit Farbe, 24 Bit Tiefe und 8 Bit Stencil, die `playable_window_create`
bereits setzt. Konfigurierbare Modi teilen Treiber, Pixelformat und
Displayeinstellungen auf drei Win64-ABI-sichere Aufrufe auf; der ursprüngliche
C-Einstieg bleibt kompatibel. Der native `/W4 /WX`-Test prüft beide Oberflächen.
Das neue Gate `test_playable_window_startup.py` kompiliert außerdem einen echten
MiniLang-Smoke, öffnet ein Win32-/WGL-Fenster, zeichnet den Ladebildschirm und
verlangt mindestens 100 nichtschwarze Pixel aus der synchronisierten tatsächlich
präsentierten Oberfläche, bevor es das Fenster sauber herunterfährt. Damit
wird neben dem früheren Startabbruch auch die bereits beobachtete
Schwarzbildregression automatisch erfasst.

Die native Fenster-, Eingabe-, Raster- und WGL-Suite, 14 FPS-Titel-Verträge und
56 Viewer-Verträge sind grün. Der vollständige Hauptbuild wurde danach mit
`D:/Quake3/baseq3/pak0.pk3` und `maps/q3dm1.bsp` über denselben `--play`-Befehl
wie `Play-MiniQuake3.cmd` gestartet; er blieb ohne Fehler offen und wurde nach
zehn Sekunden kontrolliert beendet. Der frische Hauptbuild hat SHA-256
`9673c22b577bab94c1d914bac6a47f20daaea5f0d1e4034d792b1b1389dd953d`.

## 2026-10-31: Strenger Funktionsabgleich und Original-QVM-Standardstart

Der bisherige 335/335-Dateizähler war kein belastbarer Beleg für vollständige
Parität: Nach der Bereinigung vier vollständig geprüfter Botlib-Zeilen enthalten
noch 57 als `ported` deklarierte Ledger-Zeilen gleichzeitig 939 nicht
zugeordnete Originalsymbole. `parity_inventory.py` berechnet den
effektiven Status nun unabhängig von dieser Deklaration und stuft jede solche
Datei zwingend auf `partial` zurück. Das Ergebnis lautet **278 vollständig
zugeordnete und 57 teilweise zugeordnete Dateien**. `be_interface.c`,
`l_crc.c`, `l_libvar.c` und `l_script.c` besitzen vollständige unveränderte-C-,
native und Retailnachweise; ihre Ledger-Zuordnungen decken nun das jeweilige
Symbolinventar ohne Schema-Mehrdeutigkeit ab. Der generierte
Markdownbericht wird auf Aktualität geprüft; ein neues Gate
verhindert, dass eine effektiv portierte Datei offene Symbole trägt.

Der vollständige beobachtbare Abgleich steht in
`docs/BEHAVIOR_PARITY_AUDIT.md`. Er trennt unveränderte Original-QVM-Logik von
den noch nicht vollständig identischen Engine-Traps und nennt für Start,
Menüs, Eingabe, Gameplay, Spieltypen, Bots, Netzwerk, Renderer, HUD, Audio,
Demos, Dateien und Plattform jeweils Originalquelle, Produktivpfad, Nachweis
und konkrete Restlücke. Danach ist MiniQuake3 ein spielbarer
Original-QVM-Integrationsstand, aber noch kein fertig abgenommener 1:1-Port.

`Play-MiniQuake3.cmd` startet deshalb nicht länger den eigenen vereinfachten
WASD-Vertical-Slice. Der Benutzerstandard baut bei Bedarf `qagame.qvm`,
`cgame.qvm` und `ui.qvm` und startet `--menu-qvm`. Zuerst läuft ausschließlich
das originale `ui.qvm` im getrennten Clientzustand; Regeln, Prediction, HUD
und Welt werden erst nach der Kartenauswahl aus den Originalmodulen geladen.
Das Gate `test_default_launcher.py` hält diesen Startpfad fest. Der alte
`--play`-Modus bleibt ausschließlich als Diagnoseoption erhalten.

## Getrennter Original-Menüstart und Startzeitprofil (2026-10-31)

Der Standardstarter bootet nicht mehr vor dem Hauptmenü automatisch
`q3dm1`, `qagame.qvm` und `cgame.qvm`. `qvm_menu_app.ml` startet das
unveränderte Retail-`ui.qvm` in `CA_DISCONNECTED`; erst ein vom Menü erzeugter
`map`-, `spmap`- oder `devmap`-Befehl wechselt in den vollständigen Matchpfad.
Das native Windows-Hauptmenü erschien damit auf dem Entwicklungsrechner stabil
und ansprechbar in weniger als 12 Sekunden.

Der ursprünglich gemessene direkte Matchstart benötigte etwa 387 Sekunden.
Nach dem Ersatz eines quadratischen Weltflächen-Caches fiel ein Zwischenlauf
auf etwa 86 Sekunden; eine spätere vollständige Ein-Frame-Abnahme benötigte
132,4 Sekunden. Die systematische MiniLang-Hotpath-Bereinigung vom selben Tag
senkte denselben q3dm1-Retail-QVM-Smoke auf 19,7 bis 20,8 Sekunden (mehr als
6-mal schneller):
Boot 16.249 ms, UI 396 ms, Shaderindex 59 ms, Szene 311 ms, Sounds 712 ms,
Welt 1.033 ms und Upload 104 ms. Shadertexte werden mit
`std.string_builder`, wachsende Sammlungen mit `std.ds.list`, Eingaben mit
`std.ds.queue` und Kandidaten einmalig mit `std.sort` verarbeitet. MD3-,
Snapshot-, Audio-, Welt- und Szenenpfade verwenden bei bekannter Größe direkt
vorallokierte Arrays. `test_minilang_hotpaths.py` schützt elf dieser
produktionskritischen Strukturen gegen die Rückkehr quadratischer
Array-Konkatenation. 2D- und Szenenmaterialien teilen einen Shaderindex,
PK3-Namen werden über einen case-insensitiven Bucket-Index gefunden und der
Warmup wurde von acht auf zwei Frames reduziert. 84
Retail-PK3-/DEFLATE-Vergleiche sichern den neuen Archivpfad ab. Der
interpretierte QVM-/Mapstart liegt weiterhin über der nativen Original-Engine
und bleibt deshalb eine offene Performance-Lücke, ist aber nicht mehr der
minutenlange Blocker des vorherigen Stands.

## 2026-10-31: Portable EXE findet Baseq3 und bootet die Retail-CD direkt

`MiniQuake3.exe` besitzt nun einen echten Null-Argument-Start. Die Win32-Grenze
liefert mit `GetModuleFileNameW` den Ordner der laufenden EXE, sodass weder das
Arbeitsverzeichnis einer Verknüpfung noch ein fest codiertes Laufwerk den
Assetpfad bestimmen. Direkt daneben wird `baseq3/pak0.pk3` verlangt;
vorhandene Standardarchive bis `pak8.pk3` werden mit höherer Paknummer zuerst
indiziert. Jeder zusammengeführte PK3-Eintrag bewahrt sein Quellarchiv,
überschriebene Qpaths erscheinen nur einmal, und der Bucketaufbau verwendet
`std.ds.list` statt wiederholter Array-Konkatenation.

Die Retail-CD lieferte außerdem `ui.qvm` mit UI-API 3. Der VM-Lifecycle
akzeptiert diese historische ABI nun ausdrücklich neben API 4 und 6. Ihre
älteren Game-/Cgame-Structs sind jedoch nicht ABI-kompatibel zum 1.32b-Host;
deshalb baut und paketiert `scripts/build.py` die drei unveränderten
1.32b-QVMs nach `qvms/`, während sämtliche Retail-Assets aus den Standard-PK3s
stammen. Das neue End-to-end-Gate `test_default_exe_startup.py` startet die
gebaute EXE ohne Argumente und absichtlich mit einem anderen Arbeitsverzeichnis,
sucht das Fenster über die konkrete PID und verlangt den Titel
`MiniQuake3 | Quake III Arena Main Menu`. Der reale Lauf erreichte ihn in
**7,72 Sekunden**. Danach bestand ein vollständiger Game-/Cgame-Matchframe aus
dem paketierten `qvms`-Ordner mit 492 texturierten Dreiecken, 261 2D-Befehlen
und 17 Soundbefehlen. Das synthetische PK3-Stack-Gate prüft vier Verträge für
Deduplizierung, Pak-Vorrang und quellrichtiges Lesen. Zusätzlich bestehen 84
Archiv-/DEFLATE-Vergleiche, 23 Unzip-Verträge samt 84 Retailfällen, 75/75
`files.c`-Symbole, 44 Filesystem-Verträge sowie 14 originale
UI-Exportdatensätze und 22 UI-Lifecycle-Verträge. Der vollständige Hauptbuild
hat SHA-256 `b8230e254975a4bea9b8638807c4fa4ef5d01997a36e4a750865bff8e6366616`.

## 2026-11-01: Ein-Fenster-GUI, Original-Menübild und robuste UI-Eingabe

Der ausgelieferte `MiniQuake3.exe`-Hauptbuild wird nun als
`IMAGE_SUBSYSTEM_WINDOWS_GUI` markiert; Testprogramme bleiben
Konsolenanwendungen. Damit startet der direkte Doppelklick ausschließlich das
Spielfenster. `Play-MiniQuake3.cmd` führt denselben Buildpfad abgekoppelt aus,
sodass sein Prüf-/Buildfenster nach dem Start sofort verschwindet.

Der lila-schwarze Hauptmenü-Hintergrund war die sichtbare
`$defaultimage`-Ersatztextur: Die Retail-Datei `scripts/menu.shader` enthält
nur Kommentare, während `menuback` und `menubacknologo` tatsächlich in
`scripts/gfx.shader` definiert sind. Der frühe Menüindex verwendet jetzt diese
Originaldefinitionen und lädt `textures/sfx/logo512.tga`. Der sichtbare
Windows-Smoke zeigt damit das originale schwarze/rote Quake-III-Hauptmenü.

Der gemeldete Fehler `input event bridge: invalid event` entstand durch
Ereignisse, die während des rund 20 Sekunden langen QVM-/Asset-Aufbaus in der
nativen Queue lagen. Ihre alten Win32-Zeitstempel wurden anschließend auf den
neuen Simulationsstart umgerechnet und konnten negativ werden. Die produktiven
Menü- und Matchpfade leeren den nativen Ring jetzt vor der Uhrenbasis; die
native `IN_ClearStates`-Entsprechung löscht dabei Zustand und Queue, statt
weitere Releases zu erzeugen.

Zusätzlich verwenden UI-Abfrage, Win32-Ring und QVM nun durchgehend den
originalen Quake-Keynum-Raum (`K_MOUSE1=178`, `K_DOWNARROW=133`, Kleinbuchstaben
ab 97). Eine kleine vorallokierte `ui_input_latch`-Struktur hält einen sehr
kurzen Down/Up-Impuls genau einen UI-Frame sichtbar, ohne Array-Konkatenation
oder wachsende Historie. Dadurch gehen Klicks und Tasten zwischen zwei
16-ms-Frames nicht mehr verloren. Vom originalen `ui.qvm` ausgegebene
`quit`-Befehle werden in Haupt- und Ingame-Menü übernommen, anschließend
laufen Audio-, Textur-, Fenster- und QVM-Cleanup vollständig durch.

Nachweise: 28 Original-UI-Session-Verträge, 38 Input-Command-Verträge plus
fünf unverändert extrahierte Baseq3-Differentialdatensätze, der reine
UI-Input-Latch-Vertrag, der native Fenster-Smoke, das GUI-Subsystem-/Launcher-
Gate und der echte Null-Argument-Start bis zum Originalmenü. Der gemessene
Start lag bei **1,06 Sekunden**.
