// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Item configuration and fuzzy-weight parser from be_ai_goal.c/be_ai_weight.c.
package mq3.botlib.ai_item_weights

import mq3.botlib.ai_resource_pools as pools
import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n
import std.string as strings

const BLERR_NOERROR=0
const BLERR_CANNOTLOADITEMWEIGHTS=9
const MAX_ITEMINFO=256
const MAX_WEIGHTS=128
const MAX_WEIGHT_FILES=128
const MAX_INVENTORYVALUE=999999
const WT_BALANCE=1
const OP_LOAD_ITEM_WEIGHTS=543
const OP_FREE_ITEM_WEIGHTS=544

struct ItemInfo classname name model modelIndex type inventoryIndex respawnTime mins maxs number end struct
struct Separator inventoryIndex value type weight minWeight maxWeight child end struct
struct Weight name separators end struct
struct WeightConfig filename weights end struct
struct Reader registry handle end struct
struct Eval tokens position valid end struct
struct Runtime context readFn items configs fileReads end struct

function fail(message) return error(7570,"AI item weights: "+message) end function
function create(context,readFn) return Runtime(context,readFn,void,[],0) end function
function botPath(name)
  value=name;while strings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if strings.startsWith(strings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
function loadText(runtime,name)
  if runtime==void or runtime.readFn==void then return void end if
  runtime.fileReads=runtime.fileReads+1;return runtime.readFn(runtime.context,botPath(name))
end function
function open(runtime,name)
  registry=pc.create(runtime,loadText);handle=pc.load(registry,name);if handle==0 then return fail("cannot load "+name) end if;return Reader(registry,handle)
end function
function close(reader) if reader!=void then pc.free(reader.registry,reader.handle) end if;return void end function
function take(reader) return pc.read(reader.registry,reader.handle) end function
function expect(reader,text)
  token=take(reader);if token==void or token is error or token.text!=text then return fail("expected "+text) end if;return token
end function

function evalTake(state) if state.position>=len(state.tokens) then state.valid=false;return void end if;token=state.tokens[state.position];state.position=state.position+1;return token end function
function evalMatch(state,text) if state.position<len(state.tokens) and state.tokens[state.position].text==text then state.position=state.position+1;return true end if;return false end function
function evalPrimary(state)
  if evalMatch(state,"(") then value=evalConditional(state);if not evalMatch(state,")") then state.valid=false end if;return value end if
  token=evalTake(state);if token==void or token.type!=pc.TT_NUMBER then state.valid=false;return 0.0 end if;return token.floatValue
end function
function evalUnary(state)
  if evalMatch(state,"+") then return evalUnary(state) end if
  if evalMatch(state,"-") then return 0.0-evalUnary(state) end if
  if evalMatch(state,"!") then value=evalUnary(state);if value==0.0 then return 1.0 end if;return 0.0 end if
  return evalPrimary(state)
end function
function evalMultiply(state)
  value=evalUnary(state);while state.position<len(state.tokens)
    if evalMatch(state,"*") then value=value*evalUnary(state);continue end if
    if evalMatch(state,"/") then divisor=evalUnary(state);if divisor==0.0 then state.valid=false;return 0.0 end if;value=value/divisor;continue end if
    break
  end while;return value
end function
function evalAdd(state)
  value=evalMultiply(state);while state.position<len(state.tokens)
    if evalMatch(state,"+") then value=value+evalMultiply(state);continue end if
    if evalMatch(state,"-") then value=value-evalMultiply(state);continue end if
    break
  end while;return value
end function
function truth(value) return value!=0.0 end function
function evalCompare(state)
  value=evalAdd(state);while state.position<len(state.tokens)
    matched=true;right=0.0;result=false
    if evalMatch(state,"<") then right=evalAdd(state);result=value<right
    else
      if evalMatch(state,"<=") then right=evalAdd(state);result=value<=right
      else
        if evalMatch(state,">") then right=evalAdd(state);result=value>right
        else
          if evalMatch(state,">=") then right=evalAdd(state);result=value>=right
          else
            if evalMatch(state,"==") then right=evalAdd(state);result=value==right
            else
              if evalMatch(state,"!=") then right=evalAdd(state);result=value!=right else matched=false end if
            end if
          end if
        end if
      end if
    end if
    if not matched then break end if;if result then value=1.0 else value=0.0 end if
  end while;return value
end function
function evalBitwise(state)
  value=evalCompare(state);while state.position<len(state.tokens)
    if evalMatch(state,"|") then value=n.trunc32(value)|n.trunc32(evalCompare(state));continue end if
    if evalMatch(state,"&") then value=n.trunc32(value)&n.trunc32(evalCompare(state));continue end if
    if evalMatch(state,"^") then value=n.trunc32(value)^n.trunc32(evalCompare(state));continue end if
    break
  end while;return value
end function
function evalConditional(state)
  condition=evalBitwise(state);if not evalMatch(state,"?") then return condition end if
  yes=evalConditional(state);if not evalMatch(state,":") then state.valid=false;return 0.0 end if;no=evalConditional(state);if truth(condition) then return yes end if;return no
end function
function evaluate(tokens)
  state=Eval(tokens,0,true);value=evalConditional(state);if not state.valid or state.position!=len(tokens) then return fail("invalid $evalfloat expression") end if;return n.f32(value)
end function
function computedFromFirst(reader,token)
  if token==void or token is error then return fail("missing number") end if
  if token.text=="-" then value=readComputed(reader);if value is error then return value end if;return n.f32(0.0-value) end if
  if token.text=="+" then return readComputed(reader) end if
  if token.text=="$" then
    kind=take(reader);if kind==void or kind is error or (kind.text!="evalfloat" and kind.text!="evalint") or expect(reader,"(") is error then return fail("invalid precompiler evaluation") end if
    values=[];depth=0
    while true next=take(reader);if next==void or next is error then return fail("unterminated $evalfloat") end if
      if next.text==")" and depth==0 then break end if
      if next.text=="(" then depth=depth+1 else if next.text==")" then depth=depth-1 end if;values=values+[next]
    end while;result=evaluate(values);if result is error then return result end if;if kind.text=="evalint" then return n.trunc32(result) end if;return result
  end if
  if token.type!=pc.TT_NUMBER then return fail("expected numeric value, got "+token.text) end if;return n.f32(token.floatValue)
end function
function readComputed(reader) return computedFromFirst(reader,take(reader)) end function
function readInteger(reader) value=readComputed(reader);if value is error then return value end if;return n.trunc32(value) end function
function readVector(reader)
  if expect(reader,"{") is error then return fail("expected vector") end if;result=[]
  for axis=0 to 2 value=readComputed(reader);if value is error then return value end if;result=result+[value];if axis<2 and expect(reader,",") is error then return fail("expected vector comma") end if end for
  if expect(reader,"}") is error then return fail("unterminated vector") end if;return result
end function

function parseItems(runtime,name)
  reader=open(runtime,name);if reader is error then return reader end if;items=[]
  while true token=take(reader);if token==void then close(reader);return items end if;if token is error then close(reader);return token end if
    if token.text!="iteminfo" or len(items)>=MAX_ITEMINFO then close(reader);return fail("invalid item definition") end if
    classname=take(reader);if classname==void or classname is error or classname.type!=pc.TT_STRING then close(reader);return fail("missing item classname") end if
    if expect(reader,"{") is error then close(reader);return fail("missing item body") end if
    item=ItemInfo(classname.text,"","",0,0,0,0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],len(items))
    while true field=take(reader);if field==void or field is error then close(reader);return fail("unterminated item body") end if;if field.text=="}" then break end if
      if field.text=="name" or field.text=="model" then value=take(reader);if value==void or value is error or value.type!=pc.TT_STRING then close(reader);return fail("invalid "+field.text) end if;if field.text=="name" then item.name=value.text else item.model=value.text end if
      else if field.text=="modelindex" then value=readInteger(reader);if value is error then close(reader);return value end if;item.modelIndex=value
      else if field.text=="type" then value=readInteger(reader);if value is error then close(reader);return value end if;item.type=value
      else if field.text=="index" then value=readInteger(reader);if value is error then close(reader);return value end if;item.inventoryIndex=value
      else if field.text=="respawntime" then value=readComputed(reader);if value is error then close(reader);return value end if;item.respawnTime=value
      else if field.text=="mins" then value=readVector(reader);if value is error then close(reader);return value end if;item.mins=value
      else if field.text=="maxs" then value=readVector(reader);if value is error then close(reader);return value end if;item.maxs=value
      else close(reader);return fail("unknown item field "+field.text) end if
    end while;items=items+[item]
  end while
