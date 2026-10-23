// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_ai_headers as h

function main(args)
  values=h.constantValues();output=""
  for index=0 to len(values)-1
    if index>0 then output=output+"," end if
    output=output+str(values[index])
  end for
  print(output)
  return 0
end function
