// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for code/botlib/be_ai_weight.c.
package mq3.botlib.ai_weight_runtime

import mq3.botlib.ai_item_weights as weights
import mq3.compat.numeric as n
import mq3.vm.pc_parser as pc
import std.string as strings

/// `State` record for ai weight runtime, containing `weights`, `context`, `writeFn`, `randomFn` and `diagnostics`.
struct State weights context writeFn randomFn diagnostics end struct

/// Create a `mq3.botlib.ai_weight_runtime.State` record, initializing `weights` as `weights.create(context,readFn)`, `context` from `context` and `writeFn` from `writeFn`.
/// @param context Context forwarded to the configured host callbacks.
/// @param readFn Callback that loads a named resource through the supplied context.
/// @param writeFn Initial value stored in `mq3.botlib.ai_weight_runtime.State.writeFn`.
/// @param randomFn Callback that supplies the random value used by selection.
function create(context,readFn,writeFn,randomFn) return State(weights.create(context,readFn),context,writeFn,randomFn,[]) end function
/// Use `state.randomFn` to perform `randomValue`.
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
function randomValue(state) if state==void or state.randomFn==void then return 0.0 end if;value=state.randomFn(state.context);if value<0.0 then return 0.0 end if;if value>=1.0 then return 0.999999 end if;return value end function
/// Return the result of `n.fsub(n.fmul(randomValue(state),2.0),1.0)` for `centeredRandom`.
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
function centeredRandom(state) return n.fsub(n.fmul(randomValue(state),2.0),1.0) end function

// Parser and ownership ----------------------------------------------------
/// @param message Message text supplied to the diagnostic or chat operation.
function parserFail(message) return error(7642,"AI weight runtime: "+message) end function
/// Apply `mq3.botlib.ai_weight_runtime.parserFail` and `mq3.botlib.ai_item_weights.take` while evaluating `valueFromFirst`. Return paths include `value.floatValue`.
/// @param reader Token-reader state; accesses `registry` and `handle`.
/// @param token Value used by `valueFromFirst` in `value=token`.
function valueFromFirst(reader,token)
  value=token;if value==void or value is error then return parserFail("missing value") end if;if value.text=="-" then value=weights.take(reader);if value==void or value is error then return parserFail("missing negative magnitude") end if end if;if value.type!=pc.TT_NUMBER then return parserFail("invalid return value "+value.text) end if;return value.floatValue
end function
/// Forward `readValue` to `mq3.botlib.ai_weight_runtime.valueFromFirst` and return the delegated result.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function readValue(reader) return valueFromFirst(reader,weights.take(reader)) end function
/// Apply `mq3.botlib.ai_item_weights.take`, `mq3.botlib.ai_weight_runtime.parserFail` and `mq3.botlib.ai_item_weights.expect` while evaluating `readFuzzyWeight`. Return paths include `[0,weight,weight,weight]`.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function readFuzzyWeight(reader)
  first=weights.take(reader);if first==void or first is error then return parserFail("missing fuzzy weight") end if
  if first.text=="balance" then if weights.expect(reader,"(") is error then return parserFail("invalid balance") end if;weight=readValue(reader);if weight is error then return weight end if;if weights.expect(reader,",") is error then return parserFail("invalid balance") end if;minimum=readValue(reader);if minimum is error then return minimum end if;if weights.expect(reader,",") is error then return parserFail("invalid balance") end if;maximum=readValue(reader);if maximum is error then return maximum end if;if weights.expect(reader,")") is error or weights.expect(reader,";") is error then return parserFail("invalid balance terminator") end if;return [weights.WT_BALANCE,weight,minimum,maximum] end if
  weight=valueFromFirst(reader,first);if weight is error then return weight end if;if weights.expect(reader,";") is error then return parserFail("missing fuzzy weight terminator") end if;return [0,weight,weight,weight]
end function
/// Forward `readFuzzySeperators_r` to `mq3.botlib.ai_item_weights.readSeparators` and return the delegated result.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function readFuzzySeperators_r(reader) return weights.readSeparators(reader) end function
/// Forward `readWeightConfig` to `mq3.botlib.ai_item_weights.weightConfig` and return the delegated result.
/// @param state AI weight runtime state; accesses `weights`.
/// @param filename Filename supplied to the configured loader or file service.
function readWeightConfig(state,filename) return weights.weightConfig(state.weights,filename) end function
/// Apply `mq3.botlib.ai_weight_runtime.freeFuzzySeperators_r` while evaluating `freeFuzzySeperators_r`.
/// @param separators Value used by `freeFuzzySeperators_r` in `if separators==void then return 0 end if`.
function freeFuzzySeperators_r(separators)
  if separators==void then return 0 end if;for each separator in separators if separator.child!=void then freeFuzzySeperators_r(separator.child);separator.child=void end if end for;return 0
