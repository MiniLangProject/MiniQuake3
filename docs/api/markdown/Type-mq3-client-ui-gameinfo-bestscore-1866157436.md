# `mq3.client.ui_gameinfo.BestScore`

[Home](README.md) · [Source file](File-src-mq3-client-ui-gameinfo-ml-965434910.md)

<a id="struct-struct-mq3-client-ui-gameinfo-bestscore-struct-bestscore-src-mq3-client-ui-gameinfo-ml-1170017405"></a>
## BestScore

```ml
struct BestScore
```

Stores UI gameinfo best score record, including `score`, `skill`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L74)

## Members

<a id="field-field-mq3-client-ui-gameinfo-bestscore-score-score-src-mq3-client-ui-gameinfo-ml-1492960417"></a>
### score

```ml
score
```

Best recorded single-player finishing place from 1 through 8; zero means no recorded result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L76)

<a id="field-field-mq3-client-ui-gameinfo-bestscore-skill-skill-src-mq3-client-ui-gameinfo-ml-929822341"></a>
### skill

```ml
skill
```

When constructing this record, `UI_GetBestScore` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L78)
