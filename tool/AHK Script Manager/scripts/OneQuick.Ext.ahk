/*

v.1.5.2.2
新增：在eclipse的svn对比工具时，按insert将不同点替换成旧内容

v.1.5.2.1
优化wpf时候，ctrl+shift+f,自动跳到第一个sheet的最上面，有时不生效的bug

v1.5.2
wpf时候，ctrl+shift+f,自动跳到第一个sheet的最上面，然后搜索

v1.5.1
添加使用chrome时候，ctrl+shift+x 映射为 F12打开控制台
*/

GroupAdd, EclipseAllWindow , ahk_class #32770
GroupAdd, EclipseAllWindow , ahk_class SWT_Window0

/*
----------------------------------------------------------------------------------------------------------------------使用WPS表格时候的快捷键----------------------------------------------------------------------------------------------------------------------
*/
#IfWinActive ahk_exe et.exe
 /*
使用WPS表格时，按Ctrl+Shift+F 返回首页并打开搜索
*/
^+f::
		title := Sys.Win.Title()
	indexSubmit := InStr(title,"WPS 表格")
	if(indexSubmit != 0){
			MouseClick, left, 12, 1005 ;返回第一个页面
			MouseClick, left, 107, 1010 ;返回第一个页面
			MouseClick, left, 107, 1010 ;返回第一个页面
			MouseClick, left, 121, 902 ;随便点一个表格框
			Send ^{Home}
			Send ^f
			Send ^v
			Send ^a
	}else{
			Send ^+f
	}	
return

#IfWinActive
/*
------------------------------------------------------------------------------------------------------------------使用WPS表格时候结束------------------------------------------------------------------------------------------------------------------
*/

 /*
----------------------------------------------------------------------------------------------------------------------使用chrome时候的快捷键----------------------------------------------------------------------------------------------------------------------
*/
#IfWinActive ahk_exe chrome.exe
 /*
使用chrome，按alt+2  查看chrome下一处搜索
*/
!2::
	MouseGetPos, xpos, ypos ;获取鼠标当前的位置
	MouseClick, left, 1851, 111, ,0 ;下一个
	MouseMove, %xpos%, %ypos%, 0 ;移动鼠标到原来位置
return

 /*
使用chrome，按alt+1  查看chrome上一处搜索
*/
!1::
	MouseGetPos, xpos, ypos ;获取鼠标当前的位置
	MouseClick, left, 1824, 108, ,0 ;上一个
	MouseMove, %xpos%, %ypos%, 0 ;移动鼠标到原来位置
return

 /*
使用chrome，按ctrl+f  自动搜索选中文字
*/
^f::
	ClipboardOld = %clipboard% ;保留剪贴板中原来的内容
	Send ^c
	Send ^f
	Send ^v
	Send ^a
	clipboard = %ClipboardOld%
return

 /*
使用chrome时，按Alt+v,查看框架源代码
*/
!v::
	MouseClick, right
	Send vv{enter}
return

 /*
使用chrome时，按Ctrl+Shift+X,查看框架源代码
*/
^+x::
	Send {F12}
return


#IfWinActive
/*
---------------------------------------------------------------------------------------------------使用chrome时候结束----------------------------------------------------------------------------
*/


/*
---------------------------------------------------------------------------------------------------使用EclipseAllWindow的时候（该窗口组定义在  本文件头  中）----------------------------------------------------------------------------------------------------------------------
*/
#IfWinActive ahk_group EclipseAllWindow

