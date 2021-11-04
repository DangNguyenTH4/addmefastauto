#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
; Script Start - Add your code below here
$x=0;
$total = 1
$timeFromLikeToRealLike = 8000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
$timeFromRealLikeToClose = 6000 ;waiting time after click like a page -> Then click close button
$timeFromCloseToConfirm = 5000 ; khoang thoi gian doi sau khi click button close
$timeFromConfirmToLike = 9000 ;khoang thoi gian
While $x<20
   #cs
   if $x = 0 Then
	  RefreshPage()
	  Sleep(1000)
   EndIf
   #ce
   if $x <> 0 then Sleep($timeFromConfirmToLike);

   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
   if IsArray($mang) Then
	  MouseMove($mang[0]+80,$mang[1]+20)
	  MouseClick("left") ; click vao button de show ra page can like
	  Sleep($timeFromLikeToRealLike);
	  MouseClick("left",350, 363); ; click vao button like trong fb
	  Sleep($timeFromRealLikeToClose);
	  MouseClick("left",394, 13); ; click vao button close
	  Sleep($timeFromLikeToRealLike);
	  MouseMove($mang[0]+80,$mang[1]+20)
	  MouseClick("left") ; click vao button confirm
	  If $x=19 Then
		 $x=1;
		 Sleep(20000);
	  EndIf
   Else
	  RefreshPage()
	  $x=1
	  $total=1
   EndIf

   $x=$x+1
   If $total = 30 then
	  RefreshPage()
	  $total = 1
   EndIf
   $total = $total+1
WEnd

Func RefreshPage()
   MouseClick("left",1570, 19)
   ;Refresh Page
   Send("{F5}")
   Sleep(3000)
   ;Send("{DOWN}")
EndFunc