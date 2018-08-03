import fileinput

prevterm, prevfile, prevnum, prevlength = '', '', 0, 0

def outputLine(term, file, num, length):
  if (num > 0):
    print("%s\t%s\t%d\t%s\t" % (term, file, num, length))

for line in fileinput.input():
  term, file, num, length = line.split()
  num = int(num)
  if (term == prevterm and file == prevfile):
    prevnum += num
  else:
    outputLine(prevterm, prevfile, prevnum, prevlength)
    prevterm, prevfile, prevnum, prevlength = term, file, num, length

outputLine(prevterm, prevfile, prevnum, prevlength)