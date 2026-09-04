# MiniQuake3

Projekt für einen möglichst originalgetreuen Port von Quake III Arena nach MiniLang.
Status: Projekt und Quellcode-Referenz angelegt; die Implementierung beginnt mit dem
[Portplan in zehn Schritten](docs/PORTPLAN.md). Noch kein spielbarer Port oder Build vorhanden.

## Quellcode und Projektstruktur

```text
MiniQuake3/
  Quake-III-Arena-original-source/  Lokaler Git-Fork des vollständigen id-Software-Repositories
  docs/PORTPLAN.md                 Zehn Schritte mit Abnahmekriterien
  docs/UPSTREAM.md                 Herkunft, Revision und Reproduktion
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
der dort genannten Drittanbieter-Komponenten. Abgeleitete Portdateien müssen
ihre Herkunft und zutreffenden Lizenzhinweise erhalten.

Kommerzielle Spieldaten sind nicht enthalten. Für Originalkarten, Modelle,
Texturen, Audio und Referenztests wird eine eigene Quake-III-Installation benötigt.
Lokale Daten und erzeugte Prüfergebnisse gehören in die ignorierten Verzeichnisse
`data/` beziehungsweise `artifacts/`.
