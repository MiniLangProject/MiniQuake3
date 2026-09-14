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
Chat- und Move-State-Handles ab. Danach laufen 512 vollständige Bot-Frames ohne
unportierten Trap bis zur regulären Übergabe über `BOTLIB_USER_COMMAND`.
Avoid-Spots, Chat-Whitespace, die 175 Gruppen aus der Retail-`syn.c` und alle
138 Templates aus `match.c` werden dabei bereits verarbeitet. Initial- und
Antwortchat laden außerdem alle 244 Zufallsgruppen aus `rnd.c` und 456 Regeln
aus `rchat.c`; Chatlänge und ALL-/TEAM-/TELL-Zustellung laufen über die echten
Elementary Actions. Alternative
Routenziele, Routenvorhersage, Reachability-Area-Indizes und der 68-Byte-
`bot_initmove_t`-Zustand sind ebenfalls live. `BOTLIB_AI_MOVE_TO_GOAL` wählt
gewichtete Reachabilities, beachtet Travel- und Avoid-Zustände und schreibt das
originale 52-Byte-`bot_moveresult_t`. Der q3dm1-Lauf endet mit einem echten
Bot-Usercmd (`forward=123`, `right=-31`, `up=0`, Waffe 8); der Goal-Stack
entwickelt sich dabei von einem auf zwei aktive Ziele weiter.

Die Elementary Actions 400–423 sind portiert: Aktionsbits, Blick, Richtung,
Geschwindigkeit, Waffe, Jump-Latch und das 40-Byte-`bot_input_t`-Marshalling
stimmen in fünf nativen Referenzszenarien. Die 500er AI-Grundlage lädt und
interpoliert Retail-Character-Dateien, parst Sarges Item- und Weapon-Weights,
bindet Projectile-Infos und lädt das Chat-Profil mit Includes, 85 Chattypen und
360 Nachrichten. Handle-Pools, Reset/Freigabe und die 276 Byte großen
Konsolennachrichten sind ebenfalls gegen native Referenzpfade geprüft. Der
Goal-Stack, Avoid-Zeiten, TouchingGoal, Level-Item-Abfragen sowie LTG-/NBG-
Itemwahl sind über die originalen 56-Byte-`bot_goal_t`-Strukturen angebunden.
Die Auswahl berücksichtigt Spielmodus-, `notbot`-, Dropped- und Roam-Flags,
Fuzzy-Gewichte, AAS-Reisezeiten und Rückwege zum Langzeitziel.
Die Fuzzy-Evolutionsfallen 545 und 564–566 bewahren dabei auch die veröffentlichten
Eigenheiten: Save bleibt ein No-op, `range` wird bei Mutation ignoriert und die
genetische Auswahl berechnet ihren Zufallswert, ohne ihn anschließend zu benutzen.
`BotPredictVisiblePosition` verfolgt gewichtete Reachabilities über bis zu 20
Hops und prüft Start und Ende jedes Abschnitts gegen die reale BSP-Kollision.
Die Kartenzielfallen bauen aus den BSP-Entities zwölf `target_location`-Ziele
für q3dm1 auf; die Karte enthält keine `info_camp`-Spots.
Waffenwahl und `weaponinfo_t` verwenden das Retail-Inventar, die geladenen
Weapon-Weights und das vollständige 552-Byte-ABI samt 208-Byte-Projektilinfo.

`BotInitLevelItems` liest die statischen BSP-Entities, ordnet sie den 35
Retail-Itemtypen zu, setzt Spawnflags und berechnet Zielbereiche mit dem
vorhandenen AAS- und Kollisionszustand. Auf `q3dm1` entstehen so 18 echte
Level-Items. `BotUpdateEntityItems` ist kein Erfolgs-Platzhalter mehr: Die
Laufzeit bindet stationäre ET_ITEM-Entities, erkennt wiederverwendete
Entitynummern, aktualisiert verschobene Ursprünge, verwaltet gedroppte Items mit
30-Sekunden-Timeout und schließt Jumppad-Areas wie das Original aus.