end function

function readFuzzyWeight(reader)
  first=take(reader);if first==void or first is error then return fail("missing fuzzy weight") end if
  if first.text=="balance" then
    if expect(reader,"(") is error then return fail("invalid balance") end if;weight=readComputed(reader);if weight is error then return weight end if
    if expect(reader,",") is error then return fail("invalid balance") end if;minimum=readComputed(reader);if minimum is error then return minimum end if
    if expect(reader,",") is error then return fail("invalid balance") end if;maximum=readComputed(reader);if maximum is error then return maximum end if
    if expect(reader,")") is error or expect(reader,";") is error then return fail("invalid balance terminator") end if;return [WT_BALANCE,weight,minimum,maximum]
  end if
  weight=computedFromFirst(reader,first);if weight is error then return weight end if;if expect(reader,";") is error then return fail("missing fuzzy weight terminator") end if;return [0,weight,weight,weight]
end function
function readSeparators(reader)
  if expect(reader,"(") is error then return fail("missing switch index") end if;inventoryIndex=readInteger(reader);if inventoryIndex is error then return inventoryIndex end if
  if expect(reader,")") is error or expect(reader,"{") is error then return fail("invalid switch body") end if;values=[];foundDefault=false
  while true token=take(reader);if token==void or token is error then return fail("unterminated switch") end if;if token.text=="}" then break end if
    if token.text!="case" and token.text!="default" then return fail("invalid switch label "+token.text) end if
    threshold=MAX_INVENTORYVALUE;if token.text=="default" then if foundDefault then return fail("duplicate switch default") end if;foundDefault=true else threshold=readInteger(reader);if threshold is error then return threshold end if end if
    if expect(reader,":") is error then return fail("missing switch colon") end if;body=take(reader);if body==void or body is error then return fail("missing switch branch") end if;grouped=false
    if body.text=="{" then grouped=true;body=take(reader);if body==void or body is error then return fail("empty switch branch") end if end if
    child=void;kind=0;weight=0.0;minimum=0.0;maximum=0.0
    if body.text=="return" then parsed=readFuzzyWeight(reader);if parsed is error then return parsed end if;kind=parsed[0];weight=parsed[1];minimum=parsed[2];maximum=parsed[3]
    else if body.text=="switch" then child=readSeparators(reader);if child is error then return child end if
    else return fail("invalid switch branch "+body.text) end if
    if grouped and expect(reader,"}") is error then return fail("unterminated switch branch") end if
    values=values+[Separator(inventoryIndex,threshold,kind,weight,minimum,maximum,child)]
  end while
  if not foundDefault then values=values+[Separator(inventoryIndex,MAX_INVENTORYVALUE,0,0.0,0.0,0.0,void)] end if;return values
