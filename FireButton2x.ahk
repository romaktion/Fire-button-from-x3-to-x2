; Example #4: Detects when a key has been double-pressed (similar to double-click).
; KeyWait is used to stop the keyboard's auto-repeat feature from creating an unwanted
; double-press when you hold down the RControl key to modify another key.  It does this byS
; keeping the hotkey's thread running, which blocks the auto-repeats by relying upon
; #MaxThreadsPerHotkey being at its default setting of 1.
; Note: There is a more elaborate script to distinguish between single, double, and
; triple-presses at the bottom of the SetTimer page.

global delay := 250

~LButton::
if (A_PriorHotkey <> "~LButton" or A_TimeSincePriorHotkey > delay)
{
	; Too much time between presses, so this isn't a double-press.
	KeyWait, LButton
}
else
{
	Hotkey, LButton, DoNothing
	reset2()
}
return

DoNothing:
return

Do:
mouseClick()
if (A_PriorHotkey <> "~LButton" or A_TimeSincePriorHotkey > delay)
{
	; Too much time between presses, so this isn't a double-press.
	KeyWait, LButton
}
else
{
	Hotkey, LButton, DoNothing
	reset()
	return
}
return

mouseClick()
{
	Send {LButton down}
	Loop
	{
		if !GetKeyState("LButton", "P")
			Break
	}
	Send {LButton up}
	return
}

reset()
{
	Sleep, 60
	Hotkey, LButton, Do
	return
}

reset2()
{
	Sleep, delay
	Hotkey, LButton, Do
	return
}
