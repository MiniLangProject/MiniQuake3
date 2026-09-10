# Netchan-Kern

`src/mq3/qcommon/netchan.ml` portiert den transportunabhängigen Kern aus
`code/qcommon/net_chan.c` für Protokoll 68. Ein Kanal beginnt mit eingehender
Sequenz 0 und ausgehender Sequenz 1. Clientpakete tragen nach der Sequenz den
global initialisierten 16-Bit-qport; Serverpakete nicht.

Nachrichten ab 1300 Bytes werden in Fragmente zerlegt. Alle Fragmente behalten
dieselbe Sequenz. Erst das letzte Fragment erhöht sie. Ist die Nachrichtenlänge
ein exaktes Vielfaches von 1300, sendet Baseq3 ein zusätzliches Fragment der
Länge null; der Port erhält diese Semantik.

Die Empfangsseite verwirft alte und doppelte Sequenzen, berechnet ausgelassene
Pakete, akzeptiert Fragmente ausschließlich an der erwarteten Position und baut
erst beim kurzen Endfragment die vollständige Nachricht zusammen. Längen- und
Puffergrenzen entsprechen `MAX_MSGLEN`. Beim letzten Schritt prüft MiniLang
`fragmentLength + 4 <= maxsize`, weil die rekonstruierte Nachricht zusätzlich
den Sequenzheader erhält. Baseq3 prüft nur die Nutzdatenlänge und kann bei einer
exakt großen Zielallokation vier Bytes darüber schreiben; diese sichere Abweichung
ist absichtlich und durch Fälle knapp unter, auf und über der Grenze belegt.

`scripts/test_netchan.py` extrahiert `Netchan_Init`, `Netchan_Setup`,
`Netchan_Transmit`, `Netchan_TransmitNextFragment` und `Netchan_Process`
unverändert aus der Originaldatei. Ein kleiner C-Host stellt nur Little-Endian-
Bytezugriff, Cvars, Speicheroperationen und einen aufzeichnenden
`NET_SendPacket` bereit. 29 Ausgabedatensätze werden mit dem MiniLang-Lauf über
die vollständigen hexadezimalen Paketbytes und sämtliche relevanten Zustände
verglichen. 29 zusätzliche Verträge prüfen Fehler- und Grenzfälle. Darunter sind
exakte 1300-Byte-Nachrichten mit Null-Endfragment, Sequenzwechsel während einer
Teilmontage, Gap-Retry, alte und doppelte Pakete bei erhaltener Teilmontage,
beide Headerlayouts sowie negative und überlange Fragmentangaben. Ein Vertrag
schreibt zudem eine Nachricht mit `message.ml`, transportiert sie durch Netchan
und liest die Nutzdaten wieder mit `message.ml`.

Die Runtime verlangt für Versand `Runtime.sendPacketFn`. Diese Dienstgrenze ist
der künftige UDP-Adapter. Reale Socketzustellung, Paketverlust im Transport,
Adressvergleich und OOB-Challenge/Connect gehören nicht zu diesem Modul.

`src/mq3/client/netchan.ml` ergänzt die vollständige Protocol-68-Clientschicht
aus `client/cl_net_chan.c`. Sie liest die drei Clientheader-Werte für
`CL_Netchan_Encode`, wählt den bestätigten Serverbefehl aus dem maskierten
64er-Ring, führt die bytegenaue XOR-Kodierung aus und stellt dabei den
`msg_t`-Lesestatus wieder her. Die Empfangsrichtung verwendet Challenge,
Paketfolge und bestätigten Clientbefehl. `CL_Netchan_Transmit` hängt `clc_EOF`
an, kodiert und übergibt an den gemeinsamen Netchan; Fragmentfortsetzung und
erfolgreiches Process/Decode sind ebenfalls verdrahtet.

`scripts/test_client_netchan.py` führt alle fünf unveränderten
`CL_Netchan_*`-Körper zusammen mit den unveränderten `msg.c`-/Huffman- und
`net_chan.c`-Körpern aus. Neun Datensätze vergleichen vollständige Nachrichten-
und Paketbytes sowie Cursor-, Fragment-, Sequenz- und Größenstände. 18 weitere
MiniLang-Verträge prüfen Ringgrößen, Prefixschutz, reversible Kodierung,
EOF-Anhang, Versanddienst, Fragmentabschluss und Ablehnung kurzer Pakete. Die
Socketzustellung bleibt der injizierte `NET_SendPacket`-Dienst.

`src/mq3/server/netchan.ml` portiert die entsprechende Serverschicht aus
`server/sv_net_chan.c`. Sie schützt beim Senden die ersten vier physischen Bytes,
kodiert den Rest mit Challenge, ausgehender Sequenz und letztem Clientbefehl,
und dekodiert eingehende Nutzdaten mit Server-ID, Message-Acknowledgement und
dem bestätigten Befehl aus dem 64er-Ring. `SV_Netchan_Transmit` hängt `svc_EOF`
an. Trifft eine neue Nachricht auf ausstehende Fragmente, bleibt sie zunächst
unkodiert in einer FIFO; nach dem letzten Fragment wird sie mit der dann
aktuellen Sequenz kodiert und an den gemeinsamen Netchan übergeben.

Der C-Code beginnt die Huffman-Auswertung hinter einem bereits konsumierten
physischen Netchan-Header mit dem globalen Bitzeiger `bloc`. MiniLang erzeugt
intern eine Offset-null-Sicht auf denselben byteausgerichteten Reststrom und
setzt die dekodierten Bytes anschließend hinter den vier beziehungsweise sechs
Headerbytes wieder ein. Diese interne Anpassung verändert keine Paketbytes.
Eigene Verträge sichern beide Headerbreiten; sämtliche akzeptierten
`SV_Netchan_Process`-Pakete werden vollständig gegen C verglichen.

`scripts/test_server_netchan.py` führt alle fünf unveränderten
`SV_Netchan_*`-Körper zusammen mit unverändertem Netchan-, MSG- und Huffman-Code
aus. Zwölf direkte Datensätze vergleichen vollständige Nachrichten- und
Paketbytes, Cursor, Sequenzen, Fragmentfortschritt und Queuezustand. 26
MiniLang-Verträge ergänzen Prefixschutz, Sonderzeichen im XOR-Schlüssel,
reversible Kodierung, 4-/6-Byte-Process-Header, EOF, FIFO-Aufschub,
Fragmentdrain, Queue-Pop und Dienstfehler. UDP bleibt der injizierte
`NET_SendPacket`-Dienst.
