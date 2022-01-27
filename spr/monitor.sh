game_alive=`ps -ef |grep game |grep config.lua|grep -v grep|grep -v bash|grep -v vim`
mail_exist=`find . -maxdepth 1 -name mail.log`
if [[ "$game_alive" == "" && "$mail_exist" == "" ]]; then
    #echo 监测到当前无game进程运行!! | mail -s "服务器监控" xxx@qq.com
    echo `date +"%Y-%m-%d %H:%M:%S"` > mail.log
else
    if [ "$game_alive" != "" ]; then
        if [ "$mail_exist" != "" ]; then
            rm -f mail.log
        fi
    fi
fi
