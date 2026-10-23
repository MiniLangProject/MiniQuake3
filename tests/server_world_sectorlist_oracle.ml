// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.world as world

function fixture()
  entities=[]
  for index=0 to 6 entities=entities+[world.entity(index)] end for
  sectors=[]
  for index=0 to 30 sectors=sectors+[world.Sector(-1,0.0,[-1,-1],-1)] end for
  sectors[0].head=0;entities[0].nextEntity=1;entities[1].nextEntity=2
  sectors[7].head=3
  sectors[30].head=4;entities[4].nextEntity=5
  return world.Scene(void,entities,sectors)
end function

function main(args)
  for each line in world.sectorList(fixture())
    print decode(slice(bytes(line),0,len(bytes(line))-1))
  end for
  return 0
end function
