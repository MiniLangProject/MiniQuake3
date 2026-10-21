import mq3.renderer.tr_init as r
function main(args) for each value in [-1,0,1,9,42,9999,10000] print("tga|"+str(value)+"|"+r.screenshotFilename(value));print("jpg|"+str(value)+"|"+r.screenshotFilenameJpeg(value)) end for;return 0 end function
