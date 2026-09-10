// Outer per-client snapshot scheduler from server/sv_snapshot.c.
package mq3.server.snapshot_schedule
import mq3.server.snapshot_send as snapshotSend

struct Netchan unsentFragments unsentLength unsentFragmentStart end struct
function netchan()
  return Netchan(false,0,0)
end function

struct Client state nextSnapshotTime rate netchan slot end struct
function client(slot)
  return Client(0,0,25000,netchan(),slot)
end function

struct Services sendClientSnapshotFn transmitNextFragmentFn context end struct
function services(sendClientSnapshotFn,transmitNextFragmentFn,context)
  return Services(sendClientSnapshotFn,transmitNextFragmentFn,context)
end function

// SV_SendClientMessages. Snapshot construction/transmission stays behind the
// callback so the scheduler can drive snapshot_send.sendClientSnapshot without
// duplicating the already-ported packet pipeline.
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
