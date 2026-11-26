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
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.botlib.ai_chat_runtime.AliasContext](Type-mq3-botlib-ai-chat-runtime-aliascontext-1467674987.md) — struct
<a id="function-function-mq3-botlib-ai-chat-runtime-aliasread-function-aliasread-alias-path-src-mq3-botlib-ai-chat-runtime-ml-269897343"></a>
### aliasRead

```ml
function aliasRead(alias, path)
```

Redirect the canonical chat file to the requested filename while forwarding all other reads to the original loader.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `alias` | `dynamic` | — | Alias record; accesses `canonical`, `runtime` and `requested`. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L75)

<a id="function-function-mq3-botlib-ai-chat-runtime-allocconsolemessage-function-allocconsolemessage-state-src-mq3-botlib-ai-chat-runtime-ml-177213331"></a>
### allocConsoleMessage

```ml
function allocConsoleMessage(state)
```

Allocate a free console-message slot, initialize its timestamp and text, and return void when the heap is exhausted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `console`. May update `state.console.nodes[slot]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L85)

<a id="function-function-mq3-botlib-ai-chat-runtime-botallocchatstate-function-botallocchatstate-state-src-mq3-botlib-ai-chat-runtime-ml-491102995"></a>
### botAllocChatState

```ml
function botAllocChatState(state)
```

Forward `botAllocChatState` to `mq3.botlib.ai_resource_pools.allocChatState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L379)

<a id="function-function-mq3-botlib-ai-chat-runtime-botchatlength-function-botchatlength-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-1552092392"></a>
### botChatLength

```ml
function botChatLength(state, chatState)
```

Forward `botChatLength` to `mq3.botlib.ai_chat_output.chatLength` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L346)

<a id="function-function-mq3-botlib-ai-chat-runtime-botchatstatefromhandle-function-botchatstatefromhandle-state-handle-src-mq3-botlib-ai-chat-runtime-ml-1213331611"></a>
### botChatStateFromHandle

```ml
function botChatStateFromHandle(state, handle)
```

Forward `botChatStateFromHandle` to `mq3.botlib.ai_resource_pools.chatState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L383)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckchatmessageintegrety-function-botcheckchatmessageintegrety-message-stringlist-src-mq3-botlib-ai-chat-runtime-ml-630138520"></a>
### botCheckChatMessageIntegrety

```ml
function botCheckChatMessageIntegrety(message, stringList)
```

Collect distinct random-list references missing from the supplied chat string list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `stringList` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L236)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckinitialchatintegrety-function-botcheckinitialchatintegrety-state-chat-src-mq3-botlib-ai-chat-runtime-ml-1441054411"></a>
### botCheckInitialChatIntegrety

```ml
function botCheckInitialChatIntegrety(state, chat)
```

Check every initial-chat message for unresolved random-list references and report distinct missing names.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `chat` | `dynamic` | — | Chat record; accesses `types`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L242)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckreplychatintegrety-function-botcheckreplychatintegrety-state-replychat-src-mq3-botlib-ai-chat-runtime-ml-1155178537"></a>
### botCheckReplyChatIntegrety

```ml
function botCheckReplyChatIntegrety(state, replyChat)
```

Check reply-chat messages for unresolved random-list references and report distinct missing names.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `replyChat` | `dynamic` | — | Value used by `botCheckReplyChatIntegrety` in `if replyChat==void then return ["missing reply chat"] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L248)

<a id="function-function-mq3-botlib-ai-chat-runtime-botcheckvalidreplychatkeyset-function-botcheckvalidreplychatkeyset-keys-src-mq3-botlib-ai-chat-runtime-ml-214876426"></a>
### botCheckValidReplyChatKeySet

```ml
function botCheckValidReplyChatKeySet(keys)
```

