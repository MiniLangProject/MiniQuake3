import mq3.client.cgame_scoreboard as board
function emit(y,text) command=board.centerGiantLine(y,text);print(str(command.x)+".0|"+str(command.y)+".0|"+command.text+"|1.0,1.0,1.0,1.0|"+str(board.GIANT_WIDTH)+"|"+str(board.GIANT_HEIGHT));return void end function
function main(args) emit(8,"Scoreboard");emit(64,"1:05");emit(12,"^1RED^7 wins");return 0 end function