end function
/// Set `config.weights` to `[]` in `mq3.botlib.ai_weight_runtime.freeWeightConfig2`.
/// @param config Configuration record; accesses `weights`. May update `config.weights` in place.
function freeWeightConfig2(config) if config==void then return 0 end if;for each weight in config.weights freeFuzzySeperators_r(weight.separators);weight.separators=[] end for;config.weights=[];return 0 end function
/// Apply `mq3.botlib.ai_weight_runtime.freeWeightConfig2` while evaluating `freeWeightConfig`. Return paths include `freeWeightConfig2(config)`.
/// @param state AI weight runtime state; accesses `weights`.
/// @param config Configuration record; accesses `weights`. May update `config.weights` in place.
function freeWeightConfig(state,config) if state==void or config==void or not state.weights.reloadCharacters then return 0 end if;return freeWeightConfig2(config) end function

// Runtime evaluation -----------------------------------------------------
/// @param config Configuration record; accesses `weights`.
/// @param name Name used to identify the requested entry.
function findFuzzyWeight(config,name) return weights.findWeight(config,name) end function
/// Forward `fuzzyWeight_r` to `mq3.botlib.ai_item_weights.fuzzySeparators` and return the delegated result.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param separators Array or byte sequence accessed at `index` and `index+1`.
function fuzzyWeight_r(inventory,separators) return weights.fuzzySeparators(inventory,separators) end function
/// Apply `mq3.botlib.ai_weight_runtime.fuzzyWeightUndecided_r`, `mq3.botlib.ai_weight_runtime.randomValue` and `mq3.botlib.ai_weight_runtime.fuzzyWeight_r` while evaluating `undecidedAt`. Return paths include `separator.weight`.
/// @param state Value passed as argument 1 to `mq3.botlib.ai_weight_runtime.undecidedAt`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param separators Array or byte sequence accessed at `index` and `index+1`.
/// @param index Index of the entry to access.
function undecidedAt(state,inventory,separators,index)
  if separators==void or index<0 or index>=len(separators) then return 0.0 end if;separator=separators[index];value=inventory[separator.inventoryIndex]
  if value<separator.value then
    if separator.child!=void then return fuzzyWeightUndecided_r(state,inventory,separator.child) end if;return n.fadd(separator.minWeight,n.fmul(randomValue(state),n.fsub(separator.maxWeight,separator.minWeight)))
  end if
  if index+1<len(separators) then
    following=separators[index+1]
    if value<following.value then
      first=0.0;second=0.0;if separator.child!=void then first=fuzzyWeightUndecided_r(state,inventory,separator.child) else first=n.fadd(separator.minWeight,n.fmul(randomValue(state),n.fsub(separator.maxWeight,separator.minWeight))) end if
      // Released be_ai_weight.c evaluates the second child with decided FuzzyWeight_r.
      if following.child!=void then second=fuzzyWeight_r(inventory,following.child) else second=n.fadd(following.minWeight,n.fmul(randomValue(state),n.fsub(following.maxWeight,following.minWeight))) end if
      scale=n.fdiv((value-separator.value)*1.0,(following.value-separator.value)*1.0);return n.fadd(n.fmul(scale,first),n.fmul(n.fsub(1.0,scale),second))
    end if;return undecidedAt(state,inventory,separators,index+1)
  end if
  return separator.weight
end function
/// Forward `fuzzyWeightUndecided_r` to `mq3.botlib.ai_weight_runtime.undecidedAt` and return the delegated result.
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param separators Array or byte sequence accessed at `index` and `index+1`.
function fuzzyWeightUndecided_r(state,inventory,separators) return undecidedAt(state,inventory,separators,0) end function
/// Forward `fuzzyWeight` to `mq3.botlib.ai_item_weights.fuzzyWeight` and return the delegated result.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param config Configuration record; accesses `weights`.
/// @param weightNumber Operand used to evaluate the returned expression `fuzzySeparators(inventory,config.weights[weightNumber].separators)`.
function fuzzyWeight(inventory,config,weightNumber) return weights.fuzzyWeight(inventory,config,weightNumber) end function
/// Apply `mq3.botlib.ai_weight_runtime.fuzzyWeightUndecided_r` while evaluating `fuzzyWeightUndecided`. Return paths include `fuzzyWeightUndecided_r(state,inventory,config.weights[weightNumber].separators)`.
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param config Configuration record; accesses `weights`.
/// @param weightNumber Operand used to evaluate the returned expression `fuzzyWeightUndecided_r(state,inventory,config.weights[weightNumber].separators)`.
function fuzzyWeightUndecided(state,inventory,config,weightNumber) if config==void or weightNumber<0 or weightNumber>=len(config.weights) then return 0.0 end if;return fuzzyWeightUndecided_r(state,inventory,config.weights[weightNumber].separators) end function

