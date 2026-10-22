import mq3.client.ui_login as l
import mq3.client.ui_qmenu as q
function ready() s=l.create(false);l.Login_MenuInit(s);s.actions=[];s.nameBox.buffer="Player";s.passwordBox.buffer="Secret";return s end function
function main(args) s=ready();l.Login_MenuEvent(s,l.ID_LOGIN,1);print("ignore 0 0 0");l.Login_MenuEvent(s,l.ID_LOGIN,q.QM_ACTIVATED);print("login 1 1 "+s.actions[0].text+" "+s.actions[0].text2);s=ready();l.Login_MenuEvent(s,l.ID_CANCEL,q.QM_ACTIVATED);print("cancel 1");return 0 end function
