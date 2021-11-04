;#include<onlyRefreshPage.au3>
;#include<hotKeyExitApp.au3>
$x=0
$miss=0
Local $mang
Local $mangButton
;RefreshPage()
While $x<20
   ;if $x = 0 Then
	;  RefreshPage()
	 ; Sleep(1000)
   ;EndIf
   if $x <> 0 then Sleep(7000)
   $mangButton = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
   if IsArray($mangButton) Then
	  MouseClick("left",$mangButton[0]+80, $mangButton[1]+20) ; open like
	  Sleep(7000)
   Else
	  RefreshPage()
	  Sleep(2000)
   EndIf

   $mang = PixelSearch(195, 255,410, 302, "0xFE2C55") ; Find subcribe
   if IsArray($mang) Then
	  ConsoleWrite("Click subcrib")
	  MouseMove($mang[0]+30,$mang[1]+15)
	  MouseClick("left")
	  ;Sleep(3000)
   Else
	  ConsoleWrite("Missed")
	  $miss=$miss+1
	  if $miss=3 Then
		 $miss=0
		 RefreshPage()
	  EndIf

   EndIf
   Sleep(6000)
   MouseClick("left",690, 10);close
   Sleep(1500)
   ;MouseClick("left",$mangButton[0]+80, $mangButton[1]+20) ; open like
   ;Sleep(500)
   ConsoleWrite($x)
   $x=$x+1
   If $x=19 then
	  $x=1
	  Sleep(30000)
   EndIf

WEnd
Func RefreshPage()
   MouseClick("left",1570, 19)
   ;Refresh Page
   Send("{F5}")
   Sleep(3000)
   ;Send("{DOWN}")
EndFunc




