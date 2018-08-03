#!/bin/bash

hdfspath=/user/vagrant/text-analysis
src=/home/vagrant/text-analysis
ext=js
interpretor=nodejs

hdfs dfs -rm -f -r $hdfspath
hdfs dfs -mkdir -p $hdfspath/term-input
hdfs dfs -put $src/data/*.txt $hdfspath/term-input
hdfs dfs -rm -f -r $hdfspath/term-output

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
        -D stream.num.map.output.key.fields=2 \
        -files $src/term-map.$ext,$src/term-reduce.$ext \
        -input $hdfspath/term-input \
        -output $hdfspath/term-output \
        -mapper "$interpretor ./term-map.$ext" \
        -reducer "$interpretor ./term-reduce.$ext"

mkdir -p $src/output

hdfs dfs -cat $hdfspath/term-output/part-* > $src/output/term.txt

echo Term analysis done on `date`