Check that a reply key set contains at least one positive key without the AND or NOT modifiers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | `dynamic` | — | Value used by `botCheckValidReplyChatKeySet` in `for each key in keys if (key.flags&output.KEY_AND)==0 and (key.flags&output.KEY_NOT)==0 then positive=true end i...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L260)

<a id="function-function-mq3-botlib-ai-chat-runtime-botchooseinitialchatmessage-function-botchooseinitialchatmessage-state-chatstate-type-src-mq3-botlib-ai-chat-runtime-ml-1237214224"></a>
### botChooseInitialChatMessage

```ml
function botChooseInitialChatMessage(state, chatState, type)
```

Apply `mq3.botlib.ai_resource_pools.chatState`, `mq3.botlib.ai_chat_profiles.typeByName` and `mq3.botlib.ai_chat_output.choose` while evaluating `botChooseInitialChatMessage`. Return paths include `output.choose(selected.messages,state.output,true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools` and `output`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `type` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L312)

<a id="function-function-mq3-botlib-ai-chat-runtime-botconstructchatmessage-function-botconstructchatmessage-state-message-variables-messagecontext-variablecontext-reply-src-mq3-botlib-ai-chat-runtime-ml-1939872094"></a>
### botConstructChatMessage

```ml
function botConstructChatMessage(state, message, variables, messageContext, variableContext, reply)
```

Forward `botConstructChatMessage` to `mq3.botlib.ai_chat_output.construct` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `messageContext` | `dynamic` | — | Context bit mask for selecting and expanding chat messages. |
| `variableContext` | `dynamic` | — | Context bit mask for substituting chat variables. |
| `reply` | `dynamic` | — | Value used by `expandOnce` in `if reply then piece=replaceReplySynonyms(state,piece,vcontext) else if vcontext!=0 and state.strings!=void then...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L307)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpinitialchat-function-botdumpinitialchat-state-chat-src-mq3-botlib-ai-chat-runtime-ml-140273299"></a>
### botDumpInitialChat

```ml
function botDumpInitialChat(state, chat)
```

Set `state.diagnostics` to `state.diagnostics+["initial:"+str(count)]` in `mq3.botlib.ai_chat_runtime.botDumpInitialChat`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place. |
| `chat` | `dynamic` | — | Chat record; accesses `messageCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L273)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpmatchtemplates-function-botdumpmatchtemplates-state-templates-src-mq3-botlib-ai-chat-runtime-ml-658668488"></a>
### botDumpMatchTemplates

```ml
function botDumpMatchTemplates(state, templates)
```

Set `state.diagnostics` to `state.diagnostics+["matches:"+str(len(templates))]` in `mq3.botlib.ai_chat_runtime.botDumpMatchTemplates`. Return paths include `len(templates)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place. |
| `templates` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `botDumpMatchTemplates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L191)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumprandomstringlist-function-botdumprandomstringlist-state-randomlist-src-mq3-botlib-ai-chat-runtime-ml-1755251110"></a>
### botDumpRandomStringList

```ml
function botDumpRandomStringList(state, randomList)
```

Set `state.diagnostics` to `state.diagnostics+["random:"+str(count)]` in `mq3.botlib.ai_chat_runtime.botDumpRandomStringList`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place. |
| `randomList` | `dynamic` | — | Random list record; accesses `messages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L174)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpreplychat-function-botdumpreplychat-state-replychat-src-mq3-botlib-ai-chat-runtime-ml-1824466893"></a>
### botDumpReplyChat

```ml
function botDumpReplyChat(state, replyChat)
```

Set `state.diagnostics` to `state.diagnostics+["replies:"+str(len(replyChat))]` in `mq3.botlib.ai_chat_runtime.botDumpReplyChat`. Return paths include `len(replyChat)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place. |
| `replyChat` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `botDumpReplyChat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L254)

<a id="function-function-mq3-botlib-ai-chat-runtime-botdumpsynonymlist-function-botdumpsynonymlist-state-synonymlist-src-mq3-botlib-ai-chat-runtime-ml-26884824"></a>
### botDumpSynonymList

```ml
function botDumpSynonymList(state, synonymList)
```

Synonyms, random strings and matches -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place. |
| `synonymList` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `botDumpSynonymList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L146)

<a id="function-function-mq3-botlib-ai-chat-runtime-botenterchat-function-botenterchat-state-chatstate-clientto-sendto-src-mq3-botlib-ai-chat-runtime-ml-1240387429"></a>
### botEnterChat

```ml
function botEnterChat(state, chatState, clientTo, sendTo)
```

Forward `botEnterChat` to `mq3.botlib.ai_chat_output.enterChat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `clientTo` | `dynamic` | — | Value passed as argument 1 to `str`. |
| `sendTo` | `dynamic` | — | Value used by `enterChat` in `if sendTo==CHAT_TEAM then result=ea.command(state.actions,cs.client,"say_team "+message) else if sendTo==CHAT_TE...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L352)

<a id="function-function-mq3-botlib-ai-chat-runtime-botexpandchatmessage-function-botexpandchatmessage-state-message-variables-messagecontext-variablecontext-reply-src-mq3-botlib-ai-chat-runtime-ml-1450302136"></a>
### botExpandChatMessage

```ml
function botExpandChatMessage(state, message, variables, messageContext, variableContext, reply)
```

Construction, selection and delivery -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `messageContext` | `dynamic` | — | Context bit mask for selecting and expanding chat messages. |
| `variableContext` | `dynamic` | — | Context bit mask for substituting chat variables. |
| `reply` | `dynamic` | — | Value used by `expandOnce` in `if reply then piece=replaceReplySynonyms(state,piece,vcontext) else if vcontext!=0 and state.strings!=void then...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L297)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfindmatch-function-botfindmatch-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-1826238545"></a>
### botFindMatch

