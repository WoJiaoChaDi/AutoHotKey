#SingleInstance force
#InstallKeybdHook
#NoTrayIcon

+F9::
Send {VKAD}
Return

+F10::
Send {VKAE}
Return

+F11::
Send {VKAF}
Return

+F12::
Run,C:\MyProgram\AutoSave.vbs
Return

+F1::
Send {Browser_Home}
Return

+F2::
Send {Browser_Stop}
Return

+F3::
Send {Browser_Search}
Return

+F4::
Process,exist,magnify.exe
If ErrorLevel = 0
Run,%windir%\system32\magnify.exe
Else
Process,close,magnify.exe
Return

+F5::
Process,exist,foobar2000.exe
If errorlevel = 0
Run,C:\Foobar2000\foobar2000.exe,min
Else
WinClose, ahk_pid %ErrorLevel%
Return

+F6::
Send {Media_Prev}
Return

+F7::
Send {Media_Next}
Return

+F8::
Send {Media_Play_Pause}
Return

