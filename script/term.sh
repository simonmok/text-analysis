#!/bin/bash

hdfspath=/user/vagrant/text-analysis
jspath=/home/vagrant/text-analysis

hdfs dfs -rm -f -r $hdfspath/output-term

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
        -D stream.num.map.output.key.fields=2 \
        -files $jspath/term-map.js,$jspath/term-reduce.js \
        -input $hdfspath/input \
        -output $hdfspath/output-term \
        -mapper 'nodejs ./term-map.js' \
        -reducer 'nodejs ./term-reduce.js'

mkdir -p $jspath/output

hdfs dfs -cat $hdfspath/output-term/part-* > $jspath/output/term-output.txt

echo Term analysis done on `date`