```ml
function botFindMatch(state, value, context)
```

Forward `botFindMatch` to `mq3.botlib.ai_chat_matches.findMatch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `matches`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L215)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfindstringinlist-function-botfindstringinlist-list-value-src-mq3-botlib-ai-chat-runtime-ml-1884543521"></a>
### botFindStringInList

```ml
function botFindStringInList(list, value)
```

Integrity and parsed chat ownership ------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L225)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreechatfile-function-botfreechatfile-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-2053727376"></a>
### botFreeChatFile

```ml
function botFreeChatFile(state, chatState)
```

Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `botFreeChatFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L282)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreechatstate-function-botfreechatstate-state-handle-src-mq3-botlib-ai-chat-runtime-ml-802016587"></a>
### botFreeChatState

```ml
function botFreeChatState(state, handle)
```

Apply `mq3.botlib.ai_resource_pools.chatState`, `mq3.botlib.ai_console_messages.clearChat` and `mq3.botlib.ai_chat_runtime.botFreeChatFile` while evaluating `botFreeChatState`. Return paths include `pools.freeChatState(state.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools`, `console` and `profiles`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L387)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreematchpieces-function-botfreematchpieces-pieces-src-mq3-botlib-ai-chat-runtime-ml-586778099"></a>
### botFreeMatchPieces

```ml
function botFreeMatchPieces(pieces)
```

Return an empty match-piece array; the incoming array remains owned by the caller.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pieces` | `dynamic` | — | Not read by this implementation; retained in the `botFreeMatchPieces` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L194)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreematchtemplates-function-botfreematchtemplates-state-src-mq3-botlib-ai-chat-runtime-ml-528440495"></a>
### botFreeMatchTemplates

```ml
function botFreeMatchTemplates(state)
```

Forward `botFreeMatchTemplates` to `mq3.botlib.ai_chat_matches.clear` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `matches`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L202)

<a id="function-function-mq3-botlib-ai-chat-runtime-botfreereplychat-function-botfreereplychat-state-src-mq3-botlib-ai-chat-runtime-ml-214081221"></a>
### botFreeReplyChat

```ml
function botFreeReplyChat(state)
```

Set `state.output.replies` to `[]` in `mq3.botlib.ai_chat_runtime.botFreeReplyChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. May update `state.output.replies` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L257)

<a id="function-function-mq3-botlib-ai-chat-runtime-botgetchatmessage-function-botgetchatmessage-state-chatstate-size-src-mq3-botlib-ai-chat-runtime-ml-410627077"></a>
### botGetChatMessage

```ml
function botGetChatMessage(state, chatState, size)
```

Consume the pending chat message, remove tildes, and truncate the returned bytes to leave space for a terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L357)

<a id="function-function-mq3-botlib-ai-chat-runtime-botinitialchat-function-botinitialchat-state-chatstate-type-messagecontext-variables-src-mq3-botlib-ai-chat-runtime-ml-1134497943"></a>
### botInitialChat

```ml
function botInitialChat(state, chatState, type, messageContext, variables)
```

