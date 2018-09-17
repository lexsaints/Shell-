#!/bin/bash
#log.sh

size_all=`du -s -k /mnt/log/ | awk '{print $1}'`
date=88888888

#当/mnt的总容量大于200M时,删除最早创建的日志文件
if [[ $size_all -gt 100 ]]; then
	for i in `ls /mnt/log/`; do
		date_i=`echo $i | cut -d '-' -f 1`
		#通过循环获取最小日期的日志文件
		if [[ $date_i -lt date ]]; then
			date=$date_i
		fi
	done
	echo $date
	#如果上面执行成功,删除掉我们获取到的最小日期的日志文件
	if [[ $?==0 ]]; then
		echo '0000000000000000000'
		rm -rf /mnt/log/$date*.log
	fi
fi
