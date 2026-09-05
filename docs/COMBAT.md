# Schaden, Rüstung und Karten-Gefahren

`game/combat.ml` überträgt `CheckArmor`, den baseq3-Pfad von `G_Damage`,
`OnSameTeam` und `Team_CheckHurtCarrier`. `game/hazards.ml` ergänzt die Touch-/Use-
Funktionen von `trigger_hurt` und `target_kill`; ihre Spawn-Funktionen stehen in
`spawn_functions.ml`. Die Spielregeln laufen in MiniLang. Die ursprünglichen
C-Funktionskörper dienen ausschließlich als Vergleichsreferenz.

| Aufruf / Zustand | Vertrag |
| --- | --- |
| `combat.damage(level, targ, inflictor, attacker, dir, point, amount, dflags, mod)` | Originale Reihenfolge von Zulässigkeit, Mover-Aktivierung, Handicap, Rückstoß, Schutz, Rüstung, Trefferzählern und Callback-Aufrufen |
| `combat.checkArmor(ent, amount, dflags)` | Gibt absorbierten Schaden zurück und verändert `STAT_ARMOR` |
| `combat.onSameTeam`, `checkHurtCarrier` | Teamvergleich ab `GT_TEAM`, CTF-Träger-Zeitmerker einschließlich des originalen `generic1`-Pfads |
| `entities.createClient(state, team, cmdAngles)` | Bisher portierte Client-Felder mit Nullzustand initialisieren; noch kein vollständiger `gclient_t` |
| `spawn.create(level, text)` | Bindet `combat.damage` an `level.damageFn`, das `G_KillBox` aufruft |
| `level.intermissionQueued`, `knockback`, `friendlyFire` | Bereits aktualisierte Spiel-/Cvar-Werte; Vorgaben 0, 1000, 0. Spielmodus aus `level.spawner.gametype`, ohne Spawner FFA |
| `ent.pain(level, ent, attacker, take)` | Originaler Aufruf nach nicht tödlichem Gesundheitsschaden, falls vorhanden |
| `ent.die(level, ent, inflictor, attacker, take, mod)` | Erforderlicher Handler bei tödlichem Schaden; die vollständige Spieler-Todeslogik folgt noch |

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

## Vergleich und offene Abnahmen

`test_combat.py` vergleicht nach jeder Aktion vollständige Entity-/PlayerStates,
die bisherigen räumlichen und privaten Game-Felder sowie die ergänzten
Schadensfelder, Callback-Argumente, Float-Bits und veränderten Eingabevektoren.
Neun Szenarien prüfen Rüstungsgrenzen, Schutzkombinationen, Selbstschaden,
frühe Rückgaben, Callback-Freigabe, Teams/CTF, 1024 numerische Schadensproben,
alle 32 Hurt-Flags, gemeinsame Sperrzeiten, echte räumliche Trigger-Kontakte,
Kill-Targets, überlappende Telefrag-Kandidaten und Teleports einschließlich Zuschauer.
Die Protokollprüfung verlangt im isolierten räumlichen Hurt-Fall genau zwei
Pain-Callbacks und im KillBox-/Teleport-Fall genau drei Death-Callbacks.
Sechs zusätzliche Laufzeitverträge prüfen die Integration und Fehlergrenzen.
Aktuelle Summen und Binary-Hashes stehen in [PARITY_AUDIT.md](PARITY_AUDIT.md).

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

Offen bleiben `player_die`, Scores/Respawn, Waffen- und Radius-Trefferberechnung,
Schadensfeedback am Frame-Ende, vollständige Teamregeln, Mover-Steuerung,
Missionpack und die vollständige Serverintegration.

```powershell
python scripts/test_combat.py
python scripts/verify.py --data-root D:/Quake3 --extended
```
