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
$timeFromRealActionToClose = 5000 ;waiting time after click like a page -> Then click close button
$timeFromConfirmToNextAction = 5000 ;khoang thoi gian
$popupButtonColorCode = "0x9EDD4A" ; ma mau btn show page popup
$realActionColorCode = "0xE60023" ; ma mau cua btn realAction
$foundButtonExtentX = 20
$foundButtonExtentY = 20
$LEFT_MOUSE = "left"
$REAL_ACTION_BTN_X = 973
$REAL_ACTION_BTN_Y = 220
$CLOSE_BTN_X = 684
$CLOSE_BTN_Y = 15
; Khoang dien tich de tim real action
$TOP_LEFT_X = 18
$TOP_LEFT_Y = 135
$BOTTOM_RIGHT_X = 690
$BOTTOM_RIGHT_Y = 920

$x=0;
$total = 1
While $x<20
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
   $total = $total+1
WEnd


