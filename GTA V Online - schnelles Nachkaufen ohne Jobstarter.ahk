#SingleInstance, force
 
  ;1000=1sec
  zeit = 500
  warten = 2000
 
  Menu, Tray, Icon, C:\GIT\cnRED.ICO
 
  ; Das GUI
  ok:
  Gui, Destroy
  Gui, Add, Button, x12 y9 w150 h50 gschnellNachkaufenGUI, schnelles Nachkaufen ohne CEO
  Gui, Add, Button, x12 y59 w150 h50 gschnellNachkaufenGUII, schnelles Nachkaufen mit CEO
  ; Generated using SmartGUI Creator for SciTE
  Gui, Add, Button, x12 y109 w150 h50 ginfo, Info
  Gui, Show, w174 h168, Untitled GUI
  return
 
  ; Kauft alle wichtige Waffen nach ohne CEO
  schnellNachkaufenGUI:
  Sleep, warten
  ; hier muss schnell das GTA-Fenster angeklickt werden.
  goto nachKaufenOhneCEO
  return
 
  ; Kauft alle wichtige Waffen nach mit CEO
  schnellNachkaufenGUII:
  Sleep, warten
  ; hier muss schnell das GTA-Fenster angeklickt werden.
  goto nachKaufenMitCEO
  return
 
  ; zeigt Informationen an
  info:
  Gui, Destroy
  Gui, Add, Button, x12 y260 w520 h30 gok, OK
  Gui, Add, Text, x12 y9 w520 h260 , Informationen
  Gui, Add, Text, x372 y39 w0 h0 , Text
  Gui, Add, ListBox, x12 y39 w520 h220 , Faust muss ausgewählt sein, so wie die folgenden Waffen im Besitz | |-Waffenliste | Granatwerfer | Lenkrakete | Minigun | Panzerfaust | Granatwerfer | Scharfschützenmunition | | Tastenkombinationen: | Strg + ä: nachkaufen ohne CEO | Strg + ö: nachkaufen mit CEO | | Programmiert von Christian Nicolai | | Fragen: givq2r0ie@relay.firefox.com
  Gui, Add, Button, x12 y290 w520 h30 gspenden, Spenden?: Meine XMR-Adresse in die Zwischenablage kopieren
  Gui, Show, w550 h332, Untitled GUI
  return
 
  ; Kauft einige wichtige Waffen auf Knopfdruck
  schnellNachladenAufKnopfdruck:
  ä::
  Goto nachKaufenOhneCEO
  #::
  Goto nachKaufenMitCEO
  return
 
  ; ohne CEO
  nachKaufenOhneCEO:
  Send, m
  Sleep, zeit
Loop, 2 {
      Send, {Down}
      Sleep, zeit
  }
  Goto nachKaufen
  return
 
  ;bis dort hin funktioniert es
 
  ; mitCeo
  nachKaufenMitCEO:
  Send, m
  Sleep, zeit
  Goto dreiMalRunter
  Goto nachKaufen
  return
 
  ; ohne Geld geht nichts
  spenden:
  Gui, Destroy
  clipboard := "43otjviREvF9Xs7GsyiQjeJx2cYUM8U2YGW8vM4ppCt6eJpKtbyDYr2Fx25ddKuK6bZxiTT7jAgJZHw4Xheq4VyAEs85VSM"
  Gui, Add, Button, x12 y40 w520 h30 gok, OK
  Gui, Add, Text, x12 y9 w520 h30 , siehe Zwischenablage. DANKE!
  Gui, Show, w550 h80, Untitled GUI
 
  nachKaufen:
  ; nach Munition gehen
Loop, 2 {
      Send, {Enter}
      Sleep, zeit
      goto dreiMalRunter
  }
  ; jetzt Pistole
  Goto nachLinks
  ; Granatwerfer einmal Handmännisch
  Goto hoch
  Goto enter
  Goto schwereWaffen
  ; alle Schwerewaffen haben Muni bekommen
  Goto runter
Loop, 2 {
      goto nachLinks
  }
  ; Pistole
  goto hoch
  goto enter
  goto runter
  goto nachLinks
  ; Scharfschützenmunition
  goto hoch
  goto enter
Loop, 3 {
      Send, {Esc}
      Sleep, zeit
  }
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
 
  ; zwei mal nach Links
  nachLinks:
  Send, {Left}
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
  goto zweiMalHoch
  goto nachLinks
  goto zweiMalHoch
  goto enter
  }
  return
 
  GuiClose:
  ExitApp