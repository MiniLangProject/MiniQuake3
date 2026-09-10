# BotAI frame parity

`src/mq3/game/bot_ai_frame.ml` ports the Baseq3 `ai_main.c` frame boundary:

- `BotAI_GetClientState`, `BotAI_GetEntityState` and `BotAI_GetSnapshotEntity`
- `BotAIStartFrame` Cvar update and pause ordering
- botlib residual timing, think-time rescheduling and the 200 ms cap
- all 1024 botlib entity updates, including missile, event and `SVF_NOCLIENT` filters
- per-bot AI cadence, per-frame input updates and user-command delivery
- `BotAIRegularUpdate`'s 0.3 second item refresh throttle

The central lifecycle creates one frame service beside the bot registry, client
resources and population services. Engine and botlib calls are explicit callbacks,
so a host can bind the native services without hiding state changes from tests.

Run `python scripts/test_bot_ai_frame.py`. The suite compiles a direct C oracle
from the Baseq3 helper bodies and frame logic, then checks 26 MiniLang contracts.
The native side covers seven scenarios and 42 captured observations.

`src/mq3/game/bot_input.ml` additionally ports `BotChangeViewAngle(s)`,
`BotInputToUserCommand` and `BotUpdateInput`. It preserves binary32 angle
quantization, MSVC integer/signed-char conversions, every Baseq3 action/button
bit, weapon selection, delayed jump, held-attack respawn suppression and the
delta-angle add/subtract sequence. Run `python scripts/test_bot_input.py` for
the direct C oracle and 17 focused MiniLang contracts.

`src/mq3/game/bot_ai_commands.ml` now supplies the default `BotAI` boundary.
It copies the current player state, consumes queued `print`, `chat` and `tchat`
commands, preserves Baseq3 color-byte filtering, and refreshes deathmatch AI.
It also ports bot info configstrings and the console team/status report for all
LTG status values. Run `python scripts/test_bot_ai_commands.py` for the direct
C oracle and 30 MiniLang contracts.

`src/mq3/game/bot_team_helpers.ml` begins the `ai_team.c` decision layer with
team-leader validation, teammate enumeration and stable named task preferences.
`python scripts/test_bot_team_helpers.py` compares five unchanged original
function bodies across six records and adds nine MiniLang contracts.
The same module now also ports the five Baseq3 team-order communication helpers,
including the exact `0x19` self-message decoration and the non-MISSIONPACK voice
no-ops. `python scripts/test_bot_team_orders.py` compares seven exact records and
adds five contracts.
`BotCTFOrders` and `BotCreateGroup` now add team-relative four-state dispatch and
self-/other-led group construction. `python scripts/test_bot_team_strategy.py`
compares sixteen exact records and adds eleven contracts.
`FindHumanTeamLeader` adds the original 64-slot human/bot/not-leader/team scan,
name adoption and conditional default-defense order. Its direct suite covers
three scenarios with six observations and six contracts.
Six `ai_dmq3.c` query helpers now provide team/opposite-team checks, same-team
comparison, color-cleaned name lookup and player-state death classification.
`python scripts/test_bot_team_queries.py` compares nine exact records and adds
eleven contracts.

`src/mq3/game/bot_combat_ai.ml` starts the `ai_dmq3.c` combat layer with
entity flag/invisibility/firing/chat/quad predicates, CTF carrying,
teleport/death/intermission/hazard state, weapon-based aggression and feeling,
retreat/chase decisions, rocket-jump eligibility and the original two-axis
field-of-view test. Bot inventory, weapon, teleport and origin state now lives
on the central `BotState`; world and characteristic lookups remain explicit
services. `python scripts/test_bot_combat_ai.py` checks 12 native scenarios with
68 exact observations and 35 MiniLang contracts.

The same module now continues through enemy scanning, aiming and attack
release. `findEnemy` preserves the health/alertness range, invisibility, chat,
recent-teleport, current-enemy, flag-carrier, team, visibility and retreat
gates. `aimAtEnemy` covers reaction time, direct non-player targets, visible
target adjustment, aim error and last-known positions. `checkAttack` preserves
reaction, weapon-change and fire-throttle timing, gauntlet range, FOV,
obstruction and teammate checks, radial self-damage avoidance and fire-on-
release toggling. Traces, visibility, characteristics, weapon data and attack
actions are explicit services. `python scripts/test_bot_combat_targeting.py`
checks 10 native scenarios with 25 exact observations and 24 contracts.

