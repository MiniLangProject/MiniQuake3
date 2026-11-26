// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete Baseq3 public constant facade for surfaceflags.h, inv.h, chars.h, syn.h, match.h and g_team.h.
package mq3.game.game_headers

// surfaceflags.h
const CONTENTS_SOLID=1
/// Collision-contents bit identifying lava space or objects.
const CONTENTS_LAVA=8
/// Collision-contents bit identifying slime space or objects.
const CONTENTS_SLIME=16
/// Collision-contents bit identifying water space or objects.
const CONTENTS_WATER=32
/// Collision-contents bit identifying fog space or objects.
const CONTENTS_FOG=64
/// Collision-contents bit identifying notteam1 space or objects.
const CONTENTS_NOTTEAM1=128
/// Collision-contents bit identifying notteam2 space or objects.
const CONTENTS_NOTTEAM2=256
/// Collision-contents bit identifying nobotclip space or objects.
const CONTENTS_NOBOTCLIP=512
/// Collision-contents bit identifying areaportal space or objects.
const CONTENTS_AREAPORTAL=32768
/// Collision-contents bit identifying playerclip space or objects.
const CONTENTS_PLAYERCLIP=65536
/// Collision-contents bit identifying monsterclip space or objects.
const CONTENTS_MONSTERCLIP=131072
/// Collision-contents bit identifying teleporter space or objects.
const CONTENTS_TELEPORTER=262144
/// Collision-contents bit identifying jumppad space or objects.
const CONTENTS_JUMPPAD=524288
/// Collision-contents bit identifying clusterportal space or objects.
const CONTENTS_CLUSTERPORTAL=1048576
/// Collision-contents bit identifying donotenter space or objects.
const CONTENTS_DONOTENTER=2097152
/// Collision-contents bit identifying botclip space or objects.
const CONTENTS_BOTCLIP=4194304
/// Collision-contents bit identifying mover space or objects.
const CONTENTS_MOVER=8388608
/// Collision-contents bit identifying origin space or objects.
const CONTENTS_ORIGIN=16777216
/// Collision-contents bit identifying body space or objects.
const CONTENTS_BODY=33554432
/// Collision-contents bit identifying corpse space or objects.
const CONTENTS_CORPSE=67108864
/// Collision-contents bit identifying detail space or objects.
const CONTENTS_DETAIL=134217728
/// Collision-contents bit identifying structural space or objects.
const CONTENTS_STRUCTURAL=268435456
/// Collision-contents bit identifying translucent space or objects.
const CONTENTS_TRANSLUCENT=536870912
/// Collision-contents bit identifying trigger space or objects.
const CONTENTS_TRIGGER=1073741824
/// Collision-contents bit identifying nodrop space or objects.
const CONTENTS_NODROP=-2147483648
/// Compiled surface-flag bit marking nodamage behavior.
const SURF_NODAMAGE=1
/// Compiled surface-flag bit marking slick behavior.
const SURF_SLICK=2
/// Compiled surface-flag bit marking sky behavior.
const SURF_SKY=4
/// Compiled surface-flag bit marking ladder behavior.
const SURF_LADDER=8
/// Compiled surface-flag bit marking noimpact behavior.
const SURF_NOIMPACT=16
/// Compiled surface-flag bit marking nomarks behavior.
const SURF_NOMARKS=32
/// Compiled surface-flag bit marking flesh behavior.
const SURF_FLESH=64
/// Compiled surface-flag bit marking nodraw behavior.
const SURF_NODRAW=128
/// Compiled surface-flag bit marking hint behavior.
const SURF_HINT=256
/// Compiled surface-flag bit marking skip behavior.
const SURF_SKIP=512
/// Compiled surface-flag bit marking nolightmap behavior.
const SURF_NOLIGHTMAP=1024
/// Compiled surface-flag bit marking pointlight behavior.
const SURF_POINTLIGHT=2048
/// Compiled surface-flag bit marking metalsteps behavior.
const SURF_METALSTEPS=4096
/// Compiled surface-flag bit marking nosteps behavior.
const SURF_NOSTEPS=8192
/// Compiled surface-flag bit marking nonsolid behavior.
const SURF_NONSOLID=16384
/// Compiled surface-flag bit marking lightfilter behavior.
const SURF_LIGHTFILTER=32768
/// Compiled surface-flag bit marking alphashadow behavior.
const SURF_ALPHASHADOW=65536
/// Compiled surface-flag bit marking nodlight behavior.
const SURF_NODLIGHT=131072
/// Compiled surface-flag bit marking dust behavior.
const SURF_DUST=262144

