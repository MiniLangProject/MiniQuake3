import mq3.server.rankings as r
function csv(data) value="";for i=0 to len(data)-1 if i>0 then value=value+"," end if;value=value+str(data[i]) end for;return value end function
function main(args) source=[0,1,2,3,254,255];encoded=r.SV_RankAsciiEncode(source);print("enc="+encoded+":"+str(len(bytes(encoded))));print("dec="+csv(r.SV_RankAsciiDecode(encoded)));print("invalid="+str(len(r.SV_RankAsciiDecode("!"))));print("status="+r.SV_RankStatusString(r.GR_STATUS_OK)+","+r.SV_RankStatusString(r.GR_STATUS_TIMEOUT)+","+r.SV_RankStatusString(99));return 0 end function
