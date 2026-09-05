# Items, Drop-Physik und Flaggenrückgabe

Dieser Abschnitt von Schritt 6 portiert den serverseitigen Lebenszyklus der
Baseq3-Items. Kartenobjekte und beim Tod fallengelassene Gegenstände sind echte
Entities, laufen durch dieselbe Frame-Schleife wie im Original und verwenden die
portierte Serverkollision. Das Aufnehmen durch Spieler ist noch nicht enthalten.

## Übertragene Funktionen

| MiniLang | Original |
| --- | --- |
| `items.register` | `RegisterItem` |
| `items.spawnItem`, `finishSpawning` | `G_SpawnItem`, `FinishSpawningItem` |
| `items.respawn`, `use` | `RespawnItem`, `Use_Item` |
| `items.launch`, `drop` | `LaunchItem`, `Drop_Item` |
| `items.run`, `bounce` | Item-Zweig von `G_RunItem`, `G_BounceItem` |
| `items.setFlagStatus`, `checkDropped` | `Team_SetFlagStatus`, `Team_CheckDroppedItem` |
| `items.resetFlag`, `returnFlag` | `Team_ResetFlag`, `Team_ReturnFlag` |
| `items.returnFlagSound` | `Team_ReturnFlagSound` |
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
ausgeführt. Die eigentliche `PrintMsg`-Zustellung bleibt eine beobachtete
Host-Schnittstelle.

## Offene Grenzen

`Touch_Item` ist als kontrollierter Fehler sichtbar. Damit fehlen noch
`Pickup_Weapon`, `Pickup_Ammo`, `Pickup_Armor`, `Pickup_Health`,
`Pickup_Powerup`, `Pickup_Holdable`, `Pickup_Team`, die zugehörige
Respawn-Auswahl sowie Client- und Score-Effekte. `ClearRegisteredItems` und
`SaveRegisteredItems` folgen mit der Client-Vorbereitung. Die lokale
Item-Deaktivierung über vorhandene Cvars ist implementiert; die native
Vergleichsreferenz hält diese Cvars für diesen Test jedoch fest auf null, daher
ist dieses Verhalten noch nicht als C-Parität abgenommen. Missionpack-Pfade sind
nicht Teil des Baseq3-Profils.

## Nachweis

```powershell
python scripts/test_items.py
```

12 Szenarien mit 152 Aktionen vergleichen 237.066 32-Bit-Wörter und 17.943
String-Bytes exakt. Enthalten sind Erzeugung und Winkelzufall, alle 35 Items,
Kartenplatzierung, Powerup-Verzögerung, Respawn und Teamketten, Drop-Physik,
Abprall, No-Drop, die ET_ITEM-Frame-Verzweigung sowie rote, blaue und neutrale
Flaggenzustände. Acht Laufzeitverträge prüfen Initialwerte und kontrollierte
Fehlergrenzen.

Die C-Referenz kompiliert die unveränderten Funktionskörper aus `g_items.c`,
`g_team.c`, `g_spawn.c` und `g_main.c` mit der originalen `bg_itemlist`. Nach
jeder Aktion werden Entity-, Level-, Configstring- und Zufallszustände
verglichen. `Touch_Item`, native Deaktivierungs-Cvars, `PrintMsg`-Transport und
vollständige Client-/Serverframes liegen außerhalb dieser Abnahme.
