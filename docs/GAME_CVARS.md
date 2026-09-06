# Engine-Cvars und Spielmodul-Kopien

Stand: 2026-09-05. `cvars.ml` portiert `G_RegisterCvars` und `G_UpdateCvars`
aus Baseq3 `g_main.c`. Die Engine-Seite von `Cvar_Register` und `Cvar_Update`
liegt in `qcommon/cvar.ml`. Registrierung, Aktualisierung und das standardmäßig
gebundene Setzen arbeiten mit der vorhandenen MiniLang-Registry.

Die generierte Tabelle enthält sämtliche **46 Baseq3-Einträge**, davon **43
mit VM-Kopie**. Namen, Reihenfolge, Standardwerte, Flags und Änderungsverfolgung
stammen aus dem unveränderten Original. `gamename`, `gamedate` und `sv_mapname`
werden ebenfalls registriert, besitzen aber keine Spielmodul-Kopie und werden
deshalb nicht durch `G_UpdateCvars` durchlaufen. `gamedate` ist explizite
Build-Metadaten-Eingabe des Modulhosts, entsprechend dem ursprünglichen
`__DATE__`. Die Team-Shader-Zeilen und der gesamte Inhalt von
`G_RemapTeamShaders` sind ausschließlich für `MISSIONPACK` vorgesehen;
die Baseq3-Funktion ist leer.

Bewahrt werden die ursprünglichen Regeln:

- Stabile Engine-Handles beginnen bei **null**. Registrierung setzt den
  Modifikationszähler der VM-Kopie zunächst auf `-1` und aktualisiert sie danach.
  Der Engine-Zähler selbst wird dadurch nicht zurückgesetzt.
- Unveränderte Zähler und geleerte Engine-Strings führen zum ursprünglichen
  frühen Rücksprung. Die bisherige VM-Kopie bleibt dann erhalten. Der Vergleich
  schließt auch den ungewöhnlichen Registrierungsfall mit Engine-Zähler `-1` ein.
- VM-Strings enthalten höchstens 255 Datenbytes. Integer und binary32-Wert
  werden aus der Engine-Kopie übernommen; eine unabhängige Neuinterpretation
  der Zeichenkette findet bei der Aktualisierung nicht statt.
- `G_UpdateCvars` durchläuft die Tabelle in Originalreihenfolge. Verfolgte
  Änderungen senden exakt `print "Server: <Name> changed to <Wert>\n"` an
  Empfänger `-1`, nachdem der jeweilige Tabellenzähler aktualisiert wurde.
- Vorgemerkte Werte mit `CVAR_LATCH` ändern den Engine-Zähler bereits, während
  der aktive Wert unverändert bleibt. Eine dadurch ausgelöste Spielmeldung
  enthält zunächst den alten Wert. Erneute Registrierung übernimmt den
  vorgemerkten Wert und setzt den Tabellenzähler ohne zusätzliche Änderungsmeldung.
- `g_gametype` außerhalb von 0 bis 7 löst bei der Registrierung den originalen
  Warntext und ein erzwungenes Zurücksetzen auf `0` aus. Die VM-Kopie enthält
  bis zum nächsten Update noch den alten Wert. Der Warmup-Vergleichszähler des
  Levels wird nur bei der Registrierung initialisiert.
- Änderungszähler folgen dem geprüften nativen 32-Bit-Überlaufprofil, sowohl
  beim unmittelbaren Setzen als auch beim Vormerken eines Werts.

Die vorhandenen Spielroutinen erhalten ihre Werte aus den passenden VM-Feldern:
unter anderem binary32-Gravitation, Geschwindigkeit und Rückstoß, ganzzahlige
Matchlimits, Respawnzeiten und Clientlimit sowie Warmup- und Passwortzähler.
Das Level-Clientlimit bleibt vom Cvar-Clientlimit getrennt. Der Test vergleicht
auch diese Zuordnung mit den ursprünglichen C-Variablen.

## Einbindung und Lebensdauer

Nach dem Anlegen des Spawn-Zustands bindet `cvars.attach(level, buildDate)` die
Tabelle an dessen Registry. `cvars.register(level)` registriert sie.
`frame.run` ruft danach standardmäßig die portierte Cvar-Aktualisierung vor der
Entity-Schleife auf. Ohne Modulzustand oder vor der Registrierung wird dieser
Pfad kontrolliert abgewiesen. `level.updateCvarsFn` ist ein expliziter Override
für isolierte Tests beziehungsweise einen eigenen Host.

Ist kein `level.cvarSetFn` gesetzt, bindet `attach` das tatsächliche Setzen in
der Registry. Ein bereits vorhandener Callback bleibt für die Engine-Zustellung
zuständig. Servermeldungen benötigen weiterhin `level.serverCommandFn`;
Transport und Clientanzeige sind noch nicht portiert. Der optionale
`state.effectFn` beobachtet Registry-Aufrufe und Diagnosemeldungen.

