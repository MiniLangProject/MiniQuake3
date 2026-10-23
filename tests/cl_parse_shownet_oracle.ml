import mq3.client.cl_parse_runtime as parser
import mq3.client.server_message as serverMessage
import mq3.qcommon.message as message
function main(args)
  state=serverMessage.create(void);msg=message.init(8);msg.readcount=7
  state.shownetLevel=0;parser.SHOWNET(state,msg,"silent-zero")
  state.shownetLevel=1;parser.SHOWNET(state,msg,"silent-one")
  state.shownetLevel=2;parser.SHOWNET(state,msg,"alpha")
  msg.readcount=1;state.shownetLevel=3;parser.SHOWNET(state,msg,"beta")
  for each line in state.shownetLines print line end for
  return 0
end function
