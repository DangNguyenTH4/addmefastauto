
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         TonyD

 Script Function:
	reverbnation becom a fan
5
#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>

Func redditUpvote()
	$timeFromActionBtnToRealAction= 10000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	$timeFromRealActionToClose = 3000 ;waiting time after click like a page -> Then click close button
	$timeFromConfirmToNextAction = 8000 ;khoang thoi gian
	$popupButtonColorCode = "0x9EDD4A" ; ma mau can tim
	$foundButtonExtentX = 20
	$foundButtonExtentY = 20
	$LEFT_MOUSE = "left"
	$REAL_ACTION_BTN_X = 50
	$REAL_ACTION_BTN_Y = 255
	$CLOSE_BTN_X = 685
	$CLOSE_BTN_Y = 15

	$x=0;
	While $x<6
	   ; Neu la lan dau tien thi khong can doi. Neu khac lan dau tien thi doi x giay
	   if $x <> 0 then Sleep($timeFromConfirmToNextAction);

	   ; Tim kiem nut :Like, Follow, Join ...
	   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)

	   ; Neu tim thay thi thuc hien click vao nut Like...de mo addmefast mo tab moi
	   if IsArray($mang) Then
		  ;Click vao nut
		  MouseMove($mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY)
		  MouseClick($LEFT_MOUSE) ;like,follow, subcribe...

		  ; Doi tab moi mo ra va load trang
		  Sleep($timeFromActionBtnToRealAction);
		  ;Thuc hien click nut
		  MouseClick($LEFT_MOUSE,$REAL_ACTION_BTN_X, $REAL_ACTION_BTN_Y); //Tweet

		  Sleep($timeFromRealActionToClose);
		  ; Thuc hien dong tab vua mo
		  MouseClick($LEFT_MOUSE,$CLOSE_BTN_X, $CLOSE_BTN_Y);
	   Else
		  RefreshPage()
	   EndIf
	   $x = $x + 1
	WEnd
EndFunc

