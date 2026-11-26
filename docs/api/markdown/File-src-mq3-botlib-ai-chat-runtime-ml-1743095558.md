# `src/mq3/botlib/ai_chat_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_runtime`](Package-mq3-botlib-ai-chat-runtime-214978346.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/ai_chat_matches.ml` as `matches` → [src/mq3/botlib/ai_chat_matches.ml](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)
- `mq3/botlib/ai_chat_output.ml` as `output` → [src/mq3/botlib/ai_chat_output.ml](File-src-mq3-botlib-ai-chat-output-ml-737978343.md)
- `mq3/botlib/ai_chat_profiles.ml` as `profiles` → [src/mq3/botlib/ai_chat_profiles.ml](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)
- `mq3/botlib/ai_chat_strings.ml` as `chatStrings` → [src/mq3/botlib/ai_chat_strings.ml](File-src-mq3-botlib-ai-chat-strings-ml-176982668.md)
- `mq3/botlib/ai_console_messages.ml` as `console` → [src/mq3/botlib/ai_console_messages.ml](File-src-mq3-botlib-ai-console-messages-ml-2082793327.md)
- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.botlib.ai_chat_runtime.AliasContext](Type-mq3-botlib-ai-chat-runtime-aliascontext-1467674987.md) — struct
<a id="function-function-mq3-botlib-ai-chat-runtime-aliasread-function-aliasread-alias-path-src-mq3-botlib-ai-chat-runtime-ml-269897343"></a>
### aliasRead

```ml
function aliasRead(alias, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `alias` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L27)

<a id="function-function-mq3-botlib-ai-chat-runtime-allocconsolemessage-function-allocconsolemessage-state-src-mq3-botlib-ai-chat-runtime-ml-177213331"></a>
### allocConsoleMessage

```ml
function allocConsoleMessage(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L33)

<a id="function-function-mq3-botlib-ai-chat-runtime-botallocchatstate-function-botallocchatstate-state-src-mq3-botlib-ai-chat-runtime-ml-491102995"></a>
### botAllocChatState

```ml
function botAllocChatState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L138)

<a id="function-function-mq3-botlib-ai-chat-runtime-botchatlength-function-botchatlength-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-1552092392"></a>
### botChatLength

```ml
function botChatLength(state, chatState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L126)

<a id="function-function-mq3-botlib-ai-chat-runtime-botchatstatefromhandle-function-botchatstatefromhandle-state-handle-src-mq3-botlib-ai-chat-runtime-ml-1213331611"></a>
### botChatStateFromHandle

```ml
function botChatStateFromHandle(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L139)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckchatmessageintegrety-function-botcheckchatmessageintegrety-message-stringlist-src-mq3-botlib-ai-chat-runtime-ml-630138520"></a>
### botCheckChatMessageIntegrety

```ml
function botCheckChatMessageIntegrety(message, stringList)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |
| `stringList` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L87)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckinitialchatintegrety-function-botcheckinitialchatintegrety-state-chat-src-mq3-botlib-ai-chat-runtime-ml-1441054411"></a>
### botCheckInitialChatIntegrety

```ml
function botCheckInitialChatIntegrety(state, chat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L90)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckreplychatintegrety-function-botcheckreplychatintegrety-state-replychat-src-mq3-botlib-ai-chat-runtime-ml-1155178537"></a>
### botCheckReplyChatIntegrety

```ml
function botCheckReplyChatIntegrety(state, replyChat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `replyChat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L93)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckvalidreplychatkeyset-function-botcheckvalidreplychatkeyset-keys-src-mq3-botlib-ai-chat-runtime-ml-214876426"></a>
### botCheckValidReplyChatKeySet

```ml
function botCheckValidReplyChatKeySet(keys)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L98)

<a id="function-function-mq3-botlib-ai-chat-runtime-botchooseinitialchatmessage-function-botchooseinitialchatmessage-state-chatstate-type-src-mq3-botlib-ai-chat-runtime-ml-1237214224"></a>
### botChooseInitialChatMessage