Projectile weapons now use the remaining `BotAimAtEnemy` prediction branches:
the half-second enemy motion cache, exact AAS movement prediction for skilled
bots, linear lead for intermediate skill, suppression for short strafing steps,
three-trace splash-ground validation with self-distance protection, and visible
corner targets for rocket, grenade and BFG shots. `python
scripts/test_bot_combat_prediction.py` checks six native scenarios with 19 exact
observations and 13 additional MiniLang contracts. Engine prediction and trace
operations stay explicit services.

`BotAttackMove` completes local combat movement: timed chase-goal movement,
the attack-skill early exit, gauntlet and ranged distance bands, jump/crouch
probability and cooldown state, adaptive strafe timing, distance correction
and the two-attempt direction flip. Setup, AAS goal moves and directional moves
are explicit services. `python scripts/test_bot_attack_move.py` runs the
unchanged original body through 12 native scenarios with 21 exact observations
and adds 15 MiniLang contracts.

`src/mq3/game/bot_fight_state.ml` now supplies the `AIEnter_Battle_Fight`,
`AIEnter_Battle_SuicidalFight`, `AIEnter_Battle_Chase` and
`AINode_Battle_Fight` layer. It joins enemy acquisition, death and chat state,
last reachable enemy tracking, visibility-driven chase, battle items, weapon
choice, `BotAttackMove`, blocked handling, aim, attack and retreat in Baseq3
order. All engine, AAS, movement, trace and random interactions remain explicit
services. `python scripts/test_bot_fight_state.py` checks 13 native scenarios
with 26 exact observations and 14 MiniLang contracts.

The same module now completes `AINode_Battle_Chase`,
`AINode_Battle_Retreat` and `AINode_Battle_NBG`, including their entry points.
It preserves the original timeouts, last-seen enemy goal, periodic nearby-item
detour, retreat LTG, movement view/weapon flags and return to fight or retreat.
`python scripts/test_bot_battle_states.py` compiles byte-for-byte extracted
Baseq3 function bodies for 19 native scenarios and 43 exact observations, then
runs 24 MiniLang contracts. Goal-stack, route and map hooks remain explicit
services shared with the navigation layer.

`src/mq3/game/bot_seek_state.ml` now covers the complete Baseq3 entries and
nodes for `Seek_LTG`, `Seek_NBG`, `Seek_ActivateEntity`, `Stand`, `Respawn`,
`Observer` and `Intermission`. Besides LTG/NBG selection, movement and combat
transitions, it executes the activation-goal stack for touch and shoot goals,
including visibility, aim, weapon selection, timeout/pop, obstacle prediction
and stack cleanup. Stand/chat deadlines, respawn actions and the observer and
intermission exits are dispatched through the same frame path.
`python scripts/test_bot_seek_state.py` compiles the relevant unchanged
`ai_dmnet.c` bodies in three direct hosts: 43 native scenarios with 101 exact
observations. 38 MiniLang contracts include end-to-end frame dispatch and all
new node families.

`bot_ai_commands.runNodes` executes a configured `nodeStepFn` immediately
after the deathmatch refresh, with the original 50-switch bound. The battle
module's `runNode` dispatches Fight, Chase, Retreat and NBG and rejects unknown
nonzero nodes; node zero remains idle. The frame contract drives this path
through the default `BotAI` callback. A runtime embedding supplies the battle
services when binding `nodeStepFn`.

`src/mq3/game/bot_inventory_ai.ml` ports `BotChooseWeapon` and
`BotUpdateBattleInventory`: weapon raise/drop retention, best-weapon selection,
change timing and C-truncated enemy height/distance. Its direct suite compares
thirteen exact records and adds seven contracts.
`BotUpdateInventory` now projects the complete Baseq3 PlayerState weapon, ammo,
health, armor, holdable, powerup and CTF-flag subset and preserves the original
old-inventory pickup callback. Four records compare sixty projected values;
ten contracts cover presence, absence and replacement.

