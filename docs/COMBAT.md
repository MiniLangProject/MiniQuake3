# Schaden, Rüstung und Karten-Gefahren

`game/combat.ml` überträgt `CheckArmor`, den baseq3-Pfad von `G_Damage`,
`OnSameTeam`, `Team_CheckHurtCarrier`, `CanDamage`, `G_RadiusDamage` und
`LogAccuracyHit`. `game/hazards.ml` ergänzt die Touch-/Use-/Think-Funktionen von
`trigger_hurt`, `target_kill` und `target_laser`; ihre Spawn-Funktionen stehen in
`spawn_functions.ml`. Die Spielregeln laufen in MiniLang. Die ursprünglichen
C-Funktionskörper dienen ausschließlich als Vergleichsreferenz.

| Aufruf / Zustand | Vertrag |
| --- | --- |
| `combat.damage(level, targ, inflictor, attacker, dir, point, amount, dflags, mod)` | Originale Reihenfolge von Zulässigkeit, Mover-Aktivierung, Handicap, Rückstoß, Schutz, Rüstung, Trefferzählern und Callback-Aufrufen |
| `combat.checkArmor(ent, amount, dflags)` | Gibt absorbierten Schaden zurück und verändert `STAT_ARMOR` |
| `combat.onSameTeam`, `checkHurtCarrier` | Teamvergleich ab `GT_TEAM`, CTF-Träger-Zeitmerker einschließlich des originalen `generic1`-Pfads |
| `combat.canDamage(level, targ, origin)` | Bis zu fünf Sichtlinien über die echte Server-Kollision, mit ursprünglicher Reihenfolge und Trefferprüfung |
| `combat.radiusDamage(level, origin, attacker, amount, radius, ignore, mod)` | Abstand zur verlinkten Box, Schadensabnahme, Sichtprüfung, Trefferwertung und `DAMAGE_RADIUS` |
| `combat.logAccuracyHit(level, target, attacker)` | Wertbarer Treffer anhand von `takedamage`, Client, PlayerState-Gesundheit und Team; keine Zählererhöhung in dieser Funktion |
| `level.traceObserveFn` | Optionaler Beobachter nach der tatsächlichen Trace-Abfrage; kein Ersatz für die Kollision |
| `entities.createClient(state, team, cmdAngles)` | Bisher portierte Client-Felder mit Nullzustand initialisieren; noch kein vollständiger `gclient_t` |
| `spawn.create(level, text)` | Bindet `combat.damage` an `level.damageFn`, das `G_KillBox` aufruft |
| `level.intermissionQueued`, `knockback`, `friendlyFire` | Bereits aktualisierte Spiel-/Cvar-Werte; Vorgaben 0, 1000, 0. Spielmodus aus `level.spawner.gametype`, ohne Spawner FFA |
| `ent.pain(level, ent, attacker, take)` | Originaler Aufruf nach nicht tödlichem Gesundheitsschaden, falls vorhanden |
| `ent.die(level, ent, inflictor, attacker, take, mod)` | Erforderlicher Handler bei tödlichem Schaden; Spieler-Entities verwenden inzwischen `deaths.playerDie` |

Ein ohne Spawner aufgebauter Game-Kontext kann `level.damageFn = combat.damage`
explizit setzen. Die bisherigen Übergangstests behalten ihren aufzeichnenden
Callback. Die zusätzliche Kampfprüfung verbindet KillBox und Teleport dagegen
mit der echten portierten Schadensfunktion und prüft die resultierenden Zustände.
Die spätere Frame-Verwaltung muss Cvars weiterhin vor den Spielaufrufen aktualisieren.

Die Reihenfolge ist spielrelevant: Handicap wirkt vor dem Rückstoß; Selbstschaden
wird erst danach halbiert. Rückstoß kann trotz Godmode, Teamschutz oder Battlesuit
entstehen. Battlesuit erzeugt sein Ereignis vor der Radius-/Fallschaden-Abwehr.
`DAMAGE_NO_PROTECTION` überspringt den Godmode-/Teamschutzblock; entgegen dem
Originalkommentar laufen Rüstungs- und Battlesuit-Regeln weiterhin. Auch bei
`target_kill` wird daher Rüstung abgezogen und der verbleibende Schaden nach
diesen Regeln berechnet; seine 100.000 Schadenspunkte bleiben für normale
Spielergesundheit tödlich.

Die Richtung wird wie in C am übergebenen Vektor normalisiert. Ohne Richtung
unterbleibt Rückstoß und `damage_from` erhält die aktuelle Entity-Position.
Bei tödlichem Schaden erhält `STAT_HEALTH` zunächst den tatsächlichen Wert;
erst danach wird `ent.health` auf mindestens −999 begrenzt und `enemy` gesetzt.
Diese Zustände werden schon am Eintritt in den Death-Callback verglichen.

