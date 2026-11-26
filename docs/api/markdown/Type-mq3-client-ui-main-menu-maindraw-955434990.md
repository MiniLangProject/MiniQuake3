# `mq3.client.ui_main_menu.MainDraw`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-menu-ml-1254770805.md)

<a id="struct-struct-mq3-client-ui-main-menu-maindraw-struct-maindraw-src-mq3-client-ui-main-menu-ml-44300123"></a>
## MainDraw

```ml
struct MainDraw
```

Stores UI main menu main draw record, including `bannerModel`, `yaw`, `errorMessage`, `demoVersion`, `actions`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_menu.ml#L40)

## Members

<a id="field-field-mq3-client-ui-main-menu-maindraw-actions-actions-src-mq3-client-ui-main-menu-ml-1713724846"></a>
### actions

```ml
actions
```

Host requests queued while drawing the main menu and opening its selected destination, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_menu.ml#L51)

<a id="field-field-mq3-client-ui-main-menu-maindraw-bannermodel-bannermodel-src-mq3-client-ui-main-menu-ml-995494562"></a>
### bannerModel

```ml
bannerModel
```

Model resource selected for the banner presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_menu.ml#L42)

<a id="field-field-mq3-client-ui-main-menu-maindraw-demoversion-demoversion-src-mq3-client-ui-main-menu-ml-1595049846"></a>
### demoVersion

```ml
demoVersion
```

When constructing this record, `draw` supplies `demoVersion` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_menu.ml#L48)

<a id="field-field-mq3-client-ui-main-menu-maindraw-errormessage-errormessage-src-mq3-client-ui-main-menu-ml-1714780304"></a>
### errorMessage

```ml
errorMessage
```

When constructing this record, `draw` supplies `menu.errorMessage` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_menu.ml#L46)

<a id="field-field-mq3-client-ui-main-menu-maindraw-yaw-yaw-src-mq3-client-ui-main-menu-ml-1426532182"></a>
### yaw

```ml
yaw
```

When constructing this record, `draw` supplies `yaw` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_menu.ml#L44)
