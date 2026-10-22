import mq3.renderer.noise as rendererNoise
import mq3.renderer.playable_fog as fogRuntime
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.tr_shade_calc_runtime as calc

function req(ok,label) if not ok then return error(7752,"tr_shade_calc contract: "+label) end if;return 1 end function
function near(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.01 end function
function wave(func,base,amplitude,phase,frequency) return shaderParser.Wave(func,base,amplitude,phase,frequency) end function
function deform(kind,w,vector,width,height,speed) return shaderParser.Deform(kind,0.01,w,vector,width,height,speed) end function

function main(args)
  count=0;sin=wave(1,0.5,0.5,0.0,1.0);constant=wave(1,2.0,0.0,0.0,0.0)
  count=count+req(calc.TableForFunc(1)==1 and calc.TableForFunc(5)==5 and try(calc.TableForFunc(0)) is error,"wave table dispatch")
  count=count+req(near(calc.EvalWaveForm(sin,0),0.5) and calc.EvalWaveFormClamped(constant,0)==1.0,"wave evaluation and clamp")
  count=count+req(calc.myftol(3.9)==3 and calc.myftol(-3.9)==-3,"float integer conversion")
  coords=[[0.25,0.5],[-0.25,1.5]]
  transformed=calc.RB_CalcTransformTexCoords([[2.0,3.0],[4.0,5.0]],[6.0,7.0],coords);count=count+req(transformed==[[8.5,10.25],[11.5,13.75]],"general texture matrix")
  scaled=calc.RB_CalcScaleTexCoords([2.0,3.0],coords);count=count+req(scaled==[[0.5,1.5],[-0.5,4.5]],"scale texture coordinates")
  scrolled=calc.RB_CalcScrollTexCoords([0.75,-0.5],coords,3.0);count=count+req(scrolled==[[0.5,1.0],[0.0,2.0]],"wrapped texture scroll")
  stretched=calc.RB_CalcStretchTexCoords(constant,coords,0);count=count+req(stretched==[[0.375,0.5],[0.125,1.0]],"centered stretch")
  rotated=calc.RB_CalcRotateTexCoords(90.0,[[0.0,0.0],[1.0,1.0]],1.0);count=count+req(near(rotated[0][0],0.0) and near(rotated[0][1],1.0) and near(rotated[1][0],1.0) and near(rotated[1][1],0.0),"lookup-table rotation")
  positions=[[0.0,0.0,0.0],[64.0,128.0,0.0]];normals=[[0.0,1.0,0.0],[0.0,0.0,1.0]]
  turbulent=calc.RB_CalcTurbulentTexCoords(wave(1,0.0,0.25,0.0,0.0),coords,positions,0);count=count+req(turbulent[0]==coords[0] and turbulent[1]!=coords[1],"position-dependent turbulence")
  environment=calc.RB_CalcEnvironmentTexCoords([[0.0,0.0,0.0]],[[0.0,0.0,1.0]],[0.0,0.0,8.0]);count=count+req(environment==[[0.5,0.0]],"environment reflection coordinates")
  fog=fogRuntime.Fog("fog",[0.2,0.3,0.4],64.0,1.0/512.0,[[-10.0,-10.0,-10.0],[10.0,10.0,10.0]],[0.0,0.0,1.0,0.0],true);fogCoords=calc.RB_CalcFogTexCoords(fog,[[0.0,0.0,2.0]],[0.0,0.0,1.0],[1.0,0.0,0.0]);count=count+req(len(fogCoords)==1 and fogCoords[0][1]==31.0/32.0,"surface fog coordinates")
  waveDeform=deform("wave",constant,[0.0,0.0,0.0],0.0,0.0,0.0);wavePoints=calc.RB_CalcDeformVertexes(waveDeform,positions,normals,0);count=count+req(wavePoints==[[0.0,2.0,0.0],[64.0,128.0,2.0]],"wave vertex deformation")
  move=deform("move",constant,[1.0,2.0,3.0],0.0,0.0,0.0);moved=calc.RB_CalcMoveVertexes(move,positions,0);count=count+req(moved==[[2.0,4.0,6.0],[66.0,132.0,6.0]],"whole-surface move deformation")
  bulge=deform("bulge",wave(0,0.0,0.0,0.0,0.0),[0.0,0.0,0.0],6.283185307179586,3.0,0.0);bulged=calc.RB_CalcBulgeVertexes(bulge,[[0.0,0.0,0.0]],[[0.0,0.0,1.0]],[[0.25,0.0]],0);count=count+req(near(bulged[0][2],3.0),"bulge deformation")
  noise=rendererNoise.create();normalDeform=deform("normal",wave(1,0.0,0.5,0.0,0.1),[0.0,0.0,0.0],0.0,0.0,0.0);wiggled=calc.RB_CalcDeformNormals(normalDeform,[[1.0,2.0,3.0]],[[0.0,0.0,1.0]],1000,noise);length=wiggled[0][0]*wiggled[0][0]+wiggled[0][1]*wiggled[0][1]+wiggled[0][2]*wiggled[0][2];count=count+req(near(length,1.0),"noise normal deformation is normalized")
  composite=calc.RB_DeformTessGeometry([waveDeform,move],positions,normals,coords,0,noise);count=count+req(composite[0]==[[2.0,6.0,6.0],[66.0,132.0,8.0]],"ordered tessellation deformation")
  count=count+req(calc.GlobalVectorToLocal([1.0,2.0,3.0],[[0.0,1.0,0.0],[0.0,0.0,1.0],[1.0,0.0,0.0]])==[2.0,3.0,1.0],"global-to-local axis projection")
  text=calc.DeformText("A B",[[0.0,0.0,-1.0],[2.0,0.0,-1.0],[2.0,0.0,1.0],[0.0,0.0,1.0]],[0.0,1.0,0.0]);count=count+req(len(text.positions)==8 and len(text.indexes)==12 and text.texCoords[0][0]==0.0625 and text.texCoords[0][1]==0.25,"text atlas geometry and space skipping")
  entity=[17,63,129,201];count=count+req(calc.RB_CalcColorFromEntity(entity,2)==[entity,entity] and calc.RB_CalcColorFromOneMinusEntity(entity,1)==[[238,192,126,54]],"entity colors")
  seeds=[[1,2,3,4],[5,6,7,8]];count=count+req(calc.RB_CalcAlphaFromEntity(seeds,entity)==[[1,2,3,201],[5,6,7,201]] and calc.RB_CalcAlphaFromOneMinusEntity(seeds,entity)==[[1,2,3,54],[5,6,7,54]],"entity alpha")
  waveColors=calc.RB_CalcWaveColor(sin,2,0,1.0,noise);count=count+req(waveColors==[[127,127,127,255],[127,127,127,255]],"wave color")
  waveAlpha=calc.RB_CalcWaveAlpha(sin,seeds,0);count=count+req(waveAlpha==[[1,2,3,127],[5,6,7,127]],"wave alpha")
  densities=[0.25,1.0];count=count+req(calc.RB_CalcModulateColorsByFog(seeds,densities)==[[0,1,2,4],[0,0,0,8]],"fog RGB modulation")
  count=count+req(calc.RB_CalcModulateAlphasByFog(seeds,densities)==[[1,2,3,3],[5,6,7,0]],"fog alpha modulation")
  count=count+req(calc.RB_CalcModulateRGBAsByFog(seeds,densities)==[[0,1,2,3],[0,0,0,0]],"fog RGBA modulation")
  specular=calc.RB_CalcSpecularAlpha([[1,2,3,4]],[[0.0,0.0,0.0]],[[0.0,0.0,1.0]],[0.0,0.0,10.0]);count=count+req(specular[0][0]==1 and specular[0][3]>=0 and specular[0][3]<=255,"specular alpha")
  lighting=lightGrid.Sample([20.0,30.0,40.0],[100.0,80.0,60.0],[0.0,0.0,1.0],1.0);diffuse=calc.RB_CalcDiffuseColor(lighting,[[0.0,0.0,1.0],[0.0,0.0,-1.0]]);count=count+req(diffuse==[[120,110,100,255],[20,30,40,255]],"diffuse entity lighting")
  print("PASS: "+str(count)+" complete tr_shade_calc contracts");return 0
end function
