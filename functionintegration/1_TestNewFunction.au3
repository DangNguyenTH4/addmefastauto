#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         dangnt

 Script Function:
	Auto like, subribe social
	Fit with screen: 1848 x 972
	
#ce ----------------------------------------------------------------------------
;system lib
#include <Array.au3>

; custom lib
#include <commonHotKeyExitApp.au3>
#include <commonOnlyRefreshPage.au3>
;new function filee
#include <Reverbnation3step.au3>

Local $MAX_CAN_WORK_SIZE = 1
;danh sach cac method id co the su dung
Local $arrayCanWorkMethodId[$MAX_CAN_WORK_SIZE] = [1]
Local $currentCanWorkIndex = -1


While $currentCanWorkIndex < $MAX_CAN_WORK_SIZE
	$currentCanWorkIndex = $currentCanWorkIndex + 1 ;
	Local $methodId = $arrayCanWorkMethodId[$currentCanWorkIndex]
	If ChangeUrlGetPoint($methodId) Then
		becomeAfan()
	EndIf
	If $currentCanWorkIndex = $MAX_CAN_WORK_SIZE - 1 Then
		$currentCanWorkIndex = -1
	EndIf
WEnd


Func ChangeUrlGetPoint(ByRef $methodId)
	$url = getUrl($methodId)
	If $url="" Then
		return False;
	EndIf
	ConsoleWrite("Method-"&$methodId)
	MouseClick("left", 1635, 58)
	;Refresh Page
	Sleep(1000)
	Send("{LCTRL}")
	Sleep(1000)
	Send($url)
	Sleep(1000)
	Send("{SPACE}")
	Send("{ENTER}")
	Sleep(6000)
	return true
EndFunc   ;==>ChangeUrlGetPoint



Func getUrl(ByRef $methodId)
	Local $result = "" ;
	ConsoleWrite("Get url")
	$result = "https://addmefast.com/free_points/reverbnation_fan"
	Return $result
EndFunc   ;==>getUrl