```ml
function botChooseInitialChatMessage(state, chatState, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L115)

<a id="function-function-mq3-botlib-ai-chat-runtime-botconstructchatmessage-function-botconstructchatmessage-state-message-variables-messagecontext-variablecontext-reply-src-mq3-botlib-ai-chat-runtime-ml-1939872094"></a>
### botConstructChatMessage

```ml
function botConstructChatMessage(state, message, variables, messageContext, variableContext, reply)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |
| `messageContext` | `dynamic` | — |  |
| `variableContext` | `dynamic` | — |  |
| `reply` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L114)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpinitialchat-function-botdumpinitialchat-state-chat-src-mq3-botlib-ai-chat-runtime-ml-140273299"></a>
### botDumpInitialChat

```ml
function botDumpInitialChat(state, chat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L105)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpmatchtemplates-function-botdumpmatchtemplates-state-templates-src-mq3-botlib-ai-chat-runtime-ml-658668488"></a>
### botDumpMatchTemplates

```ml
function botDumpMatchTemplates(state, templates)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `templates` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L71)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumprandomstringlist-function-botdumprandomstringlist-state-randomlist-src-mq3-botlib-ai-chat-runtime-ml-1755251110"></a>
### botDumpRandomStringList

```ml
function botDumpRandomStringList(state, randomList)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `randomList` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L63)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpreplychat-function-botdumpreplychat-state-replychat-src-mq3-botlib-ai-chat-runtime-ml-1824466893"></a>
### botDumpReplyChat

```ml
function botDumpReplyChat(state, replyChat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `replyChat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L96)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpsynonymlist-function-botdumpsynonymlist-state-synonymlist-src-mq3-botlib-ai-chat-runtime-ml-26884824"></a>
### botDumpSynonymList

```ml
function botDumpSynonymList(state, synonymList)
```

Synonyms, random strings and matches -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `synonymList` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L57)

<a id="function-function-mq3-botlib-ai-chat-runtime-botenterchat-function-botenterchat-state-chatstate-clientto-sendto-src-mq3-botlib-ai-chat-runtime-ml-1240387429"></a>
### botEnterChat

```ml
function botEnterChat(state, chatState, clientTo, sendTo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `clientTo` | `dynamic` | — |  |
| `sendTo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L127)

<a id="function-function-mq3-botlib-ai-chat-runtime-botexpandchatmessage-function-botexpandchatmessage-state-message-variables-messagecontext-variablecontext-reply-src-mq3-botlib-ai-chat-runtime-ml-1450302136"></a>
### botExpandChatMessage

```ml
function botExpandChatMessage(state, message, variables, messageContext, variableContext, reply)
```

Construction, selection and delivery -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |
| `messageContext` | `dynamic` | — |  |
| `variableContext` | `dynamic` | — |  |
| `reply` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L111)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfindmatch-function-botfindmatch-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-1826238545"></a>
### botFindMatch

```ml
function botFindMatch(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L77)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfindstringinlist-function-botfindstringinlist-list-value-src-mq3-botlib-ai-chat-runtime-ml-1884543521"></a>
### botFindStringInList

```ml
function botFindStringInList(list, value)
```

Integrity and parsed chat ownership ------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L81)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreechatfile-function-botfreechatfile-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-2053727376"></a>
### botFreeChatFile

```ml
function botFreeChatFile(state, chatState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L107)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreechatstate-function-botfreechatstate-state-handle-src-mq3-botlib-ai-chat-runtime-ml-802016587"></a>
### botFreeChatState

```ml
function botFreeChatState(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L140)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreematchpieces-function-botfreematchpieces-pieces-src-mq3-botlib-ai-chat-runtime-ml-586778099"></a>
### botFreeMatchPieces

```ml
function botFreeMatchPieces(pieces)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pieces` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L72)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreematchtemplates-function-botfreematchtemplates-state-src-mq3-botlib-ai-chat-runtime-ml-528440495"></a>
### botFreeMatchTemplates