Auch `g_allowVote` wird inzwischen in das Gameplay-Feld `level.allowVote`
übernommen und in jedem registrierten Cvar-Snapshot gegen C verglichen. Die
[Vote-Befehle](VOTES.md) nutzen diesen VM-Stand; ein direktes Setzen der
Engine-Cvar wird erst beim Refresh sichtbar. `nextmap` lesen sie dagegen beim
Aufruf direkt aus derselben Engine-Registry mit der ursprünglichen Bytegrenze.

Bei einem Level-Reset innerhalb desselben Moduls übernimmt
`cvars.rebind(newLevel, state)` die Registry, VM-Kopien, Tabellenzähler und den
Passwort-Cache. Ein neues Modul erhält einen neuen Zustand. Vollständige
`G_InitGame`-/Shutdown-Abläufe, `cvar_restart` und die QVM-Trap-Zustellung sind
weiterhin offene Portschritte.

## Nachweis

`scripts/test_game_cvars.py` besteht mit **94 Szenarien**, **1.087 Aktionen**,
**961.431 exakt gleichen 32-Bit-Wörtern**, **20.271 geordneten Nebenwirkungen**
und **4.196.674 Ausgabe-Bytes**. Der Referenzhost verwendet das vollständige
originale `qcommon/cvar.c`, die unveränderte Baseq3-Tabelle und die unveränderten
Spiel-Funktionskörper. Die Build-Datumseingabe wird vor dem Lauf aus dem
nativen Compiler-Build gelesen und als Fixture-Metadatum gespeichert; aktuelles
Referenzdatum: `Sep  6 2026`. Es ist kein behauptetes Retail-Build-Datum.

Generische Konsolendiagnosen aus `Cvar_Get`/`Cvar_Set2` bleiben wie im bisherigen
Engine-Kern-Test ausgeklammert. Der Spielmodus-Warntext von `G_RegisterCvars`
wird dagegen bis zur Host-Schnittstelle exakt verglichen.

Geprüft werden sämtliche Tabellenzeilen einzeln, verzögerte Änderungen,
Neu-Registrierung, ROM-/Force-Verhalten, Zählerüberlauf, Text-/Bytegrenzen,
Handle null, erhaltene VM-Kopien und 16 deterministische Änderungsfolgen.
Zusätzliche Fälle vergleichen die Level-Spiegel von sv_cheats und dedicated
nach Registrierung, verzögerten Engine-Änderungen, Refresh, Rebind und Frame.
Der Waffen-Cvar g_quadfactor wird ebenfalls als Float in den Level-Zustand
übertragen und bei Registrierung, Update, Rebind und Frame-Refresh geprüft.
Nach jeder Aktion werden Tabellen-/VM-/Engine-Zustände verglichen. Bei
Servermeldungen werden zusätzlich die Zähler aller Tabellenzeilen beobachtet.

Die Frame-Fälle führen den unveränderten `G_RunFrame` mit ausschließlich inaktiven Entities
aus und vergleichen Passwortwechsel, Gravitation, Zeitüberlauf, die vollständige
1.024er-Entity-Liste und deren Cvar-Reset. Match- und Vote-Prüfungen sind in
diesem Host auf den inaktiven Zustand begrenzt; unerwartete aktive Pfade brechen
ab. Die bestehenden separaten Gameplay-/Frame-Suiten decken diese Spielregeln ab.

**13 Laufzeitverträge** prüfen Pflichtzustände, unabhängige Module, Handles bis
1023 und Kapazitäts-/Stringfehler. **Vier native Fehlerfälle** bestätigen die
Ablehnung ungültiger Handles und überlanger VM-Strings. Nach einem gefangenen
MiniLang-Fehler bleibt die letzte gültige VM-Kopie erhalten; der originale
Engine-Abbruch mit teilweise geschriebenem Fehlerzustand wird nicht nachgebildet.
Eingebettete NUL-Zeichen werden kontrolliert abgewiesen.

Test-Binary: `6baa31ae28a0577aa677135974b78c2a0540cc8e81b0dfc589513aea74b4e3da`.
Native x86-Oracle: `77d46a5b3dad879050d4d84a8bf386a340d20f09862d7e137af46424624faf7d`.

```powershell
python scripts/generate_game_cvars.py
python scripts/test_game_cvars.py
python scripts/test_game_cvars.py --case frame_password_and_empty_entities
```

Dieser Nachweis schließt den Cvar-Refresh innerhalb des Spiel-Frames; eine
vollständige Engine-/Modullaufzeit und ein spielbarer Gesamtport fehlen weiterhin.

Die [Connect-/Sitzungssuite](CLIENT_CONNECT.md) prüft inzwischen zusätzlich die
Übernahme von `g_teamAutoJoin` und `g_maxGameClients` in die Anmelderegeln.
Registrierung und Refresh versorgen die Level-Felder; Sitzungsdaten werden über
die tatsächliche Registry und deren Cvar-Set-Pfad gespeichert und gelesen.
