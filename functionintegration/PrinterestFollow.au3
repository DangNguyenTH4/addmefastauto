#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.
5
#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>
; File refresh page
Func printerestFollow()
	Local $timeFromActionBtnToRealAction= 10000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	Local $timeFromRealActionToClose = 5000 ;waiting time after click like a page -> Then click close button
	Local $timeFromConfirmToNextAction = 5000 ;khoang thoi gian
	Local $popupButtonColorCode = "0x9EDD4A" ; ma mau btn show page popup
	Local $realActionColorCode = "0xE60023" ; ma mau cua btn realAction
	Local $foundButtonExtentX = 20
	Local $foundButtonExtentY = 20
	Local $LEFT_MOUSE = "left"
	Local $REAL_ACTION_BTN_X = 973
	Local $REAL_ACTION_BTN_Y = 220
	Local $CLOSE_BTN_X = 684
	Local $CLOSE_BTN_Y = 15
	; Khoang dien tich de tim real action
	Local $TOP_LEFT_X = 18
	Local $TOP_LEFT_Y = 135
	Local $BOTTOM_RIGHT_X = 690
	Local $BOTTOM_RIGHT_Y = 920

	Local $x=0;
	While $x<4
	   ; Neu la lan dau tien thi khong can doi. Neu khac lan dau tien thi doi x giay
	   if $x <> 0 then Sleep($timeFromConfirmToNextAction);

	   ; Tim kiem nut :Like, Follow, Join ...
	   $actionBtnPosition = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)

	   ; Neu tim thay thi thuc hien click vao nut Like...de mo addmefast mo tab moi
	   if IsArray($actionBtnPosition) Then
		  ;Click vao nut
		  MouseClick($LEFT_MOUSE, $actionBtnPosition[0]+$foundButtonExtentX,$actionBtnPosition[1]+$foundButtonExtentY)
		  ; Doi tab moi mo ra va load trang
		  Sleep($timeFromActionBtnToRealAction);
		  ; Tim va click va real action neu co
		  $realActionBtnPosition = PixelSearch($TOP_LEFT_X, $TOP_LEFT_Y, $BOTTOM_RIGHT_X, $BOTTOM_RIGHT_Y, $realActionColorCode) ; Find subcribe
			if IsArray($realActionBtnPosition) Then
			  ;Thuc hien click nut
			  $REAL_ACTION_BTN_X = $realActionBtnPosition[0]+5
			  $REAL_ACTION_BTN_Y = $realActionBtnPosition[1]+5
			  ;ConsoleWrite("Do click:"&$total&": "&$REAL_ACTION_BTN_X&"_"&$REAL_ACTION_BTN_Y)
			  MouseClick($LEFT_MOUSE,$REAL_ACTION_BTN_X, $REAL_ACTION_BTN_Y);
			  Sleep($timeFromRealActionToClose);
		   Else
			  ConsoleWrite("Not found real action btn")
		   EndIf
		   ; Thuc hien dong tab vua mo
		   MouseClick($LEFT_MOUSE,$CLOSE_BTN_X, $CLOSE_BTN_Y);
		  ; Updated : Click Confirm
		  ;Sleep($timeFromCloseToConfirm)
		  ;MouseMove($actionBtnPosition[0]+$foundButtonExtentX,$actionBtnPosition[1]+$foundButtonExtentY)
		  ;MouseClick($LEFT_MOUSE)

	   Else
		  RefreshPage()
	   EndIf
	   $x=$x+1

	WEnd
EndFunc

