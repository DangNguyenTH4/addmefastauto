#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>
#include <hotKeyExitApp.au3>
#include <onlyRefreshPage.au3>
local $x=1
While $x<20
   MouseClick("left",910, 696)
   if $x=10 then
	  $x=1
	  Sleep(3000)
   EndIf
WEnd