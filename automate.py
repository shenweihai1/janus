import subprocess
import time


def exec_cmd(cmd):
    subprocess.call(cmd, shell=True)


def leader_multishards():
    results = open("./log/log-automate-output.log", "w+")
    cmds = open("./log/log-automate-cmds.log", "w+")

    nc = 300
    thds = 16
    shards = 1

    for trd in range(thds,thds+1):
        for shard in range(1,shards+1):
            output = "./log/log-automate-output-trd{trd}-shard{shard}.log".format(trd=trd, shard=shard)
            cmd = "./run.py -f par-dist/leader_multi_paxos{trd}_{shard}.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc {nc} -d 30 -T {trd} > {output} 2>&1".format(trd=trd, shard=shard, nc=nc, output=output)
            cmds.write(cmd+"\n")
            cmds.flush()
            print("start executing, trd:" + str(trd) + ", shard: " + str(shard) + "\n")
            exec_cmd(cmd)

            total_commits = 0
            total_time = 0
            with open(output) as handler:
                for line in handler.readlines():
                    if "total_time:" in line:
                        total_time = float(line.replace("INFO: total_time:", ""))
                    if "total_commits:" in line:
                        total_commits = int(line.replace("total_commits:", ""))
            TPUT = total_commits / total_time
            r = "{trd}\t{shard}\t{TPUT}\n".format(shard=shard, trd=trd, TPUT=TPUT)
            results.write(r)
            results.flush()
            cmds.write("\n\n")
            print(r)

if __name__ == "__main__":
    leader_multishards()