Forward `botInitialChat` to `mq3.botlib.ai_chat_output.initialChat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `type` | `dynamic` | — | Name used to identify the requested entry. |
| `messageContext` | `dynamic` | — | Context bit mask for selecting and expanding chat messages. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L328)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadchatfile-function-botloadchatfile-state-chatstate-chatfile-chatname-src-mq3-botlib-ai-chat-runtime-ml-535120319"></a>
### botLoadChatFile

```ml
function botLoadChatFile(state, chatState, chatFile, chatName)
```

Forward `botLoadChatFile` to `mq3.botlib.ai_chat_profiles.loadChatFile` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `profiles`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `chatFile` | `dynamic` | — | Bot chat-definition filename. |
| `chatName` | `dynamic` | — | Named chat profile within the chat-definition file. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L288)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadchatmessage-function-botloadchatmessage-registry-source-firsttoken-src-mq3-botlib-ai-chat-runtime-ml-499882445"></a>
### botLoadChatMessage

```ml
function botLoadChatMessage(registry, source, firstToken)
```

Forward `botLoadChatMessage` to `mq3.botlib.ai_chat_profiles.readMessage` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `firstToken` | `dynamic` | — | Value used by `readMessage` in `token=first`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L170)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadinitialchat-function-botloadinitialchat-state-chatfile-chatname-src-mq3-botlib-ai-chat-runtime-ml-31237822"></a>
### botLoadInitialChat

```ml
function botLoadInitialChat(state, chatFile, chatName)
```

Forward `botLoadInitialChat` to `mq3.botlib.ai_chat_profiles.parseProfile` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `profiles`. |
| `chatFile` | `dynamic` | — | Bot chat-definition filename. |
| `chatName` | `dynamic` | — | Named chat profile within the chat-definition file. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L278)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadmatchpieces-function-botloadmatchpieces-registry-source-firsttoken-src-mq3-botlib-ai-chat-runtime-ml-1268825941"></a>
### botLoadMatchPieces

```ml
function botLoadMatchPieces(registry, source, firstToken)
```

Forward `botLoadMatchPieces` to `mq3.botlib.ai_chat_matches.parsePieces` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `source` | `dynamic` | — | Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`. |
| `firstToken` | `dynamic` | — | Value used by `parsePieces` in `nextToken=firstToken`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L199)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadmatchtemplates-function-botloadmatchtemplates-state-filename-src-mq3-botlib-ai-chat-runtime-ml-201629788"></a>
### botLoadMatchTemplates

```ml
function botLoadMatchTemplates(state, filename)
```

Forward `botLoadMatchTemplates` to `mq3.botlib.ai_chat_matches.load` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `matches`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L206)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadrandomstrings-function-botloadrandomstrings-state-filename-src-mq3-botlib-ai-chat-runtime-ml-477271610"></a>
### botLoadRandomStrings

```ml
function botLoadRandomStrings(state, filename)
```

Set `state.output.randomLists` to `values` in `mq3.botlib.ai_chat_runtime.botLoadRandomStrings`. Return paths include `len(values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`, `profiles`, `strings` and `actions`. May update `state.output.randomLists` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L178)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadreplychat-function-botloadreplychat-state-filename-src-mq3-botlib-ai-chat-runtime-ml-1736798174"></a>
### botLoadReplyChat

```ml
function botLoadReplyChat(state, filename)
```

Set `state.output.replies` to `values` in `mq3.botlib.ai_chat_runtime.botLoadReplyChat`. Return paths include `len(values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`, `profiles`, `strings` and `actions`. May update `state.output.replies` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L266)

<a id="function-function-mq3-botlib-ai-chat-runtime-botloadsynonyms-function-botloadsynonyms-state-filename-src-mq3-botlib-ai-chat-runtime-ml-356618068"></a>
### botLoadSynonyms

```ml
function botLoadSynonyms(state, filename)
```

Forward `botLoadSynonyms` to `mq3.botlib.ai_chat_strings.load` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `strings`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L150)

<a id="function-function-mq3-botlib-ai-chat-runtime-botmatchvariable-function-botmatchvariable-match-variable-size-src-mq3-botlib-ai-chat-runtime-ml-2124121122"></a>
### botMatchVariable

```ml
function botMatchVariable(match, variable, size)
```

Forward `botMatchVariable` to `mq3.botlib.ai_chat_matches.matchVariable` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `lengths` and `string`. |
| `variable` | `dynamic` | — | Operand used to evaluate the returned expression `decode(slice(bytes(match.string),match.offsets[variable],count))`. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L220)

<a id="function-function-mq3-botlib-ai-chat-runtime-botnextconsolemessage-function-botnextconsolemessage-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-1800204510"></a>
### botNextConsoleMessage

```ml
function botNextConsoleMessage(state, chatState)
```

Forward `botNextConsoleMessage` to `mq3.botlib.ai_console_messages.next` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `console`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L106)

