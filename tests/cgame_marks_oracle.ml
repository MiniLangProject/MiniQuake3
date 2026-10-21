import mq3.client.cgame_marks as marks
import mq3.compat.numeric as n
function bits(value) return n.u32(n.floatBits(value)) end function
function row(name,mark) print(name+"|"+str(mark.id)+"|"+str(mark.time)+"|"+str(mark.alphaFade)+"|"+str(mark.verts[0].modulate[0])+"|"+str(mark.verts[0].modulate[1])+"|"+str(mark.verts[0].modulate[2])+"|"+str(mark.verts[0].modulate[3])+"|"+str(bits(mark.verts[0].st[0]))+"|"+str(bits(mark.verts[0].st[1]))) end function
function main(args)
  s=marks.create(3,false);a=marks.allocMark(s);a.time=10;b=marks.allocMark(s);b.time=10;c=marks.allocMark(s);c.time=20;d=marks.allocMark(s);print("pool|"+str(d.id)+"|"+str(len(s.active))+"|"+str(s.active[0])+"|"+str(s.active[1])+"|"+str(s.evicted))
  marks.initMarkPolys(s);s.time=100;f=marks.Fragment([[-2.0,-2.0,0.0],[2.0,-2.0,0.0],[2.0,2.0,0.0],[-2.0,2.0,0.0]]);m=marks.impactMark(s,"11",[0.0,0.0,0.0],[0.0,0.0,1.0],0.0,1.0,0.5,0.25,0.75,false,2.0,false,[f])[0];row("impact",m)
  marks.addMarks(s,9500);row("fade",m);marks.addMarks(s,10000);print("live|"+str(len(s.active)));marks.addMarks(s,10101);print("expired|"+str(len(s.active))+"|"+str(s.freed));return 0
end function
