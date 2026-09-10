import mq3.format.player_animation as anim
import mq3.format.md3 as md3
import mq3.renderer.surface_md3 as mesh

function require(ok,text) if not ok then return error(7530,text) end if;return 1 end function
function rows()
  text="footsteps boot\nheadoffset 1 2 3\nsex f\nfixedlegs\nfixedtorso\nunknown ignored\n"
  for i=0 to 24
    first=i*10;if i>=anim.LEGS_WALKCR then first=200+(i-anim.LEGS_WALKCR)*10 end if
    count=4;loops=0;fps=10
    if i==anim.TORSO_GESTURE then first=100 end if
    if i==anim.LEGS_WALKCR then count=6;loops=3;fps=20 end if
    if i==anim.LEGS_WALK then count=-4;loops=2;fps=0 end if
    text=text+str(first)+" "+str(count)+" "+str(loops)+" "+str(fps)+" // row\n"
  end for
  return text
end function
function main(args)
  c=0;cfg=anim.parse(rows())
  c=c+require(cfg.footsteps=="boot","footsteps")
  c=c+require(cfg.headOffset==[1.0,2.0,3.0],"head offset")
  c=c+require(cfg.gender=="female" and cfg.fixedLegs and cfg.fixedTorso,"player flags")
  c=c+require(len(cfg.animations)==anim.MAX_TOTALANIMATIONS,"total animation table")
  c=c+require(cfg.animations[anim.LEGS_WALKCR].firstFrame==100,"lower frame correction")
  c=c+require(cfg.animations[anim.LEGS_WALK].firstFrame==110,"following lower correction")
  c=c+require(cfg.animations[anim.LEGS_WALKCR].frameLerp==50,"fps conversion")
  c=c+require(cfg.animations[anim.LEGS_WALK].frameLerp==1000,"zero fps fallback")
  c=c+require(cfg.animations[anim.LEGS_WALK].numFrames==4 and cfg.animations[anim.LEGS_WALK].reversed,"negative frame reversal")
  c=c+require(cfg.animations[anim.TORSO_GETFLAG].firstFrame==100,"missing extension fallback")
  c=c+require(cfg.animations[anim.LEGS_BACKCR].reversed and cfg.animations[anim.LEGS_BACKCR].loopFrames==3,"back crouch derivative")
  c=c+require(cfg.animations[anim.FLAG_RUN].firstFrame==0 and cfg.animations[anim.FLAG_RUN].frameLerp==66,"flag run")
  c=c+require(cfg.animations[anim.FLAG_STAND].frameLerp==50 and cfg.animations[anim.FLAG_STAND].loopFrames==0,"flag stand")
  a=cfg.animations[anim.LEGS_WALKCR]
  s=anim.sample(a,0);c=c+require(s.oldFrame==100 and s.frame==101 and s.backlerp==0.0,"initial frame")
  s=anim.sample(a,25);c=c+require(s.oldFrame==100 and s.frame==101 and s.backlerp==0.5,"half frame")
  s=anim.sample(a,50);c=c+require(s.oldFrame==101 and s.frame==102 and s.backlerp==1.0,"frame boundary")
  s=anim.sample(a,300);c=c+require(s.oldFrame==103 and s.frame==104,"loop tail entry")
  s=anim.sample(a,450);c=c+require(s.oldFrame==103 and s.frame==104,"loop tail wrap")
  stopped=anim.Animation(7,3,0,100,100,false,false)
  s=anim.sample(stopped,999);c=c+require(s.oldFrame==9 and s.frame==9 and s.finished and s.backlerp==0.0,"nonloop clamp")
  reverse=anim.Animation(20,3,0,100,100,true,false)
  s=anim.sample(reverse,50);c=c+require(s.oldFrame==22 and s.frame==21 and s.backlerp==0.5,"reverse sample")
  flip=anim.Animation(30,3,0,100,100,false,true)
  s=anim.sample(flip,350);c=c+require(s.oldFrame==32 and s.frame==31,"flipflop sample")
  pair=anim.samplePlayer(cfg,anim.LEGS_WALKCR,anim.TORSO_GESTURE,25)
  c=c+require(pair.lower.oldFrame==100 and pair.upper.oldFrame==100,"lower upper pair")
  surface=mesh.surface(2,3,1,[0,1,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],[[mesh.vertex(0,0,0,0),mesh.vertex(64,0,0,0),mesh.vertex(0,64,0,0)],[mesh.vertex(64,0,0,0),mesh.vertex(128,0,0,0),mesh.vertex(64,64,0,0)]])
  fakeSurface=md3.Surface("body",["body"],surface);model=md3.Model("unit",0,2,0,1,0,[],[],[fakeSurface],[])
  rendered=anim.render(model,0,anim.FrameSample(0,1,0.5,false),1)
  c=c+require(rendered[0].positions[0]==[0.5,0.0,0.0],"MD3 vertex interpolation")
  c=c+require(try(anim.parse("0 1 0")) is error,"incomplete row rejected")
  c=c+require(try(anim.sample(anim.Animation(0,0,0,10,10,false,false),0)) is error,"empty animation rejected")
  c=c+require(try(anim.sample(anim.Animation(0,2,3,10,10,false,false),0)) is error,"invalid loop rejected")
  c=c+require(try(anim.sampleAnimation(cfg,99,0)) is error,"animation range rejected")
  print("PASS: "+str(c)+" player-animation contracts");return 0
end function
