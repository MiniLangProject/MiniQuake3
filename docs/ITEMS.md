# Items, Pickups und CTF-Flaggen

Dieser Abschnitt von Schritt 6 portiert den serverseitigen Lebenszyklus der
Baseq3-Items einschließlich Aufnahme durch Spieler. Kartenobjekte und beim Tod
fallengelassene Gegenstände sind echte Entities, laufen durch dieselbe
Frame-Schleife wie im Original und verwenden die portierte Serverkollision.

## Übertragene Funktionen

| MiniLang | Original |
| --- | --- |
| `items.register` | `RegisterItem` |
| `items.spawnItem`, `finishSpawning` | `G_SpawnItem`, `FinishSpawningItem` |
| `items.respawn`, `use` | `RespawnItem`, `Use_Item` |
| `items.canGrab` | `BG_CanItemBeGrabbed` |
| `items.pickupWeapon`, `pickupAmmo`, `addAmmo` | `Pickup_Weapon`, `Pickup_Ammo`, `Add_Ammo` |
| `items.pickupArmor`, `pickupHealth` | `Pickup_Armor`, `Pickup_Health` |
| `items.pickupPowerup`, `pickupHoldable` | `Pickup_Powerup`, `Pickup_Holdable` |
| `items.touch` | `Touch_Item` |
| `items.launch`, `drop` | `LaunchItem`, `Drop_Item` |
| `items.run`, `bounce` | Item-Zweig von `G_RunItem`, `G_BounceItem` |
| `items.setFlagStatus`, `checkDropped` | `Team_SetFlagStatus`, `Team_CheckDroppedItem` |
| `items.resetFlag`, `returnFlag` | `Team_ResetFlag`, `Team_ReturnFlag` |
| `items.pickupTeam`, `touchOurFlag`, `touchEnemyFlag` | `Pickup_Team`, `Team_TouchOurFlag`, `Team_TouchEnemyFlag` |
| `items.addTeamScore`, `forceGesture`, `resetFlags` | `AddTeamScore`, `Team_ForceGesture`, `Team_ResetFlags` |
| `items.returnFlagSound`, `takeFlagSound`, `captureFlagSound` | entsprechende `Team_*FlagSound`-Funktionen |
| `items.teamFree`, `droppedFlagThink` | `Team_FreeEntity`, `Team_DroppedFlagThink` |

Die generierte Itemtabelle übernimmt Typ und Tag aller 35 Baseq3-Einträge aus
`bg_itemlist`. `G_SpawnItem` registriert das Item und plant die Platzierung zwei
Frames später. `FinishSpawningItem` setzt Modellindex, Begrenzungsbox, Inhalt,
Bounce-Flag und Touch-/Use-/Think-Funktionen; Boden-Traces, schwebende Items,
Powerup-Verzögerung und Teamketten folgen der ursprünglichen Reihenfolge.

Fallengelassene Items erhalten die originale Flugbahn, Winkelstreuung und
30-Sekunden-Lebensdauer. `G_RunItem` wertet die Trajektorie aus, führt den echten
Server-Trace aus und behandelt Boden, Abprall, Start-in-Solid, `SURF_NOIMPACT`
und `CONTENTS_NODROP`. Der ET_ITEM-Zweig der Entity-Schleife ruft diese
Implementierung direkt auf. `player_die` verwendet ohne Test-Override denselben
`Drop_Item`-Pfad.

Die CTF-Logik verwaltet roten, blauen und neutralen Flaggenstatus samt
Configstrings. Basis-Reset, Rückgabesound, No-Drop-Rückgabe, Timeout einer
fallengelassenen Flagge und Teamketten werden als echte Entity-Änderungen
ausgeführt. `Touch_Item` übernimmt Waffen, Munition, Rüstung, Gesundheit,
Holdables und Powerups, erzeugt vorhersagbare oder externe Pickup-Ereignisse,
feuert Item-Targets und plant den Respawn mit `wait` und `random`. Der
Powerup-Denial-Pfad prüft Entfernung, Blickrichtung, Team und Sichtlinie.

Flaggenaufnahme, Rückgabe und Capture aktualisieren Punkte, Teamstand,
Auszeichnungen, Assists, Ranglisten, Flaggenstatus und globale Sounds. Dabei
gelten die kleineren Bonuswerte des Baseq3-Profils; die höheren
`MISSIONPACK`-Werte werden nicht vermischt. Formatierte `G_LogPrintf`- und
`PrintMsg`-Nutzlasten enden an beobachteten Host-Schnittstellen.

## Offene Grenzen

`ClearRegisteredItems`, `SaveRegisteredItems` und `G_CheckTeamItems` sind mit
[Item-/Teaminitialisierung](GAME_INITIALIZATION.md) inzwischen separat geprüft.
Die clientseitige Vorabladung bleibt offen. Die lokale
Item-Deaktivierung über vorhandene Cvars ist implementiert; die native
Vergleichsreferenz hält diese Cvars für diesen Test jedoch fest auf null, daher
ist der Nichtnull-Fall noch nicht als C-Parität abgenommen. Die Host-Schnittstellen
übertragen Log- und `PrintMsg`-Nutzlasten noch nicht über ein echtes Netzwerk.
Vollständige Client-/Serverframes und Missionpack-Pfade sind nicht Teil dieses
Baseq3-Profils.

## Nachweis

```powershell
python scripts/test_items.py
```

20 Szenarien mit 307 Aktionen vergleichen 451.312 32-Bit-Wörter und 30.625
String-Bytes exakt. Enthalten sind Erzeugung und Winkelzufall, alle 35 Items,
Aufnahmegrenzen und sämtliche Baseq3-Pickup-Funktionen, Kartenplatzierung,
Powerup-Denial, Pickup-Ereignisse und Targets, Respawn und Teamketten,
Drop-Physik, Abprall, No-Drop, die ET_ITEM-Frame-Verzweigung sowie rote und blaue
Take-, Return- und Capture-Abläufe einschließlich beider Assist-Arten. Zwölf
Laufzeitverträge prüfen Initialwerte und kontrollierte Fehlergrenzen.

Die C-Referenz kompiliert die unveränderten Funktionskörper aus `g_items.c`,
`g_team.c`, `g_spawn.c` und `g_main.c` mit der originalen `bg_itemlist`. Nach
jeder Aktion werden Entity-, Client-, Level-, Configstring- und Zufallszustände
sowie Log-/Nachrichten-Nutzlasten verglichen. Nichtnull-Deaktivierungs-Cvars,
tatsächliche Netzwerkzustellung und vollständige Client-/Serverframes liegen
außerhalb dieser Abnahme.
