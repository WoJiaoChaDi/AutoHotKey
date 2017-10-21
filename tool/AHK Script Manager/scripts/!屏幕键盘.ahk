#SingleInstance ignore

k_FontSize = 10
k_FontName = Verdana
k_FontStyle = Bold


k_MenuItemHide = 隐藏屏幕键盘
k_MenuItemShow = 显示屏幕键盘

k_Monitor =

cansee = 1

Menu, Tray, Add, %k_MenuItemHide%, k_ShowHide
Menu, Tray, Add, 退出, k_MenuExit
Menu, Tray, Default, %k_MenuItemHide%
Menu, Tray, NoStandard

k_KeyWidth = %k_FontSize%
k_KeyWidth *= 3
k_KeyHeight = %k_FontSize%
k_KeyHeight *= 3
k_KeyMargin = %k_FontSize%
k_KeyMargin /= 6
k_KeyWidthHalf = %k_KeyWidth%
k_KeyWidthHalf /= 2

k_KeySize = w%k_KeyWidth% h%k_KeyHeight%
k_Position = x+%k_KeyMargin% %k_KeySize%

Gui, Font, s%k_FontSize% %k_FontStyle%, %k_FontName%
Gui, -Caption +E0x200 -ToolWindow
TransColor = F1ECED
Gui, Color, %TransColor%


Gui, Add, Button, section %k_KeySize% xm , ~
Gui, Add, Button, %k_Position%, 1
Gui, Add, Button, %k_Position%, 2
Gui, Add, Button, %k_Position%, 3
Gui, Add, Button, %k_Position%, 4
Gui, Add, Button, %k_Position%, 5
Gui, Add, Button, %k_Position%, 6
Gui, Add, Button, %k_Position%, 7
Gui, Add, Button, %k_Position%, 8
Gui, Add, Button, %k_Position%, 9
Gui, Add, Button, %k_Position%, 0
Gui, Add, Button, %k_Position%, -
Gui, Add, Button, %k_Position%, =
Gui, Add, Button, x+%k_KeyMargin% w46 h%k_KeyHeight% , ←

Gui, Add, Button, xm y+%k_KeyMargin% h%k_KeyHeight% w45, Tab  ; Auto-width.
Gui, Add, Button, %k_Position%, Q
Gui, Add, Button, %k_Position%, W
Gui, Add, Button, %k_Position%, E
Gui, Add, Button, %k_Position%, R
Gui, Add, Button, %k_Position%, T
Gui, Add, Button, %k_Position%, Y
Gui, Add, Button, %k_Position%, U
Gui, Add, Button, %k_Position%, I
Gui, Add, Button, %k_Position%, O
Gui, Add, Button, %k_Position%, P
Gui, Add, Button, %k_Position%, [
Gui, Add, Button, %k_Position%, ]
Gui, Add, Button, x+%k_KeyMargin% w31 h%k_KeyHeight%, \

Gui, Add, Button, xm y+%k_KeyMargin% h%k_KeyHeight% w60, CapsLk
Gui, Add, Button, %k_Position%, A
Gui, Add, Button, %k_Position%, S
Gui, Add, Button, %k_Position%, D
Gui, Add, Button, %k_Position%, F
Gui, Add, Button, %k_Position%, G
Gui, Add, Button, %k_Position%, H
Gui, Add, Button, %k_Position%, J
Gui, Add, Button, %k_Position%, K
Gui, Add, Button, %k_Position%, L
Gui, Add, Button, %k_Position%, `;
Gui, Add, Button, %k_Position%, '
Gui, Add, Button, x+%k_KeyMargin% h%k_KeyHeight% w47, Enter

Gui, Add, Button, xm y+%k_KeyMargin% h%k_KeyHeight% w75, LShift
Gui, Add, Button, %k_Position%, Z
Gui, Add, Button, %k_Position%, X
Gui, Add, Button, %k_Position%, C
Gui, Add, Button, %k_Position%, V
Gui, Add, Button, %k_Position%, B
Gui, Add, Button, %k_Position%, N
Gui, Add, Button, %k_Position%, M
Gui, Add, Button, %k_Position%, `,
Gui, Add, Button, %k_Position%, .
Gui, Add, Button, %k_Position%, /
Gui, Add, Button, x+%k_KeyMargin% w63 h%k_KeyHeight%, RShift

Gui, Add, Button, xm y+%k_KeyMargin% h%k_KeyHeight% w45, LCtrl
Gui, Add, Button, h%k_KeyHeight% x+%k_KeyMargin% w40, Win
Gui, Add, Button, h%k_KeyHeight% x+%k_KeyMargin% w40, LAlt
Gui, Add, Button, h%k_KeyHeight% x+%k_KeyMargin% w234, Space
Gui, Add, Button, h%k_KeyHeight% x+%k_KeyMargin% w40, RAlt
Gui, Add, Button, h%k_KeyHeight% x+%k_KeyMargin% w45, RCtrl

