import fileinput

prevnum = 0
prevterm = ''
prevfile = ''
prevlength = 0

def outputLine(term, file, num, length):
  if (num > 0):
    print("%s\t%s\t%d\t%d" % (term, file, num, length))
  return

for line in fileinput.input():
  fields = line.split("\t")
  term = fields[0]
  file = fields[1]
  num = int(fields[2])
  length = int(fields[3])
  if (term == prevterm and file == prevfile):
    prevnum += num
  else:
    outputLine(prevterm, prevfile, prevnum, prevlength)
    prevterm = term
    prevfile = file
    prevnum = num
    prevlength = length

outputLine(prevterm, prevfile, prevnum, prevlength)