// inv.h
const INVENTORY_NONE=0
/// Bot inventory slot used to read or update armor.
const INVENTORY_ARMOR=1
/// Bot inventory slot used to read or update gauntlet.
const INVENTORY_GAUNTLET=4
/// Bot inventory slot used to read or update shotgun.
const INVENTORY_SHOTGUN=5
/// Bot inventory slot used to read or update machine gun.
const INVENTORY_MACHINEGUN=6
/// Bot inventory slot used to read or update grenade launcher.
const INVENTORY_GRENADELAUNCHER=7
/// Bot inventory slot used to read or update rocket launcher.
const INVENTORY_ROCKETLAUNCHER=8
/// Bot inventory slot used to read or update lightning gun.
const INVENTORY_LIGHTNING=9
/// Bot inventory slot used to read or update railgun.
const INVENTORY_RAILGUN=10
/// Bot inventory slot used to read or update plasma gun.
const INVENTORY_PLASMAGUN=11
/// Bot inventory slot used to read or update bfg10 k.
const INVENTORY_BFG10K=13
/// Bot inventory slot used to read or update grappling hook.
const INVENTORY_GRAPPLINGHOOK=14
/// Bot inventory slot used to read or update nailgun.
const INVENTORY_NAILGUN=15
/// Bot inventory slot used to read or update proximity mine launcher.
const INVENTORY_PROXLAUNCHER=16
/// Bot inventory slot used to read or update chaingun.
const INVENTORY_CHAINGUN=17
/// Bot inventory slot used to read or update shells.
const INVENTORY_SHELLS=18
/// Bot inventory slot used to read or update bullets.
const INVENTORY_BULLETS=19
/// Bot inventory slot used to read or update grenades.
const INVENTORY_GRENADES=20
/// Bot inventory slot used to read or update cells.
const INVENTORY_CELLS=21
/// Bot inventory slot used to read or update lightningammo.
const INVENTORY_LIGHTNINGAMMO=22
/// Bot inventory slot used to read or update rockets.
const INVENTORY_ROCKETS=23
/// Bot inventory slot used to read or update slugs.
const INVENTORY_SLUGS=24
/// Bot inventory slot used to read or update bfgammo.
const INVENTORY_BFGAMMO=25
/// Bot inventory slot used to read or update nails.
const INVENTORY_NAILS=26
/// Bot inventory slot used to read or update mines.
const INVENTORY_MINES=27
/// Bot inventory slot used to read or update belt.
const INVENTORY_BELT=28
/// Bot inventory slot used to read or update health.
const INVENTORY_HEALTH=29
/// Bot inventory slot used to read or update teleporter.
const INVENTORY_TELEPORTER=30
/// Bot inventory slot used to read or update medkit.
const INVENTORY_MEDKIT=31
/// Bot inventory slot used to read or update kamikaze.
const INVENTORY_KAMIKAZE=32
/// Bot inventory slot used to read or update portal.
const INVENTORY_PORTAL=33
/// Bot inventory slot used to read or update invulnerability.
const INVENTORY_INVULNERABILITY=34
/// Bot inventory slot used to read or update quad.
const INVENTORY_QUAD=35
/// Bot inventory slot used to read or update environmentsuit.
const INVENTORY_ENVIRONMENTSUIT=36
/// Bot inventory slot used to read or update haste.
const INVENTORY_HASTE=37
/// Bot inventory slot used to read or update invisibility.
const INVENTORY_INVISIBILITY=38
/// Bot inventory slot used to read or update regen.
const INVENTORY_REGEN=39
/// Bot inventory slot used to read or update flight.
const INVENTORY_FLIGHT=40
/// Bot inventory slot used to read or update scout.
const INVENTORY_SCOUT=41
/// Bot inventory slot used to read or update guard.
const INVENTORY_GUARD=42
/// Bot inventory slot used to read or update doubler.
const INVENTORY_DOUBLER=43
/// Bot inventory slot used to read or update ammoregen.
const INVENTORY_AMMOREGEN=44
/// Bot inventory slot used to read or update redflag.
const INVENTORY_REDFLAG=45
/// Bot inventory slot used to read or update blueflag.
const INVENTORY_BLUEFLAG=46
/// Bot inventory slot used to read or update neutralflag.
const INVENTORY_NEUTRALFLAG=47
/// Bot inventory slot used to read or update redcube.
const INVENTORY_REDCUBE=48
/// Bot inventory slot used to read or update bluecube.
const INVENTORY_BLUECUBE=49
/// Bot inventory slot containing horizontal distance to the selected enemy.
const ENEMY_HORIZONTAL_DIST=200
/// Bot inventory slot containing the enemy height relative to the bot.
const ENEMY_HEIGHT=201
/// Bot inventory slot containing the number of visible enemies.
const NUM_VISIBLE_ENEMIES=202
/// Bot inventory slot containing the number of visible teammates.
const NUM_VISIBLE_TEAMMATES=203
/// Shared pickup/model index identifying armorshard in the item-definition table.
const MODELINDEX_ARMORSHARD=1
/// Shared pickup/model index identifying armorcombat in the item-definition table.
const MODELINDEX_ARMORCOMBAT=2
/// Shared pickup/model index identifying armorbody in the item-definition table.
const MODELINDEX_ARMORBODY=3
/// Shared pickup/model index identifying healthsmall in the item-definition table.
const MODELINDEX_HEALTHSMALL=4
/// Shared pickup/model index identifying health in the item-definition table.
const MODELINDEX_HEALTH=5
/// Shared pickup/model index identifying healthlarge in the item-definition table.
const MODELINDEX_HEALTHLARGE=6
/// Shared pickup/model index identifying healthmega in the item-definition table.
const MODELINDEX_HEALTHMEGA=7
/// Shared pickup/model index identifying gauntlet in the item-definition table.
const MODELINDEX_GAUNTLET=8
/// Shared pickup/model index identifying shotgun in the item-definition table.
const MODELINDEX_SHOTGUN=9
/// Shared pickup/model index identifying machine gun in the item-definition table.
const MODELINDEX_MACHINEGUN=10
/// Shared pickup/model index identifying grenade launcher in the item-definition table.
const MODELINDEX_GRENADELAUNCHER=11
/// Shared pickup/model index identifying rocket launcher in the item-definition table.
const MODELINDEX_ROCKETLAUNCHER=12
/// Shared pickup/model index identifying lightning gun in the item-definition table.
const MODELINDEX_LIGHTNING=13
/// Shared pickup/model index identifying railgun in the item-definition table.
const MODELINDEX_RAILGUN=14
/// Shared pickup/model index identifying plasma gun in the item-definition table.
const MODELINDEX_PLASMAGUN=15
/// Shared pickup/model index identifying bfg10 k in the item-definition table.
const MODELINDEX_BFG10K=16
/// Shared pickup/model index identifying grappling hook in the item-definition table.
const MODELINDEX_GRAPPLINGHOOK=17
/// Shared pickup/model index identifying shells in the item-definition table.
const MODELINDEX_SHELLS=18
/// Shared pickup/model index identifying bullets in the item-definition table.
const MODELINDEX_BULLETS=19
/// Shared pickup/model index identifying grenades in the item-definition table.
const MODELINDEX_GRENADES=20
/// Shared pickup/model index identifying cells in the item-definition table.
const MODELINDEX_CELLS=21
/// Shared pickup/model index identifying lightningammo in the item-definition table.
const MODELINDEX_LIGHTNINGAMMO=22
/// Shared pickup/model index identifying rockets in the item-definition table.
const MODELINDEX_ROCKETS=23
/// Shared pickup/model index identifying slugs in the item-definition table.
const MODELINDEX_SLUGS=24
/// Shared pickup/model index identifying bfgammo in the item-definition table.
const MODELINDEX_BFGAMMO=25
/// Shared pickup/model index identifying teleporter in the item-definition table.
const MODELINDEX_TELEPORTER=26
/// Shared pickup/model index identifying medkit in the item-definition table.
const MODELINDEX_MEDKIT=27
/// Shared pickup/model index identifying quad in the item-definition table.
const MODELINDEX_QUAD=28
/// Shared pickup/model index identifying environmentsuit in the item-definition table.
const MODELINDEX_ENVIRONMENTSUIT=29
/// Shared pickup/model index identifying haste in the item-definition table.
const MODELINDEX_HASTE=30
/// Shared pickup/model index identifying invisibility in the item-definition table.
const MODELINDEX_INVISIBILITY=31
/// Shared pickup/model index identifying regen in the item-definition table.
const MODELINDEX_REGEN=32
/// Shared pickup/model index identifying flight in the item-definition table.
const MODELINDEX_FLIGHT=33
/// Shared pickup/model index identifying redflag in the item-definition table.
const MODELINDEX_REDFLAG=34
/// Shared pickup/model index identifying blueflag in the item-definition table.
const MODELINDEX_BLUEFLAG=35
/// Shared pickup/model index identifying kamikaze in the item-definition table.
const MODELINDEX_KAMIKAZE=36
/// Shared pickup/model index identifying portal in the item-definition table.
const MODELINDEX_PORTAL=37
/// Shared pickup/model index identifying invulnerability in the item-definition table.
const MODELINDEX_INVULNERABILITY=38
/// Shared pickup/model index identifying nails in the item-definition table.
const MODELINDEX_NAILS=39
/// Shared pickup/model index identifying mines in the item-definition table.
const MODELINDEX_MINES=40
/// Shared pickup/model index identifying belt in the item-definition table.
const MODELINDEX_BELT=41
/// Shared pickup/model index identifying scout in the item-definition table.
const MODELINDEX_SCOUT=42
/// Shared pickup/model index identifying guard in the item-definition table.
const MODELINDEX_GUARD=43
/// Shared pickup/model index identifying doubler in the item-definition table.
const MODELINDEX_DOUBLER=44
/// Shared pickup/model index identifying ammoregen in the item-definition table.
const MODELINDEX_AMMOREGEN=45
/// Shared pickup/model index identifying neutralflag in the item-definition table.
const MODELINDEX_NEUTRALFLAG=46
/// Shared pickup/model index identifying redcube in the item-definition table.
const MODELINDEX_REDCUBE=47
/// Shared pickup/model index identifying bluecube in the item-definition table.
const MODELINDEX_BLUECUBE=48
/// Shared pickup/model index identifying nailgun in the item-definition table.
const MODELINDEX_NAILGUN=49
/// Shared pickup/model index identifying proximity mine launcher in the item-definition table.
const MODELINDEX_PROXLAUNCHER=50
/// Shared pickup/model index identifying chaingun in the item-definition table.
const MODELINDEX_CHAINGUN=51
/// Weapon-definition index identifying gauntlet in bot weapon tables.
const WEAPONINDEX_GAUNTLET=1
/// Weapon-definition index identifying machine gun in bot weapon tables.
const WEAPONINDEX_MACHINEGUN=2
/// Weapon-definition index identifying shotgun in bot weapon tables.
const WEAPONINDEX_SHOTGUN=3
/// Weapon-definition index identifying grenade launcher in bot weapon tables.
const WEAPONINDEX_GRENADE_LAUNCHER=4
/// Weapon-definition index identifying rocket launcher in bot weapon tables.
const WEAPONINDEX_ROCKET_LAUNCHER=5
/// Weapon-definition index identifying lightning gun in bot weapon tables.
const WEAPONINDEX_LIGHTNING=6
/// Weapon-definition index identifying railgun in bot weapon tables.
const WEAPONINDEX_RAILGUN=7
/// Weapon-definition index identifying plasma gun in bot weapon tables.
const WEAPONINDEX_PLASMAGUN=8
/// Weapon-definition index identifying BFG in bot weapon tables.
const WEAPONINDEX_BFG=9
/// Weapon-definition index identifying grappling hook in bot weapon tables.
const WEAPONINDEX_GRAPPLING_HOOK=10
/// Weapon-definition index identifying nailgun in bot weapon tables.
const WEAPONINDEX_NAILGUN=11
/// Weapon-definition index identifying proximity mine launcher in bot weapon tables.
const WEAPONINDEX_PROXLAUNCHER=12
/// Weapon-definition index identifying chaingun in bot weapon tables.
const WEAPONINDEX_CHAINGUN=13

