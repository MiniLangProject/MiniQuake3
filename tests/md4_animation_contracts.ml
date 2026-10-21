import mq3.renderer.md4_animation as md4
function req(ok,label) if not ok then return error(7761,"MD4 contract: "+label) end if;return 1 end function
function identity(tx) return md4.bone([[1.0,0.0,0.0,tx],[0.0,1.0,0.0,0.0],[0.0,0.0,1.0,0.0]]) end function
function main(args)
  count=0;surfaces=[md4.surface(4,[],[]),md4.surface(7,[],[])];draw=md4.addAnimSurfaces(surfaces);count=count+req(len(draw)==2 and draw[0].shaderIndex==4 and draw[1].shaderIndex==7 and draw[0].fogNum==0 and not draw[0].dlightMap,"surface submission")
  value=md4.surface(4,[0,1,0],[md4.vertex([1.0,0.0,0.0],[0.25,0.75],[md4.weight(0,1.0,[2.0,3.0,4.0])]),md4.vertex([0.0,1.0,0.0],[0.5,0.5],[md4.weight(0,0.25,[0.0,4.0,0.0]),md4.weight(1,0.75,[4.0,0.0,0.0])])])
  current=md4.frame([identity(10.0),identity(20.0)]);old=md4.frame([identity(2.0),identity(4.0)]);animated=md4.surfaceAnim(value,current,old,0.25,5,9,64,64)
  count=count+req(animated.positions[0]==[10.0,3.0,4.0] and animated.normals[0]==[1.0,0.0,0.0],"single bone lerp and skin")
  count=count+req(animated.positions[1]==[17.0,1.0,0.0] and animated.normals[1]==[0.0,1.0,0.0],"weighted bones")
  count=count+req(animated.texCoords==[[0.25,0.75],[0.5,0.5]] and animated.indexes==[5,6,5],"texcoords and rebased indexes")
  direct=md4.surfaceAnim(value,current,old,0.0,0,0,64,64);count=count+req(direct.positions[0][0]==12.0,"zero-backlerp fast path")
  count=count+req(try(md4.surfaceAnim(value,current,old,-0.1,0,0,64,64)) is error,"backlerp validation")
  count=count+req(try(md4.surfaceAnim(value,current,old,0.0,63,0,64,64)) is error,"overflow validation")
  print("PASS: "+str(count)+" MD4 animation contracts");return 0
end function
