rm -rf log_*
cd bin
python3 runner.py --cpu_count=$1 --amount=$2 --average=$3 --max_online=$4
