
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         TonyD

 Script Function:
	3Step_Template
5
#ce ----------------------------------------------------------------------------

Func soundCloudPlay()
	Local $timeFromActionBtnToRealAction= 6000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	Local $timeFromRealActionToClose = 2000 ;waiting time after click like a page -> Then click close button
	Local $timeFromConfirmToNextAction = 6000 ;khoang thoi gian
	Local $popupButtonColorCode = "0x9EDD4A" ; ma mau can tim
	Local $foundButtonExtentX = 20
	Local $foundButtonExtentY = 20
	Local $LEFT_MOUSE = "left"
	Local $REAL_ACTION_BTN_X = 770
	Local $REAL_ACTION_BTN_Y = 395
	Local $CLOSE_BTN_X = 583
	Local $CLOSE_BTN_Y = 17

	Local $x=0;

	While $x<4

	   if $x <> 0 then Sleep(30500);
	   if $x = 0 Then
		   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)
		   if IsArray($mang) Then
			  MouseClick($LEFT_MOUSE, $mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY)
			  Sleep($timeFromActionBtnToRealAction);
			  ;MouseClick($LEFT_MOUSE,$REAL_ACTION_BTN_X, $REAL_ACTION_BTN_Y); //Tweet

		   Else
			  RefreshPage()
		   EndIf
		EndIf
	   $x=$x+1
	WEnd
	Sleep($timeFromRealActionToClose);
	MouseClick($LEFT_MOUSE,$CLOSE_BTN_X, $CLOSE_BTN_Y);
EndFunc

