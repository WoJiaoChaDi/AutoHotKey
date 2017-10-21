;*########AHK脚本文件########
;#**********忄鱼编辑制作***********#
;#**作者博客：http://plo.me **#
;#**联系邮箱：a@plo.me       **#
;##########################

#SingleInstance force		;强制重新载入新脚本
#NoEnv									;不检测空变量为环境变量
#NoTrayIcon

Hotkey,~+WheelUp,ChTUp,off
Hotkey,~+WheelDown,ChTDown,off
Return

^+z::

Tran = 170
WinSet, ExStyle, +0x20,ahk_class MediaPlayerClassicW
WinSet,Transparent,170,ahk_class MediaPlayerClassicW
Hotkey,~+WheelUp,ChTUp,On
Hotkey,~+WheelDown,ChTDown,On
Return

^+a::
WinSet, ExStyle, -0x20,ahk_class MediaPlayerClassicW
WinSet,Transparent,255,ahk_class MediaPlayerClassicW
Hotkey,~+WheelUp,ChTUp,off
Hotkey,~+WheelDown,ChTDown,off
Return

ChTDown:
Tran := Tran - 5
If Tran < 30
Tran = 30
WinSet,Transparent,%Tran%,ahk_class MediaPlayerClassicW
Return

ChTUp:
Tran := Tran + 5
If Tran > 255
Tran = 255
WinSet,Transparent,%Tran%,ahk_class MediaPlayerClassicW
Return