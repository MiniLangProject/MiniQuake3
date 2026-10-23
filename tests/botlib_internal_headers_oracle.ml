// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.internal_headers as h

function main(args)
  for each value in h.constantValues() print(str(value)) end for
  values=h.x86AbiSizes();line="ABI";for each value in values line=line+","+str(value) end for;print(line)
  return 0
end function
