#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.
5
#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>
; File refresh page
#include <commonOnlyRefreshPage.au3>
; Setting phim tat ngung auto (F1)
#include <commonHotKeyExitApp.au3>

$x=0;
$total = 1
While $x<20
   ; Neu la lan dau tien thi khong can doi. Neu khac lan dau tien thi doi x giay
   if $x <> 0 then Sleep(3900);
   ; Tim kiem nut :Like, Follow, Join ...
   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,"0x9EDD4A")
   ; Neu tim thay thi thuc hien click vao nut Like...de mo addmefast mo tab moi
   if IsArray($mang) Then
	  ;Click vao nut
	  MouseMove($mang[0]+5,$mang[1]+5)
	  MouseClick("left") ;like,follow, subcribe...
	  ; Doi tab moi mo ra va load trang
	  Sleep(10000);
	  ;Thuc hien click nut
	  ;MouseClick("left",38, 556); //Tweet
	  MouseClick("left",34, 486); //Tweet
	  Sleep(3000);
	  ; Thuc hien dong tab vua mo
	  MouseClick("left",284, 8);
	  ; Updated : Click Confirm
	  Sleep(3000)
	  MouseMove($mang[0]+20,$mang[1]+20)
	  MouseClick("left")
   Else
	  RefreshPage()
   EndIf

   $x=$x+1

WEnd

