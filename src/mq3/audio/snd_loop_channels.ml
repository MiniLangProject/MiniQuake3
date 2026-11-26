// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 S_AddLoopSounds grouping and integer channel-volume accumulation.
package mq3.audio.snd_loop_channels

import mq3.audio.snd_spatialize as loopSpatial

const MAX_CHANNELS=96

/// Entry record for audio.snd_loop_channels, containing `id`, `handle`, `origin`, `realLoop`, `doppler`, `dopplerScale`, and 2 further fields.
struct Entry id handle origin realLoop doppler dopplerScale oldDopplerScale active end struct
/// Group record for audio.snd_loop_channels, containing `handle`, `primary`, `ids`, `left`, `right`, `doppler`, and 2 further fields.
struct Group handle primary ids left right doppler dopplerScale oldDopplerScale end struct

/// Group active loop sounds by matching source while accumulating their spatialized channel volumes.
/// @param entries Entries used in `len(entries)` and `entries[index]`.
/// @param listenerOrigin Listener origin passed as `listenerOrigin` to `mq3.audio.snd_spatialize.spatialize`.
/// @param listenerAxis Listener axis passed as `listenerAxis` to `mq3.audio.snd_spatialize.spatialize`.
function build(entries,listenerOrigin,listenerAxis)
  groups=[];merged=array(len(entries),false)
  if len(entries)>0 then
    for index=0 to len(entries)-1
      current=entries[index]
      if current.active and not merged[index] and len(groups)<MAX_CHANNELS then
        master=127;if current.realLoop then master=90 end if
        volume=loopSpatial.spatialize(current.origin,listenerOrigin,listenerAxis,master,2);if volume is error then return volume end if
        left=volume.left;right=volume.right;ids=[current.id]
        if index+1<len(entries) then
          for otherIndex=index+1 to len(entries)-1
            other=entries[otherIndex]
            if other.active and not other.doppler and other.handle==current.handle then
              merged[otherIndex]=true;otherMaster=127;if other.realLoop then otherMaster=90 end if
              otherVolume=loopSpatial.spatialize(other.origin,listenerOrigin,listenerAxis,otherMaster,2);if otherVolume is error then return otherVolume end if
              left=left+otherVolume.left;right=right+otherVolume.right;ids=ids+[other.id]
            end if
          end for
        end if
        if left!=0 or right!=0 then
          if left>255 then left=255 end if;if right>255 then right=255 end if
          groups=groups+[Group(current.handle,current.id,ids,left,right,current.doppler,current.dopplerScale,current.oldDopplerScale)]
        end if
      end if
    end for
  end if
  return groups
end function
