import mq3.client.keycodes as k
function main(args)
 print("ascii "+str(k.K_TAB)+" "+str(k.K_ENTER)+" "+str(k.K_ESCAPE)+" "+str(k.K_SPACE)+" "+str(k.K_BACKSPACE))
 print("system "+str(k.K_COMMAND)+" "+str(k.K_CAPSLOCK)+" "+str(k.K_POWER)+" "+str(k.K_PAUSE)+" "+str(k.K_UPARROW)+" "+str(k.K_DOWNARROW)+" "+str(k.K_LEFTARROW)+" "+str(k.K_RIGHTARROW)+" "+str(k.K_ALT)+" "+str(k.K_CTRL)+" "+str(k.K_SHIFT)+" "+str(k.K_INS)+" "+str(k.K_DEL)+" "+str(k.K_PGDN)+" "+str(k.K_END)+" "+str(k.K_F15))
 print("keypad "+str(k.K_KP_HOME)+" "+str(k.K_KP_UPARROW)+" "+str(k.K_KP_PGUP)+" "+str(k.K_KP_LEFTARROW)+" "+str(k.K_KP_5)+" "+str(k.K_KP_RIGHTARROW)+" "+str(k.K_KP_END)+" "+str(k.K_KP_DOWNARROW)+" "+str(k.K_KP_PGDN)+" "+str(k.K_KP_ENTER)+" "+str(k.K_KP_INS)+" "+str(k.K_KP_DEL)+" "+str(k.K_KP_SLASH)+" "+str(k.K_KP_MINUS)+" "+str(k.K_KP_PLUS)+" "+str(k.K_KP_NUMLOCK)+" "+str(k.K_KP_STAR)+" "+str(k.K_KP_EQUALS))
 print("devices "+str(k.K_MOUSE1)+" "+str(k.K_MOUSE5)+" "+str(k.K_MWHEELDOWN)+" "+str(k.K_MWHEELUP)+" "+str(k.K_JOY1)+" "+str(k.K_JOY16)+" "+str(k.K_JOY17)+" "+str(k.K_JOY32)+" "+str(k.K_AUX1)+" "+str(k.K_AUX8)+" "+str(k.K_AUX16)+" "+str(k.K_LAST_KEY)+" "+str(k.K_CHAR_FLAG))
 print("size 4")
 return 0
end function