Die Formatabnahme umfasst 28 synthetische Verträge und sämtliche 30 AAS-Dateien
aus `pak0.pk3`: vier Dateien in Version 4 und 26 in Version 5 mit zusammen
96.758 Areas, 125.731 Reachabilities und 336.570 Nodes. Die Laufzeitprobe auf
`q3dm1.aas` sieht 1.933 Areas und 447 Areas mit ausgehenden Reachabilities.
Alle 256 geprüften Area-Zentren werden über den echten Node-Baum wieder ihrer
Area zugeordnet. Bounding-Box-Traversierung, Reachability-Iteration, AreaInfo,
Presence-Bounds, Zeit, Routing-Sperren und echte Routensuchen sind zusätzlich
geprüft.

Alle 15 im Baseq3-Release geschalteten Travelhandler sind live: Walk, Crouch,
Barrier-Jump, Jump, Ladder, Walk-off-Ledge, Swim, Waterjump, Teleport, Elevator,
Rocket-/BFG-Jump, Grapple, Jumppad und FuncBobbing. Die Hostgrenze liefert dafür
reale BSP-Kollision, Flüssigkeitsinhalte, Moverpositionen, Barriereprüfung,
Grapple-Zustände und Botlib-Libvars. Reverse-Reachabilities, Area-Reisezeitmatrizen
und Portal-Maximalzeiten werden beim Laden erzeugt; ein begrenzter LRU-Cache
invalidiert mit den Routing-Sperren. Offen bleiben die dynamische
`AAS_UpdateAreaRoutingCache`-/`AAS_UpdatePortalRoutingCache`-Propagation, die
kompakten Reachability-Bytes und `.rcd`-Persistenz. Die
Movement-Prediction benutzt für Kollisionen derzeit die Server-BSP-Grenze;
Presence-Sperren, Playerclip und die exakten AAS-Trace-Felder müssen noch auf den
originalen AAS-Node-Trace umgestellt werden. Die Best-Reachable-Area-Suche nutzt
bereits die originale Fünf-mal-fünf-Fudge-Suche, den 50-Unit-Crouch-Drop und
Bounding-Box-Areas; der Sonderweg für frei schwebende Items, die ausschließlich
von einem Jumppad erreichbar sind, braucht noch die vollständige
JumpPad-Movement-Simulation. Erst wenn diese Pfade einen vollständigen Bot-Match
durchlaufen und mit dem C-Referenzlauf übereinstimmen, ist Schritt 9 des
Portplans abgenommen.

Ausführen:

```powershell
python scripts/test_aas_format.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_aas_runtime.py --data-root D:/Quake3
python scripts/test_aas_routing.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_aas_routing_cache.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_aas_routing_tables.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_aas_route_extras.py
python scripts/test_aas_client_movement.py
python scripts/test_ai_move_runtime.py
python scripts/test_ai_goal_selection.py
python scripts/test_ai_chat_output.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_predict_visible_position.py
python scripts/test_botlib_lifecycle_runtime.py
python scripts/test_botlib_aas_syscalls.py
python scripts/test_botlib_retail_qagame.py --data-root D:/Quake3 --qvm-root build/reference/qvms
python scripts/test_elementary_actions.py
python scripts/test_aas_entity_queries.py
python scripts/test_aas_trace_areas.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_characters.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_resource_pools.py
python scripts/test_ai_goal_state.py
python scripts/test_ai_level_items.py
python scripts/test_ai_goal_selection.py
python scripts/test_ai_item_weights.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_weapon_weights.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_weapon_combat.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_chat_profiles.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_console_messages.py
python scripts/test_ai_chat_strings.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_chat_matches.py --pak D:/Quake3/baseq3/pak0.pk3
python scripts/test_ai_chat_goal_tail.py
python scripts/test_ai_avoid_spots.py
python scripts/test_bot_server_bridge.py
python scripts/test_bot_spawn_retail.py --data-root D:/Quake3
```
