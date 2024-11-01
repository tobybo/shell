from main import *
import multiprocessing
import os
import time
import argparse

parse = argparse.ArgumentParser(description="运行参数")
parse.add_argument("--cpu_count", type=int, default=5)
parse.add_argument("--amount", type=int, default=100000)
parse.add_argument("--average", type=int, default=500)
parse.add_argument("--max_online", type=int, default=1875)
args = parse.parse_args()
cpu_count = args.cpu_count
amount = args.amount
average = args.average
max_online = args.max_online

cl = Concur_Login(amount=amount, average=average, cpu_count=cpu_count, max_online = max_online)
cl.clear_hf()
cl.establish_shell()


def func(lua_file, gap):
    # time.sleep(gap/10)
    os.system(f"./game ../etc/{lua_file}")


if __name__ == '__main__':
    pool = multiprocessing.Pool()

    for i in range(cpu_count):
        lua_file = f"robot{i}_login.lua"
        pool.apply_async(func, args=(lua_file, i,))
    pool.close()
    pool.join()

