import mq3.format.player_animation as controller

function require(ok,message) if not ok then return error(7541,message) end if;return 1 end function

function config()
  text=""
  for index=0 to 30
    count=3;loops=0
    if index==controller.LEGS_IDLE or index==controller.LEGS_WALK or index==controller.LEGS_RUN or index==controller.TORSO_STAND then loops=3 end if
    if index==controller.BOTH_DEAD1 or index==controller.BOTH_DEAD1+2 or index==controller.BOTH_DEAD1+4 then count=1 end if
    text=text+str(index*10)+" "+str(count)+" "+str(loops)+" 10\n"
  end for
  return controller.parse(text)
end function

function main(args)
  count=0;cfg=config();state=controller.enemyCreate(100)
  count=count+require(state.mode=="idle" and state.resumeMode=="idle" and state.startedAt==100,"idle initial state")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==controller.LEGS_IDLE and selected.upperAnimation==controller.TORSO_STAND,"idle indices")
  pose=controller.enemySample(cfg,state,150);count=count+require(pose.lower.oldFrame==150 and pose.lower.frame==150 and pose.lower.backlerp==0.5 and pose.upper.oldFrame==110,"idle initial-lerp samples")

  count=count+require(controller.enemyLocomote(state,"walk",200) and state.resumeMode=="walk","enter walk")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==controller.LEGS_WALK and selected.upperAnimation==controller.TORSO_STAND,"walk indices")
  count=count+require(controller.enemyLocomote(state,"run",300),"enter run")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==controller.LEGS_RUN and selected.upperAnimation==controller.TORSO_STAND,"run indices")

  count=count+require(controller.enemyAttack(state,400) and state.resumeMode=="run","attack remembers run")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==controller.LEGS_RUN and selected.upperAnimation==controller.TORSO_ATTACK,"attack indices")
  pose=controller.enemySample(cfg,state,500);count=count+require(not pose.transitioned and pose.upper.oldFrame==110 and pose.upper.frame==70,"attack switch preserves prior torso frame")
  pose=controller.enemySample(cfg,state,600);count=count+require(pose.mode=="attack" and pose.nextMode=="run" and pose.transitioned,"attack completes to run")
  pose=controller.enemySample(cfg,state,650);count=count+require(pose.mode=="run" and pose.elapsed==50,"returned run has fresh clock")

  count=count+require(controller.enemyPain(state,700) and state.resumeMode=="run","pain remembers run")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==controller.LEGS_RUN and selected.upperAnimation==controller.TORSO_GESTURE,"pain indices")
  pose=controller.enemySample(cfg,state,900);held=not pose.transitioned and pose.upper.frame==60;pose=controller.enemySample(cfg,state,1000);count=count+require(held and pose.transitioned and state.mode=="run","pain preserves switch frame then completes")

  count=count+require(not (controller.enemyDie(state,1000,2) is error),"enter death variant")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==4 and selected.upperAnimation==4,"death3 indices")
  pose=controller.enemySample(cfg,state,1200);heldDeath=not pose.transitioned;pose=controller.enemySample(cfg,state,1300);count=count+require(heldDeath and pose.mode=="death" and pose.nextMode=="dead" and pose.transitioned,"death advances statefully to dead")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==5 and selected.upperAnimation==5,"dead3 indices")
  count=count+require(not controller.enemyLocomote(state,"walk",1300) and not controller.enemyAttack(state,1300),"dead ignores movement and attack")

  count=count+require(controller.enemyRespawn(state,1400),"begin respawn")
  selected=controller.enemySelect(state);count=count+require(selected.lowerAnimation==controller.LEGS_IDLE and selected.upperAnimation==controller.TORSO_RAISE,"respawn indices")
  pose=controller.enemySample(cfg,state,1600);heldRespawn=not pose.transitioned;pose=controller.enemySample(cfg,state,1700);count=count+require(heldRespawn and pose.mode=="respawn" and pose.nextMode=="idle" and pose.transitioned,"respawn advances statefully to idle")
  count=count+require(state.transitionCount==10,"transition count")

  count=count+require(try(controller.enemyCreate(-1)) is error,"negative create time rejected")
  count=count+require(try(controller.enemyLocomote(state,"swim",1700)) is error,"invalid locomotion rejected")
  count=count+require(try(controller.enemyDie(state,1700,3)) is error,"invalid death variant rejected")
  count=count+require(try(controller.enemySample(cfg,state,1500)) is error,"backward sample time rejected")
  count=count+require(not controller.enemyRespawn(state,1700),"live respawn ignored")
  print("PASS: "+str(count)+" playable enemy-animation contracts");return 0
end function
