;*########AHK脚本文件########
;#**********忄鱼编辑制作***********#
;#**作者博客：http://poolao.info **#
;#**联系邮箱：love@poolao.info **#
;##########################
#NoTrayIcon
#SingleInstance force		;强制重新载入新脚本

Loop{
	Sleep,600000
	battinfo := GetPowerStatus(acLineStatus)
	If acLineStatus = 0
	{
		If battinfo < 45
			Break
	}
}
MsgBox, 16, 电池电量不足！！！, 电池电量不足，请注意保存当前工作。`n目前剩余电量：%battinfo%％`n将于5分钟后强制关闭计算机。`n10秒钟后窗口自动关闭。, 10
Sleep,300000
MsgBox, 48, 即将强制关机！！！, 即将强制关机！`n如无响应将在10秒钟后关机。, 10
Shutdown,5
Return

GetPowerStatus(ByRef acLineStatus)
{
    VarSetCapacity(powerstatus, 1+1+1+1+4+4)
    success := DllCall("kernel32.dll\GetSystemPowerStatus", "uint", &powerstatus)
    acLineStatus:=ReadInteger(&powerstatus,0,1,false)
    battFlag:=ReadInteger(&powerstatus,1,1,false)
    battLifePercent:=ReadInteger(&powerstatus,2,1,false)
    battLifeTime:=ReadInteger(&powerstatus,4,4,false)
    battFullLifeTime:=ReadInteger(&powerstatus,8,4,false)
   Return battLifePercent
}

ReadInteger( p_address, p_offset, p_size, p_hex=true )
{
    value = 0
    old_FormatInteger := a_FormatInteger
    if ( p_hex )
        SetFormat, integer, hex
    else
        SetFormat, integer, dec
    loop, %p_size%
        value := value+( *( ( p_address+p_offset )+( a_Index-1 ) ) << ( 8* ( a_Index-1 ) ) )
    SetFormat, integer, %old_FormatInteger%
    return, value
}


