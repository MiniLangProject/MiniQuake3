import mq3.platform.win_main_runtime as win
function row(a,b) value=0;if win.strgtr(a,b) then value=1 end if;print(a+"|"+b+"|"+str(value));return void end function
function main(args)
  row("a","b");row("b","a");row("abc","abc");row("ab","abc");row("abc","ab");row("A","a");row("pak10.pk3","pak2.pk3");row("","x");return 0
end function
