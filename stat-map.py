from __future__ import division
import fileinput
import math
import os

count = int(os.environ['FILE_COUNT'])

for line in fileinput.input():
  fields = line.split("\t")
  term = fields[0]
  file = fields[1]
  tf = int(fields[2])
  length = int(fields[3])
  df = int(fields[4])
  print("%s\t%s\t%f" % (term, file, tf / length * math.log(count / df)))