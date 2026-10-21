import mq3.client.ui_sp_arena as arena
struct Host maxClients tiers events end struct
function value(h,n) h.events=h.events+"get:"+n+"|";return h.maxClients end function
function setValue(h,n,v) h.events=h.events+"set:"+n+":"+str(v)+"|";if n=="sv_maxclients" then h.maxClients=v end if;return void end function
function tiers(h) h.events=h.events+"tiers|";return h.tiers end function
function execute(h,w,t) h.events=h.events+"exec:"+str(w)+":"+t;return void end function
function row(name,maxClients,numTiers,text) h=Host(maxClients,numTiers,"");arena.start(arena.services(h,value,setValue,tiers,execute),text);print(name+"|"+h.events);return void end function
function main(args) row("ordinary",4.0,7,"\\num\\3\\map\\q3dm7");row("training",8.0,7,"\\num\\9\\special\\TrAiNiNg\\map\\q3dm0");row("final",12.0,6,"\\num\\9\\special\\FINAL\\map\\q3tourney6");row("fallback",8.0,1,"\\num\\garbage\\special\\bonus\\map\\");return 0 end function