// chars.h
const CHARACTERISTIC_NAME=0
/// Bot-character characteristic index for gender. Definition: gender of the bot string ("male",
/// "female", "it").
const CHARACTERISTIC_GENDER=1
/// Bot-character characteristic index controlling attack skill.
const CHARACTERISTIC_ATTACK_SKILL=2
/// Bot-character characteristic index for weaponweights. Definition: weapon weight file string.
const CHARACTERISTIC_WEAPONWEIGHTS=3
/// Bot-character characteristic index for view factor. Definition: view angle difference to angle
/// change factor float <0, 1].
const CHARACTERISTIC_VIEW_FACTOR=4
/// Bot-character characteristic index for view maxchange. Definition: maximum view angle change float
/// [1, 360].
const CHARACTERISTIC_VIEW_MAXCHANGE=5
/// Bot-character characteristic index for reactiontime. Definition: reaction time in seconds float [0,
/// 5].
const CHARACTERISTIC_REACTIONTIME=6
/// Bot-character characteristic index for aim accuracy. Definition: accuracy when aiming float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY=7
/// Bot-character characteristic index for aim accuracy machine gun. Definition: weapon specific aim
/// accuracy float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN=8
/// Bot-character characteristic index for aim accuracy shotgun. Definition: float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY_SHOTGUN=9
/// Bot-character characteristic index for aim accuracy rocket launcher. Definition: float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER=10
/// Bot-character characteristic index for aim accuracy grenade launcher. Definition: float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER=11
/// Bot-character characteristic index controlling aim accuracy lightning gun.
const CHARACTERISTIC_AIM_ACCURACY_LIGHTNING=12
/// Bot-character characteristic index for aim accuracy plasma gun. Definition: float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN=13
/// Bot-character characteristic index controlling aim accuracy railgun.
const CHARACTERISTIC_AIM_ACCURACY_RAILGUN=14
/// Bot-character characteristic index for aim accuracy bfg10 k. Definition: float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY_BFG10K=15
/// Bot-character characteristic index controlling aim skill.
const CHARACTERISTIC_AIM_SKILL=16
/// Bot-character characteristic index for aim skill rocket launcher. Definition: weapon specific aim
/// skill float [0, 1].
const CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER=17
/// Bot-character characteristic index for aim skill grenade launcher. Definition: float [0, 1].
const CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER=18
/// Bot-character characteristic index for aim skill plasma gun. Definition: float [0, 1].
const CHARACTERISTIC_AIM_SKILL_PLASMAGUN=19
/// Bot-character characteristic index for aim skill bfg10 k. Definition: float [0, 1].
const CHARACTERISTIC_AIM_SKILL_BFG10K=20
/// Bot-character characteristic index for chat file. Definition: chat file with chats string.
const CHARACTERISTIC_CHAT_FILE=21
/// Bot-character characteristic index for chat name. Definition: name of the chat character string.
const CHARACTERISTIC_CHAT_NAME=22
/// Bot-character characteristic index for chat cpm. Definition: characters per minute type speed
/// integer [1, 4000].
const CHARACTERISTIC_CHAT_CPM=23
/// Bot-character characteristic index for chat insult. Definition: tendency to insult/praise float [0,
/// 1].
const CHARACTERISTIC_CHAT_INSULT=24
/// Bot-character characteristic index for chat misc. Definition: tendency to chat misc float [0, 1].
const CHARACTERISTIC_CHAT_MISC=25
/// Bot-character characteristic index for chat startendlevel. Definition: tendency to chat at start or
/// end of level float [0, 1].
const CHARACTERISTIC_CHAT_STARTENDLEVEL=26
/// Bot-character characteristic index for chat enterexitgame. Definition: tendency to chat entering or
/// exiting the game float [0, 1].
const CHARACTERISTIC_CHAT_ENTEREXITGAME=27
/// Bot-character characteristic index for chat kill. Definition: tendency to chat when killed someone
/// float [0, 1].
const CHARACTERISTIC_CHAT_KILL=28
/// Bot-character characteristic index for chat death. Definition: tendency to chat when died float [0,
/// 1].
const CHARACTERISTIC_CHAT_DEATH=29
/// Bot-character characteristic index for chat enemysuicide. Definition: tendency to chat when enemy
/// suicides float [0, 1].
const CHARACTERISTIC_CHAT_ENEMYSUICIDE=30
/// Bot-character characteristic index for chat hittalking. Definition: tendency to chat when hit while
/// talking float [0, 1].
const CHARACTERISTIC_CHAT_HITTALKING=31
/// Bot-character characteristic index for chat hitnodeath. Definition: tendency to chat when bot was
/// hit but didn't dye float [0, 1].
const CHARACTERISTIC_CHAT_HITNODEATH=32
/// Bot-character characteristic index for chat hitnokill. Definition: tendency to chat when bot hit the
/// enemy but enemy didn't dye float [0, 1].
const CHARACTERISTIC_CHAT_HITNOKILL=33
/// Bot-character characteristic index for chat random. Definition: tendency to randomly chat float [0,
/// 1].
const CHARACTERISTIC_CHAT_RANDOM=34
/// Bot-character characteristic index for chat reply. Definition: tendency to reply float [0, 1].
const CHARACTERISTIC_CHAT_REPLY=35
/// Bot-character characteristic index for croucher. Definition: movement tendency to crouch float [0,
/// 1].
const CHARACTERISTIC_CROUCHER=36
/// Bot-character characteristic index for jumper. Definition: tendency to jump float [0, 1].
const CHARACTERISTIC_JUMPER=37
/// Bot-character characteristic index for walker. Definition: tendency to walk float [0, 1].
const CHARACTERISTIC_WALKER=48
/// Bot-character characteristic index for weaponjumping. Definition: tendency to jump using a weapon
/// float [0, 1].
const CHARACTERISTIC_WEAPONJUMPING=38
/// Bot-character characteristic index for grapple user. Definition: tendency to use the grapple hook
/// when available float [0, 1] //use this!!.
const CHARACTERISTIC_GRAPPLE_USER=39
/// Bot-character characteristic index for itemweights. Definition: goal item weight file string.
const CHARACTERISTIC_ITEMWEIGHTS=40
/// Bot-character characteristic index for aggression. Definition: the aggression of the bot float [0,
/// 1].
const CHARACTERISTIC_AGGRESSION=41
/// Bot-character characteristic index for selfpreservation. Definition: the self preservation of the
/// bot (rockets near walls etc.) float [0, 1].
const CHARACTERISTIC_SELFPRESERVATION=42
/// Bot-character characteristic index for vengefulness. Definition: how likely the bot is to take
/// revenge float [0, 1] //use this!!.
const CHARACTERISTIC_VENGEFULNESS=43
/// Bot-character characteristic index for camper. Definition: tendency to camp float [0, 1].
const CHARACTERISTIC_CAMPER=44
/// Bot-character characteristic index for easy fragger. Definition: tendency to get easy frags float
/// [0, 1].
const CHARACTERISTIC_EASY_FRAGGER=45
/// Bot-character characteristic index for alertness. Definition: how alert the bot is (view distance)
/// float [0, 1].
const CHARACTERISTIC_ALERTNESS=46
/// Bot-character characteristic index for firethrottle. Definition: how much the bot fires it's weapon
/// float [0, 1].
const CHARACTERISTIC_FIRETHROTTLE=47

