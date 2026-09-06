# Spielmodul starten und beenden

`mq3.game.lifecycle` portiert die Baseq3-Aufrufreihenfolge von `G_InitGame`
und `G_ShutdownGame`. Die bisherigen Speicher-, Cvar-, IP-, Session-, Spawn-,
Bodyqueue-, Item- und Teamfunktionen werden tatsächlich aufgerufen.
Die formatierte Protokollausgabe läuft über [GAME_LOGGING.md](GAME_LOGGING.md).

## Modulzustand und Levelzustand

`lifecycle.attach(level, buildDate)` richtet ein frisches Spielmodul auf einer
vorhandenen Serverwelt mit Spawnzustand ein. Die Registry und Configstrings
gehören zum Engine-Host und bleiben erhalten. Das Spielmodul beginnt mit einer
leeren Cvar-VM-Tabelle und nullgesetzter Spielspeicher-Sicht, einschließlich
aller 1.024 Entities und 64 Clients. Das explizite Builddatum beschreibt das
`__DATE__` des gewählten nativen Referenzprofils.

`lifecycle.init(level, levelTime, randomSeed, restart, entityText)` führt den
originalen Ablauf aus. Die ersten drei Diagnosen sehen noch den bisherigen
Levelzustand. Erst danach werden Zufallsgenerator, Cvars, IP-Sperren und
Arena vorbereitet; anschließend wird der native Levelanteil zurückgesetzt.
Der durch die Cvar-Registrierung gesetzte `warmupModificationCount` wird dabei
wieder null. Die VM-Cvars selbst bleiben erhalten.

Die physische Entity-/Clientablage bleibt auch während dieses Resets
zugänglich. `entitiesBound` und `clientsBound` im Lifecyclezustand bilden
getrennt ab, ob die nativen Levelzeiger bereits an diese Arrays gebunden sind.
So lassen sich die ursprünglichen Zwischenzustände beobachten, ohne eigene
MiniLang-Objekte als rohe C-Adressen auszugeben.

Ein direkter weiterer `init`-Aufruf im selben lebenden Modul erhält IP-Tabelle,
Arena-Bytes, Shader-Remaps, Todesanimationsindex, Waffenstatik und den statischen
Passwortzähler. Der Allokationszeiger wird zurückgesetzt, der RNG neu gesetzt.
Teamstatik wird erst bei der bedingten Teaminitialisierung zurückgesetzt.

Ein echtes Engine-`map_restart` umfasst dagegen `VM_Restart`: Die native DLL
wird neu geladen beziehungsweise der QVM-Datenbereich erneut initialisiert.
Dafür ist eine frische Modulinstanz erforderlich. Das `restart`-Argument allein
löscht keine Modulstatik. Vollständiges Engine-VM-Neuladen und Kartenwechsel
sind weiterhin eigene Integrationsschritte.

## Reihenfolge beim Start

1. Initialisierungsdiagnosen und Zufallsseed.
2. Cvar-Registrierung, Verarbeitung der gespeicherten IP-Sperren und Arena-Rewind.
3. Levelanteil nullen; `time` und `startTime` setzen.
4. Fry-Sound registrieren, gegebenenfalls Logdatei öffnen und Init-Zeilen schreiben.
5. Welt-Session initialisieren, noch vor dem Löschen der alten Entity-/Clientinhalte.
6. Entities nullen und binden, Clientlimit übernehmen, Clients nullen und binden.
7. Die ersten `maxclients` Entities an ihre Clients binden; 64 Plätze reservieren
   und `LocateGameData` ausführen.
8. Acht Bodyqueue-Entities anlegen, Startwaffen registrieren und Map-Entities parsen.
9. Entity-Teams verketten, gegebenenfalls CTF-/Team-Items prüfen und `CS_ITEMS` veröffentlichen.
10. Einzelspieler-/Buildscript-Ressourcen registrieren und gegebenenfalls die
    drei Bot-Initialisierungsschnittstellen in Originalreihenfolge aufrufen.

