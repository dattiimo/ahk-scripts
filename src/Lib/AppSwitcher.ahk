;; Hotkeys to switch between app windows
;;
;; | Shortcut      | Summary                             |
;; | ------------- | ----------------------------------- |
;; | Right Alt + N | Switch between Notepad windows      |
;; | Right Alt + C | Switch between VS Code windows      |
;; | --------------| ----------------------------------- |


; TODO: Update to v2
;#Requires AutoHotkey v2.0

; Run as a single instance. Reload automatically without prompt if second instance started.
#SingleInstance Force

;AppSwitcher_IsRegistered := 0
RegisterAppSwitcherGroups()


; Register the app groups that are available to switch to.
; This allows instances of app windows to be itererated through.
RegisterAppSwitcherGroups() {
    ; Usage: GroupAdd, {title}, {identifier}
    ; Example: 
    GroupAdd, Notepad, ahk_exe notepad.exe ; Notepad
    GroupAdd, VsCode, ahk_exe Code.exe ; Visual Studio Code
}


; If a window group exists matching the given title then iterate through the window group
; in the order of the most recently active first.
; If no match, then run the app at the given file path.
ActivateAppGroup(groupTitle, filePath := "", args := "") {
    selector := "ahk_group " . groupTitle
    if WinExist(selector) {
        GroupActivate, %groupTitle%, R ; R to get most recent first
    }
    else {
        Run, %filePath%, %args%
    }
}


; List the shortcuts below by using ActivateAppGroup
; {hotkey}:: ActivateAppGroup("{group title}, {path to launch app if not running}")
; Example:
RAlt & n:: ActivateAppGroup("Notepad", AppDataLocal . "c:\Windows\System32\notepad.exe")
RAlt & c:: ActivateAppGroup("VsCode", "C:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe")
