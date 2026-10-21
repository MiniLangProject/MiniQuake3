# Baseq3-Nachrichtenpuffer und Huffman-Codec

`src/mq3/qcommon/message.ml` bildet `msg_t`, Initialisierung, Leeren,
Leseanfang, Zustandskopie und Byte-, Char-, Short-, Long-, Binary32-, Winkel-,
Daten- und C-String-Operationen ab. Mehrbytewerte liegen im OOB-Zweig Little
Endian vor. Byte-Lesen bleibt vorzeichenlos, Char und Short werden mit
Vorzeichen erweitert, Long wird auf 32 Bit normalisiert. `MSG_Copy` bewahrt
alle Cursor und Flags, kopiert die Nutzdaten aber in einen unabhängigen Puffer.

`src/mq3/qcommon/huffman.ml` portiert den adaptiven Baum aus
`qcommon/huffman.c`: NYT-Erweiterung, Gewichtsblöcke, Rangtausch, LSB-erste
Bitablage sowie adaptives Senden und Empfangen. `MSG_initHuffman` trainiert den
Protokollbaum mit allen 1.053.340 Referenzen der Baseq3-Tabelle. Der normale
Nachrichtenpfad verwendet ein daraus erzeugtes unveränderliches Abbild mit 513
Knoten, damit jeder neue Puffer sofort bereitsteht. Gültige Breiten von 1 bis
32 Bit mischen rohe Restbits und Huffman-kodierte volle Bytes exakt wie
`MSG_WriteBits` und `MSG_ReadBits`; negative Breiten aktivieren die
Baseq3-Vorzeichenerweiterung.

Die Grenzsemantik bleibt Teil der Portierung: `MSG_WriteBits` reserviert vor
jedem primitiven Schreibvorgang vier freie Bytes und setzt andernfalls
`overflowed`, ohne Cursor oder Nutzdaten weiterzuschieben. Lesen über `cursize`
liefert in den typisierten OOB-Helfern `-1`, nachdem Lese- und Bitcursor wie im
Original fortgeschritten sind. Normale Strings sind auf
`MAX_STRING_CHARS - 1` Zeichen begrenzt; eingebettetes NUL beendet sie wie
C-`strlen`. Der Big-String-Pfad verwendet die originale 8.192-Byte-Grenze und
behält beim Lesen hohe Bytes bei, während Prozentzeichen entschärft werden.

`python scripts/test_message.py` vergleicht 23 OOB-Ausgabezeilen aus 29
unveränderten `msg.c`-Funktionskörpern und prüft 37 zusätzliche Verträge.
`python scripts/test_huffman_message.py` kompiliert die unveränderten
Originalkörper aus `huffman.c` zusammen mit `MSG_initHuffman`, `MSG_WriteBits`
und `MSG_ReadBits`. Acht vollständige Datensätze vergleichen adaptiven
Baumaufbau, bekannte Bitströme, gemischte Breiten, signierte Reads, Cursor und
Überlauf bytegenau. 83 MiniLang-Verträge prüfen zusätzlich Baumzustand,
Roundtrips und jede gültige Breite von 1 bis 32 Bit.

`src/mq3/qcommon/message_delta.ml` ergänzt die skalaren Integer- und
Binary32-Deltas, ihre XOR-Key-Varianten sowie `MSG_Write/ReadDeltaUsercmd` mit
und ohne Key. Die Zeit verwendet bei einem Delta unter 256 den Acht-Bit-Pfad
und sonst den vollständigen 32-Bit-Wert. Winkel, signierte Bewegungsbytes,
Buttons und Waffe folgen den Originalbreiten; die Key-Variante übernimmt auch
den gemeinsamen Unchanged-Payload-Bitpfad und `key ^ serverTime`.
`python scripts/test_message_delta.py` vergleicht acht zusammengesetzte
Datensätze aus 12 unveränderten `msg.c`-Funktionskörpern bytegenau samt
Bit-/Bytecursor und Rücklesewerten. 52 Verträge prüfen zusätzlich unveränderte
und geänderte Werte, Float-Bitmuster, XOR, Winkel- und Vorzeichengrenzen sowie
8-/32-Bit-Zeitkodierung.

