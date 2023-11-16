import collections

config={
    # each line is one shard
    "base_0": [(101, 7001),(201, 7101),(301, 7201),(401, 7301)],
    "base_1": [(101, 8001),(201, 8101),(301, 8201),(401, 8301)],
    "base_2": [(101, 9001),(201, 9101),(301, 9201),(401, 9301)],
    "base_3": [(101, 7501),(201, 7601),(301, 7701),(401, 7801)],
    "base_4": [(101, 8501),(201, 8601),(301, 8701),(401, 8801)],
    "base_5": [(101, 9501),(201, 9601),(301, 9701),(401, 9801)],
    "base_6": [(101, 10501),(201, 10601),(301, 10701),(401, 10801)],
    "base_7": [(101, 11501),(201, 11601),(301, 11701),(401, 11801)],
    "base_8": [(101, 12501),(201, 12601),(301, 12701),(401, 12801)],
    "base_9": [(101, 13501),(201, 13601),(301, 13701),(401, 13801)],
}
nshards = 10
leaderClientsPerCore = 4 # must even

def getLeaderBasedShardsInfo(prefix=""):
    ips = []
    for e in open("../bash/ips.pub","r").readlines():
        ips.append(e.strip())
    
    n_partitions=-1
    with open('../bash/n_partitions', 'r') as file:
        file_contents = file.read()
        n_partitions = int(file_contents)

    data = collections.defaultdict(list)
    data["n_partitions"] = n_partitions
    for i in range(n_partitions):
        data["c1"].append(ips[n_partitions*0+i]) # learner
        data["c2"].append(ips[n_partitions*1+i]) # localhost
        data["localhost"].append(ips[n_partitions*2+i]) # p1
        data["p12"].append(ips[n_partitions*3+i]) # p2

    return data


# 2PL+Paxos
# 20 for clients, 10 for leader, 10 for p1+p2
def convertLeaderBasedYamlByShard(shardIdx):
    shardInfo = getLeaderBasedShardsInfo("pub")
    template="template_leader_shard.yml"
    base = config["base_"+str(shardIdx)]

    
    for w_id in range(1, 32+1):
        file_name="leader_paxos{w_id}_shardidx{sIdx}.yml".format(w_id=w_id,sIdx=shardIdx)
        content = ""
        for line in open(template, "r").readlines():
            skip=False
            for p in ["c1","c2","localhost","p1", "p2"]:
                if p in line:
                    skip=True
            
            if not skip:
                content += line

            if "server:" in line:
                servers = ""
                for i in range(w_id): 
                    servers += '    - ["s{n0}:{p0}", "s{n1}:{p1}", "s{n2}:{p2}"]\n'.format(
                        n0=base[0][0]+i, p0=base[0][1]+i,
                        n1=base[1][0]+i, p1=base[1][1]+i,
                        n2=base[2][0]+i, p2=base[2][1]+i,
                    )
                content += servers    
            
            if "client:" in line:
                clients = ""
                for i in range(w_id):
                    cc = ""
                    for j in range(1,leaderClientsPerCore+1):
                        cc += "c{n0}".format(n0=100*j+i+1)
                        if j < leaderClientsPerCore:
                            cc += ", "
                    clients += '    - [{c}]\n'.format(c=cc)
                content += clients 

            if "process:" in line:
                processes = ""
                for i in range(w_id):
                    processes += "  s{n0}: localhost\n".format(n0=base[0][0]+i)
                    processes += "  s{n1}: p1\n".format(n1=base[1][0]+i)
                    processes += "  s{n2}: p2\n".format(n2=base[2][0]+i)
                
                for i in range(w_id):
                    for j in range(1,leaderClientsPerCore+1):
                        processes += "  c{n0}: c{c}\n".format(n0=100*j+i+1,c=1 if j<=leaderClientsPerCore/2 else 2)
                content += processes

            for p in ["c1","c2","localhost","p1","p2"]:
                if p in line:
                    if p == "p1" or p == "p2":
                        p = "p12"

                    line = line.replace("127.0.0.1", shardInfo[p][shardIdx])
                    content += line

        f = open(file_name, "w")
        f.write(content)
        f.close()


if __name__ == "__main__":
    for shardIdx in range(nshards):
        convertLeaderBasedYamlByShard(shardIdx)