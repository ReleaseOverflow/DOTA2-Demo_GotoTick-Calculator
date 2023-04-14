#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force


;; https://autohotkey.com/board/topic/104702-remove-all-the-text-after-the-specific-character/
;; https://dev.dota2.com/forum/dota-2/spectating/replays/186361-skip-replay-to-game-time-using-console

; VAR = Leading string of text @TEXT I WANT TO KEEP@ Trailing String of Text...

; MsgBox % StrSplit(var, "@").2







GLOBAL aHardcodeTickrateVel := "29.99"
GLOBAL Haystack := clipboard
; Haystack := "dota2://matchid=5555628944&matchtime=2453"
GLOBAL Needle := "dota2://matchid="


Gui, Add, Edit, x42 y49 w180 h20 , Edit
Gui, Add, Edit, x42 y79 w180 h20 , Edit
Gui, Add, Button, x242 y109 w100 h30 , Button
Gui, Show, x698 y355 h428 w479, New GUI Window


SetTimer, RefreshClipboard, 500
Return





Return


RefreshClipboard:
GLOBAL Haystack := ""
GLOBAL Haystack := clipboard
Return



HOME::
If InStr(Haystack, Needle)
{
    ; MsgBox, The string was found.
    NewStr := StrReplace(Haystack, Needle, "")
ResultStr := SubStr(NewStr, InStr(NewStr, "=") + 1)
; msgbox %ResultStr%
CalculatedTicks := (ResultStr*aHardcodeTickrateVel)
Loop, parse, CalculatedTicks
{
If ( A_LoopField = ".")
Break
ResultTicks .= A_LoopField
}
; msgbox %ResultTicks%
clipboard := ""
clipboard := "demo_gototick" . A_Space . ResultTicks
; msgbox %ResultTicks%
ResultTicks := ""
Return
}
Return






GuiClose:
ExitApp