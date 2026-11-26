# `mq3.botlib.ai_item_weights.Eval`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)

<a id="struct-struct-mq3-botlib-ai-item-weights-eval-struct-eval-src-mq3-botlib-ai-item-weights-ml-520843135"></a>
## Eval

```ml
struct Eval
```

`Eval` record for ai item weights, containing `tokens`, `position` and `valid`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L92)

## Members

<a id="field-field-mq3-botlib-ai-item-weights-eval-position-position-src-mq3-botlib-ai-item-weights-ml-1655735821"></a>
### position

```ml
position
```

Current cursor within the parsed token sequence or open file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L96)

<a id="field-field-mq3-botlib-ai-item-weights-eval-tokens-tokens-src-mq3-botlib-ai-item-weights-ml-1472214243"></a>
### tokens

```ml
tokens
```

Token sequence being evaluated by the parser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L94)

<a id="field-field-mq3-botlib-ai-item-weights-eval-valid-valid-src-mq3-botlib-ai-item-weights-ml-465664035"></a>
### valid

```ml
valid
```

True when the represented entry contains usable data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weights.ml#L98)
