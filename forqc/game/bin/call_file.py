from .common import *
from .main import *
import multiprocessing

cl = Concur_Login(amount=3200, average=5)
cl.clear_hf()
cl.establish_shell()

pool = multiprocessing.Pool(processes=cl.cpu_count)


def func(lua_file):
    subprocess.run(f"./game ../etc/{lua_file}", shell=True)


for i in range(cl.cpu_count):
    lua_file = f"robot{i}.lua"
    pool.apply_async(func=func, args=(lua_file,))
