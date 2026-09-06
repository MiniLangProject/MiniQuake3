# Spielmodul-Speicher und Spawn-Strings

`src/mq3/game/memory.ml` portiert `G_Alloc`, `G_InitMemory` und
`Svcmd_GameMem_f` aus dem festgelegten `g_mem.c`. `G_NewString` verwendet
dieselbe Arena. Der normale Entity-Spawnpfad ruft diese Implementierung für
alle neun `F_LSTRING`-Felder auf, beispielsweise `classname`, `message`,
`target`, `team` und die beiden Shadernamen.

Die Arena enthält 262.144 Bytes. Jede Reservierung rückt den Zeiger auf das
nächste Vielfache von 32 vor. Eine Reservierung von null Bytes gibt den
aktuellen Ort zurück und verschiebt ihn nicht; am Poolende ist dieser leere
Bereich ebenfalls erlaubt. `G_InitMemory` setzt ausschließlich den Zeiger
zurück. Daten und Padding bleiben erhalten. Block-Handles beziehen sich
weiterhin auf dieselben Bytes und zeigen deshalb auch spätere Überschreibungen.

`g_debugAlloc` wird aus dem VM-Cvar gelesen, sobald Spiel-Cvars gebunden sind.
Eine noch nicht aktualisierte Engine-Änderung wirkt sich entsprechend erst
nach dem VM-Refresh aus. Die Debugausgabe erfolgt vor der Kapazitätsprüfung
und vor der Zeigeränderung. Ein abgewiesener Platzbedarf verändert den
Allokationszeiger nicht. Die Serverkonsole verwendet dieselbe Arena für
`game_memory`.

`G_NewString` reserviert die ursprüngliche Bytezahl einschließlich NUL.
`\n` wird zum Zeilenumbruch; andere Escape-Paare erzeugen einen Backslash.
Nicht geschriebene Bytes werden nicht gelöscht. Ein eingebettetes NUL beendet
den Eingabestring wie bei `strlen`. Ein abschließender Backslash lässt im
Original den Terminator entfallen; MiniLang meldet dafür nach den tatsächlich
ausgeführten Reservierungen und Schreibzugriffen einen Fehler.

Der Vergleich verwendet unverändertes `g_mem.c` sowie die aus der Originaldatei
übernommenen Körper von `G_NewString` und `G_ParseField`. Der C-Host liefert
nur Ein-/Ausgabe und Testaktionen. Er beobachtet Debugmeldungen samt vorherigem
Zeiger, alle Blockpositionen und Größen, gelesene Poolbytes, Entity-Strings und
den Zustand nach jeder Aktion. Ein separater Python-Leser prüft unter anderem
konkrete Ausrichtung, Bytefolgen, Aliase, Erschöpfung und Escape-Ergebnisse.

```powershell
python scripts/test_game_memory.py
```

Die Suite umfasst 53 Szenarien mit 1.566 Aktionen, 125.480 exakt gleichen
32-Bit-Wörtern und 412 geordneten Ausgaben. Sechs ursprüngliche
Kapazitätsfehler und 28 zusätzliche MiniLang-Verträge sind geprüft.

Die Vergleichsdomäne umfasst Größen von 0 bis 2.147.483.616 Bytes, wobei
`allocPoint + size` höchstens `INT_MAX` sein darf. Eingaben außerhalb dieser
konservativen Domäne erhalten eigene Vertragsfehler. Das schließt auch größere
Anforderungen aus, die C bei deaktivierter Debugausgabe bereits vor der
Ausrichtungsrechnung als Kapazitätsfehler ablehnen kann. Entity-Stringfelder bleiben eigene MiniLang-Strings;
beliebiges Aliasing von C-Stringzeigern ist damit nicht zugesichert.
Die vollständige Reihenfolge von `G_InitGame`, `G_ShutdownGame` und
Engine-Kartenwechseln ist weiterhin eine gesonderte offene Integration.

Test-Binary: `4ad58b96c997fb5f4ac56262281959b8b772708b5c131d651254de0bb2059a6d`.
Native x86-Oracle: `80c7cefc3b6aac37d9adb0118e78490f10e07addfb796c1928c3890522f29b3f`.
