#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

Func twitterFollow()
	Local $timeFromActionBtnToRealAction= 10000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	Local $timeFromRealActionToClose = 3000 ;waiting time after click like a page -> Then click close button
	Local $timeFromCloseToConfirm = 2000 ; khoang thoi gian doi sau khi click button close
	Local $timeFromConfirmToNextAction = 3000 ;khoang thoi gian
	Local $popupButtonColorCode = "0x9EDD4A" ; ma mau can tim
	Local $foundButtonExtentX = 20
	Local $foundButtonExtentY = 20
	Local $LEFT_MOUSE = "left"
	Local $REAL_ACTION_BTN_X = 300
	Local $REAL_ACTION_BTN_Y = 300
	Local $CLOSE_BTN_X = 587
	Local $CLOSE_BTN_Y = 10
	Local $x=0;

	While $x<20

	   ;if $x <> 0 then Sleep(7000);0x9EDD4A
	   Sleep($timeFromConfirmToNextAction);
	   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)
	   if IsArray($mang) Then

		  MouseClick($LEFT_MOUSE, $mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY)
		  Sleep($timeFromActionBtnToRealAction);
		  ConsoleWrite("click real"&$REAL_ACTION_BTN_X)
		  MouseClick($LEFT_MOUSE,$REAL_ACTION_BTN_X, $REAL_ACTION_BTN_Y) ;do like,...
		  Sleep($timeFromRealActionToClose);
		  MouseClick($LEFT_MOUSE,$CLOSE_BTN_X, $CLOSE_BTN_Y) ; x
		  Sleep($timeFromCloseToConfirm)
		  MouseClick($LEFT_MOUSE, $mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY)
	   else
		  ;RefreshPage()
	   EndIf

	   $x=$x+1

	WEnd
EndFunc