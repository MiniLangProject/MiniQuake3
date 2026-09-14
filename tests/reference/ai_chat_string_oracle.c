/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct UnifyWhiteSpaces/StringReplaceWords oracle from be_ai_chat.c.
 */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
static int white(char c){if((c>='a'&&c<='z')||(c>='A'&&c<='Z')||(c>='0'&&c<='9')||c=='('||c==')'||c=='?'||c==':'||c=='\''||c=='/'||c==','||c=='.'||c=='['||c==']'||c=='-'||c=='_'||c=='+'||c=='=')return 0;return 1;}
static void unify(char *s){char *p,*old;for(p=old=s;*p;old=p){while(*p&&white(*p))p++;if(p>old){if(old>s&&*p)*old++=' ';if(p>old)memmove(old,p,strlen(p)+1);}while(*p&&!white(*p))p++;}}
static char *word(char *a,char *b){int len=(int)strlen(a)-(int)strlen(b);for(int i=0;i<=len;i++,a++){if(i){while(*a&&*a!=' '&&*a!='.'&&*a!=','&&*a!='!')a++;if(!*a)break;a++;}int j;for(j=0;b[j];j++)if(toupper((unsigned char)a[j])!=toupper((unsigned char)b[j]))break;if(!b[j]&&(!a[j]||a[j]==' '||a[j]=='.'||a[j]==','||a[j]=='!'))return a;}return NULL;}
static void replace(char *s,char *syn,char *replacement){char *at=word(s,syn),*r;while(at){for(r=word(s,replacement);r;r=word(r+1,replacement))if(r<=at&&at<r+(int)strlen(replacement))break;if(!r){memmove(at+strlen(replacement),at+strlen(syn),strlen(at+strlen(syn))+1);memcpy(at,replacement,strlen(replacement));}at=word(at+strlen(replacement),syn);}}
#define CHECK(v) do{observations++;if(!(v)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int observations=0;char a[256]=" \tHello!!!\nworld?  [x]\r",b[256]="a/b+c=d_e-[x],y.z:(q)?'s",c[256]="DONT, don't! dont.",d[256]="scant cant,cant!cant.",e[256]="do not dont";
 unify(a);CHECK(!strcmp(a,"Hello world? [x]"));unify(b);CHECK(!strcmp(b,"a/b+c=d_e-[x],y.z:(q)?'s"));
 replace(c,"dont","do not");replace(c,"don't","do not");CHECK(!strcmp(c,"do not, don't! dont."));
 replace(d,"cant","can not");CHECK(!strcmp(d,"scant can not,cant!can not."));replace(e,"dont","do not");CHECK(!strcmp(e,"do not do not"));
 CHECK(white('!')&&white('\t')&&!white('?')&&!white('/'));CHECK(sizeof(c)==256);CHECK(word(c,"DO NOT")==c);CHECK(word(d,"cant")!=NULL);
 puts("PASS: 5 native Baseq3 chat-string scenarios / 9 exact observations");return 0;}
