# OOB-Challenge und Direct Connect

`src/mq3/server/oob_connect.ml` portiert den serverseitigen Kern von
`SV_GetChallenge` und `SV_DirectConnect`. Der Port verwaltet den 1.024 Einträge
großen Challenge-Ring, verwendet den ältesten freien Eintrag, sendet LAN- und
Timeout-Challenges direkt und übergibt externe Autorisierung an einen Hostdienst.

Direct Connect prüft Protokoll 68, Reconnect-Sperre, Adresse, Challenge und Ping.
Es wählt öffentliche oder passwortgeschützte Slots, verwendet passende bestehende
Slots erneut und kann bei lokalem Vollserver den letzten reinen Bot-Slot ersetzen.
Game-VM-Aufnahme, OOB-Senden, Autorisierung und Netzadressklassifikation bleiben
benannte Hostgrenzen. 13 direkte Datensätze führen die unveränderten Baseq3-Körper
aus; 26 MiniLang-Verträge prüfen zusätzlich Ring-, Ping-, Slot- und Fehlergrenzen.
