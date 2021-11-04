#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>
#include <hotKeyExitApp.au3>
#include <onlyRefreshPage.au3>

$x=0;
$total=0
While $x<20

   #cs
   ;if $x = 0 Then
	  RefreshPage()
	  Sleep(1000)
   ;EndIf
   #ce

   ;if $x <> 0 then Sleep(7000);0x9EDD4A
   Sleep(3000);
   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
   if IsArray($mang) Then

	  MouseMove($mang[0]+80,$mang[1]+15)
	  MouseClick("left") ;like,follow, subcribe...
	  Sleep(4500);
	  MouseClick("left",385, 212) ;do like,...
	  Sleep(5000);
	  MouseClick("left",587, 10) ; x
	  Sleep(2000)
	  MouseMove($mang[0]+80,$mang[1]+15)
	  MouseClick("left")
   else
	  RefreshPage()
	  $x=1
	  $total=1
   EndIf

   If $x=19 Then
	  $x=1;
	  Sleep(10000);
   EndIf
   $x=$x+1
   If $total = 30 then
	  RefreshPage()
	  $total = 1
   EndIf
   $total = $total+1

WEnd