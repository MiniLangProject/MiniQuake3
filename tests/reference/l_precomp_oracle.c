/* Unchanged decision helpers extracted from code/botlib/l_precomp.c. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define qtrue 1
#define qfalse 0
#define DEFINEHASHSIZE 1024
#define MAX_TOKEN 1024
#define TT_STRING 1
#define TT_NUMBER 3
#define TT_NAME 4
#define PATHSEPERATOR_CHAR '/'
#define P_LOGIC_AND 5
#define P_LOGIC_OR 6
#define P_LOGIC_GEQ 7
#define P_LOGIC_LEQ 8
#define P_LOGIC_EQ 9
#define P_LOGIC_UNEQ 10
#define P_RSHIFT 21
#define P_LSHIFT 22
#define P_MUL 26
#define P_DIV 27
#define P_MOD 28
#define P_ADD 29
#define P_SUB 30
#define P_BIN_AND 32
#define P_BIN_OR 33
#define P_BIN_XOR 34
#define P_BIN_NOT 35
#define P_LOGIC_NOT 36
#define P_LOGIC_GREATER 37
#define P_LOGIC_LESS 38
#define P_COLON 42
#define P_QUESTIONMARK 43

typedef struct { int type; char string[MAX_TOKEN]; const char *whitespace_p,*endwhitespace_p; int linescrossed; } token_t;
static void require(int condition,const char *message){if(!condition){fprintf(stderr,"FAIL: %s\n",message);exit(1);}}

int PC_MergeTokens(token_t *t1, token_t *t2)
{
	if (t1->type == TT_NAME && (t2->type == TT_NAME || t2->type == TT_NUMBER))
	{
		strcat(t1->string, t2->string);
		return qtrue;
	}
	if (t1->type == TT_STRING && t2->type == TT_STRING)
	{
		t1->string[strlen(t1->string)-1] = '\0';
		strcat(t1->string, &t2->string[1]);
		return qtrue;
	}
	return qfalse;
}

int PC_NameHash(char *name)
{
	int hash, i;
	hash = 0;
	for (i = 0; name[i] != '\0'; i++) hash += name[i] * (119 + i);
	hash = (hash ^ (hash >> 10) ^ (hash >> 20)) & (DEFINEHASHSIZE-1);
	return hash;
}

void PC_ConvertPath(char *path)
{
	char *ptr;
	for (ptr = path; *ptr;)
	{
		if ((*ptr == '\\' || *ptr == '/') && (*(ptr+1) == '\\' || *(ptr+1) == '/')) strcpy(ptr, ptr+1);
		else ptr++;
	}
	for (ptr = path; *ptr;)
	{
		if (*ptr == '/' || *ptr == '\\') *ptr = PATHSEPERATOR_CHAR;
		ptr++;
	}
}

int PC_WhiteSpaceBeforeToken(token_t *token) { return token->endwhitespace_p - token->whitespace_p > 0; }
void PC_ClearTokenWhiteSpace(token_t *token) { token->whitespace_p = NULL; token->endwhitespace_p = NULL; token->linescrossed = 0; }

int PC_OperatorPriority(int op)
{
	switch(op)
	{
		case P_MUL: return 15; case P_DIV: return 15; case P_MOD: return 15;
		case P_ADD: return 14; case P_SUB: return 14;
		case P_LOGIC_AND: return 7; case P_LOGIC_OR: return 6;
		case P_LOGIC_GEQ: return 12; case P_LOGIC_LEQ: return 12;
		case P_LOGIC_EQ: return 11; case P_LOGIC_UNEQ: return 11;
		case P_LOGIC_NOT: return 16; case P_LOGIC_GREATER: return 12; case P_LOGIC_LESS: return 12;
		case P_RSHIFT: return 13; case P_LSHIFT: return 13;
		case P_BIN_AND: return 10; case P_BIN_OR: return 8; case P_BIN_XOR: return 9; case P_BIN_NOT: return 16;
		case P_COLON: return 5; case P_QUESTIONMARK: return 5;
	}
	return qfalse;
}

int main(void)
{
	int count=0;char path[64]="a//b\\\\c/";token_t a={TT_NAME,"foo",0},b={TT_NAME,"bar",0},num={TT_NUMBER,"12",0},s1={TT_STRING,"\"hello\"",0},s2={TT_STRING,"\"world\"",0};char ws[]="  ";
	require(PC_NameHash("test")==723,"name hash test");count++;
	require(PC_NameHash("__LINE__")==802,"name hash builtin");count++;
	require(PC_MergeTokens(&a,&b)&&!strcmp(a.string,"foobar"),"merge names");count++;
	require(PC_MergeTokens(&a,&num)&&!strcmp(a.string,"foobar12"),"merge number");count++;
	require(PC_MergeTokens(&s1,&s2)&&!strcmp(s1.string,"\"helloworld\""),"merge strings");count++;
	PC_ConvertPath(path);require(!strcmp(path,"a/b/c/"),"convert path");count++;
	a.whitespace_p=ws;a.endwhitespace_p=ws+2;a.linescrossed=2;require(PC_WhiteSpaceBeforeToken(&a),"whitespace");count++;
	PC_ClearTokenWhiteSpace(&a);require(!a.whitespace_p&&!a.endwhitespace_p&&a.linescrossed==0,"clear whitespace");count++;
	int ops[][2]={{P_MUL,15},{P_DIV,15},{P_MOD,15},{P_ADD,14},{P_SUB,14},{P_LOGIC_AND,7},{P_LOGIC_OR,6},{P_LOGIC_GEQ,12},{P_LOGIC_EQ,11},{P_LOGIC_NOT,16},{P_RSHIFT,13},{P_BIN_AND,10},{P_BIN_XOR,9},{P_BIN_OR,8},{P_COLON,5},{P_QUESTIONMARK,5},{999,0}};
	for(size_t i=0;i<sizeof(ops)/sizeof(ops[0]);i++){require(PC_OperatorPriority(ops[i][0])==ops[i][1],"operator priority");count++;}
	printf("PASS: %d unchanged-C l_precomp observations\n",count);return 0;
}
