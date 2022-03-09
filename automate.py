import subprocess
import time


def exec_cmd(cmd):
    subprocess.call(cmd, shell=True)


if __name__ == "__main__":
    results = open("./log/log-automate-output.log", "w+")
    cmds = open("./log/log-automate-cmds.log", "w+")
    for i in range(26,32):
        output = "./log/log-automate-output-" + str(i) + ".log"
        cmd = "./run.py -f par-dist/{num}.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T {num} > {output} 2>&1".format(num=i+1, output=output)
        cmds.write(cmd+"\n")
        cmds.flush()
        print("start executing " + str(i) + "\n")
        exec_cmd(cmd)

        value = 0
        with open(output) as handler:
            for line in handler.readlines():
                if "total_commits:" in line:
                    value = int(line.replace("total_commits:", ""))

        r = "{num}\t{value}\n".format(num=i, value=value)
        results.write(r)
        results.flush()

        print(r)
