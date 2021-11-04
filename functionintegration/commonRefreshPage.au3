Func RefreshPage()
   MouseClick("left",1231, 20)
   ;Refresh Page
   Send("{F5}")
   Sleep(5000)
   ;Open Console
   Send("{F12}")
   ;Focus to console
   Sleep(2000)
   MouseClick("left",1231, 250)
   ;Run command
   Send('setInterval(function(){{}document.getElementsByClassName("btn3")[1].style.height="1000px";document.getElementsByClassName("btn3")[1].style.width="1000px";{}},2000);')
   ConsoleWrite("Done print")
   Sleep(3000)
   ConsoleWrite("Press enter and esc")
   Send("{ESC}")
   Sleep(2000)
   Send("{enter}")
   Sleep(1000)
   ;Close console
   Send("{F12}")
   ;Send("{DOWN}")
EndFunc