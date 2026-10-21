import mq3.platform.playable_window as window

function require(ok,message) if not ok then return error(7492,message) end if;return 1 end function

function main(args)
  count=0
  count=count+require(window.loadingTitle(0,"Starting") == "MiniQuake3 | Loading 0% | Starting","zero-percent title")
  count=count+require(window.loadingTitle(47,"Loading world textures") == "MiniQuake3 | Loading 47% | Loading world textures","phase title")
  count=count+require(window.loadingTitle(100,"Entering arena") == "MiniQuake3 | Loading 100% | Entering arena","complete title")
  count=count+require(try(window.loadingTitle(-1,"bad")) is error and try(window.loadingTitle(101,"bad")) is error,"progress bounds")
  count=count+require(try(window.loadingTitle(10,"")) is error and try(window.loadingTitle(10,7)) is error,"status validation")
  long="";for index=0 to 255 long=long+"x" end for
  count=count+require(try(window.loadingTitle(50,long)) is error,"Win32 title bound")
  print "PASS: "+str(count)+" playable loading contracts";return 0
end function
