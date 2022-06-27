#include <..\lib\findimage.au3>
Func youtubeLikeVideo()
	$x=0
	Local $mang
	Local $mangButton
	Local $imagePath = @ScriptDir & "\resource\bitmap\youtubelikeicon.bmp"

	$timeFromLikeToRealLike = 10000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	$timeFromRealLikeToClose = 4000;waiting time after click like a page -> Then click close button
	$timeFromConfirmToLike = 8000 ;khoang thoi gian
	Local $popupButtonColorCode = "0x9EDD4A" ; ma mau can tim
	Local $realActionColorCode = "0x909090" ; ma mau cua btn realAction
	Local $LEFT_MOUSE = "left"

	While $x<20
	   if $x <> 0 then Sleep($timeFromConfirmToLike)
	   $mangButton = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)
	   if IsArray($mangButton) Then
		  MouseClick($LEFT_MOUSE,$mangButton[0]+80, $mangButton[1]+20) ; open like
		  Sleep($timeFromLikeToRealLike)
	   Else
		  RefreshPage()
	   EndIf
	   findButtonAndClick($imagePath) ;find and click likeicon
	   Sleep($timeFromRealLikeToClose)
	   MouseClick($LEFT_MOUSE,485, 13)
	   $x=$x+1
	WEnd
EndFunc



