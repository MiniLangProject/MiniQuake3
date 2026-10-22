import mq3.botlib.aas_debug as debug
import mq3.compat.numeric as numeric
function number(value) return numeric.trunc32(value) end function
function dump(state,name,start)
  count=0;for index=start to len(state.actions)-1 if state.actions[index].kind=="line-show" then count=count+1 end if end for;print(name+" "+str(count));for index=start to len(state.actions)-1 action=state.actions[index];if action.kind=="line-show" then a=action.points[0];b=action.points[1];print(str(action.color)+" "+str(number(a[0]))+" "+str(number(a[1]))+" "+str(number(a[2]))+" "+str(number(b[0]))+" "+str(number(b[1]))+" "+str(number(b[2]))) end if end for;return len(state.actions)
end function
function main(args)
  state=debug.create(false);a=[1.0,2.0,3.0];b=[13.0,2.0,3.0]
  at=len(state.actions);debug.AAS_DrawCross(state,a,2,debug.LINECOLOR_GREEN);at=dump(state,"cross",at)
  debug.AAS_DrawArrow(state,a,b,debug.LINECOLOR_BLUE,debug.LINECOLOR_YELLOW);at=dump(state,"arrow",at)
  debug.AAS_DrawPlaneCross(state,a,[1.0,0.0,0.0],5,0,debug.LINECOLOR_RED);at=dump(state,"plane",at)
  debug.AAS_DrawPermanentCross(state,a,1,debug.LINECOLOR_BLUE);at=dump(state,"permanent",at)
  debug.AAS_PermanentLine(state,a,b,debug.LINECOLOR_YELLOW);dump(state,"line",at);return 0
end function
