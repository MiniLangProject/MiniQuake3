// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.format.deflate as df
import mq3.format.pk3 as pk3
import std.fs as fs
import std.string as strings

function main(args)
  count = 0
  for each line in fs.readAllLines(args[0])
    line = strings.trim(line)
    if len(line) == 0 then continue end if
    fields = strings.split(line, "\t")
    print "case " + str(count) + " " + fields[0] + " " + fields[1]
    expected = fs.readAllBytes(fields[2])
    actual = void
    if fields[0] == "deflate" then
      actual = df.inflate(fs.readAllBytes(fields[1]), len(expected))
    else
      archive = pk3.open(fields[0])
      actual = pk3.read(archive, fields[1])
    end if
    if bytesCompare(actual, expected) != 0 then
      print "FAIL: " + fields[0] + " / " + fields[1]
      return 1
    end if
    count = count + 1
  end for
  print "PASS: " + str(count) + " archive/DEFLATE byte comparisons"
  return 0
end function
