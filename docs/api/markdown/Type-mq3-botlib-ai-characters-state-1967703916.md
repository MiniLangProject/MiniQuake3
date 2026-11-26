# `mq3.botlib.ai_characters.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-characters-ml-311974577.md)

<a id="struct-struct-mq3-botlib-ai-characters-state-struct-state-src-mq3-botlib-ai-characters-ml-383156547"></a>
## State

```ml
struct State
```

`State` record for ai characters, containing `maxClients`, `characters`, `context`, `readFn` and `reloadCharacters` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L66)

## Members

<a id="field-field-mq3-botlib-ai-characters-state-characters-characters-src-mq3-botlib-ai-characters-ml-1066538486"></a>
### characters

```ml
characters
```

Loaded bot-character definitions retained for reuse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L70)

<a id="field-field-mq3-botlib-ai-characters-state-context-context-src-mq3-botlib-ai-characters-ml-1457259982"></a>
### context

```ml
context
```

Caller-supplied data associated with reading and caching bot personality definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L72)

<a id="field-field-mq3-botlib-ai-characters-state-filereads-filereads-src-mq3-botlib-ai-characters-ml-1691584386"></a>
### fileReads

```ml
fileReads
```

Number of source-file reads performed through the loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L78)

<a id="field-field-mq3-botlib-ai-characters-state-maxclients-maxclients-src-mq3-botlib-ai-characters-ml-2078984726"></a>
### maxClients

```ml
maxClients
```

Client limit used to size and bound the bot character-handle cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L68)

<a id="field-field-mq3-botlib-ai-characters-state-readfn-readfn-src-mq3-botlib-ai-characters-ml-820012030"></a>
### readFn

```ml
readFn
```

Host callback that loads bot personality files for the character cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L74)

<a id="field-field-mq3-botlib-ai-characters-state-reloadcharacters-reloadcharacters-src-mq3-botlib-ai-characters-ml-268106088"></a>
### reloadCharacters

```ml
reloadCharacters
```

True when bot definitions should be reloaded instead of reused from cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_characters.ml#L76)
