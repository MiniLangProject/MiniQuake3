# Spieler-Tod, Team-Boni und Respawn-Wrapper

Dieser Abschnitt von Schritt 6 verbindet die bereits portierten Schadens-, Punkte-,
Leichen-, Hook- und Kollisionssysteme zur ursprünglichen Baseq3-Todesfolge. Die
MiniLang-Funktionen werden nach jeder Aktion gegen unveränderte C-Funktionskörper
und vollständige Entity-/PlayerState-Zustände verglichen.

## Übertragene Funktionen

| MiniLang | Original |
| --- | --- |
| `deaths.playerDie` | `player_die` |
| `deaths.tossClientItems` | `TossClientItems` |
| `deaths.checkAlmostCapture`, `checkAlmostScored` | gleichnamige C-Funktionen |
| `team_bonuses.fragBonuses` | `Team_FragBonuses` |
| `team_bonuses.otherTeam`, `teamName` | `OtherTeam`, `TeamName` |
| `deaths.respawn` | `respawn` |
| `server.world.inPVS` | `SV_inPVS` |

`playerDie` behält die ursprüngliche Reihenfolge: frühe Rückkehr, Fast-Capture-
Prüfungen, Hook-Freigabe, Obituary-Log und Broadcast-Entity, Kill-/Teamwertung,
Auszeichnungen, Flaggenregeln, No-Drop-Abfrage, Scoreboards, Leichenzustand,
Todesanimation oder Gib und abschließender Server-Link. Die Berechnung verwendet
weiterhin 32-Bit-Zeitdifferenzen und die Baseq3-Grenzen von 3.000 ms für Excellent,
1.700 ms für Respawn sowie −40 Gesundheit für Gibs.

Die Item-Auswahl folgt `bg_itemlist`: laufende Waffenwechsel können die noch nicht
angehobene Waffe auswählen; Gauntlet, Machinegun und Grappling Hook werden nicht
fallen gelassen. Powerups werden außerhalb von `GT_TEAM` in 45-Grad-Schritten
angefordert. Ihre Restzeit wird auf Sekunden abgeschnitten und auf mindestens eins
begrenzt. Baseq3 besitzt keine Items für die nur unter `MISSIONPACK` verwendeten
Powerups; diese Einträge werden wie im Original übersprungen.

Team-Boni umfassen Flag-Carrier-Frag, Danger Protect, Basis- und Trägerschutz. Die
PVS-Prüfung führt echte BSP-Cluster- und Area-Abfragen aus. Der Originalcode
überschreibt im Trägerschutz versehentlich einen Entfernungsvektor und verwendet
danach noch den vorherigen Angreifer-zur-Flagge-Vektor. Der Port bildet dieses
beobachtete Baseq3-Verhalten ausdrücklich nach; ein Testfall sichert es.

## Explizite Integrationsgrenzen

| Callback | Bedeutung |
| --- | --- |
| `level.itemDropFn(level, self, itemIndex, angle)` | `Drop_Item`; liefert die erzeugte Entity zurück |
| `level.flagReturnFn(level, team)` | `Team_ReturnFlag` |
| `level.teamMessageFn(level, recipient, text)` | formatiertes Nutzargument von `PrintMsg` |
| `level.clientSpawnFn(level, ent)` | vollständiges `ClientSpawn` |

Diese Grenzen sind absichtlich sichtbar. Der Vergleichshost zeichnet jeden Aufruf
mit Reihenfolge und Argumenten auf. Er erzeugt für `Drop_Item` eine beobachtbare
Test-Entity und verändert im `ClientSpawn`-Callback gezielt Position und
Clientnummer, damit der nachfolgende Teleport-Effekt die Rückgabewerte wirklich
verwendet. Vollständige Item-Entities, Flag-Reset, Spielerinitialisierung,
Client-Frames und Netzwerkzustellung folgen in weiteren Abschnitten von Schritt 6
und 7.

## Nachweis

```powershell
python scripts/test_deaths.py
```

23 Szenarien mit 330 Aktionen vergleichen 3.885.472 32-Bit-Wörter und 40.488
String-Bytes exakt. Enthalten sind alle 24 Obituary-Namen und ungültige Indizes,
Welt-/Nichtclient-/Eigen-/Teamkills, Gauntlet und Excellent an der Zeitgrenze,
alle Drop-Entscheidungen, Flaggenpriorität, No-Drop, Team-Boni, PVS und Radien,
Fast-Capture/Scored, drei Todesanimationen, Blut/Gib/Suicide, Hook-Freigabe,
Zuschauer-Scoreboards, `G_Damage → player_die`, frühe Rückkehr und der
Respawn-Wrapper. Acht Laufzeitverträge prüfen Initialwerte, Itemtabellen und
fehlende Callback-Verbindungen.

Die C-Referenz nutzt die ursprünglichen Funktionen aus `g_combat.c`, `g_team.c`,
`g_client.c` und `sv_game.c`. Score-, Body-, Entity- und Server-Collision-Code
laufen auf beiden Seiten wirklich; die vier oben genannten Grenzen bleiben
beobachtete Aufrufe. Missionpack-Pfade und ein vollständiger Matchlauf sind nicht
Teil dieser Abnahme.
