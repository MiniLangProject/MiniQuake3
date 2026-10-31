import mq3.splines.headers as s

function near(left,right) delta=left-right;if delta<0.0 then delta=0.0-delta end if;return delta<0.001 end function
function rank(value) if value=="a" then return 1 end if;if value=="b" then return 2 end if;if value=="c" then return 3 end if;return 4 end function
function compare(context,left,right) return rank(left)-rank(right) end function
function req(value,label) if not value then return error(7978,"spline header contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(len(s.mathAnglesSymbols())==4 and len(s.mathMatrixSymbols())==5 and len(s.mathQuaternionSymbols())==5,"angle/matrix/quaternion surfaces")
  count=count+req(len(s.mathVectorSymbols())==18 and len(s.utilListSymbols())==14 and len(s.utilStrSymbols())==4,"vector/list/string surfaces")
  a=s.vec3(3,4,0);count=count+req(near(s.Length(a),5.0) and s.vectorEqual(s.Normalize(a),s.vec3(0.6,0.8,0)),"vector length and normalization")
  count=count+req(s.vectorEqual(s.Cross(s.vec3(1,0,0),s.vec3(0,1,0)),s.vec3(0,0,1)) and near(s.dot(a,s.vec3(2,0,0)),6.0),"dot and cross")
  count=count+req(s.vectorEqual(s.LerpVector(s.Zero(),s.vec3(10,20,30),0.25),s.vec3(2.5,5,7.5)),"lerp")
  count=count+req(s.toYaw(s.vec3(0,1,0))==90.0 and s.toPitch(s.vec3(0,0,1))==90.0,"vector angles")
  n=s.Normalize180(s.angles(370,-190,720));count=count+req(n.pitch==10.0 and n.yaw==170.0 and n.roll==0.0,"angle normalization")
  axes=s.toVectors(s.angles(0,90,0));count=count+req(near(axes[0].x,0.0) and near(axes[0].y,1.0) and near(axes[0].z,0.0),"angle vectors")
  q=s.quatNormalize(s.quat(0,0,0,2));count=count+req(q.w==1.0 and near(s.quatLength(q),1.0) and len(s.vec4(q))==4,"quaternion")
  identity=s.Identity();v=s.vec3(2,3,4);count=count+req(s.vectorEqual(s.matVec(identity,v),v),"identity matrix")
  skew=s.SkewSymmetric(s.vec3(1,2,3));count=count+req(skew.rows[0].y==-3.0 and skew.rows[2].y==1.0,"skew matrix")
  basis=s.mat3(s.vec3(2,0,0),s.vec3(0,3,0),s.vec3(0,0,4));ortho=s.OrthoNormalize(basis);count=count+req(near(s.Length(ortho.rows[0]),1.0) and near(s.Length(ortho.rows[2]),1.0),"orthonormalization")
  box=s.newBounds();count=count+req(s.IsCleared(box) and s.AddPoint(box,s.vec3(-1,-2,-3)) and s.AddPoint(box,s.vec3(3,2,1)),"bounds growth")
  count=count+req(s.ContainsPoint(box,s.Zero()) and not s.ContainsPoint(box,s.vec3(4,0,0)) and near(s.Center(box).x,1.0),"bounds containment")
  other=s.newBounds();s.AddPoint(other,s.vec3(2,1,0));s.AddPoint(other,s.vec3(5,4,3));count=count+req(s.IntersectsBounds(box,other) and s.Radius(box)>0.0,"bounds intersection")
  list=s.idList(2);count=count+req(s.Append(list,"b")==0 and s.Append(list,"a")==1 and s.Size(list)==2,"list append")
  count=count+req(s.AddUnique(list,"a")==1 and s.AddUnique(list,"c")==2 and s.Num(list)==3 and s.Size(list)==4,"list unique and growth")
  s.Sort(list,compare,void);count=count+req(list.values[0]=="a" and list.values[2]=="c" and s.Remove(list,"b"),"list sort/remove")
  count=count+req(s.Condense(list)==2 and s.Size(list)==2 and s.Find(list,"missing")==-1,"list condense/find")
  count=count+req(s.append("Quake"," III")=="Quake III" and s.tolower("Q3A")=="q3a" and s.toupper("q3a")=="Q3A","string helpers")
  print "PASS: "+str(count)+" spline header contracts";return 0
end function
