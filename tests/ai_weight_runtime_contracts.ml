import mq3.botlib.ai_weight_runtime as fuzzy
import mq3.botlib.ai_item_weights as weights
import std.string as strings

struct Context paths texts writes randoms randomAt end struct
function require(ok,label) if not ok then return error(7643,"AI weight runtime contract: "+label) end if;return 1 end function
function readFile(context,path) for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return error(7643,"missing "+path) end function
function writeFile(context,path,text) context.paths=context.paths+["botfiles/"+path];context.texts=context.texts+[text];context.writes=context.writes+[[path,text]];return true end function
function random(context) if context.randomAt>=len(context.randoms) then return 0.0 end if;value=context.randoms[context.randomAt];context.randomAt=context.randomAt+1;return value end function
function leaf(value,minimum,maximum) return weights.Separator(0,weights.MAX_INVENTORYVALUE,weights.WT_BALANCE,value,minimum,maximum,void) end function
function config(name,separators) return weights.WeightConfig("memory",[weights.Weight(name,separators)]) end function

function main(args)
  source="weight \"linear\" { switch(0) { case 0: return balance(10,5,15); case 10: return balance(20,10,30); default: return 30; } }\nweight \"constant\" { return 7; }"
  context=Context(["botfiles/test.w","botfiles/value.c","botfiles/balance.c"],[source,"- 4","balance(- 10,- 5,20);"],[],[0.25,0.5,0.75,0.2,0.8,0.4,0.6],0);state=fuzzy.create(context,readFile,writeFile,random);checks=0
  parsed=fuzzy.readWeightConfig(state,"test.w");checks=checks+require(not (parsed is error) and len(parsed.weights)==2,"weight config parsing")
  checks=checks+require(fuzzy.findFuzzyWeight(parsed,"linear")==0 and fuzzy.findFuzzyWeight(parsed,"missing")==-1,"weight lookup")
  checks=checks+require(fuzzy.readWeightConfig(state,"test.w")==parsed and state.weights.fileReads==1,"retained config cache")
  inventory=[5];checks=checks+require(fuzzy.fuzzyWeight(inventory,parsed,0)==15.0 and fuzzy.fuzzyWeight(inventory,parsed,1)==7.0,"recursive decided evaluation")
  checks=checks+require(fuzzy.fuzzyWeight_r(inventory,parsed.weights[0].separators)==15.0,"separator evaluation entry")
  undecidedConfig=config("u",[leaf(10.0,5.0,15.0)]);checks=checks+require(fuzzy.fuzzyWeightUndecided(state,[0],undecidedConfig,0)==7.5,"undecided leaf random range")

  valueReader=weights.open(state.weights,"value.c");checks=checks+require(fuzzy.readValue(valueReader)==4.0,"released negative-value magnitude semantics");weights.close(valueReader)
  balanceReader=weights.open(state.weights,"balance.c");balance=fuzzy.readFuzzyWeight(balanceReader);checks=checks+require(balance==[weights.WT_BALANCE,10.0,5.0,20.0],"balance parsing and negative magnitude");weights.close(balanceReader)

  scaled=config("scale",[leaf(10.0,5.0,15.0)]);checks=checks+require(fuzzy.scaleWeight(scaled,"scale",0.5)==1 and scaled.weights[0].separators[0].weight==10.0,"weight center scaling")
  fuzzy.scaleWeight(scaled,"scale",2.0);checks=checks+require(scaled.weights[0].separators[0].weight==15.0,"weight scale clamp")
  fuzzy.scaleFuzzyBalanceRange(scaled,0.5);checks=checks+require(scaled.weights[0].separators[0].minWeight==7.5 and scaled.weights[0].separators[0].maxWeight==12.5,"balance range scaling")
  fuzzy.scaleFuzzyBalanceRange(scaled,-1.0);checks=checks+require(scaled.weights[0].separators[0].minWeight==10.0 and scaled.weights[0].separators[0].maxWeight==10.0,"balance range lower clamp")

  mutate=config("mutate",[leaf(10.0,5.0,15.0)]);fuzzy.evolveWeightConfig(state,mutate);checks=checks+require(mutate.weights[0].separators[0].weight==12.5,"evolution random and centered random sequence")
  checks=checks+require(mutate.weights[0].separators[0].minWeight==5.0 and mutate.weights[0].separators[0].maxWeight==15.0,"evolution retains enclosing range")

  first=config("breed",[leaf(4.0,0.0,8.0)]);second=config("breed",[leaf(8.0,0.0,10.0)]);result=config("breed",[leaf(0.0,1.0,2.0)])
  checks=checks+require(fuzzy.interbreedWeightConfigs(first,second,result) and result.weights[0].separators[0].weight==6.0,"config interbreeding average")
  checks=checks+require(result.weights[0].separators[0].minWeight==6.0 and result.weights[0].separators[0].maxWeight==6.0,"released interbreed bound comparisons")
  checks=checks+require(not fuzzy.interbreedWeightConfigs(first,weights.WeightConfig("bad",[]),result),"unequal configs rejected")
  childOne=leaf(2.0,0.0,4.0);childTwo=leaf(10.0,0.0,12.0);childResult=leaf(0.0,0.0,1.0);parentOne=weights.Separator(0,1,0,0.0,0.0,0.0,[childOne]);parentTwo=weights.Separator(0,1,0,0.0,0.0,0.0,[childTwo]);parentResult=weights.Separator(0,1,0,0.0,0.0,0.0,[childResult])
  checks=checks+require(fuzzy.interbreedFuzzySeperator_r([parentOne],[parentTwo],[parentResult]) and childResult.weight==10.0,"released second-parent child recursion")

  encoded=fuzzy.weightConfigText(parsed);checks=checks+require(len(bytes(encoded))>0 and strings.indexOf(encoded,"weight \"linear\"",0)>=0,"deterministic writer text")
  checks=checks+require(fuzzy.writeWeightConfig(state,"written.w",parsed) and len(context.writes)==1,"typed filesystem write boundary")
  written=fuzzy.readWeightConfig(state,"written.w");checks=checks+require(not (written is error) and len(written.weights)==2 and fuzzy.fuzzyWeight([5],written,0)==10.0,"released index-zero writer emits the first leaf")
  checks=checks+require(fuzzy.writeFuzzyWeight(leaf(3.0,1.0,5.0))==" return balance(3,1,5);\n","fuzzy leaf writer")
  checks=checks+require(strings.indexOf(fuzzy.writeFuzzySeperators_r(parsed.weights[0].separators,1),"switch(0)",0)>=0,"separator writer")

  retained=config("retained",[leaf(1.0,0.0,2.0)]);fuzzy.freeWeightConfig(state,retained);checks=checks+require(len(retained.weights)==1,"default cached config ownership")
  weights.setReloadCharacters(state.weights,1);fuzzy.freeWeightConfig(state,retained);checks=checks+require(len(retained.weights)==0,"reload config explicit release")
  temporary=[leaf(1.0,0.0,2.0)];fuzzy.freeFuzzySeperators_r(temporary);checks=checks+require(temporary[0].child==void,"recursive separator release")
  disposable=config("dispose",[leaf(1.0,0.0,2.0)]);fuzzy.freeWeightConfig2(disposable);checks=checks+require(len(disposable.weights)==0,"unconditional config release")
  fuzzy.botShutdownWeights(state);checks=checks+require(len(state.weights.configs)==0,"global weight cache shutdown")
  print("PASS: "+str(checks)+" complete be_ai_weight runtime contracts");return 0
end function