end function
function parseWeightConfig(runtime,filename)
  reader=open(runtime,filename);if reader is error then return reader end if;weights=[]
  while true token=take(reader);if token==void then close(reader);return WeightConfig(filename,weights) end if;if token is error then close(reader);return token end if
    if token.text!="weight" or len(weights)>=MAX_WEIGHTS then close(reader);return fail("invalid weight definition") end if
    name=take(reader);if name==void or name is error or name.type!=pc.TT_STRING then close(reader);return fail("missing weight name") end if
    body=take(reader);if body==void or body is error then close(reader);return fail("missing weight body") end if;grouped=false
    if body.text=="{" then grouped=true;body=take(reader);if body==void or body is error then close(reader);return fail("empty weight body") end if end if
    separators=void
    if body.text=="switch" then separators=readSeparators(reader)
    else if body.text=="return" then parsed=readFuzzyWeight(reader);if not (parsed is error) then separators=[Separator(0,MAX_INVENTORYVALUE,parsed[0],parsed[1],parsed[2],parsed[3],void)] end if
    else close(reader);return fail("invalid weight body "+body.text) end if
    if separators is error then close(reader);return separators end if;if grouped and expect(reader,"}") is error then close(reader);return fail("unterminated weight body") end if
    weights=weights+[Weight(name.text,separators)]
  end while
