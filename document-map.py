import fileinput

for line in fileinput.input():
  print ("%s\t%d" % (line.rstrip(), 1))