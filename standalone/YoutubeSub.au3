;#include<onlyRefreshPage.au3>
;#include<hotKeyExitApp.au3>
$x=0
$miss=0
$timeFromLikeToRealLike = 8000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
$timeFromRealSubribeToClose = 6000 ;waiting time after click like a page -> Then click close button
$timeFromCloseToNextLike = 9000 ;khoang thoi gian

Local $mang
Local $mangButton
;RefreshPage()
While $x<20
   ;if $x = 0 Then
	;  RefreshPage()
	 ; Sleep(1000)
   ;EndIf
   if $x <> 0 then Sleep($timeFromCloseToNextLike)
   $mangButton = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
   if IsArray($mangButton) Then
	  MouseClick("left",$mangButton[0]+80, $mangButton[1]+20) ; open subcribe page
	  Sleep(8000)
   Else
	  RefreshPage()
	  Sleep(2000)
   EndIf

   $mang = PixelSearch(0,0,513, 659, "0xCC0000") ; Find subcribe
   if IsArray($mang) Then
	  ;ConsoleWrite("Click subcribe chanel")
	  MouseMove($mang[0]+5,$mang[1]+5)
	  MouseClick("left")
	  Sleep($timeFromRealSubribeToClose)
   Else
	  ConsoleWrite("Missed")
	  $miss=$miss+1
	  if $miss=3 Then
		 $miss=0
		 RefreshPage()
	  EndIf
	  Sleep($timeFromRealSubribeToClose)
   EndIf
   ;Sleep($timeFromRealSubribeToClose)
   MouseClick("left",485, 13)
   Sleep($timeFromRealSubribeToClose)
   ;MouseClick("left",$mangButton[0]+80, $mangButton[1]+20) ; click confirm button
   ;ConsoleWrite($x)
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




