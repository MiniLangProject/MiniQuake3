import mq3.botlib.ai_weight_runtime as runtime
import mq3.botlib.ai_item_weights as weights
function main(args)
  a=weights.Separator(0,0,weights.WT_BALANCE,10.0,5.0,15.0,void);b=weights.Separator(0,10,weights.WT_BALANCE,20.0,10.0,30.0,void);separators=[a,b];inventory=[5]
  print("EVAL "+runtime.numberText(runtime.fuzzyWeight_r(inventory,separators)));runtime.scaleFuzzySeperator_r(separators,0.5);print("SCALE "+runtime.numberText(a.weight)+" "+runtime.numberText(b.weight));runtime.scaleFuzzySeperatorBalanceRange_r(separators,0.5);print("RANGE "+runtime.numberText(a.minWeight)+" "+runtime.numberText(a.maxWeight)+" "+runtime.numberText(b.minWeight)+" "+runtime.numberText(b.maxWeight))
  x=weights.Separator(0,0,weights.WT_BALANCE,4.0,0.0,8.0,void);y=weights.Separator(0,0,weights.WT_BALANCE,8.0,0.0,10.0,void);z=weights.Separator(0,0,weights.WT_BALANCE,0.0,1.0,2.0,void);ok=runtime.interbreedFuzzySeperator_r([x],[y],[z]);value=0;if ok then value=1 end if;print("BREED "+str(value)+" "+runtime.numberText(z.weight)+" "+runtime.numberText(z.minWeight)+" "+runtime.numberText(z.maxWeight));return 0
end function
