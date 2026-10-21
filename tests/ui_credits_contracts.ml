import mq3.client.ui_credits as credits
function req(ok,label) if not ok then return error(7762,"credits contract: "+label) end if;return 1 end function
function main(args)
 count=0;rows=credits.draw();count=count+req(len(rows)==20,"all credit lines");count=count+req(rows[0].text=="id Software is:" and rows[0].x==320 and rows[0].y==12,"heading");count=count+req(rows[1].y==40 and rows[2].y==60 and rows[3].y==88,"integer C y progression");count=count+req(rows[18].proportional==false and rows[18].color==[1.0,0.0,0.0,1.0] and rows[19].y==459,"footer rendering");count=count+req(credits.key(credits.K_CHAR_FLAG|65)==[],"characters ignored");count=count+req(credits.key(13)==[[credits.EXEC_APPEND,"quit\n"]],"physical key quits");menu=credits.open();count=count+req(menu.fullscreen and menu.pushed and menu.drawFn==credits.draw and menu.keyFn==credits.key,"fullscreen menu wiring");print("PASS: "+str(count)+" UI credits contracts");return 0
end function
