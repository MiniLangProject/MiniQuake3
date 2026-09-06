# IP-Filter und Ban-Persistenz

Stand: 2026-09-06. Alle sieben IP-Funktionen aus dem festgeschriebenen
Baseq3-`g_svcmds.c` sind in `src/mq3/game/ip_filters.ml` implementiert.
`ClientConnect` verwendet diese Filter, wenn kein expliziter
`filterPacketFn`-Hostoverride gesetzt ist.

| Originalfunktion | MiniLang-Funktion |
| --- | --- |
| `StringToFilter` | `stringToFilter(level,text,filter)` |
| `UpdateIPBans` | `updateBans(level)` |
| `G_FilterPacket` | `filterPacket(level,address)` |
| `AddIP` | `addIP(level,text)` |
| `G_ProcessIPBans` | `processBans(level)` |
| `Svcmd_AddIP_f` | `addCommand(level,argv)` |
| `Svcmd_RemoveIP_f` | `removeCommand(level,argv)` |

## Filterzustand und Parser

`get(level)` legt 1024 getrennte Filterobjekte mit den beiden ursprünglichen
32-Bit-Feldern `mask` und `compare` an. `count` entspricht `numIPFilters`: Er
beschreibt die bisher belegte Reichweite und wird beim Entfernen nicht kleiner.
Ein freier Eintrag trägt `compare == 0xffffffff`; sein alter Maskenwert bleibt
erhalten. AddIP verwendet zuerst den niedrigsten freien Eintrag und vergrößert
die Reichweite erst danach. Bei voller Liste erfolgt ausschließlich die
ursprüngliche Diagnose, kein Cvar-Schreibaufruf.

Der Maskenparser übernimmt die großzügigen Originalregeln. Fehlende hintere
Oktette bleiben Wildcards, `*` setzt ein unmaskiertes Byte, und zwischen
Oktetten wird ein beliebiges Zeichen übersprungen. Nach dem vierten Oktett
wird weiterer Text ignoriert. Zahlen laufen durch das native CRT-`atoi` und
werden anschließend auf ein Byte reduziert. Die vier Bytes werden im
Little-Endian-Profil des Referenzbuilds zu den 32-Bit-Wörtern zusammengesetzt.
Eine gescheiterte Konvertierung verändert den Ausgabe-Filter nicht und meldet
den verbleibenden fehlerhaften Text. AddIP markiert den betroffenen Eintrag erst
nach dieser Diagnose als frei und aktualisiert anschließend die Persistenz.

Auch die Sentinel-Kollision des Originals bleibt erhalten:
`255.255.255.255` ist ein erfolgreicher Maskenparse, erscheint aber beim
Speichern als freier Eintrag und kann vom nächsten AddIP überschrieben werden.
Die Paketprüfung überspringt freie Einträge nicht. Ein entfernter vollständig
maskierter Filter kann deshalb weiterhin das Paket `255.255.255.255` treffen.
Ein entfernter Wildcard-Filter besitzt diese Eigenschaft nicht.

RemoveIP vergleicht beide Maskenwörter exakt und entfernt nur den ersten
Treffer. Eine einzelne Adresse entfernt kein größeres Subnetz; verschiedene
Schreibweisen mit denselben geparsten Wörtern sind dagegen gleichwertig.
Die Kommandohandler verwenden die vorhandene Argumentkopie mit 1023 nutzbaren
Bytes und den originalen Usage-, Fehler- und Erfolgstexten.

## Engine-Cvars und die veränderliche VM-Kopie

Die Entscheidungen lesen die tatsächlichen VM-Zeilen `g_filterBan` und
`g_banIPs` aus `level.gameCvars`. Ein beliebiger von null verschiedener
Integerwert aktiviert die Ban-Liste; null aktiviert die Whitelist. Ausstehende
Änderungen der Engine-Registry werden erst nach dem üblichen VM-Refresh wirksam.

Für isolierte Hosts bindet `bindVm(level,banVm,filterBanVm)` explizit erzeugte
und registrierte VM-Objekte. Eine vorhandene Game-Cvar-Tabelle hat immer Vorrang;
fehlende Zeilen werden nicht durch verborgene Standardwerte ersetzt.
`filterVm(level,name)` gibt das verwendete VM-Objekt zurück. Diagnosen gehen
über `gamePrintFn`, Persistenz über `cvarSetFn`. Die Hooks werden erst am
tatsächlich erreichten Ausgabeaufruf benötigt.

