#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         dangnt

 Script Function:
	Auto like, subribe social
	Fit with screen: 1848 x 972
	
#ce ----------------------------------------------------------------------------
;system lib
#include <Array.au3>

#include <..\lib\findimage.au3>
; custom lib
#include <commonHotKeyExitApp.au3>
#include <commonOnlyRefreshPage.au3>
#include <FbLikeDao.au3.au3>
#include <PrinterestSave.au3>
#include <PrinterestFollow.au3>
#include <InstagramFollow.au3>
#include <LikeeFollow.au3>
#include <YoutubeSub.au3>
#include <TweeterLike.au3>
#include <TwiiterFollow.au3>
#include <Z_SoundCloudLike.au3>
#include <Z_SoundCloudFollow.au3>
#include <Z_SoundCloudPlay.au3>
#include <TelegramJoin.au3>
#include <Reverbnation3step.au3>
#include <instagramLike.au3>
#include <YoutubeLikeVideo.au3>

Local $MAX_CAN_WORK_SIZE = 31
;danh sach cac method id co the su dung
Local $arrayCanWorkMethodId[$MAX_CAN_WORK_SIZE] = [1,2,3,4,5,6,7,8, 9,10,11,13,14,15,16,17,18,19,20,21,22,24,25,26,27,28,29,30,31]
Local $currentCanWorkIndex = -1


While $currentCanWorkIndex < $MAX_CAN_WORK_SIZE
	$currentCanWorkIndex = $currentCanWorkIndex + 1 ;
	Local $methodId = $arrayCanWorkMethodId[$currentCanWorkIndex]
	If ChangeUrlGetPoint($methodId) Then
		doAction($methodId)
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
	Switch $methodId
		Case 1 ; fblike page
			;$result = "https://addmefast.com/free_points/facebook_likes"
		Case 2 ; fbshare
			;$result = "https://addmefast.com/free_points/facebook_share"
		Case 3 ; fb subcibe page
			;$result = "https://addmefast.com/free_points/facebook_subscribes"
		Case 4 ; fb like post
			;$result = "https://addmefast.com/free_points/facebook_post_like"
		Case 5 ; fb share post
			;$result = "https://addmefast.com/free_points/facebook_post_share"
		Case 6 ; reddit
			$result = "https://addmefast.com/free_points/reddit_members"
		Case 7 ; reddit upvotes
			$result = "https://addmefast.com/free_points/reddit_upvotes"
		Case 8 ; telegram join/subcribe group
			;$result = "https://addmefast.com/free_points/telegram_subscribers"
		Case 9 ; instagram follow
			$result = "https://addmefast.com/free_points/instagram"
		Case 10 ; instagram_likes
			$result = "https://addmefast.com/free_points/instagram_likes"
		Case 11 ; tiktok follow
			;$result = "https://addmefast.com/free_points/tiktok_followers"
		Case 12 ; tiktok follow
			;$result = "https://addmefast.com/free_points/tiktok_video_likes"
		Case 13 ; twitter follow
			;$result = "https://addmefast.com/free_points/twitter"
		Case 14 ; twitter retweet
			;$result = "https://addmefast.com/free_points/twitter_tweets"
		Case 15 ; twitter like tweet
			;$result = "https://addmefast.com/free_points/twitter_likes"
		Case 16 ; youtube subcrite
			$result = "https://addmefast.com/free_points/youtube_subscribe"
		Case 17 ; youtube likes
			$result = "https://addmefast.com/free_points/youtube_likes"
		Case 18 ; youtube views
			;$result = "https://addmefast.com/free_points/youtube_views"
		Case 19 ;twich folow
			;$result = "https://addmefast.com/free_points/twitch_followers"
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
			;$result = "https://addmefast.com/free_points/vkontakte_groups"
		Case 28 ; vkontakte page
			;$result = "https://addmefast.com/free_points/vkontakte_pages"
		Case 29 ; askfm like
			;$result = "https://addmefast.com/free_points/askfm_likes"
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
			telegramJoinChannel()
		Case 9 ; instagram follow
			instagramFollow()
		Case 10 ; instagram_likes
			instagramLike()
		Case 11 ; tiktok follow

		Case 12 ; tiktok Like

		Case 13 ; twitter follow
			;twitterFollow()
		Case 14 ; twitter retweet

		Case 15 ; twitter like tweet
			;tweeterLike()
		Case 16 ; youtube subcrite
			youtubeSub()
		Case 17 ; youtube likes
			youtubeLikeVideo()
		Case 18 ; youtube views

		Case 19 ;twich folow

		Case 20 ; hit website
			Sleep(100000)
		Case 21 ; printest save
			printerestSave()
		Case 22 ; printes follow
			printerestFollow();
		Case 23 ; likee follow
			likeeAction()
		Case 24 ; soundcloud like
			soundCloudLike()
		Case 25 ; soundcloud follow
			soundCloudFollow()
		Case 26 ; soundcloud view
			soundCloudPlay()
		Case 27 ; vkontakte group

		Case 28 ; vkontakte page

		Case 29 ; askfm like

		Case 30 ; ok group join

		Case 31 ; reverbnation
			becomeAfan()

	EndSwitch
EndFunc   ;==>doAction
