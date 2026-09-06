# Karteninitialisierung: Entity-Gruppen, Itemregistrierung und CTF

Stand: 6. September 2026. Referenz ist der unveränderte Baseq3-Quellstand
dbe4ddb10315479fc00086f08e25d968b4b43c49.

| Originalfunktion | MiniLang |
|---|---|
| G_FindTeams | initialization.findTeams(level) |
| ClearRegisteredItems | items.clearRegistered(level) |
| RegisterItem | items.register(level,item) |
| SaveRegisteredItems | items.saveRegistered(level) |
| Team_InitGame | items.initTeamGame(level) |
| G_CheckTeamItems | items.checkTeamItems(level) |

Team_SetFlagStatus verwendet weiterhin den bestehenden Port
items.setFlagStatus. Die Funktionen sind inzwischen in die ursprüngliche
Aufrufreihenfolge von [G_InitGame](GAME_LIFECYCLE.md) eingebunden. Engine-Kartenwechsel,
Bot-KI und noch fehlende Kartenklassen bleiben eigene Aufgaben.

## Verhalten und Reihenfolge

Die originale Reihenfolge in G_InitGame lautet: Registrierungsbits löschen,
Map-Entities erzeugen, Entity-Gruppen verbinden, ab GT_TEAM die Team-Items
prüfen und anschließend die registrierten Items veröffentlichen.

G_FindTeams beginnt bei Entity 1. Es berücksichtigt nur aktive Entities mit
einem nicht-NULL Teamstring, die noch kein FL_TEAMSLAVE tragen. Ein leerer
String ist ein gültiger Gruppenname; Groß- und Kleinschreibung unterscheiden
Gruppen. Jeder weitere Treffer wird am Anfang der vorhandenen teamchain
eingefügt. Die bestehende Kette des Masters bleibt erhalten. Der letzte Slave
mit einem nicht-NULL targetname überträgt diesen an den Master, auch wenn der
Name leer ist. Die Diagnose mit Gruppen- und Mitgliederzahl erfolgt nach allen
Änderungen. Wiederholte Aufrufe behalten bestehende Slave-Ketten bei.

Die Itemregistrierung umfasst 256 Ganzzahlplätze. ClearRegisteredItems
löscht alle Plätze im vorhandenen Array und registriert anschließend
Machinegun, dann Gauntlet. SaveRegisteredItems schreibt genau die ersten
36 Bits aus bg_numItems als Zeichenfolge nach CS_ITEMS (27). Jeder
nichtnull Ganzzahlwert zählt als registriert. Die Anzahl wird vor der
Configstring-Veröffentlichung gedruckt.

RegisterItem prüft im Original nur den NULL-Zeiger. Der MiniLang-Port erlaubt
deshalb auch die vorhandenen Arraydeskriptoren 0 (Dummy) und 36 (Endmarkierung).
Bit 36 erscheint nicht in CS_ITEMS. Item-Pickups und Item-Spawns behalten
ihre strengere Prüfung auf echte spielbare Items 1 bis 35. Ein Typvergleich
unterscheidet Integer 0 von void, weil der eingefrorene Compiler beide bei
einem einfachen Gleichheitsvergleich als gleich behandelt.

Team_InitGame löscht alle neun Felder der nativen teamgame-Struktur:
letzten Flaggenfang, Fangteam, drei Flaggenstatus, zwei Aufnahmezeiten und
die beiden auch in Baseq3 vorhandenen Obeliskzeiten. Teamscores,
Registrierungsbits und Entity-Gruppen bleiben erhalten. Außerhalb CTF wird
kein Flaggen-Configstring veröffentlicht. G_CheckTeamItems initialisiert
zuerst diesen Zustand und meldet in CTF anschließend fehlende rote und blaue
Flaggen in dieser Reihenfolge. Die Warnungen haben im Original keinen
abschließenden Zeilenumbruch.

## Einzelne undefinierte Stelle im Original

