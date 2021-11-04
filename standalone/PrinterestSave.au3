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


$timeFromActionBtnToRealAction= 10000 ;Khoang thoi gian doi, sau khi click button de show ra website, fanpage
$timeFromRealActionToClose = 3000 ;waiting time after click like a page -> Then click close button
$timeFromConfirmToNextAction = 8000 ;khoang thoi gian
$popupButtonColorCode = "0x9EDD4A" ; ma mau can tim
$foundButtonExtentX = 20
$foundButtonExtentY = 20
$LEFT_MOUSE = "left"
$REAL_ACTION_BTN_X = 973
$REAL_ACTION_BTN_Y = 220
$CLOSE_BTN_X = 1044
$CLOSE_BTN_Y = 14

$x=0;
$total = 1
While $x<20
   ; Neu la lan dau tien thi khong can doi. Neu khac lan dau tien thi doi x giay
   if $x <> 0 then Sleep($timeFromConfirmToNextAction);

   ; Tim kiem nut :Like, Follow, Join ...
   $mang = PixelSearch(@DesktopWidth*2/3,0,@DesktopWidth,@DesktopHeight,$popupButtonColorCode)

   ; Neu tim thay thi thuc hien click vao nut Like...de mo addmefast mo tab moi
   if IsArray($mang) Then
	  ;Click vao nut
	  MouseMove($mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY)
	  MouseClick($LEFT_MOUSE) ;like,follow, subcribe...

	  ; Doi tab moi mo ra va load trang
	  Sleep($timeFromActionBtnToRealAction);
	  ;Thuc hien click nut
	  MouseClick($LEFT_MOUSE,$REAL_ACTION_BTN_X, $REAL_ACTION_BTN_Y); //Tweet

	  Sleep($timeFromRealActionToClose);
	  ; Thuc hien dong tab vua mo
	  MouseClick($LEFT_MOUSE,$CLOSE_BTN_X, $CLOSE_BTN_Y);

	  ; Updated : Click Confirm
	  ;Sleep($timeFromCloseToConfirm)
	  ;MouseMove($mang[0]+$foundButtonExtentX,$mang[1]+$foundButtonExtentY)
	  ;MouseClick($LEFT_MOUSE)


   ;if not found button with color code :$popupButtonColorCode -> refresh page
   Else
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


