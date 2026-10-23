// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.internal_headers as h
import mq3.botlib.l_precomp as pre
import mq3.botlib.ai_map_goals as goals
import mq3.botlib.aas_bspq3 as bsp
import mq3.botlib.aas_route_extras as routes
import mq3.botlib.ai_item_weights as itemWeights
import mq3.botlib.ai_weight_runtime as fuzzy

function require(condition,message)
  if not condition then return error(7895,"botlib internal header contract: "+message) end if
  return 1
end function

function contains(values,needle)
  for each value in values if value==needle then return true end if end for
  return false
end function

function main(args)
  checks=0;counts=h.headerCounts()
  checks=checks+require(counts==[22,119,110,25,227,5,236],"inventory counts")
  checks=checks+require(len(h.headerNames())==22 and len(h.ownershipMappings())==22,"header ownership")
  checks=checks+require(len(h.macroNames())==119 and contains(h.macroNames(),"AAS_DEBUG") and contains(h.macroNames(),"RANDOMIZE"),"macro inventory")
  checks=checks+require(len(h.constantNames())==110 and len(h.constantValues())==110,"constant inventory")
  checks=checks+require(h.MAX_CLIENTS==64 and h.MAX_MODELS==256 and h.CS_MODELS==96 and h.CS_SOUNDS==352,"AAS configstrings")
  checks=checks+require(h.CACHETYPE_PORTAL==0 and h.CACHETYPE_AREA==1 and h.validCacheType(0) and h.validCacheType(1) and not h.validCacheType(2),"route cache types")
  checks=checks+require(h.MAX_EPAIRKEY==128 and h.clampEpairLength(-1)==0 and h.clampEpairLength(128)==127,"BSP epair bound")
  checks=checks+require(h.WT_BALANCE==1 and h.MAX_WEIGHTS==128,"weight constants")
  checks=checks+require(h.INDENT_IF==1 and h.INDENT_ELSE==2 and h.INDENT_ELIF==4 and h.INDENT_IFDEF==8 and h.INDENT_IFNDEF==16,"preprocessor indent flags")
  checks=checks+require(pre.INDENT_IF==h.INDENT_IF and pre.INDENT_IFNDEF==h.INDENT_IFNDEF,"productive preprocessor constants")
  checks=checks+require(goals.MAX_EPAIRKEY==h.MAX_EPAIRKEY,"productive BSP epair bound")
  checks=checks+require(h.TT_STRING==1 and h.TT_PUNCTUATION==5 and h.validTokenType(1) and h.validTokenType(5) and not h.validTokenType(6),"token kinds")
  checks=checks+require(h.P_RSHIFT_ASSIGN==1 and h.P_DOLLAR==52,"punctuation range")
  checks=checks+require(h.FT_CHAR==1 and h.FT_STRUCT==6 and h.validFieldType(h.FT_INT|h.FT_ARRAY) and not h.validFieldType(5),"structure field kinds")
  checks=checks+require(len(h.typeNames())==25 and contains(h.typeNames(),"aas_t") and contains(h.typeNames(),"source_t") and contains(h.typeNames(),"script_t"),"type inventory")
  checks=checks+require(len(h.declarationNames())==227 and contains(h.declarationNames(),"AAS_PredictRoute") and contains(h.declarationNames(),"PC_ReadToken") and contains(h.declarationNames(),"ReadStructure"),"declaration inventory")
  checks=checks+require(h.globalNames()==["aasworld","aassettings","botlibglobals","botimport","bot_developer"],"extern globals")
  checks=checks+require(len(h.fieldNames())==236 and contains(h.fieldNames(),"aas_t.reachabilityareas") and contains(h.fieldNames(),"source_t.definehash") and contains(h.fieldNames(),"script_t.punctuationtable"),"structure fields")
  checks=checks+require(len(h.x86AbiSizes())==25 and h.x86AbiSizes()[5]==156 and h.x86AbiSizes()[11]==4580 and h.x86AbiSizes()[18]==3152,"x86 ABI sizes")
  checks=checks+require(bsp.AAS_PrintFreeBSPLinks("header contract")==void and not bsp.AAS_AreasConnected(1,2),"declared inert Q3 BSP entry points")
  routeState=routes.AAS_InitAlternativeRouting(void);checks=checks+require(routeState.initialized and len(routeState.valid)==0,"alternative-routing header init");routes.AAS_ShutdownAlternativeRouting(routeState);checks=checks+require(not routeState.initialized,"alternative-routing header shutdown")
  config=itemWeights.WeightConfig("header",[itemWeights.Weight("aim",[itemWeights.Separator(0,0,itemWeights.WT_BALANCE,7.0,7.0,7.0,void)])]);checks=checks+require(fuzzy.FindFuzzyWeight(config,"aim")==0 and fuzzy.FuzzyWeight([0],config,0)==7.0,"weight header spellings")
  print("PASS: "+str(checks)+" botlib internal header contracts")
  return 0
end function
