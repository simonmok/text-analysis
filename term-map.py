import fileinput
import os
import re

map_input_file = os.environ['map_input_file']
pattern = re.compile(r'[.,?/\\#!$%\^&\*;:{}=\-_`~()"\'+|\d\[\]@<>]')
output = []

for line in fileinput.input():
  line = pattern.sub('', line).lower()
  output.extend(line.split())

for token in output:
  print("%s\t%s\t%d\t%d" % (token, map_input_file, 1, len(output)))