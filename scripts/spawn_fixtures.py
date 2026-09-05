"""Asset-free spawn fields, class dispatch, mode filters and trigger geometry."""
import random
import struct
import pmove_fixtures
from generate_spawn import tables

def pack(text):
    if isinstance(text,str):text=text.encode('ascii')
    return struct.pack('<i',len(text))+text
def entity(pairs):
    return '{\n'+''.join(f'"{key}" "{value}"\n' for key,value in pairs)+'}\n'
def bsp():
    data=pmove_fixtures.bsp();lumps=[]
    for i in range(17):
        off,size=struct.unpack_from('<2i',data,8+i*8);lumps.append(bytes(data[off:off+size]))
    lumps[7]+=struct.pack('<6f4i',-1024,-2048,-256,0,2048,0,0,0,0,1)
    header=bytearray(struct.pack('<2i',0x50534249,46)+bytes(17*8));offset=144
    for i,lump in enumerate(lumps):struct.pack_into('<2i',header,8+i*8,offset,len(lump));offset+=len(lump)
    return bytes(header)+b''.join(lumps)
def map_text(gravity='1100'):
    _,fields,classes,items=tables()
    text=entity([('classname','worldspawn'),('message',r'MiniQuake3\nspawn fixture'),('gravity',gravity),('music','music/sonic5'),('enableDust','1'),('enableBreath','1')])
    text+=entity([('classname','target_position'),('targetname','apex'),('origin','100 200 350')])
    for i,(name,_) in enumerate(classes):
        text+=entity([('classname',name),('origin',f'{i%3*150} 0 0'),('model','*1'),('target','apex'),('targetname',f'class_{i}'),('angle',str([0,-1,-2,90][i%4])),('nobots',str(i%2)),('nohumans',str(i%3==0).lower())])
    for item in items:text+=entity([('classname',item),('origin','1 2 3')])
    for key in ['notsingle','notteam','notfree','notq3a','notta']:
        for value in ['0','1','-1']:text+=entity([('classname','info_player_start'),(key,value),('targetname',key+value)])
    for types in ['ffa','team','ctf','tournament','single','oneflag obelisk harvester','FFA','notffa','']:
        text+=entity([('classname','info_camp'),('gametype',types),('origin','1.25 -0 3e2')])
    for pairs in [[('classname','INFO_PLAYER_START')],[],[('classname','missing_class')],
                  [('classname','path_corner')],[('classname','info_player_start'),('nobots','1'),('NOBOTS','0'),('nohumans','1')],
                  [('classname','trigger_push'),('model','*1'),('target','missing')],
                  [('classname','target_position'),('targetname','zero'),('origin','0 0 -128')],
                  [('classname','trigger_push'),('model','*1'),('target','zero')],
                  [('classname','target_position'),('targetname','below'),('origin','0 0 -1000')],
                  [('classname','trigger_push'),('model','*1'),('target','below')],
                  [('classname','trigger_teleport'),('model','*1'),('target','apex'),('spawnflags','1')]]:
        text+=entity(pairs)
    return text
def value_cases(count=4096):
    _,fields,_,_=tables();rng=random.Random(0x53504157)
    probes=['','-0','  +42tail','1.25 2.5 3.75','1e+ 2 3','0x1.8p+1 0x1p-149 -0','inf -inf nan','-nan 1 2','1 2x 3','junk','3.4028236e38','-2147483649','2147483648','1.#INF 2 3']
    vectors=['1.25 -0 7.5','0x1p0 0x1p-149 -0','3.4028234e38 1.17549435e-38 -1.40129846e-45','inf -inf nan']
    texts=['plain',r'alpha\nbeta',r'alpha\tbeta',r'alpha\\beta','line\nactual',r'\r\x\nend','']
    cases=[]
    for i in range(count):
        pairs=[]
        for key,target,kind in fields:
            if kind=='F_VECTOR':value=rng.choice(vectors)
            elif kind=='F_LSTRING':value=rng.choice(texts)
            elif kind=='F_INT':value=rng.choice(['0','-1','2147483647','-2147483648','2147483648','-2147483649',str(rng.randrange(-100000,100000))])
            else:value=rng.choice(['-0','1.25','-3e-8','nan','inf','junk','  12.75trailing'])
            pairs.append((key.upper() if i%3==0 else key,value))
        rng.shuffle(pairs);pairs+=[('PROBE',probes[i%len(probes)]),('probe','999'),('unrecognized','ignore')]
        if i%5==0:pairs+=[('speed','123.75')]
        cases.append(entity(pairs))
    return cases