`src/mq3/qcommon/message_state_delta.ml` portiert außerdem die 51
`entityState_t`- und 48 `playerState_t`-Netfields in ihrer handoptimierten
Baseq3-Reihenfolge. Entity-Deltas unterstützen ausgelassene unveränderte
Einträge, erzwungene No-Delta-Einträge, Entfernen, `lc` und die Null-, Integral-
und Vollbit-Kodierung für Floats. PlayerState-Deltas übernehmen signierte
Feldbreiten und die vier 16-Bit-Änderungsmasken für `stats`, `persistant`,
`ammo` und `powerups`. `python scripts/test_message_state_delta.py` vergleicht
108 vollständige komprimierte Pakete und alle rekonstruierten Zustandswörter
mit vier unveränderten `msg.c`-Funktionskörpern; 28 Verträge prüfen zusätzlich
Feldtabellen, Grenzwerte, Kopiersemantik und ungültige Feldzähler.

`src/mq3/server/snapshot_delta.ml` setzt darauf die protokollkritische
`SV_EmitPacketEntities`-Kette auf. Der Port führt den sortierten Zwei-Wege-Merge
von altem und neuem Snapshot aus, schreibt Baseline-Adds, Removes und geänderte
Entities, lässt identische Entities aus und beendet die Liste mit Entity 1023.
Der Server-Host liefert Snapshot-Ring und Baselines; Moduloadressierung,
Deltaframe-Gültigkeit sowie Snapshot-Header, Areabits, Playerstate und
Packetentities liegen im MiniLang-Modul. `python scripts/test_snapshot_delta.py`
vergleicht sechs vollständige Huffman-Paketstreams für Add, Remove, Unchanged,
Changed, gemischten Merge und Ring-Wrap mit dem unveränderten Baseq3-Funktionskörper.
26 Verträge prüfen zusätzlich Hostgrenzen, Frame-Verfall und Payload-Aufbau.

Vorgelagert portiert `src/mq3/server/snapshot_build.ml` die vier
`sv_snapshot.c`-Funktionen für Auswahl, Sortierung und Ringablage. Collision,
PVS und Area-Verbindungen sind sechs klar benannte Hostcallbacks. Fünf direkte
Original-C-Szenarien vergleichen Filterflags, Broadcast, Portalrekursion,
Deduplizierung, Viewpoint, Areabits und Ring-Wrap; 26 MiniLang-Verträge prüfen
zusätzlich Grenzen, Kopiersemantik und leere Clientframes.

`src/mq3/server/snapshot_runtime.ml` bindet diese Hostgrenzen konkret an
`collision.world`, `collision.visibility`, `server.world` und den vorhandenen
Game-Levelzustand. Der Adapter synchronisiert EntityState und räumliche Metadaten,
erhält Deduplizierungszähler und Packet-Entity-Ring über Frames hinweg und liefert
einen direkt von `snapshot_delta` kodierbaren Frame. 16 assetfreie Verträge sind
grün. Der reproduzierbare Lauf auf `q3dm0` am Spawnpunkt
`(-984, -1056, 128)` ermittelt Leaf 2623, Cluster 1287 und Area 3 und schreibt
die sichtbare Entity 64 sowie Broadcast-Entity 65 in ein 62-Byte-Snapshotpaket.

`src/mq3/server/reliable_commands.ml` ergänzt die unmittelbar vor Snapshots
geschriebenen zuverlässigen Serverbefehle. Der Port verwaltet absolute Sequenzen,
den maskierten 64-Einträge-Ring, Acknowledgements, erneutes Senden noch nicht
bestätigter Befehle und `reliableSent`. `python scripts/test_reliable_commands.py`
extrahiert `SV_UpdateServerCommandsToClient` unverändert aus `sv_snapshot.c` und
ruft den Körper mit den unveränderten Huffman-/MSG-Funktionen auf. Sieben
vollständige komprimierte Streams stimmen bytegenau überein; 19 Verträge prüfen
zusätzlich Ringüberlauf, veraltete und zukünftige Acknowledgements sowie ungültige
Host-Ringe.

`src/mq3/server/snapshot_send.ml` verbindet diese Bausteine entsprechend
`SV_SendClientSnapshot`: Client-Command-Acknowledgement, Reliable Commands,
Deltaframe-Auswahl, Snapshot-Flags und Payload, Debug-Padding, Downloadcallback
und das von der Server-Netchan-Schicht angehängte `svc_EOF`. Das Modul führt
außerdem Frame-Sendemetadaten und die Rate-, Snapshot-, Inaktiv-, Loopback- und
LAN-Terminierung aus; nur die eigentliche Netchan-Übertragung bleibt Callback.
Sechs vollständige Nachrichten mit Vollsnapshot, Reliable-Befehlen, gültigem und
verfallenem Delta, Flags/Padding und Downloaddaten stimmen bis einschließlich
des dekodierten EOF bytegenau mit unveränderten Baseq3-Körpern überein. 25
Verträge prüfen die Orchestrierungs- und Zeitgrenzen.

