# `mq3.botlib.ai_predict_visible_position.Result`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-predict-visible-position-ml-125650055.md)

<a id="struct-struct-mq3-botlib-ai-predict-visible-position-result-struct-result-src-mq3-botlib-ai-predict-visible-position-ml-726353679"></a>
## Result

```ml
struct Result
```

`Result` record for ai predict visible position, containing `found`, `target`, `hops` and `reachNums`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L26)

## Members

<a id="field-field-mq3-botlib-ai-predict-visible-position-result-found-found-src-mq3-botlib-ai-predict-visible-position-ml-580695052"></a>
### found

```ml
found
```

True when the requested lookup produced a matching entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L28)

<a id="field-field-mq3-botlib-ai-predict-visible-position-result-hops-hops-src-mq3-botlib-ai-predict-visible-position-ml-1206479452"></a>
### hops

```ml
hops
```

Number of reachability links followed while predicting a visible point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L32)

<a id="field-field-mq3-botlib-ai-predict-visible-position-result-reachnums-reachnums-src-mq3-botlib-ai-predict-visible-position-ml-937416528"></a>
### reachNums

```ml
reachNums
```

Reachability indexes followed while predicting a visible point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L34)

<a id="field-field-mq3-botlib-ai-predict-visible-position-result-target-target-src-mq3-botlib-ai-predict-visible-position-ml-1778964778"></a>
### target

```ml
target
```

Predicted world-space position visible from the requested origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L30)
