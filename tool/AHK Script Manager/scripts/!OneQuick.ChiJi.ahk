
#IfWinActive ahk_exe TslGame.exe

#IfWinActive

flag = 1

]::
if(flag == 1){
    flag = 0
}else{
    flag = 1
}
return

$Space::  ;跳改成大跳  （需要在游戏设置中添加跳跃键为  '(单引号)）
if( flag == 1){
    Send {' DOWN}{C DOWN}{' UP}{C UP}
}else{
    Send {Space}
}
return

~CapsLock::  ;大小写改为地图按键
if(flag == 1){
    Send M
}else{
}
return

$LButton::  ; 把 F1 键设置为热键 ($ 符号会有助于下面 GetKeyState 的 "P" 模式).
if(flag == 1){
    Loop  ; 由于没有指定数字, 所以这是个无限循环, 直到遇到内部的 "break" 或 "return".
    {
        if not GetKeyState("LButton", "P")  ; 如果此状态为 true, 那么用户实际已经释放了 $LButton 键.
            break  ; 中断循环.
        ; 否则 (由于上面没有 "中断"), 继续点击鼠标.
        Click  ; 在当前指针位置点击鼠标左键.
        MouseMove, 0, 10 , 0, R     ;鼠标下移
    }
}else{
    Click
}
return