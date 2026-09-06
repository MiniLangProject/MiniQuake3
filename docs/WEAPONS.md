# Baseq3-Waffen und Schussverarbeitung

Stand: 2026-09-06. Alle 21 in Baseq3 enthaltenen Funktionen aus `g_weapon.c`
liegen als MiniLang-Port vor. Dieser Schritt ergänzt 17 Funktionen; die vier
bereits portierten Helfer für Accuracy, Vektorrundung und Hook-Verarbeitung
werden weiterverwendet. Missionpack-Zweige gehören nicht zu diesem Umfang.

| Original | MiniLang-Zuordnung |
| --- | --- |
| `FireWeapon` | `weapons.fire` |
| `CalcMuzzlePoint`, `CalcMuzzlePointOrigin` | `weapons.calcMuzzlePoint`, `weapons.calcMuzzlePointOrigin` |
| `G_BounceProjectile` | `weapons.bounceProjectile` |
| `Weapon_Gauntlet`, `CheckGauntletAttack` | `weapons.gauntlet`, `weapons.checkGauntlet` |
| `weapon_grenadelauncher_fire`, `Weapon_RocketLauncher_Fire` | `weapons.grenade`, `weapons.rocket` |
| `Weapon_Plasmagun_Fire`, `BFG_Fire`, `Weapon_GrapplingHook_Fire` | `weapons.plasma`, `weapons.bfg`, `weapons.grapple` |
| `Bullet_Fire` | `weapon_hitscan.bullet` |
| `ShotgunPellet`, `ShotgunPattern`, `weapon_supershotgun_fire` | `weapon_hitscan.shotgunPellet`, `weapon_hitscan.shotgunPattern`, `weapon_hitscan.shotgun` |
| `weapon_railgun_fire`, `Weapon_LightningFire` | `weapon_hitscan.rail`, `weapon_hitscan.lightning` |
| `LogAccuracyHit` | `combat.logAccuracyHit` |
| `SnapVectorTowards`, `Weapon_HookFree`, `Weapon_HookThink` | `missiles.snapTowards`, `missiles.hookFree`, `missiles.hookThink` |

Die genannten Module liegen unter `src/mq3/game/`. `weapon_state.ml` hält die
ursprünglich dateistatischen Werte `s_quadFactor`, `forward`, `right`, `up`
und `muzzle`. Die eigentlichen Schadens-, Todes-, Item- und Projektilregeln
bleiben in den vorhandenen Modulen `combat`, `deaths`, `items` und `missiles`.

## Einbindung und Waffenwahl

`ClientEvents` führt `EV_FIRE_WEAPON` standardmäßig über `weapons.fire` aus.
Die Gauntlet-Prüfung in `ClientThink_real` verwendet standardmäßig
`weapons.checkGauntlet`, bevor Pmove das Ergebnis erhält. Explizite
`fireWeaponFn`- und `gauntletAttackFn`-Callbacks bleiben für isolierte Hosts
verfügbar. Die neue Waffenprüfung verwendet die tatsächlichen Standardpfade.

`FireWeapon` liest `ent.s.weapon`, bestimmt den Quad-Faktor, erhöht den
Schusszähler und berechnet die Zielbasis samt Mündung. Gauntlet und Grapple
sind vom Schusszähler ausgenommen. Ein unbekannter Waffenwert erhöht den
Zähler weiterhin und berechnet die Basis, löst danach aber keinen Waffenpfad
aus. Die Munitions- und Waffenzeitregeln bleiben Bestandteil von Pmove.

Die Mündung entsteht aus `ent.s.pos.trBase`, der Blickhöhe und einem Versatz
von 14 Einheiten entlang `forward`. Beide Mündungshelfer benutzen diese
Position: `CalcMuzzlePointOrigin` ignoriert seinen zusätzlichen `origin`-
Parameter wie der festgeschriebene Originalcode, auch wenn der Aufrufer
`oldOrigin` übergibt.

## Gemeinsamer Zustand und numerisches Profil

`weapon_state.get(level)` liefert dieselbe Zustandsinstanz über aufeinander-
folgende Helferaufrufe. Der Anfangswert des Faktors ist 0.0, die vier Vektoren
sind getrennte Nullvektoren. Zielberechnung und Mündungsberechnung schreiben
deren Komponenten an Ort und Stelle.

