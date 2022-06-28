;~ Opt("MustDeclareVars", 1)
;~ #AutoIt3Wrapper_UseX64=y
;~ #AutoIt3Wrapper_Change2CUI=y
#RequireAdmin

#include "_ImageSearch_UDF.au3"

Func findButtonAndClick(ByRef $imagePath)
	ConsoleWrite($imagePath)
    ToolTip('(Press ESC for EXIT) Searching ...', 1, 1)

    Local $return = _ImageSearch($imagePath)
    If $return[0] = 1 Then
        ConsoleWrite(" X=" & $return[1] & " Y=" & $return[2])
        MouseClick("left", $return[1], $return[2])
		Sleep(1000)
	Else
		ConsoleWrite("Not found icon")
    EndIf
EndFunc
