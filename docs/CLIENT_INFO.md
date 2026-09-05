# Spielernamen, Userinfo und Teamwahl

Stand: 2026-09-05. `src/mq3/game/client_info.ml` portiert die Baseq3-Funktionen
`ClientCleanName`, `ClientUserinfoChanged`, `TeamLeader` und `PickTeam` aus
`g_client.c`. `src/mq3/shared/info.ml` ergänzt `Info_ValueForKey` und
`Info_Validate` aus `q_shared.c`. Der normale Teamleiterwechsel verwendet jetzt
diese Userinfo-Verarbeitung. Der inzwischen portierte
[`ClientConnect`- und Sitzungsablauf](CLIENT_CONNECT.md) verwendet sie ebenfalls.

## Übertragene Regeln

`clientInfo.changed(level,slot)` holt den Engine-Text über `userinfoFn` und
kopiert höchstens 1.023 Bytes, bevor er validiert wird. Ein Anführungszeichen
oder Semikolon ersetzt die lokale Eingabe durch `\name\badinfo`; wie im
Original erfolgt dabei kein `trap_SetUserinfo`. Fehlende oder ungewöhnlich
angeordnete Schlüssel sind allein kein Validierungsfehler.

Die gemeinsame Schlüsselsuche ignoriert ASCII-Großschreibung, erlaubt den
fehlenden ersten Backslash und liefert bei doppelten Schlüsseln den ersten
Wert. NULL-Eingaben liefern einen leeren Wert; ein Info-String ab 8.192 Bytes
wird abgewiesen. MiniLang besitzt die Ergebnisstrings selbst, während C zwei
statische Rückgabepuffer abwechselnd verwendet. Deren Pointer-Aliasing wird
nicht nachgebildet. Eingebettete NUL-Bytes und ungültige Kopierkapazitäten
werden kontrolliert abgewiesen.

Auch `ClientSpawn` verwendet diese Suche und die ursprüngliche Bytebegrenzung
von `trap_GetUserinfo`. Damit wirkt etwa `\HANDICAP\35` wie im Original, und
ein am Pufferende abgeschnittener Zahlenwert wird erst danach ausgewertet.

Bewahrt werden die beobachtbaren Originalregeln:

- Der Name umfasst höchstens 35 Bytes. Führende Leerzeichen werden entfernt,
  höchstens drei aufeinanderfolgende Leerzeichen bleiben erhalten. Farbcodes
  zählen nicht als sichtbare Zeichen; schwarze Farbcodes werden entfernt.
  Auch ungewöhnliche Farbpaarungen folgen der originalen Bitmaske. Ein
  abschließendes `^` entfällt. Leere oder ausschließlich farbige Namen erhalten
  `UnnamedPlayer`, einschließlich der um ein weiteres Byte kürzeren
  Fallback-Kopie bei kleinen Puffern. Zuschauer im Scoreboard-Modus heißen
  unabhängig von ihrer Eingabe `scoreboard`.
- `ip=localhost` setzt den lokalen Clientstatus. Eine spätere andere Adresse
  löscht ihn im Original nicht. `cg_predictItems`, Handicap, Teamaufgabe und
  Overlay verwenden die geprüfte native `atoi`-Semantik. Handicap außerhalb
  1 bis 100 ergibt 100; Clientfeld und PlayerState werden gemeinsam geändert.
- Die Umbenennungsmeldung entsteht nur für bereits verbundene Clients und
  nach der Namensänderung, aber vor der neuen maximalen Gesundheit. Namen,
  Farbrücksetzung und Zeilenumbruch stimmen bytegenau mit C überein.
- Teamspielmodi lesen `team_model` und `team_headmodel`, andere Modi `model`
  und `headmodel`, jeweils mit höchstens 63 Bytes. Bei Bots kann Userinfo das
  angezeigte Team bestimmen; das gespeicherte Sitzungsteam bleibt dabei
  erhalten. Automatische Wahl bevorzugt das kleinere Team, bei gleicher
  Mitgliederzahl den niedrigeren Punktestand und bei vollständigem Gleichstand
  Blau. Verbindende Clients zählen bereits mit, getrennte Clients nicht.
