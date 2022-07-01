Func instagramLike()
	$x=0;
	Local $imagePath = @ScriptDir & "\resource\bitmap\instalikeicon.bmp"
	While $x<20
	   Sleep(6000);
	   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
	   if IsArray($mang) Then
		  MouseClick("left",$mang[0]+5,$mang[1]+5) 
		  Sleep(10000);
		  findButtonAndClick($imagePath) ;find and click likeicon
		  Sleep(3000);
		  ; Thuc hien dong tab vua mo
		  MouseClick("left",284, 8);
		  ; Updated : Click Confirm
		  Sleep(3000)
		   MouseClick("left",$mang[0]+20,$mang[1]+20)
		 
	   Else
		  RefreshPage()
	   EndIf

	   $x=$x+1

	WEnd
EndFunc
