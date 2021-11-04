#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.
5
#ce ----------------------------------------------------------------------------
Func tweeterLike()
	Local $timeFromActionBtnToRealAction= 8000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	Local $timeFromRealActionToClose = 3000 ;waiting time after click like a page -> Then click close button
	Local $timeFromCloseToConfirm = 2000 ; khoang thoi gian doi sau khi click button close
	Local $timeFromConfirmToNextAction = 5000 ;khoang thoi gian
	Local $popupButtonColorCode = "0x9EDD4A" ; ma mau can tim
	Local $foundButtonExtentX = 20
	Local $foundButtonExtentY = 20
	Local $LEFT_MOUSE = "left"
	Local $REAL_ACTION_BTN_X = 278
	Local $REAL_ACTION_BTN_Y = 487
	Local $CLOSE_BTN_X = 491
	Local $CLOSE_BTN_Y = 10

	Local $x=0;
	While $x<15
	   ; Neu la lan dau tien thi khong can doi. Neu khac lan dau tien thi doi x giay
	   if $x <> 0 then Sleep($timeFromConfirmToNextAction);
	   ; Tim kiem nut :Like, Follow, Join ...
	   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)
	   ; Neu tim thay thi thuc hien click vao nut Like...de mo addmefast mo tab moi
	   if IsArray($mang) Then
		  ;Click vao nut
		  MouseClick($LEFT_MOUSE, $mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY);like,follow, subcribe...
		  ; Doi tab moi mo ra va load trang
		  Sleep($timeFromActionBtnToRealAction);
		  ;Thuc hien click nut
		  MouseClick($LEFT_MOUSE,$REAL_ACTION_BTN_X, $REAL_ACTION_BTN_Y); //Tweet
		  Sleep($timeFromRealActionToClose);
		  ; Thuc hien dong tab vua mo
		  MouseClick($LEFT_MOUSE,$CLOSE_BTN_X, $CLOSE_BTN_Y);
		  ; Updated : Click Confirm
		  Sleep($timeFromCloseToConfirm)
		  MouseClick($LEFT_MOUSE, $mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY)

	   Else
		 ; RefreshPage()
	   EndIf

	   $x=$x+1
	WEnd
EndFunc