Dieses gemeinsame Speicherverhalten ist für die Spielregeln relevant:
`G_Damage` normalisiert das übergebene Richtungsarray direkt. Alle betreffenden
Waffen übergeben deshalb das gemeinsame `forward`. Die Projektil-Erzeuger
normalisieren ebenfalls diese Richtung; der Granatenhelfer erhöht zuvor
deren Z-Komponente um `0.2f`. Spätere direkte Helferaufrufe sehen den veränderten
Zustand. Das Shotgun-Muster besitzt dagegen eine eigene lokale Vektorbasis;
seine Pellets übergeben an den Schadenspfad trotzdem das globale `forward`.

Die Anpassung folgt dem nativen x86-MSVC-Profil der Referenz. Float-Ausdrücke
verwenden die ursprünglichen binary32-Zwischenschritte; Quad-Skalierung wird
zuerst als Float-Multiplikation und anschließend durch Abschneiden zu int32
ausgeführt. Zähler und Zeitwerte behalten die im nativen Profil beobachtete
32-Bit-Arithmetik.

Das Spielmakro `SnapVector` schneidet jede Komponente zur Ganzzahl ab. Es
entspricht damit nicht der Rundung von `trap_SnapVector`. Mündung,
Shotgun-Richtung und erzeugte Eventpositionen verwenden die entsprechenden
vorhandenen Helfer. Bullet- und Rail-Endpunkte verwenden zusätzlich
`SnapVectorTowards`, das den ganzzahligen Endpunkt abhängig von der Mündung gegebenenfalls um eins verschiebt.
`G_BounceProjectile` übernimmt die ursprüngliche Reflexion, Normalisierung
und Verlängerung um 8192 Einheiten.

## Treffer, Schaden und Accuracy

Die an `G_Damage` übergebenen Basiswerte betragen 50 für Gauntlet, 10 je
Shotgun-Pellet, 100 für Rail und 8 für Lightning, jeweils mit Quad-Skalierung.
Die Machinegun verwendet 5 ausschließlich bei `GT_TEAM`, sonst 7, also auch
bei CTF 7. Diese Werte sind keine Zusage über den tatsächlichen Gesundheits-
verlust: Handicap, Rüstung, Teamschutz, Godmode, Battle Suit, Selbstschaden
und die vorhandenen Schmerz-/Todesfunktionen werden danach real ausgeführt.

`LogAccuracyHit` verlangt ein schadensfähiges Ziel, verschiedene Ziel- und
Angreifer-Entities, Clients auf beiden Seiten und ein gegnerisches Team nach
der ursprünglichen `OnSameTeam`-Regel. Die Gesundheitsprüfung liest ausdrücklich
`target.client.ps.stats[STAT_HEALTH]`, nicht `target.health`.

| Pfad | Reihenfolge der Accuracy-Prüfung |
| --- | --- |
| Bullet | Flesh-Impact erzeugen, Accuracy prüfen, danach `G_Damage` |
| Rail | Accuracy für den getroffenen Gegner prüfen, danach `G_Damage` |
| Shotgun-Pellet | `G_Damage` vollständig ausführen, danach Accuracy prüfen |
| Lightning | `G_Damage` vollständig ausführen, aktuellen Impactzweig ausführen, danach gegebenenfalls Accuracy prüfen |

Bei Prüfungen nach Schaden sind auch die Auswirkungen des tatsächlichen
`player_die` oder anderer aufgerufener Entity-Callbacks bereits wirksam.
Ein tödlicher Treffer zählt deshalb nicht automatisch als Accuracy-Treffer;
entscheidend bleiben die dann vorhandenen Client-, `takedamage`- und
PlayerState-Werte. Lightning wählt auch seinen Flesh-/Miss-Impact anhand des
Zustands nach dem Schadensaufruf.

`Weapon_Gauntlet` selbst ist leer. `CheckGauntletAttack` führt den 32-Einheiten-
Trace aus, erzeugt gegebenenfalls den Flesh-Impact und prüft erst anschließend
erneut die Schadensfähigkeit. Bei einem schadensfähigen Ziel setzt es den
Quad-Faktor nach einem gegebenenfalls erzeugten Quad-Ereignis und ruft `G_Damage` auf.
Sein positives Ergebnis bezeichnet diesen ausgeführten Schadensaufruf;
Schutzregeln können den Gesundheitsverlust weiterhin verhindern. Es erhöht
keinen Accuracy-Trefferzähler. Frühe Rückgaben lassen den bisherigen
Quad-Faktor unverändert.