<a id="function-function-mq3-botlib-ai-chat-runtime-botnumconsolemessages-function-botnumconsolemessages-state-chatstate-src-mq3-botlib-ai-chat-runtime-ml-1748854986"></a>
### botNumConsoleMessages

```ml
function botNumConsoleMessages(state, chatState)
```

Forward `botNumConsoleMessages` to `mq3.botlib.ai_console_messages.count` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `console`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L110)

<a id="function-function-mq3-botlib-ai-chat-runtime-botnuminitialchats-function-botnuminitialchats-state-chatstate-type-src-mq3-botlib-ai-chat-runtime-ml-266164330"></a>
### botNumInitialChats

```ml
function botNumInitialChats(state, chatState, type)
```

Apply `mq3.botlib.ai_resource_pools.chatState` and `mq3.botlib.ai_chat_profiles.typeByName` while evaluating `botNumInitialChats`. Return paths include `len(selected.messages)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `type` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L319)

<a id="function-function-mq3-botlib-ai-chat-runtime-botprintreplychatkeys-function-botprintreplychatkeys-state-replychat-src-mq3-botlib-ai-chat-runtime-ml-1710393913"></a>
### botPrintReplyChatKeys

```ml
function botPrintReplyChatKeys(state, replyChat)
```

Set `state.diagnostics` to `state.diagnostics+["reply-keys:"+str(count)]` in `mq3.botlib.ai_chat_runtime.botPrintReplyChatKeys`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place. |
| `replyChat` | `dynamic` | — | Value used by `botPrintReplyChatKeys` in `for each reply in replyChat count=count+len(reply.keys) end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L332)

<a id="function-function-mq3-botlib-ai-chat-runtime-botqueueconsolemessage-function-botqueueconsolemessage-state-chatstate-type-message-src-mq3-botlib-ai-chat-runtime-ml-665692047"></a>
### botQueueConsoleMessage

```ml
function botQueueConsoleMessage(state, chatState, type, message)
```

Forward `botQueueConsoleMessage` to `mq3.botlib.ai_console_messages.queue` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `console`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `type` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_console_messages.Message.type`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L97)

<a id="function-function-mq3-botlib-ai-chat-runtime-botremoveconsolemessage-function-botremoveconsolemessage-state-chatstate-handle-src-mq3-botlib-ai-chat-runtime-ml-1927954822"></a>
### botRemoveConsoleMessage

```ml
function botRemoveConsoleMessage(state, chatState, handle)
```

Forward `botRemoveConsoleMessage` to `mq3.botlib.ai_console_messages.remove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `console`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L102)

<a id="function-function-mq3-botlib-ai-chat-runtime-botremovetildes-function-botremovetildes-message-src-mq3-botlib-ai-chat-runtime-ml-652196063"></a>
### botRemoveTildes

```ml
function botRemoveTildes(message)
```

Forward `botRemoveTildes` to `mq3.botlib.ai_chat_output.removeTildes` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L117)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplacereplysynonyms-function-botreplacereplysynonyms-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-1085673187"></a>
### botReplaceReplySynonyms

```ml
function botReplaceReplySynonyms(state, value, context)
```

Forward `botReplaceReplySynonyms` to `mq3.botlib.ai_chat_output.replaceReplySynonyms` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L165)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplacesynonyms-function-botreplacesynonyms-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-581446721"></a>
### botReplaceSynonyms

```ml
function botReplaceSynonyms(state, value, context)
```

Forward `botReplaceSynonyms` to `mq3.botlib.ai_chat_strings.replaceSynonyms` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `strings`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L155)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplaceweightedsynonyms-function-botreplaceweightedsynonyms-state-value-context-src-mq3-botlib-ai-chat-runtime-ml-453414589"></a>
### botReplaceWeightedSynonyms

```ml
function botReplaceWeightedSynonyms(state, value, context)
```

Forward `botReplaceWeightedSynonyms` to `mq3.botlib.ai_chat_output.replaceWeightedSynonyms` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L160)

<a id="function-function-mq3-botlib-ai-chat-runtime-botreplychat-function-botreplychat-state-chatstate-message-messagecontext-variablecontext-variables-src-mq3-botlib-ai-chat-runtime-ml-276075553"></a>
### botReplyChat

```ml
function botReplyChat(state, chatState, message, messageContext, variableContext, variables)
```