Der anschließende [Server-Downloadpfad](SERVER_DOWNLOAD.md) verwaltet das
acht Blöcke große Übertragungsfenster, EOF und Block-Acks sowie den vollständigen
Reliable-Befehlspfad für `download`, `nextdl`, `stopdl` und `donedl`. 15 direkte
Originaldatensätze und 27 Verträge sind grün.

`src/mq3/client/snapshot_parse.ml` portiert den Gegenpfad aus `CL_DeltaEntity`
und `CL_ParsePacketEntities`. Der 2048 Einträge große Ring übernimmt unveränderte
Entities, dekodiert Änderungen gegen alte Zustände oder Baselines, lässt Removes
weg und kopiert den verbleibenden alten Frame. `python scripts/test_snapshot_parse.py`
prüft 15 Verträge; fünf davon rekonstruieren den gemischten Paketstream des
unveränderten C-Servers vollständig.

`src/mq3/client/snapshot_command.ml` portiert getrennt den äußeren
`CL_ParseSnapshot`-Übergang: Header und Deltaframe-Auswahl, 32-Byte-Areamask,
Playerstate, Packetentities, Gültigkeitsprüfung, Snapshot-Ring, Lückenentwertung,
Ping und Demo-Warteflag. `python scripts/test_snapshot_command.py` führt
`CL_DeltaEntity`, `CL_ParsePacketEntities` und `CL_ParseSnapshot` unverändert aus
`client/cl_parse.c` aus. Vier vollständige C-Zustandsübergänge stimmen exakt;
zehn MiniLang-Verträge prüfen zusätzlich Grenzen und die wertkopierte Areamask.
`src/mq3/client/server_message.ml` portiert darüber `CL_ParseCommandString` und
`CL_ParseServerMessage`. Der Dispatcher repariert zu alte Reliable-
Acknowledgements, unterdrückt doppelte Servercommands, adressiert den 64er-Ring
mit der absoluten Sequenz und verarbeitet `nop`, `snapshot` und `EOF`.
`python scripts/test_server_message.py` führt beide Originalkörper unverändert
aus: Drei vollständige Zustandsübergänge einschließlich eines kombinierten
Reliable-und-Snapshot-Streams stimmen exakt; zehn Verträge prüfen zusätzlich
Ring-Wrap, Trunkierung, ungültige Opcodes sowie Gamestate-/Download-Callback-
Dispatch. `src/mq3/client/download.ml` implementiert nun den Downloadinhalt:
Block 0 mit Dateigröße oder Serverfehler, erwartete Blocknummer, Dateiöffnung
und -schreiben, `stopdl`/`nextdl`, Bytezähler sowie EOF mit Close, Rename,
doppeltem Packet-Ack und nächstem Download. Vier Zustandsfolgen aus dem
unveränderten `CL_ParseDownload` und 20 MiniLang-Verträge sind grün. Reale
Dateizugriffe und Reliable-Paketversand bleiben explizite Hostdienste.

`src/mq3/client/gamestate.ml` portiert `CL_ParseGamestate` mit dem 1024er-
Configstring-Offsetfeld, 16000-Byte-Stringspeicher, `MSG_ReadBigString`, Entity-
Baselines, Servercommand-Sequenz, `clientNum` und `checksumFeed`. Ein direkter
Übergang aus dem unveränderten Originalkörper und zwölf Verträge prüfen auch
Reset, lange Configstrings, Speichergrenzen, Trailer und Abschlussreihenfolge.
`CL_SystemInfoChanged`, Dateisystem-Neustart und Downloadinitialisierung sind
explizite Abschlusscallbacks.

Die konkrete Serverpipeline verbindet Frameaufbau, Snapshotnachricht,
Downloadfenster und Netchan. Elf Verträge prüfen Frameslot, synchronen
Snapshot-Ringzähler, Downloadblock und vollständiges Fragment-Leeren; die
einzelnen Bytepfade behalten ihre direkten unveränderten C-Oracles.

Offen bleiben die eigenständigen Ganzpuffer-Helfer `Huff_Compress` und
`Huff_Decompress`. Die MiniLang-Namen `readU8`, `readI8`, `readI16`,
`readI32`, `readCString` und `readCStringLine` vermeiden Kollisionen mit
eingebauten MiniLang-Funktionen.
