// SPDX-License-Identifier: GPL-2.0-or-later
function main(args)
  tag=10;while tag<=13
    handicap=75;maximum=handicap;health=100;armor=99
    if tag==11 then maximum=2*handicap;health=maximum;armor=maximum else if tag==10 then armor=0 end if
    print("persistent|"+str(tag)+"|"+str(maximum)+"|"+str(health)+"|"+str(armor));tag=tag+1
  end while
  return 0
end function
