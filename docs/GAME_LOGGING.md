# Spiel-Logausgabe

Stand: 2026-09-06. `src/mq3/game/logging.ml` implementiert den vollständigen
Ausgabeablauf von Baseq3-`G_LogPrintf`. Der Aufrufer liefert den bereits nach
seinem ursprünglichen Formatstring formatierten Payload an
`logging.write(level,payload)`.

| Schnittstelle | Bedeutung |
| --- | --- |
| `level.time` | Spielzeit als vorzeichenbehafteter 32-Bit-Millisekundenwert |
| `level.dedicated` | Jeder von null verschiedene Integer aktiviert die Konsole |
| `level.logFile` | Aktueller Dateihandle; null deaktiviert Dateiausgabe |
| `gamePrintFn(level,text)` | Sichtbarer Payload ohne Zeitpräfix |
| `logWriteFn(level,data,handle)` | Exakte Dateibytes mit Zeitpräfix, ohne NUL-Terminierung |

`data` ist ein Bytepuffer; seine Länge ergibt sich aus `len(data)`. Die Funktion
öffnet und schließt keine Dateien. Der Host übernimmt Dateiposition,
Append-/Synchronmodus, tatsächliches Schreiben und Konsolentransport.
Vorhandene Spielaufrufer können `logging.write` als `level.gameLogFn` binden.

## Zeitformat und der feste Einfügeoffset

Die Berechnung übernimmt die drei ganzzahligen C-Divisionen durch 1000, 60 und
10 mit Abschneiden in Richtung null. Die Minuten erhalten mindestens drei
Zeichen Breite. Negative oder große Spielzeiten werden nicht auf einen
freundlicheren Bereich begrenzt.

Das Original schreibt den Payload stets an Byteoffset 7 des lokalen Puffers,
auch wenn sein formatierter Zeitstempel länger ist. Deshalb bleiben folgende
Zeitpräfixe vor dem Payload erhalten:

| Millisekunden | Erhaltene sieben Bytes |
| ---: | --- |
| 0 | `"  0:00 "` |
| -1000 | `"  0:0-1"` |
| -11000 | `"  0:-1-"` |
| -60000 | `" -1:00 "` |
| 60000000 | `"1000:00"` |
| 2147483647 | `"35791:2"` |
| -2147483648 | `"-35791:"` |

Der Port bewahrt diese Überlagerung. Er führt keine Gleitkommarundung in die
Zeitberechnung ein. Zeitpräfix und Payload besitzen pro Aufruf eigenen Speicher,
auch wenn ein Hostcallback erneut in den Logger eintritt.

## Reihenfolge, NUL und Dateihandle

Zeitpräfix und Payload werden vor den Ausgaben festgelegt. Bei aktiviertem
Dedicated-Modus erfolgt zuerst die Konsolenausgabe, selbst wenn kein Logfile
offen ist. Erst danach prüft die Funktion den aktuellen `level.logFile`.
Ein Konsolencallback kann den Handle daher schließen, öffnen oder ändern; der
anschließende Dateiaufruf übernimmt diesen aktuellen Wert. Eine Änderung von
`level.time` im Callback verändert den bereits erzeugten Zeitpräfix nicht.

Ein fehlender Konsolenhook ist nur bei erreichter Dedicated-Ausgabe ein Fehler.
Ein fehlender Dateihook ist nur bei einem danach noch von null verschiedenen
Handle ein Fehler. Die Konsolenausgabe kann bei fehlendem Dateihook bereits
erfolgt sein. Die Rückkehr aus dem Dateihook beendet den Logaufruf.

Eingebettete NUL-Bytes sind zulässig. Wie `G_Printf("%s",...)` und das originale
`strlen` sehen beide Ausgaben nur den Payload vor dem ersten NUL. Die Datei
enthält davor genau sieben Zeitbytes und keinen abschließenden Terminator.
Ein leerer oder mit NUL beginnender Payload kann damit eine leere
Konsolenausgabe und einen Dateischreibaufruf mit genau sieben Bytes erzeugen.
Prozentzeichen im bereits formatierten Payload werden nicht erneut ausgewertet.

## Sichere Formatgrenze

