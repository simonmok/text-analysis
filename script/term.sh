#!/bin/bash

hdfspath=/user/vagrant/text-analysis
src=/home/vagrant/text-analysis
ext=js
interpretor=nodejs

hdfs dfs -rm -f -r $hdfspath/input
hdfs dfs -mkdir $hdfspath/input
hdfs dfs -put $src/data/*.txt $hdfspath/input
hdfs dfs -rm -f -r $hdfspath/output-term

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
        -D stream.num.map.output.key.fields=2 \
        -files $src/term-map.$ext,$src/term-reduce.$ext \
        -input $hdfspath/input \
        -output $hdfspath/output-term \
        -mapper "$interpretor ./term-map.$ext" \
        -reducer "$interpretor ./term-reduce.$ext"

mkdir -p $src/output

hdfs dfs -cat $hdfspath/output-term/part-* > $src/output/term-output.txt

echo Term analysis done on `date`