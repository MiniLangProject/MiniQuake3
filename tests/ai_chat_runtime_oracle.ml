import mq3.botlib.ai_chat_runtime as chat

function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  print("WHITE "+str(bit(chat.isWhiteSpace(65)))+" "+str(bit(chat.isWhiteSpace(32)))+" "+str(bit(chat.isWhiteSpace(63)))+" "+str(bit(chat.isWhiteSpace(59))))
  print("TILDE <"+chat.botRemoveTildes("a~~b~c~~~")+">")
  print("SPACE <"+chat.unifyWhiteSpaces(" \tAlpha\n\n(beta)  gamma ")+">")
  print("CONTAINS "+str(chat.stringContains("Alpha beta","BETA",false))+" "+str(chat.stringContains("Alpha beta","BETA",true))+" "+str(chat.stringContains("abc","",false)))
  print("WORD "+str(chat.stringContainsWord("alpha,beta!Gamma","BETA",false))+" "+str(chat.stringContainsWord("alpha,beta!Gamma","gamma",true)))
  print("REPLACE <"+chat.stringReplaceWords("cant cant canonical can't","cant","canonical")+">")
  return 0
end function
