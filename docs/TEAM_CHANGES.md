# Teamwechsel, Zuschauerfreigabe und Disconnect

Stand: 2026-09-06. Die Baseq3-Abläufe `SetTeam`, `StopFollowing`, `Cmd_Team_f`
und `ClientDisconnect` sind nach MiniLang übertragen. Sie verwenden die bereits
portierten Todes-, Item-/Flaggen-, Leichen-, Leiter-, Userinfo-, Begin-/Spawn-
und Rangfunktionen. Der vollständige Spielserver bleibt in Arbeit.

| Original | MiniLang-Einstieg |
| --- | --- |
| `SetTeam` | `teamChanges.setTeam(level,ent,request)` |
| `StopFollowing` | `teamChanges.stopFollowing(level,ent)` |
| `Cmd_Team_f` | `teamChanges.commandTeam(level,ent,argv)` |
| `ClientDisconnect` | `clientDisconnect.disconnect(level,slot)` |

Die Module liegen in `src/mq3/game/team_changes.ml` und
`src/mq3/game/client_disconnect.ml`. `argv` enthält den Befehlsnamen und die
bereits zerlegten Argumente. Die [ClientCommand-Verteilung](CLIENT_COMMANDS.md) ist separat geprüft;
Engine-Tokenizer und Command-Buffer bleiben offen.

## Team- und Zuschauerwechsel

Die Anfrage erkennt die originalen Kurzformen und ASCII-Groß-/Kleinschreibung:
Rot/Blau, automatische Teamwahl, freie Zuschauer, Scoreboard sowie die beiden
automatischen Follow-Ziele. `g_teamForceBalance` erlaubt die ursprüngliche
Differenz von zwei Spielern. Verbindende Clients zählen mit. Der Ausschluss
bei der automatischen Teamwahl verwendet den persistenten Clientslot; die
Balanceprüfung und deren Meldung verwenden dagegen `ps.clientNum`.

Tournament- und `g_maxGameClients`-Grenzen überschreiben nur das Team, ohne
den zuvor bestimmten Zuschauerzustand zu korrigieren. Erst danach greift
der unveränderte Nicht-Zuschauer-No-op. Bereits tote Spieler gelangen vor dem
Wechsel in die Leichenwarteschlange. Aktive Spieler verlieren Godmode und
sterben mit `MOD_SUICIDE`; der echte Todesablauf gibt insbesondere getragene
CTF-Flaggen zurück. Leiterwahl, Teamnachricht, Userinfo und `ClientBegin`
folgen in Originalreihenfolge. Auch erneute Zuschauerwechsel durchlaufen sie.

Der `team`-Befehl gibt bei anderer Argumentzahl als zwei das aktuelle Team aus.
Die Fünf-Sekunden-Sperre greift nur bei `switchTeamTime > level.time`.
Eine Tournament-Niederlage wird vor `SetTeam` gezählt. Auch eine abgelehnte
oder wirkungslose Anfrage setzt danach die neue Sperrzeit. Zeit und Niederlagen
verwenden den ursprünglichen 32-Bit-Überlauf. Das Teamargument wird wie durch
`trap_Argv` auf 1.023 Bytes begrenzt.

`g_teamForceBalance` ist an die tatsächliche registrierte VM-Cvar angebunden.
Ein eigener Laufzeitvertrag prüft deren Aktualisierung einschließlich eines
negativen, ebenfalls als wahr geltenden Werts.

## Verlassen einer Partie

`ClientDisconnect` ist der **Rückruf der Engine** und ersetzt nicht deren
`trap_DropClient`. Er entfernt zuerst einen eventuell vorgemerkten Bot-Start,
auch bei einer Entity ohne Clientbindung. Anschließend beendet er die explizite
Verfolgung durch passende Zuschauer, ohne deren Verbindungsstatus zu filtern.
`StopFollowing` setzt Zuschauerteam/-zustand und eigene Clientnummer, entfernt
`PMF_FOLLOW` und `SVF_BOT` und erhält die übrigen Sitzungswerte.

