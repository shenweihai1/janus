import subprocess
import time


def exec_cmd(cmd):
    subprocess.call(cmd, shell=True)

def leader_one_shard():
    results = open("./log/log-automate-output.log", "w+")
    cmds = open("./log/log-automate-cmds.log", "w+")

    for i in range(10,11):
        output = "./log/log-automate-output-" + str(i) + ".log"
        nc = 300
        cmd = "./run.py -f par-dist/leader_paxos{trd}_shardidx0.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc {nc} -d 30 -T {trd} > {output} 2>&1".format(trd=i+1, nc=nc, output=output)
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

def leader_multishards():
    pass

if __name__ == "__main__":
    leader_one_shard()
    leader_multishards()