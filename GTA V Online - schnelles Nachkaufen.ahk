#SingleInstance, force

;1000=1sec
zeit = 5
warten = 2000
menuZeit = 5
differenz = 5
jenterPause = 500

; Das GUI
ok:
Gui, Destroy
; schnelles Nachladen
Gui, Add, Button, x12 y9 w150 h50 gschnellNachkaufenGUI, schnelles Nachkaufen ohne CEO
Gui, Add, Button, x12 y59 w150 h50 gschnellNachkaufenGUII, schnelles Nachkaufen mit CEO
; Generated using SmartGUI Creator for SciTE
Gui, Add, Button, x12 y109 w150 h50 ginfo, Info
; schneller Jobstart
Gui, Add, Button, x162 y9 w150 h50 gjobBaseGUI, schneller Jobstart bei der Milit�r-Basis
Gui, Add, Button, x162 y59 w150 h50 gjobCasinoGUI, schneller Jobstart beim Casino
Gui, Show, w324 h168, GTA V schnelles Nachkaufen GUI
return

;schneller Job-Start bei der Milit�r Basis
jobBaseGUI:
Sleep, warten
gosub jobBase
return

jobBaseKnopf:
^+�::
gosub jobBase
return

;schneller Job-Start beim Casino
jobCasinoGUI:
^+�::
Sleep, warten
gosub jobCasino
return

jobCasinoKnopf:
^::
gosub jobCasino
return

; Die in den Job-Men� l�sst
jobs:
Send, {Esc}
Sleep, menuZeit
gosub rechts
Sleep, jenterPause
gosub jenter
gosub jenter
gosub jrunter
gosub jenter
;jetzt unterscheiden sich die Base und Casino Jobs
return

; Der Casino-Job im Job-Men�
jobCasino:
gosub jobs
Loop, 3 {
	gosub jrunter
}
gosub jenter
Loop, 14 {
	gosub jrunter
}
gosub jenter
gosub jenter
return

; Der Basis-Job im Job-Men�
jobBase:
gosub jobs
Loop, 2 {
	gosub jhoch
}
gosub jenter
Loop, 3 {
	gosub jhoch
}
gosub jenter
Loop, 2 {
	gosub jrunter
}
gosub jenter
gosub jenter
return

; Kauft alle wichtige Waffen nach ohne CEO
schnellNachkaufenGUI:
Sleep, warten
; hier muss schnell das GTA-Fenster angeklickt werden.
gosub nachKaufenOhneCEO
return

; Kauft alle wichtige Waffen nach mit CEO
schnellNachkaufenGUII:
Sleep, warten
; hier muss schnell das GTA-Fenster angeklickt werden.
gosub nachKaufenMitCEO
return

; zeigt Informationen an
info:
Gui, Destroy
Gui, Add, Button, x12 y260 w520 h30 gok, OK
Gui, Add, Text, x12 y9 w520 h260 , Informationen
Gui, Add, Text, x372 y39 w0 h0 , Text
Gui, Add, ListBox, x12 y39 w520 h220 , Faust muss ausgew�hlt sein und die folgenden Waffen m�ssen im Besitz sein | |-Waffenliste | Granatwerfer | Lenkrakete | Minigun | Panzerfaust | Granatwerfer | Scharfsch�tzenmunition | | Tastenkombinationen: | Strg + �: nachkaufen ohne CEO | Strg + �: nachkaufen mit CEO | (noch etwas verbugt;) | Strg+Shift+�: Startet den Job beim Casino | Strg+Shift+�: Startet den Job bei der Milit�r-Base | | Falls ihr die Jobs sofort abbricht, k�nnt ihr euch dorthin teleportieren. | | Programmiert von Cannachris | | Fragen: givq2r0ie@relay.firefox.com
Gui, Add, Button, x12 y290 w520 h30 gspenden, Spenden?: Meine XMR-Adresse in die Zwischenablage kopieren
Gui, Show, w550 h332, Informationen GUI
return

; Kauft einige wichtige Waffen auf Knopfdruck
schnellNachladenAufKnopfdruckOhneCEO:
^�::
gosub nachKaufenOhneCEO
return

schnellNachladenAufKnopfDruckMitCEO:
^�::
gosub nachKaufenMitCEO
return

; ohne CEO
nachKaufenOhneCEO:
Send, m 
Sleep, zeit
Loop, 2 {
	Send, {Down}
	Sleep, zeit
}
gosub nachKaufen
return

;bis dort hin funktioniert es

; mitCeo
nachKaufenMitCEO:
Send, m
Sleep, zeit
Gosub dreiMalRunter
gosub nachKaufen
return

; ohne Geld geht nichts
spenden:
Gui, Destroy
clipboard := "43otjviREvF9Xs7GsyiQjeJx2cYUM8U2YGW8vM4ppCt6eJpKtbyDYr2Fx25ddKuK6bZxiTT7jAgJZHw4Xheq4VyAEs85VSM"
Gui, Add, Button, x12 y40 w520 h30 gok, OK
Gui, Add, Text, x12 y9 w520 h30 , Sie finden meine Monero-Adresse in der Zwischenablage. DANKE!
Gui, Show, w550 h80, Spenden GUI

nachKaufen:
; nach Munition gehen

gosub enter
gosub dreiMalRunter
gosub enter
gosub hoch
gosub enter
gosub runter
; jetzt Pistole
gosub links
; Granatwerfer einmal Handm�nnisch
gosub hoch
gosub enter
gosub schwereWaffen
; alle Schwerewaffen haben Muni bekommen
gosub runter
Loop, 2 {
	gosub links
}
; Pistole
gosub hoch
gosub enter
gosub runter
gosub links
; Scharfsch�tzenmunition
gosub hoch
gosub enter
Loop, 3 {
	Send, {Esc}
	Sleep, zeit
}
return

; Job Hoch
jhoch:
gosub hoch
Sleep, differenz
return

; Job Runter
jrunter:
gosub runter
Sleep, differenz
return

;Job Enter
jenter:
gosub enter
Sleep, jenterPause
return

; hoch
hoch:
Send, {Up}
Sleep, zeit
return

; runter
runter:
Send, {Down}
Sleep, zeit
return

; einfach nur enter
enter:
Send, {Enter}
Sleep, zeit
return

; nach Links
links:
Send, {Left}
Sleep, zeit
return

; nach rechts
rechts:
Send, {Right}
Sleep, zeit
return

; zwei mal Hoch
zweiMalHoch:
Loop, 2 {
	Send, {Up}
	Sleep, zeit
}
return

; ja, drei mal runter
dreiMalRunter:
Loop, 3 {
	Send, {Down}
	Sleep, zeit
}
return

; hier werden die schwere Waffen nach gekauft
schwereWaffen:
Loop, 3 {
gosub zweiMalHoch
gosub links
gosub zweiMalHoch
gosub enter
}
return

GuiClose:
ExitApp