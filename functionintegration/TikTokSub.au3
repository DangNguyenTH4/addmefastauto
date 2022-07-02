Func tiktokSub()
	$x=0
	Local $mang
	Local $mangButton
	While $x<10
	   Sleep(7000)
	   $mangButton = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
	   if IsArray($mangButton) Then
		  MouseClick("left",$mangButton[0]+80, $mangButton[1]+20) ; open like
		  Sleep(7000)
	   Else
		  RefreshPage()
		  Sleep(2000)
	   EndIf
	   $mang = PixelSearch(195, 255,410, 302, "0xFE2C55") ; Find subcribe
	   if IsArray($mang) Then
		  ConsoleWrite("Click subcrib")
		  MouseMove($mang[0]+30,$mang[1]+15)
		  MouseClick("left")
		  ;Sleep(3000)
	   Else
		RefreshPage()
	   EndIf
	   Sleep(6000)
	   MouseClick("left",690, 10);close
	   Sleep(1500)
	   $x=$x+1
	WEnd
EndFunc


