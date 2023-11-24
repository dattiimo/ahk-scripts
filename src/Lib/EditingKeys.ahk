;; Switches the keyboard to an editor layout
;; Toggled by hotkey Alt Gr
;;
;; When in editor mode:
;;
;; | Shortcut   | Summary       |
;; | ---------- | ------------- |
;; | H          | Left          |
;; | J          | Down          |
;; | K          | Up            |
;; | L          | Right         |
;; | M          | Page Down     |
;; | ,          | Page Up       |
;; | U          | Home          |
;; | I          | End           |
;; | Space      | Return        |
;; | D          | Delete        |
;; | ---------- | ------------- |


; TODO: Update to v2
;#Requires AutoHotkey v2.0

; Run as a single instance. Reload automatically without prompt if second instance started.
#SingleInstance Force

EditingKeys_Mode := 0 ; default is normal
global EditingKeys_IsFirstWarning := true


; Hide the tray tip
;[Source](https://www.autohotkey.com/docs/v1/lib/TrayTip.htm)
HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        ;Menu Tray, NoIcon
        ;Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}


; Audio and visual warning to signal when an invalid key is used in editor mode
WarnEditingKeysEnabled() {
    if EditingKeys_IsFirstWarning
    {
        SoundBeep
        TrayTip Navigation Mode Enabled, Press AltGr to switch off, Iconx
        Sleep 3000   ; Let it display for 3 seconds.
        HideTrayTip()
        global EditingKeys_IsFirstWarning := false
    }
    
}

; Set the Auto Hotkey script task bar icon.
; Used as a visual indication that editor mode is enabled
SetEditingKeysMode(showEditorMode) {
    pathToNavIcon := A_ScriptDir . "\EditingKeys-Navigation.ico"
    pathToStandardIcon := A_ScriptDir . "\EditingKeys-Standard.ico"

    if (showEditorMode = True) {
        Menu, Tray, Icon, %pathToNavIcon% ; set the tray icon
    }
    else {
        Menu, Tray, Icon, %pathToStandardIcon% ; set the tray icon
    }

    global EditingKeys_IsFirstWarning := true ; reset toggle to enable showing a warning again
}

; hotkey to toggle mode is the right alt key (Alt Gr)
RAlt::
    EditingKeys_Mode:= !EditingKeys_Mode ;toggle the mode
    SetEditingKeysMode(EditingKeys_Mode)
return

; Navigation hotkeys, these are only enabled if `mode` is TRUE
#If EditingKeys_Mode 
    q::WarnEditingKeysEnabled()
    w::WarnEditingKeysEnabled()
    e::WarnEditingKeysEnabled()
    r::WarnEditingKeysEnabled()
    t::WarnEditingKeysEnabled()
    y::WarnEditingKeysEnabled()
    u::Home
    i::End
    o::WarnEditingKeysEnabled()
    p::WarnEditingKeysEnabled()

    a::WarnEditingKeysEnabled()
    s::WarnEditingKeysEnabled()
    d::WarnEditingKeysEnabled()
    ^d::
        Send {Delete}
    Return
    f::WarnEditingKeysEnabled()
    g::WarnEditingKeysEnabled()
    h::Left
    j::Down
    k::Up
    l::Right

    z::WarnEditingKeysEnabled()
    x::WarnEditingKeysEnabled()
    c::WarnEditingKeysEnabled()
    v::WarnEditingKeysEnabled()
    b::WarnEditingKeysEnabled()
    n::WarnEditingKeysEnabled()
    m::PgDn
    ,::PgUp

    Space::Enter
    +Space::Space
#If
