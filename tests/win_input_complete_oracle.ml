import mq3.platform.win_input_runtime as input
import mq3.compat.numeric as numeric
function emit(runtime,label) for each event in runtime.events print label+" "+str(event.time)+" "+str(event.type)+" "+str(event.value)+" "+str(event.value2) end for;runtime.events=[];return void end function
function main(args)
  for each value in [-10,0,1,16384,32767,32768,49152,65535,65536,90000] print "J "+str(value)+" "+str(numeric.trunc32(input.JoyToF(value)*1000000))+" "+str(input.JoyToI(value)) end for
  runtime=input.create();runtime.mouse.initialized=true
  input.IN_MouseEvent(runtime,5,123);emit(runtime,"M");input.IN_MouseEvent(runtime,2,123);emit(runtime,"M");input.IN_ClearStates(runtime);input.IN_MouseEvent(runtime,1,123);emit(runtime,"M")
  input.MIDI_NoteOn(runtime,60,100,456);input.MIDI_NoteOn(runtime,61,0,456);input.MIDI_NoteOff(runtime,59,456);input.MIDI_NoteOff(runtime,99,456);emit(runtime,"D")
  return 0
end function
