# 运行：CUDA_VISIBLE_DEVICES=5 bash ./exper_xmy/average_time.sh
# CUDA_VISIBLE_DEVICES=5 ./bin/cg -v 3
#!/bin/bash
# 运行次数
num_runs=5
total_time=0

# 循环运行命令并累计执行时间
for ((i=1; i<=$num_runs; i++))
do
    output=$(./bin/cg -v 8)
    time=$(echo "$output" | grep "Execution time:" | awk '{print $3}')
    echo "execution time: $time s"
    total_time=$(echo "$total_time + $time" | bc -l);
    # total_time=$(echo "$total_time + $time" | awk '{printf $0}');
    # echo "total time: $total_time s"
done

# 计算平均执行时间
average_time=$(echo "$total_time / $num_runs" | bc -l)
# average_time=$(echo "$total_time / $num_runs" | awk '{printf "%.2f", $0}')

# 输出结果
echo "Average execution time: $average_time s"
