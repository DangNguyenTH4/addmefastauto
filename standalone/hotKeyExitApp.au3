Global $g_bPaused = False
HotKeySet("{FALSE}", "TogglePause")
HotKeySet("{F1}", "Terminate")
HotKeySet("+!d","ShowMessage") ; Shif - Alt -D

Func TogglePause()
   $g_bPaused = Not $g_bPaused
   While $g_bPaused
	  Sleep(100)
	  ToolTip('Script is "Pause"', 0, 0)
   WEnd
   ToolTip("")
EndFunc
Func Terminate()
   Exit
EndFunc
Func ShowMessage()
   MsgBox($MB_SYSTEMMODAL,"","This is a message.")
EndFunc