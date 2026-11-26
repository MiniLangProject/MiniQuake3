// SPDX-License-Identifier: GPL-2.0-or-later
// Datagram length is not the capacity of a reassembled protocol message.
package mq3.qcommon.received_message
import mq3.qcommon.message as message
import mq3.qcommon.netchan as netchan
import mq3.compat.numeric as numeric

/// Wraps a received datagram with message capacity appropriate for fragment reassembly.
/// Ordinary packets, including the connectionless -1 prefix, borrow the supplied byte buffer and
/// use its length as capacity. A packet carrying the fragment bit receives independent `MAX_MSGLEN`
/// storage containing the datagram bytes. The returned message's valid byte count is always the
/// datagram length, its read cursors start at zero, and Huffman mode is selected initially.
/// Returns error 7981 for void data or a datagram larger than `MAX_MSGLEN`; protocol headers and
/// fragment contents are validated later by the packet-event and netchan paths.
/// @param data Received datagram bytes; retained by reference unless the sequence header marks a fragment.
function create(data)
  if data==void or len(data)>netchan.MAX_MSGLEN then return error(7981,"receive: datagram exceeds message capacity") end if
  size=len(data);fragmented=false
  if size>=4 then
    sequence=numeric.readI32(data,0)
    fragmented=sequence!=-1 and (sequence&netchan.FRAGMENT_BIT)!=0
  end if
  // Only fragmented datagrams need the full receive capacity. Ordinary packets
  // retain their existing ownership/copy behavior; OOB -1 is not a fragment.
  msg=message.initStorage(data,size,false)
  if fragmented then
    msg=message.init(netchan.MAX_MSGLEN)
    if size>0 then copyBytes(msg.data,0,data,0,size) end if
  end if
  msg.cursize=size;return msg
end function
