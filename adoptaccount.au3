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
		Case 4 ; tiktok
			$result = "https://www.tiktok.com"
		Case 5 ; reddit
			$result = "https://www.reddit.com"
		Case 6 ; twitter
			$result = "https://twitter.com"
		Case 7 ; printerest
			$result = "https://www.pinterest.com"
		Case 8 ; sound cloud
			$result = "https://soundcloud.com/discover"
		Case 9 ; ok.ru
			$result = "https://ok.ru"
		Case 9 ; ok.ru
			$result = "https://likee.video"
	EndSwitch
	Return $result
EndFunc   ;==>getUrl

Func doDrag(ByRef $methodId)
	Local $result = "" ;
	MouseClick("left", 1556, 200)
	Local $timeOfDown = 0
	Local $maxDown = Random(6,20,1);
	While $timeOfDown < $maxDown
		$timeOfDown = $timeOfDown + 1 ;
		MouseWheel($MOUSE_WHEEL_DOWN )
		Sleep(500)
	WEnd
EndFunc   ;==>doDrag