// syn.h
const CONTEXT_ALL=-1
/// Bot synonym/chat context bit selecting the normal vocabulary.
const CONTEXT_NORMAL=1
/// Bot synonym/chat context bit selecting the nearbyitem vocabulary.
const CONTEXT_NEARBYITEM=2
/// Bot synonym/chat context bit selecting the ctfredteam vocabulary.
const CONTEXT_CTFREDTEAM=4
/// Bot synonym/chat context bit selecting the ctfblueteam vocabulary.
const CONTEXT_CTFBLUETEAM=8
/// Bot synonym/chat context bit selecting the reply vocabulary.
const CONTEXT_REPLY=16
/// Bot synonym/chat context bit selecting the obeliskredteam vocabulary.
const CONTEXT_OBELISKREDTEAM=32
/// Bot synonym/chat context bit selecting the obeliskblueteam vocabulary.
const CONTEXT_OBELISKBLUETEAM=64
/// Bot synonym/chat context bit selecting the harvesterredteam vocabulary.
const CONTEXT_HARVESTERREDTEAM=128
/// Bot synonym/chat context bit selecting the harvesterblueteam vocabulary.
const CONTEXT_HARVESTERBLUETEAM=256
/// Bot synonym/chat context bit selecting the names vocabulary.
const CONTEXT_NAMES=1024

