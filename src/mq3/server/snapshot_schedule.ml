// SPDX-License-Identifier: GPL-2.0-or-later
// Outer per-client snapshot scheduler from server/sv_snapshot.c.
package mq3.server.snapshot_schedule
import mq3.server.snapshot_send as snapshotSend

/// Netchan record for server.snapshot_schedule, containing `unsentFragments`, `unsentLength`, `unsentFragmentStart`.
struct Netchan
  /// True while a large outgoing message still has fragments to transmit.
  unsentFragments
  /// Total byte length of the outgoing message being fragmented.
  unsentLength
  /// Byte offset of the next outgoing fragment within that message.
  unsentFragmentStart
end struct
/// Create `mq3.server.snapshot_schedule.Netchan` with unsentFragments=false; unsentLength=0; unsentFragmentStart=0.
function netchan()
  return Netchan(false,0,0)
end function

/// Client record for server.snapshot_schedule, containing `state`, `nextSnapshotTime`, `rate`, `netchan`, `slot`.
struct Client
  /// Connection lifecycle value that controls whether snapshots or pending packet fragments may be
  /// scheduled.
  state
  /// Earliest server timestamp for sending the next snapshot, in milliseconds.
  nextSnapshotTime
  /// Maximum client download and snapshot transfer rate, in bytes per second.
  rate
  /// Sequenced network channel used to exchange this client's packets.
  netchan
  /// Index identifying this entry in its owning slot table.
  slot
end struct
/// Create `mq3.server.snapshot_schedule.Client` with state=0; nextSnapshotTime=0; rate=25000; netchan=netchan(); slot=slot.
/// @param slot Initial `slot` field stored in the returned or constructed `mq3.server.snapshot_schedule.Client` record.
function client(slot)
  return Client(0,0,25000,netchan(),slot)
end function

/// Services record for server.snapshot_schedule, containing `sendClientSnapshotFn`, `transmitNextFragmentFn`, `context`.
struct Services
  /// Host callback that sends the next snapshot to a client.
  sendClientSnapshotFn
  /// Host callback that sends the next pending fragment of a large network message.
  transmitNextFragmentFn
  /// Caller-supplied data associated with scheduled snapshot sends and pending-fragment transmission.
  context
end struct
/// Create `mq3.server.snapshot_schedule.Services` with sendClientSnapshotFn=sendClientSnapshotFn; transmitNextFragmentFn=transmitNextFragmentFn; context=context.
/// @param sendClientSnapshotFn Initial `sendClientSnapshotFn` field stored in the returned or constructed `mq3.server.snapshot_schedule.Services` record.
/// @param transmitNextFragmentFn Initial `transmitNextFragmentFn` field stored in the returned or constructed `mq3.server.snapshot_schedule.Services` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.server.snapshot_schedule.Services` record.
function services(sendClientSnapshotFn,transmitNextFragmentFn,context)
  return Services(sendClientSnapshotFn,transmitNextFragmentFn,context)
end function

// SV_SendClientMessages. Snapshot construction/transmission stays behind the
// callback so the scheduler can drive snapshot_send.sendClientSnapshot without
// duplicating the already-ported packet pipeline.
/// @param clients Client scheduling records; disconnected clients and future deadlines are skipped.
/// @param serverTime Current server time in milliseconds.
/// @param maxRate Server rate cap passed to snapshot_send.rateMsec.
/// @param host Service record with sendClientSnapshotFn and transmitNextFragmentFn callbacks.
function sendClientMessages(clients,serverTime,maxRate,host)
  if host==void or host.sendClientSnapshotFn==void or host.transmitNextFragmentFn==void then
    return error(6895,"snapshot schedule: missing send service")
  end if
  sent=0
  for each clientState in clients
    if clientState.state!=0 and serverTime>=clientState.nextSnapshotTime then
      if clientState.netchan.unsentFragments then
        remaining=clientState.netchan.unsentLength-clientState.netchan.unsentFragmentStart
        clientState.nextSnapshotTime=serverTime+snapshotSend.rateMsec(clientState,remaining,maxRate)
        host.transmitNextFragmentFn(host,clientState)
      else
        host.sendClientSnapshotFn(host,clientState)
      end if
      sent=sent+1
    end if
  end for
  return sent
end function
