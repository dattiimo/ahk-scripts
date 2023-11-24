;; Asign the shortcut RAlt + num to activate the current window
;; To set a shortcut: Hold RAlt, Shift and a number
;; To activate the window: Hold RAlt and a number
;;
;; | Shortcut      | Summary                                 |
;; | ------------- | --------------------------------------- |
;; | Right {0...9}           | Switch to the assigned window |
;; | Right Alt, Shit {0...9} | Assign the current window     |
;; | --------------| --------------------------------------- |


; TODO: Update to v2
;#Requires AutoHotkey v2.0

; Run as a single instance. Reload automatically without prompt if second instance started.
#SingleInstance Force 

DynamicShortcut0 = ""
DynamicShortcut1 = ""
DynamicShortcut2 = ""
DynamicShortcut3 = ""
DynamicShortcut4 = ""
DynamicShortcut5 = ""
DynamicShortcut6 = ""
DynamicShortcut7 = ""
DynamicShortcut8 = ""
DynamicShortcut9 = ""

; Set a dynamic shortcut 
SetDynamicShortcut(sc) {
    active_id = 
    WinGet, active_id, ID, A
    DynamicShortcut%sc% := active_id
}

; Activate a dynamic shortcut
ActivateDynamicShortcut(sc) {
    ; TODO: Check the shortcut is set and warn if not
    val := DynamicShortcut%sc%
    WinActivate "ahk_id %val%"
}

; Set the current window as the active shortcut for the given number
; RAlt, Shift + 0...9
<^>!+0::SetDynamicShortcut(0)
<^>!+1::SetDynamicShortcut(1)
<^>!+2::SetDynamicShortcut(2)
<^>!+3::SetDynamicShortcut(3)
<^>!+4::SetDynamicShortcut(4)
<^>!+5::SetDynamicShortcut(5)
<^>!+6::SetDynamicShortcut(6)
<^>!+7::SetDynamicShortcut(7)
<^>!+8::SetDynamicShortcut(8)
<^>!+9::SetDynamicShortcut(9)

; Set the active window
; RAlt + 0.Dynamic..9
<^>!0::ActivateDynamicShortcut(0)
<^>!1::ActivateDynamicShortcut(1)
<^>!2::ActivateDynamicShortcut(2)
<^>!3::ActivateDynamicShortcut(3)
<^>!4::ActivateDynamicShortcut(4)
<^>!5::ActivateDynamicShortcut(5)
<^>!6::ActivateDynamicShortcut(6)
<^>!7::ActivateDynamicShortcut(7)
<^>!8::ActivateDynamicShortcut(8)
<^>!9::ActivateDynamicShortcut(9)