// Evolution, scaling and interbreeding ----------------------------------
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
/// @param separators Value used by `evolveFuzzySeperator_r` in `if separators==void then return 0 end if`.
function evolveFuzzySeperator_r(state,separators)
  if separators==void then return 0 end if
  for each separator in separators
    if separator.child!=void then evolveFuzzySeperator_r(state,separator.child)
    else if separator.type==weights.WT_BALANCE then width=n.fsub(separator.maxWeight,separator.minWeight);leap=randomValue(state)<0.01;change=n.fmul(centeredRandom(state),width);if not leap then change=n.fmul(change,0.5) end if;separator.weight=n.fadd(separator.weight,change);if separator.weight<separator.minWeight then separator.minWeight=separator.weight else if separator.weight>separator.maxWeight then separator.maxWeight=separator.weight end if end if
  end for;return 0
end function
/// Apply `mq3.botlib.ai_weight_runtime.evolveFuzzySeperator_r` while evaluating `evolveWeightConfig`.
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
/// @param config Configuration record; accesses `weights`.
function evolveWeightConfig(state,config) if config==void then return 0 end if;for each weight in config.weights evolveFuzzySeperator_r(state,weight.separators) end for;return 0 end function
/// Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperator_r` while evaluating `scaleFuzzySeperator_r`.
/// @param separators Value used by `scaleFuzzySeperator_r` in `if separators==void then return 0 end if`.
/// @param scale Scale factor applied to the computed value.
function scaleFuzzySeperator_r(separators,scale)
  if separators==void then return 0 end if;for each separator in separators if separator.child!=void then scaleFuzzySeperator_r(separator.child,scale) else if separator.type==weights.WT_BALANCE then separator.weight=n.fmul(n.fadd(separator.maxWeight,separator.minWeight),scale);if separator.weight<separator.minWeight then separator.weight=separator.minWeight else if separator.weight>separator.maxWeight then separator.weight=separator.maxWeight end if end if end for;return 0
end function
/// Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperator_r` while evaluating `scaleWeight`.
/// @param config Configuration record; accesses `weights`.
/// @param name Lookup text matched against `weight.name`.
/// @param scale Scale factor applied to the computed value.
function scaleWeight(config,name,scale)
  value=scale;if value<0.0 then value=0.0 else if value>1.0 then value=1.0 end if;if config==void then return 0 end if;for each weight in config.weights if weight.name==name then scaleFuzzySeperator_r(weight.separators,value);return 1 end if end for;return 0
end function
/// Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperatorBalanceRange_r` while evaluating `scaleFuzzySeperatorBalanceRange_r`.
/// @param separators Value used by `scaleFuzzySeperatorBalanceRange_r` in `if separators==void then return 0 end if`.
/// @param scale Scale factor applied to the computed value.
function scaleFuzzySeperatorBalanceRange_r(separators,scale)
  if separators==void then return 0 end if;for each separator in separators if separator.child!=void then scaleFuzzySeperatorBalanceRange_r(separator.child,scale) else if separator.type==weights.WT_BALANCE then middle=n.fmul(n.fadd(separator.minWeight,separator.maxWeight),0.5);separator.maxWeight=n.fadd(middle,n.fmul(n.fsub(separator.maxWeight,middle),scale));separator.minWeight=n.fadd(middle,n.fmul(n.fsub(separator.minWeight,middle),scale));if separator.maxWeight<separator.minWeight then separator.maxWeight=separator.minWeight end if end if end for;return 0
end function
/// Apply `mq3.botlib.ai_weight_runtime.scaleFuzzySeperatorBalanceRange_r` while evaluating `scaleFuzzyBalanceRange`.
/// @param config Configuration record; accesses `weights`.
/// @param scale Scale factor applied to the computed value.
function scaleFuzzyBalanceRange(config,scale)
  value=scale;if value<0.0 then value=0.0 else if value>100.0 then value=100.0 end if;if config==void then return 0 end if;for each weight in config.weights scaleFuzzySeperatorBalanceRange_r(weight.separators,value) end for;return 0
