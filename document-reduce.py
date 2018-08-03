import fileinput

curdf = 0
curterm = ''
buffer = []

def outputLine(buffer, df):
  for item in buffer:
    print("%s\t%d" % (item, df))

for line in fileinput.input():
  term, file, tf, length, df = line.split()
  tf = int(tf)
  length = int(length)
  df = int(df)
  if (term == curterm):
    curdf += df
  else:
    outputLine(buffer, curdf)
    del buffer[:]
    curterm = term
    curdf = df
  buffer.append("%s\t%s\t%d\t%d" % (term, file, tf, length))

outputLine(buffer, curdf)