/*
在eclipse里面，win+e打开当前文件所在路径，并定位在该文件上
*/
#e::
	WinGet, active_id, ID, A    ;获取当前激活页面的id并赋值给active_id变量
	WinGetClass, this_class, ahk_id %active_id%		;获取窗口class
	WinGetTitle, this_title, ahk_id %active_id%		;获取窗口title标题
	
	index := InStr(this_title, " - ")
	
	mic := SubStr(this_title, 1, index-1)
	dir := SubStr(this_title, index+3)
	dir := SubStr(dir, 1, StrLen(file_name)-10 )
	dir := RegExReplace(dir, "\/", "\")     ;将匹配的字符串替换成"123"，并返回替换后的值
	
	real_dir = ""
	
	if(mic == "mic_0"){
		real_dir = D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\%dir%
	}else if(mic == "mic_1"){
		real_dir = D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64_tag1\workspace\microcredit-parent-yxjr-v2_tag\%dir%
	}else if(mic == "mic_2"){
		real_dir = D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64_tag2\workspace\microcredit-parent-yxjr-v2_tag2\%dir%
	}else if(mic == "mic_3"){
		real_dir = D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64_tag3\workspace\microcredit-parent-yxjr-v2_tag3\%dir%
	}else if(mic == "mic_end"){
		real_dir = D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64_tagEnd\workspace\microcredit-parent-yxjr-v2_tagEnd\%dir%
	}else{
		tooltip,请切换到java视图
		sleep, 1000
		tooltip,
		return
	}
	
	open_dir(real_dir)	;打开文件路径
	
return

/*
在eclipse里面，win+w打开主干合并代码的文件目录
*/
#w::
	WinGet, active_id, ID, A    ;获取当前激活页面的id并赋值给active_id变量
	WinGetClass, this_class, ahk_id %active_id%		;获取窗口class
	WinGetTitle, this_title, ahk_id %active_id%		;获取窗口title标题
	
	index := InStr(this_title, " - ")
	
	mic := SubStr(this_title, 1, index-1)
	dir := SubStr(this_title, index+3)
	dir := SubStr(dir, 1, StrLen(file_name)-10 )
	dir := RegExReplace(dir, "\/", "\")     ;将匹配的字符串替换成"123"，并返回替换后的值
	
	real_dir = D:\Work\PeteCat\eclipse-jee-主干_mic代码_合并\%dir%
	
	open_dir(real_dir)	;打开文件路径
	
return

/*
Ctrl+CapsLock --》 Ctrl + PgDn（下一个视图）
*/
^CapsLock::
	Send ^{PgDn}
return

/*
Ctrl+Shift+CapsLock --》 Ctrl + PgUp（上一个视图）
*/
^+CapsLock::
	Send ^{PgUp}
return

 /*
使用eclipse时，按Alt+Shift+D执行Ctrl+Shift+O  导包
*/
+!D::
	Send ^+o
return

 /*
使用eclipse时，按Ctrl+B执行Ctrl+O
*/
^B::
	Send ^o
return

 /*
使用eclipse时，按Alt+`执行Alt+/
*/
!`::
	Send !/
return

 /*
使用eclipse时，按ctrl+tab在两个括号间切换
*/
^Tab::
	Send ^+p
return

 /*
在eclipse的svn对比工具时，按insert将不同点替换成旧内容
*/
Insert::
	MouseGetPos, xpos, ypos ;获取鼠标当前的位置
	title := Sys.Win.Title()
	indexSVN := InStr(title,"的比较")
	indexSVN2:= InStr(title,"SVN")
	indexJava := InStr(title,".java")
	indexXml := InStr(title,".xml")
	indexJsp  := InStr(title,".jsp")
	indexJs  := InStr(title,".js")
	if(indexSVN != 0 || indexSVN2 != 0 ){
		if(indexJsp != 0 && indexJs != 0){
			indexJs := 0
		}	
		if(indexJava != 0 `|`| indexJs != 0){
			MouseClick, left, 1769, 391, ,0 ;旧svn替换
		}
		if(indexXml != 0 `|`| indexJsp != 0 `|`| indexProperties != 0){
			MouseClick, left, 1769, 121, ,0 ;旧svn替换
		}
		MouseMove, %xpos%, %ypos%, 0 ;移动鼠标到原来位置
				Send ^s
	}else{
		Send {Insert}
	}
return

 /*
使用eclipse时，按]  查看svn同步的下一处不同
*/
]::
	title := Sys.Win.Title()
	indexSubmit := InStr(title,"提交")
	if(indexSubmit != 0){	;提交时候的
		MouseGetPos, xpos, ypos ;获取鼠标当前的位置
		MouseClick, left, 1833, 114, ,0 ;下一处不同
		MouseMove, %xpos%, %ypos%, 0 ;移动鼠标到原来位置
	}else{
		indexSubmit2 := InStr(title,"Workspace")
		if(indexSubmit2 != 0){  ;synchronize时候的
			  MouseGetPos, xpos, ypos ;获取鼠标当前的位置
			  title := Sys.Win.Title()
			  indexSVN := InStr(title,"的比较")
			  indexSVN2:= InStr(title,"SVN")
			  indexJava := InStr(title,".java")
			  indexXml := InStr(title,".xml")
			  indexJsp  := InStr(title,".jsp")
			  indexJs  := InStr(title,".js")
			  indexProperties  := InStr(title,".properties")
			  if(indexSVN != 0 || indexSVN2 != 0 ){
					  if(indexJsp != 0 && indexJs != 0){
									indexJs := 0
					  }	
					  if(indexJava != 0 `|`| indexJs != 0){
									;MouseClick, left, 1802, 391, ,0 ;下一处不同
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_next.bmp
									if ErrorLevel = 2 
									MsgBox 不能实施搜索。
									else if ErrorLevel = 1 
									1==1
									;MsgBox 未在屏幕上寻得图标。
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;下一处不同
									}
					  }
					  if(indexXml != 0 `|`| indexJsp != 0 `|`| indexProperties != 0){
									;MouseClick, left, 1799, 119, ,0 ;下一处不同
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_next.bmp
									if ErrorLevel = 2 
									MsgBox 不能实施搜索。
									else if ErrorLevel = 1 
									1==1
									;MsgBox 未在屏幕上寻得图标。
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;下一处不同
									}
					  }
					  MouseMove, %xpos%, %ypos%, 0 ;移动鼠标到原来位置
				  }
		}else{
				Send ]
		}
	}	
return

 /*
使用eclipse时，按[  查看svn同步的上一处不同
*/
[::
	title := Sys.Win.Title()
	indexSubmit := InStr(title,"提交")
	if(indexSubmit != 0){
		MouseGetPos, xpos, ypos ;获取鼠标当前的位置
		MouseClick, left, 1857, 114, ,0 ;上一处不同
		MouseMove, %xpos%, %ypos%, 0 ;移动鼠标到原来位置
	}else{
		indexSubmit2 := InStr(title,"Workspace")
		if(indexSubmit2 != 0){
			  MouseGetPos, xpos, ypos ;获取鼠标当前的位置
			  title := Sys.Win.Title()
			  indexSVN := InStr(title,"的比较")
			  indexSVN2:= InStr(title,"SVN")
			  indexJava := InStr(title,".java")
			  indexXml := InStr(title,".xml")
			  indexJsp  := InStr(title,".jsp")
			  indexJs  := InStr(title,".js")
			  if(indexSVN != 0 || indexSVN2 != 0 ){
					  if(indexJsp != 0 && indexJs != 0){
									indexJs := 0
					  }	
					  if(indexJava != 0 `|`| indexJs != 0){
									;MouseClick, left, 1822, 391, ,0 ;上一处不同
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_previous.bmp
									if ErrorLevel = 2 
									MsgBox 不能实施搜索。
									else if ErrorLevel = 1 
									1==1
									;MsgBox 未在屏幕上寻得图标。
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;上一处不同
									}
					  }
					  if(indexXml != 0 `|`| indexJsp != 0 `|`| indexProperties != 0){
									;MouseClick, left, 1822, 121, ,0 ;上一处不同
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_previous.bmp
									if ErrorLevel = 2 
									MsgBox 不能实施搜索。
									else if ErrorLevel = 1 
									1==1
									;MsgBox 未在屏幕上寻得图标。
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;上一处不同
									}
					  }
					  MouseMove, %xpos%, %ypos%, 0 ;移动鼠标到原来位置
				  }
		}else{
		 Send [
		}
	}	
return

#IfWinActive
/*
------------------------------------------------------------------------------------------------------------------使用EclipseAllWindow时候结束
*/

/*
------------------------------------------------------------------------------------------------------------------使用文件资源管理器时候开始----------------------------------------------------------------------------
*/
#IfWinActive ahk_exe explorer.exe

/*
新建文件夹，并以当前日期自动命名
*/
#t::
	now_dir:= A_Desktop
	;~ WinGetClass class, ahk_id WinExist("A")
	WinGet, active_id, ID, A    ;获取当前激活页面的id并赋值给active_id变量
	WinGetClass, this_class, ahk_id %active_id%		;获取窗口class
	WinGetTitle, this_title, ahk_id %active_id%		;获取窗口title标题

	 if (this_class ~= "(Cabinet|Explore)WClass") {
		Send,!d		;alt+d 定位到地址栏
		ControlGetText,now_dir,Edit1,A	;从控件获取内容
		Send, {Enter}
	}
	dir_name=%A_YYYY%-%A_MM%-%A_DD%_	;拼接时间
	dir_name_site=%dir_name%		    ;临时存储
	final_dir_name=%now_dir%\%dir_name%
	tmp_dir_name=%final_dir_name%
	while InStr(FileExist(tmp_dir_name), "D")	;判断文件是否存在
	{
		end_fix:=Chr(96+A_index)
		dir_name_site=%dir_name%%end_fix%
		tmp_dir_name=%final_dir_name%%end_fix%
	}
	final_dir_name=%tmp_dir_name%
	FileCreateDir, %final_dir_name%		;创建目录
	MouseClick, left
	Sleep 300
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	Send, %dir_name_site%
return

#IfWinActive
/*
------------------------------------------------------------------------------------------------------------------使用文件资源管理器时候结束----------------------------------------------------------------------------
*/

 /*
-----------------------------------------------------------任何时候---------------------------------------------
*/


/*
 * @Description: alt+m 切换当前窗口的最大化/最小化
 * @author XuDong
 */
WinStatus:=0		
!m::		
if WinStatus=0		
	{				 
		WinMaximize , A				 
		WinStatus:=1		
	}		
else		
	{				 
		WinRestore ,A				 
		WinStatus:=0		
	}		
return

/*
 * @Description: alt+n 最小化当前激活窗口
 * @author XuDong
 */
!n::		
	WinMinimize, A
return

/*
 * @Description: Win+Esc映射为 alt+F4
 * @author XuDong
 */
#Esc::!F4

/*
 * @Description: alt+A 选中光标所在行所有内容，并把光标定位到末尾
 * @author XuDong
 */
!a::	
	Send {Home}
	Send {Home}	
	Send +{End}
 return		

/*
 * @Description: 键入//n再一个终止符，打开notepad
 * @author XuDong
 */
 :://n::	
	Run notepad	
 return		

/*
 * @Description: //calc打开计算器
 * @author XuDong
 */
	 :://calc::	
	 Run calc
 return		

/*
 * @Description: //f打开百度翻译
 * @author XuDong
 */
 :://f::	
	Run https://fanyi.baidu.com/
 return  
 
 /*
 * @Description: //b打开百度
 * @author XuDong
 */
 :://b::	
	Run https://www.baidu.com/
 return  

/*
 * @Description: win+b 打开sublime_text
 * @author XuDong
 */
 #b::	
	Run D:\Work\Tools\Sublime Text 3\sublime_text.exe 
 return  

/*
 * @Description: win+f 打开everything
 * @author XuDong
 */
 #f::	
	Run D:\SoftWare\Everything-1.4.0.713b.x86-Setup\Everything.exe
 return  

/*
 * @Description: //d打开d盘
 * @author XuDong
 */
 :://d::	
	Run D:\
 return		

/*
 * @Description: //e打开e盘
 * @author XuDong
 */
 :://e::	
	Run E:\
 return 

/*
 * @Description: ctrl+win+c 复制文件路径
 * @author XuDong
 */
^#c::
	send ^c
	sleep,200
	clipboard=%clipboard% ; 这句还是废话一下：windows 复制的时候，剪贴板保存的是“路径”。只是路径不是字符串，只要转换成字符串就可以粘贴出来了。
	tooltip,%clipboard%
	sleep,1000
	tooltip,
return 

/*
 * @Description: ctrl+delete 剪切
 * @author XuDong
 */
^Delete::
	send ^x
return 

/*
 * @Description: ctrl+insert 粘贴
 * @author XuDong
 */
^Insert::
	send ^v
return 

/*
 * @Description: ctrl+\ 复制
 * @author XuDong
 */
^\::
	send ^c
return 

/*
 * @Description: //t 计时器
 * @author XuDong
 */
:://t::
	InputBox, time, 计时器, 请输入一个时间（单位是秒）	; 弹出一个输入框，标题是“计时器”，内容是“请输入一个时间（单位是秒）”
	millisecond := time*1000	; 如果一个变量要做计算的话，一定要像这样写，和平常的算式相比，多了一个冒号。sleep 的时间是按照千分之一秒算的，这里乘以 1000 就变成秒了。
	Sleep,%millisecond%
	MsgBox 计时结束（%time%秒）
return

/*
 * @Description: shift+alt+1 --> ctrl+home
 * @author XuDong
 */
+!1::
	Send ^{Home}
return

/*
 * @Description: shift+alt+1 --> ctrl+end
 * @author XuDong
 */
+!2::
	Send ^{End}
return

/*
 * @Description: win+alt+e  打开所选中的文件路径所在的文件夹，并定位到该文件
 * @author XuDong
 */
 #!e::	
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	Send ^c
	xC_tmp := % Clipboard
	tempPath := RegExMatch(xC_tmp, ".*\\", UnquotedOutputVar)
	tempFile := RegExReplace(xC_tmp, ".*\\")
	run %UnquotedOutputVar%
	Sleep 1000
	Send %tempFile%
return

 /*
按esc切换输入法
*/
~esc::
	; 下方代码可只保留一个
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	; SwitchIME(0x08040804) ; 中文(中国) 简体中文-美式键盘
return

 /*
 win+上滚轮 透明窗口
*/
#WheelUp::
	WinGet, active_id, ID, A    ;获取当前激活页面的id
	WinGet, active_tran, Transparent, A    ;获取当前激活页面的id
	if(active_tran == ""){
		active_tran = 255
	}
	active_tran := active_tran + 10
	if(active_tran >= 255){
		active_tran = 255
	}
	WinSet, Transparent, %active_tran%, ahk_id %active_id%		;修改透明值
return

 /*
win+下滚轮  透明窗口
*/
#WheelDown::
	WinGet, active_id, ID, A    ;获取当前激活页面的id
	WinGet, active_tran, Transparent, A    ;获取当前激活页面的id
	if(active_tran == ""){
		active_tran = 255
	}
	active_tran := active_tran - 10
	if(active_tran <= 0){
		active_tran = 0
	}
	WinSet, Transparent, %active_tran%, ahk_id %active_id%		;修改透明值
return

 /*
输入法切换方法
*/
SwitchIME(dwLayout){
		HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
		ControlGetFocus,ctl,A
		SendMessage,0x50,0,HKL,%ctl%,A
}

/*
打开文件路径
*/
open_dir(real_dir){
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	Send {Shift}
	xC_tmp := real_dir
	tempPath := RegExMatch(xC_tmp, ".*\\", UnquotedOutputVar)
	tempFile := RegExReplace(xC_tmp, ".*\\")
	run %UnquotedOutputVar%
	Sleep 1000
	Send %tempFile%
}

/*
从50w身份证数据中获取身份证
*/
 getIdCard(){
	ahkPath = %A_ScriptDir%
		idCardPath := SubStr(ahkPath, 1 , StrLen(ahkPath)-31) "tool\ReadFile\IdCardRandom_50W.txt"
	Random, idCardRand, 000000, 500000
	FileReadLine, idCardLine, %idCardPath%, %idCardRand%
	return %idCardLine%
}


 /*
系统类
*/
class Sys
	{
	 class Win
		 {
			 ID()
			 {
				 WinGet, winID, ID, A
				 return % winID
			 }

			 Title(winID := "")
			 {
				 if (winID == "")
						 winID := this.ID()
				 WinGetTitle, title, ahk_id %winID%
				 return % title
			 }
		 }
	}

/*
双击PrintScreen息屏
*/
~PrintScreen::
If Home_Presses > 0
{
    Home_Presses += 1
    Return
}
Home_Presses = 1
SetTimer, KeyHome, 300
Return
 
KeyHome:
SetTimer, KeyHome, Off
If Home_Presses = 2
{
    Sleep 1000
	SendMessage, 0x112, 0xF170, 2,, Program Manager
}
Home_Presses = 0


/*
按住CapsLock和左键拖动当前窗口
*/
CapsLock & LButton::
CoordMode, Mouse ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0 ; Only if the window isn't maximized 
SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return
 
EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
	if EWD_LButtonState = U ; Button has been released, so drag is complete.
	{
	SetTimer, EWD_WatchMouse, off
	return
	}
GetKeyState, EWD_EscapeState, Escape, P
	if EWD_EscapeState = D ; Escape has been pressed, so drag is cancelled.
	{
	SetTimer, EWD_WatchMouse, off
	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	return
	}
	; Otherwise, reposition the window to match the change in mouse coordinates
	; caused by the user having dragged the mouse:
	CoordMode, Mouse
	MouseGetPos, EWD_MouseX, EWD_MouseY
	WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
	SetWinDelay, -1 ; Makes the below move faster/smoother.
	WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
	EWD_MouseStartX := EWD_MouseX ; Update for the next timer-call to this subroutine.
	EWD_MouseStartY := EWD_MouseY
return







 /*
 * f12::ExitApp ;f12退出	
 * f11::Pause ;暂停
 */


/*
 * @Description: 键入//n，打开notepad  （不需要终止符）
 * @author XuDong

 :*://n::	
	Run notepad	
 return		

 */