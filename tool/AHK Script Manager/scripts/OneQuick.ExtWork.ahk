/*
-----------------------------------------------------------使用chrome的时候---------------------------------------------
*/

#SingleInstance 

GroupAdd, ChromeAndPLSQL , ahk_exe chrome.exe
GroupAdd, ChromeAndPLSQL , ahk_exe plsqldev.exe

#IfWinActive ahk_exe chrome.exe
 
/*
 * @Description: 房产新增 - 自动表单
 * @author XuDong
 */
 ::``q::
	addFangChan()
 return  

addFangChan(){
	refreshMenu()
	MouseClick, left,  76,  383
	Sleep, 1000
	MouseClick, left,  88,  473
	Sleep, 2000
	MouseClick, left,  1044,  318
	Sleep, 1000
	MouseClick, left,  470,  327
	Sleep, 1000
}

/*
 * @Description: 房产新增 - 自动表单
 * @author XuDong
 */
 ::``qq::
	 addFangChan2()
 return  
 
 addFangChan2(){
	MouseClick, left, 460, 318
	Send {Home}   
	Send +{End}
	Send ^v
	Send ^c
	MouseClick, left, 415, 348 ;所在城市区域
	Send {down}{enter}
	Sleep 500
	MouseClick, left, 518, 348 ;所在城市区域
	Send {down}{enter}
	MouseClick, left, 1629, 420 ;房产用途
	Send {down}{enter}
	MouseClick, left, 1048, 348 ;房屋坐落
	Send ^v
	MouseClick, left, 1054, 419 ;建筑面积（m²）
	Send 155
	MouseClick, left, 999, 624 ;保存
	MouseClick, left, 1051, 660 ;确定
}

/*
 * @Description: 从新建抵押物到内审I
 * @author XuDong
 */
::``qq1::
	addFangChan()
	Send ^v
	addFangChan2()
	fangChanChuPing()
	yeWuShenQing(13581611612)
	neiShen1()
return

/*
 * @Description: 从内审I到用款确认(北京)
 * @author XuDong
 */
::``qq410::
	Send ^{F5}
	Sleep 2000
	;MouseClick, left,  87, 211	;关闭系统菜单
	Sleep, 1000
	addFangChan()
	Send ^v
	addFangChan2()
	fangChanChuPing()
	yeWuShenQing(13581611612)
	neiShen1()
	MouseClick, left, 509, 190	;待办流程
	MouseClick, left, 949, 317	;证件号码
	neiShen11()
	Sleep, 2000
	neiShen2()
	Sleep, 3000
	waiShen()
	Sleep, 3000
	paiZhu()
	Sleep, 3000
	zhongShen()
return

/*
 * @Description: 从内审I到用款确认(广州)
 * @author XuDong
 */
::``qq412::
	Send ^{F5}
	Sleep 2000
	MouseClick, left,  87, 211	;关闭系统菜单
	Sleep, 1000
	addFangChan()
	Send ^v
	addFangChan2()
	fangChanChuPing()
	yeWuShenQing(13500011090)
	neiShen1()
	MouseClick, left, 509, 190	;待办流程
	MouseClick, left, 949, 317	;证件号码
	neiShen11()
	Sleep, 1000
	neiShen2()
	Sleep, 2000
	waiShen()
	Sleep, 2000
	paiZhu()
	Sleep, 2000
	zhongShen()
return
	
/*
 * @Description: 房产初评 - 自动表单
 * @author XuDong
 */
 ::``w::
	fangChanChuPing()
 return  