Entity- und Clientobjekte behalten ihre äußere Identität. EntityState und
Untervektoren sind eigene MiniLang-Werte; beliebige Aliase auf C-Unterzeiger
werden damit nicht zugesichert. Räumliche Spiel-Entity-Felder werden null,
separate Serversektoren und PVS-Metadaten bleiben Enginezustand.

Die Bodyqueue hat acht feste Plätze. `InitBodyQue` ersetzt einen Pointer erst
nach der jeweiligen Allokation und den Entity-Zuweisungen. Bei einem erneuten
Aufruf bleiben die übrigen alten Pointer bis zu ihrer Ersetzung sichtbar.
Fehlende oder unbekannte Spawn-Klassennamen liefern die ursprüngliche Diagnose
vor der anschließenden Freigabe; dies wird mit den Zuständen an beiden
Hostaufrufen verglichen.

## Engine-Schnittstellen

`attach` liefert den Lifecyclezustand mit folgenden Bindungen zurück:

| Bindung | Aufruf und Ergebnis |
|---|---|
| `openLogFn` | `(level, name, mode)` liefert den nativen Integerhandle; Modi 2/3 entsprechen Append/Append-Sync |
| `closeLogFn` | `(level, handle)` schließt die Logdatei |
| `serverInfoFn` | `(level, capacity)` liefert den Serverinfo-String |
| `locateFn` | `(level, numEntities)` meldet die aktuelle Spielablage, auch bei zusätzlicher Entity-Allokation |
| `botSetupFn`, `botLoadMapFn`, `initBotsFn` | jeweils `(level, restart)` |
| `botShutdownFn` | `(level, restart)` |

`level.gamePrintFn` liefert Konsolentext aus; `level.logWriteFn` erhält
`(level, bytes, handle)`. `level.gameLogFn` wird an den echten Logger gebunden.
Die optionalen `cvarEffectFn`, `spawnEffectFn`, `entityObserveFn` und
`integerQueryFn` im Lifecyclezustand erlauben die Beobachtung der vorhandenen
Cvar-/Configstring-/Serveroperationen. Die internen Weiterleitungen für
Logausgaben und `LocateGameData` bleiben dabei aktiv.

Ein benötigter, nicht gebundener Hostaufruf erzeugt einen ausdrücklichen Fehler.
Die Engine-Abfragen von `com_buildScript` und `bot_enable` lesen die tatsächliche
Registry. Ein Einzelspielermodus überspringt die Buildscript-Abfrage wie im Original.

## Shutdown und Grenzen

`lifecycle.shutdown(level, restart)` gibt die Shutdown-Diagnose aus, schreibt
gegebenenfalls zwei Logzeilen und schließt den Handle. Danach werden die
Welt-Session und ausschließlich vollständig verbundene Clients gespeichert.
Die aktuelle Engine-Einstellung `bot_enable` entscheidet über `BotAIShutdown`.
Der gespeicherte Loghandle wird durch diese Funktion nicht auf null gesetzt;
auch Level, Arena und Modulstatik bleiben wie im Original erhalten.

Zeit, Seed, Restartargument und Dateihandle verwenden den nativen signed-32-Bit-
Bereich. Clientlimits außerhalb 0 bis 64 werden vor ungültigen Arrayzugriffen
zurückgewiesen. Der Entitytext wird als String mit C-Parser-Semantik verarbeitet,
einschließlich NUL-Terminierung. Überlange ursprüngliche Diagnose-/Logpuffer
haben gesonderte MiniLang-Verträge. Bei erreichtem Init-Log sind höchstens
1.005 Serverinfo-Bytes im definierten Originalbereich: Der feste Payload
`"InitGame: "` und der Zeilenumbruch benötigen zusammen elf weitere Bytes.
Die 1.024-Byte-Serverinfo-Kapazität hebt die kleinere Loggergrenze nicht auf.