end function
/// Apply `mq3.botlib.ai_weight_runtime.interbreedFuzzySeperator_r` while evaluating `interbreedFuzzySeperator_r`.
/// @param first Array or byte sequence accessed at `index`.
/// @param second Array or byte sequence accessed at `index`.
/// @param result Array or byte sequence accessed at `index`.
function interbreedFuzzySeperator_r(first,second,result)
  if len(first)!=len(second) or len(first)!=len(result) then return false end if;if len(first)==0 then return true end if
  for index=0 to len(first)-1
    one=first[index];two=second[index];target=result[index]
    if one.child!=void then if two.child==void or target.child==void then return false end if;if not interbreedFuzzySeperator_r(two.child,two.child,target.child) then return false end if
    else if one.type==weights.WT_BALANCE then if two.type!=weights.WT_BALANCE or target.type!=weights.WT_BALANCE then return false end if;target.weight=n.fdiv(n.fadd(one.weight,two.weight),2.0);if target.weight>target.maxWeight then target.maxWeight=target.weight end if;if target.weight>target.minWeight then target.minWeight=target.weight end if end if
  end for;return true
end function
/// Apply `mq3.botlib.ai_weight_runtime.interbreedFuzzySeperator_r` while evaluating `interbreedWeightConfigs`.
/// @param first First record; accesses `weights`.
/// @param second Second record; accesses `weights`.
/// @param result Result record; accesses `weights`.
function interbreedWeightConfigs(first,second,result)
  if first==void or second==void or result==void or len(first.weights)!=len(second.weights) or len(first.weights)!=len(result.weights) then return false end if;for index=0 to len(first.weights)-1 if not interbreedFuzzySeperator_r(first.weights[index].separators,second.weights[index].separators,result.weights[index].separators) then return false end if end for;return true
end function

// The C writer is enclosed in #if 0 in the released source.  Keep its exact
// text format available behind an explicit, suppressible host write callback.
/// @param count Number of entries or bytes processed by this call.
function indent(count) value="";if count<=0 then return value end if;for index=0 to count-1 value=value+"\t" end for;return value end function
/// Format a numeric fuzzy-weight value and remove a trailing decimal point when present.
/// @param value Value passed as argument 1 to `str`.
function numberText(value) text=str(value);if len(bytes(text))>0 and bytes(text)[len(bytes(text))-1]==46 then return strings.substr(text,0,len(bytes(text))-1) end if;return text end function
/// Apply `mq3.botlib.ai_weight_runtime.numberText` while evaluating `writeFuzzyWeight`. Return paths include `+numberText(separator.weight)+";\n"`.
/// @param separator Separator record; accesses `type`, `weight`, `minWeight` and `maxWeight`.
function writeFuzzyWeight(separator)
  if separator.type==weights.WT_BALANCE then return " return balance("+numberText(separator.weight)+","+numberText(separator.minWeight)+","+numberText(separator.maxWeight)+");\n" end if;return " return "+numberText(separator.weight)+";\n"
end function
/// Apply `mq3.botlib.ai_weight_runtime.indent`, `mq3.botlib.ai_weight_runtime.writeFuzzySeperators_r` and `mq3.botlib.ai_weight_runtime.writeFuzzyWeight` while evaluating `writeFuzzySeperators_r`. Return paths include `text+indent(indentLevel)+"} //end switch\n"`.
/// @param separators Array or byte sequence accessed at `0` and `index`.
/// @param indentLevel Number of entries or bytes processed by this call.
function writeFuzzySeperators_r(separators,indentLevel)
  if separators==void or len(separators)==0 then return "" end if;text=indent(indentLevel)+"switch("+str(separators[0].inventoryIndex)+")\n"+indent(indentLevel)+"{\n"
  for index=0 to len(separators)-1 separator=separators[index];text=text+indent(indentLevel+1);if index+1<len(separators) then text=text+"case "+str(separator.value)+":" else text=text+"default:" end if
    if separator.child!=void then text=text+"\n"+indent(indentLevel+1)+"{\n"+writeFuzzySeperators_r(separator.child,indentLevel+2)+indent(indentLevel+1)+"} //end ";if index+1<len(separators) then text=text+"case\n" else text=text+"default\n" end if
    else text=text+writeFuzzyWeight(separator) end if
  end for;return text+indent(indentLevel)+"} //end switch\n"