Bullet, Pellet, Gauntlet und Lightning führen in Baseq3 jeweils einen
Punkttrace mit ursprünglichen NULL-`mins`/`maxs` aus. Die im C-Code enthaltenen
10er-Schleifen setzen nur in Missionpack-Zweigen fort. `SURF_NOIMPACT`
beendet Bullet, Pellet und Gauntlet vor dem Schadensaufruf. Lightning kann
dort weiterhin Schaden und einen Flesh-Impact erzeugen; nur sein Miss-Impact
wird unterdrückt. Bei `ENTITYNUM_NONE` beendet Lightning den Aufruf ohne Impact.

## Streuung und Zufallszustand

Bullet verbraucht für seine Streuung genau drei CRT-`rand`-Werte, auch bei
einem Spread von null. Das Makro `random()` dividiert als Float durch 32767.
Der Winkel entsteht mit dem Float-`M_PI` und Float-Multiplikationen. `sin`,
`cos` und das Makro `crandom()` rechnen danach mit den ursprünglichen
Double-Zwischenschritten, bis die beiden Streuwerte nach binary32 gespeichert
werden. Der Endpunkt entsteht aus den drei originalen VectorMA-Schritten.

Der Shotgun-Schuss erzeugt zuerst `EV_SHOTGUN`, speichert die abgeschnittene
4096-fache Vorwärtsrichtung und zieht einen CRT-`rand`-Wert für den 8-Bit-Seed.
`ShotgunPattern` benutzt anschließend einen eigenen lokalen `Q_rand`-Zustand
mit dem Multiplikator 69069. Für jedes der elf Pellets werden zwei
`Q_crandom`-Werte erzeugt. Diese Musterwerte verbrauchen keine weiteren
CRT-`rand`-Werte. Die Schadens-/Todesabläufe können unabhängig davon ihren
eigenen Zufall benötigen. Alle elf Pellets werden verarbeitet; höchstens der
erste erfolgreiche Accuracy-Check erhöht den Schuss-Trefferzähler.

## Rail und Projektile

Rail führt seinen Trace wiederholt gegen dieselbe Strecke aus. Eine getroffene
nichtsolide Entity wird nach ihrer Schadensverarbeitung aus der Kollision
entfernt. Nach höchstens vier solchen Unlinks endet die Suche; feste Inhalte
und die Welt-/Keine-Entity-Grenze beenden sie früher. Anschließend werden alle
gespeicherten Entity-Zeiger in ihrer Trefferreihenfolge wieder gelinkt. Das
gilt im C-Original auch dann, wenn ein Todes-Callback die Entity inzwischen
freigegeben hat. MiniLang bewahrt die Zeigerreihenfolge, weist aber einen Link
mit einer nach Freigabe ungültigen Entity-Nummer weiterhin kontrolliert zurück;
das native Aliasverhalten fremder Server-Metadaten ist kein Paritätsumfang.

Der letzte Trace bestimmt den Rail-Trail. Sein Mündungsende erhält die
originalen Versätze entlang `right` und `up`; die Spielerfarbe kommt aus
`ent.s.clientNum`. `SURF_NOIMPACT` setzt den Eventparameter auf 255 und
unterdrückt damit die Endexplosion, während der Trail erhalten bleibt.

Ein Fehlschuss setzt `accurateCount` zurück. Andernfalls wird die Zahl gültiger
Treffer addiert. Ab zwei Punkten werden einmal zwei Punkte abgezogen,
`PERS_IMPRESSIVE_COUNT` erhöht, die bisherigen Awardbits ersetzt und
`rewardTime` auf Spielzeit plus 2000 gesetzt. Auch ein Schuss durch mehrere
Gegner vergibt höchstens eine solche Auszeichnung und erhöht
`accuracy_hits` nur einmal; ein verbleibender `accurateCount` bleibt bestehen.

Granate, Rakete, Plasma und BFG benutzen die vorhandenen tatsächlichen
`fire_*`-Ports. Erst nach der Erzeugung werden direkter Schaden und
Explosionsschaden mit dem gemeinsamen Quad-Faktor skaliert. Geschwindigkeiten,
Zeiten, Eigentümer, Flugbahnen und anschließende Kollisionen bleiben damit
die bestehenden Projektilregeln. Grapple erzeugt nur bei freiem `fireHeld`
und fehlendem Hook ein Projektil, setzt `fireHeld` aber in jedem Fall.
Die bereits portierten Hook-Think-/Free-Funktionen übernehmen die weitere
Bindung und Freigabe.

