// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.game_internal_headers as h
function emit(values) output="";for i=0 to len(values)-1 if i>0 then output=output+"," end if;output=output+str(values[i]) end for;print(output);return void end function
function main(args) emit(h.bgLocalConstantValues());emit(h.rankingKeyValues());return 0 end function
