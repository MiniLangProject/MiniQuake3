# Baseq3-Befehle der Serverkonsole

`src/mq3/game/server_commands.ml` portiert `Svcmd_EntityList_f`, `ClientForString`,
`Svcmd_ForceTeam_f` und `ConsoleCommand` aus dem festgeschriebenen Original
`g_svcmds.c`. Der Einstieg lautet `command(level, argv) -> bool`. `argv` enthält
bereits von der Engine getrennte Argumente, einschließlich leerer Argumente und
solcher mit Leerzeichen. Die Zerlegung einer Befehlszeile und die Ausführung des
Engine-Befehlspuffers bleiben eigene Arbeitspakete.

## Verteilung und Integration

| Originalbefehl | Verhalten in MiniLang |
| --- | --- |
| `entitylist` | Listet belegte Entities von Slot 1 bis `num_entities-1`; einzelne Print-Aufrufe, native Feldbreiten, Typbezeichnungen, optionale Klassennamen und abschließende Zeilenumbrüche bleiben erhalten. |
| `forceteam` | Sucht den persistenten Client und ruft das echte `team_changes.setTeam` auf. Tod, Gegenstandsabwurf, Teamführung, Rangfolge, Userinfo, Sessions und Respawn verwenden ihre regulären Implementierungen. |
| `game_memory` | Ruft das echte `memory.status` für die 256-KiB-Arena des Levels auf. |
| `addip`, `removeip` | Rufen die echten Befehlsimplementierungen aus `ip_filters` auf. |
| `listip` | Ruft `level.consoleCommandFn(level, 0, "g_banIPs\n")` mit dem originalen `EXEC_NOW` auf. |
| `addbot`, `botlist` | Verlangen explizite Callbacks für Boterstellung beziehungsweise Botliste. |
| `abort_podium` | Nutzt standardmäßig den portierten Podiumsabbruch; ein installierter Callback kann ihn für Tests überschreiben. |
| `say` oder ein unbekannter Befehl auf einem Dedicated-Server | Sendet den originalen Server-Print an Client-Slot -1, mit den echten Bytegrenzen von `ConcatArgs` und ohne zusätzlichen Zeilenumbruch. |
| Unbekannter Befehl auf einem Listen-Server | Liefert ohne weiteren Effekt false zurück. |

Befehlsnamen werden ohne Beachtung der ASCII-Groß-/Kleinschreibung verglichen.
Argumente verwenden den nativen Zielpuffer von 1.024 Bytes. `ConcatArgs` bewahrt
die Argumentgrenzen sowie das bereits geschriebene Trennleerzeichen vor einem
zu langen Token. Bekannte Befehle liefern auch dann true zurück, wenn ihre
Hilfsfunktion die Anfrage zurückweist. Bekannte Bot- und IP-Befehle haben
Vorrang vor der Chatbehandlung unbekannter Dedicated-Server-Befehle.

`clientForString(level, text)` behandelt die Eingabe nur dann als numerischen
Slot, wenn ihr erstes Byte eine Ziffer ist; anschließend gilt die originale
Präfixauswertung durch `atoi`. Die Namenssuche vergleicht den unveränderten Namen
mit ASCII-Faltung: Farbcodes, Leerzeichen und andere UTF-8-Bytes bleiben erhalten.
Sie überspringt getrennte Clients, akzeptiert noch verbindende Clients und wählt
den ersten passenden persistenten Client. Entity-Belegung und Clientbindung
spielen bei der Suche keine Rolle. `forceTeam(level, argv)` bestimmt zuerst
diesen persistenten Slot und verwendet anschließend die aktuelle Clientbindung
der Entity. Die Serverkonsole prüft keine Wartezeit des Client-Befehls; der echte
Respawn kann diese Wartezeit beim Zurücksetzen des Clients auf null setzen.

`attach(level, addBotFn, botListFn, abortPodiumFn)` installiert drei Callbacks mit
der Signatur `(level, argv)`. `get(level)` bewahrt sie pro Level. Fehlende
Bot-Implementierungen führen zu expliziten Vertragsfehlern; der fehlende
Podiums-Callback fällt auf die echte Implementierung zurück. Das native Oracle
beobachtet dieselben drei Grenzen und ersetzt dort kein Botverhalten durch
vereinfachte Spielalgorithmen.

