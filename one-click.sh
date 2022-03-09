experiment1() {
  mkdir -p results
  sleep 1 
  ./batch_janus.sh kill
  ./run.py -f par-dist/4.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T 4 > ./results/4.log 2>&1

  sleep 1 
  ./batch_janus.sh kill
  ./run.py -f par-dist/8.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T 8 > ./results/8.log 2>&1

  sleep 1 
  ./batch_janus.sh kill
  ./run.py -f par-dist/12.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T 12 > ./results/12.log 2>&1

  sleep 1 
  ./batch_janus.sh kill
  ./run.py -f par-dist/16.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T 16 > ./results/16.log 2>&1

  sleep 1 
  ./batch_janus.sh kill
  ./run.py -f par-dist/20.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T 20 > ./results/20.log 2>&1

  sleep 1 
  ./batch_janus.sh kill
  ./run.py -f par-dist/24.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T 24 > ./results/24.log 2>&1

  sleep 1 
  ./batch_janus.sh kill
  ./run.py -f par-dist/28.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 2000 -d 30 -T 28 > ./results/28.log 2>&1
}

experiment1