end function

function findWeight(config,name) if config==void then return -1 end if;for index=0 to len(config.weights)-1 if config.weights[index].name==name then return index end if end for;return -1 end function
function itemWeightIndex(config,items) result=[];for each item in items result=result+[findWeight(config,item.classname)] end for;return result end function
function cached(runtime,filename) for each config in runtime.configs if config.filename==filename then return config end if end for;return void end function
function weightConfig(runtime,filename)
  existing=cached(runtime,filename);if existing!=void then return existing end if;if len(runtime.configs)>=MAX_WEIGHT_FILES then return fail("weight cache full") end if
  config=parseWeightConfig(runtime,filename);if config is error then return config end if;runtime.configs=runtime.configs+[config];return config
end function
function ensureItems(runtime) if runtime.items==void then runtime.items=parseItems(runtime,"items.c") end if;return runtime.items end function
function loadItemWeights(runtime,statePools,handle,filename)
  goal=pools.goalState(statePools,handle);if goal==void then return BLERR_CANNOTLOADITEMWEIGHTS end if
  config=weightConfig(runtime,filename);if config is error then return BLERR_CANNOTLOADITEMWEIGHTS end if;items=ensureItems(runtime);if items is error or items==void then return BLERR_CANNOTLOADITEMWEIGHTS end if
  goal.itemWeightConfig=config;goal.itemWeightIndex=itemWeightIndex(config,items);return BLERR_NOERROR
end function
function freeItemWeights(runtime,statePools,handle) goal=pools.goalState(statePools,handle);if goal==void then return 0 end if;goal.itemWeightConfig=void;goal.itemWeightIndex=void;return 0 end function
function separatorWeight(inventory,separators,index)
  current=separators[index];amount=0;if current.inventoryIndex>=0 and current.inventoryIndex<len(inventory) then amount=inventory[current.inventoryIndex] end if
  if amount<current.value then if current.child!=void then return fuzzySeparators(inventory,current.child) end if;return current.weight end if
  if index+1<len(separators) then next=separators[index+1];if amount<next.value then
    first=current.weight;if current.child!=void then first=fuzzySeparators(inventory,current.child) end if;second=next.weight;if next.child!=void then second=fuzzySeparators(inventory,next.child) end if
    scale=(amount-current.value)/(next.value-current.value);return n.f32(scale*first+(1.0-scale)*second)
  end if;return separatorWeight(inventory,separators,index+1) end if;return current.weight
end function
function fuzzySeparators(inventory,separators) if separators==void or len(separators)==0 then return 0.0 end if;return separatorWeight(inventory,separators,0) end function
function fuzzyWeight(inventory,config,weightNumber) if config==void or weightNumber<0 or weightNumber>=len(config.weights) then return 0.0 end if;return fuzzySeparators(inventory,config.weights[weightNumber].separators) end function
function shutdown(runtime) if runtime!=void then runtime.items=void;runtime.configs=[] end if;return 0 end function
