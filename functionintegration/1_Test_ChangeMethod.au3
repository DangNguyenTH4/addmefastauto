#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.
5
#ce ----------------------------------------------------------------------------
;system lib
#include <Array.au3>

; custom lib
#include <commonHotKeyExitApp.au3>
#include <commonOnlyRefreshPage.au3>
#include <FbLikeDao.au3.au3>
#include <PrinterestSave.au3>
#include <PrinterestFollow.au3>
#include <InstagramFollow.au3>

Local $MAX_CAN_WORK_SIZE = 13
;danh sach cac method id co the su dung
Local $arrayCanWorkMethodId[$MAX_CAN_WORK_SIZE] = [1, 8, 9, 10, 11, 13, 14, 15, 16, 17, 20, 21, 22]
Local $currentCanWorkIndex = 11


While $currentCanWorkIndex < $MAX_CAN_WORK_SIZE
	$currentCanWorkIndex = $currentCanWorkIndex + 1 ;
	Local $methodId = $arrayCanWorkMethodId[$currentCanWorkIndex]
	ChangeUrlGetPoint($methodId)
	doAction($methodId)
	If $currentCanWorkIndex = $MAX_CAN_WORK_SIZE - 1 Then
		$currentCanWorkIndex = -1
	EndIf
WEnd


Func ChangeUrlGetPoint(ByRef $methodId)
	$url = getUrl($methodId)
	ConsoleWrite($url)
	MouseClick("left", 1556, 63)
	;Refresh Page
	Sleep(1000)
	Send("{LCTRL}")
	Sleep(1000)
	Send($url)
	Sleep(1000)
	Send("{ENTER}")
	Sleep(6000)
EndFunc   ;==>ChangeUrlGetPoint



Func getUrl(ByRef $methodId)
	Local $result = "" ;
	Switch $methodId
		Case 1 ; fblike page
			$result = "https://addmefast.com/free_points/facebook_likes"
		Case 2 ; fbshare
			$result = "https://addmefast.com/free_points/facebook_share"
		Case 3 ; fb subcibe page
			$result = "https://addmefast.com/free_points/facebook_subscribes"
		Case 4 ; fb like post
			$result = "https://addmefast.com/free_points/facebook_post_like"
		Case 5 ; fb share post
			$result = "https://addmefast.com/free_points/facebook_post_share"
		Case 6 ; reddit
			$result = "https://addmefast.com/free_points/reddit_members"
		Case 7 ; reddit upvotes
			$result = "https://addmefast.com/free_points/reddit_upvotes"
		Case 8 ; telegram join/subcribe group
			$result = "https://addmefast.com/free_points/telegram_subscribers"
		Case 9 ; instagram follow

			$result = "https://addmefast.com/free_points/instagram"
		Case 10 ; instagram_likes

			$result = "https://addmefast.com/free_points/instagram_likes"
		Case 11 ; tiktok follow
			$result = "https://addmefast.com/free_points/tiktok_followers"
		Case 12 ; tiktok follow
			$result = "https://addmefast.com/free_points/tiktok_video_likes"
		Case 13 ; twitter follow

			$result = "https://addmefast.com/free_points/twitter"
		Case 14 ; twitter retweet
			$result = "https://addmefast.com/free_points/twitter_tweets"
		Case 15 ; twitter like tweet
			$result = "https://addmefast.com/free_points/twitter_likes"
		Case 16 ; youtube subcrite
			$result = "https://addmefast.com/free_points/youtube_subscribe"
		Case 17 ; youtube likes
			$result = "https://addmefast.com/free_points/youtube_likes"
		Case 18 ; youtube views
			$result = "https://addmefast.com/free_points/youtube_views"
		Case 19 ;twich folow
			$result = "https://addmefast.com/free_points/twitch_followers"
		Case 20 ; hit website

			$result = "https://addmefast.com/websites"
		Case 21 ; printest save
			$result = "https://addmefast.com/free_points/pinterest_save"
		Case 22 ; printes follow

			$result = "https://addmefast.com/free_points/pinterest"
		Case 23 ; likee follow
			$result = "https://addmefast.com/free_points/likee_followers"
		Case 24 ; soundcloud like
			$result = "https://addmefast.com/free_points/soundcloud_likes"
		Case 25 ; soundcloud follow
			$result = "https://addmefast.com/free_points/soundcloud_follow"
		Case 26 ; soundcloud view
			$result = "https://addmefast.com/free_points/soundcloud_views"
		Case 27 ; vkontakte group
			$result = "https://addmefast.com/free_points/vkontakte_groups"
		Case 28 ; vkontakte page
			$result = "https://addmefast.com/free_points/vkontakte_pages"
		Case 29 ; askfm like
			$result = "https://addmefast.com/free_points/askfm_likes"
		Case 30 ; ok group join
			$result = "https://addmefast.com/free_points/ok_group_join"
		Case 31 ; don know
			$result = "https://addmefast.com/free_points/reverbnation_fan"
	EndSwitch
	Return $result
EndFunc   ;==>getUrl


Func doAction(ByRef $methodId)
	Local $result = "" ;
	Switch $methodId
		Case 1 ; fblike page
			fbLikePage()
		Case 2 ; fbshare

		Case 3 ; fb subcibe page

		Case 4 ; fb like post

		Case 5 ; fb share post

		Case 6 ; reddit

		Case 7 ; reddit upvotes

		Case 8 ; telegram join/subcribe group

		Case 9 ; instagram follow
			instagramFollow()
		Case 10 ; instagram_likes

		Case 11 ; tiktok follow

		Case 12 ; tiktok follow

		Case 13 ; twitter follow

		Case 14 ; twitter retweet

		Case 15 ; twitter like tweet

		Case 16 ; youtube subcrite

		Case 17 ; youtube likes

		Case 18 ; youtube views

		Case 19 ;twich folow

		Case 20 ; hit website
			Sleep(300000)
		Case 21 ; printest save
			printerestSave()
		Case 22 ; printes follow
			printerestFollow();
		Case 23 ; likee follow

		Case 24 ; soundcloud like

		Case 25 ; soundcloud follow

		Case 26 ; soundcloud view

		Case 27 ; vkontakte group

		Case 28 ; vkontakte page

		Case 29 ; askfm like

		Case 30 ; ok group join

		Case 31 ; don know

	EndSwitch
EndFunc   ;==>doAction
