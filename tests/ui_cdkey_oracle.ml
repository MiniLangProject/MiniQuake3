import mq3.client.ui_cdkey as cdkey

function row(label,key) print(label+"|"+str(cdkey.preValidateKey(key)));return void end function
function main(args)
  row("empty","");row("short","237abcdghjlprst");row("valid","237abcdghjlprstw");row("bad","237abcdghjlprstx");row("upper","237ABCDGHJLPRSTW");return 0
end function
