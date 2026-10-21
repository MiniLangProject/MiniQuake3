import mq3.client.cgame_info as cginfo
function req(value,message) if not value then return error(7700,message) end if;return 1 end function
function assets(path) return path=="models/players/sarge/icon_default.tga" or path=="levelshots/q3dm1.tga" end function
function main(args)
 count=0;state=cginfo.create();cginfo.loadingString(state,"Preparing arena");count=count+req(state.infoScreenText=="Preparing arena" and state.updates==1,"loading string/update")
 for index=0 to 27 cginfo.loadingItem(state,"icons/item.tga","Item "+str(index),index) end for;count=count+req(len(state.itemIcons)==26 and state.infoScreenText=="Item 27" and state.updates==29,"item cap and progress")
 chosen=cginfo.loadingClient(state,"\\model\\unknown/red\\n\\^1Sarge",cginfo.GT_SINGLE_PLAYER,assets);count=count+req(chosen=="models/players/sarge/icon_default.tga","client icon fallback");count=count+req(state.infoScreenText=="Sarge","clean personality");count=count+req(state.registeredSounds==["sound/player/announce/Sarge.wav"],"single-player announce")
 icons=cginfo.drawLoadingIcons(state);count=count+req(len(icons)==27,"icon draw count");count=count+req(icons[0].x==16 and icons[0].y==284 and icons[0].width==64,"player icon layout");count=count+req(icons[13].x==592 and icons[13].y==360,"item row one");count=count+req(icons[14].x==16 and icons[14].y==400,"item row two")
 remote=cginfo.drawInformation(state,"\\mapname\\q3dm1\\sv_hostname\\^2Arena\\timelimit\\10\\fraglimit\\20","\\sv_pure\\1\\sv_cheats\\1","Welcome","The Place",cginfo.GT_FFA,false,assets)
 count=count+req(remote.requestedShaders==["levelshots/q3dm1.tga","levelShotDetail"],"levelshot/detail assets");count=count+req(remote.commands[29].text=="Loading... Sarge","loading line");texts=[];for each command in remote.commands if command.kind=="text" then texts=texts+[command.text] end if end for
 for each wanted in ["Arena","Pure Server","Welcome","The Place","CHEATS ARE ENABLED","Free For All","timelimit 10","fraglimit 20"] found=false;for each text in texts if text==wanted then found=true end if end for;count=count+req(found,"information line "+wanted) end for
 local=cginfo.drawInformation(state,"\\mapname\\missing\\sv_hostname\\No\\capturelimit\\8","","","",cginfo.GT_CTF,true,assets);count=count+req(local.requestedShaders[0]=="menu/art/unknownmap","unknown levelshot");localTexts=[];for each command in local.commands if command.kind=="text" then localTexts=localTexts+[command.text] end if end for;count=count+req(localTexts==["Loading... Sarge","Capture The Flag","capturelimit 8"],"local CTF information")
 count=count+req(cginfo.gametypeName(9)=="Unknown Gametype","unknown gametype");count=count+req(cginfo.splitModel("visor")==["visor","default"],"default skin");count=count+req(cginfo.clean("^1R^7ed") == "Red","clean colors")
 print("PASS: "+str(count)+" native cg_info contracts");return 0
end function
