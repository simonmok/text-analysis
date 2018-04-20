#!/bin/bash
 
hdfspath=/user/vagrant/text-analysis

hdfs dfs -rm -f -r $hdfspath/output-term
hdfs dfs -rm -f -r $hdfspath/output-document
hdfs dfs -rm -f -r $hdfspath/output-stat

oozie job -oozie http://localhost:11000/oozie -config ./job.properties -run