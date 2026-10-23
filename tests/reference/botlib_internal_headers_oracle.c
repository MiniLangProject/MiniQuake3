// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#include "../../Quake-III-Arena-original-source/code/game/botlib.h"
#include "../../Quake-III-Arena-original-source/code/game/be_aas.h"
#include "../../Quake-III-Arena-original-source/code/botlib/l_script.h"
#include "../../Quake-III-Arena-original-source/code/botlib/l_precomp.h"
#include "../../Quake-III-Arena-original-source/code/botlib/l_struct.h"
#include "../../Quake-III-Arena-original-source/code/botlib/aasfile.h"
#include "../../Quake-III-Arena-original-source/code/botlib/be_aas_def.h"
#include "../../Quake-III-Arena-original-source/code/botlib/be_ai_weight.h"
#include "../../Quake-III-Arena-original-source/code/botlib/be_interface.h"
#include "../../Quake-III-Arena-original-source/code/botlib/be_aas_funcs.h"
int main(void) {
  printf("%lld\n", (long long)(MAX_EPAIRKEY));
  printf("%lld\n", (long long)(MAX_CLIENTS));
  printf("%lld\n", (long long)(MAX_MODELS));
  printf("%lld\n", (long long)(MAX_SOUNDS));
  printf("%lld\n", (long long)(MAX_CONFIGSTRINGS));
  printf("%lld\n", (long long)(CS_SCORES));
  printf("%lld\n", (long long)(CS_MODELS));
  printf("%lld\n", (long long)(CS_SOUNDS));
  printf("%lld\n", (long long)(MAX_PATH));
  printf("%lld\n", (long long)(CACHETYPE_PORTAL));
  printf("%lld\n", (long long)(CACHETYPE_AREA));
  printf("%lld\n", (long long)(WT_BALANCE));
  printf("%lld\n", (long long)(MAX_WEIGHTS));
  printf("%s\n", PATHSEPERATOR_STR);
  printf("%d\n", (int)PATHSEPERATOR_CHAR);
  printf("%lld\n", (long long)(DEFINE_FIXED));
  printf("%lld\n", (long long)(BUILTIN_LINE));
  printf("%lld\n", (long long)(BUILTIN_FILE));
  printf("%lld\n", (long long)(BUILTIN_DATE));
  printf("%lld\n", (long long)(BUILTIN_TIME));
  printf("%lld\n", (long long)(BUILTIN_STDC));
  printf("%lld\n", (long long)(INDENT_IF));
  printf("%lld\n", (long long)(INDENT_ELSE));
  printf("%lld\n", (long long)(INDENT_ELIF));
  printf("%lld\n", (long long)(INDENT_IFDEF));
  printf("%lld\n", (long long)(INDENT_IFNDEF));
  printf("%lld\n", (long long)(MAX_TOKENLENGTH));
  printf("%lld\n", (long long)(MAX_TOKEN));
  printf("%lld\n", (long long)(SCFL_NOERRORS));
  printf("%lld\n", (long long)(SCFL_NOWARNINGS));
  printf("%lld\n", (long long)(SCFL_NOSTRINGWHITESPACES));
  printf("%lld\n", (long long)(SCFL_NOSTRINGESCAPECHARS));
  printf("%lld\n", (long long)(SCFL_PRIMITIVE));
  printf("%lld\n", (long long)(SCFL_NOBINARYNUMBERS));
  printf("%lld\n", (long long)(SCFL_NONUMBERVALUES));
  printf("%lld\n", (long long)(TT_STRING));
  printf("%lld\n", (long long)(TT_LITERAL));
  printf("%lld\n", (long long)(TT_NUMBER));
  printf("%lld\n", (long long)(TT_NAME));
  printf("%lld\n", (long long)(TT_PUNCTUATION));
  printf("%lld\n", (long long)(TT_DECIMAL));
  printf("%lld\n", (long long)(TT_HEX));
  printf("%lld\n", (long long)(TT_OCTAL));
  printf("%lld\n", (long long)(TT_BINARY));
  printf("%lld\n", (long long)(TT_FLOAT));
  printf("%lld\n", (long long)(TT_INTEGER));
  printf("%lld\n", (long long)(TT_LONG));
  printf("%lld\n", (long long)(TT_UNSIGNED));
  printf("%lld\n", (long long)(P_RSHIFT_ASSIGN));
  printf("%lld\n", (long long)(P_LSHIFT_ASSIGN));
  printf("%lld\n", (long long)(P_PARMS));
  printf("%lld\n", (long long)(P_PRECOMPMERGE));
  printf("%lld\n", (long long)(P_LOGIC_AND));
  printf("%lld\n", (long long)(P_LOGIC_OR));
  printf("%lld\n", (long long)(P_LOGIC_GEQ));
  printf("%lld\n", (long long)(P_LOGIC_LEQ));
  printf("%lld\n", (long long)(P_LOGIC_EQ));
  printf("%lld\n", (long long)(P_LOGIC_UNEQ));
  printf("%lld\n", (long long)(P_MUL_ASSIGN));
  printf("%lld\n", (long long)(P_DIV_ASSIGN));
  printf("%lld\n", (long long)(P_MOD_ASSIGN));
  printf("%lld\n", (long long)(P_ADD_ASSIGN));
  printf("%lld\n", (long long)(P_SUB_ASSIGN));
  printf("%lld\n", (long long)(P_INC));
  printf("%lld\n", (long long)(P_DEC));
  printf("%lld\n", (long long)(P_BIN_AND_ASSIGN));
  printf("%lld\n", (long long)(P_BIN_OR_ASSIGN));
  printf("%lld\n", (long long)(P_BIN_XOR_ASSIGN));
  printf("%lld\n", (long long)(P_RSHIFT));
  printf("%lld\n", (long long)(P_LSHIFT));
  printf("%lld\n", (long long)(P_POINTERREF));
  printf("%lld\n", (long long)(P_CPP1));
  printf("%lld\n", (long long)(P_CPP2));
  printf("%lld\n", (long long)(P_MUL));
  printf("%lld\n", (long long)(P_DIV));
  printf("%lld\n", (long long)(P_MOD));
  printf("%lld\n", (long long)(P_ADD));
  printf("%lld\n", (long long)(P_SUB));
  printf("%lld\n", (long long)(P_ASSIGN));
  printf("%lld\n", (long long)(P_BIN_AND));
  printf("%lld\n", (long long)(P_BIN_OR));
  printf("%lld\n", (long long)(P_BIN_XOR));
  printf("%lld\n", (long long)(P_BIN_NOT));
  printf("%lld\n", (long long)(P_LOGIC_NOT));
  printf("%lld\n", (long long)(P_LOGIC_GREATER));
  printf("%lld\n", (long long)(P_LOGIC_LESS));
  printf("%lld\n", (long long)(P_REF));
  printf("%lld\n", (long long)(P_COMMA));
  printf("%lld\n", (long long)(P_SEMICOLON));
  printf("%lld\n", (long long)(P_COLON));
  printf("%lld\n", (long long)(P_QUESTIONMARK));
  printf("%lld\n", (long long)(P_PARENTHESESOPEN));
  printf("%lld\n", (long long)(P_PARENTHESESCLOSE));
  printf("%lld\n", (long long)(P_BRACEOPEN));
  printf("%lld\n", (long long)(P_BRACECLOSE));
  printf("%lld\n", (long long)(P_SQBRACKETOPEN));
  printf("%lld\n", (long long)(P_SQBRACKETCLOSE));
  printf("%lld\n", (long long)(P_BACKSLASH));
  printf("%lld\n", (long long)(P_PRECOMP));
  printf("%lld\n", (long long)(P_DOLLAR));
  printf("%lld\n", (long long)(MAX_STRINGFIELD));
  printf("%lld\n", (long long)(FT_CHAR));
  printf("%lld\n", (long long)(FT_INT));
  printf("%lld\n", (long long)(FT_FLOAT));
  printf("%lld\n", (long long)(FT_STRING));
  printf("%lld\n", (long long)(FT_STRUCT));
  printf("%lld\n", (long long)(FT_TYPE));
  printf("%lld\n", (long long)(FT_ARRAY));
  printf("%lld\n", (long long)(FT_BOUNDED));
  printf("%lld\n", (long long)(FT_UNSIGNED));
  printf("ABI,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u\n",(unsigned)sizeof(aas_stringindex_t),(unsigned)sizeof(aas_link_t),(unsigned)sizeof(bsp_link_t),(unsigned)sizeof(bsp_entdata_t),(unsigned)sizeof(aas_entity_t),(unsigned)sizeof(aas_settings_t),(unsigned)sizeof(aas_routingcache_t),(unsigned)sizeof(aas_routingupdate_t),(unsigned)sizeof(aas_reversedlink_t),(unsigned)sizeof(aas_reversedreachability_t),(unsigned)sizeof(aas_reachabilityareas_t),(unsigned)sizeof(aas_t),(unsigned)sizeof(fuzzyseperator_t),(unsigned)sizeof(weight_t),(unsigned)sizeof(weightconfig_t),(unsigned)sizeof(botlib_globals_t),(unsigned)sizeof(define_t),(unsigned)sizeof(indent_t),(unsigned)sizeof(source_t),(unsigned)sizeof(pc_token_t),(unsigned)sizeof(punctuation_t),(unsigned)sizeof(token_t),(unsigned)sizeof(script_t),(unsigned)sizeof(fielddef_t),(unsigned)sizeof(structdef_t));
  return 0;
}