## Referenz und Grenzen

Die native Referenz übernimmt die unveränderten vollständigen Funktionskörper
aus dem festgeschriebenen `g_weapon.c`, einschließlich der gemeinsamen
Dateivariablen und Originalkonstanten. Baseq3-Präprozessorzweige werden mit
x86-MSVC, `/Od`, `/fp:strict`, `/arch:SSE2` und dem statischen CRT gebaut.
Die ursprüngliche Server-/BSP-Kollision und die echten Schadens-, Todes-,
Item- und Projektilfunktionen führen die Spielabläufe aus.

Der Waffenmodus erweitert den vollständigen bisherigen Harness-Snapshot bei
Host-Aufrufen und nach Aktionen: alle modellierten Clients und EntityStates,
die erfassten privaten/räumlichen Felder, Team-/Vote-/Sitzungszustände sowie
der gemeinsame Waffenfaktor und alle vier Waffenvektoren. Zusätzlich werden
Hook-Zeiger, direkter und Explosionsschaden, Explosionsradien, Todesarten und
Zielzeiger der Entities aufgenommen.

Die beobachteten Waffentraces enthalten die NULL-Eigenschaft der Tracegrenzen,
Start-/Endpunkte, Pass-Entity, Maske und die vollständigen erfassten
Kollisionsergebnisse einschließlich Float-Bits. So wird die Streuung vor der
nachfolgenden Impact-Rundung verglichen. Ein zusätzlicher CRT-`rand`-Wert am
Ende prüft den erreichten gemeinsamen Zufallszustand. Direkte Helferaufrufe,
`FireWeapon`, Client-Ereignisse und der tatsächliche Client-Think-Pfad sind
über dasselbe Harness erreichbar.

Zusätzliche MiniLang-Prüfungen weisen ungültige Client-/Entityzugriffe
kontrolliert zurück. Eine Nullrichtung für das direkte Shotgun-Muster kann
im Original durch die senkrechte Vektorberechnung NaN erzeugen; daraus wird
keine Paritätszusage für ungültige Traces abgeleitet. Die beschriebenen
numerischen Ergebnisse beziehen sich auf das native Referenzprofil, nicht
auf sämtliche historischen Plattformen oder QVM-Ausführungen.

Der gemeinsame Waffenstatus ist derzeit an die MiniLang-Levelinstanz gebunden.
Der spätere Engine-Host muss bei Mapwechseln und VM-Neuladungen festlegen,
wann diese Instanz erhalten oder neu erzeugt wird, entsprechend der
Lebensdauer der ursprünglichen Modulvariablen. Event-Entities und ihre
Nutzlasten sind Spielzustand; sichtbare Effekte, Audio, Rendering und
Netzwerktransport werden dadurch noch nicht implementiert. Missionpack-
Waffen und Invulnerability-Abpraller bleiben außerhalb dieses Baseq3-Ports.

## Prüflauf

```powershell
python scripts/test_weapons.py
```

Dieser Lauf führt die native Waffenreferenz und den MiniLang-Vergleich über
das gemeinsame Harness aus. Seine bestätigten Ergebnisse bilden den
Waffennachweis für die zusammengeführte Portabnahme.

## Ergebnisse

`scripts/test_weapons.py` besteht mit **235 Szenarien**,
**1.080 Aktionen**, **47.541.055 exakt gleichen 32-Bit-Wörtern**,
**589 Waffentraces**, **528 geordneten Nebenwirkungen**
und **226.841.083 Ausgabe-Bytes**. **14 Laufzeitverträge** prüfen
zusätzliche Schnittstellen- und Zustandsgrenzen. Der separate Protokollleser
bestätigt tatsächlich erreichte Treffer, Schaden, NoImpact-Flächen, Rail-Limit
und die einmalige Accuracy-Gutschrift bei direktem Raketen- plus Explosionsschaden.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Fixture weapons-0.bsp: `98064ce978246d76db75ff41849a23f2bb76dea5c5513da16a85eb60c7c16657`.
Fixture weapons-16.bsp: `075c0ae49b3ad2148fde3426f66bf869c3f0228085afe850006bb6c6074ab391`.
