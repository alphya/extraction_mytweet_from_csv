import parsecsv, streams
import os

let filename = "tweets.csv"

var s = newFileStream(filename, fmRead)
if s == nil: quit("cannot open the file" & filename)

let f : File = open("result.txt" ,FileMode.fmWrite)

var p: CsvParser
open(p, s, filename)

p.readHeaderRow()

while readRow(p):
  if p.rowEntry("retweeted_status_user_id") == "":
    f.write(p.rowEntry("text") & "\n")

close(p)
close(f)