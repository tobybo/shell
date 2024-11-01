import os
import re
import subprocess


def shell_output(cmd):
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    rst = p.stdout.readlines()
    return rst


def alter(file, old_str, new_str):
    with open(file, "r", encoding="utf-8") as f1, open("%s.bak"%file, "w", encoding="utf-8") as f2:
        for line in f1:
            f2.write(re.sub(old_str, new_str, line))
    os.remove(file)
    os.rename("%s.bak"% file, file)