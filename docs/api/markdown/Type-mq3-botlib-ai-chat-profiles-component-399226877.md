# `mq3.botlib.ai_chat_profiles.Component`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)

<a id="struct-struct-mq3-botlib-ai-chat-profiles-component-struct-component-src-mq3-botlib-ai-chat-profiles-ml-1628890365"></a>
## Component

```ml
struct Component
```

`Component` record for ai chat profiles, containing `kind`, `text` and `number`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L40)

## Members

<a id="field-field-mq3-botlib-ai-chat-profiles-component-kind-kind-src-mq3-botlib-ai-chat-profiles-ml-1291024948"></a>
### kind

```ml
kind
```

Template component discriminator selecting literal, variable, or random text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L42)

<a id="field-field-mq3-botlib-ai-chat-profiles-component-number-number-src-mq3-botlib-ai-chat-profiles-ml-1454111862"></a>
### number

```ml
number
```

Captured-variable index used by a variable-substitution component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L46)

<a id="field-field-mq3-botlib-ai-chat-profiles-component-text-text-src-mq3-botlib-ai-chat-profiles-ml-127951422"></a>
### text

```ml
text
```

Literal text or random-list name associated with the component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L44)