Die Rüstungsformel benutzt `ceil(damage * 0.66)` mit einer Double-Konstante.
Der Port ruft dafür ausschließlich die mathematische CRT-Funktion `ceil` auf;
Zustandsänderung und Kontrollfluss bleiben MiniLang. Rückstoß und Vektoren
verwenden die explizite binary32-Arithmetik. `lasthurtcarrier` ist im Original
ebenfalls ein Float, obwohl ihm die ganzzahlige Spielzeit zugewiesen wird.
Die Tests vergleichen seine Bits auch oberhalb von 16.777.216 ms.

`trigger_hurt` speichert seine Sperrzeit auf der Trigger-Entity, sodass mehrere
berührende Spieler dieselbe Sperre teilen. Sie beträgt 100 ms oder mit Flag 16
1000 ms; Gleichheit mit dem aktuellen Termin erlaubt den nächsten Treffer.
Die Zeit und gegebenenfalls das Sound-Ereignis werden vor der Schadensfunktion
gesetzt, auch wenn diese anschließend den Schaden abwehrt. Flag 2 installiert
die Link-/Unlink-Umschaltung, Flag 4 unterdrückt den Sound und Flag 8 setzt
`DAMAGE_NO_PROTECTION`. Die frühe Verlinkung durch `SV_SetBrushModel` bleibt
wie in den übrigen Trigger-Spawns erhalten, auch beim nominellen START_OFF-Flag.

## Radius-Treffer und Laser

`CanDamage` prüft zuerst den Mittelpunkt von `r.absmin`/`r.absmax`. Hier genügt
eine freie Linie oder ein Treffer auf die Ziel-Entity. Falls beides nicht zutrifft,
folgen die vier XY-Ecken mit ±15 Einheiten, in Originalreihenfolge. Diese vier
Proben akzeptieren ausschließlich eine freie Linie. Die Tests verwenden echte
Inline-BSP-Hindernisse: Temporäre Entity-Boxen sind in Quakes Kollision intern
`CONTENTS_BODY` und versperren eine `MASK_SOLID`-Abfrage nicht.

Radius-Schaden benutzt den Abstand zur verlinkten, um eine Einheit erweiterten
Bounding-Box, nicht zur Entity-Position. Der Radius wird auf mindestens 1 gesetzt;
bei `distance >= radius` entfällt der Treffer. In der Formel wird `distance/radius`
als Float berechnet, danach folgen Subtraktion von der Double-Konstante `1.0`,
Multiplikation und schließlich die Float-Speicherung. Die Parameter `amount` und
`radius` werden bereits beim Eintritt auf C-Float-Präzision gerundet.

Die Kandidatenliste bleibt während des Aufrufs fest, spätere Kandidaten lesen
jedoch ihren aktuellen Zustand nach früheren Callbacks. Freigabe, Wiederverwendung,
Versetzen und neu angelegte Entities werden verglichen. `LogAccuracyHit` wird
vor `G_Damage` ausgewertet. Deshalb kann der Rückgabewert einen wertbaren Treffer
melden, auch wenn zum Beispiel Battlesuit anschließend den Radius-Schaden abwehrt.
Die Rückstoßrichtung erhält wie im Original zusätzlich 24 Einheiten nach oben.

Ein `target_laser` startet seine Einrichtung nach 100 ms. Er wählt das erste aktive
Ziel mit passendem Namen oder übernimmt die eingestellte Richtung. Sein Use-Aufruf
speichert den Activator und schaltet anhand von `nextthink > 0` ein oder aus.
Bei jedem Think berechnet er gegebenenfalls die Zielrichtung neu, verfolgt einen
Strahl über 2048 Einheiten und speichert den Trefferpunkt in `s.origin2`.
Die beiden `VectorMA`-Makros für den Zielpunkt verwenden wegen `0.5` doppelt genaue
Zwischenrechnungen; 256 zusätzliche Subnormal-Proben prüfen diese Grenze.

Die Originalbedingung `if (tr.entityNum)` überspringt Schaden an Entity 0.
Alle übrigen Treffer gehen mit `DAMAGE_NO_KNOCKBACK` und `MOD_TARGET_LASER` in
die Schadensfunktion. Diese kann trotz des Knockback-Flags die übergebene
Strahlrichtung normalisieren. Die Abfragen, ihre vollständigen Ergebnisfelder,
Link-/Unlink-Aufrufe und Think-Termine werden gegen C verglichen.

**Bekannte Abweichung bei einem künstlichen Callback:** Gibt der Pain-Callback
den angreifenden Laser frei, versucht C anschließend dessen erneute Verlinkung
mit dem nun auf 0 gesetzten `s.number`. Dadurch benutzt es die Server-Metadaten
eines anderen Platzes. Die bestehende MiniLang-Prüfung verlangt weiterhin eine
zur Slot-Nummer passende Entity-Nummer und weist diesen Link kontrolliert zurück.
Ein gesonderter Lauf bestätigt die übereinstimmenden Beobachtungen bis zu dieser
Grenze; er zählt ausdrücklich nicht als vollständige C-Parität dieses Ablaufs.

