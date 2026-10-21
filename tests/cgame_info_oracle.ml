import mq3.client.cgame_info as cginfo
function main(args) state=cginfo.create();state.playerIcons=[11,12];for index=0 to 13 state.itemIcons=state.itemIcons+[100+index] end for;for each command in cginfo.drawLoadingIcons(state) print(str(command.x)+"|"+str(command.y)+"|"+str(command.width)+"|"+str(command.height)+"|"+str(command.asset)) end for;return 0 end function
