import mq3.client.ui_local as u
function main(args)
 print("api "+str(u.UI_API_VERSION)+" "+str(u.RCOLUMN_OFFSET)+" "+str(u.LCOLUMN_OFFSET)+" "+str(u.SLIDER_RANGE)+" "+str(u.MAX_EDIT_LINE)+" "+str(u.MAX_MENUDEPTH)+" "+str(u.MAX_MENUITEMS))
 print("types "+str(u.MTYPE_NULL)+" "+str(u.MTYPE_SLIDER)+" "+str(u.MTYPE_ACTION)+" "+str(u.MTYPE_SPINCONTROL)+" "+str(u.MTYPE_FIELD)+" "+str(u.MTYPE_RADIOBUTTON)+" "+str(u.MTYPE_BITMAP)+" "+str(u.MTYPE_TEXT)+" "+str(u.MTYPE_SCROLLLIST)+" "+str(u.MTYPE_PTEXT)+" "+str(u.MTYPE_BTEXT))
 print("flags "+str(u.QMF_BLINK)+" "+str(u.QMF_NUMBERSONLY)+" "+str(u.QMF_PULSEIFFOCUS)+" "+str(u.QMF_HIDDEN)+" "+str(u.QMF_OWNERDRAW)+" "+str(u.QMF_LOWERCASE)+" "+str(u.QMF_SILENT)+" "+str(u.MAX_FAVORITESERVERS))
 print("events "+str(u.QM_GOTFOCUS)+" "+str(u.QM_LOSTFOCUS)+" "+str(u.QM_ACTIVATED)+" awards "+str(u.AWARD_ACCURACY)+" "+str(u.AWARD_PERFECT))
 print("sizes 288 60 272 332 76 96 60 64 88 72 48 1108 11448 4")
 print("offsets 12 44 12 988 1104 11432")
 return 0
end function
