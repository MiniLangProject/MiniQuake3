# AAS- und Botlib-Laufzeit

Stand: 14. September 2026. MiniQuake3 liest die Navigationsdateien der
Quake-III-CD direkt in MiniLang. `src/mq3/format/aas.ml` bildet den
124-Byte-Header, alle 14 Lumps und die Record-Layouts aus `aasfile.h` ab. Der
Reader akzeptiert die unverschlüsselte Version 4 und dekodiert den XOR-Header
der Version 5 wie `be_aas_file.c`. Offsets, Größen, Überlappungen, Indizes und
die Beziehungen zwischen Areas, Faces, Edges, Nodes, Portals, Clustern und
Reachabilities werden vor der Nutzung geprüft.

`src/mq3/botlib/aas_runtime.ml` setzt die Laufzeitabfragen aus
`be_aas_sample.c`, `be_aas_reach.c` und `be_aas_route.c` um. Die Punktsuche
beginnt wie das Original bei AAS-Knoten 1; Knoten 0 bleibt das Solid-Leaf.
Vorhanden sind Presence-Bounds, Point-Presence, AreaInfo,
Reachability-Zähler und -Iteration, Reachability-Datensätze, Bounding-Box-Areas,
AAS-Zeit sowie das Aktivieren und Sperren von Routing-Areas. Das gewichtete
Routing berücksichtigt Travel-Flags, Area-Inhalte und gesperrte Areas und liefert
Reisezeit sowie die erste Reachability des berechneten Wegs. Eine Zustandsänderung
invalidiert den Routing-Cache; die Rückgabe von `AAS_EnableRoutingArea`
entspricht dem vorherigen Zustand des Originals.

Der QVM-Host besitzt einen echten Botlib-Lifecycle für Setup, Shutdown,
Libvars, StartFrame, LoadMap und UpdateEntity. Ein botfähiger Start setzt
`bot_enable`, lässt die unveränderte Retail-`qagame.qvm` ihre Botlib-Initialisierung
ausführen und lädt `maps/<name>.aas` aus dem PK3. Die implementierten 300er
AAS-Traps marshallen Vektoren, AreaInfo, Area-Arrays, Entityzustände und die
84 Byte große Client-Movement-Vorhersage über den QVM-Speicher. Noch nicht
implementierte Botlib- und AI-Traps brechen sichtbar mit einer konkreten
Trapnummer ab; sie werden nicht pauschal als erfolgreicher Nullwert ausgegeben.

Die Servergrenze verwaltet acht echte Bot-Client-Slots sowie Snapshot-Entities,
Usercmds und Bot-Konsolennachrichten. Ein Retail-Aufruf von `addbot Sarge 3`
läuft durch `GAME_CONSOLE_COMMAND`, liest Sarge aus `bots.txt`, setzt Userinfo und
`SVF_BOT`, belegt Slot 0 und schließt `BotAISetupClient` mit echten Goal-, Weapon-,
Chat- und Move-State-Handles ab. Danach laufen drei vollständige Bot-Frames; die
nächste sichtbare Portgrenze ist Trap 574 `BOTLIB_AI_ADD_AVOID_SPOT`.

Die Elementary Actions 400–423 sind portiert: Aktionsbits, Blick, Richtung,
Geschwindigkeit, Waffe, Jump-Latch und das 40-Byte-`bot_input_t`-Marshalling
stimmen in fünf nativen Referenzszenarien. Die 500er AI-Grundlage lädt und
interpoliert Retail-Character-Dateien, parst Sarges Item- und Weapon-Weights,
bindet Projectile-Infos und lädt das Chat-Profil mit Includes, 85 Chattypen und
360 Nachrichten. Handle-Pools, Reset/Freigabe und die 276 Byte großen
Konsolennachrichten sind ebenfalls gegen native Referenzpfade geprüft.

Die Formatabnahme umfasst 28 synthetische Verträge und sämtliche 30 AAS-Dateien
aus `pak0.pk3`: vier Dateien in Version 4 und 26 in Version 5 mit zusammen
96.758 Areas, 125.731 Reachabilities und 336.570 Nodes. Die Laufzeitprobe auf
`q3dm1.aas` sieht 1.933 Areas und 447 Areas mit ausgehenden Reachabilities.
Alle 256 geprüften Area-Zentren werden über den echten Node-Baum wieder ihrer
Area zugeordnet. Bounding-Box-Traversierung, Reachability-Iteration, AreaInfo,
Presence-Bounds, Zeit, Routing-Sperren und echte Routensuchen sind zusätzlich
geprüft.

Die vollständige Parität der ursprünglichen Cluster-/Portal-Routing-Caches und
der verbleibenden Goal-, Move-, Weapon- und Chat-State-Maschinen bleibt offen.
Darunter liegen auch noch nicht erreichte Traps unterhalb von 574; Trap 574 ist
die nächste Grenze des aktuellen deterministischen Retail-Probelaufs. Die
Movement-Prediction benutzt für Kollisionen derzeit die Server-BSP-Grenze;
Presence-Sperren, Playerclip und die exakten AAS-Trace-Felder müssen noch auf den
originalen AAS-Node-Trace umgestellt werden. Auch Trap 542 aktualisiert den
dynamischen Level-/Dropped-Item-Heap noch nicht. Erst wenn diese Pfade einen
vollständigen Bot-Match durchlaufen und mit dem C-Referenzlauf übereinstimmen,
ist Schritt 9 des Portplans abgenommen.

Ausführen:

```powershell
python scripts/test_aas_format.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_aas_runtime.py --data-root D:/Quake3
python scripts/test_aas_routing.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_aas_client_movement.py
python scripts/test_botlib_lifecycle_runtime.py
python scripts/test_botlib_aas_syscalls.py
python scripts/test_botlib_retail_qagame.py --data-root D:/Quake3 --qvm-root build/reference/qvms
python scripts/test_elementary_actions.py
python scripts/test_aas_entity_queries.py
python scripts/test_aas_trace_areas.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_characters.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_resource_pools.py
python scripts/test_ai_item_weights.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_weapon_weights.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_chat_profiles.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_console_messages.py
python scripts/test_bot_server_bridge.py
python scripts/test_bot_spawn_retail.py --data-root D:/Quake3
```
