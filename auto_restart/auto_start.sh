#!/bin/sh
#自动检测frpc是否停止运行,如果停止,重新启动
#注意shell严格的语法格式,以及=左右不要有空格
ps | grep frpc | grep -v vi | grep -v grep
#如果ps正常执行,并且有返回值,则 $?=0;检查进程,过滤掉grep进程
if [ $? -ne 0 ];then
	#对程序进行定位
	frpc=`find / -name frpc`
	ini=`find / -name myfrpc.ini`
	#执行启动
	$frpc -c $ini
else
	echo "running..."
fi