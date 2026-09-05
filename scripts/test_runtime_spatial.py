"""Exercise the transformed-model and visibility commands from actual PK3 data."""
import argparse
import ast
import json
import re
import struct
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from test_collision import build_oracle
from test_spatial import to_world
from inventory import sha

def main():
    parser=argparse.ArgumentParser();parser.add_argument('data_root',type=Path);args=parser.parse_args()
    output=ROOT/'build/reference/runtime_spatial';output.mkdir(parents=True,exist_ok=True)
    tracefolder=output/'trace';tracefolder.mkdir(exist_ok=True);visfolder=output/'visibility';visfolder.mkdir(exist_ok=True)
    build_oracle(tracefolder,spatial=True);build_oracle(visfolder,visibility=True)
    archive=args.data_root/'baseq3/pak0.pk3';name='maps/q3dm6.bsp'
    with zipfile.ZipFile(archive) as z:data=z.read(name)
    bsp=output/'map.bsp';bsp.write_bytes(data);binary=ROOT/'build/MiniQuake3.exe'
    mo,size=struct.unpack_from('<ii',data,8+7*8);queries=[];requests=[]
    for i in range(8):
        model=i%(size//40);bounds=struct.unpack_from('<6f',data,mo+model*40)
        origin=[i*17,-i*23,32];angles=[[0,0,0],[0,90,0],[30,45,15],[90,0,90]][i%4]
        center=[(bounds[a]+bounds[a+3])*0.5 for a in range(3)]
        start=to_world([center[0],center[1],bounds[5]+96],angles,origin)
        finish=to_world([center[0],center[1],bounds[2]-128],angles,origin)
        # The CLI parses these decimal coordinates and stores binary32, as C does.
        start=list(struct.unpack('<3f',struct.pack('<3f',*start)));finish=list(struct.unpack('<3f',struct.pack('<3f',*finish)))
        requests.append([binary,'--trace-model',archive,name,str(model),*map(str,start+finish+origin+angles)])
        queries.append(struct.pack('<24f4i',*start,*finish,-15,-15,-24,15,15,32,*origin,*angles,-1,-1,-1,1,1,1,model,0x2010001,0,0))
    inputs=tracefolder/'inputs.bin';expected=tracefolder/'expected.bin';inputs.write_bytes(b''.join(queries))
    run([tracefolder/'collision_oracle.exe',bsp,inputs,expected,'0'],tracefolder)
    for i,request in enumerate(requests):
        response=run(request,ROOT/'build',log=tracefolder/f'cli{i}.log')
        fields={line.split(': ',1)[0]:line.split(': ',1)[1] for line in response.splitlines() if ': ' in line}
        normal,distance=fields['Normal'].split(' Distance: ');contents,flags=fields['Contents'].split(' Surface flags: ')
        startsolid,allsolid=fields['Start solid'].split(' All solid: ')
        actual=struct.pack('<5f4I3f',float(fields['Fraction']),*ast.literal_eval(normal),float(distance),int(flags),int(contents),int(startsolid=='true'),int(allsolid=='true'),*ast.literal_eval(fields['End']))
        if actual!=expected.read_bytes()[i*96:i*96+48]:raise RuntimeError(f'Transformed CLI mismatch {i}')
    points=[[0,0,0],[216,1328,24],[0,0,512],[400,400,64],[-100,800,-100]]
    for i,point in enumerate(points):
        wanted=list(map(int,run([visfolder/'collision_oracle.exe','--point',bsp,*map(str,point)],visfolder).split()))
        response=run([binary,'--inspect-visibility',archive,name,*map(str,point)],ROOT/'build',log=visfolder/f'cli{i}.log')
        if list(map(int,re.findall(r'-?\d+',response)))!=wanted:raise RuntimeError(f'Visibility CLI mismatch {i}')
    result={'passed':True,'transformed_traces':8,'visibility_points':5,'exact_fields':8*12+5*9,
            'binary_sha256':sha(binary),'map_sha256':sha(bsp),'trace_inputs_sha256':sha(inputs),'trace_expected_sha256':sha(expected)}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: transformed-model and visibility CLI / 141 exact fields')
if __name__=='__main__':main()
