import fileinput
import os
import re

map_input_file = os.environ['map_input_file']

output = []

for line in fileinput.input():
  line = re.sub(r'[.,?\/#!$%\^&\*;:{}=\-_`~()"\'+|0123456789]', '', line).lower()
  for token in line.split():
    output.append(token)

for token in output:
  print("%s\t%s\t%d\t%d" % (token, map_input_file, 1, len(output)))