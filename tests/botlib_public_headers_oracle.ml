// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.public_headers as h
function main(args)
  names=h.constantNames();values=h.constantValues()
  for index=0 to len(names)-1 print(names[index]+"="+str(values[index])) end for
  types=h.typeNames();sizes=h.abiSizes()
  for index=0 to len(types)-1 print("sizeof("+types[index]+")="+str(sizes[index])) end for
  return 0
end function
