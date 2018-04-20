#!/bin/bash

hdfspath=/user/vagrant/text-analysis
jspath=/home/vagrant/text-analysis
count=`ls $jspath/data | wc -l`

hdfs dfs -rm -f -r $hdfspath/output-stat

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
        -D stream.num.map.output.key.fields=2 \
        -D FILE_COUNT=$count \
        -files $jspath/stat-map.js \
        -input $hdfspath/output-document \
        -output $hdfspath/output-stat \
        -mapper 'nodejs ./stat-map.js' \
        -reducer org.apache.hadoop.mapred.lib.IdentityReducer

hdfs dfs -cat $hdfspath/output-stat/part-* > $jspath/output/stat-output.txt

echo Stat analysis done on `date`