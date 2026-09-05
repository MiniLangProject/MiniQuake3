# Trigger, Teleports und Entity-Zustände

`game/entitystate.ml` enthält alle 28 Felder von `entityState_t` einschließlich
beider Bewegungsbahnen. Der generierte Speicher-Codec hat 208 Bytes. Die C-Prüfung
kontrolliert unabhängig alle 36 aufgelösten Feldpositionen und Feldgrößen sowie
die bereits eingefrorenen 45 PlayerState-Felder. Das ist ein Speicher-/Testformat;
Quakes Delta-Netzwerkkodierung folgt in Schritt 7.

`game/snapshot.ml` überträgt beide PlayerState-Umwandlungen aus `bg_misc.c`.
Unberührte Entity-Felder bleiben erhalten, ebenso Ereignis-Sequenzbits, externe
Ereignisse, Sichtbarkeit lebender/toter Spieler, Powerup-Bits und die 50-ms-Grenze
der Extrapolation. Der Game-Makro `SnapVector` schneidet Float-Werte zur Ganzzahl
ab. Der Win32-Pmove-Trap rundet dagegen zur nächsten Ganzzahl und bei Gleichstand
zur geraden Ganzzahl.

| Modul / Funktion | Übertragene Aufgabe |
| --- | --- |
| `entities.create(world)` | Spielkontext mit räumlicher Szene und 1.024 Entity-Plätzen; erste 64 Plätze für Clients reserviert |
| `entities.initEntity`, `spawn`, `entitiesFree`, `free` | Ursprüngliche Platzverwaltung, Wiederverwendungsfrist, `neverFree`, Trennung von Game- und Server-Metadaten |
| `entities.setOrigin`, `tempEntity` | Bewegungsbahn initialisieren, Ereignis-Entity erzeugen und verlinken |
| `entities.pickTarget` | Aktive passende Target-Namen, ASCII-Groß-/Kleinschreibung, maximal erste 32 Treffer, Auswahl mit nativem Win32-`rand`-Profil |
| `triggers.touch` | Vollständige `G_TouchTriggers`-Abfrage über aktive/verlinkte Entities |
| `triggers.pushTouch`, `teleporterTouch` | Die beiden ursprünglichen Trigger-Touch-Funktionen |
| `teleport.setClientViewAngle` | Blickwinkel mit `ANGLE2SHORT` und gespeichertem Usercmd abstimmen |
| `teleport.killBox`, `player` | Telefrag-Kandidaten bestimmen und Teleport-Zustandswechsel in Originalreihenfolge ausführen |
| `server/world.entityContact` | Exakter stationärer Kontakt gegen das transformierte Entity-Modell |

Game-Entities besitzen `s` (vollständiger EntityState), `r` (Server-Kollision),
einen optionalen `client` sowie die bisher benötigten Game-Felder. Der Client
enthält hier PlayerState, Team und die letzten Command-Winkel, noch nicht den
gesamten privaten `gclient_t`. `entities.link` synchronisiert die gemeinsam
sichtbaren Felder und schreibt die vom Server berechnete Solid-Größe zurück.

Die Trigger-Abfrage benutzt zunächst den Bereich `(40,40,52)` um die aktuelle
Spielerposition. Danach prüft sie die präzise Spielerbox gegen Kollisionsmodelle;
Items verwenden ihre eigene asymmetrische Kontaktprüfung. Tote Clients aktivieren
keine Trigger. Zuschauer dürfen Teleporter und den ursprünglichen Door-Callback
berühren. Ein Bot erhält seinen eigenen Touch-Callback nach dem des berührten
Objekts. Kandidatenliste und Kontaktbox bleiben während der Schleife erhalten,
auch wenn ein Callback den Spieler teleportiert. Item-Prüfungen lesen dagegen
den dann aktuellen PlayerState. Diese Reihenfolge ist Teil des Vergleichs.

Ein Teleport erzeugt für Nicht-Zuschauer zuerst je eine Ereignis-Entity am
Ausgang und am Ziel. Danach wird der Spieler ausgelinkt, seine genaue Zielhöhe
um 1 erhöht, die Geschwindigkeit auf 400 in Blickrichtung gesetzt und eine
160-ms-Knockback-Zeit aktiviert. Das Teleport-Bit wird umgeschaltet und die
Winkeldifferenz zum letzten Usercmd aktualisiert. Erst danach folgen KillBox,
EntityState-Umwandlung und erneute Verlinkung mit der genauen Position. Zuschauer
bekommen diese temporären Ereignisse und die KillBox nicht und bleiben ausgelinkt.

**Schadensgrenze:** `G_KillBox` wählt die ursprünglichen überlappenden Client-
Entities aus und übergibt sie mit Schaden 100.000, `DAMAGE_NO_PROTECTION` und
`MOD_TELEFRAG` an `level.damageFn`. Die C-Prüfung zeichnet diesen Aufruf und die
Reihenfolge auf; sie ersetzt `G_Damage` nicht durch vereinfachte Lebenspunktregeln.
Die MiniLang-Implementierung verlangt diesen Callback bei einem betroffenen Client
und liefert bei fehlendem Callback einen Fehler. Vollständige Schäden, Tod,
Rüstung, Teamregeln und Scores sind noch Teil von Schritt 6.

Temporäre Entities tragen `eventTime` und `freeAfterEvent`. Ihre automatische
Entfernung erfolgt im noch zu portierenden Serverframe. Die Platzverwaltung ist
bereits vorhanden; das Testprotokoll prüft Freigabe, Wiederverwendung, Wachstum
und `neverFree` separat. Ein voller Normalbereich endet im Original bei 1.022
Entities mit Fehler, auch wenn nur ein zu kürzlich freigegebener Platz vorhanden
ist: Die nominelle zweite Suchrunde wird bei dieser Grenze nicht erreicht.

Der Vergleichshost verbindet unveränderte `G_TouchTriggers`, `TeleportPlayer`,
`G_KillBox`, `G_TempEntity` und weitere vollständige Originalfunktionen mit
unverändertem Server-, CM- und Pmove-Code. Die Game-Funktionskörper werden mit
Originalheadern extrahiert und ihre Hashes aufgezeichnet. Entity-Aufbau und
Pmove/Link/Touch-Aufrufprotokoll kommen aus dem Testhost. Das prüft noch keinen
vollständigen `ClientThink`-/Serverframe und ersetzt nicht das Spawn-Parsing
der ursprünglichen Karten-Entities. Das native Win32-`rand`-Profil ist getrennt
von einem späteren QVM-Rand-Profil zu betrachten.
