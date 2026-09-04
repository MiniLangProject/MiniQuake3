# MiniQuake3: überprüfter Stand

Stand: 2026-09-05. Der Port ist **in Arbeit und noch nicht spielbar**.
Ein erfolgreicher Referenzlauf ist ein Lauf der ursprünglichen C-Engine,
kein Nachweis einer schon portierten MiniLang-Engine.

| Schritt | Stand | Vorliegender Nachweis / noch fehlende Abnahme |
| --- | --- | --- |
| 1. Referenz | Grundabnahme bestanden | Originale x86-Engine, drei native Module, drei neu gebaute QVMs; MiniLang-Build; 1.409 Dateien inventarisiert; 120 Frames mit zwei Bots aufgezeichnet und zweimal bytegleich wiedergegeben |
| 2. Zahlen/Plattform | In Arbeit | 80.900 binäre Float-Ergebnisse und 53.248 Ergebnisse aus originalem q_math.c stimmen; Windows-Dateizugriff vorhanden; Fenster, Eingabe, UDP und Audio noch offen |
| 3. Engine-Kern/VFS | In Arbeit | 513 Cvar-Operationen, 448 Parseraufrufe, 84 ZIP/DEFLATE-Vergleiche bestanden; Command-Buffer, vollständige Suchpfade/Pure-Checksummen und Engine-Schleife fehlen |
| 4. QVM | In Arbeit | 392 Vergleiche mit dem Originalinterpreter; drei begrenzte Einstiegspunkte echter CD- und neu gebauter QVMs; vollständige Engine-Traps und Modulinitialisierung fehlen |
| 5. Kollision/Pmove | In Arbeit | BSP46-Leser lädt alle 31 CD-Karten; Brush-Kern besteht 4.096 Box-/Kapsel-Traces mit 36.864 identischen Feldern; BSP-Traversierung, Patch-Kollision und Pmove fehlen |
| 6. Spiel/Server | Offen | Noch keine MiniLang-Implementierung |
| 7. Netzwerk/Client | Offen | Noch keine MiniLang-Implementierung |
| 8. Renderer/Cgame | Offen | Noch keine MiniLang-Implementierung |
| 9. Bots/Audio/UI | Offen | Noch keine MiniLang-Implementierung |
| 10. Gesamtparität | Offen | Hängt von allen vorangehenden Abnahmen ab |

83 zusätzliche Tests prüfen beschädigte Dateieingaben, VM-Limits und die
Wiederherstellung des VM-Stacks nach einem fehlerhaften Syscall. Dies ist eine
gezielte Testsammlung, keine vollständige Fuzzing- oder Sicherheitsabnahme.

## Referenzprofile

- Upstream unverändert: `dbe4ddb10315479fc00086f08e25d968b4b43c49`.
- C-Referenz: MSVC x86, `/Od /fp:strict /arch:SSE2 /MT`, native Game-Module
  und QVM-Interpreter getrennt. Moderne Compiler ergeben kein ungeprüftes
  Versprechen identischer Retail-Binaries oder identischen x87-Verhaltens.
- QVM-Build: originale mitgelieferte `lcc`, `q3cpp`, `q3rcc`; `q3asm` aus
  Originalquellen neu gebaut. Alle Outputs entstehen unter `build/`.
- Replay: `q3dm1`, Sarge und Major auf Skill 3, `com_fixedtime=50`, `sv_fps=20`,
  `bot_thinktime=100`, QVM-Interpreter. Die originale Event-Journalfunktion
  zeichnet die Eingaben auf. Ein Beobachter nach `Com_Frame` serialisiert
  verknüpfte EntityStates und aktive PlayerStates mit dem Original-Protokollwriter.
  Es werden keine Pointer oder Paddingbytes verglichen. Private Bot-/Spielzustände
  sind in diesem Nachweis noch nicht vollständig enthalten.
- Der Beobachter wird ausschließlich in eine gesonderte C-Test-Executable
  eingebunden. Die Kopie von `win_main.c` erhält eine Deklaration und einen Aufruf
  nach `Com_Frame`; der Original-Checkout bleibt unverändert. Der Beobachter
  beendet den Prozess nach 120 Frames. Build und Hook sind in
  `scripts/build_reference.py --observer` und `tests/reference/frame_observer.c` lesbar.
