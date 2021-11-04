;#include<onlyRefreshPage.au3>
;#include<hotKeyExitApp.au3>
$x=0
$miss=0
Local $mang
Local $mangButton

$timeFromLikeToRealLike = 8000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
$timeFromRealLikeToClose = 3500;waiting time after click like a page -> Then click close button
$timeFromCloseToConfirm = 5000 ; khoang thoi gian doi sau khi click button close
$timeFromConfirmToLike = 8000 ;khoang thoi gian

;RefreshPage()
While $x<20
   if $x <> 0 then Sleep($timeFromConfirmToLike)
   $mangButton = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
   if IsArray($mangButton) Then
	  MouseClick("left",$mangButton[0]+80, $mangButton[1]+20) ; open like
	  Sleep($timeFromLikeToRealLike)
   Else
	  RefreshPage()
	  Sleep(2000)
   EndIf

   $mang = PixelSearch(71, 417,203, 577, "0x909090") ; Find subcribe
   if IsArray($mang) Then
	  ConsoleWrite("Click subcrib")
	  MouseMove($mang[0]+5,$mang[1]+5)
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
   Sleep($timeFromRealLikeToClose)
   MouseClick("left",485, 13)
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





