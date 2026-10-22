import mq3.qcommon.msg as msg
struct Context text end struct
function output(context,text) context.text=context.text+text;return void end function
function main(args) counts=array(256,0);counts[0]=3;counts[7]=1;counts[255]=42;context=Context("");report=msg.ChangeReport(counts,output,context);msg.MSG_ReportChangeVectors_f(report);raw=bytes(context.text);print decode(slice(raw,0,len(raw)-1));return 0 end function