// match.h
const MTCONTEXT_MISC=2
/// Bot message-matching context bit enabling initialteamchat patterns.
const MTCONTEXT_INITIALTEAMCHAT=4
/// Bot message-matching context bit enabling time patterns.
const MTCONTEXT_TIME=8
/// Bot message-matching context bit enabling teammate patterns.
const MTCONTEXT_TEAMMATE=16
/// Bot message-matching context bit enabling addressee patterns.
const MTCONTEXT_ADDRESSEE=32
/// Bot message-matching context bit enabling patrolkeyarea patterns.
const MTCONTEXT_PATROLKEYAREA=64
/// Bot message-matching context bit enabling replychat patterns.
const MTCONTEXT_REPLYCHAT=128
/// Bot message-matching context bit enabling capture the flag patterns.
const MTCONTEXT_CTF=256
/// Bot chat-message type used to recognize or dispatch newleader messages.
const MSG_NEWLEADER=1
/// Bot chat-message type used to recognize or dispatch entergame messages.
const MSG_ENTERGAME=2
/// Bot chat-message type used to recognize or dispatch help messages.
const MSG_HELP=3
/// Bot chat-message type used to recognize or dispatch accompany messages.
const MSG_ACCOMPANY=4
/// Bot chat-message type used to recognize or dispatch defend a key area messages.
const MSG_DEFENDKEYAREA=5
/// Bot chat-message type used to recognize or dispatch rush the base messages.
const MSG_RUSHBASE=6
/// Bot chat-message type used to recognize or dispatch capture the flag messages.
const MSG_GETFLAG=7
/// Bot chat-message type used to recognize or dispatch startteamleadership messages.
const MSG_STARTTEAMLEADERSHIP=8
/// Bot chat-message type used to recognize or dispatch stopteamleadership messages.
const MSG_STOPTEAMLEADERSHIP=9
/// Bot chat-message type used to recognize or dispatch whoisteamlaeder messages.
const MSG_WHOISTEAMLAEDER=10
/// Bot chat-message type used to recognize or dispatch wait messages.
const MSG_WAIT=11
/// Bot chat-message type used to recognize or dispatch whatareyoudoing messages.
const MSG_WHATAREYOUDOING=12
/// Bot chat-message type used to recognize or dispatch joinsubteam messages.
const MSG_JOINSUBTEAM=13
/// Bot chat-message type used to recognize or dispatch leavesubteam messages.
const MSG_LEAVESUBTEAM=14
/// Bot chat-message type used to recognize or dispatch createnewformation messages.
const MSG_CREATENEWFORMATION=15
/// Bot chat-message type used to recognize or dispatch formationposition messages.
const MSG_FORMATIONPOSITION=16
/// Bot chat-message type used to recognize or dispatch formationspace messages.
const MSG_FORMATIONSPACE=17
/// Bot chat-message type used to recognize or dispatch doformation messages.
const MSG_DOFORMATION=18
/// Bot chat-message type used to recognize or dispatch dismiss messages.
const MSG_DISMISS=19
/// Bot chat-message type used to recognize or dispatch camp messages.
const MSG_CAMP=20
/// Bot chat-message type used to recognize or dispatch checkpoint messages.
const MSG_CHECKPOINT=21
/// Bot chat-message type used to recognize or dispatch patrol messages.
const MSG_PATROL=22
/// Bot chat-message type used to recognize or dispatch leadtheway messages.
const MSG_LEADTHEWAY=23
/// Bot chat-message type used to recognize or dispatch getitem messages.
const MSG_GETITEM=24
/// Bot chat-message type used to recognize or dispatch kill messages.
const MSG_KILL=25
/// Bot chat-message type used to recognize or dispatch whereareyou messages.
const MSG_WHEREAREYOU=26
/// Bot chat-message type used to recognize or dispatch return the flag messages.
const MSG_RETURNFLAG=27
/// Bot chat-message type used to recognize or dispatch whatismycommand messages.
const MSG_WHATISMYCOMMAND=28
/// Bot chat-message type used to recognize or dispatch whichteam messages.
const MSG_WHICHTEAM=29
/// Bot chat-message type used to recognize or dispatch taskpreference messages.
const MSG_TASKPREFERENCE=30
/// Bot chat-message type used to recognize or dispatch attackenemybase messages.
const MSG_ATTACKENEMYBASE=31
/// Bot chat-message type used to recognize or dispatch harvest messages.
const MSG_HARVEST=32
/// Bot chat-message type used to recognize or dispatch suicide messages.
const MSG_SUICIDE=33
/// Bot chat-message type used to recognize or dispatch me messages.
const MSG_ME=100
/// Bot chat-message type used to recognize or dispatch everyone messages.
const MSG_EVERYONE=101
/// Bot chat-message type used to recognize or dispatch multiplenames messages.
const MSG_MULTIPLENAMES=102
/// Bot chat-message type used to recognize or dispatch name messages.
const MSG_NAME=103
/// Bot chat-message type used to recognize or dispatch patrolkeyarea messages.
const MSG_PATROLKEYAREA=104
/// Bot chat-message type used to recognize or dispatch minutes messages.
const MSG_MINUTES=105
/// Bot chat-message type used to recognize or dispatch seconds messages.
const MSG_SECONDS=106
/// Bot chat-message type used to recognize or dispatch forever messages.
const MSG_FOREVER=107
/// Bot chat-message type used to recognize or dispatch foralongtime messages.
const MSG_FORALONGTIME=108
/// Bot chat-message type used to recognize or dispatch forawhile messages.
const MSG_FORAWHILE=109
/// Bot chat-message type used to recognize or dispatch chatall messages.
const MSG_CHATALL=200
/// Bot chat-message type used to recognize or dispatch chatteam messages.
const MSG_CHATTEAM=201
/// Bot chat-message type used to recognize or dispatch chattell messages.
const MSG_CHATTELL=202
/// Bot chat-message type used to recognize or dispatch capture the flag messages.
const MSG_CTF=300
/// Bot chat-match subtype flag used to refine somewhere instructions.
const ST_SOMEWHERE=0
/// Bot chat-match subtype flag used to refine nearitem instructions.
const ST_NEARITEM=1
/// Bot chat-match subtype flag used to refine addressed instructions.
const ST_ADDRESSED=2
/// Bot chat-match subtype flag used to refine meter instructions.
const ST_METER=4
/// Bot chat-match subtype flag used to refine feet instructions.
const ST_FEET=8
/// Bot chat-match subtype flag used to refine time instructions.
const ST_TIME=16
/// Bot chat-match subtype flag used to refine here instructions.
const ST_HERE=32
/// Bot chat-match subtype flag used to refine there instructions.
const ST_THERE=64
/// Bot chat-match subtype flag used to refine i instructions.
const ST_I=128
/// Bot chat-match subtype flag used to refine more instructions.
const ST_MORE=256
/// Bot chat-match subtype flag used to refine back instructions.
const ST_BACK=512
/// Bot chat-match subtype flag used to refine reverse instructions.
const ST_REVERSE=1024
/// Bot chat-match subtype flag used to refine someone instructions.
const ST_SOMEONE=2048
/// Bot chat-match subtype flag used to refine gotflag instructions.
const ST_GOTFLAG=4096
/// Bot chat-match subtype flag used to refine capturedflag instructions.
const ST_CAPTUREDFLAG=8192
/// Bot chat-match subtype flag used to refine returnedflag instructions.
const ST_RETURNEDFLAG=16384
/// Bot chat-match subtype flag used to refine team instructions.
const ST_TEAM=32768
/// Bot chat-match subtype flag used to refine 1 fctfgotflag instructions.
const ST_1FCTFGOTFLAG=65535
/// Bot chat-match subtype flag used to refine defender instructions.
const ST_DEFENDER=1
/// Bot chat-match subtype flag used to refine attacker instructions.
const ST_ATTACKER=2
/// Bot chat-match subtype flag used to refine roamer instructions.
const ST_ROAMER=4
/// Chat-match variable slot containing the enemy named by a message.
const THE_ENEMY=7
/// Chat-match variable slot containing the team named by a message.
const THE_TEAM=7
/// Chat-match variable slot containing a player network name.
const NETNAME=0
/// Chat-match variable slot containing a named place or location.
const PLACE=1
/// Chat-match variable slot containing a flag reference.
const FLAG=1
/// Chat-match variable slot containing the message body.
const MESSAGE=2
/// Chat-match variable slot containing the intended recipient.
const ADDRESSEE=2
/// Chat-match variable slot containing an item reference.
const ITEM=3
/// Chat-match variable slot containing the selected teammate.
const TEAMMATE=4
/// Chat-match variable slot containing a team name.
const TEAMNAME=4
/// Chat-match variable slot containing the selected enemy.
const ENEMY=4
/// Chat-match variable slot containing an area to defend or visit.
const KEYAREA=5
/// Chat-match variable slot containing the requested formation.
const FORMATION=5
/// Chat-match variable slot containing a position reference.
const POSITION=5
/// Chat-match variable slot containing a numeric argument.
const NUMBER=5
/// Chat-match variable slot containing a duration or time.
const TIME=6
/// Chat-match variable slot containing a named subject.
const NAME=6
/// Chat-match variable slot retaining the remaining argument text.
const MORE=6

