# Item-, Powerup-, Punkte- und Text-Targets

Referenz: unveränderter Baseq3-Quellstand
`dbe4ddb10315479fc00086f08e25d968b4b43c49`, `g_target.c` und der
Teamzustellungshelfer aus `g_utils.c`.

| Originalfunktion | MiniLang in `mq3.game.map_targets` |
|---|---|
| `SP_target_give` / `Use_Target_Give` | `giveSpawn` / `giveUse` |
| `SP_target_remove_powerups` / `Use_target_remove_powerups` | `removePowerupsSpawn` / `removePowerupsUse` |
| `SP_target_score` / `Use_Target_Score` | `scoreSpawn` / `scoreUse` |
| `SP_target_print` / `Use_Target_Print` | `printSpawn` / `printUse` |
| `G_TeamCommand` | `mapTargetsTeamCommand` |

Die Spawnfunktionen erhalten `(level,ent)`, die Usefunktionen
`(level,ent,other,activator)`. `mapTargetsTeamCommand` erhält
`(level,team,command)`. Der normale Kartendispatch in `spawn_functions.ml`
bindet alle vier Klassen ein.

## Verhalten und beobachtbare Reihenfolge

`target_give` berücksichtigt einen Activator mit Client und einen nicht-NULL
Targetnamen. Die Suche beginnt bei Entity 0, überspringt inaktive Entities
und vergleicht `targetname` wie `G_Find` mit `Q_stricmp`: ASCII ohne
Unterscheidung der Großschreibung, bis zum ersten NUL und höchstens über
99.999 Bytes. Ein leerer String ist ein gültiger Name; NULL entspricht keinem
Treffer. Nur ein NULL-Itemzeiger überspringt den eigentlichen Pickup. Integer
0 bezeichnet den nicht-NULL Dummyzeiger in `bg_itemlist`; ein erreichter
Pickup unterliegt deshalb weiterhin den Verträgen des Itemports.

Jeder Treffer durchläuft das vorhandene `items.touch` mit demselben vollständig
nullinitialisierten Trace. Danach setzt das Target `nextthink` auf 0 und
ruft immer `entities.unlink` auf. Das gilt auch nach verweigerter Aufnahme,
bei einem toten Activator und nach dem `wait == -1`-Pfad. Die nachfolgende
Suche beginnt hinter dem gerade bearbeiteten Arrayslot und berücksichtigt
aktuelle Targetnamen sowie die aktuelle Entityanzahl. Auch das Löschen des
gebenden Targets beendet die Schleife im Original nicht automatisch.

`target_remove_powerups` prüft rote, blaue und neutrale Flagge in dieser
Priorität. Es ruft höchstens einmal das vorhandene `items.returnFlag` auf,
einschließlich Basis-/Drop-Behandlung, Flaggenstatus, Rückgabesound und
Meldung. Fehlt eine Basisflagge, steht die originale NULL-Warnung des
Rückgabesounds vor der Rückgabemeldung. Erst anschließend werden alle
16 Powerupplätze des jetzt aktuellen Activator-Clients im vorhandenen Array
gelöscht. Ein Callback kann daher vor dem Löschen noch den alten Zustand
beobachten oder einen anderen bestehenden Client binden.

`target_score` setzt ausschließlich beim Spawnen einen Count von 0 auf 1.
Negative Counts bleiben erhalten; ein später auf 0 gesetzter Count wird
beim Benutzen unverändert übergeben. Das echte `scores.addScore` entscheidet
über Nicht-Clients und Warmup, erzeugt ScorePlum, ändert gegebenenfalls den
Teamscore und berechnet die Rangfolge. Der übergebene Ursprung ist
`ent.r.currentOrigin`; der Port kopiert diesen Vektor vor dem Folgeaufruf
nicht. Die ursprüngliche Beobachtungsreihenfolge bei Entity-Allokation,
Verknüpfung und Punkteänderung bleibt damit erreichbar. Beliebige Aliase
auf ersetzte Unterobjekte über Entity-Resets hinweg bleiben die in
[GAME_LIFECYCLE.md](GAME_LIFECYCLE.md) beschriebene Modellgrenze.

`target_print` erzeugt exakt `cp "Nachricht"`. Anführungszeichen,
Zeilenumbrüche und Prozentzeichen in der Nachricht bleiben unverändert.
Ein Client-Activator und Bit 4 erzwingen private Zustellung. Ein Activator
ohne Client fällt auch mit Bit 4 auf die übrigen Regeln zurück. Bit 1
adressiert Rot, Bit 2 Blau, ohne beide Bits geht ein Broadcast an Slot -1.
Die rote Zustellung erfolgt vor der blauen. Nach roten Callbacks liest der
Port die Flags und die Nachricht für Blau erneut.

Der echte `G_TeamCommand` berücksichtigt nur `connected == CON_CONNECTED`
und das passende Team. Der bereits vorhandene `PrintTeam` hat einen anderen
Filter und wird deshalb hier nicht verwendet. Clientfelder und
`level.maxclients` werden während der Schleife aktuell gelesen. Die
Zustellung verwendet das vorhandene `scores.send` und dessen
`level.serverCommandFn`.

## Gültigkeitsbereich und native Textpuffer

