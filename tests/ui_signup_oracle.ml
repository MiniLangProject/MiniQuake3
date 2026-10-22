import mq3.client.ui_signup as s
import mq3.client.ui_rankings as r
import mq3.client.ui_qmenu as q
function ready() v=s.create(false);s.Signup_MenuInit(v,r.QGR_STATUS_NEW);v.actions=[];v.nameBox.buffer="Hero";v.passwordBox.buffer="one";v.againBox.buffer="two";v.emailBox.buffer="h@example.org";return v end function
function main(args) v=ready();s.Signup_MenuEvent(v,s.ID_SIGNUP,q.QM_ACTIVATED);print("mismatch 0 0");v.againBox.buffer="one";s.Signup_MenuEvent(v,s.ID_SIGNUP,q.QM_ACTIVATED);a=v.actions[0];print("signup 1 1 "+a.text+" "+a.text2+" "+a.text3);v=ready();s.Signup_MenuEvent(v,s.ID_CANCEL,q.QM_ACTIVATED);print("cancel 1");return 0 end function
