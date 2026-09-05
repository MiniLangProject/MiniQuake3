# MiniQuake3

Projekt für einen möglichst originalgetreuen Port von Quake III Arena nach MiniLang.
Status: Implementierung läuft. Ein nativer MiniLang-Build mit Zahlenkompatibilität,
Cvars, Parser, PK3/DEFLATE, BSP-Leser, QVM-Interpreter, BSP-/Kurvenkollision und
dem vollständigen baseq3-Pmove-Befehlszyklus ist
vorhanden. **Noch kein spielbarer Port.** Maßgeblich sind der
[Portplan in zehn Schritten](docs/PORTPLAN.md) und der
[geprüfte Stand mit offenen Abnahmen](docs/PARITY_AUDIT.md).

## Bauen und prüfen

Python 3 und die Visual-Studio-C++-Toolchain müssen installiert sein. Beim ersten
Aufbau den benachbarten MiniLang-Compiler einfrieren, anschließend bauen:

```powershell
python scripts/inventory.py
.\build.ps1
.\build\MiniQuake3.exe --inspect-map D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp
python scripts/verify.py --data-root D:/Quake3
python scripts/verify.py --data-root D:/Quake3 --extended
```

Ein vorhandener eingefrorener Compiler liegt unter `artifacts/toolchain/`.
`inventory.py` nur ausführen, wenn dieser Stand bewusst neu festgelegt werden soll.
Die C-Referenz- und Replay-Builds sind im [Prüfbericht](docs/PARITY_AUDIT.md) beschrieben.
Die erweiterte Prüfung vergleicht zusätzlich alle 31 Karten einschließlich
Kurvenflächen und Bewegungsfolgen mit dem Originalcode. Einzelne Spielerbox-Traces
lassen sich direkt mit dem MiniLang-Build ausführen:

```powershell
.\build\MiniQuake3.exe --trace-map D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp 216 1328 128 216 1328 -1024
```

Die sechs Zahlen sind Start- und Zielposition. Verwendet werden die originale
Spielerbox `(-15,-15,-24)` bis `(15,15,32)` und `MASK_PLAYERSOLID`, mit aktiver
Kurvenkollision gegen das Weltmodell.

Bewegungsbefehle lassen sich ohne Grafik auf einer Karte abspielen:

```powershell
.\build\MiniQuake3.exe --pmove-map D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp 216 1328 24 examples/movement.tsv
```

Die TSV-Datei enthält pro Zeile neun ganze Zahlen: Zeit in Millisekunden,
Pitch, Yaw, Roll, Vorwärts, Rechts, Hoch, Buttons und Waffe. Winkel verwenden
Quakes Command-Einheiten (65.536 pro Vollkreis), Bewegungsachsen den Bereich
−128 bis 127. `#` beginnt eine Kommentarzeile. Die Ausgabe zeigt je Befehl Position,
Geschwindigkeit, Bodenkontakt, Wasserstand, Waffenzeit und Ereignisse.
Der Spieler startet mit 100 Gesundheit, Geschwindigkeit 320, Schwerkraft 800 und
Maschinengewehr. Dieser Entwicklungsaufruf verarbeitet statische Weltkollision;
Spielserver, bewegte Entities, Schaden und Grafik folgen in weiteren Planabschnitten.

## Quellcode und Projektstruktur

```text
MiniQuake3/
  Quake-III-Arena-original-source/  Lokaler Git-Fork des vollständigen id-Software-Repositories
  docs/PORTPLAN.md                 Zehn Schritte mit Abnahmekriterien
  docs/UPSTREAM.md                 Herkunft, Revision und Reproduktion
  docs/PARITY_AUDIT.md             Geprüfte Eigenschaften und offene Arbeit
  src/                            MiniLang-Implementierungen
  native/abi.c                    Drei Float-/Bit-Konvertierungen für die ABI
  tests/                          MiniLang-Tests und separate C-Referenztreiber
  scripts/                        Build- und Vergleichsautomation
  PORT_LEDGER.json                 Inventar und Zuordnung der Originaldateien
  README.md
```

Der [offizielle Quellcode](https://github.com/id-Software/Quake-III-Arena)
ist als Git-Submodul eingebunden. Der lokale Entwicklungsbranch heißt `miniquake3`,
das Quellrepository ist als Remote `upstream` eingetragen. Es wurde kein Fork auf
GitHub veröffentlicht. Der Referenzstand ist unverändert und im übergeordneten
Repository durch den Submodul-Commit fixiert.

Nach einem späteren Clone dieses Projekts den Quellcode so laden:

```powershell
git submodule update --init --recursive
```

Ziel ist zunächst Windows x64 mit dem benachbarten `MiniLangCompilerML`.
Die Engine, Spielregeln, Clientlogik, Bots und der Renderer sollen in MiniLang
entstehen. Kleine native Brücken bleiben für Betriebssystem- und Grafikzugriffe
möglich; jede Ausnahme wird dokumentiert. Linux x64 folgt nach der Referenzabnahme.

Quake III Arena (`baseq3`) ist die erste vollständige Abnahme; die im Quellcode
vorhandenen Team-Arena-Pfade werden separat erfasst. Editor und Asset-Werkzeuge
bleiben als Originalquellen erhalten und sind kein Teil der ersten Laufzeit-Portierung.

## Originalquellen und Spieldaten

Die Original-Lizenz und Hinweise bleiben unter
[COPYING.txt](Quake-III-Arena-original-source/COPYING.txt) und
[README.txt](Quake-III-Arena-original-source/README.txt) erhalten, einschließlich
der dort genannten Drittanbieter-Komponenten. Abgeleitete Portdateien tragen
Herkunft und GPL-2.0-or-later-Hinweise; siehe [NOTICE.md](NOTICE.md).

Kommerzielle Spieldaten sind nicht enthalten. Für Originalkarten, Modelle,
Texturen, Audio und Referenztests wird eine eigene Quake-III-Installation benötigt.
Lokale Daten und erzeugte Prüfergebnisse gehören in die ignorierten Verzeichnisse
`data/` beziehungsweise `artifacts/`.
