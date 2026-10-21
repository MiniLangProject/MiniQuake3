import mq3.client.ui_credits as credits
function main(args) for each key in [65,credits.K_CHAR_FLAG|65,13] actions=credits.key(key);print(str(key)+":"+str(len(actions))) end for;return 0 end function