Die [Projektil-Verarbeitung](MISSILES.md) verbindet direkte und radiale Treffer
inzwischen mit Raketen, Granaten, Plasma, BFG und Shooter-Objekten.

## Vergleich und offene Abnahmen

`test_combat.py` vergleicht nach jeder Aktion vollständige Entity-/PlayerStates,
die bisherigen räumlichen und privaten Game-Felder sowie die ergänzten
Schadensfelder, Callback-Argumente, Float-Bits und veränderten Eingabevektoren.
Die bisherigen neun Szenarien prüfen Rüstungsgrenzen, Schutzkombinationen, Selbstschaden,
frühe Rückgaben, Callback-Freigabe, Teams/CTF, 1024 numerische Schadensproben,
alle 32 Hurt-Flags, gemeinsame Sperrzeiten, echte räumliche Trigger-Kontakte,
Kill-Targets, überlappende Telefrag-Kandidaten und Teleports einschließlich Zuschauer.
Die Protokollprüfung verlangt im isolierten räumlichen Hurt-Fall genau zwei
Pain-Callbacks und im KillBox-/Teleport-Fall genau drei Death-Callbacks.
Acht zusätzliche Laufzeitverträge prüfen die Integration, Fehlergrenzen und die
Rundung der neuen Float-Parameter beim Funktionseintritt.
Aktuelle Summen und Binary-Hashes stehen in [PARITY_AUDIT.md](PARITY_AUDIT.md).

Die neuen Fälle ergänzen echte Verdeckung mit ein bis fünf Sichtlinien-Proben,
Radiusgrenzen, 512 Präzisionsproben, Änderungen während des Radius-Aufrufs und
Laser-Einrichtung, Umschaltung, Zielverfolgung und Trefferfilter. Die Prüfung
verlangt dabei tatsächlich ausgeführte Trace- und Schadenspfade. Ein weiterer
Vergleich lädt jede der 31 CD-Karten mit ihren Kurvenflächen und prüft Sichtlinien
und Radius-Schaden an ausgewählten Entity-Positionen. Das ist noch kein vollständiger
Waffen- oder Match-Replay.

Die C-Referenz benutzt unveränderte Game-Funktionskörper und die tatsächliche
SV-/CM-Kollision. `G_Damage` wird einschließlich seiner Präprozessorzweige
kopiert und ohne `MISSIONPACK` kompiliert. Getestet ist das festgelegte native
MSVC-x86-Profil; Integer-Grenzproben belegen dessen Verhalten, keine portable
C-Zusage für vorzeichenbehaftete Überläufe. `G_Printf`-Diagnosen sind ausgenommen.

Die Pain-, Death- und Mover-Callbacks zeichnen im Vergleichshost ihre Aufrufe auf;
ausgewählte Test-Callbacks geben die Entity frei. Sie implementieren keine
Ersatz-Spieler-Todeslogik. Ohne erforderlichen Death-Handler liefert MiniLang
nach den ursprünglichen Zustandsänderungen einen Fehler. Auch der ungültige
Nicht-Client-Zustand, der in C im Trefferzähler auf NULL zugreift, wird kontrolliert
abgewiesen; diese Vertragsproben sind keine Übereinstimmung mit einem definierten
C-Fehlerpfad.

`player_die`, Team-Fragboni und der Respawn-Wrapper sind inzwischen in
[DEATHS.md](DEATHS.md) gegen C geprüft und mit diesem Schadenspfad verbunden.
Item-Aufnahme und CTF-Capture sind inzwischen über die gemeinsame Score- und
Kollisionsschicht verbunden. `ClientSpawn` ist inzwischen separat geprüft. Offen bleiben weitere
Waffentreffer und die vollständige Waffensteuerung, Schadensfeedback am Frame-Ende,
weitere Teamregeln, Mover-Steuerung,
Missionpack und die vollständige Serverintegration.

```powershell
python scripts/test_combat.py
python scripts/test_combat.py --data-root D:/Quake3
python scripts/verify.py --data-root D:/Quake3 --extended
```

Die [Leichenverwaltung](PLAYER_LIFECYCLE.md) bindet `body_die` an den portierten
Schadenspfad an und prüft Gibs mit echtem `G_Damage`. `LookAtKiller` wird nun
auch von der vollständigen Baseq3-Todesfolge verwendet.

Die [Punkte- und Scoreboard-Bausteine](SCORES.md) sind separat gegen C geprüft;
ihre Verbindung mit `player_die` und Team-Fragboni ist ebenfalls nachgewiesen.
