;*########AHK脚本文件########
;#**********忄鱼编辑制作***********#
;#**作者博客：http://plo.me **#
;#**联系邮箱：a@plo.me       **#
;##########################

#SingleInstance force		;强制重新载入新脚本
#NoEnv									;不检测空变量为环境变量
#NoTrayIcon
SetWinDelay,2

TC = 2
TL = J

Gui, +AlwaysOnTop
Gui, Font, S12 CDefault, 微软雅黑
Gui,add,Text,x10 y10 ,序号：
Gui,add,edit,x+   h25  w40 vN gUpdate Number,1
Gui,add,text,x+10 y10 ,参考文献类型：
Gui,add,DDL,x+w150  y7 vTypeChoice gTypeChoice Choose1 AltSubmit,期刊文章（J）|专著（M）|学术论文（D）
Gui,add,Text,x10 y+5 ,第1作者
Gui,add,edit,x+  h25 vAu1 gUpdate w90,
Gui,add,text,x+5,第2作者
Gui,add,edit,x+   h25 vAu2 gUpdate w90,
Gui,add,text,x+5 ,第3作者
Gui,add,edit,x+   h25 vAu3 gUpdate w90,
Gui,add,Checkbox,x+5 vMoreAu gUpdate,多于三个作者
Gui,add,Text,x10 y+10 ,文献题名：
Gui,add,edit,x+  h25 vName gUpdate w460,

Gui,add,text,x10 y+20,刊名：
Gui,add,edit,x+ h25 vMing gUpdate w250,
Gui,add,text,x+5 ,年份：
Gui,add,edit,x+ h25 vNian gUpdate w60 Number,
Gui,add,text,x+5 ,卷：
Gui,add,edit,x+ h25 vVol gUpdate w40 h25 Number,
Gui,add,text,x+5 ,期：
Gui,add,edit,x+ h25 vQ gUpdate w40 h25 Number,

Gui,add,text,x10 y+5  ,出版地：
Gui,add,edit,x+ h25 Disabled vChubandi gUpdate w80,
Gui,add,text,x+5 ,出版社：
Gui,add,edit,x+ h25 w130 vChubanshe gUpdate Disabled,
Gui,add,text,x+5 ,出版年：
Gui,add,edit,x+ h25 w90 vChubannian gUpdate Disabled Number,

Gui,add,text,x10 y+10 ,起止页码：
Gui,add,edit,x+ h25 vYema1 gUpdate w50 Number,
Gui,add,text,x+,~
Gui,add,edit,x+ h25 vYema2 gUpdate w50 Number,
Gui,add,text,x+20 ,自动生成参考文献条目↓（实时更新）

Gui,add,edit,x10 y+10 w470 r3 vresult ,
Gui,add,button,x+5 w105 h30  vcopy gcopy Default,复制结果
Gui,add,button,x+-105 y+5 w105 h30 gnext vnext,下一篇→

Gui,add,progress,x485 y214 w105 h30 c00ff00 vcopygui ,0
GuiControl,hide,copygui

Gui,show,w600 h300,参考文献条目生成器Beta —— 鱼鱼Kevin   http://plo.me
Return

TypeChoice:
Gui,Submit,NoHide
If TypeChoice = 1
{
	TC = 2
	TL = J
	GuiControl,enable,Ming
	GuiControl,enable,nian
	GuiControl,enable,Vol
	GuiControl,enable,Q
	GuiControl,disable,chubandi
	GuiControl,disable,chubanshe
	GuiControl,disable,chubannian
}
Else If TypeChoice = 2
{
	TC = 1
	TL = M
	GuiControl,Disable,Ming
	GuiControl,disable,nian
	GuiControl,disable,Vol
	GuiControl,disable,Q
	GuiControl,Enable,chubandi
	GuiControl,Enable,chubanshe
	GuiControl,Enable,chubannian
}
Else If TypeChoice = 3
{
	TC = 1
	TL = D
	GuiControl,Disable,Ming
	GuiControl,disable,nian
	GuiControl,disable,Vol
	GuiControl,disable,Q
	GuiControl,Enable,chubandi
	GuiControl,Enable,chubanshe
	GuiControl,Enable,chubannian
}


Return

next:
N++
GuiControl,,n,%n%
GuiControl,,Au1
GuiControl,,Au2
GuiControl,,Au3
GuiControl,,MoreAu,0
GuiControl,,Name
GuiControl,,Ming
GuiControl,,Nian
GuiControl,,Vol
GuiControl,,Q
GuiControl,,Chubandi
GuiControl,,Chubanshe
GuiControl,,Chubannian
GuiControl,,Yema1
GuiControl,,Yema2
GuiControl,focus,n
GuiControl,,result
Return

copy:
Gui,submit,nohide
Gosub,update
Clipboard = %result%
GuiControl,disable,copy
GuiControl,,copy,正在复制
GuiControl,disable,next
GuiControl,,next,正在冷却↑↑↑
GuiControl,show,copygui
GuiControl,,copygui,0
ToolTip,已复制
loop,50
{
	Sleep,1
	GuiControl,,copygui,+2
}
ToolTip
GuiControl,enable,copy
GuiControl,,copy,复制结果
GuiControl,enable,next
GuiControl,,next,下一篇→
GuiControl,Hide,copygui
Return

update:
Gui,Submit,NoHide
If TC = 1
{
	StringLen,Au2Len,Au2
	If Au2Len != 0
		Au2 = ,%A_Space%%Au2%
	StringLen,Au3Len,Au3
	If Au3Len != 0
		Au3 = ,%A_Space%%Au3%
	If MoreAu = 1
		More = ,%A_Space%等
	If MoreAu = 0
		More =
	StringLen,Yema1Len,Yema1
	If Yema1Len != 0
		Yema1 = :%Yema1%
	StringLen,Yema2Len,Yema2
	If Yema2Len != 0
		Yema2 = ~%Yema2%
	GuiControl,,result,[%n%]%Au1%%Au2%%Au3%%More%.%A_Space%%Name%[%TL%].%A_Space%%chubandi%:%chubanshe%,%A_Space%%chubannian%%yema1%%yema2%
}
Else If TC = 2
{
	StringLen,Au2Len,Au2
	If Au2Len != 0
		Au2 = ,%A_Space%%Au2%
	StringLen,Au3Len,Au3
	If Au3Len != 0
		Au3 = ,%A_Space%%Au3%
	If MoreAu = 1
		More = ,%A_Space%等
	If MoreAu = 0
		More =
	StringLen,Yema1Len,Yema1
	If Yema1Len != 0
		Yema1 = :%Yema1%
	StringLen,Yema2Len,Yema2
	If Yema2Len != 0
		Yema2 = ~%Yema2%
	StringLen,VolLen,Vol
	If VolLen != 0
		Vol = ,%Vol%
	StringLen,qLen,q
	If qLen != 0
		q= (%Q%)

	GuiControl,,result,[%n%]%Au1%%Au2%%Au3%%More%.%A_Space%%Name%[%TL%].%A_Space%%ming%.%A_Space%%nian%%Vol%%Q%%Yema1%%Yema2%
}
Return

GuiClose:
OnExit:
Gui, -AlwaysOnTop
MsgBox, 64, 作者信息, 参考文献条目自动生成器 Beta`n`nby 欣宇`n作者博客：鱼鱼 Kevin http://plo.me
ExitApp