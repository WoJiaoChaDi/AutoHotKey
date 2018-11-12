 :://duowan::
	
	htmlid = 46380818
	counttime = 0
	
	Loop,30{
		counttime := counttime + 1
		htmlid := htmlid + 1
		Random, rad, 10000000, 99999999	;生成8位随机数
		Random, rad1, 10000000, 99999999	;生成8位随机数
		Random, rad2, 10000000, 99999999	;生成8位随机数
		Random, rad3, 10000000, 99999999	;生成8位随机数
		Random, rad4, 10000000, 99999999	;生成8位随机数
		Random, rad5, 10000000, 99999999	;生成8位随机数
	
		Send ^t
		Send http://bbs.duowan.com/thread-%htmlid%-1-1.html
		Sleep, 1000
		Send {Enter}
		
		Sleep, 3000
		
		Send ^{End}
		Sleep, 1000
		MouseClick, left, 760, 792
		Send 哈哈哈，楼主说的这个帖子真有意思，帮你顶上去！！！
		Sleep, 1000
		Send ^{Enter}
		
		Sleep, 1800000	;半小时更新一次
		Send ^w
		
		
		if(counttime == 5){
			MsgBox 1234545
		}
	}
	
	
 return  