Die Differenztest-Fixture führt `ClientSpawn` tatsächlich aus. Dessen
anschließende Aufrufe von `ClientThink` und `ClientEndFrame` beobachtet sie über
die vorhandenen Override-Hooks; diese beiden verschachtelten Frame-Funktionen
laufen in der isolierten Konsolensuite nicht erneut. Die normalen Spielpfade
außerhalb der Fixture verbinden die echten Standardports. Deren eigene Suiten
prüfen das Frame-Verhalten.

Die bestehenden `gamePrintFn`, `serverCommandFn` und `consoleCommandFn` liefern
die Ausgabe aus. `serverPrint` weist eine einzelne formatierte Ausgabe ab
1.024 Bytes zurück: Dort würde das originale `G_Printf` mit `vsprintf` seinen
Puffer `text[1024]` überschreiben. Slot- und Typausgabe der Entityliste erfolgen
vor der Zurückweisung eines überlangen Klassennamens. Ungültige native
Client-/Entitybereiche und eingebettete NUL-Bytes sind ebenfalls durch
MiniLang-Laufzeitverträge abgesichert.

## Differenzprüfung

Der Aufruf lautet `python scripts/test_server_commands.py`. `--case NAME` wählt
einen Fall aus; `--reuse-build` verwendet vorhandene Programme und schreibt eine
separate Ergebnisdatei. Die reguläre Gesamtprüfung führt die komplette Suite aus.

Der Runner enthält 182 deterministische Szenarien und 30 Laufzeitverträge:

- Jeden Konsolenzweig, ASCII-Schreibvarianten, fehlende und zusätzliche
  Argumente, alle 64 argv-Einträge, Anführungszeichen, Zeilenumbrüche, UTF-8 und
  exakte Bytegrenzen von `ConcatArgs`.
- Numerische und unveränderte Namenssuche, doppelte Namen, verbindende und
  getrennte Clients, ungebundene Entities, Clientgrenzen 0/64 und den letzten Slot.
- Teamwechsel in allen fünf Baseq3-Spieltypen, Zuschauermodi, Ablehnungen wegen
  Teambalance oder Kapazität, Tod/Flaggenrückgabe/Respawn, Intermission,
  abweichende persistente Clientbindung, Respawn am letzten Slot sowie eine
  Folge aus Server- und echten Client-Befehlen.
- Jeden Entitytyp, unbekannte vorzeichenbehaftete Typwerte, Slot 1023, den
  ausgelassenen Slot null, fehlende/leere Klassennamen und die exakt noch sichere
  Ausgabegröße von `G_Printf`.
- Echten Arenastatus, leere/ungerade/vollständige Allokationen, die Reihenfolge
  der Debug-Ausgaben, Reset und Speicherstand über ClientSpawn hinweg. Poolbytes,
  `G_NewString` und sämtliche Spawn-Stringfelder prüft zusätzlich die eigene
  Speichersuite.
- Echte IP-Befehle, Wildcards, Byteüberlauf und Trennzeichenregeln, Entfernung
  exakter Masken, Wiederverwendung freier Einträge, Duplikate, Sperr-/Erlaubnislisten,
  Überlauf und den Unterschied zwischen Engine-Cvar und veränderlicher VM-Kopie.

Jede Aktion und jeder Host-Effekt prüft den vollständigen gemeinsamen Zustand
von Clients, Entities, Teams, Sessions und Abstimmungen. Der Konsolenanhang prüft
Arenaposition und Debugmodus, alle 1.024 IP-Masken-/Vergleichspaare, sämtliche
256 Bytes des Ban-VM-Puffers, den Filtermodus und den Ban-String der Engine.
Bot-Effekte bewahren zusätzlich die rohen Argumentlängen und -grenzen. Ein
separater Python-Leser prüft Datensatzgrenzen, Effektanzahlen, Konsolenrückgaben,
Suchergebnisse, tatsächliche Zielteams, Speicherpositionen, Ausgabetexte und
Filterentscheidungen unabhängig vom MiniLang-Vergleich.

Das native Oracle führt die unveränderten originalen Konsolen-, IP- und
Speicherfunktionen mit deren statischer Arena und IP-Tabelle aus. `G_Alloc` und
`G_FilterPacket` wählen in diesem Modus die echten Algorithmen. Ältere isolierte
Testmodi behalten ihre bisherigen Host-Grenzen. Originaldateien bleiben
unverändert. Fälle mit undefiniertem Verhalten im Original sind von nativen
Vergleichen ausgeschlossen und, soweit relevant, als MiniLang-Verträge erfasst.
Der Nachweis umfasst weder vollständige Bot-KI noch Engine-Tokenisierung oder
eine bereits vollständig spielbare Engine.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