fangChanChuPing(){
	refreshMenu()
	MouseClick, left, 64, 374 ;担保管理
	Sleep, 1000  ;等待
	MouseClick, left, 75, 486 ;房产初评
	Sleep, 2000  ;等待
	MouseClick, left, 306, 217 ;待评估无房本
	Sleep, 1000  ;等待
	MouseClick, left, 1789, 363 ;选中第一条评估
	Sleep, 3500  ;等待
	
	ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\chuping_fangwuzuobiao.bmp
	if ErrorLevel = 2 
	MsgBox 房产初评_房屋坐标_不能实施搜索。
	else if ErrorLevel = 1 
	MsgBox 房产初评_房屋坐标_未在屏幕上寻得图标。
	else{
		MouseClick, left, %OutputVarX%, %OutputVarY% ;定位
		;MouseClick, left, 1140, 365 ;定位
		Sleep, 800  ;等待
		Send ^+{tab}
		Sleep, 800  ;等待
		sX := OutputVarX - 700
		sY := OutputVarY - 25
		MouseClick, left, %sX%, %sY% ;选中所有权人
		;MouseClick, left, 470, 337 ;选中所有权人
		Send {Home}   
		Send +{End}
		Send ^c
		Send {tab 9}
		Send ^v
		Send {tab 7}
		Send {Home}   
		Send +{End}
		Send 15000 ;系统评估单价（元）
		Send ^{tab}
		Sleep, 4000  ;等待
		Send {enter} ;搜索失败的确定
		Sleep, 500
		MouseClick, left,  234,  175
		Sleep, 500
		MouseClick, left,  365,  336
		Sleep, 500
		MouseClick, left,  365,  336
		Sleep, 500
		Send {tab}{enter}
		Sleep, 500
		
		ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\chuping_tijiao.bmp
		if ErrorLevel = 2 
		MsgBox 房产初评_提交_不能实施搜索。
		else if ErrorLevel = 1 
		MsgBox 房产初评_提交_未在屏幕上寻得图标。
		else{
			MouseClick, left,  %OutputVarXA%, %OutputVarYA%
			Sleep, 100
			Send, {ENTER}
		}
	}
	
}

 /*
 * @Description: 房通贷申请 - 自动表单
 * @author XuDong
 */
 ::``e::
	yeWuShenQing(13581611612)
 return 
 
 yeWuShenQing(ByRef tel){
	refreshMenu()
	MouseClick, left, 50, 459 ;贷款申请
	Sleep, 1000  ;等待
	MouseClick, left, 68, 494 ;房通贷
	Sleep, 2000  ;等待
	MouseClick, left, 207, 246 ;光标定位所有人
	Send {tab}
	Send ^v
	Send {tab 5}{enter}
	Sleep, 1000  ;等待
	MouseClick, left, 510, 367 ;光标定位第一条记录
	Sleep, 500  ;等待
	Send +{tab}+{tab}{enter}
	Sleep, 1500  ;等待 
	MouseClick, left, 477, 277 ;客户渠道
	Send {down}{enter}
	MouseClick, left, 1113, 273 ;客户经理
	Sleep, 1500  ;等待
	MouseClick, left, 690, 471 ;登录名
	Send %tel%{tab}{tab}{tab}{tab}{enter}
	Sleep 300
	MouseClick, left, 763, 519 ;选择第一条记录
	Sleep, 500  ;等待
	MouseClick, left,  1005,  808
	Sleep, 500  ;等待
	MouseClick, left, 507, 331 ;申请金额
	Send 1500000{tab}7{tab}{tab}{tab}{enter}{tab}{tab}{tab}{enter} 
	closeTaskMsg()
}
 
 /*
 * @Description: 内审1 - 自动表单
 * @author XuDong
 */
 ::``1::
	neiShen1()
 return  
 
 neiShen1(){
	refreshMenu()
	MouseClick, left, 65, 432 ;个人中心
	Sleep, 800  ;等待
	MouseClick, left, 76, 466 ;待办流程
	Sleep, 2000  ;等待
	MouseClick, left,  1009,  253 ;搜索
	Sleep, 2500  ;等待
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 1000  ;等待
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2500  ;等待
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 3800  ;等待
	MouseClick, left, 440, 500 ;人民法院公告网 无 401 有
	MouseClick, left, 440, 526 ;执行/失信网 无 401 有
	MouseClick, left, 440, 556 ;中国裁判文书网 无 401 有
	MouseClick, left, 443, 585 ;全国企业信用网 无 401 有
	MouseClick, left, 1872, 242 ;完善客户信息
	openCustInfo()
}

 /*
 * @Description: 内审1后半部分 - 自动表单
 * @author XuDong
 */
 ::``11::
	neiShen11()
 return  
 
 neiShen11(){
	Send {BS}
	Send ^v
	Sleep, 500  ;等待
	Send {enter}
	MouseClick, left, 1355, 491 ;使用客户
	Sleep, 1500  ;等待
	MouseClick, left,  420,  278 ;客户姓名
	Send {Home}   
	Send +{End}{BS}
	Sleep, 100  ;等待
	Send ^`` ;打开粘贴
	Sleep, 100  ;等待
	Send 2 ;第二个
	Sleep, 1000  ;等待
	MouseClick, left, 987, 430 ;保存
	Sleep, 1500  ;等待
	MouseClick, left, 1075, 659 ;否
	Sleep, 1000  ;等待
		
	MouseClick, left, 480, 872 ;借款用途
	Send {down}{Enter}
	
	MouseClick, left, 748, 922 ;提交
	MouseClick, left, 994, 653 ;确定
	closeTaskMsg()
	Sleep, 2000
	MouseClick, left, 1044, 704 ;关闭任务
}

 /*
 * @Description: 内审2 - 自动表单
 * @author XuDong
 */
 ::``2::
	neiShen2()
 return  

