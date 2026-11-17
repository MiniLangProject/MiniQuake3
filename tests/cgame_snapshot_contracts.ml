import mq3.client.cgame_snapshot as snap
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
struct Source serverTime playerState entities end struct
function req(value,message) if not value then return error(7702,message) end if;return 1 end function
function source(time,client,flags,entities) player=ps.create();player.clientNum=client;player.eFlags=flags;return Source(time,player,entities) end function
function entity(number,flags) value=es.create();value.number=number;value.eFlags=flags;value.origin=[number*1.0,2.0,3.0];return value end function
function main(args)
 count=0;state=snap.create(32);a=source(1000,0,0,[entity(1,0)]);state.snapshots=[snap.wrap(1,a,0,3)];state.latestSnapshotNum=1
 count=count+req(snap.processSnapshots(state,1000) and state.snap.serverTime==1000,"initial snapshot");count=count+req(state.respawns==1 and state.solidBuilds==1,"initial respawn/solids");count=count+req(state.executedSequences==[3] and state.entities[1].events==1,"initial commands/events")
 b=source(1050,0,0,[entity(1,0),entity(2,0)]);state.snapshots=state.snapshots+[snap.wrap(2,b,0,4)];state.latestSnapshotNum=2;count=count+req(snap.processSnapshots(state,1025),"next snapshot read");count=count+req(state.nextSnap.serverTime==1050 and state.entities[1].interpolate and not state.entities[2].interpolate,"entity interpolation")
 count=count+req(snap.processSnapshots(state,1050) and state.snap.serverTime==1050 and state.nextSnap==void,"snapshot transition");count=count+req(state.entities[1].snapShotTime==1050 and state.entities[2].currentValid,"transition entities");count=count+req(state.executedSequences==[3,4],"transition commands")
 c=source(1100,0,snap.EF_TELEPORT_BIT,[entity(1,snap.EF_TELEPORT_BIT)]);state.snapshots=state.snapshots+[snap.wrap(3,c,0,5)];state.latestSnapshotNum=3;snap.processSnapshots(state,1075);count=count+req(state.nextFrameTeleport and not state.entities[1].interpolate,"teleport next frame");snap.processSnapshots(state,1100);count=count+req(state.thisFrameTeleport,"teleport transition")
 d=source(1150,2,snap.EF_TELEPORT_BIT,[]);state.snapshots=state.snapshots+[snap.wrap(4,d,snap.SNAPFLAG_SERVERCOUNT,6)];state.latestSnapshotNum=4;snap.processSnapshots(state,1125);count=count+req(state.nextFrameTeleport,"follow/server restart teleport")
 dropped=snap.create(8);dropped.latestSnapshotNum=2;dropped.snapshots=[snap.wrap(2,source(20,0,0,[]),0,0)];found=snap.readNextSnapshot(dropped);count=count+req(found.number==2 and dropped.lagometer==[void,20],"dropped snapshot accounting")
 // Literal protocol flags from original q_shared.h: 1 is RATE_DELAYED, 2 is NOT_ACTIVE.
 // Do not derive wire fixtures from the constant being tested.
 inactive=snap.create(8);inactive.latestSnapshotNum=2;inactive.snapshots=[snap.wrap(1,source(10,0,0,[]),2,0),snap.wrap(2,source(20,0,0,[]),0,0)];count=count+req(snap.processSnapshots(inactive,20) and inactive.snap.number==2,"inactive wire snapshot skipped")
 limited=snap.create(8);limited.latestSnapshotNum=1;limited.snapshots=[snap.wrap(1,source(10,0,0,[]),1,7)];count=count+req(snap.processSnapshots(limited,10) and limited.snap.number==1 and limited.executedSequences==[7],"rate-delayed wire snapshot is active")
 mixed=snap.create(8);mixed.latestSnapshotNum=1;mixed.snapshots=[snap.wrap(1,source(10,0,0,[]),3,8)];count=count+req(not snap.processSnapshots(mixed,10) and mixed.snap==void and mixed.executedSequences==[],"inactive wins over rate-delay flag")
 far=snap.create(8);far.latestSnapshotNum=1002;snap.readNextSnapshot(far);count=count+req(len(far.errors)==1,"range warning")
 backward=snap.create(8);backward.latestSnapshotNum=2;backward.snapshots=[snap.wrap(1,source(50,0,0,[]),0,0),snap.wrap(2,source(40,0,0,[]),0,0)];count=count+req(try(snap.processSnapshots(backward,50)) is error,"backwards time rejection")
 follow=snap.create(8);follow.demoPlayback=true;follow.latestSnapshotNum=2;follow.snapshots=[snap.wrap(1,source(10,0,0,[]),0,0),snap.wrap(2,source(20,0,0,[]),0,0)];snap.processSnapshots(follow,20);count=count+req(len(follow.playerStateTransitions)==1,"nonpredict playerstate transition")
 early=snap.create(8);early.latestSnapshotNum=1;early.snapshots=[snap.wrap(1,source(100,0,0,[]),0,0)];snap.processSnapshots(early,50);count=count+req(early.time==100,"vid_restart time clamp")
 count=count+req(try(snap.ensureEntity(state,99)) is error,"entity bounds");print("PASS: "+str(count)+" native cg_snapshot contracts");return 0
end function
