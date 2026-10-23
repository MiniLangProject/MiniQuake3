import mq3.client.keycodes as k
function req(ok,label) if not ok then return error(7981,"keycodes.h: "+label) end if;return 1 end function
function main(args)
 count=0
 count=count+req(k.K_TAB==9 and k.K_BACKSPACE==127,"ASCII bounds")
 count=count+req(k.K_COMMAND==128 and k.K_F15==159,"system range")
 count=count+req(k.K_KP_HOME==160 and k.K_KP_EQUALS==177,"keypad range")
 count=count+req(k.K_MOUSE1==178 and k.K_MWHEELUP==184,"mouse range")
 count=count+req(k.K_JOY1==185 and k.K_JOY32==216,"joystick range")
 count=count+req(k.K_AUX1==217 and k.K_AUX16==232,"auxiliary range")
 count=count+req(k.K_LAST_KEY==233 and k.K_LAST_KEY<256,"key ceiling")
 count=count+req(k.K_CHAR_FLAG==1024,"character flag")
 count=count+req(k.isKeyNumber(0) and k.isKeyNumber(232) and not k.isKeyNumber(233),"key validation")
 count=count+req(k.isCharacterEvent(k.K_CHAR_FLAG|65) and k.characterCode(k.K_CHAR_FLAG|65)==65,"character decoding")
 print("PASS: "+str(count)+" keycodes.h ABI contracts")
 return 0
end function
