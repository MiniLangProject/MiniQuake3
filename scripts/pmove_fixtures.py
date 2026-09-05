"""Asset-free BSP geometry and directed command sequences for movement boundaries."""
import struct

def bsp():
    lumps=[b'' for _ in range(17)]
    boxes=[]
    # Five floor materials, a shallow pool with a water-jump ledge, stairs,
    # a low ceiling and deep slime/lava.
    for x,flags in [(-1024,0),(0,2),(1024,4096),(2048,8192),(3072,1)]:
        boxes.append(([x,-2048,-256],[x+1024,2048,0],flags,1))
    boxes += [([-512,-512,0],[0,0,48],0,32),([0,-512,0],[256,0,48],0,1),
              ([128,128,0],[192,512,8],0,1),([192,128,0],[256,512,16],0,1),
              ([256,128,0],[320,512,32],0,1),([-256,128,48],[-128,512,160],0,1),
              ([512,-1024,0],[768,-768,256],0,16),([800,-1024,0],[1024,-768,256],0,8)]
    planes=[];sides=[];brushes=[];shaders=[]
    for index,(mins,maxs,flags,contents) in enumerate(boxes):
        shaders.append(struct.pack('<64sii',('fixture'+str(index)).encode(),flags,contents))
        first=len(sides)
        # Original loader expects the first six axial planes in -X,+X,-Y,+Y,-Z,+Z order.
        for axis in range(3):
            for sign in (-1,1):
                normal=[0,0,0];normal[axis]=sign
                distance=maxs[axis] if sign==1 else -mins[axis]
                sides.append(struct.pack('<2i',len(planes),index));planes.append(struct.pack('<4f',*normal,distance))
        brushes.append(struct.pack('<3i',first,6,index))
    origins=[[-20,-256,32],[-200,-256,32],[-200,-256,64],[600,-900,100],[900,-900,100],
             [96,256,24.125],[-300,256,24.125],[-200,256,24.125],[-200,256,24.125],
             [-800,600,24.125],[500,600,24.125],[1500,600,24.125],[2500,600,24.125],[3500,600,24.125]]
    lumps[0]=b'{\n"classname" "worldspawn"\n}\n'+b''.join(('{\n"classname" "info_player_deathmatch"\n"origin" "%s"\n}\n'%(' '.join(map(str,o)))).encode() for o in origins)+b'\0'
    lumps[1]=b''.join(shaders);lumps[2]=b''.join(planes)
    lumps[3]=struct.pack('<9i',1,-1,-2,-1024,-2048,-256,4096,2048,256)
    lumps[4]=b''.join(struct.pack('<12i',i,0,-1024,-2048,-256,4096,2048,256,0,0,0,len(boxes)) for i in range(2))
    lumps[6]=struct.pack('<'+'i'*len(boxes),*range(len(boxes)))
    lumps[7]=struct.pack('<6f4i',-1024,-2048,-256,4096,2048,256,0,0,0,len(boxes))
    lumps[8]=b''.join(brushes);lumps[9]=b''.join(sides)
    header=bytearray(struct.pack('<2i',0x50534249,46)+bytes(17*8));position=144
    for i,data in enumerate(lumps):
        struct.pack_into('<2i',header,8+i*8,position,len(data));position+=len(data)
    return header+b''.join(lumps)

def commands(state_bytes):
    cases=[]
    scenarios=[('water_jump',[-20,-256,32],[0,0,0],0,0,127,0,0),
               ('swim',[-200,-256,32],[0,0,0],0,0,0,0,127),
               ('enter_water',[-200,-256,100],[0,0,-300],0,0,0,0,0),
               ('slime',[600,-900,100],[50,100,20],0,0,127,0,20),
               ('lava',[900,-900,100],[50,100,20],0,0,127,0,20),
               ('invulnerability_swim',[600,-900,128],[0,0,0],16384,0,0,0,0),
               ('stairs',[96,256,24.125],[200,0,0],0,0,127,0,0),
               ('duck_under',[-300,256,24.125],[200,0,0],0,0,127,0,-127),
               ('cannot_stand',[-200,256,24.125],[0,0,0],1,0,127,0,0),
               ('allsolid',[-200,256,80],[0,0,0],0,0,127,0,0),
               ('normal',[-800,600,24.125],[300,0,0],0,0,127,0,0),
               ('slick',[500,600,24.125],[300,0,0],0,0,127,0,0),
               ('metal',[1500,600,24.125],[300,0,0],0,0,127,0,0),
               ('nosteps',[2500,600,24.125],[300,0,0],0,0,127,0,0),
               ('nodamage',[3500,600,400],[0,0,-800],0,0,0,0,0),
               ('fall_hard',[-800,600,400],[0,0,-800],0,0,0,0,0),
               ('jump',[-800,600,24.125],[0,0,0],0,0,127,0,127),
               ('backjump',[-800,600,24.125],[0,0,0],0,0,-127,0,127)]
    labels=[]
    for name,origin,velocity,flags,buttons,f,r,u in scenarios:
        for fixed in (0,1):
            clock=1000
            for frame in range(64):
                stats=[100,0,2046,50,0,0,100]+[0]*9
                values=dict(commandTime=1000,pm_type=0,pm_flags=flags,origin=origin,velocity=velocity,
                            gravity=800,speed=320,viewheight=26,groundEntityNum=1023,stats=stats,
                            ammo=[-1]+[100]*15,weapon=2,weaponstate=0)
                if name=='invulnerability_swim':values['powerups']=[0]*14+[10000,0]
                clock+=16
                up=u
                if name in ('jump','backjump','swim') and frame%16>=8:up=0
                cmd=struct.pack('<5iB3b',clock,0,0,0,buttons,2,f,r,up)
                cases.append(state_bytes(values)+cmd+struct.pack('<7i',int(frame!=0),fixed,8,1,0,0,0))
                labels.append(name)
    # Exercise every weapon's firing delay, haste and ammo exhaustion, without changing weapon.
    for weapon in range(1,11):
        for haste in (0,1):
            for ammo in (-1,0,1,5):
                for frame in range(32):
                    stats=[100,0,2046,0,0,0,100]+[0]*9;powerups=[0]*16;powerups[3]=haste
                    values=dict(commandTime=1000,origin=[-800,600,24.125],velocity=[0,0,0],gravity=800,speed=320,
                                viewheight=26,groundEntityNum=1022,stats=stats,ammo=[ammo]*16,weapon=weapon,powerups=powerups)
                    cmd=struct.pack('<5iB3b',1000+(frame+1)*66,0,0,0,1,weapon,0,0,0)
                    cases.append(state_bytes(values)+cmd+struct.pack('<7i',int(frame!=0),0,8,1,0,0,0))
                    labels.append('weapon_'+str(weapon))
    return b''.join(cases),labels