Die bereits dokumentierte undefinierte erste CTF-Statusausgabe wird einzeln
normalisiert und mit den rohen Originalbytes archiviert. Daraus wird keine
exakte Parität für undefinierten C-Speicher abgeleitet.

Der Port enthält damit die Spielmodul-Orchestrierung. Betriebssystem-Dateidienste,
Bot-KI, vollständige Engine-Kartenwechsel und die noch fehlenden Spawn-Klassen
bleiben gesonderte Aufgaben. Bekannte, noch nicht portierte Spawn-Klassen
erzeugen im normalen Port einen Fehler; ein ausdrücklich gesetzter
Vergleichs-Callback ist keine Implementierung dieser Klasse. Unbekannte oder
fehlende Klassennamen werden dagegen wie im Original diagnostiziert und
anschließend durch den Aufrufer freigegeben.

## Prüfung

Die native Vergleichsreferenz führt die unveränderten Originalkörper aus und
beobachtet Zustand und geordnete Hosteffekte. Die eigenständige Loggerprüfung
und die gezielten Reset-Verträge ergänzen den vollständigen Lifecyclevergleich.
Die Lifecycle-Referenzfälle vergleichen definierte erfolgreiche Abläufe,
einschließlich fehlgeschlagener Dateieröffnung. Fehlende Hostbindungen und
ursprüngliche Speicherüberläufe werden ausschließlich als gesonderte
MiniLang-Verträge geprüft; dafür wird keine identische native Fehlerdiagnose
behauptet.

```powershell
python scripts/test_game_logging.py
python scripts/test_game_lifecycle.py
```

Der vollständige Lifecycle-Vergleich besteht mit **95 Szenarien**,
**371 Aktionen**, **378.489.370 exakt gleichen 32-Bit-Wörtern**,
**10.053 geordneten Effekten** und **110 Laufzeit-/Reset-Verträgen**.
Wort- und Effektzahlen werden auch unabhängig aus dem nativen Stream gezählt.
Zehn erste CTF-Statusbytes liegen außerhalb der definierten Originaltabelle;
nur diese Stellen werden normalisiert und mit den rohen Bytes archiviert.

Die Snapshots enthalten alle 64 Clients, sämtliche belegten Entities mit
mindestens Slots 0 bis 127 sowie 1022/1023, Engine- und VM-Cvars,
1.024 Configstrings, IP-Puffer und Filtertabelle, Item-/Team-/Shader-/Waffenstatik,
Serversektoren/PVS sowie alle Arena-Bytes bis zum höchsten beobachteten
Allokationsstand. Eigenständige Reset-Verträge prüfen zusätzlich Arrayidentität,
ausgewählte äußere Objektidentitäten und Grenzbereiche: Entity-Slots
0/63/64/1022/1023 sowie Client-Slots 0/63. Die Reset-Implementierung durchläuft
alle 1.024 Entities und 64 Clients; die Identitätsverträge sind eine gezielte
Auswahl und keine Prüfung jedes einzelnen Unterobjekts.

Ein vollständiger Neubuild schreibt `build/reference/game_lifecycle/result.json`.
Teil- und Wiederverwendungsläufe überschreiben diesen Bericht nicht.
285 gespeicherte Szenarioartefakte enthalten Eingaben, Referenzzustände und
rohe CTF-Daten. Quellen und erzeugte Programme werden vor und nach dem Lauf
per Hash an den Nachweis gebunden.

Test-Binary: `b164617046dfaef7c552579f272ca3d59ab5b8094cd67cd053d35e165a38ec3f`.
Native x86-Oracle: `2cc10cbf9091f16d57da37d4d6bc08ab3275bfd224a7cd1a36d9af1abf133992`.
Die separate Loggerprüfung ist in [GAME_LOGGING.md](GAME_LOGGING.md) dokumentiert.
