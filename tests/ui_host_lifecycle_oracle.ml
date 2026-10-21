import mq3.client.ui_host_lifecycle as host
function main(args)
  print str(host.CLIENT_STATE_SIZE)+"|0|4|8|12|1036|2060|"+str(host.CA_UNINITIALIZED)+"|"+str(host.CA_DISCONNECTED)+"|"+str(host.CA_AUTHORIZING)+"|"+str(host.CA_CONNECTING)+"|"+str(host.CA_CHALLENGING)+"|"+str(host.CA_CONNECTED)+"|"+str(host.CA_ACTIVE)
  return 0
end function
