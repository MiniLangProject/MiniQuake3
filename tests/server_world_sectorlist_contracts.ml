// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.world as world

struct Capture lines end struct
function require(ok,label) if not ok then return error(7894,"sv_world sectorlist: "+label) end if;return 1 end function
function capture(context,text) context.lines=context.lines+[text];return void end function
function fixture()
  entities=[];for index=0 to 7 entities=entities+[world.entity(index)] end for
  sectors=[];for index=0 to 30 sectors=sectors+[world.Sector(-1,0.0,[-1,-1],-1)] end for
  sectors[0].head=0;entities[0].nextEntity=1;entities[1].nextEntity=2
  sectors[3].head=3;entities[3].nextEntity=4;entities[4].nextEntity=5;entities[5].nextEntity=6
  sectors[30].head=7
  return world.Scene(void,entities,sectors)
end function
function main(args)
  scene=fixture();context=Capture([]);count=0
  count=count+require(world.SV_SectorList_f(scene,capture,context)==64,"all static slots emitted")
  count=count+require(len(context.lines)==64,"callback count")
  count=count+require(context.lines[0]=="sector 0: 3 entities\n","root chain count")
  count=count+require(context.lines[3]=="sector 3: 4 entities\n","internal chain count")
  count=count+require(context.lines[30]=="sector 30: 1 entities\n","leaf chain count")
  count=count+require(context.lines[31]=="sector 31: 0 entities\n" and context.lines[63]=="sector 63: 0 entities\n","unused static slots")
  lines=world.sectorList(scene);count=count+require(lines==context.lines,"pure and callback surfaces agree")
  scene.entities[2].nextEntity=7;lines=world.sectorList(scene);count=count+require(lines[0]=="sector 0: 4 entities\n","live intrusive-chain update")
  print("PASS: "+str(count)+" SV_SectorList_f contracts");return 0
end function
