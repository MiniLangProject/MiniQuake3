import mq3.client.playable_hud as hud

function require(ok,text) if not ok then return error(7496,text) end if;return 1 end function
function lit(rows) total=0;for i=0 to len(rows)-1;if rows[i]!=0 then total=total+1 end if;end for;return total end function

function main(args)
  c=0
  c=c+require(hud.GLYPH_WIDTH==5 and hud.GLYPH_HEIGHT==7,"font dimensions")
  c=c+require(hud.VALUE_MAX==999,"value ceiling")
  c=c+require(hud.clampValue(-10)==0,"negative clamp")
  c=c+require(hud.clampValue(0)==0,"zero clamp")
  c=c+require(hud.clampValue(73)==73,"normal value")
  c=c+require(hud.clampValue(1000)==999,"high clamp")
  state=hud.state(100,25,40,"READY","WASD MOVE")
  c=c+require(state.health==100 and state.armor==25 and state.ammo==40,"initial values")
  c=c+require(state.status=="READY" and state.helpText=="WASD MOVE","initial text")
  hud.setValues(state,-1,123,5000)
  c=c+require(state.health==0 and state.armor==123 and state.ammo==999,"mutated values")
  c=c+require(try(hud.setValues(void,1,2,3)) is error,"missing state rejected")
  small=hud.layout(320,200);large=hud.layout(1024,640)
  c=c+require(small.margin==18 and small.crosshairSize==10,"small layout")
  c=c+require(large.margin==18 and large.crosshairSize==15,"large layout")
  c=c+require(small.valueY<200 and large.valueY<640,"values within surface")
  c=c+require(try(hud.layout(159,120)) is error,"narrow surface rejected")
  c=c+require(try(hud.layout(160,119)) is error,"short surface rejected")
  c=c+require(hud.textWidth("",2)==0,"empty text width")
  c=c+require(hud.textWidth("A",2)==10,"single text width")
  c=c+require(hud.textWidth("ABC",2)==34,"multiple text width")
  c=c+require(try(hud.textWidth("A",0)) is error,"zero scale rejected")
  alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  for i=0 to len(alphabet)-1
    rows=hud.glyph(alphabet[i])
    c=c+require(len(rows)==7 and lit(rows)>=5,"uppercase glyph "+alphabet[i])
  end for
  digits="0123456789"
  for i=0 to len(digits)-1
    rows=hud.glyph(digits[i])
    c=c+require(len(rows)==7 and lit(rows)>=5,"digit glyph "+digits[i])
  end for
  punctuation=":-/+."
  for i=0 to len(punctuation)-1
    rows=hud.glyph(punctuation[i])
    c=c+require(len(rows)==7 and lit(rows)>=1,"punctuation glyph")
  end for
  c=c+require(hud.glyph(" ")==[0,0,0,0,0,0,0],"space glyph")
  c=c+require(hud.glyph("?")==[0,0,0,0,0,0,0],"unknown glyph")
  print("PASS: "+str(c)+" playable-HUD contracts");return 0
end function