// g_team.h
const CTF_CAPTURE_BONUS=5
/// Capture-the-flag scoring or timing parameter for team bonus.
const CTF_TEAM_BONUS=0
/// Capture-the-flag scoring or timing parameter for recovery bonus.
const CTF_RECOVERY_BONUS=1
/// Capture-the-flag scoring or timing parameter for flag bonus.
const CTF_FLAG_BONUS=0
/// Capture-the-flag scoring or timing parameter for frag carrier bonus.
const CTF_FRAG_CARRIER_BONUS=2
/// Capture-the-flag scoring or timing parameter for flag return time.
const CTF_FLAG_RETURN_TIME=40000
/// Capture-the-flag scoring or timing parameter for carrier danger protect bonus.
const CTF_CARRIER_DANGER_PROTECT_BONUS=2
/// Capture-the-flag scoring or timing parameter for carrier protect bonus.
const CTF_CARRIER_PROTECT_BONUS=1
/// Capture-the-flag scoring or timing parameter for flag defense bonus.
const CTF_FLAG_DEFENSE_BONUS=1
/// Capture-the-flag scoring or timing parameter for return flag assist bonus.
const CTF_RETURN_FLAG_ASSIST_BONUS=1
/// Capture-the-flag scoring or timing parameter for frag carrier assist bonus.
const CTF_FRAG_CARRIER_ASSIST_BONUS=2
/// Capture-the-flag scoring or timing parameter for target protect radius.
const CTF_TARGET_PROTECT_RADIUS=1000
/// Capture-the-flag scoring or timing parameter for attacker protect radius.
const CTF_ATTACKER_PROTECT_RADIUS=1000
/// Capture-the-flag scoring or timing parameter for carrier danger protect timeout.
const CTF_CARRIER_DANGER_PROTECT_TIMEOUT=8000
/// Capture-the-flag scoring or timing parameter for frag carrier assist timeout.
const CTF_FRAG_CARRIER_ASSIST_TIMEOUT=10000
/// Capture-the-flag scoring or timing parameter for return flag assist timeout.
const CTF_RETURN_FLAG_ASSIST_TIMEOUT=10000
/// Capture-the-flag scoring or timing parameter for grapple speed.
const CTF_GRAPPLE_SPEED=750
/// Capture-the-flag scoring or timing parameter for grapple pull speed.
const CTF_GRAPPLE_PULL_SPEED=750
/// Minimum interval in milliseconds between base-under-attack announcements.
const OVERLOAD_ATTACK_BASE_SOUND_TIME=20000

/// Character code 0x19 used as the escape marker in bot chat-match templates.
const EC_CODE=25
/// Return `EC_CODE` for `EC`.
function EC() return EC_CODE end function