end function
/// Apply `mq3.botlib.ai_weight_runtime.writeFuzzySeperators_r`, `mq3.botlib.ai_weight_runtime.indent` and `mq3.botlib.ai_weight_runtime.writeFuzzyWeight` while evaluating `weightConfigText`. Return paths include `text`.
/// @param config Configuration record; accesses `weights`.
function weightConfigText(config)
  text="";if config==void then return text end if;for each weight in config.weights text=text+"\nweight \""+weight.name+"\"\n{\n";if len(weight.separators)>0 and weight.separators[0].inventoryIndex>0 then text=text+writeFuzzySeperators_r(weight.separators,1) else if len(weight.separators)>0 then text=text+indent(1)+writeFuzzyWeight(weight.separators[0]) end if;text=text+"} //end weight\n" end for;return text
end function
/// Use `state.writeFn` to perform `writeWeightConfig`. Return paths include `state.writeFn(state.context,filename,weightConfigText(config))`.
/// @param state AI weight runtime state; accesses `writeFn` and `context`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param config Configuration record; accesses `weights`.
function writeWeightConfig(state,filename,config) if state==void or state.writeFn==void then return false end if;return state.writeFn(state.context,filename,weightConfigText(config)) end function
/// Set `state.weights.configs` to `[]` in `mq3.botlib.ai_weight_runtime.botShutdownWeights`.
/// @param state AI weight runtime state; accesses `weights`. May update `state.weights.configs` in place.
function botShutdownWeights(state) if state!=void then state.weights.configs=[] end if;return 0 end function

// Exact be_ai_weight.h spellings for native-header consumers.  State-bearing
// operations keep the port's explicit owner as their leading argument.
/// @param config Configuration record; accesses `weights`.
/// @param name Name used to identify the requested entry.
function FindFuzzyWeight(config,name) return findFuzzyWeight(config,name) end function
/// Forward `FuzzyWeight` to `mq3.botlib.ai_weight_runtime.fuzzyWeight` and return the delegated result.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param config Configuration record; accesses `weights`.
/// @param weightNumber Operand used to evaluate the returned expression `fuzzySeparators(inventory,config.weights[weightNumber].separators)`.
function FuzzyWeight(inventory,config,weightNumber) return fuzzyWeight(inventory,config,weightNumber) end function
/// Forward `FuzzyWeightUndecided` to `mq3.botlib.ai_weight_runtime.fuzzyWeightUndecided` and return the delegated result.
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param config Configuration record; accesses `weights`.
/// @param weightNumber Operand used to evaluate the returned expression `fuzzyWeightUndecided_r(state,inventory,config.weights[weightNumber].separators)`.
function FuzzyWeightUndecided(state,inventory,config,weightNumber) return fuzzyWeightUndecided(state,inventory,config,weightNumber) end function
/// Forward `ScaleWeight` to `mq3.botlib.ai_weight_runtime.scaleWeight` and return the delegated result.
/// @param config Configuration record; accesses `weights`.
/// @param name Name used to identify the requested entry.
/// @param scale Scale factor applied to the computed value.
function ScaleWeight(config,name,scale) return scaleWeight(config,name,scale) end function
/// Forward `ScaleBalanceRange` to `mq3.botlib.ai_weight_runtime.scaleFuzzyBalanceRange` and return the delegated result.
/// @param config Configuration record; accesses `weights`.
/// @param scale Scale factor applied to the computed value.
function ScaleBalanceRange(config,scale) return scaleFuzzyBalanceRange(config,scale) end function
/// Forward `EvolveWeightConfig` to `mq3.botlib.ai_weight_runtime.evolveWeightConfig` and return the delegated result.
/// @param state AI weight runtime state; accesses `randomFn` and `context`.
/// @param config Configuration record; accesses `weights`.
function EvolveWeightConfig(state,config) return evolveWeightConfig(state,config) end function
/// Forward `InterbreedWeightConfigs` to `mq3.botlib.ai_weight_runtime.interbreedWeightConfigs` and return the delegated result.
/// @param first First record; accesses `weights`.
/// @param second Second record; accesses `weights`.
/// @param result Result record; accesses `weights`.
function InterbreedWeightConfigs(first,second,result) return interbreedWeightConfigs(first,second,result) end function
/// Forward `BotShutdownWeights` to `mq3.botlib.ai_weight_runtime.botShutdownWeights` and return the delegated result.
/// @param state AI weight runtime state; accesses `weights`. May update `state.weights.configs` in place.
function BotShutdownWeights(state) return botShutdownWeights(state) end function
