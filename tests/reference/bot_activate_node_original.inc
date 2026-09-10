void AIEnter_Seek_ActivateEntity(bot_state_t *bs, char *s) {
	BotRecordNodeSwitch(bs, "activate entity", "", s);
	bs->ainode = AINode_Seek_ActivateEntity;
}

/*
==================
AINode_Seek_Activate_Entity
==================
*/
int AINode_Seek_ActivateEntity(bot_state_t *bs) {
	bot_goal_t *goal;
	vec3_t target, dir, ideal_viewangles;
	bot_moveresult_t moveresult;
	int targetvisible;
	bsp_trace_t bsptrace;
	aas_entityinfo_t entinfo;

	if (BotIsObserver(bs)) {
		BotClearActivateGoalStack(bs);
		AIEnter_Observer(bs, "active entity: observer");
		return qfalse;
	}
	//if in the intermission
	if (BotIntermission(bs)) {
		BotClearActivateGoalStack(bs);
		AIEnter_Intermission(bs, "activate entity: intermission");
		return qfalse;
	}
	//respawn if dead
	if (BotIsDead(bs)) {
		BotClearActivateGoalStack(bs);
		AIEnter_Respawn(bs, "activate entity: bot dead");
		return qfalse;
	}
	//
	bs->tfl = TFL_DEFAULT;
	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
	// if in lava or slime the bot should be able to get out
	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
	// map specific code
	BotMapScripts(bs);
	// no enemy
	bs->enemy = -1;
	// if the bot has no activate goal
	if (!bs->activatestack) {
		BotClearActivateGoalStack(bs);
		AIEnter_Seek_NBG(bs, "activate entity: no goal");
		return qfalse;
	}
	//
	goal = &bs->activatestack->goal;
	// initialize target being visible to false
	targetvisible = qfalse;
	// if the bot has to shoot at a target to activate something
	if (bs->activatestack->shoot) {
		//
		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->activatestack->target, bs->entitynum, MASK_SHOT);
		// if the shootable entity is visible from the current position
		if (bsptrace.fraction >= 1.0 || bsptrace.ent == goal->entitynum) {
			targetvisible = qtrue;
			// if holding the right weapon
			if (bs->cur_ps.weapon == bs->activatestack->weapon) {
				VectorSubtract(bs->activatestack->target, bs->eye, dir);
				vectoangles(dir, ideal_viewangles);
				// if the bot is pretty close with it's aim
				if (InFieldOfVision(bs->viewangles, 20, ideal_viewangles)) {
					trap_EA_Attack(bs->client);
				}
			}
		}
	}
	// if the shoot target is visible
	if (targetvisible) {
		// get the entity info of the entity the bot is shooting at
		BotEntityInfo(goal->entitynum, &entinfo);
		// if the entity the bot shoots at moved
		if (!VectorCompare(bs->activatestack->origin, entinfo.origin)) {
#ifdef DEBUG
			BotAI_Print(PRT_MESSAGE, "hit shootable button or trigger\n");
#endif //DEBUG
			bs->activatestack->time = 0;
		}
		// if the activate goal has been activated or the bot takes too long
		if (bs->activatestack->time < FloatTime()) {
			BotPopFromActivateGoalStack(bs);
			// if there are more activate goals on the stack
			if (bs->activatestack) {
				bs->activatestack->time = FloatTime() + 10;
				return qfalse;
			}
			AIEnter_Seek_NBG(bs, "activate entity: time out");
			return qfalse;
		}
		memset(&moveresult, 0, sizeof(bot_moveresult_t));
	}
	else {
		// if the bot has no goal
		if (!goal) {
			bs->activatestack->time = 0;
		}
		// if the bot does not have a shoot goal
		else if (!bs->activatestack->shoot) {
			//if the bot touches the current goal
			if (trap_BotTouchingGoal(bs->origin, goal)) {
#ifdef DEBUG
				BotAI_Print(PRT_MESSAGE, "touched button or trigger\n");
#endif //DEBUG
				bs->activatestack->time = 0;
			}
		}
		// if the activate goal has been activated or the bot takes too long
		if (bs->activatestack->time < FloatTime()) {
			BotPopFromActivateGoalStack(bs);
			// if there are more activate goals on the stack
			if (bs->activatestack) {
				bs->activatestack->time = FloatTime() + 10;
				return qfalse;
			}
			AIEnter_Seek_NBG(bs, "activate entity: activated");
			return qfalse;
		}
		//predict obstacles
		if (BotAIPredictObstacles(bs, goal))
			return qfalse;
		//initialize the movement state
		BotSetupForMovement(bs);
		//move towards the goal
		trap_BotMoveToGoal(&moveresult, bs->ms, goal, bs->tfl);
		//if the movement failed
		if (moveresult.failure) {
			//reset the avoid reach, otherwise bot is stuck in current area
			trap_BotResetAvoidReach(bs->ms);
			//
			bs->activatestack->time = 0;
		}
		//check if the bot is blocked
		BotAIBlocked(bs, &moveresult, qtrue);
	}
	//
	BotClearPath(bs, &moveresult);
	// if the bot has to shoot to activate
	if (bs->activatestack->shoot) {
		// if the view angles aren't yet used for the movement
		if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEW)) {
			VectorSubtract(bs->activatestack->target, bs->eye, dir);
			vectoangles(dir, moveresult.ideal_viewangles);
			moveresult.flags |= MOVERESULT_MOVEMENTVIEW;
		}
		// if there's no weapon yet used for the movement
		if (!(moveresult.flags & MOVERESULT_MOVEMENTWEAPON)) {
			moveresult.flags |= MOVERESULT_MOVEMENTWEAPON;
			//
			bs->activatestack->weapon = BotSelectActivateWeapon(bs);
			if (bs->activatestack->weapon == -1) {
				//FIXME: find a decent weapon first
				bs->activatestack->weapon = 0;
			}
			moveresult.weapon = bs->activatestack->weapon;
		}
	}
	// if the ideal view angles are set for movement
	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
	}
	// if waiting for something
	else if (moveresult.flags & MOVERESULT_WAITING) {
		if (random() < bs->thinktime * 0.8) {
			BotRoamGoal(bs, target);
			VectorSubtract(target, bs->origin, dir);
			vectoangles(dir, bs->ideal_viewangles);
			bs->ideal_viewangles[2] *= 0.5;
		}
	}
	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
		if (trap_BotMovementViewTarget(bs->ms, goal, bs->tfl, 300, target)) {
			VectorSubtract(target, bs->origin, dir);
			vectoangles(dir, bs->ideal_viewangles);
		}
		else {
			vectoangles(moveresult.movedir, bs->ideal_viewangles);
		}
		bs->ideal_viewangles[2] *= 0.5;
	}
	// if the weapon is used for the bot movement
	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON)
		bs->weaponnum = moveresult.weapon;
	// if there is an enemy
	if (BotFindEnemy(bs, -1)) {
		if (BotWantsToRetreat(bs)) {
			//keep the current long term goal and retreat
			AIEnter_Battle_NBG(bs, "activate entity: found enemy");
		}
		else {
			trap_BotResetLastAvoidReach(bs->ms);
			//empty the goal stack
			trap_BotEmptyGoalStack(bs->gs);
			//go fight
			AIEnter_Battle_Fight(bs, "activate entity: found enemy");
		}
		BotClearActivateGoalStack(bs);
	}
	return qtrue;
}

/*
==================
AIEnter_Seek_NBG
==================
*/
