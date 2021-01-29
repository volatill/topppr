#!/bin/bash

file=$1
dataset_array=("dblp" "lj") #"pokec" "lj" "orkut" "twitter")
workload_array=("20" "50" "80")
mkdir topppr_result
for dataset in "${dataset_array[@]}"; do
	for i in "${workload_array[@]}"; do
		./TopPPR -d ${dataset} -algo TopPPR -r 0.99 -n ${i} -k 500 | tee topppr_result/${dataset}_${i}_result.txt
	done
done

for dataset in "${dataset_array[@]}"; do
	for i in "${workload_array[@]}"; do
		echo ""
		echo "dataset:$dataset   query num:$i  "
		cat topppr_result/${dataset}_${i}_result.txt| tail -n 5
	done
done
