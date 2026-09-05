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

Die [gemeinsame Info-Schlüsselsuche](CLIENT_INFO.md) behandelt ASCII-Großschreibung
wie C und verwendet bei doppelten Schlüsseln den ersten Wert. Zuvor wird der
gelieferte Userinfo-Text wie durch `trap_GetUserinfo` auf 1.023 Bytes kopiert;
auch ein dadurch abgeschnittener Handicap-Zahlenwert bleibt originalgetreu.

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
unabhängige ClientSpawn-Prüfung. Auch die
[Intermission-Platzierung](INTERMISSION.md) ruft standardmäßig die portierte
`intermission.moveClient` auf. Userinfo und Usercmd bleiben Engine-Schnittstellen.

## Nachweis

```powershell
python scripts/test_client_spawn.py
```

21 Szenarien vergleichen 5.766 32-Bit-Wörter in 23.190 Ausgabe-Bytes exakt und
prüfen 144 geordnete Host-/Link-Ereignisse. Sie decken FFA, den lokalen
Initialspawn, Bot-/Human-Filter mit Wiederholung, Team-Deathmatch-Munition,
CTF-Start- und Aktivpositionen für beide Teams, Zuschauer, Intermission,
Handicapgrenzen, Vote-/Teleportflags, 32-Bit-Zeitgrenzen, persistente Daten,
Transient-Reset, belegte Spawnpunkte mit KillBox, Spawn-Targets, Waffenwahl und
beide Snapshot-Konvertierungen ab. Vier Userinfo-Fälle ergänzen unterschiedliche
Schlüsselschreibweisen, Duplikate, den fehlenden ersten Trenner und die
ursprüngliche Puffergrenze vor beziehungsweise innerhalb des Handicap-Werts.
Acht zusätzliche Laufzeitverträge prüfen Initialwerte, Userinfo-Auswertung,
fehlende Pflichtgrenzen und die Standardverbindung aus `deaths.respawn`.

Test-Binary: `c10eaef19608dc7431aa92f6148a2b87e278de1b757c47fa83582ee84d36800e`.
Native x86-Oracle: `c85bca4d0e6b14f0deb96ec86447cb0bfee1a8c0f8a7088856a362370b3cf678`.

Der C-Oracle enthält den unveränderten Funktionskörper aus `g_client.c`. Nur die
fünf oben aufgeführten Abhängigkeiten werden am Host-Rand beobachtet. Spawnwahl,
Telefrag-Abfrage, Target-Kette, Entity-Verlinkung und PlayerState-Konvertierung
laufen auf beiden Seiten als echte Implementierungen.

Der übergeordnete Eintritt mit Ereignis, Meldung, Log und Rangberechnung ist
unter [ClientBegin](CLIENT_BEGIN.md) zusammenhängend geprüft.
Die neue Intermission-Suite verwendet den tatsächlichen Respawn-/Spawn-Ablauf
einschließlich der standardmäßigen Platzierung und Zuschauerfreigabe.
