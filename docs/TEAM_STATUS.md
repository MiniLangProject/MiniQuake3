# Teamstandorte, Overlay und Passwortstatus

Stand: 2026-09-05. `team_status.ml` portiert `Team_GetLocation`, `SortClients`,
`TeamplayInfoMessage` und `CheckTeamStatus` aus Baseq3 `g_team.c`.
`cvar_maintenance.ml` ergänzt `CheckCvars` aus `g_main.c`. Beide Wartungsschritte
laufen in `G_RunFrame` an ihrer ursprünglichen Position vor beziehungsweise
nach der Vote-Auflösung.

Die Standortauswahl verwendet die bereits portierte echte Server-PVS-Prüfung
einschließlich Areaportal-Verbindungen. Die quadrierte Entfernung wird mit
binary32-Zwischenrundungen berechnet. Der anfängliche Grenzwert beträgt
`3 * 8192 * 8192`; ein exakt gleich weit entfernter späterer Eintrag in der
Standortkette gewinnt. Ein näherer, aber unsichtbarer Standort verdrängt keinen
sichtbaren Kandidaten.

Bewahrt werden die ursprünglichen Overlay-Regeln:

- Aktualisierung erst bei einer Zeitdifferenz **größer als 1.000 ms**, mit dem
  geprüften nativen 32-Bit-Überlaufprofil. Maßgeblich ist `g_maxclients.integer`,
  im Port `level.maxclientsCvar`, unabhängig von `level.maxclients`.
- Zuerst werden alle verbundenen und aktiven roten/blauen Teammitglieder
  aktualisiert. Erst danach werden die Nachrichten an die angemeldeten
  Overlay-Empfänger gesendet. Ohne sichtbaren Standort wird der Standortwert null.
- Ein Paket enthält höchstens **32 Mitglieder**, trotz des alten Kommentars
  über acht Spieler im Original. Die ursprüngliche Vorauswahl und Sortierung
  bleiben enthalten; die anschließende Ausgabeschleife liest dieses Ergebnis
  nicht und verwendet direkt die aufsteigenden Entity-Slots.
- Paketfelder sind Slot, Standort, Gesundheit, Rüstung, Waffe und Powerup-Bits.
  Negative Gesundheit/Rüstung werden nur in der Ausgabe auf null geklemmt.
  Die Mitgliederausgabe filtert nach Aktivität und Team; der Verbindungsstatus
  wird dabei, anders als bei den Empfängern, nicht geprüft.
- `tinfo`-Text, Empfänger und Leerzeichen stimmen bytegenau mit C überein.

`CheckCvars` setzt `g_needpass` nur bei verändertem Passwort-Modifikationszähler.
Ein leerer Wert oder ASCII-groß-/kleinschreibungsunabhängig `none` ergibt `0`,
sonst `1`. Führende/abschließende Leerzeichen werden nicht entfernt.
Der ursprüngliche statische Cache startet bei `-1` und lebt über Level-Resets
hinweg. Dafür liegt er mit Passwort und aktuellem Zähler im expliziten
`level.cvarMaintenance`-Objekt: Bei einem Level-Reset innerhalb desselben
Spielmoduls muss dieses Objekt übernommen werden. Ein neues Spielmodul erhält
über `cvar_maintenance.create()` einen frischen Cache. Die beiden Lebenszyklen
sind getrennt geprüft; vollständige Modulinitialisierung ist weiterhin offen.

`scripts/test_team_status.py` besteht mit **80 Szenarien**, **618 Aktionen**,
**59.233 exakt gleichen 32-Bit-Wörtern**, **288 geordneten Nebenwirkungen**
und **275.011 Ausgabe-Bytes**. Der C-Referenzhost extrahiert die fünf
Funktionskörper unverändert und verwendet die originalen CM-/Server-PVS-Routinen.
Eigene BSP-Fixtures prüfen sichtbare/unsichtbare Cluster, fehlende PVS-Daten
und wiederholt geöffnete beziehungsweise geschlossene Areaportale.

Die Fälle umfassen Entfernungsgrenzen und Float-Gleichstände, Zeitüberläufe,
Slot 63, umgekehrte Ranglisten, 32er-Paketgrenze, Filterkombinationen, native
Integergrenzen, maximale Passwortspeicherung, wiederverwendeten Modulzustand,
aktive Framefolgen sowie 48 deterministisch erzeugte Standort-/Clientfelder.
Jede Nachricht vergleicht auch den aktuellen Standortzustand aller 64 Clients;
nach jeder Aktion folgt ein Zeit-/Frame-/Standort-Snapshot.

Zwölf Laufzeitverträge prüfen fehlende Schnittstellen, ungültige Clientlimits
und Slots, fehlende Clientbindungen, zyklische Standortketten, nicht endliche
PVS-Koordinaten, Passwort-NUL/Überlänge und unabhängige Spielmodule. Solche
ungültigen Zustände werden kontrolliert abgewiesen und zählen nicht als
Vergleich gültiger C-Eingaben. Clientbindungen müssen wie nach dem originalen
`G_InitGame` für alle Slots unterhalb des Cvar-Clientlimits vorhanden sein.

Test-Binary: `f8df146c77732380c253f1c330413d280f16851524f8f89fa02dd1877d497fc9`.
Native x86-Oracle: `bf341634200dbd35e528b1a0316a9699e500a512b4c7f8ac40f08e21017de7a6`.

```powershell
python scripts/test_team_status.py
python scripts/test_team_status.py --case portal_open_close_reference_counts
```

[`G_UpdateCvars` und die Engine-/VM-Cvar-Kopien](GAME_CVARS.md) sind inzwischen
portiert und versorgen standardmäßig auch Passwort und Modifikationszähler.
Die isolierte Teamstatus-Suite behält einen Cvar-Refresh-Override;
Serverbefehle und Cvar-Setzen enden dort an beobachteten Host-Schnittstellen.
Netzwerkzustellung und die Anzeige im Client bleiben offen. Die
[Userinfo-Verarbeitung](CLIENT_INFO.md) ist inzwischen portiert; ihre separate
Suite schaltet das Overlay über echte Spielerangaben ein und aus und prüft die
anschließenden Teamstatus-Nachrichten. `Team_GetLocationMsg` für formatierte
Ortsnamen ist inzwischen über [Chat und Tells](CLIENT_COMMANDS.md) portiert und geprüft. [`ClientConnect` und
Sitzungs-Persistenz](CLIENT_CONNECT.md) sowie
[Teamwechsel und `ClientDisconnect`](TEAM_CHANGES.md) sind separat portiert.
[Vote-Aufrufe und Stimmabgabe](VOTES.md) sind inzwischen portiert
und separat geprüft. Dieser Nachweis macht den Port noch nicht spielbar.
