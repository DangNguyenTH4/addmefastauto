#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.
5
#ce ----------------------------------------------------------------------------
;system lib
#include <Array.au3>
#include <AutoItConstants.au3>

#include <functionintegration\commonHotKeyExitApp.au3>

Local $MAX_CAN_WORK_SIZE = 9
;danh sach cac method id co the su dung
Local $arrayCanWorkMethodId[$MAX_CAN_WORK_SIZE] = [1, 2, 3, 4, 5,6,7,8,9]
Local $currentCanWorkIndex = -1
Local $clickBodyX = 0
Local $clickBodyY = 0


While $currentCanWorkIndex < $MAX_CAN_WORK_SIZE
	$currentCanWorkIndex = $currentCanWorkIndex + 1 ;
	Local $methodId = $arrayCanWorkMethodId[$currentCanWorkIndex]
	If changeUrl($methodId) Then
		doDrag($methodId)
	EndIf
	If $currentCanWorkIndex = $MAX_CAN_WORK_SIZE - 1 Then
		$currentCanWorkIndex = -1
	EndIf
WEnd

Func changeUrl(ByRef $methodId)
	$url = getUrl($methodId)
	If $url="" Then
		return False;
	EndIf
	ConsoleWrite("-"&$methodId)
	MouseClick("left", 1556, 63)
	;Refresh Page
	Sleep(1000)
	Send("{LCTRL}")
	Sleep(1000)
	Send($url)
	Sleep(1000)
	Send("{ENTER}")
	Sleep(6000)
	return true
EndFunc   ;==>ChangeUrl

Func getUrl(ByRef $methodId)
	Local $result = "" ;
	Switch $methodId
		Case 1 ; youtube
			$result = "https://www.youtube.com"

		Case 2 ; facebook
			$result = "https://www.facebook.com"
		Case 3 ; instagram
			$result = "https://www.instagram.com"
;~ 			$clickBodyX = 1000
;~ 			$clickBodyY = 300			
		Case 4 ; tiktok
			$result = "https://www.tiktok.com"
;~ 			$clickBodyX = 1556
;~ 			$clickBodyY = 200					
		Case 5 ; reddit
			$result = "https://www.reddit.com"
;~ 			$clickBodyX = 1556
;~ 			$clickBodyY = 200					
		Case 6 ; twitter
			$result = "https://twitter.com"
;~ 			$clickBodyX = 1556
;~ 			$clickBodyY = 200					
		Case 7 ; printerest
			$result = "https://www.pinterest.com"
;~ 			$clickBodyX = 1556
;~ 			$clickBodyY = 200					
		Case 8 ; sound cloud
			$result = "https://soundcloud.com/discover"
;~ 			$clickBodyX = 1350
;~ 			$clickBodyY = 150
		Case 9 ; ok.ru
			$result = "https://ok.ru"
;~ 			$clickBodyX = 1600
;~ 			$clickBodyY = 185		
		case 10 ; likee.rui
			$result = "https://likee.video"
		case 11 ; likee.rui
			$result = "https://reverbnation.com"
;~ 			$clickBodyX = 1400
;~ 			$clickBodyY = 185				
	EndSwitch
	Return $result
EndFunc   ;==>getUrl

Func doDrag(ByRef $methodId)
	Local $result = "" ;
	MouseMove(1400, 300)
	Local $timeOfDown = 0
	Local $maxDown = Random(6,50,1);
	While $timeOfDown < $maxDown
		$timeOfDown = $timeOfDown + 1 ;
		MouseWheel($MOUSE_WHEEL_DOWN )
		Sleep(500)
	WEnd
EndFunc   ;==>doDrag