Forward `botReplyChat` to `mq3.botlib.ai_chat_output.replyChat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `messageContext` | `dynamic` | — | Context bit mask for selecting and expanding chat messages. |
| `variableContext` | `dynamic` | — | Context bit mask for substituting chat variables. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L342)

<a id="function-function-mq3-botlib-ai-chat-runtime-botresetchatai-function-botresetchatai-state-src-mq3-botlib-ai-chat-runtime-ml-825793621"></a>
### botResetChatAI

```ml
function botResetChatAI(state)
```

Global and per-client lifecycle ----------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L374)

<a id="function-function-mq3-botlib-ai-chat-runtime-botsetchatgender-function-botsetchatgender-state-chatstate-gender-src-mq3-botlib-ai-chat-runtime-ml-996898985"></a>
### botSetChatGender

```ml
function botSetChatGender(state, chatState, gender)
```

Forward `botSetChatGender` to `mq3.botlib.ai_chat_profiles.setChatGender` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `profiles`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `gender` | `dynamic` | — | Chat gender identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L364)

<a id="function-function-mq3-botlib-ai-chat-runtime-botsetchatname-function-botsetchatname-state-chatstate-name-client-src-mq3-botlib-ai-chat-runtime-ml-701230058"></a>
### botSetChatName

```ml
function botSetChatName(state, chatState, name, client)
```

Forward `botSetChatName` to `mq3.botlib.ai_chat_profiles.setChatName` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `profiles`. |
| `chatState` | `dynamic` | — | Handle of the pooled bot chat state. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `client` | `dynamic` | — | Value used by `setChatName` in `chatState.client=client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L370)

<a id="function-function-mq3-botlib-ai-chat-runtime-botsetupchatai-function-botsetupchatai-state-nochat-consolecapacity-src-mq3-botlib-ai-chat-runtime-ml-793578661"></a>
### botSetupChatAI

```ml
function botSetupChatAI(state, noChat, consoleCapacity)
```

Update `state.output.replies`, `state.output.loaded` and `state.setup` during `botSetupChatAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `strings`, `matches`, `output` and `setup`. May update `state.output.replies`, `state.output.loaded` and `state.setup` in place. |
| `noChat` | `dynamic` | — | Value used by `botSetupChatAI` in `if noChat then state.output.replies=[] else replyCount=botLoadReplyChat(state,"rchat.c")`. |
| `consoleCapacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L394)

<a id="function-function-mq3-botlib-ai-chat-runtime-botshutdownchatai-function-botshutdownchatai-state-src-mq3-botlib-ai-chat-runtime-ml-94641675"></a>
### botShutdownChatAI

```ml
function botShutdownChatAI(state)
```

Set `state.setup` to `false` in `mq3.botlib.ai_chat_runtime.botShutdownChatAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `pools`, `profiles`, `console`, `matches` and `strings` and related fields. May update `state.setup` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L401)

<a id="function-function-mq3-botlib-ai-chat-runtime-create-function-create-context-readfn-timefn-randomfn-actions-src-mq3-botlib-ai-chat-runtime-ml-1467457490"></a>
### create

```ml
function create(context, readFn, timeFn, randomFn, actions)
```

Build the `mq3.botlib.ai_chat_runtime.State` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |
| `timeFn` | `dynamic` | — | Callback that supplies the current botlib time. |
| `randomFn` | `dynamic` | — | Callback that supplies the random value used by selection. |
| `actions` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_output.State.actions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L68)

<a id="function-function-mq3-botlib-ai-chat-runtime-freeconsolemessage-function-freeconsolemessage-state-message-src-mq3-botlib-ai-chat-runtime-ml-964716510"></a>
### freeConsoleMessage

```ml
function freeConsoleMessage(state, message)
```

Apply `mq3.botlib.ai_console_messages.freeSlot` while evaluating `freeConsoleMessage`. Return paths include `console.freeSlot(state.console,message.slot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `console`. |
| `message` | `dynamic` | — | Message record; accesses `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L91)

<a id="function-function-mq3-botlib-ai-chat-runtime-initconsolemessageheap-function-initconsolemessageheap-state-capacity-src-mq3-botlib-ai-chat-runtime-ml-1339773541"></a>
### initConsoleMessageHeap

```ml
function initConsoleMessageHeap(state, capacity)
```

Console-message heap -----------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `console`. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L82)

<a id="function-function-mq3-botlib-ai-chat-runtime-iswhitespace-function-iswhitespace-value-src-mq3-botlib-ai-chat-runtime-ml-1353399173"></a>
### isWhiteSpace

```ml
function isWhiteSpace(value)
```

Released string helpers -------------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `isWhiteSpace` in `if value>=97 and value<=122 or value>=65 and value<=90 or value>=48 and value<=57 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L114)

