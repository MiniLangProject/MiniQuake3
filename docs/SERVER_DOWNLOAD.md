# Server-Downloadfenster

`src/mq3/server/download.ml` portiert `SV_WriteDownloadToClient`,
`SV_BeginDownload_f`, `SV_NextDownload_f`, `SV_StopDownload_f`,
`SV_DoneDownload_f` und `SV_CloseDownload` aus `server/sv_client.c`. Es füllt
den acht Einträge großen Ring mit Blöcken bis 2.048 Byte, hängt den leeren
EOF-Block an, berechnet das Blockbudget aus Rate und Snapshotintervall und
beginnt nach mehr als einer Sekunde ohne Ack erneut beim ältesten offenen Block.
Block-Acks geben Ringslots frei; der EOF-Ack schließt und leert den Download.
Die vier Reliable-Befehle `download`, `nextdl`, `stopdl` und `donedl` sind über
den produktiven Client-Command-Dispatcher an denselben Fensterzustand gebunden.
Ein neuer Download ersetzt einen laufenden Transfer mit der originalen
63-Byte-`MAX_QPATH`-Grenze; `donedl` sendet den Gamestate erneut.

Dateiöffnung, id-p-Pak-Prüfung, Lesen, Schließen und Client-Drop sind benannte
Hostdienste. Ablehnungen schreiben den originalen `svc_download`-Fehlerrahmen.
`python scripts/test_server_download.py` vergleicht 15 Zustands-/Bitstrom-
Datensätze mit sechs unveränderten Baseq3-Funktionskörpern. 27 Verträge prüfen
zusätzlich Fenster-, Rate-, Nachrichtenbudget-, Fehler- und Hostgrenzen.

`src/mq3/server/pipeline.ml` verbindet das Fenster konkret mit
`snapshot_runtime`, `snapshot_send` und `qcommon.netchan`. Der Buildcallback
setzt den Frame im Slot der ausgehenden Sequenz und synchronisiert Entity-Ring
und absoluten Ringzähler vor der Deltaauswahl. Der Downloadcallback schreibt
die Blöcke in dieselbe Servernachricht; der Transmitcallback leert anschließend
auch mehrteilige Netchan-Fragmente. Elf Integrationsverträge prüfen den gesamten
Pfad einschließlich eines 2.048-Byte-Downloads über zwei UDP-Pakete.