`G_LogPrintf` verwendet im Original `string[1024]` und unbeschränktes
`vsprintf(string+7,...)`. Daher dürfen höchstens **1016 fertig formatierte
Payload-Bytes** vor dem zusätzlichen Terminator entstehen. Diese Grenze gilt
auch bei deaktivierter Konsole und geschlossenem Logfile, weil das Formatieren
vor beiden Prüfungen stattfindet.

Bytes hinter einem durch Formatierung erzeugten NUL zählen weiterhin zu diesem
Speicherbedarf. Beispielsweise kann `%c` ein NUL erzeugen, ohne das weitere
Formatieren zu beenden. Der Port weist überlange fertig formatierte Payloads
kontrolliert vor jeder Ausgabe zurück; hierfür wird keine Parität mit dem
undefinierten Stacküberlauf des Originals behauptet. Das gilt auch für einen
fehlenden Payload. Die native Argumentformatierung selbst bleibt Aufgabe der
jeweiligen Spielaufrufer.

Für `G_InitGame` bedeutet dies bei erreichter Logausgabe: Der Payload
`"InitGame: " + serverinfo + "\n"` lässt höchstens 1005 Serverinfo-Bytes zu.
Die Loggergrenze wird nicht durch die größere Serverinfo-Eingabekapazität
aufgehoben.

## Native Referenz und Prüfung

`scripts/test_game_logging.py` extrahiert unverändert `G_LogPrintf` und
`G_Printf` aus dem festgeschriebenen `g_main.c` und verlinkt das tatsächliche
`Com_sprintf` aus `q_shared.c`. Das Profil ist MSVC/x86 mit `/Od`, `/fp:strict`,
`/arch:SSE2`, `/MT` und `/Brepro`.

Ein kleiner x86-Aufrufadapter legt die variadischen Argumente auf den Stack.
Jedes Payload-Byte wird von einem echten `%c` des unveränderten `G_LogPrintf`
formatiert. So erzeugen auch eingebettete NUL und nachfolgende Bytes tatsächliche
`vsprintf`-Ausgaben. Der Adapter ersetzt weder den Logger noch seine
Zeitformatierung. Er verweigert überlange Fixtures vor dem Aufruf; zwei
gesonderte Prüfungen bestätigen diesen Hostvertrag.

Der Differentialtest vergleicht alle Konsolen- und Dateibytes, Dateihandles,
Zeit-/Dedicated-/Handle-Zustände an jedem Hostaufruf und nach jeder Aktion.
Er enthält leere und maximale Payloads, Unicode, Prozentzeichen, NUL, negative
Handles und Integerwerte, Zeitgrenzen, gezielte Callback-Mutationen sowie
verschachtelte Loggeraufrufe. Fest gesetzte Zufallsfolgen ergänzen die
benannten Fälle. Zusätzliche semantische Assertions prüfen konkrete Präfixe,
Ausgabereihenfolge und die getrennten lokalen Puffer.

```powershell
python scripts/test_game_logging.py
```

Der vollständige Lauf besteht mit **106 Szenarien**, **783 Aktionen**,
**12.779 exakt gleichen 32-Bit-Wörtern**, **1.359 geordneten Nebenwirkungen**,
**4.148 zusätzlichen semantischen Assertions** und **101.813 Ausgabe-Bytes**.
Verglichen werden **649 Konsolenaufrufe**, **710 Dateiaufrufe** und deren
**28.242 Dateibytes**. **13 MiniLang-Verträge** ergänzen die definierten
Nativefälle; zwei Oracle-Fixture-Ablehnungen testen die Formatgrenze getrennt.

Ein vollständiger Neubuild schreibt `build/reference/game_logging/result.json`.
`--reuse-build` schreibt stattdessen `reused-all.json`; mit `--case` ersetzt der
eindeutige Artefaktstamm `all`, und `--native-only` ergänzt `.native.json`.
Wiederverwendete Binaries überschreiben dadurch keine kanonischen Berichte.
`oracle_fixture_rejections` archiviert beide abgewiesenen Fixtures mit Name,
`artifact_stem`, `input_sha256`, Status und Diagnose; die Anzahl steht separat
in `oracle_fixture_rejection_count`.
Test-SHA256: `baa6235a8ebe0835b2a1f3a3a63ccc12d0a102b200572ae18a32621f2ebb0ceb`.
Oracle-SHA256: `0e2e2272a81275a976f7118bff41f58a776182c7ce46569ee31070a3db3c9906`.
Quell- und Szenariohashes stehen im Ergebnisbericht.