<a id="constant-constant-mq3-botlib-ai-chat-runtime-max-match-variables-const-max-match-variables-8-src-mq3-botlib-ai-chat-runtime-ml-729373249"></a>
### MAX_MATCH_VARIABLES

```ml
const MAX_MATCH_VARIABLES = 8
```

Maximum number of captured variables in a bot chat match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L20)

<a id="constant-constant-mq3-botlib-ai-chat-runtime-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-chat-runtime-ml-988947254"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```

Maximum character capacity of a bot chat or console message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L18)

<a id="function-function-mq3-botlib-ai-chat-runtime-randomreferences-function-randomreferences-message-src-mq3-botlib-ai-chat-runtime-ml-719187467"></a>
### randomReferences

```ml
function randomReferences(message)
```

Collect random-list names referenced by the parsed components of a chat message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message record; accesses `components`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L230)

<a id="function-function-mq3-botlib-ai-chat-runtime-randomstring-function-randomstring-state-name-src-mq3-botlib-ai-chat-runtime-ml-922236276"></a>
### randomString

```ml
function randomString(state, name)
```

Apply `mq3.botlib.ai_chat_output.ensureLoaded`, `mq3.botlib.ai_chat_output.randomList` and `mq3.botlib.ai_chat_output.choose` while evaluating `randomString`. Return paths include `selected.encoded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat runtime state; accesses `output`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L185)

- [mq3.botlib.ai_chat_runtime.State](Type-mq3-botlib-ai-chat-runtime-state-867047953.md) — struct
<a id="function-function-mq3-botlib-ai-chat-runtime-stringcontains-function-stringcontains-value-needle-casesensitive-src-mq3-botlib-ai-chat-runtime-ml-1762846876"></a>
### stringContains

```ml
function stringContains(value, needle, caseSensitive)
```

Forward `stringContains` to `mq3.botlib.ai_chat_matches.stringContains` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `needle` | `dynamic` | — | Text or value to search for. |
| `caseSensitive` | `dynamic` | — | Whether comparisons distinguish letter case. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L125)

<a id="function-function-mq3-botlib-ai-chat-runtime-stringcontainsword-function-stringcontainsword-value-needle-casesensitive-src-mq3-botlib-ai-chat-runtime-ml-820848152"></a>
### stringContainsWord

```ml
function stringContainsWord(value, needle, caseSensitive)
```

Find a complete word with optional case sensitivity and return its byte offset, or -1 when no word matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `needle` | `dynamic` | — | Text or value to search for. |
| `caseSensitive` | `dynamic` | — | Whether comparisons distinguish letter case. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L130)

<a id="function-function-mq3-botlib-ai-chat-runtime-stringreplacewords-function-stringreplacewords-value-synonym-replacement-src-mq3-botlib-ai-chat-runtime-ml-975938624"></a>
### stringReplaceWords

```ml
function stringReplaceWords(value, synonym, replacement)
```

Forward `stringReplaceWords` to `mq3.botlib.ai_chat_strings.replaceWords` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `synonym` | `dynamic` | — | Word or synonym selected for replacement. |
| `replacement` | `dynamic` | — | Text substituted for a matching word or token. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L141)

<a id="function-function-mq3-botlib-ai-chat-runtime-stringsmatch-function-stringsmatch-pieces-match-src-mq3-botlib-ai-chat-runtime-ml-1518246150"></a>
### stringsMatch

```ml
function stringsMatch(pieces, match)
```

Forward `stringsMatch` to `mq3.botlib.ai_chat_matches.stringsMatch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pieces` | `dynamic` | — | Value used by `stringsMatch` in `for each piece in pieces`. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `string` and `lengths`. May update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L210)

<a id="function-function-mq3-botlib-ai-chat-runtime-unifywhitespaces-function-unifywhitespaces-value-src-mq3-botlib-ai-chat-runtime-ml-545977289"></a>
### unifyWhiteSpaces

```ml
function unifyWhiteSpaces(value)
```

Forward `unifyWhiteSpaces` to `mq3.botlib.ai_chat_strings.unifyWhiteSpaces` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L120)