neiShen2(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 2000  ;等待
	MouseClick, left, 349, 220 ;tab担保方式
	Sleep, 1000  ;等待
	MouseClick, left, 1620, 352 ;第一个抵押物完善信息
	Sleep, 2000  ;等待
	MouseClick, left, 1035, 367 ;房产获得方式
	Send {down}{enter}
	MouseClick, left, 465, 391 ;房产性质
	Send {down}{enter}
	MouseClick, left, 468, 417 ;规划用途
	Send {down}{enter}
	MouseClick, left, 1033, 417 ;产权证登记日期
	MouseClick, left, 981, 442 ;产权证登记日期 往前两个月
	MouseClick, left
	MouseClick, left
	MouseClick, left
	Sleep, 500  ;等待
	MouseClick, left, 1087, 571 ;产权证登记日期 28日
	MouseClick, left, 474, 470 ;总楼层
	Send 15
	MouseClick, left, 1050, 473 ;所在楼层
	Send 15
	MouseClick, left, 464, 527 ;土地来源
	Send {down}{enter}
	MouseClick, left, 1002, 525 ;是否有土地证 无  960, 525 有
	MouseClick, left, 1573, 528 ;当前是否在押 无
	MouseClick, left, 431, 585 ;是否唯一住房 无
	MouseClick, left, 1000, 578 ;是否满二/五 无
	MouseClick, left, 1575, 584 ;是否需垫资 无
	MouseClick, left, 457, 305 ;复制所有权人
	Send {Home}   
	Send +{End}
	Send ^c
	MouseClick, left, 1608, 304 ;产权证号码
	Send {Home}   
	Send +{End}
	Send ^v
	MouseClick, left, 989, 853 ;保存
	Sleep, 500  ;等待
	MouseClick, left, 1037, 661 ;确定
	Sleep, 500  ;等待
	MouseClick, left, 753, 496 ;提交
	MouseClick, left, 990, 653 ;确定
	Sleep, 2000  ;等待
	Send {enter}
}