Vollständig verbundene Nicht-Zuschauer erzeugen Teleport-out und geben ihre
Items und Powerups über den echten `TossClientItems`-Pfad ab. Nach dem Log kann
im Tournament der bisher Erstplatzierte einen Sieg erhalten, sofern der
bisher Zweitplatzierte geht und weder Warmup noch Intermission aktiv sind.
Dessen tatsächliche Userinfo wird noch vor dem Unlink des Gehenden aktualisiert.
Anschließend folgen Entity-/Team-/Verbindungsreset, leerer Player-Configstring,
Rangberechnung und gegebenenfalls Bot-Shutdown. Andere Sitzungsdaten bleiben
wie im Original erhalten.

Die neuen Pflichtschnittstellen sind
`level.removeQueuedBotBeginFn(level,slot)` und
`level.botShutdownFn(level,slot,restart)`. Fehlende notwendige Schnittstellen
melden einen Fehler. Bot-Warteschlange und Bot-AI sind damit noch nicht portiert.

## Vergleich und Grenzen

```powershell
python scripts/test_team_changes.py
python scripts/test_team_changes.py --case team_change_empty_client_limit
```

**227 Szenarien**, **266 Aktionen**, **78.057.316 exakt gleiche 32-Bit-Wörter**,
**3.494 geordnete Nebenwirkungen** und **318.595.344 Ausgabe-Bytes** stimmen
mit den unverändert extrahierten Originalkörpern überein. **15 Laufzeitverträge**
prüfen ungültige Slots/Bindungen, fehlende Schnittstellen, NUL-Ablehnung und
Cvar-Anbindung. Gezielt enthalten sind Bot-Leiterwechsel, Balance/Kapazität,
Befehls-/Überlaufgrenzen, null/64 Clients, abweichende persistente/Entity-/PS-Slots,
Tote, Wiederverwendung aller acht Leichenplätze, tatsächliche Waffen-/Powerup-
Drops, CTF-Rückgabe, Intermission, Disconnect-Follower und wiederholte Wechsel.

Jeder Host-Aufruf und jede Aktion vergleicht alle 66 modellierten Clientfelder
aller 64 Slots einschließlich aller 117 PlayerState-Wörter. Für sämtliche
allokierten Entities werden alle 52 EntityState-Wörter sowie ausgewählte
private und räumliche Felder verglichen. Hinzu kommen Bindungen, Leichenplätze,
Itemregistrierung, Ränge, Teamwerte und Spieler-/Score-/Flag-Configstrings.
Pointer-Padding und noch nicht modellierte Felder sind kein Teil dieses Nachweises.

Der zusätzliche Null-Limit-Fall entdeckte eine rückwärts laufende MiniLang-
`for`-Schleife in `playerDie`. Der Zuschauer-Scoreboarddurchlauf verwendet jetzt
eine `while`-Grenze und überspringt bei null Clients wie C sämtliche Slots;
ein belegter Slot 63 außerhalb des Limits macht den Fehler im Test sichtbar.

Die Spielabläufe für Tod, Items, Körper, Leiter, Userinfo, Begin/Spawn und Ränge
sind echte Implementierungen auf beiden Seiten. Die gesondert geprüften
Bewegungs-/Endframe- und Intermission-Callbacks werden in dieser Suite beobachtet.
Engine-Zustellung, Logs, Meldungen, Bot-Queue/-Shutdown sind Host-Grenzen.
[Follow-Befehle und Tournament-Nachrücken](FOLLOW_TOURNAMENT.md) sind inzwischen
separat mit diesen Abläufen geprüft. Die neue [Intermission-Suite](INTERMISSION.md)
verwendet `StopFollowing` bei der Platzierung und den tatsächlichen Teamwechsel
beim Ausscheiden des Duell-Verlierers. Vollständiger Modul-/Serverbetrieb,
tatsächliche Engine-Kartenwechsel, Netzwerk und Missionpack bleiben offen.
Die reguläre Gesamtsuite umfasst nun **38 Prüfbereiche**, die erweiterte **53**.
Der Nachweis des aktuellen Gesamtlaufs steht in [PARITY_AUDIT.md](PARITY_AUDIT.md).
Die letzte vollständig bestandene erweiterte Suite bleibt die mit **43 Gates**
am Stand `f8cdf9a`.

Test-Binary: `eb9c0be2fd7d2320e8454460c8272ea9c25363f2db0fa7bea41584c91f7a8b14`.
Native x86-Oracle: `497510f616a01b5f9883cf3136e9eb86786e38eae4d21e04422c98a44d1989fb`.
Einzelbericht: `build/reference/team_changes/result.json`.
