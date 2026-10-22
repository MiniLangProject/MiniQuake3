import mq3.renderer.tr_light_runtime as tr
function run(flags,ambient,directed) value=tr.entity([0.0,0.0,0.0]);value.renderfx=flags;value.ambientLight=ambient;value.directedLight=directed;text=tr.LogLight(value);if text==void then print("-") else raw=bytes(text);print(decode(slice(raw,0,len(raw)-1))) end if;return void end function
function main(args) run(0,[1.0,2.0,3.0],[4.0,5.0,6.0]);run(4,[9.0,10.0,99.0],[4.0,5.0,88.0]);run(4,[9.0,8.0,99.0],[7.0,6.0,77.0]);run(4,[1.9,1.1,1.2],[2.9,2.1,2.2]);return 0 end function
