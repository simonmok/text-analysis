#!/bin/bash

hdfspath=/user/vagrant/text-analysis
src=/home/vagrant/text-analysis
ext=js
interpretor=nodejs

count=`ls $src/data | wc -l`

hdfs dfs -rm -f -r $hdfspath/stat-output

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
        -D stream.num.map.output.key.fields=2 \
        -D FILE_COUNT=$count \
        -files $src/stat-map.$ext \
        -input $hdfspath/document-output \
        -output $hdfspath/stat-output \
        -mapper "$interpretor ./stat-map.$ext" \
        -reducer org.apache.hadoop.mapred.lib.IdentityReducer

hdfs dfs -cat $hdfspath/stat-output/part-* > $src/output/stat.txt

echo Stat analysis done on `date`