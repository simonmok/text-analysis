import fileinput

curdf = 0
curterm = ''
buffer = []

def outputLine(buffer, df):
  for item in buffer:
    print("%s\t%d" % (item, df))
  return

for line in fileinput.input():
  fields = line.split("\t")
  term = fields[0]
  file = fields[1]
  tf = int(fields[2])
  length = int(fields[3])
  df = int(fields[4])
  if (term == curterm):
    curdf += df
  else:
    outputLine(buffer, curdf)
    del buffer[:]
    curterm = term
	curdf = df
  buffer.append("%s\t%s\t%d\t%d" % (term, file, tf, length))

outputLine(buffer, curdf)