- MiniLang: Binary und Standardbibliothek unter `artifacts/toolchain/` eingefroren;
  Hashes und Quellzustand in `reference/toolchain.json`. Die genaue Herkunft des
  bereits vorhandenen Compiler-Binaries ist damit nicht rückwirkend bewiesen.

## Festgestellte Unterschiede und Grenzen

- Die CD-QVMs sind älter als die neu gebauten 1.32b-QVMs. Zum Beispiel liefert
  der UI-Einstieg der CD Version 3, der neu gebaute baseq3-UI-Einstieg Version 4.
  Tests und spätere Modulverträge müssen diese Profile auseinanderhalten.
- Im eingefrorenen Compiler verfälscht `toFloat()` bestimmte bereits als Float
  vorliegende große ganzzahlige Werte, etwa `3.8889514618448773e18`.
  `tests/numeric_probe.ml` reproduziert den Effekt. Die Port-Arithmetik verwendet
  deshalb eine eigene MiniLang-Implementierung von binary32 mit expliziter
  Rundung; die native DLL enthält nur drei ABI-Konvertierungen. Engine-Rechnungen
  müssen diese Helfer verwenden, statt implizite MiniLang-Zahlenpromotion anzunehmen.
- Float-Tests decken endliche Werte, Subnormalzahlen, Rundung, Über-/Unterlauf,
  signed zero und entstehende Unendlichkeiten/NaNs ab. Beliebige NaN-Payloads als
  Eingangswerte sind noch nicht vollständig gegen sämtliche Referenzpfade geprüft.
- Der Originalinterpreter schreibt bei `OP_BCOM` in `opStack[-1]`. MiniLang
  reproduziert dieses beobachtbare Verhalten im Interpreterprofil. Eine spätere
  Entscheidung zur Korrektur muss getrennt von Paritätsaussagen erfolgen.
- QVM-Lader und Speicherzugriffe weisen gefährliche oder ungültige Eingaben
  kontrolliert zurück. Der Originalparser kann bei überlangen quoted tokens
  seinen C-Puffer überschreiten; MiniLang weist diese Eingabe zurück.
- ZIP64, verschlüsselte und mehrteilige ZIPs sowie Nicht-ASCII-Dateinamen sind
  noch kein zugesicherter Kompatibilitätsumfang. PK3-Pfadpriorität und Pure-Server-
  MD4-Checksummen sind noch nicht implementiert. CRC32 allein ersetzt diese nicht.
- BSP-Abnahme bedeutet aktuell Laden, Tabellenbezüge und Entity-Parsing;
  sie beweist keine Collision-, Sichtbarkeits- oder Renderparität.

## Reproduzieren

Aus dem MiniQuake3-Verzeichnis, mit Python 3 und Visual Studio C++-Toolchain:

```powershell
python scripts/inventory.py
python scripts/assets.py D:/Quake3
python scripts/build_reference.py
python scripts/build_qvms.py
python scripts/reference_smoke.py D:/Quake3 --vm interpreter
python scripts/build_reference.py --observer
python scripts/reference_replay.py D:/Quake3
python scripts/build.py
python scripts/test_numeric.py
python scripts/test_math.py
python scripts/test_core.py
python scripts/test_vm.py
python scripts/test_retail_vm.py
python scripts/test_retail_vm.py --qvm-root build/reference/qvms
python scripts/test_archives.py --data-root D:/Quake3
python scripts/test_maps.py D:/Quake3
python scripts/test_rejections.py
python scripts/test_brush.py
```

`inventory.py` aktualisiert bewusst den eingefrorenen Compilerstand. Für die
Wiederholung derselben Vergleichsbasis diesen ersten Befehl auslassen.
Tests und Builds nacheinander ausführen: Windows sperrt geladene native DLLs.
Vergleichsdaten und Logs liegen in `build/reference/` und `artifacts/reference/`.
Original-CD-Dateien werden ausschließlich gelesen; lokale Auszüge werden nicht eingecheckt.

Der Brush-Test isoliert den unveränderten Funktionskörper von
`CM_TraceThroughBrush` aus der Originaldatei in eine generierte C-Datei.
Seine Abhängigkeiten bleiben die Originalheader. Testfälle übergeben vorbereitete
Brush-Planes und Trace-Parameter; das ist keine vollständige `CM_BoxTrace`-Abnahme.