UpdateIPBans erzeugt kanonische Einträge mit Punkten und einem abschließenden
Leerzeichen. Maskenbytes ungleich 255 erscheinen als `*`. Höchstens 255 Bytes
passen vor das abschließende NUL des 256-Byte-Cvar-Puffers. Bereits eine Summe
von 256 Bytes löst die Originaldiagnose aus und beendet das Sammeln; die
internen Filter bleiben vollständig aktiv. Dadurch können gültige Bans wirken,
obwohl sie im gespeicherten Text fehlen. Der Cvar-Schreibaufruf erfolgt auch
nach einem solchen Überlauf.

G_ProcessIPBans kopiert im C-Code zunächst in einen unbenutzten lokalen Puffer,
parst danach aber direkt `g_banIPs.string`. Der Port bildet diese Mutation ab:
ASCII-Leerzeichen werden im echten logischen VM-Puffer zu NUL, aufeinanderfolgende
Leerzeichen werden gemeinsam verbraucht und vorhandene Filter werden nicht
gelöscht. Nur ein mit Leerzeichen abgeschlossener Eintrag wird importiert;
der letzte Eintrag ohne Leerzeichen wird ignoriert. Tabs bleiben Teil eines
Tokens. Ein erneuter Aufruf ohne VM-Refresh sieht normalerweise nur den bereits
abgeschnittenen ersten Präfix.

`VM.string` enthält den sichtbaren C-String. `banBytes(level)` stellt den
vollständigen 256-Byte-Puffer einschließlich der Bytes hinter dem ersten NUL
bereit. So bleiben spätere Tokens während desselben Process-Aufrufs erreichbar.
Ein erfolgreicher VM-Refresh ersetzt den Puffer mit Nullauffüllung: Im gepinnten
`code/qcommon/cvar.c:876–881` wird dies ausdrücklich beschrieben und
`Q_strncpyz(...,MAX_CVAR_VALUE_STRING)` aufgerufen. Die Implementierung in
`code/game/q_shared.c:723–724` benutzt `strncpy` mit anschließendem finalen NUL.
Bei unverändertem Modification-Counter überspringt Cvar_Update dagegen die Kopie;
auch der bereits mutierte Restpuffer bleibt dann erhalten. Der eigene Native-Host
benutzt hierfür die tatsächlichen Original-Cvar-Funktionen.

Eine erneute Registrierung setzt den VM-Counter zunächst auf -1. So kann sie
eine vollständige Kopie erzwingen, obwohl VM-Identität, sichtbarer Text und
abschließender Counter unverändert aussehen. Der VM-Port zählt deshalb jede
tatsächlich erfolgreiche Kopie mit einer internen `copyGeneration`; der Ban-Cache
beobachtet dieses Kopierereignis zusätzlich. Ist der Engine-Counter selbst -1,
überspringt das Original die Kopie hingegen auch bei Registrierung. Das bloße
Ändern eines Counters darf den Restpuffer deshalb nicht zurücksetzen.

Die native Reproduktion schreibt etwa Byte 100 eines ansonsten leeren
`g_banIPs.string` auf 88. Ein unverändertes Update und ProcessIPBans lassen es
stehen; erneute Registrierung bei Counter 1 setzt es durch echte Nullauffüllung
auf 0. Alle sichtbaren VM-Felder bleiben dabei identisch. Weitere Fälle prüfen
gefüllte Strings, versteckte Tokens, Byte 254, Parse-Aufrufe vor und nach der
Registrierung sowie beide -1-Counter-Konstellationen. Die C-Referenz enthält
keine künstliche Generation und behält ihr ursprüngliches Snapshotformat.

## ClientConnect und definierte Grenzen

Der bisherige `filterPacketFn`-Override bleibt erhalten. Ohne Override läuft die
reale IP-Entscheidung vor Client-Reset, Session-Änderung und Verbindungsankündigung.
Die ClientConnect-Verträge prüfen Ban- und Whitelist-Ablehnung sowie einen weiter
funktionierenden expliziten Override.

Der originale Paketparser initialisiert seine vier lokalen Bytes nicht vorab.
Der native Vergleich ist deshalb auf Eingaben begrenzt, deren Parse alle vier
Oktette tatsächlich initialisiert. `1.2.3`, `1.2:27960` und `1.2.3.` erfüllen
diese Bedingung nicht und werden in MiniLang kontrolliert abgewiesen. Dabei
gilt ausdrücklich keine strengere IPv4-Syntax: `localhost` initialisiert im
Original vier nichtnumerische Null-Oktette, `1.2.3.a` initialisiert sein viertes
Oktett ebenfalls. Solche definierten Originalpfade bleiben erhalten. Es findet
keine DNS-Auflösung statt.

Eingebettete NUL-Bytes und mindestens 128 aufeinanderfolgende Ziffern innerhalb
eines Masken-Oktetts werden zusätzlich kontrolliert abgewiesen. Letztere würden
den nativen `num[128]`-Puffer überschreiben. Für diese Speicherfehler und für
uninitialisierte Paket-Oktette wird keine C-Parität behauptet. Der native
CRT-Zahlenbereich bleibt an das Windows/MSVC-Referenzprofil gebunden.

