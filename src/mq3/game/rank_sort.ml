// SPDX-License-Identifier: GPL-2.0-or-later
// Native Windows qsort ordering profile for client indices. Array operations
// reproduce the observed UCRT comparison/partition schedule, including ties.
// This is not the distinct qsort implementation in the original QVM library.
package mq3.game.rank_sort
/// Swap two entries of the rank-index array in place.
/// @param indices Array or byte sequence accessed at `a` and `b`. Entries are written in place.
/// @param a Value used by `exchange` in `saved = indices[a]`.
/// @param b Value used by `exchange` in `indices[a] = indices[b]`.
function exchange(indices,a,b)
  saved = indices[a]; indices[a] = indices[b]; indices[b] = saved
  return void
end function
/// Apply `mq3.game.rank_sort.exchange` and `mq3.game.rank_sort.rangeSort` while evaluating `rangeSort`.
/// @param level Value passed as argument 1 to `compare`.
/// @param indices Array or byte sequence accessed at `a` and `b`. Entries are written in place.
/// @param low Value used by `exchange` in `saved = indices[a]`.
/// @param high Value used by `exchange` in `indices[a] = indices[b]`.
/// @param compare Value passed as argument 5 to `mq3.game.rank_sort.rangeSort`.
function rangeSort(level,indices,low,high,compare)
  if high <= low then return void end if
  count = high-low+1
  if count <= 8 then
    endIndex = high
    while endIndex > low
      largest = low; index = low+1
      while index <= endIndex
        if compare(level,indices[index],indices[largest]) > 0 then largest = index end if
        index = index+1
      end while
      exchange(indices,largest,endIndex); endIndex = endIndex-1
    end while
    return void
  end if
  pivot = low+(count >> 1)
  if compare(level,indices[low],indices[pivot]) > 0 then exchange(indices,low,pivot) end if
  if compare(level,indices[low],indices[high]) > 0 then exchange(indices,low,high) end if
  if compare(level,indices[pivot],indices[high]) > 0 then exchange(indices,pivot,high) end if
  left = low; right = high
  while true
    if pivot > left then
      left = left+1
      while left < pivot and compare(level,indices[left],indices[pivot]) <= 0
        left = left+1
      end while
    end if
    if pivot <= left then
      left = left+1
      while left <= high and compare(level,indices[left],indices[pivot]) <= 0
        left = left+1
      end while
    end if
    right = right-1
    while right > pivot and compare(level,indices[right],indices[pivot]) > 0
      right = right-1
    end while
    if right < left then break end if
    exchange(indices,left,right)
    if pivot == right then pivot = left end if
  end while
  right = right+1
  if pivot < right then
    right = right-1
    while right > pivot and compare(level,indices[right],indices[pivot]) == 0
      right = right-1
    end while
  end if
  if pivot >= right then
    right = right-1
    while right > low and compare(level,indices[right],indices[pivot]) == 0
      right = right-1
    end while
  end if
  // Recurse into the smaller part first, as in the native profile.
  if right-low >= high-left then
    rangeSort(level,indices,left,high,compare); rangeSort(level,indices,low,right,compare)
  else
    rangeSort(level,indices,low,right,compare); rangeSort(level,indices,left,high,compare)
  end if
  return void
end function
/// Sort client indices using the rank comparison callback without moving the underlying client records.
/// @param level Value passed as argument 1 to `compare`.
/// @param indices Array or byte sequence accessed at `a` and `b`. Entries are written in place.
/// @param count Number of entries or bytes processed by this call.
/// @param compare Value passed as argument 5 to `mq3.game.rank_sort.rangeSort`.
function sortIndices(level,indices,count,compare)
  if count < 0 or count > 64 or count > len(indices) then return error(495,"Invalid rank sort count") end if
  return rangeSort(level,indices,0,count-1,compare)
end function
