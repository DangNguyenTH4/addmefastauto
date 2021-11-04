
$x=0
$miss=0
Local $mang
Local $mangButton

$timeFromFollowToRealFollow = 8000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
$timeFromRealFollowToClose = 6000 ;waiting time after click like a page -> Then click close button
$timeFromCloseToConfirm = 2000 ; khoang thoi gian doi sau khi click button close
$timeFromConfirmToNextFollow = 8000 ;khoang thoi gian

;RefreshPage()
While $x<20
   if $x <> 0 then Sleep($timeFromConfirmToNextFollow)
   $mangButton = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
   if IsArray($mangButton) Then
	  MouseClick("left",$mangButton[0]+80, $mangButton[1]+20) ; open like
	  Sleep($timeFromFollowToRealFollow)

	  ;Click subribe dicrectly => may be unsubcribe it ok
	  MouseClick("left",170, 203)
	  Sleep($timeFromRealFollowToClose)
	  MouseClick("left",535, 12)
	  ; Updated : Click Confirm
	  Sleep($timeFromCloseToConfirm)
	  MouseClick("left",$mangButton[0]+60, $mangButton[1]+20)

   Else
	  RefreshPage()
	  Sleep(2000)
   EndIf
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