```ml
function botFreeMatchTemplates(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L74)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreereplychat-function-botfreereplychat-state-src-mq3-botlib-ai-chat-runtime-ml-214081221"></a>
### botFreeReplyChat

```ml
function botFreeReplyChat(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L97)

<a id="function-function-mq3-botlib-ai-chat-runtime-botgetchatmessage-function-botgetchatmessage-state-chatstate-size-src-mq3-botlib-ai-chat-runtime-ml-410627077"></a>
### botGetChatMessage

```ml
function botGetChatMessage(state, chatState, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L128)

<a id="function-function-mq3-botlib-ai-chat-runtime-botinitialchat-function-botinitialchat-state-chatstate-type-messagecontext-variables-src-mq3-botlib-ai-chat-runtime-ml-1134497943"></a>
### botInitialChat

```ml
function botInitialChat(state, chatState, type, messageContext, variables)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `messageContext` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L121)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadchatfile-function-botloadchatfile-state-chatstate-chatfile-chatname-src-mq3-botlib-ai-chat-runtime-ml-535120319"></a>
### botLoadChatFile

```ml
function botLoadChatFile(state, chatState, chatFile, chatName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `chatFile` | `dynamic` | — |  |
| `chatName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L108)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadchatmessage-function-botloadchatmessage-registry-source-firsttoken-src-mq3-botlib-ai-chat-runtime-ml-499882445"></a>
### botLoadChatMessage

```ml
function botLoadChatMessage(registry, source, firstToken)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `firstToken` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L62)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadinitialchat-function-botloadinitialchat-state-chatfile-chatname-src-mq3-botlib-ai-chat-runtime-ml-31237822"></a>
### botLoadInitialChat

```ml
function botLoadInitialChat(state, chatFile, chatName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatFile` | `dynamic` | — |  |
| `chatName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L106)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadmatchpieces-function-botloadmatchpieces-registry-source-firsttoken-src-mq3-botlib-ai-chat-runtime-ml-1268825941"></a>
### botLoadMatchPieces

```ml
function botLoadMatchPieces(registry, source, firstToken)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `firstToken` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L73)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadmatchtemplates-function-botloadmatchtemplates-state-filename-src-mq3-botlib-ai-chat-runtime-ml-201629788"></a>
### botLoadMatchTemplates

```ml
function botLoadMatchTemplates(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L75)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadrandomstrings-function-botloadrandomstrings-state-filename-src-mq3-botlib-ai-chat-runtime-ml-477271610"></a>
### botLoadRandomStrings

```ml
function botLoadRandomStrings(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L64)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadreplychat-function-botloadreplychat-state-filename-src-mq3-botlib-ai-chat-runtime-ml-1736798174"></a>
### botLoadReplyChat

```ml
function botLoadReplyChat(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L101)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadsynonyms-function-botloadsynonyms-state-filename-src-mq3-botlib-ai-chat-runtime-ml-356618068"></a>
### botLoadSynonyms

```ml
function botLoadSynonyms(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L58)

<a id="function-function-mq3-botlib-ai-chat-runtime-botmatchvariable-function-botmatchvariable-match-variable-size-src-mq3-botlib-ai-chat-runtime-ml-2124121122"></a>
### botMatchVariable

```ml
function botMatchVariable(match, variable, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `match` | `dynamic` | — |  |
| `variable` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L78)

<a id="function-function-mq3-botlib-ai-chat-runtime-botnextconsolemessage-function-botnextconsolemessage-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-1800204510"></a>
### botNextConsoleMessage

```ml
function botNextConsoleMessage(state, chatState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L39)

<a id="function-function-mq3-botlib-ai-chat-runtime-botnumconsolemessages-function-botnumconsolemessages-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-1748854986"></a>
### botNumConsoleMessages

```ml
function botNumConsoleMessages(state, chatState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L40)

