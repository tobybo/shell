import time
from common import *


robot_path = "/root/qa/service/game/etc"


class Concur_Login:

    def __init__(self, amount, average, cpu_count, max_online):
        """
        登录的压测流程
        :param amount: 总数，一共要运行多少条
        :param average:  速率，指每秒登录多少个
        """
        self.amount = amount
        self.average = average
        self.cpu_count = cpu_count
        self.max_online = max_online
        cpu_count_os = shell_output("grep 'physical id' /proc/cpuinfo | sort -u | wc -l")
        self.cpu_count_os = int(cpu_count_os[0].decode("utf-8").replace("\n", ""))

    def establish_shell(self):
        start_account = 1
        one_lua_amount = int(self.amount/self.cpu_count)
        if self.cpu_count > self.cpu_count_os:
            raise
        for i in range(0, self.cpu_count):
            cp_file = f"{robot_path}/robot{i}_login.lua"
            shell_output(f"cp {robot_path}/robot.lua {cp_file}")
            alter(cp_file, "all = 0", f"all = {one_lua_amount}")
            alter(cp_file, "average = 0", f"average = {self.average}")
            alter(cp_file, "max_online = 0", f"max_online = {self.max_online}")
            alter(cp_file, "from_idx = 101", f"from_idx = {start_account + one_lua_amount*i}")
            alter(cp_file, "../log/", f"../log_{i}/")
            alter(cp_file, "UseCpu  = 0", f"UseCpu = {i}")

    @classmethod
    def clear_hf(cls):
        files = shell_output(f"ls {robot_path}")
        files_list = [f.decode("utf-8").replace("\n", "") for f in files]
        pattern = re.compile('[0-9]+')
        del_list = [d for d in files_list if "robot" in d and pattern.findall(d)]
        for i in del_list:
            shell_output(f"rm -f {robot_path}/{i}")


if __name__ == '__main__':
    cl = Concur_Login(amount=5000, average=5, cpu_count=5)
    cl.clear_hf()
    cl.establish_shell()
    # time.sleep(100)



# 访问 https://www.jetbrains.com/help/pycharm/ 获取 PyCharm 帮助

# 现在明白了他的运行模式，想想这个该怎么弄

# 大概步骤：

"""
1. 读取系统cpu核心数
2. 根据核心数提前生成robot_index.lua个脚本
3. 进程池中进行加载，并发


"""

