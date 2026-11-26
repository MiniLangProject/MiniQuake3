# `mq3.botlib.be_interface.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-interface-ml-674658449.md)

<a id="struct-struct-mq3-botlib-be-interface-services-struct-services-src-mq3-botlib-be-interface-ml-1090408567"></a>
## Services

```ml
struct Services
```

`Services` record for be interface, containing `context`, `aasSetupFn`, `eaSetupFn`, `weaponSetupFn` and `goalSetupFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L24)

## Members

<a id="field-field-mq3-botlib-be-interface-services-aasloadmapfn-aasloadmapfn-src-mq3-botlib-be-interface-ml-245271285"></a>
### aasLoadMapFn

```ml
aasLoadMapFn
```

Host callback that loads the navigation data for a requested map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L67)

<a id="field-field-mq3-botlib-be-interface-services-aassetupfn-aassetupfn-src-mq3-botlib-be-interface-ml-870929735"></a>
### aasSetupFn

```ml
aasSetupFn
```

Host callback that initializes the AAS navigation subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L29)

<a id="field-field-mq3-botlib-be-interface-services-aasshutdownfn-aasshutdownfn-src-mq3-botlib-be-interface-ml-1396878023"></a>
### aasShutdownFn

```ml
aasShutdownFn
```

Host callback that releases the AAS navigation subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L53)

<a id="field-field-mq3-botlib-be-interface-services-aasstartframefn-aasstartframefn-src-mq3-botlib-be-interface-ml-654190735"></a>
### aasStartFrameFn

```ml
aasStartFrameFn
```

Host callback that advances AAS bookkeeping to the supplied frame time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L65)

<a id="field-field-mq3-botlib-be-interface-services-aasupdateentityfn-aasupdateentityfn-src-mq3-botlib-be-interface-ml-1451468987"></a>
### aasUpdateEntityFn

```ml
aasUpdateEntityFn
```

Host callback that updates the navigation representation of a game entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L73)

<a id="field-field-mq3-botlib-be-interface-services-charactersshutdownfn-charactersshutdownfn-src-mq3-botlib-be-interface-ml-1755699063"></a>
### charactersShutdownFn

```ml
charactersShutdownFn
```

Host callback that releases cached bot-character definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L51)

<a id="field-field-mq3-botlib-be-interface-services-chatsetupfn-chatsetupfn-src-mq3-botlib-be-interface-ml-236288047"></a>
### chatSetupFn

```ml
chatSetupFn
```

Host callback that initializes the bot chat subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L37)

<a id="field-field-mq3-botlib-be-interface-services-chatshutdownfn-chatshutdownfn-src-mq3-botlib-be-interface-ml-453366639"></a>
### chatShutdownFn

```ml
chatShutdownFn
```

Host callback that releases bot chat resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L41)

<a id="field-field-mq3-botlib-be-interface-services-checksourcesfn-checksourcesfn-src-mq3-botlib-be-interface-ml-1914862499"></a>
### checkSourcesFn

```ml
checkSourcesFn
```

Host callback that checks the state of registered preprocessor sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L63)

<a id="field-field-mq3-botlib-be-interface-services-context-context-src-mq3-botlib-be-interface-ml-62703127"></a>
### context

```ml
context
```

Caller-supplied data associated with setup, shutdown, and frame dispatch across the bot-library subsystems.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L27)

<a id="field-field-mq3-botlib-be-interface-services-definesremovedfn-definesremovedfn-src-mq3-botlib-be-interface-ml-1144823063"></a>
### definesRemovedFn

```ml
definesRemovedFn
```

Host callback that observes removal of preprocessor definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L59)

<a id="field-field-mq3-botlib-be-interface-services-easetupfn-easetupfn-src-mq3-botlib-be-interface-ml-1445061311"></a>
### eaSetupFn

```ml
eaSetupFn
```

Host callback that initializes the bot elementary-action interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L31)

<a id="field-field-mq3-botlib-be-interface-services-eashutdownfn-eashutdownfn-src-mq3-botlib-be-interface-ml-1217637911"></a>
### eaShutdownFn

```ml
eaShutdownFn
```

Host callback that releases the bot elementary-action interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L55)

<a id="field-field-mq3-botlib-be-interface-services-goalsetupfn-goalsetupfn-src-mq3-botlib-be-interface-ml-1192803939"></a>
### goalSetupFn

```ml
goalSetupFn
```

Host callback that initializes bot goal and item-selection state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L35)

<a id="field-field-mq3-botlib-be-interface-services-goalshutdownfn-goalshutdownfn-src-mq3-botlib-be-interface-ml-793356353"></a>
### goalShutdownFn

```ml
goalShutdownFn
```

Host callback that releases bot goal and item-selection resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L45)

<a id="field-field-mq3-botlib-be-interface-services-initlevelitemsfn-initlevelitemsfn-src-mq3-botlib-be-interface-ml-1404992079"></a>
### initLevelItemsFn

```ml
initLevelItemsFn
```

Host callback that discovers and initializes bot goals for map items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L69)

<a id="field-field-mq3-botlib-be-interface-services-libvarsreleasedfn-libvarsreleasedfn-src-mq3-botlib-be-interface-ml-1465899727"></a>
### libvarsReleasedFn

```ml
libvarsReleasedFn
```

Host callback that observes release of bot-library variables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L57)

<a id="field-field-mq3-botlib-be-interface-services-logshutdownfn-logshutdownfn-src-mq3-botlib-be-interface-ml-597789375"></a>
### logShutdownFn

```ml
logShutdownFn
```

Host callback that closes the bot-library logging subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L61)

<a id="field-field-mq3-botlib-be-interface-services-movesetupfn-movesetupfn-src-mq3-botlib-be-interface-ml-110292015"></a>
### moveSetupFn

```ml
moveSetupFn
```

Host callback that initializes bot movement resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L39)

<a id="field-field-mq3-botlib-be-interface-services-moveshutdownfn-moveshutdownfn-src-mq3-botlib-be-interface-ml-823538073"></a>
### moveShutdownFn

```ml
moveShutdownFn
```

Host callback that releases bot movement resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L43)

<a id="field-field-mq3-botlib-be-interface-services-setbrushmodeltypesfn-setbrushmodeltypesfn-src-mq3-botlib-be-interface-ml-1666983755"></a>
### setBrushModelTypesFn

```ml
setBrushModelTypesFn
```

Host callback that classifies brush models used by bot movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L71)

<a id="field-field-mq3-botlib-be-interface-services-weaponsetupfn-weaponsetupfn-src-mq3-botlib-be-interface-ml-1273527847"></a>
### weaponSetupFn

```ml
weaponSetupFn
```

Host callback that initializes bot weapon selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L33)

<a id="field-field-mq3-botlib-be-interface-services-weaponshutdownfn-weaponshutdownfn-src-mq3-botlib-be-interface-ml-121528719"></a>
### weaponShutdownFn

```ml
weaponShutdownFn
```

Host callback that releases bot weapon-selection resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L47)

<a id="field-field-mq3-botlib-be-interface-services-weightsshutdownfn-weightsshutdownfn-src-mq3-botlib-be-interface-ml-199401995"></a>
### weightsShutdownFn

```ml
weightsShutdownFn
```

Host callback that releases cached fuzzy-weight definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L49)
