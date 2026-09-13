import mq3.client.playable_sky as sky
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.playable_materials as materials

function near(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.0001 end function

function main(args)
  if len(args)!=1 then print("usage: playable_sky_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  maps=["maps/q3dm1.bsp","maps/q3ctf1.bsp","maps/q3dm4.bsp"]
  shaderNames=["textures/skies/tim_hell","textures/skies/toxicskytim_blue","textures/skies/xtoxicsky_dm9"]
  firstNames=["textures/skies/killsky_1.jpg","textures/skies/bluedimclouds.jpg","textures/skies/inteldimclouds.jpg"]
  secondNames=["textures/skies/killsky_2.jpg","textures/skies/topclouds.jpg","textures/skies/intelredclouds.jpg"]
  firstScaleU=[2.0,3.0,3.0];firstScaleV=[2.0,2.0,2.0];firstScroll=[0.1,0.15,0.3];layers=0
  for index=0 to len(maps)-1
    map=bsp.load(pk3.read(archive,maps[index]));if map is error then return map end if
    catalog=sky.loadMap(archive,map,scripts[0],150,2);if catalog is error then return catalog end if
    if catalog==void or catalog.shaderName!=shaderNames[index] or len(catalog.layers)!=2 or catalog.textureCount!=2 then return error(7612,"retail map sky layers incomplete") end if
    if catalog.layers[0].imageName!=firstNames[index] or catalog.layers[1].imageName!=secondNames[index] then return error(7613,"retail map sky image mismatch") end if
    if not near(catalog.layers[0].scaleU,firstScaleU[index]) or not near(catalog.layers[0].scaleV,firstScaleV[index]) or not near(catalog.layers[0].scrollU,firstScroll[index]) or not catalog.layers[1].additive then return error(7614,"retail map sky shader transform mismatch") end if
    layers=layers+len(catalog.layers)
  end for
  print("PASS: retail map skies="+str(len(maps))+" layers="+str(layers));return 0
end function
