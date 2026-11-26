# `mq3.botlib.be_interface.Api`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-interface-ml-674658449.md)

<a id="struct-struct-mq3-botlib-be-interface-api-struct-api-src-mq3-botlib-be-interface-ml-219761877"></a>
## Api

```ml
struct Api
```

`Api` record for be interface, containing `version`, `top`, `aas`, `ea` and `ai`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L76)

## Members

<a id="field-field-mq3-botlib-be-interface-api-aas-aas-src-mq3-botlib-be-interface-ml-1344868657"></a>
### aas

```ml
aas
```

AAS navigation runtime used for area and route queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L82)

<a id="field-field-mq3-botlib-be-interface-api-ai-ai-src-mq3-botlib-be-interface-ml-1236301657"></a>
### ai

```ml
ai
```

Higher-level chat, goal, movement, and weapon AI entry points.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L86)

<a id="field-field-mq3-botlib-be-interface-api-ea-ea-src-mq3-botlib-be-interface-ml-116291361"></a>
### ea

```ml
ea
```

Elementary-action entry points for bot movement and commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L84)

<a id="field-field-mq3-botlib-be-interface-api-top-top-src-mq3-botlib-be-interface-ml-750101045"></a>
### top

```ml
top
```

Top-level setup, shutdown, and frame entry points.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L80)

<a id="field-field-mq3-botlib-be-interface-api-version-version-src-mq3-botlib-be-interface-ml-452581785"></a>
### version

```ml
version
```

Version of the exported bot-library interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L78)