/*
 * @Description: 外审 - 自动表单
 * @author XuDong
 */
 ::``22::
	waiShen()
 return  
 
 waiShen(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 5000  ;等待
	MouseClick, left, 469, 659 ;内部结构
	Send {down}{enter}
	MouseClick, left, 1033, 659 ;户型结构
	Send {down}{enter}
	MouseClick, left, 1609, 661 ;装修
	Send {down}{enter}
	MouseClick, left, 463, 686 ;朝向
	Send {down}{enter}
	MouseClick, left, 429, 715 ;房产实际地址与产权证地址是否一致
	MouseClick, left, 1061, 714 ;使用状况
	MouseClick, left, 1569, 710 ;是否有电梯
	MouseClick, left, 431, 742 ;是否有遮挡
	MouseClick, left, 1002, 744 ;是否打通
	MouseClick, left, 1572, 741 ;是否有老年人、残疾人
	MouseClick, left, 378, 845 ;中介名称

	ClipboardOld = %ClipboardAll% ;保留剪贴板中原来的内容
	Clipboard = 链家链家
	Send ^v
	Clipboard = %ClipboardOld% ;恢复剪贴板初始的内容Return
	
	MouseClick, left, 756, 844 ;中介联系方式
	Send 18600000000
	MouseClick, left, 1147, 841 ;单价（元/m²）
	Send 15555
	MouseClick, left, 989, 881 ;保存
	Sleep, 500  ;等待
	MouseClick, left, 1030, 659 ;确定
	Sleep, 1000  ;等待
	MouseClick, left, 938, 492 ;提交
	MouseClick, left, 993, 656 ;提交
	Sleep, 4000  ;等待
	Send {enter}
}

 /*
 * @Description: 派驻风控总监审批 - 自动表单
 * @author XuDong
 */
 ::``3::
	paiZhu()
 return  
 
 paiZhu(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 2000  ;等待
	MouseClick, left, 849, 426 ;提交
	Send {enter}
	Sleep, 2000  ;等待
	MouseClick, left, 1045, 707 ;确定
	Sleep, 2000  ;等待
	Send {enter}
	Sleep, 4000
	MouseClick, left, 1044, 704 ;关闭任务
}

 /*
 * @Description: 评估经理终审 - 自动表单
 * @author XuDong
 */
 ::``33::
	zhongShen()
 return  
 
 zhongShen(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2500  ;等待
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 4000  ;等待
	MouseClick, left, 1560, 842, 2 ;下户快卖价（元）//双击
	Send ^c
	Send {tab}
	Send ^v
	Send {tab}{tab}
	Send ^v
	Send {tab}{tab}{tab}{tab}{enter}
	Send {tab}{tab}{tab}{enter}
	Sleep, 500  ;等待
	Send {enter} 
	;MouseClick, left, 941, 495 ;提交
	
	ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\tijiao.bmp
	if ErrorLevel = 2 
	MsgBox 终评_提交_不能实施搜索。
	else if ErrorLevel = 1 
	MsgBox 终评_提交_未在屏幕上寻得图标。
	else{
		xa := OutputVarX + 40
		ya := OutputVarY
		MouseClick, left,  %xa%, %ya%
		MouseClick, left, %OutputVarX%, %OutputVarY% ;定位
		Sleep, 500  ;等待
	}
	
	MouseClick, left, 987, 655 ;确认
	Sleep, 2000  ;等待
	Send {enter}
}

 /*
 * @Description: 查看流程图 - 自动表单
 * @author XuDong
 */
 ::``43::
	liuChengTu()
 return  
 
 liuChengTu(){
	MouseClick, left,  80,  271
	Sleep, 1000
	MouseClick, left,  94,  360
	Sleep, 1500
	MouseClick, left,  1005,  314
	Sleep, 2500
	MouseClick, left,  1717,  439
}


 /*
 * @Description: 审批经理审批Ⅰ - 自动表单
 * @author XuDong
 */
 ::``4::
	shenPi1()
 return  
 
 shenPi1(){
	MouseClick, left,  1474,  273
	Sleep, 100
	Send, {TAB}{enter}
	Sleep, 2000  ;等待
	MouseClick, left, 1657, 311 ;待办进入第一个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2000  ;等待
	MouseClick, left, 715, 449 ;需要签署的文件
	Send {down}{down}{down}{esc}
	Send {tab}{tab}{tab}{enter}{enter}
	Sleep, 2000  ;等待
	Send {enter}
}

 /*
 * @Description: 审批经理审批Ⅱ - 自动表单
 * @author XuDong
 */
 ::``44::
	shenPi2()
 return  
 
 shenPi2(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2000  ;等待
	MouseClick, left, 346, 217 ;申请信息
	Sleep, 500  ;等待
	
	ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\shenpi_fushuchanpin.bmp
	if ErrorLevel = 2 
	MsgBox 审批2_附属产品_不能实施搜索。
	else if ErrorLevel = 1 
	MsgBox 审批2_附属产品_未在屏幕上寻得图标。
	else{
		;MouseClick, left, 1031, 493 ;附属产品
		xa := OutputVarXA + 100
		ya := OutputVarYA + 15
		MouseClick, left,  %xa%, %ya%
		Sleep, 100
		Send {down}{enter}
		Send {tab}500000 ;授信额度(元)
		
		ImageSearch, OutputVarXB, OutputVarYB, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\shenpi_xuyaoqianshudewenjian.bmp
		if ErrorLevel = 2 
		MsgBox 审批2_需要签署的文件_不能实施搜索。
		else if ErrorLevel = 1 
		MsgBox 审批2_需要签署的文件_未在屏幕上寻得图标。
		else{
			;MouseClick, left, 738, 611 ;需要签署的文件
			xb := OutputVarXB + 300
			yb := OutputVarYB + 15
			MouseClick, left,  %xb%, %yb%
			Send {down}{down}{down}{esc}
			Send {tab}{tab}{enter}{enter}
			Sleep, 2000  ;等待
			Send {enter}
		}	
	}	
}

 /*
 * @Description: 资金专员决定放款渠道 - 自动表单
 * @author XuDong
 */
 ::``444::
	ziJinZhuanYuan()
 return  
 
 ziJinZhuanYuan(){
	MouseClick, left,  1740, 312
	Send {tab}{enter}
	Sleep, 3000  ;等待
	MouseClick, left, 455, 356 ;资金方
	Send {down}{enter}
	MouseClick, left, 1030, 358 ;放款机构
	Send {down}{down}down}{down}{down}{enter}
	MouseClick, left, 1605, 360 ;计划归入资产包
	Send {down}{down}{down}{down}{enter}
	Send {tab}{enter}{enter}
	Sleep, 2000  ;等待
	Send {enter}
}
 
  /*
 * @Description: 用款确认 - 自动表单
 * @author XuDong
 */
 ::``5::
	yongKuanQueRen()
 return  
 
 yongKuanQueRen(){
	MouseClick, left,  1636, 332
	Sleep, 2000  ;等待
	Send, 2{TAB}15
	MouseClick, left,  497,  715
	Sleep, 100
	Send, {DOWN}{ENTER}
	MouseClick, left,  1069,  709
	Sleep, 100
	Send, {DOWN}{DOWN}{ENTER}
	MouseClick, left,  1394,  695
	Send, {TAB}10
	MouseClick, left,  860,  908
	Sleep, 100
	Send, {TAB}
}
 
   /*
 * @Description: 用款批复 - 自动表单
 * @author XuDong
 */
 ::``55::
	yongKuanPiFu()
 return  
 
 yongKuanPiFu(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 2000  ;等待
	MouseClick, left,  800,  955
	Sleep, 100
	Send, {TAB}{ENTER}{ENTER}
}

 /*
 * @Description: 提款申请 - 自动表单
 * @author XuDong
 */
 ::``6::
	tiKuanShenQing()
 return  

