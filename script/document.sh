#!/bin/bash

hdfspath=/user/vagrant/text-analysis
jspath=/home/vagrant/text-analysis

hdfs dfs -rm -f -r $hdfspath/output-document

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
        -D stream.num.map.output.key.fields=1 \
        -files $jspath/document-map.js,$jspath/document-reduce.js \
        -input $hdfspath/output-term \
        -output $hdfspath/output-document \
        -mapper 'nodejs ./document-map.js' \
        -reducer 'nodejs ./document-reduce.js'

hdfs dfs -cat $hdfspath/output-document/part-* > $jspath/output/document-output.txt

echo Document analysis done on `date`