;; Hotkeys to open new app instances
;;
;; | Shortcut          | Summary                                   |
;; | ----------------- | ----------------------------------------- |
;; | Right Alt + F1    | Open new browser with Work profile        |
;; | Right Alt + F2    | Open new browser with Default profile     |
;; | Right Alt + F3    | Open new browser with Private profile     |
;; | Right Alt + F4    | Open new browser with alternative profile |
;; | ----------------- | ----------------------------------------- |


; TODO: Update to v2
;#Requires AutoHotkey v2.0

; Run as a single instance. Reload automatically without prompt if second instance started.
#SingleInstance Force

;; Open new browser window with the given profile
;; Pass maximise arguments whenever possible in an attempt to get the browser to launch maximised
OpenBrowserWithProfile(profile) {
    path := A_ProgramFiles . " (x86)" . "\Microsoft\Edge\Application\msedge.exe --profile-directory=""" . profile . """"
    Run, %path%, , Max
    WinMaximize
}


; Add custom shortcuts here
RAlt & F1::
    OpenBrowserWithProfile("Profile 1")
Return
