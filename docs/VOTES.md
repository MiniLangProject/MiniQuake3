# Abstimmungen und Teamleiter

Stand: 2026-09-05. `src/mq3/game/votes.ml` portiert die unveränderten Baseq3-Regeln
von `CheckVote`, `CheckTeamVote`, `PrintTeam`, `SetLeader` und `CheckTeamLeader`
aus `g_main.c`. Globale und rote/blaue Team-Abstimmungen laufen in `G_RunFrame`
an ihren ursprünglichen Positionen nach dem Teamstatus und vor `CheckCvars`.

Globale Votes planen einen angenommenen Befehl für 3.000 ms später ein. Die
Ausführung erfolgt erst bei strikt größerer Levelzeit, auch wenn inzwischen eine
weitere Abstimmung läuft. Team-Votes führen den Befehl sofort aus oder rufen den
portierten Teamleiterwechsel auf. Die drei Vote-Configstrings werden zum
ursprünglichen Zeitpunkt geleert.

Bewahrt werden die beobachtbaren Besonderheiten des Originals:

- Ja braucht mehr als die ganzzahlige Hälfte; Nein braucht mindestens diese
  Hälfte. Bei ungeraden Spielerzahlen und bei null Stimmberechtigten ist dieser
  Unterschied sichtbar. Nach 30.000 ms hat der Timeout Vorrang vor einer Mehrheit.
- Team-Vote-Ergebnisse gehen an Empfänger `-1`. `PrintTeam` richtet dagegen jede
  Meldung an die einzelnen Teamslots und filtert dabei keine getrennten Clients.
- Ein Teamleiterwechsel meldet alte Leiter erst ab, aktualisiert danach den
  gewählten Leiter und sendet anschließend die Teamnachricht. Ein inzwischen
  getrennter oder zum anderen Team gewechselter Kandidat beendet trotzdem den
  bereits angenommenen Vote, mit der ursprünglichen Fehlermeldung.
- Der `leader`-Präfix ist groß-/kleinschreibungsabhängig; die Kandidatennummer
  wird ab Byte 7 mit der ursprünglichen CRT-`atoi`-Semantik gelesen.
- `CheckTeamLeader` führt beide ursprünglichen Suchschleifen aus. Steht ein Bot
  vor dem ersten menschlichen Mitglied, können beide Leiter werden. Diese
  automatische Wahl ruft im Original keine Userinfo-Aktualisierung auf.
- Zeitdifferenzen und die Ausführungszeit verwenden das geprüfte native
  32-Bit-Profil einschließlich Überlauf und der Bedeutung von Zeitwert null.

`scripts/test_votes.py` prüft **211 Szenarien**, **241 Aktionen**, **85.655 exakt
gleiche 32-Bit-Wörter** und **456 geordnete Nebenwirkungen** in **363.153 Bytes**.
Der Referenzhost extrahiert die fünf Funktionskörper unverändert. Er zeichnet
Konsolen-/Serverbefehle, Configstrings und `ClientUserinfoChanged` auf. Vor
Server-/Konsolenbefehlen und Userinfo-Aufrufen werden auch die aktuellen
Vote-Zeiten verglichen; nach jeder Aktion folgen sämtliche Vote-Felder,
Configstrings und Team-/Verbindungs-/Leiterdaten aller 64 Clients.

Die Fälle enthalten 168 Mehrheitskombinationen für globale und beide Team-Votes,
Timeout-/Ausführungsgrenzen, verkettete Frames, native Integergrenzen,
1.023-Byte-Befehle, Kandidatenfehler, Clientlimit und Slot 63. Elf ergänzende
Laufzeitverträge prüfen unter anderem Pflichtschnittstellen und unabhängige
Zustandsarrays. Ungültige Kandidaten außerhalb der 64 Slots, überlange oder
eingebettete NUL enthaltende Befehle sowie ein `leader`-Text ohne Byte 7 werden
kontrolliert abgewiesen. Unsichtbare Restbytes hinter einem C-String werden
nicht als MiniLang-Stringzustand modelliert.

Die Frame-Fälle führen inzwischen auch den portierten Teamstatus und
`CheckCvars` aus. Ihre früheren Testmarker entfallen; die tatsächliche
`g_needpass`-Ausgabe wird verglichen. Dadurch ändern sich Wort-/Effektzahlen
bei unverändertem Vote-Szenarienumfang.

Test-Binary: `e843177bc0b988930e7014c71f6872507b78d63321d34eaf667d80cde9b6ea4e`.
Native x86-Oracle: `81051414985a5ee1c7acb8e74363e3d3f5e3c19cdd922e95cc9b649fd2fd5a32`.

```powershell
python scripts/test_votes.py
python scripts/test_votes.py --case frame_votes_and_delayed_command
```

`ClientUserinfoChanged`, Server- und Konsolenbefehle enden an expliziten
Host-Schnittstellen. Die Engine führt die im Test beobachteten Befehle nicht aus.
Das Starten und Befüllen von Votes über `Cmd_CallVote_f`, `Cmd_Vote_f` sowie die
Team-Pendants und die vollständige Userinfo-/Sitzungslogik sind noch offen.
`CheckTeamLeader` ist für diese späteren Teamwechsel bereits geprüft; im
Frame erfolgt wie im Original ausschließlich die Vote-Auflösung.
