# `mq3.game.rankings.Action`

[Home](README.md) · [Source file](File-src-mq3-game-rankings-ml-1165926525.md)

<a id="struct-struct-mq3-game-rankings-action-struct-action-src-mq3-game-rankings-ml-16637419"></a>
## Action

```ml
struct Action
```

`Action` record for rankings, containing `kind`, `client`, `text` and `value`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L302)

## Members

<a id="field-field-mq3-game-rankings-action-client-client-src-mq3-game-rankings-ml-226443355"></a>
### client

```ml
client
```

Client slot associated with the recorded ranking-service action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L306)

<a id="field-field-mq3-game-rankings-action-kind-kind-src-mq3-game-rankings-ml-272760741"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L304)

<a id="field-field-mq3-game-rankings-action-text-text-src-mq3-game-rankings-ml-2068102107"></a>
### text

```ml
text
```

Text payload supplied to the recorded command, chat, or host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L308)

<a id="field-field-mq3-game-rankings-action-value-value-src-mq3-game-rankings-ml-1692647269"></a>
### value

```ml
value
```

Numeric/result payload supplied to the recorded host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L310)
