#include <stdio.h>
#include <string.h>
#include <assert.h>
static const char s_ascii_encoding[]="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]";
enum {GR_STATUS_OK,GR_STATUS_ERROR,GR_STATUS_BADPARAMS,GR_STATUS_NETWORK,GR_STATUS_NOUSER,GR_STATUS_BADPASSWORD,GR_STATUS_BADGAME,GR_STATUS_PENDING,GR_STATUS_BADDOMAIN,GR_STATUS_DOMAINLOCK,GR_STATUS_TIMEOUT,GR_STATUS_INVALIDUSER,GR_STATUS_INVALIDCONTEXT};
typedef int GR_STATUS;
#include "rankings_server_under_test.inc"
static void dump(const unsigned char *p,int n){int i;for(i=0;i<n;i++)printf("%s%u",i?",":"",p[i]);puts("");}
int main(void){unsigned char a[]={0,1,2,3,254,255},out[32];char text[32];int n;
 n=SV_RankAsciiEncode(text,a,6);printf("enc=%s:%d\n",text,n);n=SV_RankAsciiDecode(out,text,n);printf("dec=");dump(out,n);
 printf("invalid=%d\n",SV_RankAsciiDecode(out,"!",1));printf("status=%s,%s,%s\n",SV_RankStatusString(GR_STATUS_OK),SV_RankStatusString(GR_STATUS_TIMEOUT),SV_RankStatusString(99));return 0;}