`src/mq3/game/bot_navigation.ml` ports the first AAS movement boundary from
`ai_dmq3.c`: movement-state setup, special up/down mover directions, random
walk fallback and mover-obstacle prediction. The botlib calls are explicit
services; route throttling, model extraction and both activation-goal branches
retain their Baseq3 ordering. Alternative-route selection also preserves the
red/blue route sets, random-index clamp, copied goal bounds, travel-time arrival
threshold and persistent route state. The activation executor now owns the
eight-slot Baseq3 heap, LIFO push/pop/clear order, routing-area enable state,
two-second reuse guard and `BotGoForActivateGoal` node transition. The obstacle
predictor uses this implementation when no host override is installed.
`BotGetActivateGoal` now resolves a blocking mover back to its BSP entity,
handles shootable, start-open and moving doors, orders reachability areas in
two passes, and walks button/trigger/relay/delay activation trees with the
original duplicate and travel-time checks. `python scripts/test_bot_navigation.py`
General item-goal policy now adds `BotGoCamp`, `BotWantsToCamp`, `BotDontAvoid`
and `BotGoForPowerups`, including the original camping cooldown/probability,
weapon gate, nearest camp travel limit and five-item avoid reset order.
The first `ai_dmnet.c` route-execution chain adds `BotGetAirGoal`, `BotGoForAir`,
`BotNearbyGoal`, `BotReachedGoal` and `BotGetItemLongTermGoal`. Explicit trace,
AAS-content, goal-stack, inventory-goal and reachability services preserve the
original water escape, flag-carrier range, item completion and LTG refresh call
order. The next contiguous block ports `BotGetLongTermGoal` and
`BotLongTermGoal`: help/accompany, defense, kill/get-item, camp, patrol and
Baseq3 CTF goals now share the central bot state, while leader expiry,
visibility, backup and distance decisions precede that dispatcher exactly as
in `ai_dmnet.c`. The oracle compiles both extracted original bodies unchanged.
`python scripts/test_bot_navigation.py` checks 79 native scenarios with 244
exact observations and 104 MiniLang contracts.

The remaining combat AI includes Seek-NBG, activation, stand/respawn and other
AI-node route transitions plus mission-pack-only long-term goal variants. Server-command
ingestion, combat-state decisions, status projection, view changes and
user-command generation now reach those layers through explicit services.

The team layer now includes the complete Baseq3
`BotCTFOrders_BothFlagsNotAtBase` policy in `bot_team_helpers.ml`. It covers
one-, two-, and three-player teams, local, remote and missing flag carriers,
the 40-percent escort and 50-percent retrieval bands, task-preference sorting,
and the original four-/five-client caps. New helper states install it as the
default both-flags-away callback. `python scripts/test_bot_ctf_both_away.py`
checks ten records from the unchanged extracted C body and twelve MiniLang
contracts.

`BotCTFOrders_FlagNotAtBase` is also complete and installed as the own-flag-away
default. It preserves passive and aggressive policies for every team-size
switch, the 30/70 and 20/70 percent bands, their 3/6 and 2/7 caps, and the
original overlapping defender/attacker assignment. `python
scripts/test_bot_ctf_own_away.py` runs ten records from the unchanged C body and
thirteen contracts.

`BotCTFOrders_EnemyFlagNotAtBase` is now complete and installed as the
enemy-flag-away default. It preserves the one-, two-, three- and larger-team
branches, carrier substitution, task-preference sorting, the rounded 60-percent
defender and 30-percent escort bands, the six-/three-client caps, and the local,
remote and missing-carrier chats. `python scripts/test_bot_ctf_enemy_away.py`
runs twelve records from the unchanged C body and fifteen contracts.

`BotCTFOrders_BothFlagsAtBase` completes the detailed four-state Baseq3 CTF
order layer and is installed as the both-flags-home default. It preserves both
passive and aggressive one-, two-, three- and larger-team branches,
task-preference sorting, half-up 50/40 and 40/50 percent assignment bands, and
the original five/four and four/five caps. `python
scripts/test_bot_ctf_both_at_base.py` runs fourteen exact records from the
unchanged extracted C body and seventeen contracts.

The remaining combat work is the full chase, retreat and battle-nearby-goal
state machinery plus the specialized long-term-goal and AI-node routes.
