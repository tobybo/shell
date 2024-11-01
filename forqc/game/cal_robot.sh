echo `grep -i "firstPacket send" log_*/A* |wc|awk '{print "发起登录数: "\$1}'`
echo `grep "onLogin succ" log_*/A* |wc|awk '{print "登录成功数: "\$1}'`
echo `grep "loadData done" log_*/A* |wc|awk '{print "加载完成数: "\$1}'`
