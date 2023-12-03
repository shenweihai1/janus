#!/bin/bash

skill deptran_server; pkill deptran_server; sleep 1

leaders=(
10.1.0.48
10.1.0.49
10.1.0.50
10.1.0.51
10.1.0.53
10.1.0.52
10.1.0.54
10.1.0.55
10.1.0.56
10.1.0.57
)
learners=(
10.1.0.68
10.1.0.69
10.1.0.70
10.1.0.71
10.1.0.72
10.1.0.73
10.1.0.75
10.1.0.74
10.1.0.76
10.1.0.77
)
p1s=(
10.1.0.28
10.1.0.29
10.1.0.37
10.1.0.36
10.1.0.39
10.1.0.38
10.1.0.35
10.1.0.34
10.1.0.45
10.1.0.32
)
p2s=(
10.1.0.88
10.1.0.89
10.1.0.91
10.1.0.90
10.1.0.92
10.1.0.93
10.1.0.94
10.1.0.95
10.1.0.96
10.1.0.97
)

n_partitions=$1
cmd=$2
leaders=("${leaders[@]:0:$n_partitions}")
learners=("${learners[@]:0:$n_partitions}")
p1s=("${p1s[@]:0:$n_partitions}")
p2s=("${p2s[@]:0:$n_partitions}")

servers=( "${leaders[@]}" "${learners[@]}" "${p1s[@]}" "${p2s[@]}" )


cmd1="" 
cmd2="skill deptran_server; pkill deptran_server; skill deptran_server; pkill deptran_server; sleep 1; "
cmd3="cd ~/janus && ./install_janus.sh"
cmd4="ps aux|grep deptran_server; hostname; echo ''" 
cmd5="cd ~/janus/log && rm -rf *"
cmd6="echo ''"

for host in ${servers[@]}
do
  if [ $cmd == 'kill' ]; then
    echo "skill host $host, $cmd2"
    ssh $host "$cmd2" &
  elif [ $cmd == 'install' ]; then
    echo "install janus dependencies: $host"
    ssh $host "$cmd3" &
  elif [ $cmd == 'ps' ]; then
    echo "ps deptran_server: $host"
    ssh $host "$cmd4" &
    echo ""
  elif [ $cmd == 'del' ]; then
    echo "delete logs: $host"
    ssh $host "$cmd5" &
    echo ""
  elif [ $cmd == 'cmd' ]; then
    echo "cmd: $host, $3"
    ssh $host "$3"
  elif [ $cmd == 'echo' ]; then
    ssh $host "$cmd6" 
    echo ""
  else
	  :
  fi 
done

# wait for completion
echo "Wait for jobs..."
FAIL=0

for job in `jobs -p`
do
    wait $job || let "FAIL+=1"
done

if [ "$FAIL" == "0" ];
then
    echo "YAY!"
else
    echo "FAIL! ($FAIL)"
fi