tiKuanShenQing(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2500  ;等待
	MouseClick, left, 298, 273 ;合同信息tab
	Send {tab}{tab}{tab}{tab}{tab}{tab}{enter}
	Send {tab}{tab}{tab}{tab}{enter}
	Sleep, 1000  ;等待
	MouseClick, left, 968, 517 ;选中第一个客户账号选择
	MouseClick, left, 987, 797 ;确定
	Send {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{enter}
	Sleep, 1000  ;等待
	MouseClick, left, 924, 537 ;选中第一个客户账号选择
	Sleep, 500  ;等待
	MouseClick, left, 987, 797 ;确定
	Sleep, 500  ;等待
	MouseClick, left, 534, 736 ;授信用途
	Send {down}{enter}
	Send {tab}123
	Send {tab}{tab}{tab}{tab}{enter}{enter}
	Sleep, 2000  ;等待
	closeTaskMsg()
}

 /*
 * @Description: 运营放款等 - 自动表单
 * @author XuDong
 */
 ::``7::
	yunYing()
 return

yunYing(){
	MouseClick, left,  1645,  310
	Sleep, 1500
	MouseClick, left,  201,  526
	Sleep, 100
	Send, {TAB}{SPACE}
	MouseClick, left,  802,  839
	Sleep, 100
	Send, {TAB}{ENTER}
	Sleep, 500
	Send {ENTER}
	Sleep, 1500
	Send {ENTER}
	Sleep, 1000
	Send {ENTER}
}

/*
 * @Description: 垫资面签 - 自动表单
 * @author XuDong
 */
 ::``dz:: 
	dzMianQian()
 return    
 
 dzMianQian(){
	Send {PgDn} 
	Sleep 100
	MouseClick, left, 469, 479
	Send 1{tab}2{tab}3{tab}4{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{space}{tab}{tab}{tab}{tab}6{tab}{tab}7{tab}80000{tab}79999{tab}10{tab}11{tab}1222 2222 2222 22{tab}13{tab}14{tab}15{tab}79888{tab}60000{tab}18{tab}19{tab}59999{tab}21{tab}22{tab}23
	
	MouseClick, left, 318, 244 ; 定位到征信及涉诉情况
	Send {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{space}
	Send {tab}{tab}{tab}{space}
	Send {tab}{tab}{tab}{space}
	Send {tab}{tab}{tab}{space}
	MouseClick, left, 1050, 518 ;房产当前状态
	Send {down}{enter}
	MouseClick, left, 1611, 506 ;使用状态
	Send {down}{enter}
	MouseClick, left, 470, 538 ;权利人证件类型
	Send {down}{enter}
	MouseClick, left, 1029, 538 ;权利人证件号
	Send 421002198005106890
	MouseClick, left, 1574, 547 ;房产所在地区
	Send {down}{enter}
	MouseClick, left, 1663, 547 ;房产所在地区
	Send {down}{enter}
	MouseClick, left, 464, 567 ;房产用途
	Send {down}{enter}
	MouseClick, left, 1600, 574 ;房产性质
	Send {down}{enter}
	MouseClick, left, 1036, 652 ;授信方式
	Send {down}{enter}
	Send {PgUp}
	Sleep, 300  ;等待
	MouseClick, left, 1841, 246 ;新增客户基本信息
	Sleep, 1000  ;等待
	openCustInfo()
}

 /*
 * @Description: 清楚缓存
 * @author XuDong
 */
 ::``hc:: 
	Send ^r
	Sleep, 1500  ;等待
	MouseClick, left, 88, 359 ;系统缓存管理
	Sleep, 1000  ;等待
	MouseClick, left, 310, 257 ;定位到数据字典缓存
	Send {tab}{enter}{tab}{tab}{enter}{tab}{enter}{tab}{enter}{tab}{enter}{tab}{enter}{tab}{enter}
	Sleep, 700  ;等待
	Send ^r
 return    

 /*
 * @Description: 刷新菜单
 * @author XuDong
 */
 refreshMenu(){
	/*
	MouseClick, left, 78, 241 ;刷新菜单
	Sleep, 1000  ;等待
	MouseClick, left, 78, 241 ;刷新菜单
	Sleep, 1000  ;等待
	*/
	ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\caidan_dakai.bmp
	if ErrorLevel = 2 
	MsgBox 菜单_打开_不能实施搜索。
	else if ErrorLevel = 1 
	MsgBox 菜单_打开_未在屏幕上寻得图标。
	else{
		MouseClick, left, %OutputVarX%, %OutputVarY% ;定位
		Sleep, 500  ;等待
	}
 }

 /*
 * @Description: 关闭任务完成窗口
 * @author XuDong
 */
 closeTaskMsg(){
	Sleep, 3000  ;等待
	Send {enter}
 }

 /*
 * @Description: 打开客户信息查询并跳到第四页
 * @author XuDong
 */
 openCustInfo(){
	refreshMenu()
	MouseClick, left, 53, 400 ;菜单-客户信息管理
	Sleep, 1000  ;等待
	MouseClick, left, 75, 439 ;菜单-客户信息
	Sleep, 1500  ;等待
	MouseClick, left, 311, 1021 ;页
	Send {Home}   
	Send +{End}
	Send 4{enter}
	Sleep, 1500  ;等待
	MouseClick, left,  403,  594, 2
	Send ^c
	
	ImageSearch, OutputVarXA, OutputVarYA, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\dangqiantab.bmp
		if ErrorLevel = 2 
		MsgBox 当前tab_不能实施搜索。
		else if ErrorLevel = 1 
		MsgBox 当前tab_未在屏幕上寻得图标。
		else{
			sX := OutputVarXA - 70
			sY := OutputVarYA
			MouseClick, left, %sX%, %sY% ;
		}
 }
 
  /*
 * @Description: 打开oa并登入
 * @author XuDong
 */
 ::``oa::
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	Send ^+n
	Send ^l
	localHttp = http://oa.cdhryx.cn:6900/sso/toLogin.do?loginKey=ftd
	Send %localHttp%
	Send {enter}
	Sleep, 2000  ;等待
	Send {tab}{tab}super{enter}
	Sleep, 500  ;等待
	Send {tab}123456{enter}
	Sleep, 500  ;等待
	Send {tab}{tab}qazwsx{enter}
	Send {enter}
 return
 
 
 
 
 
 
  /*
 * @Description: chrome打开隐身模式，并打开tag页面//定义带参数的方法
 * @author XuDong
 */
 autoLogin(ByRef userId, ByRef urlType, ByRef openType)
 {
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	
	if openType = 0 
	{
		Send ^t
	}
	else
	{
		Send ^+n
	}
	
	Send ^l
	if urlType = 0 
	{
		localHttp = http://localhost:8069/ts/login.do
	}
	else if urlType = 1 
	{
		localHttp = http://localhost:8066/ts/login.do
	}
	else if urlType = 2 
	{
		localHttp = http://localhost:8063/ts/login.do
	}
	else if urlType = 3 
	{
		localHttp = http://localhost:8039/ts/login.do
	}
	else if urlType = 4 
	{
		localHttp = http://www.baidu.com
	}
	Send %localHttp%
	Send {enter}
	Sleep, 1500  ;等待
	Send {tab}
	Send %userId%
	Send {enter}
 }
 

 

 













 
    /*
 * @Description: 隐身登入crs曹日升
 * @author XuDong
 */
 ::``crs:: 
	autoLogin(13501274292, 0, 0)
 return  
 
 ::``1crs:: 
	autoLogin(13501274292, 1, 1)
 return  
 
  ::``2crs:: 
	autoLogin(13501274292, 2, 1)
 return  
 
  ::``3crs:: 
	autoLogin(13501274292, 3, 1)
 return  
 
 
 /*
 * @Description: 隐身登入cqx陈秋晓
 * @author XuDong
 */
 ::``cqx:: 
	autoLogin(13581611612, 0, 0)
 return   
 
 ::``1cqx:: 
	autoLogin(13581611612, 1, 1)
 return   
 
  ::``2cqx:: 
	autoLogin(13581611612, 2, 1)
 return   
 
 ::``3cqx:: 
	autoLogin(13581611612, 3, 1)
 return   
 
 
    /*
 * @Description: 隐身登入cxl陈小磊
 * @author XuDong
 */
 ::``cxl:: 
	autoLogin(13521284135, 0, 0)
 return   
 
 ::``1cxl:: 
	autoLogin(13521284135, 1, 1)
 return   
 
  ::``2cxl:: 
	autoLogin(13521284135, 2, 1)
 return   
 
 ::``3cxl:: 
	autoLogin(13521284135, 3, 1)
 return   


 /*
 * @Description: 隐身登入lzh梁志海
 * @author XuDong
 */
 ::``lzh:: 
	autoLogin(13500011090, 0, 0)
 return   
 
 ::``1lzh:: 
	autoLogin(13500011090, 1, 1)
 return   
 
  ::``2lzh:: 
	autoLogin(13500011090, 2, 1)
 return   
 
 ::``3lzh:: 
	autoLogin(13500011090, 3, 1)
 return   



 /*
 * @Description: 隐身登入lzp吕志鹏
 * @author XuDong
 */
 ::``lzp:: 
	autoLogin(15972997555, 0, 0)
 return 
 
 ::``1lzp:: 
	autoLogin(15972997555, 1, 1)
 return 
 
  ::``2lzp:: 
	autoLogin(15972997555, 2, 1)
 return 
 
 ::``3lzp:: 
	autoLogin(15972997555, 3, 1)
 return 
 
 
    /*
 * @Description: 隐身登入xgr幸国荣
 * @author XuDong
 */
 ::``xgr:: 
	autoLogin(13301206456, 0, 0)
 return 
 
 ::``1xgr:: 
	autoLogin(13301206456, 1, 1)
 return 
 
  ::``2xgr:: 
	autoLogin(13301206456, 2, 1)
 return 
 
 ::``3xgr:: 
	autoLogin(13301206456, 3, 1)
 return 

 
      /*
 * @Description: 隐身登入dam党爱民
 * @author XuDong
 */
  ::``dam:: 
	autoLogin(15130796352, 0, 0)
 return 
 
 ::``1dam:: 
	autoLogin(15130796352, 1, 1)
 return 
 
   ::``2dam:: 
	autoLogin(15130796352, 2, 1)
 return 
 
 ::``3dam:: 
	autoLogin(15130796352, 3, 1)
 return 



 /*
 * @Description: 隐身登入ql齐龙
 * @author XuDong
 */
 ::``qlz:: 
	autoLogin(13701247226, 0, 0)
 return 

 ::``1qlz:: 
	autoLogin(13701247226, 1, 1)
 return 
 
  ::``2qlz:: 
	autoLogin(13701247226, 2, 1)
 return 

 ::``3qlz:: 
	autoLogin(13701247226, 3, 1)
 return 


  /*
 * @Description: 隐身登入tlw田玲昊
 * @author XuDong
 */
 ::``tlw:: 
	autoLogin(18301179489, 0, 0)
 return

 ::``1tlw:: 
	autoLogin(18301179489, 1, 1)
 return
 
  ::``2tlw:: 
	autoLogin(18301179489, 2, 1)
 return

 ::``3tlw:: 
	autoLogin(18301179489, 3, 1)
 return

  /*
 * @Description: 隐身登入pj潘杰
 * @author XuDong
 */
 ::``pjz:: 
	autoLogin(13922236063, 0, 0)
 return

 ::``1pjz:: 
	autoLogin(13922236063, 1, 1)
 return
 
  ::``2pjz:: 
	autoLogin(13922236063, 2, 1)
 return

 ::``3pjz:: 
	autoLogin(13922236063, 3, 1)
 return

  /*
 * @Description: 隐身登入zny张南燕
 * @author XuDong
 */
 ::``zny:: 
	autoLogin(13242030118, 0, 0)
 return

 ::``1zny:: 
	autoLogin(13242030118, 1, 1)
 return
 
  ::``2zny:: 
	autoLogin(13242030118, 2, 1)
 return

 ::``3zny:: 
	autoLogin(13242030118, 3, 1)
 return
 
  /*
 * @Description: 隐身登入sdd孙丹丹
 * @author XuDong
 */
 ::``sdd:: 
	autoLogin(13011893241, 0, 0)
 return

 ::``1sdd:: 
	autoLogin(13011893241, 1, 1)
 return
 
  ::``2sdd:: 
	autoLogin(13011893241, 2, 1)
 return

 ::``3sdd:: 
	autoLogin(13011893241, 3, 1)
 return
 

 
  /*
 * @Description: 董薇
 * @author XuDong
 */
 ::``dwz:: 
	autoLogin(13366186570, 0, 0)
 return

 ::``1dwz:: 
	autoLogin(13366186570, 1, 1)
 return
 
  ::``2dwz:: 
	autoLogin(13366186570, 2, 1)
 return

 ::``3dwz:: 
	autoLogin(13366186570, 3, 1)
 return
 
 #IfWinActive 
 
 

/*
-----------------------------------------------------------使用chrome和PLSQL的时候（该窗口组定义在  ..\OneQuick-master_AutoHotKey\script\OneQuick.ahk  中）---------------------------------------------
*/
 #IfWinActive ahk_group ChromeAndPLSQL
 
	::crs::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13501274292
		Send {Enter}
	return
 
 	::cqx::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13581611612
		Send {Enter}
	return

	::cxl::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13521284135
		Send {Enter}
	return

	::dam::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 15130796352
		Send {Enter}
	return

	::dsz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18611698942
		Send {Enter}
	return

	::dwz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13366186570
		Send {Enter}
	return

	::gfz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18514256561
		Send {Enter}
	return

	::hgz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13601089205
		Send {Enter}
	return

	::hhz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13522217556
		Send {Enter}
	return

	::hmz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13003923034
		Send {Enter}
	return

	::hwj::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18800181757
		Send {Enter}
	return

	::hyl::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18664661876
		Send {Enter}
	return

	::hzz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18612315653
		Send {Enter}
	return

	::jhj::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13132250820
		Send {Enter}
	return

	::lcz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18810551529
		Send {Enter}
	return

	::lmr::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13161716585
		Send {Enter}
	return

	::lyh::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 15810022483
		Send {Enter}
	return

	::lzh::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13500011090
		Send {Enter}
	return

	::lzp::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 15972997555
		Send {Enter}
	return

	::pjz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13922236063
		Send {Enter}
	return

	::qlz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13701247226
		Send {Enter}
	return

	::sygrb::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13321182669
		Send {Enter}
	return

	::tlh::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18301179489
		Send {Enter}
	return

	::tlw::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18301179489
		Send {Enter}
	return

	::tzz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18305405616
		Send {Enter}
	return

	::wdm::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13146664817
		Send {Enter}
	return

	::wxl::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13682658612
		Send {Enter}
	return

	::xgr::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13301206456
		Send {Enter}
	return

	::yjz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18683259087
		Send {Enter}
	return

	::ysz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13810803511
		Send {Enter}
	return

	::ytz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13537712861
		Send {Enter}
	return

	::zdk::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13860107916
		Send {Enter}
	return

	::zhy::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13510209701
		Send {Enter}
	return

	::zlz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 15801502686
		Send {Enter}
	return

	::zny::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13242030118
		Send {Enter}
	return
	
	::sdd::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13011893241
		Send {Enter}
	return
 
  #IfWinActive 
 
 /*
-----------------------------------------------------------使用eclipse的时候---------------------------------------------
*/
 #IfWinActive ahk_class SWT_Window0
 
 /*
 * @Description: 改成m10
 * @author XuDong
 */
 :://m01:: 
	micChangeTo(01)
 return
 
 /*
 * @Description: 改成m10
 * @author XuDong
 */
 :://m10:: 
	micChangeTo(10)
 return

 /*
 * @Description: 改成m12
 * @author XuDong
 */
 :://m12:: 
	micChangeTo(12)
 return

/*
 * @Description: mic修改机构号
 * @author XuDong
 */
micChangeTo(ByRef bchId){
	ClipboardOld = %ClipboardAll% ;保留剪贴板中原来的内容
    Clipboard = COMPANY_IDENTIFICATION
	Send ^+r
	Sleep, 200  ;等待
	Send microcredit{enter}
	Sleep, 100  ;等待
	Send ^f
	Sleep, 200  ;等待
	Send ^v{enter}{esc}
	Sleep, 200  ;等待
	Send ^d
	Send ^+{enter}
	Sleep, 200  ;等待
	Send ^v`=M
	Send %bchId%
	Send ^s
	Clipboard = %ClipboardOld% ;恢复剪贴板初始的内容Return
}

#IfWinActive

 
 /*
-----------------------------------------------------------任何时候---------------------------------------------
*/

/*
 * @Description: //ex打开桌面excel文件夹
 * @author XuDong
 */
 :://ex::   
 Run %A_Desktop%\excel
 return    
 
 /*
 * @Description: //ex打开桌面excel文件夹
 * @author XuDong
 */
 :://sql::   
 Run E:\work\petecat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql
 return    

  /*
 * @Description: 复制excel文件
 * @author XuDong
 */
 :://cex::
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, %A_Desktop%\excel\LOAN_DATABASE.xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, %A_Desktop%\excel\LOAN_DATABASE(1).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, %A_Desktop%\excel\LOAN_DATABASE(2).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, %A_Desktop%\excel\LOAN_DATABASE(3).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, %A_Desktop%\excel\LOAN_DATABASE(4).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, %A_Desktop%\excel\LOAN_DATABASE(5).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, %A_Desktop%\excel\LOAN_DATABASE(6).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	MsgBox, 0, 提示, 库表结构Excel已经复制完毕！, 1
 return
 
  /*
 * @Description: 微信bus切换主干
 * @author XuDong
 */
 ::``wxz:: 
	ahkPath = %A_ScriptDir%
	bus2ZhPath := SubStr(ahkPath, 1 , StrLen(ahkPath)-31) "tool\ReadFile\Bus2Zg.txt"
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK\workspace\busplatform\src\main\resources\config\M01_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK\workspace\busplatform\src\main\resources\config\M10_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK\workspace\busplatform\src\main\resources\config\M12_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK_tag\workspace\busplatform_tag\src\main\resources\config\M01_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK_tag\workspace\busplatform_tag\src\main\resources\config\M10_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK_tag\workspace\busplatform_tag\src\main\resources\config\M12_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	MsgBox, 0, 提示, 微信bus的m01、m10、m12已替换成  主干  链接！, 1
 return
 
   /*
 * @Description: 微信bus切换分支
 * @author XuDong
 */
 ::``wxf:: 
	ahkPath = %A_ScriptDir%
    bus2ZhPath := SubStr(ahkPath, 1 , StrLen(ahkPath)-31) "tool\ReadFile\Bus2Fz.txt"
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK\workspace\busplatform\src\main\resources\config\M01_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK\workspace\busplatform\src\main\resources\config\M10_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK\workspace\busplatform\src\main\resources\config\M12_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK_tag\workspace\busplatform_tag\src\main\resources\config\M01_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK_tag\workspace\busplatform_tag\src\main\resources\config\M10_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, %bus2ZhPath%, D:\works\pertercat\eclipse-jee-luna-SR2-win32-x86_64_forWXJK_tag\workspace\busplatform_tag\src\main\resources\config\M12_MIC_INTERFACE.properties, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	MsgBox, 0, 提示, 微信bus的m01、m10、m12已替换成  分支  链接！, 1
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
 * @Description: 暂停脚本
 * @author XuDong
 */
ScrollLock::Reload   ;暂停脚本
Pause::Pause 

;---------------------------------------
; 查找图片（只能查询当前激活窗口的文件）   2
;---------------------------------------
/*
NumpadSub::
ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\test.bmp 
if ErrorLevel = 2 
MsgBox 不能实施搜索。
else if ErrorLevel = 1 
MsgBox 未在屏幕上寻得图标。
else 
 ;MsgBox 在 %OutputVarX%x%OutputVarY% 处寻得图标。
MouseMove  %OutputVarX%, %OutputVarY%
return 
*/
