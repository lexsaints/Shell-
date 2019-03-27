#!/bin/bash
#shell连接mysql数据库用法
HOSTNAME="localhost"
PORT="3306"
USER="root"
PASSWORD="123456"
DATABASE="ansible"
TABLE="t_ansible_log"

#进行SQL语句的拼接,将参数拼接进去
CREATE_TB_SQL="CREATE TABLE IF NOT EXISTS ${TABLE} ( NAME VARCHAR(20) , ID INT(11) DEFAULT 0 ,LOG VARCHAR(128) )"

INSERT_TB_SQL="INSERT INTO ${TABLE} (NAME,LOG) VALUES (${USER},${RET})"

#连接数据库;并执行SQL语句
mysql -h ${HOSTNAME} -P $PORT -u ${USER} -p${PASSWORD} -D $DATABASE -e "${INSERT_TB_SQL}"
if [ $? = 0 ];then
	echo "execute success!"
fi