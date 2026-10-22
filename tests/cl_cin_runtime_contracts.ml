import mq3.client.cl_cin_runtime as cin
import mq3.video.roq_video as video

function req(ok,message) if not ok then return error(7696,message) end if;return 1 end function
function main(args)
 count=0
 count=count+req(len(cin.RllSetupTable())==256 and cin.RllSetupTable()[1]==1 and cin.RllSetupTable()[129]==-1,"RLL table")
 count=count+req(cin.RllDecodeMonoToMono(bytes([1,129]),0)==[1,0],"mono decode")
 count=count+req(cin.RllDecodeMonoToStereo(bytes([2]),0)==[[4,4]],"mono stereo")
 count=count+req(cin.RllDecodeStereoToStereo(bytes([1,2]),0,0)==[[1,4]],"stereo decode")
 count=count+req(cin.RllDecodeStereoToMono(bytes([1,2]),0,0)==[2],"stereo mono")
 rgba=cin.yuv_to_rgb(0,128,128);count=count+req(len(rgba)==4 and rgba[3]==255 and len(cin.yuv_to_rgb24(255,128,128))==3,"YUV")
 decoder=video.create();decoder.width=8;decoder.height=8;decoder.buffers=[bytes(256,0),bytes(256,0)];cell=[];for i=0 to 3 cell=cell+[[10,20,30,255]] end for
 count=count+req(not (cin.blit2_32(decoder.buffers[0],8,8,0,0,cell) is error),"blit2")
 count=count+req(cin.RoQPrepMcomp(0xff01)==[-1,1],"motion offsets")
 count=count+req(len(cin.setupQuad(32,16))==2 and len(cin.recurseQuad([],0,0,8,4))==4,"quad setup")
 cin.RoQReset(decoder);count=count+req(decoder.width==0 and decoder.frameCount==0,"decoder reset")
 print("PASS: "+str(count)+" cl_cin runtime contracts");return 0
end function