Auch die Originalgrenze von `G_Printf` wird berücksichtigt: `g_main.c` formatiert
mit unbeschränktem `vsprintf` in `msg[1024]`. Eine Diagnose mit mehr als 1023
Ausgabe-Bytes würde diesen Puffer überschreiben. Der Port weist sie vor dem
Print-Sink kontrolliert ab. Die Nativefälle enthalten nur passende Diagnosen,
darunter exakt 1023 Byte lange Bad-Address- und Remove-Miss-Nachrichten. Zwei
gesonderte Prüfungen bestätigen, dass der Oracle-Host überlange Diagnose-Fixtures
ablehnt; diese Host-Verträge gelten ausdrücklich nicht als native Spielparität.

`Level.ipFilters` hält den Modulzustand. Ein Host muss ihn bei einem Levelwechsel
erhalten oder ausdrücklich wiederbinden, solange das ursprüngliche Spielmodul
weiterlebt. Automatischer Gesamtmodul-Lifecycle, Engine-Tokenizer,
Netzwerktransport und tatsächliche Paketannahme gehören nicht zu dieser Suite.
Die Serverkonsole bindet die öffentlichen Add-/Remove-/Process-APIs im eigenen
Dispatcher ein; dessen übrige Befehle werden separat geprüft.

## Referenz und Prüflauf

`scripts/test_ip_filters.py` extrahiert alle sieben unveränderten Funktionskörper
und die ursprüngliche Filterdeklaration aus dem festgeschriebenen Checkout.
Der Native-Host verlinkt zusätzlich das echte `qcommon/cvar.c` und
`game/q_shared.c`. Er wird mit MSVC für x86, `/Od`, `/fp:strict`, `/arch:SSE2`,
`/MT` und `/Brepro` gebaut. Es gibt keine neu geschriebene C-Fassung der
Filterregeln.

Nach jeder Aktion und an jeder Diagnose beziehungsweise jedem Cvar-Schreibaufruf
werden sämtliche 1024 Filter, der vollständige Ban-VM-Puffer, beide VM-Snapshots
und beide Engine-Cvars verglichen. Die Beobachtung des Cvar-Hooks erfolgt vor
der Änderung der Engine-Registry. Direkte Test-Fixtures füllen die 1024er-Liste,
damit auch Kapazität, letzter Slot und Wiederverwendung geprüft werden; die
anschließenden Add-/Remove-/Persistenzaufrufe bleiben die Originalfunktionen.
Fest gesetzte Zufallsfolgen ergänzen die benannten Grenzfälle. Zusätzlich zum
Binärvergleich prüft der Runner konkrete semantische Aussagen, unter anderem
Sentinel-Kollisionen, ausstehende VM-Änderungen und den 255-Byte-Persistenzrand.

```powershell
python scripts/test_ip_filters.py
```

`--reuse-build` schreibt getrennte `reused-*.json`-Berichte. `--case` benennt den
ausgewählten Fall; `--native-only` verwendet zusätzlich die Endung `.native.json`.
Kanonische Ergebnisse eines Neubuilds werden dadurch nicht ersetzt.

Der vollständige Vergleich nach dem erneuten MiniLang-Build besteht mit
**99 Szenarien**, **1.057 Aktionen**, **3.671.989 exakt gleichen 32-Bit-Wörtern**,
**652 geordneten Nebenwirkungen**, **4.632 zusätzlichen semantischen Assertions**
und **14.773.089 Ausgabe-Bytes**. Die vollständigen Ergebnis-Records der
ursprünglichen 90 Szenarien bleiben unverändert, einschließlich Reihenfolge,
Namen, Eingabe- und Native-Ausgabehashes sowie sämtlicher Fallmetriken.
**36 Laufzeitverträge** prüfen die ergänzenden MiniLang-Grenzen. Die separat
bereits geprüften ClientConnect-Verträge umfassen **27 Prüfungen**.

Der aktuelle kanonische Neubuild und Vergleich steht in
`build/reference/ip_filters/result.json`; er enthält auch die abschließende
Korrektur der Counter-Reihenfolge vor einem fehlgeschlagenen Cvar-Update.
Test-Binary-SHA256:
`5dd19401f6163f3cb275071c7ba7284f4b1f7af19f0bf895ea966a97ecead6c3`.
Oracle-SHA256:
`331f284bdd493ac867ce47ee352d429a58df99f3bdc8739e72186221ee377749`.
Quell- und Fallhashes stehen im Ergebnisbericht.
