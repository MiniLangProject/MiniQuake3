# ClientSpawn

Dieser Abschnitt von Schritt 6 überträgt die vollständige Baseq3-Funktion
`ClientSpawn`. Der normale Respawn-Pfad kopiert zuerst die Leiche, ruft diese
MiniLang-Routine auf und erzeugt anschließend den Teleport-Effekt.

## Übertragener Ablauf

`client_spawn.spawn` wählt Deathmatch-, Initial-, CTF- oder Zuschauerpositionen
und wiederholt die Auswahl bei `FL_NO_BOTS` und `FL_NO_HUMANS`. Danach setzt die
Routine den Teamstatus aktiv, entfernt `EF_KAMIKAZE`, bewahrt die Vote-Flags und
wechselt `EF_TELEPORT_BIT`.

Wie der Originalcode erhält sie Session- und Persistenzdaten, Ping,
Trefferstatistik, alle 16 `persistant`-Werte und die Ereignisfolge. Alle
nichtpersistenten Clientfelder werden zurückgesetzt. Spawnzähler und Teamwert
werden aktualisiert, `handicap` wird auf 1 bis 100 begrenzt, und der Spieler
erhält Gauntlet, Machinegun sowie deren ursprüngliche Munitionswerte. Die
Entitybox, Kollisionsinhalte, Gesundheit, Respawn-/Inaktivitätszeiten und
Standardanimationen entsprechen Baseq3.

Für aktive Spieler folgen `G_KillBox`, Server-Link, Spawn-Targets und die Auswahl
der höchsten verfügbaren Waffe. Der Ablauf konvertiert den PlayerState vor und
nach dem letzten Frame-Hook in den EntityState und verlinkt den Spieler nach dem
ersten Frame erneut. Zuschauer bleiben unverlinkt.

## Host-Grenzen der isolierten Prüfung

Die isolierte ClientSpawn-Prüfung ersetzt fünf Abhängigkeiten durch beobachtete
Callbacks:

| Level-Feld | Original |
| --- | --- |
| `userinfoFn` | `trap_GetUserinfo` |
| `usercmdFn` | `trap_GetUsercmd` |
| `clientThinkFn` | `ClientThink` |
| `clientEndFrameFn` | `ClientEndFrame` |
| `moveIntermissionFn` | `MoveClientToIntermission` |

Der Vergleichshost gibt ihnen deterministische Rückgabewirkungen und protokolliert
ihre Reihenfolge. Dadurch ist der Code vor, zwischen und nach den Grenzen exakt
gegen die Originalfunktion prüfbar. ClientThink und ClientEndFrame sind inzwischen
portiert und werden im normalen Pfad verwendet; gesetzte Callbacks erhalten die
unabhängige ClientSpawn-Prüfung. Userinfo, Usercmd und Intermission-Platzierung
bleiben Engine-Schnittstellen.

## Nachweis

```powershell
python scripts/test_client_spawn.py
```

17 Szenarien vergleichen 4.666 32-Bit-Wörter in 18.766 Ausgabe-Bytes exakt und
prüfen 116 geordnete Host-/Link-Ereignisse. Sie decken FFA, den lokalen
Initialspawn, Bot-/Human-Filter mit Wiederholung, Team-Deathmatch-Munition,
CTF-Start- und Aktivpositionen für beide Teams, Zuschauer, Intermission,
Handicapgrenzen, Vote-/Teleportflags, 32-Bit-Zeitgrenzen, persistente Daten,
Transient-Reset, belegte Spawnpunkte mit KillBox, Spawn-Targets, Waffenwahl und
beide Snapshot-Konvertierungen ab.
Acht zusätzliche Laufzeitverträge prüfen Initialwerte, Userinfo-Auswertung,
fehlende Pflichtgrenzen und die Standardverbindung aus `deaths.respawn`.

Test-Binary: `27b036a198466a738cd235ddc09676b9dfa9664cc5ceeef45198ca0c716c8f14`.
Native x86-Oracle: `4b9d84a1f28f6602956af36b64d64196b3d2d37355f5d1c7eb6c2fbb2fee0b49`.

Der C-Oracle enthält den unveränderten Funktionskörper aus `g_client.c`. Nur die
fünf oben aufgeführten Abhängigkeiten werden am Host-Rand beobachtet. Spawnwahl,
Telefrag-Abfrage, Target-Kette, Entity-Verlinkung und PlayerState-Konvertierung
laufen auf beiden Seiten als echte Implementierungen.