<a id="function-function-mq3-botlib-ai-chat-runtime-botnuminitialchats-function-botnuminitialchats-state-chatstate-type-src-mq3-botlib-ai-chat-runtime-ml-266164330"></a>
### botNumInitialChats

```ml
function botNumInitialChats(state, chatState, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L118)

<a id="function-function-mq3-botlib-ai-chat-runtime-botprintreplychatkeys-function-botprintreplychatkeys-state-replychat-src-mq3-botlib-ai-chat-runtime-ml-1710393913"></a>
### botPrintReplyChatKeys

```ml
function botPrintReplyChatKeys(state, replyChat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `replyChat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L122)

<a id="function-function-mq3-botlib-ai-chat-runtime-botqueueconsolemessage-function-botqueueconsolemessage-state-chatstate-type-message-src-mq3-botlib-ai-chat-runtime-ml-665692047"></a>
### botQueueConsoleMessage

```ml
function botQueueConsoleMessage(state, chatState, type, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L37)

<a id="function-function-mq3-botlib-ai-chat-runtime-botremoveconsolemessage-function-botremoveconsolemessage-state-chatstate-handle-src-mq3-botlib-ai-chat-runtime-ml-1927954822"></a>
### botRemoveConsoleMessage

```ml
function botRemoveConsoleMessage(state, chatState, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L38)

<a id="function-function-mq3-botlib-ai-chat-runtime-botremovetildes-function-botremovetildes-message-src-mq3-botlib-ai-chat-runtime-ml-652196063"></a>
### botRemoveTildes

```ml
function botRemoveTildes(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L44)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplacereplysynonyms-function-botreplacereplysynonyms-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-1085673187"></a>
### botReplaceReplySynonyms

```ml
function botReplaceReplySynonyms(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L61)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplacesynonyms-function-botreplacesynonyms-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-581446721"></a>
### botReplaceSynonyms

```ml
function botReplaceSynonyms(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L59)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplaceweightedsynonyms-function-botreplaceweightedsynonyms-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-453414589"></a>
### botReplaceWeightedSynonyms

```ml
function botReplaceWeightedSynonyms(state, value, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L60)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplychat-function-botreplychat-state-chatstate-message-messagecontext-variablecontext-variables-src-mq3-botlib-ai-chat-runtime-ml-276075553"></a>
### botReplyChat

```ml
function botReplyChat(state, chatState, message, messageContext, variableContext, variables)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `messageContext` | `dynamic` | — |  |
| `variableContext` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L125)

<a id="function-function-mq3-botlib-ai-chat-runtime-botresetchatai-function-botresetchatai-state-src-mq3-botlib-ai-chat-runtime-ml-825793621"></a>
### botResetChatAI

```ml
function botResetChatAI(state)
```

Global and per-client lifecycle ----------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L135)

<a id="function-function-mq3-botlib-ai-chat-runtime-botsetchatgender-function-botsetchatgender-state-chatstate-gender-src-mq3-botlib-ai-chat-runtime-ml-996898985"></a>
### botSetChatGender