CTF setzt zunächst beide Flaggenstatus auf -1. Beim ersten
Team_SetFlagStatus(TEAM_RED,FLAG_ATBASE) liest der Originalcode für Blau
ctfFlagStatusRemap[-1]. Das liegt außerhalb des Arrays; der Wert ist nicht
durch C definiert.

MiniLang veröffentlicht bei diesem ersten Aufruf den garantierten roten
Präfix "0" und definiert das unbekannte zweite Byte als NUL. Der beobachtbare
Zwischenzustand lautet dabei Rot 0, Blau -1. Der zweite Aufruf verwendet den
unveränderten allgemeinen Flaggenstatus-Port und veröffentlicht "00".
Beide Veröffentlichungen und ihre ursprüngliche Reihenfolge bleiben erhalten.
Die Vertragsprüfung des allgemeinen setFlagStatus wurde dafür nicht
aufgeweicht.

Das native Oracle führt die originalen Funktionskörper aus und archiviert
die drei Bytes der ersten Veröffentlichung vor jeder Normalisierung in
build/reference/initialization/*.raw.jsonl. Nur das undefinierte blaue Byte
wird für den Vergleich als NUL behandelt. In diesem Lauf waren die
archivierten Rohbytes 30 00 00; daraus wird keine portable Garantie
abgeleitet. Die 18 betroffenen Bytes sind ausdrücklich vom Nachweis exakter
Parität ausgenommen. Roter Präfix, vollständiger Zwischenzustand, beide
Callback-Aufrufe und endgültiger Wert "00" werden geprüft.

## Differentialnachweis

scripts/test_initialization.py baut ein eigenes natives Oracle mit
unveränderten Funktionen aus g_main.c, g_items.c, g_team.c und den
tatsächlichen bg_itemlist-Suchfunktionen. Der Vergleich erfasst nach jeder
Aktion sowie bei jedem Print- und Configstring-Callback sämtliche relevanten
Entity-Felder, Gruppenzeiger und Namen, alle 256 Registrierungsplätze, alle
neun Teamfelder, unveränderte Teamscores und beide Configstrings.

Der vollständige Lauf bestand:

| Nachweis | Ergebnis |
|---|---:|
| Szenarien | 71 |
| Aktionen | 223 |
| Exakt verglichene 32-Bit-Wörter | 202.891 |
| Geordnete Host-Effekte | 189 |
| Vergleichsdaten einschließlich Strings | 950.301 Bytes |
| Separat ausgewiesene native Byte-Normalisierungen | 18 |
| Originaler Fehlerabbruch RegisterItem(NULL) | 1 |
| Laufzeitverträge | 13 |

Die Fälle umfassen NULL und leere Teamnamen, Groß-/Kleinschreibung, übersprungene
Slaves, vorhandene und zyklische Gruppenzeiger, Entity 1023, wiederholtes
Gruppieren, alle Basis-Items, Dummy/Endmarkierung, nichtkanonische
Registrierungswerte, jede Kombination vorhandener CTF-Flaggen und wiederholte
Teaminitialisierung nach veränderten Live-Statuswerten.

Bericht: build/reference/initialization/result.json.

- MiniLang-Test SHA-256:
  62014506192e0ff44e51fcf1fb6eac84294a046e4a250a7f602b937433aa2cb5
- Native Oracle SHA-256:
  0d095ac01b123a562cf107b4f67a17af83a57e990373ddb4672226e855033696
- Test-BSP SHA-256:
  22631605b62b568cab3cec99ccfdf71a64ce9964f12b5e4256329ef30a769c3c

## Verbleibende Grenzen

Missionpack-Obelisken, One-Flag-CTF und Harvester werden nicht als Gameplay
portiert. Die zugehörigen vorhandenen Teamstatusfelder werden bei der
gemeinsamen Initialisierung trotzdem originalgetreu zurückgesetzt.
Außerhalb der dargestellten Itemdeskriptoren werden künstliche Zeiger nicht
nachgebildet. Eingebettete NUL-Zeichen in Gruppenstrings und Entity-Bereiche
außerhalb des Speicherbestands werden als Laufzeitfehler abgewiesen.
