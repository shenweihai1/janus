skill deptran_server; pkill deptran_server; sleep 1

leaderIP="10.1.0.7"
clients=(
	"10.1.0.8" # p1 replica
	"10.1.0.9" # p2 replica
	"10.1.0.11" "10.1.0.12" "10.1.0.13" "10.1.0.14" # client0 ~ client3
	"10.1.0.15" "10.1.0.16" "10.1.0.17" "10.1.0.18" # client4 ~ client7
	"10.1.0.19" "10.1.0.20" "10.1.0.21" "10.1.0.22" # client8 ~ client11
	"10.1.0.23" "10.1.0.24" "10.1.0.25" "10.1.0.26" # client12 ~ client15
	"10.1.0.29" "10.1.0.30" "10.1.0.31" "10.1.0.44" # client16 ~ client19
	"10.1.0.32" "10.1.0.33" "10.1.0.34" "10.1.0.35" # client20 ~ client23
	"10.1.0.36" "10.1.0.37" "10.1.0.38" "10.1.0.39" # client24 ~ client27
	"10.1.0.40" "10.1.0.41" "10.1.0.42" "10.1.0.43" # client28 ~ client31
)

clients1=(
	"$leaderIP" # leader replica
	"10.1.0.8" # p1 replica
	"10.1.0.9" # p2 replica
	"10.1.0.11" "10.1.0.12" "10.1.0.13" "10.1.0.14" # client0 ~ client3
	"10.1.0.15" "10.1.0.16" "10.1.0.17" "10.1.0.18" # client4 ~ client7
	"10.1.0.19" "10.1.0.20" "10.1.0.21" "10.1.0.22" # client8 ~ client11
	"10.1.0.23" "10.1.0.24" "10.1.0.25" "10.1.0.26" # client12 ~ client15
	"10.1.0.29" "10.1.0.30" "10.1.0.31" "10.1.0.44" # client16 ~ client19
	"10.1.0.32" "10.1.0.33" "10.1.0.34" "10.1.0.35" # client20 ~ client23
	"10.1.0.36" "10.1.0.37" "10.1.0.38" "10.1.0.39" # client24 ~ client27
	"10.1.0.40" "10.1.0.41" "10.1.0.42" "10.1.0.43" # client28 ~ client31
)

cmd1="cd ~ && rm -rf janus && scp -r azureuser@$leaderIP:/home/azureuser/janus ." 
cmd2="skill deptran_server; pkill deptran_server; skill deptran_server; pkill deptran_server; sleep 1; "
cmd3="cd ~/janus && ./install_janus.sh"
cmd4="ps aux|grep deptran_server; hostname; echo ''" 
cmd5="cd ~/janus/log && rm -rf *"
cmd6="echo ''"

for host in ${clients[@]}
do
  if [ $1 == 'scp' ]; then
    echo "scp to $host"
    ssh $host "$cmd1" &
  elif [ $1 == 'kill' ]; then
    echo "skill host $host"
    ssh $host "$cmd2" &
  elif [ $1 == 'install' ]; then
    echo "install janus dependencies: $host"
    ssh $host "$cmd3" &
  elif [ $1 == 'ps' ]; then
	  :
  else
	  :
  fi 
done

for host in ${clients1[@]}
do
  if [ $1 == 'scp' ]; then
	  :
  elif [ $1 == 'kill' ]; then
	  :
  elif [ $1 == 'install' ]; then
	  :
  elif [ $1 == 'ps' ]; then
    echo "ps deptran_server: $host"
    ssh $host "$cmd4" &
    echo ""
  elif [ $1 == 'del' ]; then
    echo "delete logs: $host"
    ssh $host "$cmd5" &
    echo ""
  elif [ $1 == 'echo' ]; then
    ssh $host "$cmd6" 
    echo ""
  else
	  :
  fi 
done


echo "Wait for jobs..."
# wait for completion
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

