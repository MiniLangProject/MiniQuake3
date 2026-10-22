/* Extracted unchanged from code/botlib/be_ai_chat.c; only engine typedefs and
 * Com_Memcpy are supplied by this standalone oracle. */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#define qfalse 0
#define qtrue 1
#define Com_Memcpy memcpy

int IsWhiteSpace(char c)
{
	if ((c >= 'a' && c <= 'z')
		|| (c >= 'A' && c <= 'Z')
		|| (c >= '0' && c <= '9')
		|| c == '(' || c == ')'
		|| c == '?' || c == ':'
		|| c == '\''|| c == '/'
		|| c == ',' || c == '.'
		|| c == '['	|| c == ']'
		|| c == '-' || c == '_'
		|| c == '+' || c == '=') return qfalse;
	return qtrue;
}
void BotRemoveTildes(char *message)
{
	int i;
	for (i = 0; message[i]; i++)
	{
		if (message[i] == '~')
		{
			memmove(&message[i], &message[i+1], strlen(&message[i+1])+1);
		}
	}
}
void UnifyWhiteSpaces(char *string)
{
	char *ptr, *oldptr;
	for (ptr = oldptr = string; *ptr; oldptr = ptr)
	{
		while(*ptr && IsWhiteSpace(*ptr)) ptr++;
		if (ptr > oldptr)
		{
			if (oldptr > string && *ptr) *oldptr++ = ' ';
			if (ptr > oldptr) memmove(oldptr, ptr, strlen(ptr)+1);
		}
		while(*ptr && !IsWhiteSpace(*ptr)) ptr++;
	}
}
int StringContains(char *str1, char *str2, int casesensitive)
{
	int len, i, j, index;
	if (str1 == NULL || str2 == NULL) return -1;
	len = (int)(strlen(str1) - strlen(str2));
	index = 0;
	for (i = 0; i <= len; i++, str1++, index++)
	{
		for (j = 0; str2[j]; j++)
		{
			if (casesensitive) { if (str1[j] != str2[j]) break; }
			else { if (toupper((unsigned char)str1[j]) != toupper((unsigned char)str2[j])) break; }
		}
		if (!str2[j]) return index;
	}
	return -1;
}
char *StringContainsWord(char *str1, char *str2, int casesensitive)
{
	int len, i, j;
	len = (int)(strlen(str1) - strlen(str2));
	for (i = 0; i <= len; i++, str1++)
	{
		if (i)
		{
			while(*str1 && *str1 != ' ' && *str1 != '.' && *str1 != ',' && *str1 != '!') str1++;
			if (!*str1) break;
			str1++;
		}
		for (j = 0; str2[j]; j++)
		{
			if (casesensitive) { if (str1[j] != str2[j]) break; }
			else { if (toupper((unsigned char)str1[j]) != toupper((unsigned char)str2[j])) break; }
		}
		if (!str2[j])
		{
			if (!str1[j] || str1[j] == ' ' || str1[j] == '.' || str1[j] == ',' || str1[j] == '!') return str1;
		}
	}
	return NULL;
}
void StringReplaceWords(char *string, char *synonym, char *replacement)
{
	char *str, *str2;
	str = StringContainsWord(string, synonym, qfalse);
	while(str)
	{
		str2 = StringContainsWord(string, replacement, qfalse);
		while(str2)
		{
			if (str2 <= str && str < str2 + strlen(replacement)) break;
			str2 = StringContainsWord(str2+1, replacement, qfalse);
		}
		if (!str2)
		{
			memmove(str + strlen(replacement), str+strlen(synonym), strlen(str+strlen(synonym))+1);
			Com_Memcpy(str, replacement, strlen(replacement));
		}
		str = StringContainsWord(str+strlen(replacement), synonym, qfalse);
	}
}
int main(void) {
    char tildes[64]="a~~b~c~~~"; char spaces[64]=" \tAlpha\n\n(beta)  gamma ";
    char replaced[128]="cant cant canonical can't";
    BotRemoveTildes(tildes); UnifyWhiteSpaces(spaces); StringReplaceWords(replaced,"cant","canonical");
    printf("WHITE %d %d %d %d\n",IsWhiteSpace('A'),IsWhiteSpace(' '),IsWhiteSpace('?'),IsWhiteSpace(';'));
    printf("TILDE <%s>\n",tildes); printf("SPACE <%s>\n",spaces);
    printf("CONTAINS %d %d %d\n",StringContains("Alpha beta","BETA",0),StringContains("Alpha beta","BETA",1),StringContains("abc","",0));
    { char words[]="alpha,beta!Gamma"; char *p=StringContainsWord(words,"BETA",0); char *q=StringContainsWord(words,"gamma",1); printf("WORD %d %d\n",p?(int)(p-words):-1,q?(int)(q-words):-1); }
    printf("REPLACE <%s>\n",replaced); return 0;
}
