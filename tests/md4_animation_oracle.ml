import mq3.renderer.md4_animation as md4
function bone(tx) return md4.bone([[1.0,0.0,0.0,tx],[0.0,1.0,0.0,0.0],[0.0,0.0,1.0,0.0]]) end function
function main(args)
  value=md4.surface(4,[0,0,0],[md4.vertex([1.0,0.0,0.0],[0.25,0.75],[md4.weight(0,1.0,[2.0,3.0,4.0])])]);animated=md4.surfaceAnim(value,md4.frame([bone(10.0)]),md4.frame([bone(2.0)]),0.25,0,0,64,64)
  print(str(animated.positions[0][0])+","+str(animated.positions[0][1])+","+str(animated.positions[0][2])+"|"+str(animated.normals[0][0])+","+str(animated.normals[0][1])+","+str(animated.normals[0][2])+"|"+str(animated.texCoords[0][0])+","+str(animated.texCoords[0][1])+"|"+str(animated.indexes[0])+","+str(animated.indexes[1])+","+str(animated.indexes[2]));return 0
end function
