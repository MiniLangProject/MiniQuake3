import mq3.client.cgame_drawtools as draw
import mq3.compat.numeric as n
function require(value,message) if not value then return error(7780,message) end if;return 1 end function
function main(args)
  count=0;s=draw.create();s.screenXScale=2.0;s.screenYScale=1.5;s.screenXBias=7.0
  p=draw.adjustFrom640(s,10.0,20.0,30.0,40.0);count=count+require(p==[20.0,30.0,60.0,60.0],"640 scaling")
  draw.fillRect(s,1.0,2.0,3.0,4.0,[1.0,0.0,0.0,0.5],true);count=count+require(len(s.actions)==3 and s.actions[1].x==2.0 and s.actions[1].height==6.0,"fill calls");count=count+require(s.suppressed==3 and s.emitted==0 and not s.actions[1].dispatched,"retail suppression")
  draw.clear(s);draw.drawRect(s,10.0,20.0,30.0,40.0,2.0,[1.0,1.0,1.0,1.0],false);count=count+require(len(s.actions)==6 and s.actions[1].width==60.0 and s.actions[1].height==3.0,"rectangle top");count=count+require(s.actions[4].x==76.0 and s.actions[4].width==4.0,"rectangle right")
  draw.clear(s);pic=draw.drawPic(s,2.0,3.0,4.0,5.0,"pic",false);count=count+require(pic.x==4.0 and pic.y==4.5 and pic.width==8.0 and pic.height==7.5,"pic scale");count=count+require(pic.s2==1.0 and pic.t2==1.0 and pic.shader=="pic","pic uv")
  draw.clear(s);count=count+require(draw.drawChar(s,0,0,8,16,32,false)==void and len(s.actions)==0,"space skipped");glyph=draw.drawChar(s,4,5,8,16,65,false);count=count+require(glyph.s1==0.0625 and glyph.t1==0.25 and glyph.s2==0.125 and glyph.t2==0.3125,"charset cell")
  draw.clear(s);draw.drawStringExt(s,10,20,"A^1B^^C",[0.2,0.3,0.4,0.75],false,true,8,16,3,false);count=count+require(len(s.actions)==10,"colored shadow call count");count=count+require(s.actions[0].color==[0.0,0.0,0.0,0.75] and s.actions[1].x==24.0 and s.actions[1].y==33.0,"shadow pass");count=count+require(s.actions[6].color==[1.0,0.0,0.0,0.75],"color code");count=count+require(s.actions[8].x==52.0 and s.actions[8].s1==0.875,"double caret literal")
  count=count+require(draw.drawStrlen("A^1B^^C")==3 and draw.drawStrlen("^7hello")==5,"printable length")
  draw.clear(s);draw.drawBigString(s,0,0,"A",0.4,false);count=count+require(s.actions[0].color[3]==0.4 and s.actions[1].x==4.0 and s.actions[1].width==32.0,"big string")
  draw.clear(s);draw.drawSmallStringColor(s,0,0,"A",[0.1,0.2,0.3,1.0],false);count=count+require(len(s.actions)==3 and s.actions[1].width==16.0,"small color string")
  draw.clear(s);tile=draw.tileClearBox(s,64,32,128,64,"tile",false);count=count+require(tile.s1==1.0 and tile.t1==0.5 and tile.s2==3.0 and tile.t2==1.5,"tile uv")
  s.vidWidth=800;s.vidHeight=600;s.refX=100;s.refY=50;s.refWidth=600;s.refHeight=400;draw.clear(s);draw.tileClear(s,false);count=count+require(len(s.actions)==4 and s.actions[0].height==50.0 and s.actions[3].x==699.0,"tile borders")
  s.refX=0;s.refY=0;s.refWidth=800;s.refHeight=600;draw.clear(s);count=count+require(draw.tileClear(s,false)==void and len(s.actions)==0,"fullscreen no clear")
  s.time=1000;count=count+require(draw.fadeColor(s,0,200)==void and draw.fadeColor(s,700,300)==void,"fade terminal");count=count+require(draw.fadeColor(s,850,300)==[1.0,1.0,1.0,0.75] and draw.fadeColor(s,900,500)[3]==1.0,"fade alpha")
  count=count+require(draw.teamColor(draw.TEAM_RED)==[1.0,0.2,0.2,1.0] and draw.teamColor(draw.TEAM_BLUE)==[0.2,0.2,1.0,1.0],"team primary")
  count=count+require(draw.teamColor(draw.TEAM_SPECTATOR)==[0.7,0.7,0.7,1.0] and draw.teamColor(99)==[1.0,1.0,1.0,1.0],"team other")
  count=count+require(draw.getColorForHealth(0,100)==[0.0,0.0,0.0,1.0],"dead color");count=count+require(draw.getColorForHealth(100,0)==[1.0,1.0,1.0,1.0],"full health color")
  low=draw.getColorForHealth(20,0);mid=draw.getColorForHealth(50,0);count=count+require(low==[1.0,0.0,0.0,1.0] and mid[1]>0.66 and mid[2]==0.0,"health gradient")
  s.health=66;s.armor=0;count=count+require(draw.colorForHealth(s)[2]==0.0,"snapshot health")
  count=count+require(draw.bannerWidth("A B")==80 and draw.proportionalStringWidth("ABC")==60,"font widths");count=count+require(draw.proportionalStringWidth("")==-3 and draw.bannerWidth("")==-4,"empty original widths")
  count=count+require(draw.proportionalSizeScale(draw.UI_SMALLFONT)==0.75 and draw.proportionalSizeScale(0)==1.0,"font scale")
  s.screenXScale=1.0;s.screenYScale=1.0;draw.clear(s);draw.drawBannerString(s,100,20,"A B",draw.UI_CENTER|draw.UI_DROPSHADOW,[1.0,0.5,0.25,0.8],false);count=count+require(len(s.actions)==8 and s.actions[1].x==69.0 and s.actions[1].shader==s.charsetPropB,"banner shadow alignment");count=count+require(s.actions[5].x==67.0 and s.actions[5].color==void,"banner normal glyph")
  draw.clear(s);draw.drawProportionalString2(s,10,20,"A ?",[1.0,1.0,1.0,1.0],0.75,"font",false);count=count+require(len(s.actions)==4 and s.actions[1].width==13.5 and s.actions[2].x==41.0,"proportional glyphs")
  draw.clear(s);draw.drawProportionalString(s,100,20,"AB",draw.UI_RIGHT|draw.UI_INVERSE,[1.0,0.5,0.25,0.75],false);count=count+require(s.actions[0].color[0]>0.79 and s.actions[0].color[0]<0.81 and s.actions[0].color[3]==0.75 and s.actions[1].x==68.0,"inverse right")
  s.time=75;draw.clear(s);draw.drawProportionalString(s,100,20,"A",draw.UI_PULSE,[1.0,0.5,0.25,0.75],true);count=count+require(len(s.actions)==6 and s.actions[3].color[3]>0.92 and s.suppressed>0,"pulse and suppression")
  print("PASS: "+str(count)+" native cg_drawtools contracts");return 0
end function
