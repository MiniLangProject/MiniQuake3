import mq3.client.cgame_console_commands as c

function joined(values) text="";first=true;for each value in values if not first then text=text+";" end if;text=text+value;first=false end for;return text end function
function pairs(values) text="";first=true;for each value in values if not first then text=text+";" end if;text=text+value[0]+"="+value[1];first=false end for;return text end function
function menus(values) text="";first=true;for each row in values if not first then text=text+";" end if;if row[0]=="load" then text=text+"string-init;menu-reset;load:"+row[1] else feeder=1;if row[1]=="redteam" then feeder=2 else if row[1]=="blueteam" then feeder=3 end if;down=0;if row[2]=="down" then down=1 end if;text=text+"scroll:"+str(feeder)+":"+str(down) end if;first=false end for;return text end function
function center(effect) if len(effect.centerPrint)==0 then return "" end if;row=effect.centerPrint[0];return row[0]+":"+str(row[1])+":"+str(row[2]) end function
function boolInt(value) if value then return 1 end if;return 0 end function
function row(name,effect,state,selected) print(name+"|"+joined(effect.consoleCommands)+"|"+joined(effect.clientCommands)+"|"+pairs(effect.cvarSets)+"|"+menus(effect.menuActions)+"|"+joined(effect.sounds)+"|"+center(effect)+"|"+str(selected)+"|"+str(state.currentOrder)+"|"+str(boolInt(state.orderPending))+"|"+str(state.orderTime)+"|"+str(state.acceptOrderTime));return void end function
function fresh() return c.create() end function
function main(args)
  s=fresh();row("loadhud",c.loadHud(s,""),s,0)
  s=fresh();s.scoreboardShowing=true;row("scroll-down",c.scrollScores(s,true),s,0)
  s=fresh();s.scoreboardShowing=true;row("scroll-up",c.scrollScores(s,false),s,0)
  s=fresh();effect=c.singlePlayerResult(true);effect.sounds=["11"];row("sp-win",effect,s,0)
  s=fresh();effect=c.singlePlayerResult(false);effect.sounds=["22"];row("sp-lose",effect,s,0)
  s=fresh();s.teamPlayerCount=1;c.nextTeamMember(s);c.prevTeamMember(s);row("team-member",c.result(true),s,0)
  s=fresh();s.teamLeader=false;s.selectedIsSelf=false;s.currentOrder=c.TEAMTASK_FOLLOW;row("order-blocked",c.nextOrder(s,0),s,0)
  s=fresh();s.teamLeader=true;s.currentOrder=c.TEAMTASK_FOLLOW;row("order-skip",c.nextOrder(s,500),s,0)
  s=fresh();s.acceptLeader=2;s.acceptTask=c.TEAMTASK_DEFENSE;s.acceptOrderTime=1000;row("confirm",c.confirmOrder(s,900),s,0)
  s=fresh();s.acceptLeader=3;s.acceptOrderTime=1000;row("deny",c.denyOrder(s,900),s,0)
  s=fresh();row("offense-ctf",c.taskOffense(c.GT_CTF),s,0)
  s=fresh();row("offense",c.taskOffense(0),s,0)
  s=fresh();row("defense",c.taskDefense(),s,0)
  s=fresh();row("patrol",c.taskPatrol(),s,0)
  s=fresh();row("camp",c.taskCamp(),s,0)
  s=fresh();row("follow",c.taskFollow(),s,0)
  s=fresh();row("retrieve",c.taskRetrieve(),s,0)
  s=fresh();row("escort",c.taskEscort(),s,0)
  s=fresh();row("ownflag",c.taskOwnFlag(),s,0)
  s=fresh();row("suicide",c.taskSuicide(4),s,0)
  s=fresh();row("taunt-kill",c.tauntKillInsult(),s,0)
  s=fresh();row("taunt-praise",c.tauntPraise(),s,0)
  s=fresh();row("taunt",c.tauntTaunt(),s,0)
  s=fresh();row("taunt-death",c.tauntDeathInsult(),s,0)
  s=fresh();row("taunt-gauntlet",c.tauntGauntlet(),s,0)
  return 0
end function
