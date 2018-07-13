#!/bin/bash

hdfspath=/user/vagrant/text-analysis
src=/home/vagrant/text-analysis
ext=js
interpretor=nodejs

hdfs dfs -rm -f -r $hdfspath/output-document

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
        -D stream.num.map.output.key.fields=1 \
        -files $src/document-map.$ext,$src/document-reduce.$ext \
        -input $hdfspath/output-term \
        -output $hdfspath/output-document \
        -mapper "$interpretor ./document-map.$ext" \
        -reducer "$interpretor ./document-reduce.$ext"

hdfs dfs -cat $hdfspath/output-document/part-* > $src/output/document-output.txt

echo Document analysis done on `date`