// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Genetic bot selection from code/botlib/be_ai_gen.c.
package mq3.botlib.ai_genetic

import mq3.compat.numeric as geneticNumeric

const MAX_RANKS=256

/// Update `runtime.randomSeed` during `randomFloat`. Return paths include `geneticNumeric.fdiv((geneticNumeric.u32(runtime.randomSeed)>>16)&32767,32767.0)`.
/// @param runtime AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
function randomFloat(runtime)
  // Baseq3 random() expands to rand()/RAND_MAX. The original Windows build
  // therefore uses the MSVCRT 214013/2531011 sequence and its 15-bit result.
  runtime.randomSeed=geneticNumeric.add32(geneticNumeric.mul32(runtime.randomSeed,214013),2531011)
  return geneticNumeric.fdiv((geneticNumeric.u32(runtime.randomSeed)>>16)&32767,32767.0)
end function

/// Apply `mq3.botlib.ai_genetic.randomFloat` while evaluating `selection`.
/// @param runtime AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
/// @param numRanks Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param rankings Array or byte sequence accessed at `index`.
function selection(runtime,numRanks,rankings)
  sum=0.0
  for index=0 to numRanks-1 if rankings[index]>=0.0 then sum=geneticNumeric.fadd(sum,rankings[index]) end if end for
  if sum>0.0 then
    // The released body computes select but then selects from the descending
    // residual sum without comparing against it. Preserve that observable bug.
    select=geneticNumeric.fmul(randomFloat(runtime),sum)
    for index=0 to numRanks-1
      if rankings[index]>=0.0 then sum=geneticNumeric.fsub(sum,rankings[index]);if sum<=0.0 then return index end if end if
    end for
  end if
  index=geneticNumeric.trunc32(geneticNumeric.fmul(randomFloat(runtime),numRanks));if index>=numRanks then index=0 end if
  for count=0 to numRanks-1 if rankings[index]>=0.0 then return index end if;index=(index+1)%numRanks end for
  return 0
end function

/// Apply `mq3.botlib.ai_genetic.selection` while evaluating `parentsAndChild`. Return paths include `[1,parent1,parent2,child]`.
/// @param runtime AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
/// @param numRanks Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param ranks Array or byte sequence accessed at `index`.
function parentsAndChild(runtime,numRanks,ranks)
  if runtime==void or numRanks>MAX_RANKS or numRanks<0 or len(ranks)<numRanks then return [0,0,0,0] end if
  valid=0;for index=0 to numRanks-1 if ranks[index]>=0.0 then valid=valid+1 end if end for
  if valid<3 then return [0,0,0,0] end if
  rankings=[];for index=0 to numRanks-1 rankings=rankings+[geneticNumeric.f32(ranks[index])] end for
  parent1=selection(runtime,numRanks,rankings);rankings[parent1]=-1.0
  parent2=selection(runtime,numRanks,rankings);rankings[parent2]=-1.0
  maximum=0.0
  for index=0 to numRanks-1 if rankings[index]>=0.0 and rankings[index]>maximum then maximum=rankings[index] end if end for
  for index=0 to numRanks-1 if rankings[index]>=0.0 then rankings[index]=geneticNumeric.fsub(maximum,rankings[index]) end if end for
  child=selection(runtime,numRanks,rankings)
  return [1,parent1,parent2,child]
end function
