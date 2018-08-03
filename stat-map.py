from __future__ import division
import fileinput
import math
import os

count = int(os.environ['FILE_COUNT'])

for line in fileinput.input():
  term, file, tf, length, df = line.split()
  print("%s\t%s\t%f" % (term, file, int(tf) / int(length) * math.log(count / int(df))))