```ml
function botSetChatGender(state, chatState, gender)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `gender` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L131)

<a id="function-function-mq3-botlib-ai-chat-runtime-botsetchatname-function-botsetchatname-state-chatstate-name-client-src-mq3-botlib-ai-chat-runtime-ml-701230058"></a>
### botSetChatName

```ml
function botSetChatName(state, chatState, name, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatState` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L132)

<a id="function-function-mq3-botlib-ai-chat-runtime-botsetupchatai-function-botsetupchatai-state-nochat-consolecapacity-src-mq3-botlib-ai-chat-runtime-ml-793578661"></a>
### botSetupChatAI

```ml
function botSetupChatAI(state, noChat, consoleCapacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `noChat` | `dynamic` | — |  |
| `consoleCapacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L143)

<a id="function-function-mq3-botlib-ai-chat-runtime-botshutdownchatai-function-botshutdownchatai-state-src-mq3-botlib-ai-chat-runtime-ml-94641675"></a>
### botShutdownChatAI

```ml
function botShutdownChatAI(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L148)

<a id="function-function-mq3-botlib-ai-chat-runtime-create-function-create-context-readfn-timefn-randomfn-actions-src-mq3-botlib-ai-chat-runtime-ml-1467457490"></a>
### create

```ml
function create(context, readFn, timeFn, randomFn, actions)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |
| `timeFn` | `dynamic` | — |  |
| `randomFn` | `dynamic` | — |  |
| `actions` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L23)

<a id="function-function-mq3-botlib-ai-chat-runtime-freeconsolemessage-function-freeconsolemessage-state-message-src-mq3-botlib-ai-chat-runtime-ml-964716510"></a>
### freeConsoleMessage

```ml
function freeConsoleMessage(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L36)

<a id="function-function-mq3-botlib-ai-chat-runtime-initconsolemessageheap-function-initconsolemessageheap-state-capacity-src-mq3-botlib-ai-chat-runtime-ml-1339773541"></a>
### initConsoleMessageHeap

```ml
function initConsoleMessageHeap(state, capacity)
```

Console-message heap -----------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L32)

<a id="function-function-mq3-botlib-ai-chat-runtime-iswhitespace-function-iswhitespace-value-src-mq3-botlib-ai-chat-runtime-ml-1353399173"></a>
### isWhiteSpace

```ml
function isWhiteSpace(value)
```

Released string helpers -------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L43)

<a id="constant-constant-mq3-botlib-ai-chat-runtime-max-match-variables-const-max-match-variables-8-src-mq3-botlib-ai-chat-runtime-ml-729373249"></a>
### MAX_MATCH_VARIABLES

```ml
const MAX_MATCH_VARIABLES = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L18)

<a id="constant-constant-mq3-botlib-ai-chat-runtime-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-runtime-ml-988947254"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L17)

<a id="function-function-mq3-botlib-ai-chat-runtime-randomreferences-function-randomreferences-message-src-mq3-botlib-ai-chat-runtime-ml-719187467"></a>
### randomReferences

```ml
function randomReferences(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L84)

<a id="function-function-mq3-botlib-ai-chat-runtime-randomstring-function-randomstring-state-name-src-mq3-botlib-ai-chat-runtime-ml-922236276"></a>
### randomString

```ml
function randomString(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L68)

- [mq3.botlib.ai_chat_runtime.State](Type-mq3-botlib-ai-chat-runtime-state-867047953.md) — struct
<a id="function-function-mq3-botlib-ai-chat-runtime-stringcontains-function-stringcontains-value-needle-casesensitive-src-mq3-botlib-ai-chat-runtime-ml-1762846876"></a>
### stringContains

```ml
function stringContains(value, needle, caseSensitive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |
| `caseSensitive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L46)

<a id="function-function-mq3-botlib-ai-chat-runtime-stringcontainsword-function-stringcontainsword-value-needle-casesensitive-src-mq3-botlib-ai-chat-runtime-ml-820848152"></a>
### stringContainsWord

```ml
function stringContainsWord(value, needle, caseSensitive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |
| `caseSensitive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L47)

<a id="function-function-mq3-botlib-ai-chat-runtime-stringreplacewords-function-stringreplacewords-value-synonym-replacement-src-mq3-botlib-ai-chat-runtime-ml-975938624"></a>
### stringReplaceWords

```ml
function stringReplaceWords(value, synonym, replacement)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `synonym` | `dynamic` | — |  |
| `replacement` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L54)

<a id="function-function-mq3-botlib-ai-chat-runtime-stringsmatch-function-stringsmatch-pieces-match-src-mq3-botlib-ai-chat-runtime-ml-1518246150"></a>
### stringsMatch

```ml
function stringsMatch(pieces, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pieces` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L76)

<a id="function-function-mq3-botlib-ai-chat-runtime-unifywhitespaces-function-unifywhitespaces-value-src-mq3-botlib-ai-chat-runtime-ml-545977289"></a>
### unifyWhiteSpaces

```ml
function unifyWhiteSpaces(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L45)
