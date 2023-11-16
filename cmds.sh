ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  taskset -ac 0-127 ./build/deptran_server -b -d 30 -n 100 -f 'par-dist/leader_multi_paxos8_1.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c1_0' -p 5555 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-c1_0.log' 2>'/home/weihai/janus/log/proc-c1_0.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  taskset -ac 0-127 ./build/deptran_server -b -d 30 -n 100 -f 'par-dist/leader_multi_paxos8_1.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c2_0' -p 5556 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-c2_0.log' 2>'/home/weihai/janus/log/proc-c2_0.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  taskset -ac 0-127 ./build/deptran_server -b -d 30 -n 100 -f 'par-dist/leader_multi_paxos8_1.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'localhost_0' -p 5557 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-localhost_0.log' 2>'/home/weihai/janus/log/proc-localhost_0.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  taskset -ac 0-127 ./build/deptran_server -b -d 30 -n 100 -f 'par-dist/leader_multi_paxos8_1.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'p1_0' -p 5558 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-p1_0.log' 2>'/home/weihai/janus/log/proc-p1_0.err' &"
sleep 0.1

ssh 127.0.0.1 "cd /home/weihai/janus;  ulimit -n 20000;  mkdir -p /home/weihai/janus/log;  taskset -ac 0-127 ./build/deptran_server -b -d 30 -n 100 -f 'par-dist/leader_multi_paxos8_1.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'p2_0' -p 5559 -t 10 -r '/home/weihai/janus/log' 1>'/home/weihai/janus/log/proc-p2_0.log' 2>'/home/weihai/janus/log/proc-p2_0.err' &"
sleep 0.1

