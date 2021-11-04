#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.
5
#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>
; File refresh page
#include <onlyRefreshPage.au3>
; Setting phim tat ngung auto (F1)
#include <hotKeyExitApp.au3>

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
	  Sleep(6500);
	  ;Thuc hien click nut
	  MouseClick("left",340, 529); //Tweet
	  Sleep(3000);
	  ; Thuc hien dong tab vua mo
	  MouseClick("left",484, 13);
	  ;Sleep(2000)
	  ; Updated : Click Confirm
	  ;MouseMove($mang[0]+20,$mang[1]+20)
	  ;MouseClick("left")
   Else
	  ConsoleWrite("Not found button")
	  RefreshPage()
	  $x=1
	  $total=1
   EndIf
   If $x=19 Then
	  $x=1;
	  Sleep(10000);
   EndIf
   $x=$x+1
   ; Khi thuc hien duoc 30 lan lien tiep thi thuc hien refresh trang 1 lan
   If $total = 30 then
	  RefreshPage()
	  $total = 1
   EndIf
   ConsoleWrite("Times: "&$total)
   $total = $total+1
WEnd