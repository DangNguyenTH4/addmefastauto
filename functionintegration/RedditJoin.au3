
Func redditJoin()
	$timeFromActionBtnToRealAction= 10000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
	$timeFromRealActionToClose = 3000 ;waiting time after click like a page -> Then click close button
	$timeFromConfirmToNextAction = 8000 ;khoang thoi gian
	$popupButtonColorCode = "0x9EDD4A" ; ma mau btn show page popup
	$realActionColorCode = "0x0079D3" ; ma mau cua btn realAction
	$foundButtonExtentX = 20
	$foundButtonExtentY = 20
	$LEFT_MOUSE = "left"
	$REAL_ACTION_BTN_X = 973
	$REAL_ACTION_BTN_Y = 220
	$CLOSE_BTN_X = 584
	$CLOSE_BTN_Y = 17
	; Khoang dien tich de tim real action
	$TOP_LEFT_X = 100
	$TOP_LEFT_Y = 180
	$BOTTOM_RIGHT_X = 475
	$BOTTOM_RIGHT_Y = 245

	$x=0;
	While $x<10
	
	   Sleep($timeFromConfirmToNextAction);

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
				ConsoleWrite("Found position: "&$realActionBtnPosition)
			  ;Thuc hien click nut
			  $REAL_ACTION_BTN_X = $realActionBtnPosition[0]+5
			  $REAL_ACTION_BTN_Y = $realActionBtnPosition[1]+5
			  ConsoleWrite("Do click:"&$REAL_ACTION_BTN_X&"_"&$REAL_ACTION_BTN_Y)
			  MouseClick($LEFT_MOUSE,$REAL_ACTION_BTN_X, $REAL_ACTION_BTN_Y);

			  Sleep($timeFromRealActionToClose);

		   Else
			  ConsoleWrite("Not found real action btn")
		   EndIf
		   ; Thuc hien dong tab vua mo
		   MouseClick($LEFT_MOUSE,$CLOSE_BTN_X, $CLOSE_BTN_Y);

	   Else
		  RefreshPage()

	   EndIf
	   $x=$x+1
	WEnd

EndFunc
