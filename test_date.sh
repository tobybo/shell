offset=`ntpdate -q 202.112.29.82 |head -n1 |awk -F"[ ,]" '{print $8}'`
offset=${offset%.*}
now=`date +%s`
date_str=`date -d @"$[ $now + $offset ]"`
echo "$date_str [$1]"
