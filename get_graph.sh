#!/bin/bash

file=$1
dataset_array=("webstanford" "dblp" "pokec" "lj" "orkut" "twitter")
mkdir ppr-answer
for dataset in "${dataset_array[@]}"; do
	mkdir ppr-answer/${dataset}
	n=$(cat ../../${file}/data/${dataset}/attribute.txt | head -n 1 | cut -d"=" -f 2)
	cp ../../${file}/data/${dataset}/graph.txt dataset/${dataset}.txt
	sed -i "1i${n}" dataset/${dataset}.txt
 	./TopPPR -d ${dataset} -algo GEN_QUERY -n 100
	./TopPPR -d ${dataset} -algo GEN_GROUND_TRUTH	-n 100
done
