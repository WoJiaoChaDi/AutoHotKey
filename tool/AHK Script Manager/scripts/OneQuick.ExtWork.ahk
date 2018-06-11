;========================
;备注模板
;========================


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
	
	ToolTip("...脚本结束")
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
	
	ToolTip("...脚本结束")
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
::``ww410::
	Send ^{F5}
	Sleep 2000
	;MouseClick, left,  87, 211	;关闭系统菜单
	Sleep, 1000
	addFangChan()
	Send ^v
	addFangChan2()
	fangChanChuPing()
	yeWuShenQing(13581611612)
	neiShen1w()
	Sleep 500
	Send {enter}
	neiShen11w()
	Sleep, 2000
	neiShen2w()
	Sleep, 3000
	waiShenw()
	Sleep, 3000
	paiZhuw()
	Sleep, 3000
	zhongShenw()
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
	neiShen1ForNew()
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
	neiShen1ForNew()
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
		Send 150000 ;系统评估单价（元）
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
	
	ToolTip("...脚本结束")
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
	Send 8000000{tab}7{tab}{tab}{tab}{enter}{tab}{tab}{tab}{enter} 
	closeTaskMsg()
	
	ToolTip("...脚本结束")
}
 
 /*
 * @Description: 内审1 - 自动表单
 * @author XuDong
 */
 ::``1q::
	neiShen1ForNew()
 return  
 
 /*
 旧的内审I，客户采用旧客户信息
 */
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
 新的内审I，身份证使用随机身份证里面的一个
 */
 neiShen1ForNew(){
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
		;openCustInfo()	;旧的内审I，采用客户信息第四页的一条数据
		
	Sleep 500
	MouseClick, left, 260, 272 ;客户姓名
	Send {tab}^v
	Send {tab 7}
	RandIdCard := getIdCard()
	Send %RandIdCard%	;随机身份证
	
	Send {tab 8}{enter}
	Sleep 500
	Send {enter}
	
	MouseClick, left, 480, 872 ;借款用途
	Send {down}{Enter}
	
	MouseClick, left, 748, 922 ;提交
	MouseClick, left, 994, 653 ;确定
	closeTaskMsg()
	Sleep, 2000
	MouseClick, left, 1044, 704 ;关闭任务
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 内审1后半部分 - 自动表单
 * @author XuDong
 */
 ::``11q::
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
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 内审1（新页面） - 自动表单
 * @author XuDong
 */
 ::``1::
	neiShen1w()
	neiShen11w()
 return  
 
 neiShen1w(){
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
	;openCustInfo()	;采用客户信息第四页的一条数据
	
	ToolTip("...脚本结束")
}

::``11::
	neiShen11w()
return  
 
neishen11w(){
	
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	
	MouseClick, left, 1029, 273 ;身份证号
	RandIdCard := getIdCard()
	Send %RandIdCard%	;随机身份证
	MouseClick, left, 514, 275 ;客户名称
	Send ^a
	
	;Send ^`` ;打开粘贴
	;Sleep, 100  ;等待
	;Send 2 ;第二个
	
	Send ^v
	
	Sleep 200
	Random, mobile8, 10000000, 99999999	;生成8位随机数
	Send {tab 2}186%mobile8%	;手机号
	
	;========================
	;涉诉情况
	;========================
	MouseClick, left, 278, 218 ;涉诉情况
	MouseClick, left, 314, 269 ;法院公告网前面定位
	Send {tab 2}{right 2}{tab}
	Send 这是法院公告网的备注哦！
	Send {tab 2}{right 2}{tab}
	Send 这是执行/失信网的备注哦！
	Send {tab 2}{right 2}{tab}
	Send 这是裁判文书网的备注哦！
	Send {tab 2}{right 2}{tab}
	Send 这是企业信用网的备注哦！
	Send {tab 2}{right 2}{tab}
	Send 这是汇法网的备注哦！
	Send {tab 2}{right 2}{tab}
	Send 这是企查查的备注哦！
	
	MouseClick, left, 473, 908 ;涉诉金额
	Send {down}{enter}
	MouseClick, left, 975, 910 ;涉诉类型
	Send {down}{enter}
	MouseClick, left, 1481, 912 ;涉诉时间
	Send {down}{enter}
	
	Send {tab}{enter}
	MouseClick, left, 1040, 493 ;确认提交
	Send {tab}{enter}{enter}
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 内审2 - 自动表单
 * @author XuDong
 */
 ::``2q::
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
	
	;MouseClick, left, 931, 853 ;保存
	fun_btn("内审II-抵押物信息", "baocun", "保存", 60, 20)
	Sleep, 500  ;等待
	Send {enter}
	
	MouseClick, left, 206, 220 ;面签信息
	MouseClick, left, 1869, 246 ;编辑客户信息
	Sleep 1000
	neiShen2ForCust()	;内审2客户信息
	
	Sleep, 500  ;等待
	fun_btn("内审II", "tijiao2", "提交", 60, 20)
	;MouseClick, left, 753, 496 ;提交
	Send {enter}
	;MouseClick, left, 990, 653 ;确定
	Sleep, 2000  ;等待
	Send {enter}
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 内审2（抵押物信息） - 自动表单
 * @author XuDong
 */
 ::``2d::
	neiShen2ForDbdm()
 return  
 
 neiShen2ForDbdm(){
	MouseClick, left, 453, 219 ;担保方式
	MouseClick, left, 1501, 324 ;预计可贷金额(元)
	Send {tab}{enter}	;完善
	Sleep 1500
	
	MouseClick, left, 422, 362, 2 ;房龄 双击
	Send 12
	MouseClick, left, 1035, 367 ;房产获得方式
	Send {down}{enter}
	MouseClick, left, 465, 391 ;房产性质
	Send {down}{enter}
	MouseClick, left, 468, 417 ;规划用途
	Send {down}{enter}
	MouseClick, left, 1033, 417 ;产权证登记日期
	MouseClick, left, 977, 451 ;产权证登记日期 往前两个月
	MouseClick, left


	Sleep, 500  ;等待
	MouseClick, left, 1087, 571 ;产权证登记日期 28日
	MouseClick, left, 474, 470 ;总楼层
	Send 15
	MouseClick, left, 1050, 473 ;所在楼层
	Send 15
	Send {tab}{right}	;是否二手房
	MouseClick, left, 1040, 508 ;土地类型
	Send {down}{enter}
	MouseClick, left, 476, 536 ;竣工日期
	MouseClick, left, 411, 556, 12 ;日期往前翻
	MouseClick, left, 423, 645 ;随便选一天
	
	MouseClick, left, 481, 558 ;土地来源
	Send {down}{enter}
	MouseClick, left, 856, 554 ;是否有土地证
	Send {tab}{right}
	MouseClick, left, 1480, 555 ;当前是否在押
	Send {tab}{right}
	MouseClick, left, 333, 610 ;是否唯一住房 无
	Send {tab}{right}
	MouseClick, left, 897, 608 ;是否满二/五 无
	Send {tab}{right}
	MouseClick, left, 1473, 609 ;是否需垫资 无
	Send {tab}{right}
	MouseClick, left, 457, 305 ;复制所有权人
	Send {Home}   
	Send +{End}
	Send ^c
	MouseClick, left, 1608, 304 ;产权证号码
	Send {Home}   
	Send +{End}
	Send ^v
	
	;fun_btn("内审II-抵押物信息", "baocun2", "保存", 60, 20)
	MouseClick, left, 850, 879 ;保存
	Send {tab}{enter}
	
	Sleep, 500  ;等待
	Send {enter}

}

 /*
 * @Description: 内审2（客户信息） - 自动表单
 * @author XuDong
 */
 ::``2c::
	neiShen2ForCust()
 return  

neiShen2ForCust(){
	
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	
	;========================
	;客户基本信息
	;========================
	MouseClick, left, 208, 220 ;初审信息
	MouseClick, left, 1899, 249 ;修改客户信息
	Sleep 1000
	MouseClick, left, 662, 300 ;定位到移动电话前面
	Random, rand, 10000000, 99999999	;生成8位随机数
	Random, rand2, 00000, 99999	;生成8位随机数
	Send {tab}186%rand%
	Send {tab}^v%rand%	;家庭住址
	
	MouseClick, left, 441, 325 ;定位到户籍所在省
	Send {down}{enter}
	
	MouseClick, left, 838, 327 ;定位到户籍所在市
	Send {down}{enter}
	
	Send {tab}^v%rand%	;户籍住址
	Send {tab}^v%rand%	;曾用名
	MouseClick, left, 813, 351 ;婚姻状况
	Send {down 2}{enter}
	MouseClick, left, 1339, 353 ;婚姻情况
	Send {down}{enter}
	
	MouseClick, left, 1710, 351 ;婚姻登记日期
	MouseClick, left, 1680, 379, 10 ;日期往前选10个月
	MouseClick, left, 1731, 463 ;随便一点
	
	MouseClick, left, 261, 373 ;定位家庭电话
	Send {tab}028852%rand2%	;家庭电话
	
	MouseClick, left, 1787, 375 ;证件到期日
	Sleep 200
	MouseClick, left, 1819, 403, 15 ;证件到期日 往后
	MouseClick, left, 1739, 487 ;证件到期日

	
	MouseClick, left, 822, 425 ;来本市时间
	Send {down}{enter}
	
	MouseClick, left, 1220, 436 ;年收入
	Send {down}{enter}
	Send {tab}800000
	
	MouseClick, left, 1724, 433 ;最高学历
	Send {down}{enter}
	
	MouseClick, left, 402, 462 ;学位
	Send {down}{enter}
	
	Send {tab}%rand%@163.com	;邮箱
	Send {tab}%rand2%_wx	;微信号
	Send {tab}%rand%	;QQ号
	Send {tab}2			;供养人口
	Send {tab}610041	;邮政编码

	MouseClick, left, 1264, 483 ;资料收集日
	MouseClick, left, 1233, 504, 12 ;往前面翻页
	MouseClick, left, 1290, 587 ;选日
	
	MouseClick, left, 1712, 487 ;职业类别
	Send {down}{enter}
	
	MouseClick, left, 267, 496	;定位在职年限
	Send {tab}8	;在职年限
	
	MouseClick, left, 280, 516 ;定位公司名称
	Send {tab}皮特猫信息科技有限公司
	Send {tab}环球中心N3-N9-1425
	
	MouseClick, left, 406, 545 ;行业分类
	Send {down}{enter}
	Sleep 500
	MouseClick, left, 666, 552 ;行业分类
	Send {down}{enter}
	
	MouseClick, left, 1125, 542 ;定位备注
	Send {tab}^v
	Send 这是备注
	MouseClick, left, 429, 593 ;客户所属国家
	Send {down}{enter}
	
	;========================
	;客户配偶信息
	;========================
	MouseClick, left, 299, 624 ;定位配偶姓名
	Send {tab}^v的配偶			;配偶姓名
	
	Random, randP1, 10000000, 99999999	;生成8位随机数
	Send {tab}186%randP1%		;配偶电话
	
	MouseClick, left, 1274, 624 ;配偶性别
	Send {down}{enter}
	
	MouseClick, left, 1701, 638 ;最高学历
	Send {down}{enter}
	
	Send {tab}18	;年龄
	
	MouseClick, left, 830, 649 ;证件类型
	Send {down}{enter}		
	
	RandIdCardP1 := getIdCard()
	Send {tab}%RandIdCardP1%	;随机身份证
	
	MouseClick, left, 375, 673 ;配偶年收入
	Send {down}{enter}		;配偶年收入
	Send {tab}3000			;配偶年收入
	
	Send {tab}30			;配偶在职年限
	
	Send {tab}^v地址地址		;配偶户籍地址

	;========================
	;客户附属信息
	;========================
	MouseClick, left, 318, 249 ;客户附属信息
	Send {tab}549
	Send {tab}148
	Send {tab}549
	Send {tab}148
	
	Send {tab}^v联系人1
	Random, rand3, 10000000, 99999999	;生成8位随机数
	Send {tab}186%rand3%
	;Send {tab}%rand3%与借款人关系
	MouseClick, left, 1594, 389 ;与借款人关系
	Send {down}{enter}
	Send {tab}%rand3%22
	Send {tab}%rand3%33
	Send {tab}%rand3%学校
	Send {tab}%rand3%联系地址
	
	Send {tab}^v联系人2
	Random, rand4, 10000000, 99999999	;生成8位随机数
	Send {tab}186%rand4%
	;Send {tab}%rand4%与借款人关系
	MouseClick, left, 1599, 475 ;与借款人关系
	Send {down}{enter}
	Send {tab}%rand4%22
	Send {tab}%rand4%33
	Send {tab}%rand4%学校
	Send {tab}%rand4%联系地址
	
	Send {tab}{enter}	;保存
	Sleep 300
	Send {tab}{enter}	;保存
	
	ToolTip("...脚本结束")
}

 ::``2e::
	neiShenWai()
 return
 
neiShenWai(){
	
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	
	;========================
	;初审信息(外层)
	;========================
	MouseClick, left, 200, 218 ;初审信息
	
	MouseClick, left, 1890, 335 ;备用资产加一个
	MouseClick, left, 1890, 335 ;备用资产加一个
	MouseClick, left, 1890, 335 ;备用资产加一个
	MouseClick, left, 940, 353 ;第一个备用资产的房产用途
	Send 经营万事屋
	Send {tab}老房子
	Send {tab}老112233
	Send {tab}银
	Send {tab}旺财
	Send {tab}武士道
	Send {tab}112
	Send {tab}5000000
	Send {tab}{right}
	Send {tab}4000000
	MouseClick, left, 1507, 447 ;与借款人关系
	Send {down}{enter}
	
	MouseClick, left, 447, 468 ;第二个备用资产的资产类型
	Send {down}
	MouseClick, left, 447, 468 ;第二个备用资产的资产类型
	Send {down}
	MouseClick, left, 447, 468 ;第二个备用资产的资产类型
	Send {down}
	
	MouseClick, left, 972, 471 ;第二个备用资产的车辆品牌型号
	Send 川A12345
	Send {tab}500000
	
	Send {tab 2}556
	Send {tab}50000
	
	MouseClick, left, 1507, 447 ;与借款人关系(第一个备用资产)
	Send {down}{enter}
	
	MouseClick, left, 1892, 535 ;银行流水+1
	MouseClick, left, 1892, 535 ;银行流水+1
	Send {tab}银行流水1{tab}中风银行{tab}4000{tab}80000{tab}40000{tab}2000
	Send {tab}银行流水2{tab}伤仲永银行{tab}4000{tab}80000{tab}40000{tab}2000
	
	MouseClick, left, 1859, 669 ;还款来源+1
	MouseClick, left, 1841, 668 ;还款来源+1
	Send {tab}家徒四壁书侵坐，无可奈何花落去{tab}出息是个大头鬼，难得遇见老夫妻
	
	Send {tab}{right}{tab}{right}{tab}拿钱来买开心！	;借款用途
	
	;========================
	;征信涉诉情况
	;========================
	MouseClick, left, 290, 220 ;征信涉诉情况
	MouseClick, left, 278, 266 ;借款人人行征信(定位)
	Send {tab}{right}{tab}1{tab}2{tab}3{tab}{right}{tab}{right}{tab 2}{right}{tab}客户人行征信可以说是肥肠良好！
	Send {tab}{right}{tab}1{tab}2{tab}3{tab}{right}{tab}{right}{tab 2}{right}{tab}配偶人行征信也可以说是肥肠良好！
	MouseClick, left, 1623, 334 ;贷款五级分类
	Send {down}{enter}
	MouseClick, left, 1615, 490 ;贷款五级分类
	Send {down}{enter}
}

 /*
 * @Description: 内审2（新页面） - 自动表单
 * @author XuDong
 */
 ::``2::
	neiShen2w()
 return  

neiShen2w(){
	
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	
	MouseClick, left, 1657, 311 ;待办进入第一个
	Send {enter}	;接受任务
	Sleep 1000
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 2000  ;等待
	
	;========================
	;初审信息(客户信息)
	;========================
	;~ fun_btn_nomsg("内审2", "huabi", "编辑客户信息按钮", 10, 10)
	;~ MouseClick, left, 1898, 248 ;编辑客户信息按钮
	;~ Sleep 2000
	neiShen2ForCust()
	
	;========================
	;初审信息(外层)
	;========================
	neiShenWai()
	
	;========================
	;担保方式
	;========================
	neiShen2ForDbdm()
	
	;========================
	;内审II提交
	;========================
	Sleep 500
	fun_btn("内审II", "tijiao", "提交", 60, 20)
	Sleep 500
	
	;~ fun_btn("内审II", "queding", "确定", 60, 20)
	MouseClick, left, 1001, 746
	Sleep 1000
	
	ToolTip("...脚本结束")
}

/*
 * @Description: 外审 - 自动表单
 * @author XuDong
 */
 ::``22::
	waiShenw()
 return  
 
 waiShenw(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 5000  ;等待

	MouseClick, left, 505, 693 ;内部结构
	Send {down}{enter}
	MouseClick, left, 1045, 693 ;户型结构
	Send {down}{enter}
	MouseClick, left, 1626, 694 ;装修
	Send {down}{enter}
	MouseClick, left, 484, 717 ;朝向
	Send {down}{enter}
	
	MouseClick, left, 349, 742 ;定位到（房产实际地址与产权证地址是否一致）
	Loop, 18{
	Send {tab}{right}
	Sleep, 10
	}
	;~ 循环结束抵达  是否有老年人、残疾人
	Send {tab}外审下户的备注备注备注
	Send {PgDn}{tab}{tab}

	/*
	MouseClick, left, 318, 740 ;房产实际地址与产权证地址是否一致
	Send {tab}{right}
	MouseClick, left, 908, 739 ;使用状况
	Send {tab}{right}
	MouseClick, left, 1463, 738 ;是否有电梯
	Send {tab}{right}
	MouseClick, left, 330, 768 ;是否有遮挡
	Send {tab}{right}
	MouseClick, left, 905, 765 ;是否打通
	Send {tab}{right}
	MouseClick, left, 1455, 771 ;是否有老年人、残疾人
	Send {tab}{right}
	*/
	
	;~ MouseClick, left, 370, 869 ;中介名称
	ClipboardOld = %ClipboardAll% ;保留剪贴板中原来的内容
	Clipboard = 链家链家
	Send ^v
	Clipboard = %ClipboardOld% ;恢复剪贴板初始的内容Return
	
	;MouseClick, left, 756, 844 ;中介联系方式
	Send {tab}	;中介联系方式
	Send 18600000000
	;MouseClick, left, 1147, 841 ;单价（元/m²）
	Send {tab}	;单价（元/m²）
	Send 15452
	;MouseClick, left, 931, 881 ;保存
	;fun_btn("外审", "baocun2", "保存", 60, 20)
	MouseClick, left, 954, 1014 ;外审里面保存
	Send {tab}{enter}
	Sleep 500
	MouseClick, left, 1050, 666 ;保存确认提示
	
	MouseClick, left, 801, 393 ;外审主页面保存
	Send {tab}{enter}
	Sleep 500
	Send {enter}
	
	Sleep 2000
	
	ToolTip("...脚本结束")
}

/*
 * @Description: 外审 - 自动表单
 * @author XuDong
 */
 ::``22q::
	waiShen()
 return  
 
 waiShen(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 5000  ;等待

	MouseClick, left, 469, 684 ;内部结构
	Send {down}{enter}
	MouseClick, left, 1033, 684 ;户型结构
	Send {down}{enter}
	MouseClick, left, 1609, 686 ;装修
	Send {down}{enter}
	MouseClick, left, 462, 712 ;朝向
	Send {down}{enter}
	MouseClick, left, 318, 740 ;房产实际地址与产权证地址是否一致
	Send {tab}{right}
	MouseClick, left, 908, 739 ;使用状况
	Send {tab}{right}
	MouseClick, left, 1463, 738 ;是否有电梯
	Send {tab}{right}
	MouseClick, left, 330, 768 ;是否有遮挡
	Send {tab}{right}
	MouseClick, left, 905, 765 ;是否打通
	Send {tab}{right}
	MouseClick, left, 1455, 771 ;是否有老年人、残疾人
	Send {tab}{right}
	
	MouseClick, left, 370, 869 ;中介名称
	ClipboardOld = %ClipboardAll% ;保留剪贴板中原来的内容
	Clipboard = 链家链家
	Send ^v
	Clipboard = %ClipboardOld% ;恢复剪贴板初始的内容Return
	
	;MouseClick, left, 756, 844 ;中介联系方式
	Send {tab}	;中介联系方式
	Send 18600000000
	;MouseClick, left, 1147, 841 ;单价（元/m²）
	Send {tab}	;单价（元/m²）
	Send 15452
	;MouseClick, left, 931, 881 ;保存
	;fun_btn("外审", "baocun2", "保存", 60, 20)
	MouseClick, left, 746, 908 ;外审里面保存
	Send {tab}{enter}
	
	MouseClick, left, 801, 393 ;外审主页面保存
	Send {tab}{enter}
	Sleep 500
	Send {enter}
	
	Sleep 2000
	
	ToolTip("...脚本结束")
}

/*
 * @Description: 派驻风控总监审批 - 自动表单
 * @author XuDong
 */
 ::``3::
	paiZhuw()
 return  
 
 paiZhuw(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	Sleep, 2000  ;等待
	MouseClick, left, 860, 1003 ;提交
	Send {enter}
	Sleep, 2000  ;等待
	MouseClick, left, 1045, 707 ;确定
	Sleep, 2000  ;等待
	Send {enter}
	Sleep, 4000
	MouseClick, left, 1044, 704 ;关闭任务
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 派驻风控总监审批 - 自动表单
 * @author XuDong
 */
 ::``3q::
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
	
	ToolTip("...脚本结束")
}

/*
 * @Description: 终评_评估经理终审 - 自动表单
 * @author XuDong
 */
 ::``33::
	zhongShenw()
 return  

zhongShenw(){
	;~ MouseClick, left, 1774, 317 ;待办进入第一个
	;~ Send {tab}{enter}	;待办进入第一个
	;~ MouseClick, left, 1007, 659 ;接受任务
	MouseClick, left, 1765, 333 ;待办进入第一个
	Send {tab}{enter}	;待办进入第一个
	Send {enter}	;接受任务
	Sleep, 1500  ;等待
	MouseClick, left, 1765, 333 ;待办进入第一个
	Send {tab}{enter}	;待办进入第一个
	Sleep, 3000  ;等待
	
	MouseClick, left, 1765, 333 ;随便点一下，在修改抵押物信息里面定位
	Send {PgDn}	;向下翻页
	
	Send, 1000
	MouseClick, left, 1605, 824, 3 ;下户快卖价（元）//双击
	Send ^c
	Send {tab}^v
	Send {tab 2}^v
	Send {tab}{tab}{tab}{tab}{enter}
	Send {tab}{tab}{tab}{enter}
	Sleep, 500  ;等待
	Send {enter} 
	;MouseClick, left, 941, 495 ;提交
	
	Sleep, 500  ;等待
	
	;fun_btn("评估经理终审", "tijiao5", "提交", 60, 20)
	MouseClick, left, 909, 390 ;提交
	
	MouseClick, left, 987, 655 ;确认
	Sleep, 2000  ;等待
	Send {enter}
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 终评_评估经理终审 - 自动表单
 * @author XuDong
 */
 ::``33q::
	zhongShen()
 return  
 
 zhongShen(){
	MouseClick, left, 1580, 330 ;待办进入第二个
	Send {tab 2}{enter}	;待办进入第二个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2500  ;等待
	MouseClick, left, 1580, 330 ;待办进入第二个
	Send {tab 2}{enter}	;待办进入第二个
	Sleep, 4000  ;等待
	MouseClick, left, 1563, 868, 2 ;下户快卖价（元）//双击
	Send ^c
	Send {tab}^v
	Send {tab 2}^v
	Send {tab}{tab}{tab}{tab}{enter}
	Send {tab}{tab}{tab}{enter}
	Sleep, 500  ;等待
	Send {enter} 
	;MouseClick, left, 941, 495 ;提交
	
	Sleep, 500  ;等待
	
	fun_btn("评估经理终审", "tijiao5", "提交", 60, 20)
	
	MouseClick, left, 987, 655 ;确认
	Sleep, 2000  ;等待
	Send {enter}
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 查看流程图 - 自动表单
 * @author XuDong
 */
 ::``43q::
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
	
	ToolTip("...脚本结束")
}

/*
 * @Description: 审批经理审批Ⅰ - 自动表单
 * @author XuDong
 */
 ::``4::
	shenPi1w()
 return  
 
 shenPi1w(){
	
	MouseClick, left,  1474,  273
	Sleep, 100
	Send, {TAB}{enter}
	Sleep, 2000  ;等待
	MouseClick, left, 1657, 311 ;待办进入第一个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2000  ;等待
	
	MouseClick, left, 367, 282 ;需要签署的文件
	Send {tab}{space}{tab}{space}{tab}{space}{tab}{space}{tab}{space}{tab}{space}
	
	MouseClick, left, 510, 417 ;用款审批意见
	

	MouseClick, left, 280, 229 ;审查信息
	MouseClick, left, 773, 340 ;借款人身份证 
	Loop, 7{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;借款人户口本
	Loop, 7{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}

	Send {tab}	;借款人婚姻证明
	Loop, 7{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;征信报告-借款人
	Loop, 11{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;征信报告-配偶
	Loop, 11{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;涉诉查询截图
	Loop, 3{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;借款用途
	Loop, 6{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;房产证
	Loop, 13{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;购房合同
	Loop, 1{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;产调
	Loop, 1{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	Send {tab}	;其他抵押物分类项下材料
	Loop, 7{
	Send {tab}{right %A_Index%}{tab}%A_Index%
	Sleep, 100
	}
	
	MouseClick, left, 823, 908 ;同意
	Send {enter}

	ToolTip("...脚本结束")
}

 /*
 * @Description: 审批经理审批Ⅰ - 自动表单
 * @author XuDong
 */
 ::``4q::
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
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 审批经理审批Ⅱ - 自动表单
 * @author XuDong
 */
 ::``44q::
	shenPi2()
 return  
 
 shenPi2(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2000  ;等待
	MouseClick, left, 346, 217 ;申请信息
	Sleep, 500  ;等待
	
	fun_btn("审批经理审批Ⅱ", "fushuchanpin", "附属产品", 100, 15)
	Sleep, 100
	Send {down}{enter}
	Send {tab}500000 ;授信额度(元)
	
	fun_btn("审批经理审批Ⅱ", "shenpi_xuyaoqianshudewenjian", "需要审批的文件", 300, 20)
	Send {down}{down}{down}{esc}
	Send {tab}{tab}{enter}{enter}
	Sleep, 2000  ;等待
	Send {enter}
	
	ToolTip("...脚本结束")
}

/*
 * @Description: 审批经理审批Ⅱ - 自动表单
 * @author XuDong
 */
 ::``44::
	shenPi2w()
 return  
 
 shenPi2w(){
	MouseClick, left, 1657, 311 ;待办进入第一个
	MouseClick, left, 1007, 659 ;接受任务
	Sleep, 2000  ;等待
	;~ MouseClick, left, 346, 217 ;申请信息
	;~ Sleep, 500  ;等待
	
	;~ MouseClick, left, 486, 536 ;附属产品
	;~ Send {down}{enter}
	;~ Send {tab}800000
	;~ Send {tab}8
	;~ Send {tab}{space}{tab}{space}{tab}{space}{tab}{space}{tab}{space}{tab}{space}{tab}{space}
	;~ MouseClick, left, 740, 725 ;同意前面一点
	;~ Send {tab}{enter}
	
	MouseClick, left, 825, 579 ;接受任务
	Send {enter}
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 资金专员决定放款渠道 - 自动表单
 * @author XuDong
 */
 ::``444::
	ziJinZhuanYuan()
 return  
 
 ziJinZhuanYuan(){
	MouseClick, left,  1439, 308
	Send {tab 2}{enter}
	Sleep, 3000  ;等待
	MouseClick, left, 467, 415 ;资金方
	Send {down 2}{enter}
	MouseClick, left, 1055, 415 ;放款机构
	Send {down}{enter}
	MouseClick, left, 1693, 420 ;计划归入资产包
	Send {down 5}{enter}
	Send {tab}{enter 2}
	Sleep, 2000  ;等待
	Send {enter}
	
	ToolTip("...脚本结束")
}
 
  /*
 * @Description: 用款确认 - 自动表单
 * @author XuDong
 */
 ::``5::
	yongKuanQueRen()
 return  
 
 yongKuanQueRen(){
	
	;~ nomsg := fun_btn_nomsg("用款确认", "yongkuanqueren", "用款确认", 10, 10)
	;~ if(nomsg == 2 || nomsg == 1){
		;~ MouseClick, left,  1749, 305
		;~ Send {tab}{enter}	;进入任务
	;~ }else{
		;~ Send {tab 2}{enter}	;进入任务
	;~ }
	
	MouseClick, left,  1746, 314
	Send {tab}{enter}	;进入任务
	Sleep 1500
	MouseClick, left,  497, 651	;年利率
	
	MouseClick, left,  510, 677, 2	;营销利率 双击
	Send 19.8
	
	MouseClick, left,  1081, 701	;业务推介费收取方式
	MouseClick, left,  1089, 770	;放款前收取部分放款后按月收取
	MouseClick, left,  1075, 675, 2	;业务推介费 双击
	Send 6
	MouseClick, left,  1620, 703, 2	;业务推介费放款后 双击
	Send 2
	
	MouseClick, left,  500, 707	;业务推介费收取形式
	MouseClick, left,  519, 751	;委托收取
	
	MouseClick, left,  890, 900	;提交
	MouseClick, left,  995, 741	;确定
	
	ToolTip("...脚本结束")
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
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 提款申请 - 自动表单
 * @author XuDong
 */
 ::``555::
	tiKuanShenQing()
 return  

tiKuanShenQing(){
	
	nomsg := fun_btn_nomsg("提款申请", "tikuanshenqing", "提款申请", 10, 10)
	if(nomsg == 2 || nomsg == 1){
		MouseClick, left, 1657, 311 ;待办进入第一个
		MouseClick, left, 1007, 659 ;接受任务
	}else{
		Send {tab 2}{enter}	;进入任务
	}
	
	Sleep, 2500  ;等待
	
	
	MouseClick, left, 298, 273 ;合同信息tab
	Send {tab 5}{enter}		;合同生效日期
	
	;========================
	;客户代扣开户行
	;========================
	MouseClick, left, 1814, 521 ;客户代扣开户行
	Sleep, 1000  ;等待
	MouseClick, left, 968, 517 ;选中第一个客户账号选择
	Sleep, 500  ;等待
	MouseClick, left, 987, 797 ;确定
	
	;========================
	;客户放款账户开户行
	;========================
	MouseClick, left, 1811, 545	;客户放款账户开户行
	Sleep, 1000  ;等待
	MouseClick, left, 924, 537 ;选中第一个客户账号选择
	Sleep, 500  ;等待
	MouseClick, left, 987, 797 ;确定
	
	
	Sleep, 500  ;等待
	MouseClick, left, 534, 736 ;授信用途
	Send {down}{enter}
	
	Send {tab}123	;用途说明：
	
	MouseClick, left, 1150, 470 ;合同生效日
	Send {enter}
	
	MouseClick, left, 633, 810 ;定位到保存合同前面
	Send {tab 2}{enter}	;暂存
	sleep 1000 
	
	Send {enter}
	MouseClick, left, 633, 810 ;zj
	Send {tab 3}{enter}	;生成合同
	;~ sleep 5000 
	
	;~ Send {enter}
	;~ MouseClick, left, 633, 810 ;zj
	;~ Send {tab 4}{enter}	;签订合同
	;~ sleep 5000 
	
	/*
	fun_btn("提款申请", "qiandinghetong", "签订合同", 70, 10)
	sleep 100
	Send {enter}
	Sleep, 2000  ;等待
	closeTaskMsg()
	*/
	
	ToolTip("...脚本结束")
	
	
}

 /*
 * @Description: 运营放款等 - 自动表单
 * @author XuDong
 */
 ::``6::
	yunYing()
 return

yunYing(){
	MouseClick, left,  1645,  310
	Sleep, 1500
	MouseClick, left,  201,  526
	Sleep, 100
	Send, {TAB}{SPACE}
	
	nomsg := fun_btn_nomsg("运营4个", "tijiao6", "提交", 50, 10)
	if(nomsg != 0){		
		fun_btn_nomsg("运营4个", "tongyi2", "同意", 50, 10)
	}
	
	Sleep, 500
	Send {ENTER}
	Sleep, 1500
	Send {ENTER}
	Sleep, 500
	Send {ENTER}
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 贷前费用收取/复核
 * @author XuDong
 */
 ::``66::
	daiqianfeiyong()
 return

daiqianfeiyong(){
	
	fun_btn("菜单", "feiyongshouqu", "费用收取", 50, 10)
	Sleep, 200
	
	fun_btn("菜单", "daiqianfeiyongshouqu", "贷前费用收取", 50, 10)
	Sleep, 200
	MouseClick, left,  353, 222		;客户名称
	Send ^v
	fun_btn("贷前费用收取", "sousuotubiao", "搜索图标", 50, 10)
	Sleep 300
	MouseClick, left,  575, 337		;第一条数据
	fun_btn("贷前费用收取", "duigoutubiao", "对勾图标", 50, 10)
	Sleep 500
	fun_btn("贷前费用收取", "duigoutubiao", "对勾图标", 50, 10)
	Sleep 100
	Send {enter}
	Sleep 500
	
	fun_btn("菜单", "daiqianfeiyongfuhe", "贷前费用复核", 50, 10)
	Sleep, 200
	MouseClick, left,  353, 222		;客户名称
	Send ^v
	fun_btn("贷前费用收取", "sousuotubiao", "搜索图标", 50, 10)
	Sleep 300
	MouseClick, left,  575, 337		;第一条数据
	fun_btn("贷前费用收取", "duigoutubiao", "对勾图标", 50, 10)
	Sleep 500
	fun_btn("贷前费用收取", "duigoutubiao", "对勾图标", 50, 10)
	Sleep 100
	Send {enter}
	
	ToolTip("...脚本结束")
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
	
	ToolTip("...脚本结束")
}

 /*
 * @Description: 清楚缓存
 * @author XuDong
 */
 ::``hc:: 
	Send ^r
	Sleep, 1500  ;等待
	MouseClick, left, 80, 253 ;系统缓存管理
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
	
	ToolTip("...脚本结束")
 }

 /*
 * @Description: 关闭任务完成窗口
 * @author XuDong
 */
 closeTaskMsg(){
	Sleep, 3000  ;等待
	Send {enter}
	
	ToolTip("...脚本结束")
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
		
	ToolTip("...脚本结束")
 }
 

 
    /*
 * @Description: chrome登入预生产
 * @author XuDong
 */
 ::``tt::
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	autoTestLogin(super, 123456, 1)
 return

   /*
 * @Description: chrome登入测试
 * @author XuDong
 */
 ::``oa::
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	autoTestLogin(super, 123456, 0)
 return
 
   /*
 * @Description: chrome打开隐身模式，并打开测试\预生产地址
 * @author XuDong
 */
 autoTestLogin(ByRef userId, ByRef passwrd, ByRef openType){
	
	SwitchIME(0x04090409) ; 英语(美国) 美式键盘
	
	if openType = 0 
	{
		localHttp = http://oa.cdhryx.cn:6900/sso/toLogin.do?loginKey=ftd	;测试环境
	}
	else
	{
		localHttp = http://test.cdhryx.cn:6900/sso/toLogin.do?loginKey=ftd	;预生产
	}
	
	Send ^+n
	Send ^l
	Send %localHttp%
	Send {enter}
	Sleep, 2000  ;等待
	Send {tab}{tab}super{enter}
	Sleep, 500  ;等待
	Send {tab}123456{enter}
	Sleep, 500  ;等待
	Send {tab}{tab}qazwsx{enter}
	Send {enter}
	
	ToolTip("...脚本结束")
}
 
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
	
	ToolTip("...脚本结束")
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
 
 ::``jjc:: 
	autoLogin(18510602312, 0, 0)
 return   
 
 ::``1jjc:: 
	autoLogin(18510602312, 1, 1)
 return   
 
  ::``2jjc:: 
	autoLogin(18510602312, 2, 1)
 return   
 
 ::``3jjc:: 
	autoLogin(18510602312, 3, 1)
 return   
 
 ::``cjs:: 
	autoLogin(15918702471, 0, 0)
 return   
 
 ::``1cjs:: 
	autoLogin(15918702471, 1, 1)
 return   
 
  ::``2cjs:: 
	autoLogin(15918702471, 2, 1)
 return   
 
 ::``3cjs:: 
	autoLogin(15918702471, 3, 1)
 return   
 
 
 ::``jlz:: 
	autoLogin(18210515167, 0, 0)
 return   
 
 ::``1jlz:: 
	autoLogin(18210515167, 1, 1)
 return   
 
  ::``2jlz:: 
	autoLogin(18210515167, 2, 1)
 return   
 
 ::``3jlz:: 
	autoLogin(18210515167, 3, 1)
 return   
 
 
 ::``tjz:: 
	autoLogin(15201442426, 0, 0)
 return   
 
 ::``1tjz:: 
	autoLogin(15201442426, 1, 1)
 return   
 
  ::``2tjz:: 
	autoLogin(15201442426, 2, 1)
 return   
 
 ::``3tjz:: 
	autoLogin(15201442426, 3, 1)
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
 * @Description: 隐身登入ql齐龙
 * @author XuDong
 */
 ::``zfz:: 
	autoLogin(13717658868, 0, 0)
 return 

 ::``1zfz:: 
	autoLogin(13717658868, 1, 1)
 return 
 
  ::``2zfz:: 
	autoLogin(13717658868, 2, 1)
 return 

 ::``3zfz:: 
	autoLogin(13717658868, 3, 1)
 return 
 
 /*
 * @Description: 隐身登入ql齐龙
 * @author XuDong
 */
 ::``fbb:: 
	autoLogin(18501367449, 0, 0)
 return 

 ::``1fbb:: 
	autoLogin(18501367449, 1, 1)
 return 
 
  ::``2fbb:: 
	autoLogin(18501367449, 2, 1)
 return 

 ::``3fbb:: 
	autoLogin(18501367449, 3, 1)
 return 

  /*
 * @Description: 隐身登入ytz叶婷
 * @author XuDong
 */
 ::``ytz:: 
	autoLogin(13537712861, 0, 0)
 return

 ::``1ytz:: 
	autoLogin(13537712861, 1, 1)
 return
 
  ::``2ytz:: 
	autoLogin(13537712861, 2, 1)
 return

 ::``3ytz:: 
	autoLogin(13537712861, 3, 1)
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
 
 ::``cll:: 
	autoLogin(18210473155, 0, 0)
 return

 ::``1cll:: 
	autoLogin(18210473155, 1, 1)
 return
 
  ::``2cll:: 
	autoLogin(18210473155, 2, 1)
 return

 ::``3cll:: 
	autoLogin(18210473155, 3, 1)
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
-----------------------------------------------------------使用chrome和PLSQL的时候（该窗口组定义在  本文件头  中）---------------------------------------------
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
	
	::jjc::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18510602312
		Send {Enter}
	return
	
	::cjs::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 15918702471
		Send {Enter}
	return
	
	::cqx::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18210515167
		Send {Enter}
	return

	::tjz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 15201442426
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
	
	::zfz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 13717658868
		Send {Enter}
	return
	
	::fbb::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18501367449
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
	
	::cll::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send 18210473155
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
	
	::adx::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send ^a
		Send admin
		Send {tab}
		Send 123456
		Send {Enter}
	return
	
	::sdx::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send ^a
		Send super
		Send {tab}123456
		Sleep 100
		Send {tab 2}qazwsx
		Send {tab 3}{Enter}
	return
	
	::wdz::
		SwitchIME(0x04090409) ; 英语(美国) 美式键盘
		Send ^a
		Send 13568887446
		Send {tab}verygood
		Sleep 100
		Send {tab 2}wd
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
	
	ToolTip("...脚本结束")
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
 Run D:\快捷方式\excel
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
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, D:\快捷方式\excel\LOAN_DATABASE.xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, D:\快捷方式\excel\LOAN_DATABASE(1).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, D:\快捷方式\excel\LOAN_DATABASE(2).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, D:\快捷方式\excel\LOAN_DATABASE(3).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, D:\快捷方式\excel\LOAN_DATABASE(4).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, D:\快捷方式\excel\LOAN_DATABASE(5).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	FileCopy, D:\Work\PeteCat\eclipse-jee-luna-SR2-win32-x86_64\workspace\microcredit-parent-yxjr-v2\microcredit-busbase-yxjr\sql\LOAN_DATABASE.xlsx, D:\快捷方式\excel\LOAN_DATABASE(6).xlsx, 1 ; 通过提供一个新的名字来复制文件到同个文件夹中。
	
	MsgBox ...库表结构Excel已经复制完毕！
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
 * @Description: 日终
 * @author XuDong
 */
 :://rivs:: 

	Loop, 134{
		MouseClick, left, 1043, 274
		Send {enter}
		Sleep 2000
	}
	
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
	图片搜索按钮
*/
fun_btn(ByRef eventName, ByRef btnId, ByRef btnName, ByRef xAdd, ByRef yAdd){
	ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\%btnId%.bmp
	if ErrorLevel = 2 
	MsgBox %eventName%_%btnName%_不能实施搜索。
	else if ErrorLevel = 1 
	MsgBox %eventName%_%btnName%_未在屏幕上寻得图标。
	else{
		xa := OutputVarX + xAdd		
		ya := OutputVarY + yAdd
		MouseClick, left,  %xa%, %ya%
		Sleep, 500  ;等待
	}
}

/*
	图片搜索按钮
*/
fun_btn_nomsg(ByRef eventName, ByRef btnId, ByRef btnName, ByRef xAdd, ByRef yAdd){
	ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight,D:\SoftWare\AutoHotKey\AutoHotKey\tool\ReadFile\%btnId%.bmp
	nomsg := 2
	if (ErrorLevel = 2) {
		aa = %eventName%_%btnName%_未在屏幕上寻得图标。
		ToolTip(aa)
		nomsg := 2	
	}else if (ErrorLevel = 1) {
		bb = %eventName%_%btnName%_未在屏幕上寻得图标。
		ToolTip(bb)
		nomsg := 1
	}else{
		xa := OutputVarX + xAdd		
		ya := OutputVarY + yAdd
		MouseClick, left,  %xa%, %ya%
		Sleep, 500  ;等待
		nomsg := 0
	}
	return nomsg
}

::``test::
	fun_btn_nomsg("用款确认", "yongkuanqueren", "用款确认", 10, 10)
return

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

;---------------------------------------
; Tooltips and Timers
;---------------------------------------	
	RandomSleep:			; Random timing between Autofire shots
		Random, random, 14, 25
		Sleep %random%-5
	Return
	
	RemoveToolTip:			; Used to remove tooltips.
	   SetTimer, RemoveToolTip, Off
	   tooltip
	Return

	ToolTip(label) ;Function to show a tooltip when activating, deactivating or changing values.
	{
  		ToolTip, %label%, 1200, 1000 ;Tooltips are shown under crosshair for FullHD monitors.
  		SetTimer, RemoveToolTip, 1000 ;Removes tooltip after 1.3 seconds.
  		Return
	}

/*
 * @Description: 暂停脚本
 * @author XuDong
 */
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
