ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  nohup taskset -ac 0-15 ./build/deptran_server -b -d 30 -n 300 -f 'par-dist/leader_paxos16_shardidx0.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c1' -p 5555 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-c1.log' 2>'/home/weihai/janus/log/proc-c1.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  nohup taskset -ac 0-15 ./build/deptran_server -b -d 30 -n 300 -f 'par-dist/leader_paxos16_shardidx0.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c2' -p 5556 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-c2.log' 2>'/home/weihai/janus/log/proc-c2.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  nohup taskset -ac 0-15 ./build/deptran_server -b -d 30 -n 300 -f 'par-dist/leader_paxos16_shardidx0.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'localhost' -p 5557 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-localhost.log' 2>'/home/weihai/janus/log/proc-localhost.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  nohup taskset -ac 0-15 ./build/deptran_server -b -d 30 -n 300 -f 'par-dist/leader_paxos16_shardidx0.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'p1' -p 5558 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-p1.log' 2>'/home/weihai/janus/log/proc-p1.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  nohup taskset -ac 0-15 ./build/deptran_server -b -d 30 -n 300 -f 'par-dist/leader_paxos16_shardidx0.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'p2' -p 5559 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-p2.log' 2>'/home/weihai/janus/log/proc-p2.err' &"
sleep 0.1

