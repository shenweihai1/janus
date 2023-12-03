shards=2
for ((i=0;i<shards;i++)); do
  log="proc-c1_$i.log"
  echo $log; 
  cat $log| ag 'TPUT'| ag 'TPUT' | wc -l
  cat $log| ag 'TPUT'| awk '{sum += $2} END {print sum}'
  echo ""
  log="proc-c2_$i.log"
  echo $log; 
  cat $log| ag 'TPUT'| ag 'TPUT' | wc -l
  cat $log| ag 'TPUT'| awk '{sum += $2} END {print sum}'
  echo ""
done

log="proc-c*.log"
echo "Total: ";cat $log| ag 'TPUT'| awk '{sum += $2} END {print sum}'
