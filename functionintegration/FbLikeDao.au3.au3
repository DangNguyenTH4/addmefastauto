#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
; Script Start - Add your code below here
Func fbLikePage()
	$x=0;
	$total = 1
	$timeFromLikeToRealLike = 6500 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	$timeFromRealLikeToClose = 6000 ;waiting time after click like a page -> Then click close button
	$timeFromCloseToConfirm = 5000 ; khoang thoi gian doi sau khi click button close
	$timeFromConfirmToLike = 9000 ;khoang thoi gian
	Local $mangRealButton
	Local $realActionColorCode = "0xE7F3FF" ; ma mau cua btn realAction
	While $x<10
	   if $x <> 0 then Sleep($timeFromConfirmToLike);

	   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
	   if IsArray($mang) Then
		  MouseMove($mang[0]+80,$mang[1]+20)
		  MouseClick("left") ; click vao button de show ra page can like
		  Sleep($timeFromLikeToRealLike);
		  
		  $mangRealButton = PixelSearch(478, 547,814, 695, $realActionColorCode) ; Find subcribe
		   if IsArray($mangRealButton) Then
			  MouseClick("left", $mangRealButton[0]+5,$mangRealButton[1]+5)
			  ;Sleep(3000)
		   Else
			  ConsoleWrite("Missed")
		   EndIf		  
		  Sleep($timeFromRealLikeToClose);
		  MouseClick("left",883, 16); ; click vao button close
		  Sleep($timeFromLikeToRealLike);
		  MouseMove($mang[0]+80,$mang[1]+20)
		  MouseClick("left") ; click vao button confirm
	   Else
		  RefreshPage()
	   EndIf
	   $x=$x+1

	WEnd
EndFunc