/// Return the ordered surface values table for game headers: 44 entries beginning with `CONTENTS_SOLID` and `CONTENTS_LAVA`.
function surfaceValues() return [CONTENTS_SOLID,CONTENTS_LAVA,CONTENTS_SLIME,CONTENTS_WATER,CONTENTS_FOG,CONTENTS_NOTTEAM1,CONTENTS_NOTTEAM2,CONTENTS_NOBOTCLIP,CONTENTS_AREAPORTAL,CONTENTS_PLAYERCLIP,CONTENTS_MONSTERCLIP,CONTENTS_TELEPORTER,CONTENTS_JUMPPAD,CONTENTS_CLUSTERPORTAL,CONTENTS_DONOTENTER,CONTENTS_BOTCLIP,CONTENTS_MOVER,CONTENTS_ORIGIN,CONTENTS_BODY,CONTENTS_CORPSE,CONTENTS_DETAIL,CONTENTS_STRUCTURAL,CONTENTS_TRANSLUCENT,CONTENTS_TRIGGER,CONTENTS_NODROP,SURF_NODAMAGE,SURF_SLICK,SURF_SKY,SURF_LADDER,SURF_NOIMPACT,SURF_NOMARKS,SURF_FLESH,SURF_NODRAW,SURF_HINT,SURF_SKIP,SURF_NOLIGHTMAP,SURF_POINTLIGHT,SURF_METALSTEPS,SURF_NOSTEPS,SURF_NONSOLID,SURF_LIGHTFILTER,SURF_ALPHASHADOW,SURF_NODLIGHT,SURF_DUST] end function
/// Return the ordered inventory values table for game headers: 115 entries beginning with `INVENTORY_NONE` and `INVENTORY_ARMOR`.
function inventoryValues() return [INVENTORY_NONE,INVENTORY_ARMOR,INVENTORY_GAUNTLET,INVENTORY_SHOTGUN,INVENTORY_MACHINEGUN,INVENTORY_GRENADELAUNCHER,INVENTORY_ROCKETLAUNCHER,INVENTORY_LIGHTNING,INVENTORY_RAILGUN,INVENTORY_PLASMAGUN,INVENTORY_BFG10K,INVENTORY_GRAPPLINGHOOK,INVENTORY_NAILGUN,INVENTORY_PROXLAUNCHER,INVENTORY_CHAINGUN,INVENTORY_SHELLS,INVENTORY_BULLETS,INVENTORY_GRENADES,INVENTORY_CELLS,INVENTORY_LIGHTNINGAMMO,INVENTORY_ROCKETS,INVENTORY_SLUGS,INVENTORY_BFGAMMO,INVENTORY_NAILS,INVENTORY_MINES,INVENTORY_BELT,INVENTORY_HEALTH,INVENTORY_TELEPORTER,INVENTORY_MEDKIT,INVENTORY_KAMIKAZE,INVENTORY_PORTAL,INVENTORY_INVULNERABILITY,INVENTORY_QUAD,INVENTORY_ENVIRONMENTSUIT,INVENTORY_HASTE,INVENTORY_INVISIBILITY,INVENTORY_REGEN,INVENTORY_FLIGHT,INVENTORY_SCOUT,INVENTORY_GUARD,INVENTORY_DOUBLER,INVENTORY_AMMOREGEN,INVENTORY_REDFLAG,INVENTORY_BLUEFLAG,INVENTORY_NEUTRALFLAG,INVENTORY_REDCUBE,INVENTORY_BLUECUBE,ENEMY_HORIZONTAL_DIST,ENEMY_HEIGHT,NUM_VISIBLE_ENEMIES,NUM_VISIBLE_TEAMMATES,MODELINDEX_ARMORSHARD,MODELINDEX_ARMORCOMBAT,MODELINDEX_ARMORBODY,MODELINDEX_HEALTHSMALL,MODELINDEX_HEALTH,MODELINDEX_HEALTHLARGE,MODELINDEX_HEALTHMEGA,MODELINDEX_GAUNTLET,MODELINDEX_SHOTGUN,MODELINDEX_MACHINEGUN,MODELINDEX_GRENADELAUNCHER,MODELINDEX_ROCKETLAUNCHER,MODELINDEX_LIGHTNING,MODELINDEX_RAILGUN,MODELINDEX_PLASMAGUN,MODELINDEX_BFG10K,MODELINDEX_GRAPPLINGHOOK,MODELINDEX_SHELLS,MODELINDEX_BULLETS,MODELINDEX_GRENADES,MODELINDEX_CELLS,MODELINDEX_LIGHTNINGAMMO,MODELINDEX_ROCKETS,MODELINDEX_SLUGS,MODELINDEX_BFGAMMO,MODELINDEX_TELEPORTER,MODELINDEX_MEDKIT,MODELINDEX_QUAD,MODELINDEX_ENVIRONMENTSUIT,MODELINDEX_HASTE,MODELINDEX_INVISIBILITY,MODELINDEX_REGEN,MODELINDEX_FLIGHT,MODELINDEX_REDFLAG,MODELINDEX_BLUEFLAG,MODELINDEX_KAMIKAZE,MODELINDEX_PORTAL,MODELINDEX_INVULNERABILITY,MODELINDEX_NAILS,MODELINDEX_MINES,MODELINDEX_BELT,MODELINDEX_SCOUT,MODELINDEX_GUARD,MODELINDEX_DOUBLER,MODELINDEX_AMMOREGEN,MODELINDEX_NEUTRALFLAG,MODELINDEX_REDCUBE,MODELINDEX_BLUECUBE,MODELINDEX_NAILGUN,MODELINDEX_PROXLAUNCHER,MODELINDEX_CHAINGUN,WEAPONINDEX_GAUNTLET,WEAPONINDEX_MACHINEGUN,WEAPONINDEX_SHOTGUN,WEAPONINDEX_GRENADE_LAUNCHER,WEAPONINDEX_ROCKET_LAUNCHER,WEAPONINDEX_LIGHTNING,WEAPONINDEX_RAILGUN,WEAPONINDEX_PLASMAGUN,WEAPONINDEX_BFG,WEAPONINDEX_GRAPPLING_HOOK,WEAPONINDEX_NAILGUN,WEAPONINDEX_PROXLAUNCHER,WEAPONINDEX_CHAINGUN] end function
/// Return the ordered characteristic values table for game headers: 49 entries beginning with `CHARACTERISTIC_NAME` and `CHARACTERISTIC_GENDER`.
function characteristicValues() return [CHARACTERISTIC_NAME,CHARACTERISTIC_GENDER,CHARACTERISTIC_ATTACK_SKILL,CHARACTERISTIC_WEAPONWEIGHTS,CHARACTERISTIC_VIEW_FACTOR,CHARACTERISTIC_VIEW_MAXCHANGE,CHARACTERISTIC_REACTIONTIME,CHARACTERISTIC_AIM_ACCURACY,CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN,CHARACTERISTIC_AIM_ACCURACY_SHOTGUN,CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER,CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER,CHARACTERISTIC_AIM_ACCURACY_LIGHTNING,CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN,CHARACTERISTIC_AIM_ACCURACY_RAILGUN,CHARACTERISTIC_AIM_ACCURACY_BFG10K,CHARACTERISTIC_AIM_SKILL,CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER,CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER,CHARACTERISTIC_AIM_SKILL_PLASMAGUN,CHARACTERISTIC_AIM_SKILL_BFG10K,CHARACTERISTIC_CHAT_FILE,CHARACTERISTIC_CHAT_NAME,CHARACTERISTIC_CHAT_CPM,CHARACTERISTIC_CHAT_INSULT,CHARACTERISTIC_CHAT_MISC,CHARACTERISTIC_CHAT_STARTENDLEVEL,CHARACTERISTIC_CHAT_ENTEREXITGAME,CHARACTERISTIC_CHAT_KILL,CHARACTERISTIC_CHAT_DEATH,CHARACTERISTIC_CHAT_ENEMYSUICIDE,CHARACTERISTIC_CHAT_HITTALKING,CHARACTERISTIC_CHAT_HITNODEATH,CHARACTERISTIC_CHAT_HITNOKILL,CHARACTERISTIC_CHAT_RANDOM,CHARACTERISTIC_CHAT_REPLY,CHARACTERISTIC_CROUCHER,CHARACTERISTIC_JUMPER,CHARACTERISTIC_WALKER,CHARACTERISTIC_WEAPONJUMPING,CHARACTERISTIC_GRAPPLE_USER,CHARACTERISTIC_ITEMWEIGHTS,CHARACTERISTIC_AGGRESSION,CHARACTERISTIC_SELFPRESERVATION,CHARACTERISTIC_VENGEFULNESS,CHARACTERISTIC_CAMPER,CHARACTERISTIC_EASY_FRAGGER,CHARACTERISTIC_ALERTNESS,CHARACTERISTIC_FIRETHROTTLE] end function
/// Return the ordered synonym context values table for game headers: 11 entries beginning with `CONTEXT_ALL` and `CONTEXT_NORMAL`.
function synonymContextValues() return [CONTEXT_ALL,CONTEXT_NORMAL,CONTEXT_NEARBYITEM,CONTEXT_CTFREDTEAM,CONTEXT_CTFBLUETEAM,CONTEXT_REPLY,CONTEXT_OBELISKREDTEAM,CONTEXT_OBELISKBLUETEAM,CONTEXT_HARVESTERREDTEAM,CONTEXT_HARVESTERBLUETEAM,CONTEXT_NAMES] end function
/// Return the ordered match values table for game headers: 94 entries beginning with `MTCONTEXT_MISC` and `MTCONTEXT_INITIALTEAMCHAT`.
function matchValues() return [MTCONTEXT_MISC,MTCONTEXT_INITIALTEAMCHAT,MTCONTEXT_TIME,MTCONTEXT_TEAMMATE,MTCONTEXT_ADDRESSEE,MTCONTEXT_PATROLKEYAREA,MTCONTEXT_REPLYCHAT,MTCONTEXT_CTF,MSG_NEWLEADER,MSG_ENTERGAME,MSG_HELP,MSG_ACCOMPANY,MSG_DEFENDKEYAREA,MSG_RUSHBASE,MSG_GETFLAG,MSG_STARTTEAMLEADERSHIP,MSG_STOPTEAMLEADERSHIP,MSG_WHOISTEAMLAEDER,MSG_WAIT,MSG_WHATAREYOUDOING,MSG_JOINSUBTEAM,MSG_LEAVESUBTEAM,MSG_CREATENEWFORMATION,MSG_FORMATIONPOSITION,MSG_FORMATIONSPACE,MSG_DOFORMATION,MSG_DISMISS,MSG_CAMP,MSG_CHECKPOINT,MSG_PATROL,MSG_LEADTHEWAY,MSG_GETITEM,MSG_KILL,MSG_WHEREAREYOU,MSG_RETURNFLAG,MSG_WHATISMYCOMMAND,MSG_WHICHTEAM,MSG_TASKPREFERENCE,MSG_ATTACKENEMYBASE,MSG_HARVEST,MSG_SUICIDE,MSG_ME,MSG_EVERYONE,MSG_MULTIPLENAMES,MSG_NAME,MSG_PATROLKEYAREA,MSG_MINUTES,MSG_SECONDS,MSG_FOREVER,MSG_FORALONGTIME,MSG_FORAWHILE,MSG_CHATALL,MSG_CHATTEAM,MSG_CHATTELL,MSG_CTF,ST_SOMEWHERE,ST_NEARITEM,ST_ADDRESSED,ST_METER,ST_FEET,ST_TIME,ST_HERE,ST_THERE,ST_I,ST_MORE,ST_BACK,ST_REVERSE,ST_SOMEONE,ST_GOTFLAG,ST_CAPTUREDFLAG,ST_RETURNEDFLAG,ST_TEAM,ST_1FCTFGOTFLAG,ST_DEFENDER,ST_ATTACKER,ST_ROAMER,THE_ENEMY,THE_TEAM,NETNAME,PLACE,FLAG,MESSAGE,ADDRESSEE,ITEM,TEAMMATE,TEAMNAME,ENEMY,KEYAREA,FORMATION,POSITION,NUMBER,TIME,NAME,MORE] end function
/// Return the ordered team values table for game headers: 19 entries beginning with `CTF_CAPTURE_BONUS` and `CTF_TEAM_BONUS`.
function teamValues() return [CTF_CAPTURE_BONUS,CTF_TEAM_BONUS,CTF_RECOVERY_BONUS,CTF_FLAG_BONUS,CTF_FRAG_CARRIER_BONUS,CTF_FLAG_RETURN_TIME,CTF_CARRIER_DANGER_PROTECT_BONUS,CTF_CARRIER_PROTECT_BONUS,CTF_FLAG_DEFENSE_BONUS,CTF_RETURN_FLAG_ASSIST_BONUS,CTF_FRAG_CARRIER_ASSIST_BONUS,CTF_TARGET_PROTECT_RADIUS,CTF_ATTACKER_PROTECT_RADIUS,CTF_CARRIER_DANGER_PROTECT_TIMEOUT,CTF_FRAG_CARRIER_ASSIST_TIMEOUT,CTF_RETURN_FLAG_ASSIST_TIMEOUT,CTF_GRAPPLE_SPEED,CTF_GRAPPLE_PULL_SPEED,OVERLOAD_ATTACK_BASE_SOUND_TIME] end function
/// Return a new array `[44,115,49,11,94,19]` for `headerCounts`.
function headerCounts() return [44,115,49,11,94,19] end function
