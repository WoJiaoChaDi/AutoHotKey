/*

v.1.5.2.2
��������eclipse��svn�Աȹ���ʱ����insert����ͬ���滻�ɾ�����

v.1.5.2.1
�Ż�wpfʱ��ctrl+shift+f,�Զ�������һ��sheet�������棬��ʱ����Ч��bug

v1.5.2
wpfʱ��ctrl+shift+f,�Զ�������һ��sheet�������棬Ȼ������

v1.5.1
���ʹ��chromeʱ��ctrl+shift+x ӳ��Ϊ F12�򿪿���̨
*/

GroupAdd, EclipseAllWindow , ahk_class #32770
GroupAdd, EclipseAllWindow , ahk_class SWT_Window0

/*
----------------------------------------------------------------------------------------------------------------------ʹ��WPS���ʱ��Ŀ�ݼ�----------------------------------------------------------------------------------------------------------------------
*/
#IfWinActive ahk_exe et.exe
 /*
ʹ��WPS���ʱ����Ctrl+Shift+F ������ҳ��������
*/
^+f::
		title := Sys.Win.Title()
	indexSubmit := InStr(title,"WPS ���")
	if(indexSubmit != 0){
			MouseClick, left, 12, 1005 ;���ص�һ��ҳ��
			MouseClick, left, 107, 1010 ;���ص�һ��ҳ��
			MouseClick, left, 107, 1010 ;���ص�һ��ҳ��
			MouseClick, left, 121, 902 ;����һ������
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
----------------------------------------------------------------------------------------------------------------------ʹ��chromeʱ��Ŀ�ݼ�----------------------------------------------------------------------------------------------------------------------
*/
#IfWinActive ahk_exe chrome.exe
 /*
ʹ��chrome����alt+2  �鿴chrome��һ������
*/
!2::
	MouseGetPos, xpos, ypos ;��ȡ��굱ǰ��λ��
	MouseClick, left, 1851, 111, ,0 ;��һ��
	MouseMove, %xpos%, %ypos%, 0 ;�ƶ���굽ԭ��λ��
return

 /*
ʹ��chrome����alt+1  �鿴chrome��һ������
*/
!1::
	MouseGetPos, xpos, ypos ;��ȡ��굱ǰ��λ��
	MouseClick, left, 1824, 108, ,0 ;��һ��
	MouseMove, %xpos%, %ypos%, 0 ;�ƶ���굽ԭ��λ��
return

 /*
ʹ��chrome����ctrl+f  �Զ�����ѡ������
*/
^f::
	ClipboardOld = %clipboard% ;������������ԭ��������
	Send ^c
	Send ^f
	Send ^v
	Send ^a
	clipboard = %ClipboardOld%
return

 /*
ʹ��chromeʱ����Alt+v,�鿴���Դ����
*/
!v::
	MouseClick, right
	Send vv{enter}
return

 /*
ʹ��chromeʱ����Ctrl+Shift+X,�鿴���Դ����
*/
^+x::
	Send {F12}
return


#IfWinActive

/*
---------------------------------------------------------------------------------------------------ʹ��EclipseAllWindow��ʱ�򣨸ô����鶨����  ���ļ�ͷ  �У�----------------------------------------------------------------------------------------------------------------------
*/
#IfWinActive ahk_group EclipseAllWindow

/*
Ctrl+CapsLock --�� Ctrl + PgDn����һ����ͼ��
*/
^CapsLock::
	Send ^{PgDn}
return

/*
Ctrl+Shift+CapsLock --�� Ctrl + PgUp����һ����ͼ��
*/
^+CapsLock::
	Send ^{PgUp}
return

 /*
ʹ��eclipseʱ����Alt+Shift+Dִ��Ctrl+Shift+O  ����
*/
+!D::
	Send ^+o
return

 /*
ʹ��eclipseʱ����Ctrl+Bִ��Ctrl+O
*/
^B::
	Send ^o
return

 /*
ʹ��eclipseʱ����Alt+`ִ��Alt+/
*/
!`::
	Send !/
return

 /*
ʹ��eclipseʱ����ctrl+tab���������ż��л�
*/
^Tab::
	Send ^+p
return

 /*
��eclipse��svn�Աȹ���ʱ����insert����ͬ���滻�ɾ�����
*/
Insert::
	MouseGetPos, xpos, ypos ;��ȡ��굱ǰ��λ��
	title := Sys.Win.Title()
	indexSVN := InStr(title,"�ıȽ�")
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
			MouseClick, left, 1769, 391, ,0 ;��svn�滻
		}
		if(indexXml != 0 `|`| indexJsp != 0 `|`| indexProperties != 0){
			MouseClick, left, 1769, 121, ,0 ;��svn�滻
		}
		MouseMove, %xpos%, %ypos%, 0 ;�ƶ���굽ԭ��λ��
				Send ^s
	}else{
		Send {Insert}
	}
return

 /*
ʹ��eclipseʱ����]  �鿴svnͬ������һ����ͬ
*/
]::
	title := Sys.Win.Title()
	indexSubmit := InStr(title,"�ύ")
	if(indexSubmit != 0){	;�ύʱ���
		MouseGetPos, xpos, ypos ;��ȡ��굱ǰ��λ��
		MouseClick, left, 1829, 119, ,0 ;��һ����ͬ
		MouseMove, %xpos%, %ypos%, 0 ;�ƶ���굽ԭ��λ��
	}else{
		indexSubmit2 := InStr(title,"Workspace")
		if(indexSubmit2 != 0){  ;synchronizeʱ���
			  MouseGetPos, xpos, ypos ;��ȡ��굱ǰ��λ��
			  title := Sys.Win.Title()
			  indexSVN := InStr(title,"�ıȽ�")
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
									;MouseClick, left, 1802, 391, ,0 ;��һ����ͬ
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_next.bmp
									if ErrorLevel = 2 
									MsgBox ����ʵʩ������
									else if ErrorLevel = 1 
									1==1
									;MsgBox δ����Ļ��Ѱ��ͼ�ꡣ
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;��һ����ͬ
									}
					  }
					  if(indexXml != 0 `|`| indexJsp != 0 `|`| indexProperties != 0){
									;MouseClick, left, 1799, 119, ,0 ;��һ����ͬ
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_next.bmp
									if ErrorLevel = 2 
									MsgBox ����ʵʩ������
									else if ErrorLevel = 1 
									1==1
									;MsgBox δ����Ļ��Ѱ��ͼ�ꡣ
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;��һ����ͬ
									}
					  }
					  MouseMove, %xpos%, %ypos%, 0 ;�ƶ���굽ԭ��λ��
				  }
		}else{
				Send ]
		}
	}	
return

 /*
ʹ��eclipseʱ����[  �鿴svnͬ������һ����ͬ
*/
[::
	title := Sys.Win.Title()
	indexSubmit := InStr(title,"�ύ")
	if(indexSubmit != 0){
		MouseGetPos, xpos, ypos ;��ȡ��굱ǰ��λ��
		MouseClick, left, 1848, 121, ,0 ;��һ����ͬ
		MouseMove, %xpos%, %ypos%, 0 ;�ƶ���굽ԭ��λ��
	}else{
		indexSubmit2 := InStr(title,"Workspace")
		if(indexSubmit2 != 0){
			  MouseGetPos, xpos, ypos ;��ȡ��굱ǰ��λ��
			  title := Sys.Win.Title()
			  indexSVN := InStr(title,"�ıȽ�")
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
									;MouseClick, left, 1822, 391, ,0 ;��һ����ͬ
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_previous.bmp
									if ErrorLevel = 2 
									MsgBox ����ʵʩ������
									else if ErrorLevel = 1 
									1==1
									;MsgBox δ����Ļ��Ѱ��ͼ�ꡣ
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;��һ����ͬ
									}
					  }
					  if(indexXml != 0 `|`| indexJsp != 0 `|`| indexProperties != 0){
									;MouseClick, left, 1822, 121, ,0 ;��һ����ͬ
									
									ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\svn_previous.bmp
									if ErrorLevel = 2 
									MsgBox ����ʵʩ������
									else if ErrorLevel = 1 
									1==1
									;MsgBox δ����Ļ��Ѱ��ͼ�ꡣ
									else{
											xa := OutputVarXA + 10
											ya := OutputVarYA
											MouseClick, left,  %xa%, %ya%, ,0	;��һ����ͬ
									}
					  }
					  MouseMove, %xpos%, %ypos%, 0 ;�ƶ���굽ԭ��λ��
				  }
		}else{
		 Send [
		}
	}	
return

#IfWinActive



 /*
-----------------------------------------------------------�κ�ʱ��---------------------------------------------
*/


/*
 * @Description: alt+m �л���ǰ���ڵ����/��С��
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
 * @Description: alt+n ��С����ǰ�����
 * @author XuDong
 */
!n::		
	WinMinimize, A
return

/*
 * @Description: Win+Escӳ��Ϊ alt+F4
 * @author XuDong
 */
#Esc::!F4

/*
 * @Description: alt+A ѡ�й���������������ݣ����ѹ�궨λ��ĩβ
 * @author XuDong
 */
!a::	
	Send {Home}
	Send {Home}	
	Send +{End}
 return		

/*
 * @Description: ����//n��һ����ֹ������notepad
 * @author XuDong
 */
 :://n::	
	Run notepad	
 return		

/*
 * @Description: //calc�򿪼�����
 * @author XuDong
 */
	 :://calc::	
	 Run calc
 return		

/*
 * @Description: //f�򿪰ٶȷ���
 * @author XuDong
 */
 :://f::	
	Run https://fanyi.baidu.com/
 return  
 
 /*
 * @Description: //b�򿪰ٶ�
 * @author XuDong
 */
 :://b::	
	Run https://www.baidu.com/
 return  

/*
 * @Description: win+b ��sublime_text
 * @author XuDong
 */
 #b::	
	Run E:\software\Sublime Text 2\sublime_text.exe  
 return  

/*
 * @Description: win+f ��everything
 * @author XuDong
 */
 #f::	
	Run D:\SoftWare\Everything-1.4.0.713b.x86-Setup\Everything.exe
 return  

/*
 * @Description: //d��d��
 * @author XuDong
 */
 :://d::	
	Run D:\
 return		

/*
 * @Description: //e��e��
 * @author XuDong
 */
 :://e::	
	Run E:\
 return 

/*
 * @Description: ctrl+win+c �����ļ�·��
 * @author XuDong
 */
^#c::
	send ^c
	sleep,200
	clipboard=%clipboard% ; ��仹�Ƿϻ�һ�£�windows ���Ƶ�ʱ�򣬼����屣����ǡ�·������ֻ��·�������ַ�����ֻҪת�����ַ����Ϳ���ճ�������ˡ�
	tooltip,%clipboard%
	sleep,1000
	tooltip,
return 

/*
 * @Description: ctrl+delete ����
 * @author XuDong
 */
^Delete::
	send ^x
return 

/*
 * @Description: ctrl+insert ճ��
 * @author XuDong
 */
^Insert::
	send ^v
return 

/*
 * @Description: ctrl+\ ����
 * @author XuDong
 */
^\::
	send ^c
return 

/*
 * @Description: //t ��ʱ��
 * @author XuDong
 */
:://t::
	InputBox, time, ��ʱ��, ������һ��ʱ�䣨��λ���룩	; ����һ������򣬱����ǡ���ʱ�����������ǡ�������һ��ʱ�䣨��λ���룩��
	millisecond := time*1000	; ���һ������Ҫ������Ļ���һ��Ҫ������д����ƽ������ʽ��ȣ�����һ��ð�š�sleep ��ʱ���ǰ���ǧ��֮һ����ģ�������� 1000 �ͱ�����ˡ�
	Sleep,%millisecond%
	MsgBox ��ʱ������%time%�룩
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
 * @Description: win+alt+e  ����ѡ�е��ļ�·�����ڵ��ļ��У�����λ�����ļ�
 * @author XuDong
 */
 #!e::	
	SwitchIME(0x04090409) ; Ӣ��(����) ��ʽ����
	Send ^c
	xC_tmp := % Clipboard
	tempPath := RegExMatch(xC_tmp, ".*\\", UnquotedOutputVar)
	tempFile := RegExReplace(xC_tmp, ".*\\")
	run %UnquotedOutputVar%
	Sleep 1000
	Send %tempFile%
return

 /*
��esc�л����뷨
*/
~esc::
	; �·������ֻ����һ��
	SwitchIME(0x04090409) ; Ӣ��(����) ��ʽ����
	; SwitchIME(0x08040804) ; ����(�й�) ��������-��ʽ����
return

 /*
���뷨�л�����
*/
SwitchIME(dwLayout){
		HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
		ControlGetFocus,ctl,A
		SendMessage,0x50,0,HKL,%ctl%,A
}

/*
��50w���֤�����л�ȡ���֤
*/
 getIdCard(){
	ahkPath = %A_ScriptDir%
		idCardPath := SubStr(ahkPath, 1 , StrLen(ahkPath)-31) "tool\ReadFile\IdCardRandom_50W.txt"
	Random, idCardRand, 000000, 500000
	FileReadLine, idCardLine, %idCardPath%, %idCardRand%
	return %idCardLine%
}

/*
 * @Description: ��ͣ�ű�
 * @author XuDong
ScrollLock::Pause	;��ͣ�ű�
 */

 /*
ϵͳ��
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
 * f12::ExitApp ;f12�˳�	
 * f11::Pause ;��ͣ
 */


/*
 * @Description: ����//n����notepad  ������Ҫ��ֹ����
 * @author XuDong

 :*://n::	
	Run notepad	
 return		

 */