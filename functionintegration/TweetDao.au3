#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>
#include <refreshPage.au3>
#include <hotKeyExitApp.au3>
; Press Esc to terminate script, Pause/Break to "pause"

; Script Start - Add your code below here
$x=1;
$total = 1
While $x<20
   Sleep(7000);
   MouseClick("left",1133, 502);
   Sleep(3000);
   MouseClick("left",537, 84); //Tweet
   Sleep(3000);
   MouseClick("left",586, 8);
   If $x=19 Then
	  $x=1;
	  Sleep(10000);
   EndIf
   If $total = 30 then Exit

   $total = $total+1
WEnd