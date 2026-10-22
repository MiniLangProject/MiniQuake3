import mq3.game.ai_team as team
function fixture(count,aggressive)
 s=team.create();s.maxclients=count;s.helper.maxclients=count
 for i=0 to count-1 s.names[i]="P"+str(i);s.configs[i]="\\n\\P"+str(i)+"\\t\\1";s.travelTimes[i]=i+1 end for
 b=team.createBot(0);b.numteammates=count;b.flagcarrier=-1;if aggressive then b.ctfstrategy=team.CTFS_AGRESSIVE end if;return [s,b]
end function
function dump(label,pair,mode)
 s=pair[0];b=pair[1]
 if mode==0 then team.Bot1FCTFOrders_FlagAtCenter(s,b,false) else if mode==1 then team.Bot1FCTFOrders_EnemyHasFlag(s,b,false) else if mode==2 then team.BotObeliskOrders(s,b,false) else team.BotHarvesterOrders(s,b,false) end if
 text=label+"=";first=true
 for each action in s.actions if action.kind!="initial-chat" then continue end if;if not first then text=text+"|" end if;first=false;text=text+"C:"+action.text+":"+action.args[0] end for
 print(text);return void
end function
function main(args)
 dump("center2-p",fixture(2,false),0);dump("center3-p",fixture(3,false),0);dump("center3-a",fixture(3,true),0);dump("center5-p",fixture(5,false),0);dump("center5-a",fixture(5,true),0);dump("enemy2-p",fixture(2,false),1);dump("enemy3-p",fixture(3,false),1);dump("enemy3-a",fixture(3,true),1);dump("enemy5-p",fixture(5,false),1);dump("enemy5-a",fixture(5,true),1);dump("obelisk-p",fixture(5,false),2);dump("obelisk-a",fixture(5,true),2);dump("harvest-p",fixture(5,false),3);dump("harvest-a",fixture(5,true),3);return 0
end function
