# `mq3.client.ui_shared.TypeData`

[Home](README.md) · [Source file](File-src-mq3-client-ui-shared-ml-1094733975.md)

<a id="struct-struct-mq3-client-ui-shared-typedata-struct-typedata-src-mq3-client-ui-shared-ml-762653795"></a>
## TypeData

```ml
struct TypeData
```

Stores UI shared type data record, including `startPos`, `endPos`, `cursorPos`, `maxChars`, `maxPaintChars`, `minVal` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L245)

## Members

<a id="field-field-mq3-client-ui-shared-typedata-columns-columns-src-mq3-client-ui-shared-ml-1301701465"></a>
### columns

```ml
columns
```

Column descriptors used to lay out a listbox's displayed data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L272)

<a id="field-field-mq3-client-ui-shared-typedata-cursorpos-cursorpos-src-mq3-client-ui-shared-ml-84788457"></a>
### cursorPos

```ml
cursorPos
```

Insertion or selection position within the editable text field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L252)

<a id="field-field-mq3-client-ui-shared-typedata-defval-defval-src-mq3-client-ui-shared-ml-1738317177"></a>
### defVal

```ml
defVal
```

Default numeric value used by the edit or slider control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L262)

<a id="field-field-mq3-client-ui-shared-typedata-doubleclick-doubleclick-src-mq3-client-ui-shared-ml-76996037"></a>
### doubleClick

```ml
doubleClick
```

Script executed when the list item receives a double-click event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L292)

<a id="field-field-mq3-client-ui-shared-typedata-elementheight-elementheight-src-mq3-client-ui-shared-ml-1857546549"></a>
### elementHeight

```ml
elementHeight
```

Vertical size of one item in the list or feeder layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L268)

<a id="field-field-mq3-client-ui-shared-typedata-elementwidth-elementwidth-src-mq3-client-ui-shared-ml-123437589"></a>
### elementWidth

```ml
elementWidth
```

Horizontal size of one item in the list or feeder layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L266)

<a id="field-field-mq3-client-ui-shared-typedata-endpos-endpos-src-mq3-client-ui-shared-ml-1438604371"></a>
### endPos

```ml
endPos
```

When constructing this record, `typeData` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L250)

<a id="field-field-mq3-client-ui-shared-typedata-feeder-feeder-src-mq3-client-ui-shared-ml-1604476503"></a>
### feeder

```ml
feeder
```

Feeder identifier supplying data rows to this list or menu control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L264)

<a id="field-field-mq3-client-ui-shared-typedata-horizontal-horizontal-src-mq3-client-ui-shared-ml-429548581"></a>
### horizontal

```ml
horizontal
```

True when the control lays out or scrolls its elements horizontally.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L270)

<a id="field-field-mq3-client-ui-shared-typedata-maxchars-maxchars-src-mq3-client-ui-shared-ml-1633535839"></a>
### maxChars

```ml
maxChars
```

Maximum number of characters accepted by the editable text field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L254)

<a id="field-field-mq3-client-ui-shared-typedata-maxpaintchars-maxpaintchars-src-mq3-client-ui-shared-ml-1142484421"></a>
### maxPaintChars

```ml
maxPaintChars
```

Maximum number of field characters painted at once before scrolling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L256)

<a id="field-field-mq3-client-ui-shared-typedata-maxval-maxval-src-mq3-client-ui-shared-ml-943139591"></a>
### maxVal

```ml
maxVal
```

Upper numeric bound accepted by the edit or slider control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L260)

<a id="field-field-mq3-client-ui-shared-typedata-minval-minval-src-mq3-client-ui-shared-ml-615110159"></a>
### minVal

```ml
minVal
```

Lower numeric bound accepted by the edit or slider control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L258)

<a id="field-field-mq3-client-ui-shared-typedata-modelangle-modelangle-src-mq3-client-ui-shared-ml-1391026981"></a>
### modelAngle

```ml
modelAngle
```

Current yaw angle used to render the rotating model preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L290)

<a id="field-field-mq3-client-ui-shared-typedata-modelfovx-modelfovx-src-mq3-client-ui-shared-ml-318685205"></a>
### modelFovX

```ml
modelFovX
```

Horizontal field of view, in degrees, used for the model preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L284)

<a id="field-field-mq3-client-ui-shared-typedata-modelfovy-modelfovy-src-mq3-client-ui-shared-ml-1591408981"></a>
### modelFovY

```ml
modelFovY
```

Vertical field of view, in degrees, used for the model preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L286)

<a id="field-field-mq3-client-ui-shared-typedata-modelorigin-modelorigin-src-mq3-client-ui-shared-ml-687410225"></a>
### modelOrigin

```ml
modelOrigin
```

Position offset used when framing the model preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L282)

<a id="field-field-mq3-client-ui-shared-typedata-modelrotation-modelrotation-src-mq3-client-ui-shared-ml-1732541245"></a>
### modelRotation

```ml
modelRotation
```

Rate or mode used to rotate the model preview over time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L288)

<a id="field-field-mq3-client-ui-shared-typedata-notselectable-notselectable-src-mq3-client-ui-shared-ml-1854581613"></a>
### notselectable

```ml
notselectable
```

True when list entries may be displayed but cannot be selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L294)

<a id="field-field-mq3-client-ui-shared-typedata-settings-settings-src-mq3-client-ui-shared-ml-377615419"></a>
### settings

```ml
settings
```

When constructing this record, `typeData` supplies an empty list for this member. Used by `Item_Multi_CountSettings` and `Item_Multi_Setting` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L275)

<a id="field-field-mq3-client-ui-shared-typedata-startpos-startpos-src-mq3-client-ui-shared-ml-1369678665"></a>
### startPos

```ml
startPos
```

When constructing this record, `typeData` supplies `0` for this member. Used by `Item_ListBox_ThumbPosition` and `Item_ListBox_MouseEnter` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L248)

<a id="field-field-mq3-client-ui-shared-typedata-stringvalues-stringvalues-src-mq3-client-ui-shared-ml-1094729179"></a>
### stringValues

```ml
stringValues
```

When constructing this record, `typeData` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L280)

<a id="field-field-mq3-client-ui-shared-typedata-values-values-src-mq3-client-ui-shared-ml-1098329265"></a>
### values

```ml
values
```

When constructing this record, `typeData` supplies an empty list for this member. Used by `Item_Multi_FindCvarByValue` and `Item_Multi_HandleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L278)
