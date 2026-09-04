# Quellcode-Herkunft

| Eigenschaft | Festgelegter Stand |
| --- | --- |
| Quelle | https://github.com/id-Software/Quake-III-Arena |
| Original-Branch | `master` |
| Referenz-Commit | `dbe4ddb10315479fc00086f08e25d968b4b43c49` |
| Lokaler Pfad | `Quake-III-Arena-original-source/` |
| Lokaler Fork-Branch | `miniquake3` |
| Quell-Remote | `upstream` |
| Einbindung | Git-Submodul mit vollständiger verfügbarer Historie |
| Erfasst am | 2026-09-05 |
| Quelländerungen bei Einrichtung | Keine |
| Veröffentlichung | Nur lokal; kein GitHub-Fork und kein Push |

Der Quellstand bezeichnet sich in `code/game/q_shared.h` als `Q3 1.32b`.
`code/qcommon/qcommon.h` definiert Protokoll 68; `code/qcommon/qfiles.h`
definiert BSP-Version 46 und MD3-Version 15. Diese Werte sind Ausgangspunkte
für die Abnahmematrix, keine bereits erreichten Port-Eigenschaften.

## Prüfen und wiederherstellen

Vom MiniQuake3-Verzeichnis aus:

```powershell
git submodule update --init --recursive
git submodule status
git -C Quake-III-Arena-original-source rev-parse HEAD
git -C Quake-III-Arena-original-source status --short
git -C Quake-III-Arena-original-source remote -v
```

Der erwartete HEAD ist der oben genannte Referenz-Commit. Ein frisches Submodul
wird üblicherweise mit detached HEAD und Remote `origin` ausgecheckt; Branchname
und Remote-Umbenennung sind lokale Einstellungen. Zur Einrichtung desselben
Fork-Layouts in einem frischen Clone:

```powershell
git -C Quake-III-Arena-original-source remote rename origin upstream
git -C Quake-III-Arena-original-source switch -c miniquake3
```

Diese beiden Befehle sind nur nötig, wenn die entsprechenden Namen noch nicht
existieren. Spätere Referenzänderungen erfordern einen bewusst aktualisierten
Submodul-Commit und neue Vergleichsergebnisse. Build-Anpassungen für den
C-Referenzprozess werden zunächst als Patches außerhalb des Originals abgelegt.

## MiniLang-Ausgangspunkt

Die Planung verwendet `../MiniLangCompilerML/README.md` und den benachbarten
MiniQuake2-Port als lokale technische Quellen. Der gelesene Compiler-HEAD lautet
`c52707a53b4fc0b46fc1c6d5394c5800d81f5f7d`; dort existieren lokale Änderungen,
sodass dieser Hash allein keinen reproduzierbaren Compilerzustand bezeichnet.
Schritt 1 fixiert deshalb zusätzlich Compiler-Binary, Bibliotheken, Optionen und
Quelländerungen. An den bestehenden Projekten wurde nichts verändert.
