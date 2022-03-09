# skill deptran_server; pkill deptran_server;
python3 waf configure build -J
# ./run.py -f par-local/4.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -nc 200 -d 10
# git submodule update --init --recursive
# ./build/deptran_server -d 10 -n 2000 -f par-local/1.yml -f config/tpl_ww_paxos.yml -f config/rw.yml -P p1 -p 5555 -t 10