import mq3.client.ui_sp_level as levels

function row(label,modelAndSkin,assets) print(label+"|"+levels.playerIcon(modelAndSkin,assets));return void end function
function main(args)
  row("implicit","ranger",["models/players/ranger/icon_default.tga"])
  row("skin","sarge/red",["models/players/sarge/icon_red.tga"])
  row("fallback","sarge/red",["models/players/sarge/icon_default.tga"])
  row("missing-default","visor/default",[])
  row("case-asset","Xaero/DEFAULT",["MODELS/PLAYERS/XAERO/ICON_DEFAULT.TGA"])
  row("empty-skin","sarge/",["models/players/sarge/icon_default.tga"])
  row("nested","team/sarge/red",["models/players/team/sarge/icon_red.tga"])
  return 0
end function
