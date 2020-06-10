#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global delay := 200

global Toggle := 0

reset()
{
	Sleep, delay
	Toggle := 0
	return
}

~LButton::
if (A_PriorHotkey <> "~LButton" or A_TimeSincePriorHotkey > delay)
{
	; Too much time between presses, so this isn't a double-press.
	KeyWait, LButton
}
else
{
	Toggle := 1
	reset()
}
return



#If Toggle
LButton::
Toggle := 0
return