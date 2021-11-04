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
Local $popupButtonColorCode = "0x9EDD4A" ; ma mau can tim
Local $realActionColorCode = "0x909090" ; ma mau cua btn realAction
Local $LEFT_MOUSE = "left"

;RefreshPage()
While $x<20
   if $x <> 0 then Sleep($timeFromConfirmToLike)
   $mangButton = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)
   if IsArray($mangButton) Then
	  MouseClick($LEFT_MOUSE,$mangButton[0]+80, $mangButton[1]+20) ; open like
	  Sleep($timeFromLikeToRealLike)
   Else
	  RefreshPage()
	  Sleep(2000)
   EndIf

   $mang = PixelSearch(71, 417,203, 577, $realActionColorCode) ; Find subcribe
   if IsArray($mang) Then
	  MouseClick($LEFT_MOUSE, $mang[0]+5,$mang[1]+5)
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
   MouseClick($LEFT_MOUSE,485, 13)
   $x=$x+1
WEnd

Func RefreshPage()
   MouseClick($LEFT_MOUSE,1570, 19)
   ;Refresh Page
   Send("{F5}")
   Sleep(3000)
   ;Send("{DOWN}")
EndFunc





