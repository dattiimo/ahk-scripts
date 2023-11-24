;; Map Ctrl, Shift + V to paste from the clipboard without formatting
; [source](https://autohotkey.com/board/topic/10412-paste-plain-text-and-copycut/)


; TODO: Update to v2
;#Requires AutoHotkey v2.0

; Run as a single instance. Reload automatically without prompt if second instance started.
#SingleInstance Force


; Ctrl, Shift + V
^+v::
    Clip0 = %ClipBoardAll%
    ClipBoard = %ClipBoard%       ; Convert to text
    Send ^v                       ; For best compatibility: SendPlay
    Sleep 150                     ; Don't change clipboard while it is pasted! (Sleep > 0)
    ClipBoard = %Clip0%           ; Restore original ClipBoard
    VarSetCapacity(Clip0, 0)      ; Free memory
Return
