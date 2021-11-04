#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include<hotKeyExitApp.au3>
Sleep(2000);
$whenNight = "0xACACAC"
$whenDay = "0x535353"
$found = $whenDay
while(true)
   $iColor = PixelGetColor(10, 100)

   if Hex($iColor, 6) = "FFFFFF" Then
	  $found = $whenDay
   Else
	  $found = $whenNight
   EndIf

;   Sleep(2000);
   $onSky = false;
   $onLand = false;

   $mangButtonLand = PixelSearch(553, 205, 581, 230,$found)
   $onLand = IsArray($mangButtonLand) And $mangButtonLand[0] <> 0

   $mangButtonSky = PixelSearch(553,160, 581, 188,$found)
   $onSky = IsArray($mangButtonSky) And $mangButtonSky[0] <> 0
   ;ConsoleWrite($onSky)
    ;  ConsoleWrite($onLand)
   if ($onLand =true And $onSky = false) then
	  Send("{SPACE 1}");
   ElseIf ($onLand =true And $onSky = true) Then
	  Send("{SPACE down}");
	  Sleep(200);
	  Send("{SPACE up}");
   Else

   EndIf
WEnd
