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
---------------------------------------------------------------------------------------------------使用EclipseAllWindow的时候（该窗口组定义在  本文件头  中）----------------------------------------------------------------------------------------------------------------------
*/
#IfWinActive ahk_group EclipseAllWindow

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
	if(indexSubmit != 0){   ;提交时候的
		MouseGetPos, xpos, ypos ;获取鼠标当前的位置
		MouseClick, left, 1829, 119, ,0 ;下一处不同
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
		MouseClick, left, 1848, 121, ,0 ;上一处不同
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
 Run E:\software\Sublime Text 2\sublime_text.exe  
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
InputBox, time, 计时器, 请输入一个时间（单位是秒）
        ; 弹出一个输入框，标题是“计时器”，内容是“请输入一个时间（单位是秒）”
millisecond := time*1000
        ; 如果一个变量要做计算的话，一定要像这样写，和平常的算式相比，多了一个冒号。sleep 的时间是按照千分之一秒算的，这里乘以 1000 就变成秒了。
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
输入法切换方法
*/
SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
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
 * @Description: 暂停脚本
 * @author XuDong
ScrollLock::Pause   ;暂停脚本
 */

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