Gui, Show
k_IsVisible = y

WinGet, k_ID, ID, A
WinGetPos,,, k_WindowWidth, k_WindowHeight, A

SysGet, k_WorkArea, MonitorWorkArea, %k_Monitor%

k_WindowX = %k_WorkAreaRight%
k_WindowX -= %k_WorkAreaLeft%
k_WindowX -= %k_WindowWidth%
k_WindowX /= 2
k_WindowX += %k_WorkAreaLeft%


k_WindowY = %k_WorkAreaBottom%
k_WindowY -= %k_WindowHeight%

WinMove, A,, %k_WindowX%, %k_WindowY%


WinSet, AlwaysOnTop, On, ahk_id %k_ID%
WinSet, TransColor, %TransColor% 220, ahk_id %k_ID%
WinSet, ExStyle, +0x20, ahk_id %k_ID%



k_n = 1
k_ASCII = 45
Loop
{
	Transform, k_char, Chr, %k_ASCII%
	StringUpper, k_char, k_char
	if k_char not in <,>,^,~,?`,
		Hotkey, ~*%k_char%, k_KeyPress
	if k_ASCII = 93
		break
	k_ASCII++
}
loop{
	sleep,100
	GetKeyState,cap,capslock,T
	ControlClick, CapsLk, ahk_id %k_ID%, , LEFT, 1, %cap%
	MouseGetPos, MosX, MosY
	k_WindowX2 := k_WindowX + k_WindowWidth
	k_WindowY2 := k_WindowY + k_WindowHeight
	if ( MosX > k_WindowX and MosX < k_WindowX2 and MosY > k_WindowY and MosY < k_WindowY2 )
	{
		if (cansee = 1){
		tn = 220
		loop,20{
			sleep,8
			tn := tn - 10
			WinSet, TransColor, %TransColor% %tn%, ahk_id %k_ID%
		}
		cansee = 0
		}
	}
	Else{
		if (cansee = 0){
		tn = 20
		loop,20{
			sleep,8
			tn := tn + 10
			WinSet, TransColor, %TransColor% %tn%, ahk_id %k_ID%
		}
		cansee = 1
		}
	}
}

return

~*Backspace::
ControlClick, ←, ahk_id %k_ID%, , LEFT, 1, D
KeyWait, Backspace
ControlClick, ←, ahk_id %k_ID%, , LEFT, 1, U
return


~*LWin::
~*RWin::
StringTrimLeft, k_ThisHotkey, A_ThisHotkey, 3
ControlClick, %k_ThisHotkey%, ahk_id %k_ID%, , LEFT, 1, D
KeyWait, %k_ThisHotkey%
ControlClick, %k_ThisHotkey%, ahk_id %k_ID%, , LEFT, 1, U
return

~*LShift::
~*RShift::
~*LCtrl::
~*RCtrl::
~*LAlt::
~*RAlt::
StringTrimLeft, k_ThisHotkey, A_ThisHotkey, 2
ControlClick, %k_ThisHotkey%, ahk_id %k_ID%, , LEFT, 1, D
KeyWait, %k_ThisHotkey%
ControlClick, %k_ThisHotkey%, ahk_id %k_ID%, , LEFT, 1, U
return


~*,::
~*'::
~*Space::
~*Enter::
~*Tab::
k_KeyPress:
StringReplace, k_ThisHotkey, A_ThisHotkey, ~
StringReplace, k_ThisHotkey, k_ThisHotkey, *
SetTitleMatchMode, 3
ControlClick, %k_ThisHotkey%, ahk_id %k_ID%, , LEFT, 1, D
KeyWait, %k_ThisHotkey%
ControlClick, %k_ThisHotkey%, ahk_id %k_ID%, , LEFT, 1, U
Return

~*`::
ControlClick, ~, ahk_id %k_ID%, , LEFT, 1, D
KeyWait, %k_ThisHotkey%
ControlClick, ~, ahk_id %k_ID%, , LEFT, 1, U
Return


k_ShowHide:
if k_IsVisible = y
{
	tn = 220
	loop,22{
		sleep,8
		tn := tn - 10
		WinSet, TransColor, %TransColor% %tn%, ahk_id %k_ID%
}
gui,cancel
	Menu, Tray, Rename, %k_MenuItemHide%, %k_MenuItemShow%
	k_IsVisible = n
}
else
{
	gui,show
	tn = 0
		loop,22{
			sleep,8
			tn := tn + 10
			WinSet, TransColor, %TransColor% %tn%, ahk_id %k_ID%
	}
	Menu, Tray, Rename, %k_MenuItemShow%, %k_MenuItemHide%
	k_IsVisible = y
}
return


GuiClose:
k_MenuExit:
ExitApp
