Func fbSharewebsite()
	$x=0;
	Local $imagePath = @ScriptDir & "\resource\bitmap\fbsharepageicon.bmp"
	While $x<10
	   Sleep(9000);
	   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
	   if IsArray($mang) Then
		  MouseClick("left",$mang[0]+5,$mang[1]+5) 
		  Sleep(10000);
		  findButtonAndClick($imagePath) ;find and click likeicon
	   Else
		  RefreshPage()
	   EndIf
	   $x=$x+1
	WEnd
EndFunc
