import fileinput
import sys

for line in fileinput.input():
  sys.stdout.write(line)