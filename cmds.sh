./batch_janus.sh 2
./batch_janus.sh 5
sleep 2

ssh 10.1.0.11 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c1' -p 5555 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c1.log' 2>'/home/azureuser/janus/log/proc-c1.err' &"
sleep 0.1

ssh 10.1.0.12 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c2' -p 5556 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c2.log' 2>'/home/azureuser/janus/log/proc-c2.err' &"
sleep 0.1

ssh 10.1.0.13 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c3' -p 5557 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c3.log' 2>'/home/azureuser/janus/log/proc-c3.err' &"
sleep 0.1

ssh 10.1.0.14 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c4' -p 5558 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c4.log' 2>'/home/azureuser/janus/log/proc-c4.err' &"
sleep 0.1

ssh 10.1.0.15 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c5' -p 5559 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c5.log' 2>'/home/azureuser/janus/log/proc-c5.err' &"
sleep 0.1

ssh 10.1.0.16 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c6' -p 5560 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c6.log' 2>'/home/azureuser/janus/log/proc-c6.err' &"
sleep 0.1

ssh 10.1.0.17 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c7' -p 5561 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c7.log' 2>'/home/azureuser/janus/log/proc-c7.err' &"
sleep 0.1

ssh 10.1.0.18 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c8' -p 5562 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c8.log' 2>'/home/azureuser/janus/log/proc-c8.err' &"
sleep 0.1

ssh 10.1.0.19 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c9' -p 5563 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c9.log' 2>'/home/azureuser/janus/log/proc-c9.err' &"
sleep 0.1

ssh 10.1.0.20 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c10' -p 5564 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c10.log' 2>'/home/azureuser/janus/log/proc-c10.err' &"
sleep 0.1

ssh 10.1.0.21 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c11' -p 5565 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c11.log' 2>'/home/azureuser/janus/log/proc-c11.err' &"
sleep 0.1

ssh 10.1.0.22 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c12' -p 5566 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c12.log' 2>'/home/azureuser/janus/log/proc-c12.err' &"
sleep 0.1

ssh 10.1.0.23 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c13' -p 5567 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c13.log' 2>'/home/azureuser/janus/log/proc-c13.err' &"
sleep 0.1

ssh 10.1.0.24 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c14' -p 5568 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c14.log' 2>'/home/azureuser/janus/log/proc-c14.err' &"
sleep 0.1

ssh 10.1.0.25 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c15' -p 5569 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c15.log' 2>'/home/azureuser/janus/log/proc-c15.err' &"
sleep 0.1

ssh 10.1.0.26 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c16' -p 5570 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c16.log' 2>'/home/azureuser/janus/log/proc-c16.err' &"
sleep 0.1

ssh 10.1.0.29 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c17' -p 5571 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c17.log' 2>'/home/azureuser/janus/log/proc-c17.err' &"
sleep 0.1

ssh 10.1.0.30 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c18' -p 5572 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c18.log' 2>'/home/azureuser/janus/log/proc-c18.err' &"
sleep 0.1

ssh 10.1.0.31 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c19' -p 5573 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c19.log' 2>'/home/azureuser/janus/log/proc-c19.err' &"
sleep 0.1

ssh 10.1.0.32 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c20' -p 5574 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c20.log' 2>'/home/azureuser/janus/log/proc-c20.err' &"
sleep 0.1

ssh 10.1.0.33 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c21' -p 5575 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c21.log' 2>'/home/azureuser/janus/log/proc-c21.err' &"
sleep 0.1

ssh 10.1.0.34 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c22' -p 5576 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c22.log' 2>'/home/azureuser/janus/log/proc-c22.err' &"
sleep 0.1

ssh 10.1.0.35 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c23' -p 5577 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c23.log' 2>'/home/azureuser/janus/log/proc-c23.err' &"
sleep 0.1

ssh 10.1.0.36 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c24' -p 5578 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c24.log' 2>'/home/azureuser/janus/log/proc-c24.err' &"
sleep 0.1

ssh 10.1.0.37 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c25' -p 5579 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c25.log' 2>'/home/azureuser/janus/log/proc-c25.err' &"
sleep 0.1

ssh 10.1.0.38 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c26' -p 5580 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c26.log' 2>'/home/azureuser/janus/log/proc-c26.err' &"
sleep 0.1

ssh 10.1.0.39 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c27' -p 5581 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c27.log' 2>'/home/azureuser/janus/log/proc-c27.err' &"
sleep 0.1

ssh 10.1.0.40 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup  ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'c28' -p 5582 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-c28.log' 2>'/home/azureuser/janus/log/proc-c28.err' &"
sleep 0.1

ssh 10.1.0.7 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup taskset -ac 0-27 ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'p1' -p 5583 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-p1.log' 2>'/home/azureuser/janus/log/proc-p1.err' &"
sleep 0.1

ssh 10.1.0.8 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup taskset -ac 0-27 ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'p2' -p 5584 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-p2.log' 2>'/home/azureuser/janus/log/proc-p2.err' &"
sleep 0.1

ssh 10.1.0.9 "cd /home/azureuser/janus;  ulimit -n 20000;  mkdir -p /home/azureuser/janus/log;  nohup taskset -ac 0-27 ./build/deptran_server -b -d 30 -n 2000 -f 'par-dist/28.yml' -f 'config/tpl_ww_paxos.yml' -f 'config/rw.yml' -P 'p3' -p 5585 -t 10 -r '/home/azureuser/janus/log' 1>'/home/azureuser/janus/log/proc-p3.log' 2>'/home/azureuser/janus/log/proc-p3.err' &"
sleep 0.1

