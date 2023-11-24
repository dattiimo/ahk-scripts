;; Combine all scripts into a single script that can be run on start up
;; Setup:
;; Create a shortcut to this script in %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\
;; The shortcut target should use UIA
;; Example
;; "C:\Program Files\AutoHotkey\AutoHotkeyU64_UIA.exe" "%USERPROFILE%\Git\ahk-scripts\Startup.ahk"

; TODO: Update to v2
;#Requires AutoHotkey v2.0

; Run as a single instance. Reload automatically without prompt if second instance started.
#SingleInstance Force ; 

; EditingKeys changes the taskbar icon depending on the mode, by default we want to show the standard icon when script runs
SetEditingKeysMode(false)

; ApSwitcher needs it's app groups registered because when the file is included it will not be auto-exeecuted
RegisterAppSwitcherGroups()


; Include all scripts into a single script
#Include %A_ScriptDir%\Lib\KeyMappings.ahk
#Include %A_ScriptDir%\Lib\PasteWithoutFormatting.ahk
#Include %A_ScriptDir%\Lib\WindowsManagement.ahk
#Include %A_ScriptDir%\Lib\AppOpener.ahk
#Include %A_ScriptDir%\Lib\AppSwitcher.ahk
#Include %A_ScriptDir%\Lib\DynamicShortcuts.ahk
#Include %A_ScriptDir%\Lib\EditingKeys.ahk
