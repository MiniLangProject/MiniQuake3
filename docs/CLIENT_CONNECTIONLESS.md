# Client-Connectionless und Resend

`src/mq3/client/connectionless.ml` portiert den eingehenden OOB-Dispatcher aus
`client/cl_main.c`. `challengeResponse` übernimmt Challenge und Proxyadresse,
setzt den Zustand auf `CA_CHALLENGING` und erzwingt einen sofortigen nächsten
Connectversuch. `connectResponse` akzeptiert nur den passenden Zustand und die
gleiche Basisadresse, richtet anschließend den Client-Netchan mit dem qport ein
und setzt `CA_CONNECTED`.

Info- und Statusantworten besitzen explizite Browser-Callbacks. Print speichert
die Servermeldung und reicht sie an den Ausgabedienst weiter. Ein OOB-Disconnect
wird erst ab `CA_AUTHORIZING`, nur von der vollständigen Serveradresse und nur
nach drei Sekunden ohne sequenziertes Paket akzeptiert. Echo, MOTD,
Serverlisten und Diagnostik sind ebenfalls als Hostdienste modelliert.

`checkForResend` bildet `CL_CheckForResend` ab. Demo-Wiedergabe, falsche Zustände
und das 3000-ms-Fenster verhindern den Versand. Im Connecting-Zustand wird bei
nicht lokalen Adressen zuerst die Autorisierung angestoßen und danach
`getchallenge` gesendet. Im Challenging-Zustand entstehen Protocol 68, qport und
Challenge über die geprüfte Info-String-Implementierung; der Datendienst erhält
exakt `connect "<userinfo>"`. Danach löscht ein Callback das Userinfo-Änderungsflag.

`scripts/test_client_connectionless.py` extrahiert `CL_CheckForResend`,
`CL_DisconnectPacket` und `CL_ConnectionlessPacket` unverändert. 17 direkte
Datensätze vergleichen Zustände, Adressen, qport, Meldungen, Callback-Reihenfolge
und die vollständige Connect-Nutzlast. 27 MiniLang-Verträge ergänzen ungültige
Zustände, Adress- und Zeitgrenzen sowie die wesentlichen Dispatchpfade. UDP,
Browserdatenhaltung, MOTD-Policy und das Parsen großer Serverlisten bleiben
Host- beziehungsweise Folgeblöcke.
