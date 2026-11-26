// The typed DotProduct result remains a tagged float and preserves failures.
import mq3.shared.math as qmath

function main(args)
  value=qmath.DotProduct([1,2,3],[4,5,6])
  if typeof(value)!="float" or value!=32.0 then return 2 end if
  if not (try(qmath.DotProduct([1,2],[4,5,6])) is error) then return 3 end if
  if not (try(qmath.DotProduct("bad",[4,5,6])) is error) then return 4 end if
  print "PASS: DotProduct float tag and errors"
  return 0
end function
