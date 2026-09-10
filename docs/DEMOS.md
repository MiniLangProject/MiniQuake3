# Protocol-68-Demos

`src/mq3/client/demo.ml` portiert das Dateiframing der Baseq3-Funktionen
`CL_WriteDemoMessage`, `CL_StopRecord_f`, `CL_DemoFilename` und
`CL_ReadDemoMessage`. Jeder Datensatz enthält die Servernachrichtensequenz und
die Nutzdatenlänge als Little-Endian-Integer, gefolgt von der Nachricht ohne
Netchan-Header. Zwei Werte `-1` bilden den regulären Dateabschluss.

Der Port unterscheidet einen sauberen physischen Dateischluss von abgeschnittenen
Sequenz-, Längen- und Nutzdatenfeldern. Negative Längen außer `-1` und Nachrichten
über `MAX_MSGLEN` werden verworfen. Der Wiedergabezustand übernimmt die gelesene
Sequenz bereits vor der Längenprüfung und setzt `lastPacketTime` erst für einen
vollständigen Nutzdatensatz, wie der Originalpfad. Die Nummerierung ohne
vorgegebenen Namen entspricht `demo0000` bis `demo9999`; außerhalb von 0 bis 9999
liefert die historische Originalfunktion `demo9999.tga`.

`encodeInitialGamestate` erzeugt außerdem den von `CL_Record_f` vorangestellten
vollständigen Gamestate-Datensatz. Er enthält Reliable-Acknowledgement,
Server-Command-Sequenz, Configstrings, Entity-Baselines, Clientnummer,
Checksum-Feed und beide `svc_EOF`-Marken. Der Vertragstest dekodiert diesen
Datensatz wieder mit dem produktiven MiniLang-Gamestate-Parser.

```powershell
python scripts/test_demo.py
```

Zwölf direkte Datensätze führen die unveränderten Körper von
`CL_WriteDemoMessage`, `CL_DemoFilename` und `CL_ReadDemoMessage` aus und
vergleichen vollständige Bytes, Namen sowie Wiedergabeübergänge mit MiniLang.
Die 27 Verträge prüfen zusätzlich Headerentfernung, leere und verkettete
Datensätze, EOF, Trunkierung, Größenlimits, Dateinamen, Zustandszeit und den
synthetischen Start-Gamestate. Dateisystembefehle, Timedemo-Uhr und die laufende
Wiedergabeschleife bleiben weitere Integrationsarbeit.