Die Nachricht eines `target_print` darf bis zum ersten NUL höchstens
31.994 Bytes enthalten: fünf Formatbytes und der Terminator müssen in
einen der originalen 32.000-Byte-`va`-Puffer passen. Bytes hinter dem ersten
NUL werden durch `%s` nicht verarbeitet. Der eigenständig aufrufbare
Teamhelfer erlaubt entsprechend 31.999 sichtbare Befehlsbytes. Er liest
den Befehl erst bei einem passenden Empfänger.

NULL an einem tatsächlich dereferenzierten Entityargument und
Pufferüberläufe werden sicher abgewiesen. Die Modellverträge
begrenzen Entitybereiche auf 0 bis 1.024 und Clientbereiche auf 0 bis 64;
private Zustellung verlangt eine tatsächliche Entity im vorhandenen Array.
Die Folgeports behalten ihre eigenen Item-, Client- und Zahlenverträge.
Insbesondere ist ein überlaufendes natives `AddScore`-`+=` kein Nachweis
ISO-C-definierter Arithmetik.

Für eine NULL-Nachricht wurde der unveränderte native Körper im aktuellen
Windows-CRT-Profil in drei Pfaden ausgeführt: Broadcast, private Ausgabe
und ein roter Teamempfänger. Alle drei beendeten den Aufruf erfolgreich und
lieferten exakt `cp "(null)"`. MiniLang übernimmt diese gemessene
CRT-Eigenschaft. Sie wird getrennt von ISO-C-definierten Fällen ausgewiesen;
aus `%s` mit NULL wird keine portable C-Garantie abgeleitet.

Eine eigene native Grenze entsteht schon bei gewöhnlichen Teamnachrichten:
`Use_Target_Print` formatiert seinen Befehl in einen von zwei statischen
`va`-Puffern. `G_TeamCommand` ruft pro Empfänger erneut `va("%s",cmd)` auf.
Beim zweiten passenden Empfänger kann Ein- und Ausgabepuffer identisch
sein. Ein solches `vsprintf`-Überlappen ist durch C nicht definiert.
Weitere verschachtelte `va`-Aufrufe können den zurückgehaltenen Puffer
ebenfalls verändern.

MiniLang hält den formatierten Teambefehl als eigenen String und stellt
ihn allen passenden verbundenen Spielern zu. Normales Teamspiel wird
deshalb nicht durch einen zusätzlichen Ablehnungsvertrag eingeschränkt.
Native Mehrfachempfängerbeobachtungen des verwendeten Windows-Profils
müssen getrennt vom Nachweis ohne Pufferüberlappung ausgewiesen werden;
abweichende Texte werden nicht normalisiert. Ein Nachweis ohne Überläufe
und ohne Überlappung belegt nicht die Lebensdauer beliebiger nativer
`va`-Zeiger über reentrante Aufrufe hinweg.

## Schnittstellen und Nachweisgrenze

Der Baustein bindet reale Item-, Flaggen-, Punkte- und Entityports ein.
Die bestehenden Engine-Senken für Serverbefehle, Spielmeldungen,
Configstrings, Log und Entitybeobachtung müssen für tatsächlich erreichte
Effekte verfügbar sein. `PrintMsg` bleibt die vorhandene explizite
Teamnachrichtenschnittstelle; ein Differentialhost muss seine eigentliche
Formatierung vor der Serverzustellung nachbilden.

Der hier beschriebene Produktionsumfang endet an den Spielmodul-Senken.
Engine-seitige zuverlässige Befehlswarteschlangen, deren weitere
Textbegrenzungen, Netzwerktransport und die Anzeige durch CGame sind
eigene Portierungs- und Integrationsaufgaben. Die gemeinsame
Differentialsuite [test_map_objects.py](../scripts/test_map_objects.py)
für diese Targets und die Portal-Entities verwendet
`tests/map_object_tests.ml` und unveränderte native Funktionskörper.
Der kanonische Bericht `build/reference/map_objects/result.json`
bestimmt nach dem abgeschlossenen Lauf die nachgewiesenen Fälle und Zahlen.

## Geprüfter Fallkatalog

Der eigenständige Target-Katalog enthält 96 definierte Szenarien mit 2.163
Aktionen und 587 ergänzenden semantischen Assertions. Hinzu kommen drei
getrennte NULL-CRT-Profile und drei native `va`-Überlappungsbeobachtungen.
Die gemeinsame Suite mit den Portal- und Einstiegsszenarien umfasst insgesamt
186 definierte Fälle und 122 zusätzliche MiniLang-Verträge.

Die Fälle prüfen unter anderem echte Pickup-Targets mit anschließender
Punktevergabe, abgelehnte Aufnahmen, Suche ab Slot 0, aktuelle Targetnamen,
Flaggenpriorität und Drop-Freigabe samt sofortiger Slotwiederverwendung,
Client-Neubindung, ScorePlum-Linkzustand und Änderungen zwischen roter und
blauer Zustellung. Die normale Textzustellung an 64 Empfänger und rekursive
Teamaufrufe werden als eigenständige MiniLang-Verträge geprüft.

```powershell
python scripts/test_map_objects.py
```

Der kanonische Gesamtbericht liegt unter `build/reference/map_objects/result.json`.
Teil- und Wiederverwendungsläufe schreiben separate Berichte.
