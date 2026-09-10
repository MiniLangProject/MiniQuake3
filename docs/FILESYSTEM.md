# PK3-Suchpfad und Pure-Prüfsummen

`src/mq3/qcommon/filesystem.ml` bildet den für das Laden von Spieldaten nötigen
Teil von `code/qcommon/files.c` ab. `mountHostGameDirectory` durchsucht unter
Windows das gewählte Spielverzeichnis selbst; `mountGameDirectory` bleibt die
plattformneutrale Variante mit expliziter Dateiliste. PK3-Pfade werden wie Quake 3 alphabetisch sortiert und jedes Pak
an den Kopf der Suchkette. Damit haben spätere Paks und später eingehängte
Spielverzeichnisse Vorrang. Lose Dateien folgen den Paks desselben Verzeichnisses.
Qpaths werden ASCII-kleingeschrieben, Backslashes normalisiert und Pfade mit
absolutem Anfang, `..` oder `::` abgewiesen.

`listFiles` führt Ergebnisse in Suchreihenfolge zusammen, entfernt Duplikate ohne
Beachtung der ASCII-Großschreibung und übernimmt die Pfad-/Erweiterungsregeln von
`FS_ListFilteredFiles`. Sobald eine Pure-Liste gesetzt ist, werden nicht erlaubte
Paks und sämtliche losen Verzeichnisse ausgeblendet. `read` wendet dieselbe
Filterung und Priorität an.

Erfolgreiche Pak-Zugriffe pflegen außerdem die originalen General-, UI-, CGame-
und QAGame-Referenzbits. Shader-, Text-, Config-, Bot-, Arena-, Menü- und
Levelshot-Dateien erzeugen wie in Baseq3 keine allgemeine Referenz. Geladene und
referenzierte Server-Paklisten werden getren gespeichert;
`referencedPakPureTokens` erzeugt die CGame/UI/`@`/General-Reihenfolge sowie den
feed- und Pakanzahl-gebundenen Abschlusswert für die Pure-Verhandlung.

Beim Laden eines Paks werden die CRC32-Werte aller nichtleeren Central-Directory-
Einträge in ihrer Archivfolge als Little-Endian-Wörter serialisiert. Der normale
pak checksum ist `Com_BlockChecksum` dieses Puffers; der pure checksum stellt den
Little-Endian-`fs_checksumFeed` voran. `src/mq3/qcommon/md4.ml` implementiert dafür
MD4 und die originale XOR-Faltung der vier Digest-Wörter.

`python scripts/test_pure_filesystem.py` prüft 24 Eingaben einschließlich der
MD4-Blockgrenzen 55/56/63/64/65 Bytes. Normale und feed-gebundene Ergebnisse,
insgesamt 48 Werte, werden gegen unverändert eingebundenes
`code/qcommon/md4.c` verglichen. 23 weitere Verträge prüfen Pak-Sortierung,
Pak-Namen, Überschreiben, lose Dateien, Listenreihenfolge, Duplikate, Pure-Filterung,
Referenzbits, Referenzlisten und den Pure-Referenznachweis. Insgesamt bestehen
25 VFS-/Pure-Verträge. `comparePaks` bildet zusätzlich `FS_ComparePaks` ab:
vorhandene Prüfsummen werden übersprungen, offizielle Baseq3-/Missionpack-Paks
werden nie automatisch geladen und lokale Namenskollisionen erhalten den
achtstelligen Prüfsummen-Suffix. Download- und Diagnoseformat sowie Puffergrenze
sind fest geprüft.

Die automatische Windows-Verzeichnisauflistung erfasst Top-Level-PK3s und
rekursiv alle losen Dateien; zwei Verträge prüfen den resultierenden Suchpfad.
Nicht-ASCII-Dateinamen benötigen noch eine UTF-16→UTF-8-Brücke. Noch nicht
enthalten sind Schreibhandles, der eigentliche Downloadtransport,
Restrict/Demo-Prüfung, Neustart/Handle-Lebensdauer und ZIP64 bzw. verschlüsselte
Archive. Das konfigurierte `D:/Quake3` war bei dieser Abnahme nicht eingehängt;
die Tests verwenden deterministisch erzeugte PK3-Dateien.