- Fehlendes oder leeres `teamoverlay` aktiviert das Overlay; sonst entscheidet
  der Integerwert. Der Spieler-Configstring an Index `544 + slot` enthält
  Namen, Team, Modelle, Farben, Handicap, Siege, Niederlagen, Teamaufgabe und
  Leiterflag in der Originalreihenfolge. Menschen ergänzen die Teamnamen,
  Bots den Skill. Der formatierte String darf mehr als 1.023 Bytes umfassen.
  Erst nach der Configstring-Aktualisierung folgt der Game-Log-Eintrag.
  Nicht auf 0/1 normalisierte Leiterwerte aus gespeicherten Sitzungen bleiben
  im Configstring erhalten; die Connect-Suite prüft diese Fälle separat.

`teamLeader` findet das erste nicht getrennte Mitglied mit Leiterflag.
`pickTeam` verwendet die portierte `TeamCount`-Funktion. Ein ausdrücklicher
`clientUserinfoChangedFn`-Override bleibt für isolierte Tests möglich; ohne
diesen führt `votes.setLeader` die tatsächliche Verarbeitung aus.

## Nachweis

```powershell
python scripts/test_client_info.py
python scripts/test_client_info.py --case team_vote_to_actual_userinfo
```

Die Suite besteht mit **195 Szenarien**, **1.947 Aktionen**, **7.925.495 exakt
gleichen 32-Bit-Wörtern**, **722 geordneten Nebenwirkungen** und **32.887.041
Ausgabe-Bytes**. Der native x86-Host extrahiert die sechs Originalfunktionen
unverändert und führt zusätzlich echte Team-Vote-, Leiterwechsel- und
Teamstatus-Funktionen aus. Er vergleicht an jedem Host-Aufruf und nach jeder
zustandsändernden Aktion alle 117 PlayerState-Wörter je Client, die relevanten
Client-/Sitzungs-/Entity-Felder aller 64 Slots, sämtliche Spieler-Configstrings
und den Team-Vote-Zustand. Reine String-/Teamabfragen vergleichen ihre Ergebnisse.

Enthalten sind wiederholte Änderungen, Namens- und Farbgrenzen, zufällig erzeugte
Info-Strings, ASCII-Schreibweisen und Duplikate, Mehrbyte-Texte, 1.023-Byte-Kopien,
8191-Byte-Lookups, Scoreboard-Zuschauer, Bots, native Integergrenzen und Slot 63.
Die Integrationsfälle verbinden Team-Vote → Stimme → Auflösung → Leiterwechsel
mit den echten Userinfo-Aufrufen. Weitere Folgen aktivieren und deaktivieren
das Teamoverlay durch Userinfo und prüfen anschließend `CheckTeamStatus`.

**18 Laufzeitverträge** ergänzen die gültigen Vergleiche. **Zwei native
Fehlerfälle** bestätigen die Ablehnung eines 8.192-Byte-Info-Strings und eines
zu kleinen Fallback-Namenspuffers; MiniLang meldet hierfür kontrollierte Fehler.

Test-Binary: `3e73baffa57a30c23583f322db2288cca3b5d6c31a45657b61c2be0addc02afc`.
Native x86-Oracle: `3f3b09e05c46bb4d05f67cbe5f4ea6dba86a48fa2a5fe0d5e9ad388bbe31d243`.
Einzelbericht: `build/reference/client_info/result.json`.

Die Engine liefert Userinfo weiterhin über einen Callback. Serverbefehle und
Log-Nutzlasten enden an geordneten Host-Grenzen; die tatsächliche
Configstring-Speicherung ist vorhanden, ihre Netzwerkübertragung bleibt offen.
`ClientConnect` und die Sitzungs-Cvars sind separat portiert und geprüft.
[Teamwechsel und `ClientDisconnect`](TEAM_CHANGES.md) verwenden diese Abläufe
inzwischen ebenfalls. IP-Filter, Bot-Einrichtung, Follow-Befehle, Modulstart,
Client-Befehlsverteilung und Missionpack sind weitere Portschritte.
