// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Safe native port of code/ui/ui_shared.c.  Engine callbacks are represented by
// typed Action values; retail QVM ownership can suppress their dispatch.
package mq3.client.ui_shared

import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as numbers
import mq3.compat.transcendental as crt
import mq3.shared.parser as parser
import std.string as strings

/// Window-state flag used to include the window in menu rendering.
const WINDOW_VISIBLE=4
/// Window-state flag used to record that the pointer is inside the window.
const WINDOW_MOUSEOVER=1
/// Window-state flag used to record that the window owns keyboard focus.
const WINDOW_HASFOCUS=2
/// Window-state flag used to treat the window as noninteractive decoration.
const WINDOW_DECORATION=16
/// Window-state flag used to advance the window's fade-out animation.
const WINDOW_FADINGOUT=32
/// Window-state flag used to advance the window's fade-in animation.
const WINDOW_FADINGIN=64
/// Window-state flag used to record that the pointer is inside the text rectangle.
const WINDOW_MOUSEOVERTEXT=128
/// Window-state flag used to advance a rectangle transition for the window.
const WINDOW_INTRANSITION=256
/// Window-state flag used to retain the window's explicitly specified foreground color.
const WINDOW_FORECOLORSET=512
/// Window-state flag used to use horizontal layout or scrolling for the window.
const WINDOW_HORIZONTAL=1024
/// Window-state flag used to advance the window's orbit animation.
const WINDOW_ORBITING=65536
/// Menu-item type selecting text interaction and type-specific data.
const ITEM_TYPE_TEXT=0
/// Menu-item type selecting button interaction and type-specific data.
const ITEM_TYPE_BUTTON=1
/// Menu-item type selecting radiobutton interaction and type-specific data.
const ITEM_TYPE_RADIOBUTTON=2
/// Menu-item type selecting checkbox interaction and type-specific data.
const ITEM_TYPE_CHECKBOX=3
/// Menu-item type selecting editfield interaction and type-specific data.
const ITEM_TYPE_EDITFIELD=4
/// Menu-item type selecting combo interaction and type-specific data.
const ITEM_TYPE_COMBO=5
/// Menu-item type selecting listbox interaction and type-specific data.
const ITEM_TYPE_LISTBOX=6
/// Menu-item type selecting model interaction and type-specific data.
const ITEM_TYPE_MODEL=7
/// Menu-item type selecting ownerdraw interaction and type-specific data.
const ITEM_TYPE_OWNERDRAW=8
/// Menu-item type selecting numericfield interaction and type-specific data.
const ITEM_TYPE_NUMERICFIELD=9
/// Menu-item type selecting slider interaction and type-specific data.
const ITEM_TYPE_SLIDER=10
/// Menu-item type selecting yesno interaction and type-specific data.
const ITEM_TYPE_YESNO=11
/// Menu-item type selecting multi interaction and type-specific data.
const ITEM_TYPE_MULTI=12
/// Menu-item type selecting bind interaction and type-specific data.
const ITEM_TYPE_BIND=13
/// Menu-item alignment value selecting left horizontal alignment.
const ITEM_ALIGN_LEFT=0
/// Menu-item alignment value selecting center horizontal alignment.
const ITEM_ALIGN_CENTER=1
/// Menu-item alignment value selecting right horizontal alignment.
const ITEM_ALIGN_RIGHT=2
/// Cursor-display value selecting no visible pointer shape.
const CURSOR_NONE=1
/// Cursor-display value selecting the ordinary arrow pointer.
const CURSOR_ARROW=2
/// Cursor-display value selecting the resizing pointer shape.
const CURSOR_SIZER=4
/// Engine key code for the tab input, used by menu and client key-event handling.
const K_TAB=9
/// Engine key code for the enter input, used by menu and client key-event handling.
const K_ENTER=13
/// Engine key code for the escape input, used by menu and client key-event handling.
const K_ESCAPE=27
/// Engine key code for the space input, used by menu and client key-event handling.
const K_SPACE=32
/// Engine key code for the backspace input, used by menu and client key-event handling.
const K_BACKSPACE=127
/// Engine key code for the uparrow input, used by menu and client key-event handling.
const K_UPARROW=132
/// Engine key code for the downarrow input, used by menu and client key-event handling.
const K_DOWNARROW=133
/// Engine key code for the leftarrow input, used by menu and client key-event handling.
const K_LEFTARROW=134
/// Engine key code for the rightarrow input, used by menu and client key-event handling.
const K_RIGHTARROW=135
/// Engine key code for the alt input, used by menu and client key-event handling.
const K_ALT=136
/// Engine key code for the ctrl input, used by menu and client key-event handling.
const K_CTRL=137
/// Engine key code for the shift input, used by menu and client key-event handling.
const K_SHIFT=138
/// Engine key code for the del input, used by menu and client key-event handling.
const K_DEL=140
/// Engine key code for the pgdn input, used by menu and client key-event handling.
const K_PGDN=141
/// Engine key code for the end input, used by menu and client key-event handling.
const K_END=144
/// Engine key code for the f1 input, used by menu and client key-event handling.
const K_F1=145
/// Engine key code for the f2 input, used by menu and client key-event handling.
const K_F2=146
/// Engine key code for the f3 input, used by menu and client key-event handling.
const K_F3=147
/// Engine key code for the f4 input, used by menu and client key-event handling.
const K_F4=148
/// Engine key code for the f5 input, used by menu and client key-event handling.
const K_F5=149
/// Engine key code for the kp pgup input, used by menu and client key-event handling.
const K_KP_PGUP=162
/// Engine key code for the kp pgdn input, used by menu and client key-event handling.
const K_KP_PGDN=168
/// Engine key code for the mouse1 input, used by menu and client key-event handling.
const K_MOUSE1=178
/// Engine key code for the mouse2 input, used by menu and client key-event handling.
const K_MOUSE2=179
/// Engine key code for the mouse3 input, used by menu and client key-event handling.
const K_MOUSE3=180
/// Engine key code for the mouse4 input, used by menu and client key-event handling.
const K_MOUSE4=181
/// Maximum editable text length supported by the UI field implementation.
const MAX_EDITFIELD=256
/// Capacity limit for the menuitems collection or bounded storage used by this client module.
const MAX_MENUITEMS=96
/// Capacity limit for the menus collection or bounded storage used by this client module.
const MAX_MENUS=64
/// Width or height of the menu scrollbar controls in UI layout coordinates.
const SCROLLBAR_SIZE=16.0

/// Stores UI shared queued engine action, including `boundary`, `kind`, `name`, `detail`, `number`, `vector` and additional values.
struct Action
  /// Host service category recorded with a request emitted while evaluating menu scripts, registering
  /// resources, and issuing widget draw requests.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while evaluating menu
  /// scripts, registering resources, and issuing widget draw requests.
  kind
  /// Resource, menu or item, cvar, or command target referenced by the parsed-menu host action.
  name
  /// Additional text payload required by the selected host operation.
  detail
  /// Numeric argument interpreted by the selected host operation while evaluating menu scripts,
  /// registering resources, and issuing widget draw requests.
  number
  /// Vector argument interpreted according to the queued operation's kind.
  vector
  /// True when this request is marked for native dispatch while evaluating menu scripts, registering
  /// resources, and issuing widget draw requests; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI shared rectangle, including `x`, `y`, `w`, `h`.
struct Rect
  /// Horizontal position of the rectangle's origin in UI layout coordinates.
  x
  /// Vertical position of the rectangle's origin in UI layout coordinates.
  y
  /// Width of the rectangular display region.
  w
  /// Height of the rectangular display region.
  h
end struct
/// Stores UI shared color, including `r`, `g`, `b`, `a`.
struct Color
  /// Red component of the UI color.
  r
  /// Green component of the UI color.
  g
  /// Blue component of the UI color.
  b
  /// Alpha component controlling UI opacity.
  a
end struct
/// Stores UI shared source record, including `scan`, `name`, `warnings`, `errors`.
struct Source
  /// Token-scanner state used to read the menu or script source.
  scan
  /// Source name included in parser diagnostics.
  name
  /// Nonfatal diagnostic messages collected while processing the input.
  warnings
  /// Diagnostic messages collected while parsing or processing the input.
  errors
end struct
/// Stores UI shared memory record, including `capacity`, `used`, `strings`, `outOfMemory`.
struct Memory
  /// Maximum number of entries or allocation units supported by the bounded storage.
  capacity
  /// When constructing this record, `memory` supplies `0` for this member. Used by `String_Report`
  /// during subsequent processing.
  used
  /// When constructing this record, `memory` supplies an empty list for this member. Used by
  /// `String_Alloc` and `String_Report` during subsequent processing.
  strings
  /// True when the bounded allocation or string-storage pool could not satisfy a request.
  outOfMemory
end struct
/// Stores UI shared window record, including `name`, `group`, `rect`, `rectClient`, `rectEffects`, `rectEffects2` and additional values.
struct Window
  /// Window name used by menu scripts and named-item lookup.
  name
  /// Optional group name used to address several menu windows together.
  group
  /// Primary rectangle used to position and size the UI element.
  rect
  /// Secondary rectangle used when transforming the element between menu and screen coordinates.
  rectClient
  /// Rectangle holding the current transition or animation extent.
  rectEffects
  /// Additional rectangle used by menu transition and orbit effects.
  rectEffects2
  /// Window drawing style selecting the background presentation.
  style
  /// Border style selected for the menu window.
  border
  /// Thickness of the UI element's border in its layout coordinate system.
  borderSize
  /// Window flags controlling visibility, focus, mouseover, and animation state.
  flags
  /// Foreground text or image color used by the UI element.
  foreColor
  /// Background fill color used by the UI element.
  backColor
  /// Color used to draw the UI element's border.
  borderColor
  /// Color used to draw the UI element's outline.
  outlineColor
  /// Virtual shader or image asset used for the window background.
  background
  /// Handle of the cinematic playing inside the window, or a negative value when inactive.
  cinematic
  /// Time offset used while updating a window animation or transition.
  offsetTime
  /// Next scheduled time at which a window animation or transition advances.
  nextTime
  /// Opacity or alpha modulation applied while drawing or fading the object.
  alpha
end struct
/// Stores UI shared type data record, including `startPos`, `endPos`, `cursorPos`, `maxChars`, `maxPaintChars`, `minVal` and additional values.
struct TypeData
  /// When constructing this record, `typeData` supplies `0` for this member. Used by
  /// `Item_ListBox_ThumbPosition` and `Item_ListBox_MouseEnter` during subsequent processing.
  startPos
  /// When constructing this record, `typeData` supplies `0` for this member.
  endPos
  /// Insertion or selection position within the editable text field.
  cursorPos
  /// Maximum number of characters accepted by the editable text field.
  maxChars
  /// Maximum number of field characters painted at once before scrolling.
  maxPaintChars
  /// Lower numeric bound accepted by the edit or slider control.
  minVal
  /// Upper numeric bound accepted by the edit or slider control.
  maxVal
  /// Default numeric value used by the edit or slider control.
  defVal
  /// Feeder identifier supplying data rows to this list or menu control.
  feeder
  /// Horizontal size of one item in the list or feeder layout.
  elementWidth
  /// Vertical size of one item in the list or feeder layout.
  elementHeight
  /// True when the control lays out or scrolls its elements horizontally.
  horizontal
  /// Column descriptors used to lay out a listbox's displayed data.
  columns
  /// When constructing this record, `typeData` supplies an empty list for this member. Used by
  /// `Item_Multi_CountSettings` and `Item_Multi_Setting` during subsequent processing.
  settings
  /// When constructing this record, `typeData` supplies an empty list for this member. Used by
  /// `Item_Multi_FindCvarByValue` and `Item_Multi_HandleKey` during subsequent processing.
  values
  /// When constructing this record, `typeData` supplies an empty list for this member.
  stringValues
  /// Position offset used when framing the model preview.
  modelOrigin
  /// Horizontal field of view, in degrees, used for the model preview.
  modelFovX
  /// Vertical field of view, in degrees, used for the model preview.
  modelFovY
  /// Rate or mode used to rotate the model preview over time.
  modelRotation
  /// Current yaw angle used to render the rotating model preview.
  modelAngle
  /// Script executed when the list item receives a double-click event.
  doubleClick
  /// True when list entries may be displayed but cannot be selected.
  notselectable
end struct
/// Stores UI shared menu item, including `window`, `parent`, `text`, `textRect`, `type`, `alignment` and additional values.
struct Item
  /// When constructing this record, `item` supplies `window()` for this member.
  window
  /// Owning menu or container used to route this item's events and layout.
  parent
  /// Display text painted by this menu item.
  text
  /// Rectangle occupied by the laid-out text within the UI item.
  textRect
  /// UI item kind selecting its type-specific behavior and payload.
  type
  /// Horizontal alignment mode for the item within its layout region.
  alignment
  /// Horizontal alignment mode for text within the item's text rectangle.
  textalignment
  /// Horizontal offset applied when positioning the item's text.
  textalignx
  /// Vertical offset applied when positioning the item's text.
  textaligny
  /// Scale factor applied to the UI text font metrics.
  textscale
  /// Text-rendering style selecting effects such as shadows or blinking.
  textStyle
  /// Script executed when the menu item is activated.
  action
  /// Configuration-variable name bound to this UI control.
  cvar
  /// Configuration-variable name consulted by the control's enable or visibility test.
  cvarTest
  /// Accepted configuration-variable values used by the enable or visibility expression.
  enableCvar
  /// Flags selecting whether a cvar condition enables, disables, shows, or hides the item.
  cvarFlags
  /// Type-specific payload for the edit, slider, listbox, model, or other UI control.
  typeData
  /// Additional numeric parameter interpreted by the selected item or owner-draw type.
  special
  /// Owner-draw identifier selecting the specialized renderer for the UI element.
  ownerDraw
  /// Visibility and presentation flags evaluated by the owner-draw renderer.
  ownerDrawFlags
  /// Sound resource selected for the focus event or effect.
  focusSound
  /// Script executed when the UI item acquires keyboard focus.
  onFocus
  /// Script executed when the UI item loses keyboard focus.
  leaveFocus
  /// Script executed when the pointer enters the item's rectangle.
  mouseEnter
  /// Script executed when the pointer leaves the item's rectangle.
  mouseExit
  /// Script executed when the pointer enters the item's text rectangle.
  mouseEnterText
  /// Script executed when the pointer leaves the item's text rectangle.
  mouseExitText
  /// Parsed property entries retained for type-specific menu behavior.
  properties
  /// Value ranges selecting conditional colors for the displayed item.
  colorRanges
end struct
/// Stores UI shared menu, including `window`, `items`, `cursorItem`, `font`, `fullScreen`, `onOpen` and additional values.
struct Menu
  /// When constructing this record, `menu` supplies `window()` for this member.
  window
  /// Ordered child items participating in this menu's rendering and navigation.
  items
  /// Index of the menu item that currently owns keyboard focus.
  cursorItem
  /// Font resource or font name selected for this menu.
  font
  /// Whether the parsed menu fills the 640 by 480 virtual UI canvas and counts as a visible full-screen
  /// menu.
  fullScreen
  /// Script executed when the menu is opened.
  onOpen
  /// Script executed when the menu is closed.
  onClose
  /// Script executed when the menu receives the Escape key.
  onESC
  /// Sound resource continuously played while this menu is active.
  soundLoop
  /// Color used to display the currently focused menu item.
  focusColor
  /// Color used to display disabled menu items.
  disableColor
  /// Target alpha limit used by the menu's fade animation.
  fadeClamp
  /// Alpha increment applied by each menu fade update.
  fadeAmount
  /// Interval controlling how often the menu fade alpha is advanced.
  fadeCycle
  /// Owner-draw identifier selecting the specialized renderer for the UI element.
  ownerDraw
  /// Visibility and presentation flags evaluated by the owner-draw renderer.
  ownerDrawFlags
  /// True when this menu behaves as a modal popup over its parent menu.
  popup
  /// True when clicking outside the menu can dismiss or redirect the menu interaction.
  outOfBounds
  /// Parsed menu property entries retained for script and display behavior.
  properties
end struct
/// Stores UI shared display record, including `menus`, `focus`, `capture`, `cursorx`, `cursory`, `scaleX` and additional values.
struct Display
  /// Parsed menus available for activation and display.
  menus
  /// Menu or item currently owning keyboard focus.
  focus
  /// Item currently capturing pointer motion or a drag operation.
  capture
  /// Horizontal position of the UI pointer in the menu coordinate system.
  cursorx
  /// Vertical position of the UI pointer in the menu coordinate system.
  cursory
  /// Horizontal scale used to transform virtual UI coordinates to the actual display.
  scaleX
  /// Vertical scale used to transform virtual UI coordinates to the actual display.
  scaleY
  /// Horizontal adjustment used when centering the virtual UI on a wider display.
  bias
  /// UI display clock in milliseconds used to advance window fades, orbiting, and transitions.
  realtime
  /// Elapsed UI frame-time slot retained alongside the absolute realtime clock.
  frameTime
  /// True while the UI is waiting for a key to assign to a binding.
  keyBindPending
  /// Host requests queued while evaluating menu scripts, registering resources, and issuing widget draw
  /// requests, retained in request order.
  actions
  /// Configuration-variable values exposed to the native UI implementation.
  cvars
  /// Key-to-command associations available to the UI controls editor.
  bindings
  /// Registered shader, font, sound, and other display resources shared by scripted Missionpack
  /// widgets.
  assets
  /// Bounded storage used for menu strings and parsed UI allocations.
  memory
  /// True when the retail QVM owns the scripted Missionpack menu runtime, so the native observer
  /// records requests without emitting duplicate host effects.
  retailActive
end struct

/// Creates a `mq3.client.ui_shared.Rect` record. Assigns `x` from `x`, `y` from `y`, `w` from `w`, `h` from `h`.
/// @param x Value used to initialize `Rect.x`.
/// @param y Value used to initialize `Rect.y`.
/// @param w Value used to initialize `Rect.w`.
/// @param h Value used to initialize `Rect.h`.
function rect(x,y,w,h) return Rect(x,y,w,h) end function
/// Creates a `mq3.client.ui_shared.Color` record. Assigns `r` from `r`, `g` from `g`, `b` from `b`, `a` from `a`.
/// @param r Value used to initialize `Color.r`.
/// @param g Value used to initialize `Color.g`.
/// @param b Value used to initialize `Color.b`.
/// @param a Value used to initialize `Color.a`.
function color(r,g,b,a) return Color(r,g,b,a) end function
/// Creates a `mq3.client.ui_shared.Window` record. Initializes the record with the defaults written in this constructor.
function window() return Window("","",rect(0.0,0.0,0.0,0.0),rect(0.0,0.0,0.0,0.0),rect(0.0,0.0,0.0,0.0),rect(0.0,0.0,0.0,0.0),0,0,0.0,0,color(1.0,1.0,1.0,1.0),color(0.0,0.0,0.0,0.0),color(0.0,0.0,0.0,0.0),color(0.0,0.0,0.0,0.0),"",-1,0,0,1.0) end function
/// Creates a `mq3.client.ui_shared.TypeData` record. Initializes the record with the defaults written in this constructor.
function typeData() return TypeData(0,0,0,0,0,0.0,1.0,0.0,0.0,0.0,0.0,false,[],[],[],[],[0.0,0.0,0.0],0.0,0.0,0,0.0,"",false) end function
/// Creates a `mq3.client.ui_shared.Item` record. Initializes the record with the defaults written in this constructor.
function item() return Item(window(),void,"",rect(0.0,0.0,0.0,0.0),ITEM_TYPE_TEXT,ITEM_ALIGN_LEFT,ITEM_ALIGN_LEFT,0.0,0.0,0.55,0,"","","","",0,typeData(),0.0,0,0,"","","","","","","",[],[]) end function
/// Creates a `mq3.client.ui_shared.Menu` record. Initializes the record with the defaults written in this constructor.
function menu() return Menu(window(),[],-1,"",false,"","","","",color(1.0,1.0,1.0,1.0),color(0.5,0.5,0.5,1.0),1.0,0.0,0,0,0,false,false,[]) end function
/// Creates a `mq3.client.ui_shared.Source` record. Assigns `name` from `name`.
/// @param text Value used to initialize `Source.scan`.
/// @param name Value used to initialize `Source.name`.
function source(text,name) return Source(parser.create(text),name,[],[]) end function
/// Creates a `mq3.client.ui_shared.Memory` record. Assigns `capacity` from `capacity`.
/// @param capacity Value used to initialize `Memory.capacity`.
function memory(capacity) return Memory(capacity,0,[],false) end function
/// Creates a `mq3.client.ui_shared.Display` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `Display.retailActive`.
function display(retailActive) return Display([],void,void,0.0,0.0,1.0,1.0,0.0,0,0,false,[],[],[],[],memory(1024*1024),retailActive) end function
/// Appends a typed UI engine action and sets its dispatched flag according to retail-QVM ownership.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI shared resource.
/// @param detail Value used by `dc.actions=dc.actions+[Action(boundary,kind,name,detail,number,vector,not dc.retailActive)]`.
/// @param number Value used by `dc.actions=dc.actions+[Action(boundary,kind,name,detail,number,vector,not dc.retailActive)]`.
/// @param vector Value used by `dc.actions=dc.actions+[Action(boundary,kind,name,detail,number,vector,not dc.retailActive)]`.
function emit(dc,boundary,kind,name,detail,number,vector) dc.actions=dc.actions+[Action(boundary,kind,name,detail,number,vector,not dc.retailActive)];return dc.actions[len(dc.actions)-1] end function
/// Compares two UI shared names using ASCII case-insensitive equality.
/// @param a Argument 1 of `std.string.equalsIgnoreCaseAscii`.
/// @param b Argument 2 of `std.string.equalsIgnoreCaseAscii`.
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
/// Returns the absolute value used by UI shared, negating negative inputs.
/// @param value Value tested by `value<0` before the calculation continues.
function abs(value) if value<0 then return 0-value end if;return value end function
/// Clamps `value` to the inclusive bounds `low` and `high` for UI shared.
/// @param value Value tested by `value<low`, `value>high` before the calculation continues.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
/// Looks up a case-insensitive key in a pair list, returning the supplied fallback when no pair matches.
/// @param pairs Value used by `for each pair in pairs if same(pair[0],key) then return pair[1] end if end for`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param otherwise Value used by `return otherwise`.
function pairGet(pairs,key,otherwise) for each pair in pairs if same(pair[0],key) then return pair[1] end if end for;return otherwise end function
/// Returns a pair list with matching case-insensitive keys replaced, or appends the key/value pair if it is absent.
/// @param pairs Value used by `for each pair in pairs if same(pair[0],key) then result=result+[[key,value]]`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param value Value used by `for each pair in pairs if same(pair[0],key) then result=result+[[key,value]]`.
function pairSet(pairs,key,value) result=[];found=false;for each pair in pairs if same(pair[0],key) then result=result+[[key,value]];found=true else result=result+[pair] end if end for;if not found then result=result+[[key,value]] end if;return result end function
/// Adapts `mq3.shared.parser.parseExt` to UI shared `next`, returning its result for `source.scan, true`.
/// @param source Record read through `source.scan`.
function next(source) return parser.parseExt(source.scan,true) end function

// UI memory and interned strings.
/// @param state Mutable UI shared record/storage; this routine assigns `state.outOfMemory`, `state.used`.
/// @param size Requested bytes; successful allocations advance the arena to a 16-byte aligned offset.
function UI_Alloc(state,size) if state.used+size>state.capacity then state.outOfMemory=true;return void end if;offset=state.used;state.used=state.used+((size+15)&(~15));return offset end function
/// Resets UI arena accounting, interned strings and the out-of-memory flag.
/// @param state Mutable UI shared record/storage; this routine assigns `state.used`, `state.strings`, `state.outOfMemory`.
function UI_InitMemory(state) state.used=0;state.strings=[];state.outOfMemory=false;return state end function
/// Reads `state.outOfMemory` for UI shared `UI_OutOfMemory`.
/// @param state Record read through `state.outOfMemory`.
function UI_OutOfMemory(state) return state.outOfMemory end function
/// Hashes ASCII-case-folded string bytes into one of 2,048 UI string buckets.
/// @param value Value used by `for i=0 to len(bytes(value))-1 c=bytes(value)[i]`.
function hashForString(value) hash=0;for i=0 to len(bytes(value))-1 c=bytes(value)[i];if c>=65 and c<=90 then c=c+32 end if;hash=hash+(c*(119+i)) end for;return hash&2047 end function
/// Interns a nonempty UI string, reusing an existing entry or returning an empty string if the arena cannot hold it.
/// @param state Mutable UI shared record/storage; this routine assigns `state.memory.strings`.
/// @param value String to intern; its UTF-8 byte length plus the terminator is charged to the UI arena.
function String_Alloc(state,value) if value=="" then return "" end if;for each old in state.memory.strings if old==value then return old end if end for;if UI_Alloc(state.memory,len(bytes(value))+1) is void then return "" end if;state.memory.strings=state.memory.strings+[value];return value end function
/// Returns the UI string count, consumed arena bytes and remaining arena bytes.
/// @param state Record read through `state.memory.strings`, `state.memory.used`, `state.memory.capacity`.
function String_Report(state) return [len(state.memory.strings),state.memory.used,state.memory.capacity-state.memory.used] end function
/// Updates `state.memory.strings` during UI shared `String_Init`.
/// @param state Mutable UI shared record/storage; this routine assigns `state.memory.strings`.
function String_Init(state) UI_InitMemory(state.memory);state.memory.strings=[];return state end function
/// Builds the UI shared `structure` sequence from `[name,size,fields]`.
/// @param name Name used to select or register the corresponding UI shared resource.
/// @param size Value used by `return [name,size,fields]`.
/// @param fields Value used by `return [name,size,fields]`.
function structure(name,size,fields) return [name,size,fields] end function

// Text and PC parser boundaries.
/// @param source Value used by `token=next(source)`.
function Float_Parse(source) token=next(source);if token=="" then return void end if;return numbers.atof(token) end function
/// Calls `mq3.client.ui_shared.next`, `mq3.compat.textnumbers.atoi` from UI shared `Int_Parse`. The final path returns `numbers.atoi(token)`.
/// @param source Value used by `token=next(source)`.
function Int_Parse(source) token=next(source);if token=="" then return void end if;return numbers.atoi(token) end function
/// Calls `mq3.client.ui_shared.next`, `mq3.compat.textnumbers.atof`, `mq3.client.ui_shared.color` from UI shared `Color_Parse`. The final path returns `color(values[0],values[1],values[2],values[3])`.
/// @param source Value used by `for i=0 to 3 token=next(source)`.
function Color_Parse(source) values=[];for i=0 to 3 token=next(source);if token=="" then return void end if;values=values+[numbers.atof(token)] end for;return color(values[0],values[1],values[2],values[3]) end function
/// Calls `mq3.client.ui_shared.next`, `mq3.compat.textnumbers.atof`, `mq3.client.ui_shared.rect` from UI shared `Rect_Parse`. The final path returns `rect(values[0],values[1],values[2],values[3])`.
/// @param source Value used by `for i=0 to 3 token=next(source)`.
function Rect_Parse(source) values=[];for i=0 to 3 token=next(source);if token=="" then return void end if;values=values+[numbers.atof(token)] end for;return rect(values[0],values[1],values[2],values[3]) end function
/// Calls `mq3.client.ui_shared.next` from UI shared `String_Parse`. The final path returns `token`.
/// @param source Value used by `token=next(source)`.
function String_Parse(source) token=next(source);if token=="" then return void end if;return token end function
/// Adapts `mq3.client.ui_shared.Float_Parse` to UI shared `PC_Float_Parse`, returning its result for `handle`.
/// @param handle Argument 1 of `mq3.client.ui_shared.Float_Parse`.
function PC_Float_Parse(handle) return Float_Parse(handle) end function
/// Adapts `mq3.client.ui_shared.Int_Parse` to UI shared `PC_Int_Parse`, returning its result for `handle`.
/// @param handle Argument 1 of `mq3.client.ui_shared.Int_Parse`.
function PC_Int_Parse(handle) return Int_Parse(handle) end function
/// Adapts `mq3.client.ui_shared.Color_Parse` to UI shared `PC_Color_Parse`, returning its result for `handle`.
/// @param handle Argument 1 of `mq3.client.ui_shared.Color_Parse`.
function PC_Color_Parse(handle) return Color_Parse(handle) end function
/// Adapts `mq3.client.ui_shared.Rect_Parse` to UI shared `PC_Rect_Parse`, returning its result for `handle`.
/// @param handle Argument 1 of `mq3.client.ui_shared.Rect_Parse`.
function PC_Rect_Parse(handle) return Rect_Parse(handle) end function
/// Adapts `mq3.client.ui_shared.String_Parse` to UI shared `PC_String_Parse`, returning its result for `handle`.
/// @param handle Argument 1 of `mq3.client.ui_shared.String_Parse`.
function PC_String_Parse(handle) return String_Parse(handle) end function
/// Reads a brace-delimited UI script, preserving nested brace groups and returning void on a missing opener or premature end.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `PC_Script_Parse`.
function PC_Script_Parse(handle) open=next(handle);if open!="{" then return void end if;text="";depth=1;while depth>0 token=next(handle);if token=="" then return void end if;if token=="{" then depth=depth+1 end if;if token=="}" then depth=depth-1 end if;if depth>0 then if text!="" then text=text+" " end if;text=text+token end if end while;return text end function
/// Updates `handle.warnings` during UI shared `PC_SourceWarning`.
/// @param handle Mutable UI shared record/storage; this routine assigns `handle.warnings`.
/// @param message Value used by `handle.warnings=handle.warnings+[handle.name+": "+message]`.
function PC_SourceWarning(handle,message) handle.warnings=handle.warnings+[handle.name+": "+message];return false end function
/// Updates `handle.errors` during UI shared `PC_SourceError`.
/// @param handle Mutable UI shared record/storage; this routine assigns `handle.errors`.
/// @param message Value used by `handle.errors=handle.errors+[handle.name+": "+message]`.
function PC_SourceError(handle,message) handle.errors=handle.errors+[handle.name+": "+message];return false end function

// Display context and geometry.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.menus`, `dc.focus`, `dc.capture`, `dc.cursorx` and additional values.
function Init_Display(dc) dc.menus=[];dc.focus=void;dc.capture=void;dc.cursorx=0.0;dc.cursory=0.0;dc.actions=[];dc.keyBindPending=false;return dc end function
/// Reads `dc` for UI shared `Display_GetContext`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
function Display_GetContext(dc) return dc end function
/// Tests whether a point lies strictly inside the rectangle; points on any edge are excluded.
/// @param value Record read through `value.x`, `value.w`, `value.y`, `value.h`.
/// @param x Horizontal coordinate in the coordinate space used by `Rect_ContainsPoint`.
/// @param y Vertical coordinate in the coordinate space used by `Rect_ContainsPoint`.
function Rect_ContainsPoint(value,x,y) return x>value.x and x<value.x+value.w and y>value.y and y<value.y+value.h end function
/// Computes `(flags&WINDOW_VISIBLE)!=0 and (flags&WINDOW_FADINGOUT)==0` for UI shared `IsVisible`.
/// @param flags Value used by `return (flags&WINDOW_VISIBLE)!=0 and (flags&WINDOW_FADINGOUT)==0`.
function IsVisible(flags) return (flags&WINDOW_VISIBLE)!=0 and (flags&WINDOW_FADINGOUT)==0 end function
/// Adds the containing window's X/Y origin to a two-component local point.
/// @param point Sequence read at `point[0]`, `point[1]`.
/// @param window Record read through `window.rect.x`, `window.rect.y`.
function ToWindowCoords(point,window) return [point[0]+window.rect.x,point[1]+window.rect.y] end function
/// Offsets a rectangle in place by its containing window's X/Y origin.
/// @param value Mutable UI shared record/storage; this routine assigns `value.x`, `value.y`.
/// @param window Record read through `window.rect.x`, `window.rect.y`.
function Rect_ToWindowCoords(value,window) value.x=value.x+window.rect.x;value.y=value.y+window.rect.y;return value end function
/// Transforms a virtual 640-by-480 rectangle using display scale factors and the horizontal bias.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.scaleX`, `dc.bias`, `dc.scaleY`.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`, `value[3]`.
function AdjustFrom640(dc,value) return [value[0]*dc.scaleX+dc.bias,value[1]*dc.scaleY,value[2]*dc.scaleX,value[3]*dc.scaleY] end function
/// Linearly interpolates the four color components and clamps each result to the range zero through one.
/// @param a Record read through `a.r`, `a.g`, `a.b`, `a.a`.
/// @param b Record read through `b.r`, `b.g`, `b.b`, `b.a`.
/// @param t Value used by `r=clamp(a.r+t*(b.r-a.r),0.0,1.0)`.
function LerpColor(a,b,t) r=clamp(a.r+t*(b.r-a.r),0.0,1.0);g=clamp(a.g+t*(b.g-a.g),0.0,1.0);blue=clamp(a.b+t*(b.b-a.b),0.0,1.0);alpha=clamp(a.a+t*(b.a-a.a),0.0,1.0);return color(r,g,blue,alpha) end function
/// Evaluates UI shared `Fade` and returns `[flags,alpha,nextTime]` according to its guard/selection conditions.
/// @param flags Value used by `if (flags&(WINDOW_FADINGOUT|WINDOW_FADINGIN))==0 or realtime<=nextTime then return [flags,alpha,nextTime] end if`.
/// @param alpha Opacity or blend weight used by the visual effect.
/// @param clampValue Value used by `if alpha>=clampValue then`.
/// @param nextTime Value used by `if (flags&(WINDOW_FADINGOUT|WINDOW_FADINGIN))==0 or realtime<=nextTime then return [flags,alpha,nextTime] end if`.
/// @param offsetTime Value used by `nextTime=realtime+offsetTime`.
/// @param bFlags Value used by `if bFlags and alpha<=0.0 then flags=flags&(~(WINDOW_FADINGOUT|WINDOW_VISIBLE)) end if`.
/// @param fadeAmount Value used by `alpha=alpha-fadeAmount`.
/// @param realtime Current client real-time clock in milliseconds.
function Fade(flags,alpha,clampValue,nextTime,offsetTime,bFlags,fadeAmount,realtime)
  if (flags&(WINDOW_FADINGOUT|WINDOW_FADINGIN))==0 or realtime<=nextTime then return [flags,alpha,nextTime] end if
  nextTime=realtime+offsetTime
  if (flags&WINDOW_FADINGOUT)!=0 then
    alpha=alpha-fadeAmount
    if bFlags and alpha<=0.0 then flags=flags&(~(WINDOW_FADINGOUT|WINDOW_VISIBLE)) end if
  else
    alpha=alpha+fadeAmount
    if alpha>=clampValue then
      alpha=clampValue
      if bFlags then flags=flags&(~WINDOW_FADINGIN) end if
    end if
  end if
  return [flags,alpha,nextTime]
end function
/// Calls `mq3.client.ui_shared.emit` from UI shared `GradientBar_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.x`, `value.y`, `value.w`, `value.h`.
/// @param tint Record read through `tint.r`, `tint.g`, `tint.b`, `tint.a`.
function GradientBar_Paint(dc,value,tint) emit(dc,"renderer","gradient-bar","",str(tint.r)+","+str(tint.g)+","+str(tint.b)+","+str(tint.a),0,[value.x,value.y,value.w,value.h]);return true end function
/// Updates `w.flags`, `w.alpha`, `w.nextTime` during UI shared `Window_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.realtime`.
/// @param w Mutable UI shared record/storage; this routine assigns `w.flags`, `w.alpha`, `w.nextTime`.
/// @param fadeAmount Value used by `if (w.flags&(WINDOW_FADINGIN|WINDOW_FADINGOUT))!=0 then faded=Fade(w.flags,w.alpha,fadeClamp,w.nextTime,fadeCycle,(w.flags&WINDOW_FADINGIN)!=0...`.
/// @param fadeClamp Value used by `if (w.flags&(WINDOW_FADINGIN|WINDOW_FADINGOUT))!=0 then faded=Fade(w.flags,w.alpha,fadeClamp,w.nextTime,fadeCycle,(w.flags&WINDOW_FADINGIN)!=0...`.
/// @param fadeCycle Value used by `if (w.flags&(WINDOW_FADINGIN|WINDOW_FADINGOUT))!=0 then faded=Fade(w.flags,w.alpha,fadeClamp,w.nextTime,fadeCycle,(w.flags&WINDOW_FADINGIN)!=0...`.
function Window_Paint(dc,w,fadeAmount,fadeClamp,fadeCycle) if (w.flags&(WINDOW_FADINGIN|WINDOW_FADINGOUT))!=0 then faded=Fade(w.flags,w.alpha,fadeClamp,w.nextTime,fadeCycle,(w.flags&WINDOW_FADINGIN)!=0,fadeAmount,dc.realtime);w.flags=faded[0];w.alpha=faded[1];w.nextTime=faded[2] end if;if w.background!="" then emit(dc,"renderer","draw-handle-pic",w.background,"window",w.style,[w.rect.x,w.rect.y,w.rect.w,w.rect.h]) else emit(dc,"renderer","fill-rect","","window",w.style,[w.rect.x,w.rect.y,w.rect.w,w.rect.h]) end if;if w.border!=0 then emit(dc,"renderer","draw-border","","window",w.borderSize,[w.rect.x,w.rect.y,w.rect.w,w.rect.h]) end if;return true end function
/// Updates `w.cinematic` during UI shared `Window_CloseCinematic`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param w Mutable UI shared record/storage; this routine assigns `w.cinematic`.
function Window_CloseCinematic(dc,w) if w.cinematic>=0 then emit(dc,"cinematic","stop",str(w.cinematic),"",0,void);w.cinematic=-1 end if;return true end function
/// Updates `dc.assets` during UI shared `Window_CacheContents`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.assets`.
/// @param w Record read through `w.background`.
function Window_CacheContents(dc,w) if w.background!="" then dc.assets=dc.assets+[w.background];emit(dc,"renderer","register-shader",w.background,"",0,void) end if;return true end function

// Item/menu initialization and coordinates.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window`, `value.textRect`, `value.typeData`, `value.properties` and additional values.
function Item_Init(value) fresh=item();value.window=fresh.window;value.textRect=fresh.textRect;value.typeData=fresh.typeData;value.properties=[];value.colorRanges=[];return value end function
/// Updates `value.window`, `value.items`, `value.cursorItem`, `value.properties` during UI shared `Menu_Init`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window`, `value.items`, `value.cursorItem`, `value.properties`.
function Menu_Init(value) fresh=menu();value.window=fresh.window;value.items=[];value.cursorItem=-1;value.properties=[];return value end function
/// Updates `value.typeData` during UI shared `Item_InitControls`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData`.
function Item_InitControls(value) if value.typeData is void then value.typeData=typeData() end if;return value end function
/// Updates `value.typeData`, `value.typeData.maxChars`, `value.typeData.cursorPos` during UI shared `Item_ValidateTypeData`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData`, `value.typeData.maxChars`, `value.typeData.cursorPos`.
function Item_ValidateTypeData(value) if value.typeData is void then value.typeData=typeData() end if;value.typeData.maxChars=clamp(value.typeData.maxChars,0,MAX_EDITFIELD);value.typeData.cursorPos=clamp(value.typeData.cursorPos,0,len(value.text));return value end function
/// Updates `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w`, `value.window.rect.h` during UI shared `Item_SetScreenCoords`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w`, `value.window.rect.h`.
/// @param x Value assigned to `value.window.rect.x`.
/// @param y Value assigned to `value.window.rect.y`.
function Item_SetScreenCoords(value,x,y) value.window.rect.x=x+value.window.rectClient.x;value.window.rect.y=y+value.window.rectClient.y;value.window.rect.w=value.window.rectClient.w;value.window.rect.h=value.window.rectClient.h;return value end function
/// Calls `mq3.client.ui_shared.Item_SetScreenCoords` from UI shared `Item_UpdatePosition`. The final path returns `value`.
/// @param value Record read through `value.parent`, `value.parent.window.rect.x`, `value.parent.window.rect.y`.
function Item_UpdatePosition(value) if value.parent is not void then Item_SetScreenCoords(value,value.parent.window.rect.x,value.parent.window.rect.y) end if;return value end function
/// Calls `mq3.client.ui_shared.Item_UpdatePosition` from UI shared `Menu_UpdatePosition`. The final path returns `value`.
/// @param value Record read through `value.items`.
function Menu_UpdatePosition(value) for each child in value.items child.parent=value;Item_UpdatePosition(child) end for;return value end function
/// Updates `value.window.rect` during UI shared `Menu_PostParse`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.rect`.
function Menu_PostParse(value) Menu_UpdatePosition(value);if value.fullScreen then value.window.rect=rect(0.0,0.0,640.0,480.0) end if;return value end function
/// Calls `mq3.client.ui_shared.rect` from UI shared `Item_CorrectedTextRect`. The final path returns `result`.
/// @param value Record read through `value.textRect.x`, `value.textRect.y`, `value.textRect.w`, `value.textRect.h`.
function Item_CorrectedTextRect(value) result=rect(value.textRect.x,value.textRect.y,value.textRect.w,value.textRect.h);if result.w<0 then result.w=0 end if;if result.h<0 then result.h=0 end if;return result end function
/// Estimates scaled text width/height, stores them in the text rectangle and returns their integer pixel values.
/// @param value Mutable UI shared record/storage; this routine assigns `value.textRect.w`, `value.textRect.h`.
/// @param text Text consumed or emitted by `Item_SetTextExtents` in the UI shared path.
function Item_SetTextExtents(value,text) width=len(bytes(text))*8.0*value.textscale;height=16.0*value.textscale;value.textRect.w=width;value.textRect.h=height;return [numeric.trunc32(width),numeric.trunc32(height)] end function

// Menu/item lookup, visibility and focus.
/// @param value Record read through `value.items`.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menu_ItemsMatchingGroup(value,name) count=0;for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then count=count+1 end if end for;return count end function
/// Calls `mq3.client.ui_shared.same` from UI shared `Menu_GetMatchingItemByNumber`.
/// @param value Record read through `value.items`.
/// @param index Value tested by `found==index` before the calculation continues.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menu_GetMatchingItemByNumber(value,index,name) found=0;for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then if found==index then return child end if;found=found+1 end if end for;return void end function
/// Finds the first menu item whose window name matches case-insensitively, returning void if none matches.
/// @param value Record read through `value.items`.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menu_FindItemByName(value,name) for each child in value.items if same(child.window.name,name) then return child end if end for;return void end function
/// Finds a display menu by case-insensitive window name, returning void if it is absent.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menus_FindByName(dc,name) for each value in dc.menus if same(value.window.name,name) then return value end if end for;return void end function
/// Updates `value.cursorItem` during UI shared `Menu_ClearFocus`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.cursorItem`.
function Menu_ClearFocus(value) old=void;for each child in value.items if (child.window.flags&WINDOW_HASFOCUS)!=0 then old=child;child.window.flags=child.window.flags&(~WINDOW_HASFOCUS) end if end for;value.cursorItem=-1;return old end function
/// Updates `value.window.flags`, `value.parent.cursorItem` during UI shared `Item_SetFocus`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.flags`, `value.parent.cursorItem`.
/// @param x Accepted for compatibility with `Item_SetFocus`; the current implementation does not read it.
/// @param y Accepted for compatibility with `Item_SetFocus`; the current implementation does not read it.
function Item_SetFocus(dc,value,x,y) if (value.window.flags&(WINDOW_VISIBLE|WINDOW_DECORATION))!=WINDOW_VISIBLE then return false end if;if value.parent is not void then Menu_ClearFocus(value.parent) end if;value.window.flags=value.window.flags|WINDOW_HASFOCUS;if value.parent is not void then for i=0 to len(value.parent.items)-1 if value.parent.items[i]==value then value.parent.cursorItem=i end if end for end if;if value.onFocus!="" then Item_RunScript(dc,value,value.onFocus) end if;if value.focusSound!="" then emit(dc,"audio","play-local",value.focusSound,"focus",0,void) end if;return true end function
/// Updates `value.window.flags` during UI shared `Item_SetMouseOver`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.flags`.
/// @param focus Value used by `if focus then value.window.flags=value.window.flags|WINDOW_MOUSEOVER else value.window.flags=value.window.flags&(~WINDOW_MOUSEOVER) end if`.
function Item_SetMouseOver(value,focus) if focus then value.window.flags=value.window.flags|WINDOW_MOUSEOVER else value.window.flags=value.window.flags&(~WINDOW_MOUSEOVER) end if;return value end function
/// Calls `mq3.client.ui_shared.Item_SetMouseOver`, `mq3.client.ui_shared.Item_RunScript` from UI shared `Item_MouseEnter`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.mouseEnter`.
/// @param x Accepted for compatibility with `Item_MouseEnter`; the current implementation does not read it.
/// @param y Accepted for compatibility with `Item_MouseEnter`; the current implementation does not read it.
function Item_MouseEnter(dc,value,x,y) Item_SetMouseOver(value,true);if value.mouseEnter!="" then Item_RunScript(dc,value,value.mouseEnter) end if;return true end function
/// Updates `value.window.flags` during UI shared `Item_MouseLeave`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.flags`.
function Item_MouseLeave(dc,value) Item_SetMouseOver(value,false);value.window.flags=value.window.flags&(~WINDOW_MOUSEOVERTEXT);if value.mouseExit!="" then Item_RunScript(dc,value,value.mouseExit) end if;return true end function
/// Searches visible menu items from back to front for the first rectangle containing the point.
/// @param value Record read through `value.items`.
/// @param x Horizontal coordinate in the coordinate space used by `Menu_HitTest`.
/// @param y Vertical coordinate in the coordinate space used by `Menu_HitTest`.
function Menu_HitTest(value,x,y) i=len(value.items)-1;while i>=0 child=value.items[i];if IsVisible(child.window.flags) and Rect_ContainsPoint(child.window.rect,x,y) then return child end if;i=i-1 end while;return void end function
/// Computes `Menu_HitTest(value,x,y) is not void` for UI shared `Menu_OverActiveItem`.
/// @param value Value used by `return Menu_HitTest(value,x,y) is not void`.
/// @param x Horizontal coordinate in the coordinate space used by `Menu_OverActiveItem`.
/// @param y Vertical coordinate in the coordinate space used by `Menu_OverActiveItem`.
function Menu_OverActiveItem(value,x,y) return Menu_HitTest(value,x,y) is not void end function
/// Evaluates UI shared `Menu_GetFocusedItem` and returns `value.items[value.cursorItem]`, `child`, `void` according to its guard/selection conditions.
/// @param value Record read through `value.cursorItem`, `value.items`.
function Menu_GetFocusedItem(value) if value.cursorItem>=0 and value.cursorItem<len(value.items) then return value.items[value.cursorItem] end if;for each child in value.items if (child.window.flags&WINDOW_HASFOCUS)!=0 then return child end if end for;return void end function
/// Evaluates UI shared `Menu_GetFocused` and returns `value`, `void` according to its guard/selection conditions.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
function Menu_GetFocused(dc) for each value in dc.menus if (value.window.flags&WINDOW_HASFOCUS)!=0 then return value end if end for;return void end function

// Scripts.  Tokenization and command dispatch mirror the original command table.
/// @param text Argument 1 of `mq3.client.ui_shared.source`; passed as `"{ "+text+" }"`.
function scriptArgs(text) return source("{ "+text+" }","script") end function
/// Adapts `mq3.client.ui_shared.String_Parse` to UI shared `scriptValue`, returning its result for `args`.
/// @param args Argument 1 of `mq3.client.ui_shared.String_Parse`.
function scriptValue(args) return String_Parse(args) end function
/// Updates `value.window.backColor`, `value.window.foreColor`, `value.window.flags`, `value.window.borderColor` during UI shared `Script_SetColor`.
/// @param dc Accepted for compatibility with `Script_SetColor`; the current implementation does not read it.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.backColor`, `value.window.foreColor`, `value.window.flags`, `value.window.borderColor`.
/// @param args Value used by `target=scriptValue(args)`.
function Script_SetColor(dc,value,args) target=scriptValue(args);c=Color_Parse(args);if c is void then return false end if;if same(target,"backcolor") then value.window.backColor=c else if same(target,"forecolor") then value.window.foreColor=c;value.window.flags=value.window.flags|WINDOW_FORECOLORSET else if same(target,"bordercolor") then value.window.borderColor=c end if;return true end function
/// Updates `value.window.background` during UI shared `Script_SetAsset`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.background`.
/// @param args Value used by `path=scriptValue(args)`.
function Script_SetAsset(dc,value,args) path=scriptValue(args);if path is void then return false end if;value.window.background=path;emit(dc,"renderer","register-shader",path,"script",0,void);return true end function
/// Adapts `mq3.client.ui_shared.Script_SetAsset` to UI shared `Script_SetBackground`, returning its result for `dc, value, args`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Script_SetAsset`.
/// @param value Argument 2 of `mq3.client.ui_shared.Script_SetAsset`.
/// @param args Argument 3 of `mq3.client.ui_shared.Script_SetAsset`.
function Script_SetBackground(dc,value,args) return Script_SetAsset(dc,value,args) end function
/// Updates `value.window.backColor` during UI shared `Script_SetTeamColor`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.backColor`.
/// @param args Accepted for compatibility with `Script_SetTeamColor`; the current implementation does not read it.
function Script_SetTeamColor(dc,value,args) value.window.backColor=pairGet(dc.cvars,"ui_teamColor",color(1.0,1.0,1.0,1.0));return true end function
/// Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Menu_FindItemByName`, `mq3.client.ui_shared.Script_SetColor` from UI shared `Script_SetItemColor`. The final path returns `Script_SetColor(dc,target,args)`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.parent`.
/// @param args Value used by `name=scriptValue(args)`.
function Script_SetItemColor(dc,value,args) name=scriptValue(args);target=Menu_FindItemByName(value.parent,name);if target is void then return false end if;return Script_SetColor(dc,target,args) end function
/// Calls `mq3.client.ui_shared.same` from UI shared `Menu_ShowItemByName`.
/// @param value Record read through `value.items`.
/// @param name Name used to select or register the corresponding UI shared resource.
/// @param show Value used by `for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then if show then child.window.flags=child.wind...`.
function Menu_ShowItemByName(value,name,show) for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then if show then child.window.flags=child.window.flags|WINDOW_VISIBLE else child.window.flags=child.window.flags&(~WINDOW_VISIBLE) end if end if end for;return true end function
/// Calls `mq3.client.ui_shared.same` from UI shared `Menu_FadeItemByName`.
/// @param value Record read through `value.items`.
/// @param name Name used to select or register the corresponding UI shared resource.
/// @param fadeOut Value used by `for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then if fadeOut then child.window.flags=(child....`.
function Menu_FadeItemByName(value,name,fadeOut) for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then if fadeOut then child.window.flags=(child.window.flags|WINDOW_FADINGOUT)&(~WINDOW_FADINGIN) else child.window.flags=(child.window.flags|WINDOW_FADINGIN|WINDOW_VISIBLE)&(~WINDOW_FADINGOUT) end if end if end for;return true end function
/// Adapts `mq3.client.ui_shared.Menu_ShowItemByName` to UI shared `Script_Show`, returning its result for `value.parent, scriptValue(args), true`.
/// @param dc Accepted for compatibility with `Script_Show`; the current implementation does not read it.
/// @param value Record read through `value.parent`.
/// @param args Argument 2 of `mq3.client.ui_shared.Menu_ShowItemByName`; passed as `scriptValue(args)`.
function Script_Show(dc,value,args) return Menu_ShowItemByName(value.parent,scriptValue(args),true) end function
/// Adapts `mq3.client.ui_shared.Menu_ShowItemByName` to UI shared `Script_Hide`, returning its result for `value.parent, scriptValue(args), false`.
/// @param dc Accepted for compatibility with `Script_Hide`; the current implementation does not read it.
/// @param value Record read through `value.parent`.
/// @param args Argument 2 of `mq3.client.ui_shared.Menu_ShowItemByName`; passed as `scriptValue(args)`.
function Script_Hide(dc,value,args) return Menu_ShowItemByName(value.parent,scriptValue(args),false) end function
/// Adapts `mq3.client.ui_shared.Menu_FadeItemByName` to UI shared `Script_FadeIn`, returning its result for `value.parent, scriptValue(args), false`.
/// @param dc Accepted for compatibility with `Script_FadeIn`; the current implementation does not read it.
/// @param value Record read through `value.parent`.
/// @param args Argument 2 of `mq3.client.ui_shared.Menu_FadeItemByName`; passed as `scriptValue(args)`.
function Script_FadeIn(dc,value,args) return Menu_FadeItemByName(value.parent,scriptValue(args),false) end function
/// Adapts `mq3.client.ui_shared.Menu_FadeItemByName` to UI shared `Script_FadeOut`, returning its result for `value.parent, scriptValue(args), true`.
/// @param dc Accepted for compatibility with `Script_FadeOut`; the current implementation does not read it.
/// @param value Record read through `value.parent`.
/// @param args Argument 2 of `mq3.client.ui_shared.Menu_FadeItemByName`; passed as `scriptValue(args)`.
function Script_FadeOut(dc,value,args) return Menu_FadeItemByName(value.parent,scriptValue(args),true) end function
/// Calls `mq3.client.ui_shared.Menus_OpenByName`, `mq3.client.ui_shared.scriptValue` from UI shared `Script_Open`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Accepted for compatibility with `Script_Open`; the current implementation does not read it.
/// @param args Value used by `Menus_OpenByName(dc,scriptValue(args))`.
function Script_Open(dc,value,args) Menus_OpenByName(dc,scriptValue(args));return true end function
/// Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.same`, `mq3.client.ui_shared.pairGet` and additional helpers from UI shared `Script_ConditionalOpen`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Accepted for compatibility with `Script_ConditionalOpen`; the current implementation does not read it.
/// @param args Value used by `cvar=scriptValue(args)`.
function Script_ConditionalOpen(dc,value,args) cvar=scriptValue(args);test=scriptValue(args);yes=scriptValue(args);no=scriptValue(args);if same(str(pairGet(dc.cvars,cvar,"")),test) then Menus_OpenByName(dc,yes) else if no is not void then Menus_OpenByName(dc,no) end if;return true end function
/// Calls `mq3.client.ui_shared.Menus_CloseByName`, `mq3.client.ui_shared.scriptValue` from UI shared `Script_Close`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Accepted for compatibility with `Script_Close`; the current implementation does not read it.
/// @param args Value used by `Menus_CloseByName(dc,scriptValue(args))`.
function Script_Close(dc,value,args) Menus_CloseByName(dc,scriptValue(args));return true end function
/// Calls `mq3.client.ui_shared.same`, `mq3.client.ui_shared.rect`, `mq3.client.ui_shared.Item_UpdatePosition` from UI shared `Menu_TransitionItemByName`.
/// @param value Record read through `value.items`.
/// @param name Name used to select or register the corresponding UI shared resource.
/// @param fromRect Record read through `fromRect.x`, `fromRect.y`, `fromRect.w`, `fromRect.h`.
/// @param toRect Record read through `toRect.x`, `toRect.y`, `toRect.w`, `toRect.h`.
/// @param time Value assigned to `child.window.offsetTime`.
/// @param amount Value tested by `amount==0` before the calculation continues.
function Menu_TransitionItemByName(value,name,fromRect,toRect,time,amount) if amount==0 then amount=1 end if;for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then child.window.rectClient=rect(fromRect.x,fromRect.y,fromRect.w,fromRect.h);child.window.rectEffects=rect(toRect.x,toRect.y,toRect.w,toRect.h);child.window.rectEffects2=rect(abs(toRect.x-fromRect.x)/amount,abs(toRect.y-fromRect.y)/amount,abs(toRect.w-fromRect.w)/amount,abs(toRect.h-fromRect.h)/amount);child.window.offsetTime=time;child.window.flags=child.window.flags|WINDOW_INTRANSITION|WINDOW_VISIBLE;Item_UpdatePosition(child) end if end for;return true end function
/// Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Rect_Parse`, `mq3.client.ui_shared.Int_Parse` and additional helpers from UI shared `Script_Transition`. The final path returns `Menu_TransitionItemByName(value.parent,name,fromRect,toRect,time,amount)`.
/// @param dc Accepted for compatibility with `Script_Transition`; the current implementation does not read it.
/// @param value Record read through `value.parent`.
/// @param args Value used by `name=scriptValue(args)`.
function Script_Transition(dc,value,args) name=scriptValue(args);fromRect=Rect_Parse(args);toRect=Rect_Parse(args);time=Int_Parse(args);amount=Float_Parse(args);if fromRect is void or toRect is void or time is void or amount is void then return false end if;return Menu_TransitionItemByName(value.parent,name,fromRect,toRect,time,amount) end function
/// Calls `mq3.client.ui_shared.same`, `mq3.client.ui_shared.Item_UpdatePosition` from UI shared `Menu_OrbitItemByName`.
/// @param value Record read through `value.items`.
/// @param name Name used to select or register the corresponding UI shared resource.
/// @param x Value assigned to `child.window.rectClient.x`.
/// @param y Value assigned to `child.window.rectClient.y`.
/// @param cx Value assigned to `child.window.rectEffects.x`.
/// @param cy Value assigned to `child.window.rectEffects.y`.
/// @param time Value assigned to `child.window.offsetTime`.
function Menu_OrbitItemByName(value,name,x,y,cx,cy,time) for each child in value.items if same(child.window.name,name) or same(child.window.group,name) then child.window.rectClient.x=x;child.window.rectClient.y=y;child.window.rectEffects.x=cx;child.window.rectEffects.y=cy;child.window.offsetTime=time;child.window.flags=child.window.flags|WINDOW_ORBITING|WINDOW_VISIBLE;Item_UpdatePosition(child) end if end for;return true end function
/// Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Float_Parse`, `mq3.client.ui_shared.Int_Parse` and additional helpers from UI shared `Script_Orbit`. The final path returns `Menu_OrbitItemByName(value.parent,name,x,y,cx,cy,time)`.
/// @param dc Accepted for compatibility with `Script_Orbit`; the current implementation does not read it.
/// @param value Record read through `value.parent`.
/// @param args Value used by `name=scriptValue(args)`.
function Script_Orbit(dc,value,args) name=scriptValue(args);x=Float_Parse(args);y=Float_Parse(args);cx=Float_Parse(args);cy=Float_Parse(args);time=Int_Parse(args);if time is void then return false end if;return Menu_OrbitItemByName(value.parent,name,x,y,cx,cy,time) end function
/// Calls `mq3.client.ui_shared.Menu_FindItemByName`, `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.Item_SetFocus` from UI shared `Script_SetFocus`. The final path returns `Item_SetFocus(dc,target,dc.cursorx,dc.cursory)`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursorx`, `dc.cursory`.
/// @param value Record read through `value.parent`.
/// @param args Value used by `target=Menu_FindItemByName(value.parent,scriptValue(args))`.
function Script_SetFocus(dc,value,args) target=Menu_FindItemByName(value.parent,scriptValue(args));if target is void then return false end if;return Item_SetFocus(dc,target,dc.cursorx,dc.cursory) end function
/// Updates `dc.cvars` during UI shared `Script_SetPlayerModel`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cvars`.
/// @param value Accepted for compatibility with `Script_SetPlayerModel`; the current implementation does not read it.
/// @param args Value used by `model=scriptValue(args)`.
function Script_SetPlayerModel(dc,value,args) model=scriptValue(args);dc.cvars=pairSet(dc.cvars,"ui_team_model",model);dc.cvars=pairSet(dc.cvars,"model",model);return true end function
/// Updates `dc.cvars` during UI shared `Script_SetPlayerHead`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cvars`.
/// @param value Accepted for compatibility with `Script_SetPlayerHead`; the current implementation does not read it.
/// @param args Value used by `head=scriptValue(args)`.
function Script_SetPlayerHead(dc,value,args) head=scriptValue(args);dc.cvars=pairSet(dc.cvars,"ui_team_headmodel",head);dc.cvars=pairSet(dc.cvars,"headmodel",head);return true end function
/// Updates `dc.cvars` during UI shared `Script_SetCvar`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cvars`.
/// @param value Accepted for compatibility with `Script_SetCvar`; the current implementation does not read it.
/// @param args Value used by `name=scriptValue(args)`.
function Script_SetCvar(dc,value,args) name=scriptValue(args);setting=scriptValue(args);if name is void or setting is void then return false end if;dc.cvars=pairSet(dc.cvars,name,setting);emit(dc,"cvar","set",name,setting,0,void);return true end function
/// Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.emit` from UI shared `Script_Exec`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Accepted for compatibility with `Script_Exec`; the current implementation does not read it.
/// @param args Value used by `command=scriptValue(args)`.
function Script_Exec(dc,value,args) command=scriptValue(args);emit(dc,"command","execute",command,"append",0,void);return true end function
/// Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.emit` from UI shared `Script_Play`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Accepted for compatibility with `Script_Play`; the current implementation does not read it.
/// @param args Value used by `sound=scriptValue(args)`.
function Script_Play(dc,value,args) sound=scriptValue(args);emit(dc,"audio","play-local",sound,"",0,void);return true end function
/// Calls `mq3.client.ui_shared.scriptValue`, `mq3.client.ui_shared.emit` from UI shared `Script_playLooped`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Accepted for compatibility with `Script_playLooped`; the current implementation does not read it.
/// @param args Value used by `sound=scriptValue(args)`.
function Script_playLooped(dc,value,args) sound=scriptValue(args);emit(dc,"audio","stop-background","","",0,void);emit(dc,"audio","start-background",sound,"loop",0,void);return true end function
/// Calls `mq3.client.ui_shared.same` from UI shared `commandHandler`. The final path returns `-1`.
/// @param name Name used to select or register the corresponding UI shared resource.
function commandHandler(name) names=["setcolor","setasset","setbackground","setteamcolor","setitemcolor","show","hide","fadein","fadeout","open","conditionalopen","close","transition","orbit","setfocus","setplayermodel","setplayerhead","setcvar","exec","play","playlooped"];for i=0 to len(names)-1 if same(name,names[i]) then return i end if end for;return -1 end function
/// Calls `mq3.client.ui_shared.scriptArgs`, `mq3.client.ui_shared.next`, `mq3.client.ui_shared.commandHandler` and additional helpers from UI shared `Item_RunScript`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Value used by `if id==0 then Script_SetColor(dc,value,src) else if id==1 then Script_SetAsset(dc,value,src) else if id==2 then Script_SetBackground(dc,value,...`.
/// @param text Text consumed or emitted by `Item_RunScript` in the UI shared path.
function Item_RunScript(dc,value,text) src=scriptArgs(text);if next(src)!="{" then return false end if;while true command=next(src);if command=="" or command=="}" then break end if;id=commandHandler(command);if id==0 then Script_SetColor(dc,value,src) else if id==1 then Script_SetAsset(dc,value,src) else if id==2 then Script_SetBackground(dc,value,src) else if id==3 then Script_SetTeamColor(dc,value,src) else if id==4 then Script_SetItemColor(dc,value,src) else if id==5 then Script_Show(dc,value,src) else if id==6 then Script_Hide(dc,value,src) else if id==7 then Script_FadeIn(dc,value,src) else if id==8 then Script_FadeOut(dc,value,src) else if id==9 then Script_Open(dc,value,src) else if id==10 then Script_ConditionalOpen(dc,value,src) else if id==11 then Script_Close(dc,value,src) else if id==12 then Script_Transition(dc,value,src) else if id==13 then Script_Orbit(dc,value,src) else if id==14 then Script_SetFocus(dc,value,src) else if id==15 then Script_SetPlayerModel(dc,value,src) else if id==16 then Script_SetPlayerHead(dc,value,src) else if id==17 then Script_SetCvar(dc,value,src) else if id==18 then Script_Exec(dc,value,src) else if id==19 then Script_Play(dc,value,src) else if id==20 then Script_playLooped(dc,value,src) else emit(dc,"ui-script","unknown",command,"",0,void) end if end while;return true end function

// Menu lifecycle.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menus_ShowByName(dc,name) value=Menus_FindByName(dc,name);if value is void then return false end if;value.window.flags=value.window.flags|WINDOW_VISIBLE;return true end function
/// Computes `Menus_ActivateByName(dc,name) is not void` for UI shared `Menus_OpenByName`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menus_OpenByName(dc,name) return Menus_ActivateByName(dc,name) is not void end function
/// Calls `mq3.client.ui_shared.item`, `mq3.client.ui_shared.Item_RunScript` from UI shared `Menu_RunCloseScript`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.onClose`.
function Menu_RunCloseScript(dc,value) if value.onClose!="" then dummy=item();dummy.parent=value;Item_RunScript(dc,dummy,value.onClose) end if;return true end function
/// Updates `dc.focus` during UI shared `Menus_CloseByName`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.focus`.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menus_CloseByName(dc,name) value=Menus_FindByName(dc,name);if value is void then return false end if;Menu_RunCloseScript(dc,value);value.window.flags=value.window.flags&(~(WINDOW_VISIBLE|WINDOW_HASFOCUS));Menu_CloseCinematics(dc,value);if dc.focus==value then dc.focus=void end if;return true end function
/// Updates `dc.focus` during UI shared `Menus_CloseAll`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.focus`.
function Menus_CloseAll(dc) for each value in dc.menus if IsVisible(value.window.flags) then Menu_RunCloseScript(dc,value) end if;value.window.flags=value.window.flags&(~(WINDOW_VISIBLE|WINDOW_HASFOCUS));Menu_CloseCinematics(dc,value) end for;dc.focus=void;return true end function
/// Updates `value.window.flags`, `dc.focus` during UI shared `Menus_Activate`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.focus`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.flags`.
function Menus_Activate(dc,value) for each other in dc.menus other.window.flags=other.window.flags&(~WINDOW_HASFOCUS) end for;value.window.flags=value.window.flags|WINDOW_VISIBLE|WINDOW_HASFOCUS;dc.focus=value;if value.onOpen!="" then dummy=item();dummy.parent=value;Item_RunScript(dc,dummy,value.onOpen) end if;if value.soundLoop!="" then emit(dc,"audio","start-background",value.soundLoop,"loop",0,void) end if;return value end function
/// Calls `mq3.client.ui_shared.Menus_FindByName`, `mq3.client.ui_shared.Menus_Activate` from UI shared `Menus_ActivateByName`. The final path returns `Menus_Activate(dc,value)`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menus_ActivateByName(dc,name) value=Menus_FindByName(dc,name);if value is void then return void end if;return Menus_Activate(dc,value) end function
/// Calls `mq3.client.ui_shared.IsVisible` from UI shared `Menus_AnyFullScreenVisible`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
function Menus_AnyFullScreenVisible(dc) for each value in dc.menus if value.fullScreen and IsVisible(value.window.flags) then return true end if end for;return false end function
/// Returns the element/byte count of `dc.menus` for UI shared `Menu_Count`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
function Menu_Count(dc) return len(dc.menus) end function
/// Updates `dc.menus`, `dc.focus`, `dc.capture` during UI shared `Menu_Reset`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.menus`, `dc.focus`, `dc.capture`.
function Menu_Reset(dc) dc.menus=[];dc.focus=void;dc.capture=void;return dc end function
/// Calls `mq3.client.ui_shared.Window_CloseCinematic` from UI shared `Menu_CloseCinematics`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window`, `value.items`.
function Menu_CloseCinematics(dc,value) Window_CloseCinematic(dc,value.window);for each child in value.items Window_CloseCinematic(dc,child.window) end for;return true end function
/// Calls `mq3.client.ui_shared.Menu_CloseCinematics` from UI shared `Display_CloseCinematics`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
function Display_CloseCinematics(dc) for each value in dc.menus Menu_CloseCinematics(dc,value) end for;return true end function

// Cvar gating and item controls.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Record read through `value.cvarTest`, `value.enableCvar`.
/// @param flag Value used by `if (flag&1)!=0 then return matched end if`.
function Item_EnableShowViaCvar(dc,value,flag) if value.cvarTest=="" or value.enableCvar=="" then return true end if;setting=str(pairGet(dc.cvars,value.cvarTest,""));matched=false;for each candidate in strings.split(value.enableCvar,";") if same(strings.trim(candidate),setting) then matched=true end if end for;if (flag&1)!=0 then return matched end if;return not matched end function
/// Calls `mq3.client.ui_shared.Item_RunScript` from UI shared `Item_Action`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.action`.
function Item_Action(dc,value) if value.action!="" then return Item_RunScript(dc,value,value.action) end if;return false end function
/// Updates `dc.cvars` during UI shared `Item_YesNo_HandleKey`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cvars`.
/// @param value Record read through `value.cvar`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
function Item_YesNo_HandleKey(dc,value,key) if key!=K_MOUSE1 and key!=K_ENTER and key!=K_LEFTARROW and key!=K_RIGHTARROW then return false end if;current=numbers.atoi(str(pairGet(dc.cvars,value.cvar,"0")));if current==0 then current=1 else current=0 end if;dc.cvars=pairSet(dc.cvars,value.cvar,str(current));emit(dc,"cvar","set",value.cvar,str(current),0,void);return true end function
/// Returns the element/byte count of `value.typeData.settings` for UI shared `Item_Multi_CountSettings`.
/// @param value Record read through `value.typeData.settings`.
function Item_Multi_CountSettings(value) return len(value.typeData.settings) end function
/// Calls `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.same` from UI shared `Item_Multi_FindCvarByValue`. The final path returns `0`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Record read through `value.cvar`, `value.typeData.values`.
function Item_Multi_FindCvarByValue(dc,value) current=str(pairGet(dc.cvars,value.cvar,""));for i=0 to len(value.typeData.values)-1 if same(str(value.typeData.values[i]),current) then return i end if end for;return 0 end function
/// Calls `mq3.client.ui_shared.Item_Multi_CountSettings`, `mq3.client.ui_shared.Item_Multi_FindCvarByValue`, `mq3.client.ui_shared.clamp` from UI shared `Item_Multi_Setting`. The final path returns `value.typeData.settings[clamp(index,0,count-1)]`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.typeData.settings`.
function Item_Multi_Setting(dc,value) count=Item_Multi_CountSettings(value);if count==0 then return "" end if;index=Item_Multi_FindCvarByValue(dc,value);return value.typeData.settings[clamp(index,0,count-1)] end function
/// Updates `dc.cvars` during UI shared `Item_Multi_HandleKey`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cvars`.
/// @param value Record read through `value.typeData.values`, `value.cvar`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
function Item_Multi_HandleKey(dc,value,key) if key!=K_MOUSE1 and key!=K_ENTER and key!=K_LEFTARROW and key!=K_RIGHTARROW then return false end if;count=Item_Multi_CountSettings(value);if count==0 then return false end if;index=Item_Multi_FindCvarByValue(dc,value);if key==K_LEFTARROW then index=index-1 else index=index+1 end if;if index<0 then index=count-1 end if;if index>=count then index=0 end if;setting=str(value.typeData.values[index]);dc.cvars=pairSet(dc.cvars,value.cvar,setting);emit(dc,"cvar","set",value.cvar,setting,0,void);return true end function
/// Calls `mq3.compat.textnumbers.atof`, `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.clamp` from UI shared `Item_Slider_ThumbPosition`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Record read through `value.cvar`, `value.typeData.defVal`, `value.typeData.maxVal`, `value.typeData.minVal` and additional values.
function Item_Slider_ThumbPosition(dc,value) current=numbers.atof(str(pairGet(dc.cvars,value.cvar,str(value.typeData.defVal))));range=value.typeData.maxVal-value.typeData.minVal;if range<=0 then return value.window.rect.x end if;return value.window.rect.x+clamp((current-value.typeData.minVal)/range,0.0,1.0)*(value.window.rect.w-SCROLLBAR_SIZE) end function
/// Calls `mq3.client.ui_shared.Item_Slider_ThumbPosition` from UI shared `Item_Slider_OverSlider`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window.rect.y`, `value.window.rect.h`.
/// @param x Horizontal coordinate in the coordinate space used by `Item_Slider_OverSlider`.
/// @param y Vertical coordinate in the coordinate space used by `Item_Slider_OverSlider`.
function Item_Slider_OverSlider(dc,value,x,y) thumb=Item_Slider_ThumbPosition(dc,value);return x>=thumb and x<=thumb+SCROLLBAR_SIZE and y>=value.window.rect.y and y<=value.window.rect.y+value.window.rect.h end function
/// Updates `dc.cvars` during UI shared `Item_Slider_HandleKey`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cvars`.
/// @param value Record read through `value.cvar`, `value.typeData.defVal`, `value.typeData.maxVal`, `value.typeData.minVal` and additional values.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param down Whether this event presses the key/button; false represents its release.
function Item_Slider_HandleKey(dc,value,key,down) if not down then return false end if;current=numbers.atof(str(pairGet(dc.cvars,value.cvar,str(value.typeData.defVal))));step=(value.typeData.maxVal-value.typeData.minVal)/20.0;if key==K_LEFTARROW then current=current-step else if key==K_RIGHTARROW then current=current+step else if key==K_MOUSE1 then current=value.typeData.minVal+clamp((dc.cursorx-value.window.rect.x)/(value.window.rect.w-SCROLLBAR_SIZE),0.0,1.0)*(value.typeData.maxVal-value.typeData.minVal) else return false end if;current=clamp(current,value.typeData.minVal,value.typeData.maxVal);dc.cvars=pairSet(dc.cvars,value.cvar,str(current));emit(dc,"cvar","set",value.cvar,str(current),0,void);return true end function
/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.clamp` from UI shared `Item_ListBox_MaxScroll`. The final path returns `clamp(count-visible,0,count)`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Record read through `value.special`, `value.typeData.elementHeight`, `value.window.rect.h`.
function Item_ListBox_MaxScroll(dc,value) count=numeric.trunc32(pairGet(dc.cvars,"feederCount:"+str(value.special),0));visible=1;if value.typeData.elementHeight>0 then visible=numeric.trunc32(value.window.rect.h/value.typeData.elementHeight) end if;return clamp(count-visible,0,count) end function
/// Calls `mq3.client.ui_shared.Item_ListBox_MaxScroll`, `mq3.compat.numeric.trunc32` from UI shared `Item_ListBox_ThumbPosition`. The final path returns `numeric.trunc32(value.window.rect.y+SCROLLBAR_SIZE+(value.typeData.startPos/max)*track)`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window.rect.y`, `value.window.rect.h`, `value.typeData.startPos`.
function Item_ListBox_ThumbPosition(dc,value) max=Item_ListBox_MaxScroll(dc,value);if max<=0 then return numeric.trunc32(value.window.rect.y+SCROLLBAR_SIZE) end if;track=value.window.rect.h-3.0*SCROLLBAR_SIZE;return numeric.trunc32(value.window.rect.y+SCROLLBAR_SIZE+(value.typeData.startPos/max)*track) end function
/// Adapts `mq3.client.ui_shared.Item_ListBox_ThumbPosition` to UI shared `Item_ListBox_ThumbDrawPosition`, returning its result for `dc, value`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Item_ListBox_ThumbPosition`.
/// @param value Argument 2 of `mq3.client.ui_shared.Item_ListBox_ThumbPosition`.
function Item_ListBox_ThumbDrawPosition(dc,value) return Item_ListBox_ThumbPosition(dc,value) end function
/// Calls `mq3.client.ui_shared.Rect_ContainsPoint` from UI shared `Item_ListBox_OverLB`. The final path returns `3`.
/// @param dc Accepted for compatibility with `Item_ListBox_OverLB`; the current implementation does not read it.
/// @param value Record read through `value.window.rect`, `value.typeData.horizontal`, `value.window.rect.x`, `value.window.rect.w` and additional values.
/// @param x Horizontal coordinate in the coordinate space used by `Item_ListBox_OverLB`.
/// @param y Vertical coordinate in the coordinate space used by `Item_ListBox_OverLB`.
function Item_ListBox_OverLB(dc,value,x,y)
  if not Rect_ContainsPoint(value.window.rect,x,y) then return 0 end if
  if value.typeData.horizontal then
    if x<value.window.rect.x+SCROLLBAR_SIZE then return 1 end if
    if x>value.window.rect.x+value.window.rect.w-SCROLLBAR_SIZE then return 2 end if
  else
    if y<value.window.rect.y+SCROLLBAR_SIZE then return 1 end if
    if y>value.window.rect.y+value.window.rect.h-SCROLLBAR_SIZE then return 2 end if
  end if
  return 3
end function
/// Updates `value.typeData.cursorPos` during UI shared `Item_ListBox_MouseEnter`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.cursorPos`.
/// @param x Horizontal coordinate in the coordinate space used by `Item_ListBox_MouseEnter`.
/// @param y Vertical coordinate in the coordinate space used by `Item_ListBox_MouseEnter`.
function Item_ListBox_MouseEnter(dc,value,x,y) offset=y-value.window.rect.y;step=value.typeData.elementHeight;if value.typeData.horizontal then offset=x-value.window.rect.x;step=value.typeData.elementWidth end if;if step<=0 then return value.typeData.cursorPos end if;index=numeric.trunc32(offset/step)+value.typeData.startPos;value.typeData.cursorPos=clamp(index,0,Item_ListBox_MaxScroll(dc,value)+1);return value.typeData.cursorPos end function
/// Updates `value.typeData.cursorPos`, `value.typeData.startPos` during UI shared `Item_ListBox_HandleKey`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursorx`, `dc.cursory`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.cursorPos`, `value.typeData.startPos`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param down Whether this event presses the key/button; false represents its release.
/// @param force Accepted for compatibility with `Item_ListBox_HandleKey`; the current implementation does not read it.
function Item_ListBox_HandleKey(dc,value,key,down,force) if not down then return false end if;max=Item_ListBox_MaxScroll(dc,value);if key==K_UPARROW or key==K_LEFTARROW then value.typeData.cursorPos=clamp(value.typeData.cursorPos-1,0,max);value.typeData.startPos=clamp(value.typeData.startPos-1,0,max) else if key==K_DOWNARROW or key==K_RIGHTARROW then value.typeData.cursorPos=clamp(value.typeData.cursorPos+1,0,max);value.typeData.startPos=clamp(value.typeData.startPos+1,0,max) else if key==K_MOUSE1 then Item_ListBox_MouseEnter(dc,value,dc.cursorx,dc.cursory) else return false end if;emit(dc,"feeder","selection",str(value.special),str(value.typeData.cursorPos),value.typeData.cursorPos,void);return true end function
/// Calls `std.string.substr` from UI shared `textPart`. The final path returns `strings.substr(text,start,count)`.
/// @param text Text consumed or emitted by `textPart` in the UI shared path.
/// @param start Value used by `return strings.substr(text,start,count)`.
/// @param count Value tested by `count<=0` before the calculation continues.
function textPart(text,start,count) if count<=0 then return "" end if;return strings.substr(text,start,count) end function
/// Calls `decode` from UI shared `keyText`. The final path returns `decode(data)`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
function keyText(key) data=bytes(1,0);data[0]=key;return decode(data) end function
/// Updates `value.typeData.cursorPos`, `dc.cvars` during UI shared `Item_TextField_HandleKey`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cvars`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.cursorPos`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
function Item_TextField_HandleKey(dc,value,key) text=str(pairGet(dc.cvars,value.cvar,""));cursor=clamp(value.typeData.cursorPos,0,len(text));if key==K_BACKSPACE then if cursor>0 then text=textPart(text,0,cursor-1)+textPart(text,cursor,len(text)-cursor);cursor=cursor-1 end if else if key==K_LEFTARROW then cursor=clamp(cursor-1,0,len(text)) else if key==K_RIGHTARROW then cursor=clamp(cursor+1,0,len(text)) else if key>=32 and key<127 and len(text)<value.typeData.maxChars then text=textPart(text,0,cursor)+keyText(key)+textPart(text,cursor,len(text)-cursor);cursor=cursor+1 else return false end if;value.typeData.cursorPos=cursor;dc.cvars=pairSet(dc.cvars,value.cvar,text);emit(dc,"cvar","set",value.cvar,text,0,void);return true end function
/// Calls `mq3.client.ui_shared.emit` from UI shared `Item_OwnerDraw_HandleKey`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.ownerDraw`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
function Item_OwnerDraw_HandleKey(dc,value,key) emit(dc,"ownerdraw","handle-key",str(value.ownerDraw),str(key),key,void);return true end function
/// Updates `dc.keyBindPending`, `dc.capture`, `dc.bindings` during UI shared `Item_Bind_HandleKey`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.keyBindPending`, `dc.capture`, `dc.bindings`.
/// @param value Record read through `value.cvar`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param down Whether this event presses the key/button; false represents its release.
function Item_Bind_HandleKey(dc,value,key,down) if not down then return false end if;if not dc.keyBindPending then dc.keyBindPending=true;dc.capture=value;return true end if;if key==K_ESCAPE then dc.keyBindPending=false;dc.capture=void;return true end if;dc.bindings=pairSet(dc.bindings,value.cvar,[key,-1]);emit(dc,"binding","set",value.cvar,str(key),key,void);dc.keyBindPending=false;dc.capture=void;return true end function
/// Calls `mq3.client.ui_shared.Item_ListBox_HandleKey`, `mq3.client.ui_shared.Item_Slider_HandleKey`, `mq3.client.ui_shared.Item_YesNo_HandleKey` and additional helpers from UI shared `Item_HandleKey`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.type`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param down Whether this event presses the key/button; false represents its release.
function Item_HandleKey(dc,value,key,down) if value.type==ITEM_TYPE_LISTBOX then return Item_ListBox_HandleKey(dc,value,key,down,false) end if;if value.type==ITEM_TYPE_SLIDER then return Item_Slider_HandleKey(dc,value,key,down) end if;if value.type==ITEM_TYPE_YESNO then return Item_YesNo_HandleKey(dc,value,key) end if;if value.type==ITEM_TYPE_MULTI then return Item_Multi_HandleKey(dc,value,key) end if;if value.type==ITEM_TYPE_EDITFIELD or value.type==ITEM_TYPE_NUMERICFIELD then return Item_TextField_HandleKey(dc,value,key) end if;if value.type==ITEM_TYPE_BIND then return Item_Bind_HandleKey(dc,value,key,down) end if;if value.type==ITEM_TYPE_OWNERDRAW then return Item_OwnerDraw_HandleKey(dc,value,key) end if;if down and (key==K_ENTER or key==K_MOUSE1) then return Item_Action(dc,value) end if;return false end function
/// Updates `dc.capture` during UI shared `Item_StartCapture`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.capture`.
/// @param value Record read through `value.type`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
function Item_StartCapture(dc,value,key) dc.capture=value;if value.type==ITEM_TYPE_LISTBOX then Item_ListBox_HandleKey(dc,value,key,true,true) else if value.type==ITEM_TYPE_SLIDER then Item_Slider_HandleKey(dc,value,key,true) end if;return true end function
/// Updates `dc.capture` during UI shared `Item_StopCapture`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.capture`.
/// @param value Accepted for compatibility with `Item_StopCapture`; the current implementation does not read it.
function Item_StopCapture(dc,value) dc.capture=void;return true end function
/// Adapts `mq3.client.ui_shared.Item_ListBox_HandleKey` to UI shared `Scroll_ListBox_AutoFunc`, returning its result for `dc, value, K_DOWNARROW, true, true`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Item_ListBox_HandleKey`.
/// @param value Argument 2 of `mq3.client.ui_shared.Item_ListBox_HandleKey`.
function Scroll_ListBox_AutoFunc(dc,value) return Item_ListBox_HandleKey(dc,value,K_DOWNARROW,true,true) end function
/// Updates `value.typeData.startPos` during UI shared `Scroll_ListBox_ThumbFunc`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursory`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.startPos`.
function Scroll_ListBox_ThumbFunc(dc,value) value.typeData.startPos=clamp(numeric.trunc32((dc.cursory-value.window.rect.y)/value.window.rect.h*Item_ListBox_MaxScroll(dc,value)),0,Item_ListBox_MaxScroll(dc,value));return true end function
/// Adapts `mq3.client.ui_shared.Item_Slider_HandleKey` to UI shared `Scroll_Slider_ThumbFunc`, returning its result for `dc, value, K_MOUSE1, true`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.Item_Slider_HandleKey`.
/// @param value Argument 2 of `mq3.client.ui_shared.Item_Slider_HandleKey`.
function Scroll_Slider_ThumbFunc(dc,value) return Item_Slider_HandleKey(dc,value,K_MOUSE1,true) end function

// Painting uses typed renderer/feeder/ownerdraw actions.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window.foreColor`, `value.window.flags`, `value.parent`, `value.parent.focusColor` and additional values.
function Item_TextColor(dc,value) result=value.window.foreColor;if (value.window.flags&WINDOW_HASFOCUS)!=0 and value.parent is not void then result=value.parent.focusColor end if;if not Item_EnableShowViaCvar(dc,value,1) and value.parent is not void then result=value.parent.disableColor end if;result.a=result.a*value.window.alpha;return result end function
/// Calls `mq3.client.ui_shared.Item_TextColor`, `mq3.client.ui_shared.Item_SetTextExtents`, `mq3.client.ui_shared.emit` from UI shared `paintText`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.textStyle`, `value.window.rect.x`, `value.textalignx`, `value.window.rect.y` and additional values.
/// @param text Text consumed or emitted by `paintText` in the UI shared path.
/// @param kind Action/operation identifier used to select the engine service request.
function paintText(dc,value,text,kind) tint=Item_TextColor(dc,value);Item_SetTextExtents(value,text);emit(dc,"renderer",kind,text,str(tint.r)+","+str(tint.g)+","+str(tint.b)+","+str(tint.a),value.textStyle,[value.window.rect.x+value.textalignx,value.window.rect.y+value.textaligny,value.textscale]);return true end function
/// Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Text_Paint`, returning its result for `dc, value, value.text, "draw-text"`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`.
/// @param value Record read through `value.text`.
function Item_Text_Paint(dc,value) return paintText(dc,value,value.text,"draw-text") end function
/// Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Text_Wrapped_Paint`, returning its result for `dc, value, value.text, "draw-wrapped-text"`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`.
/// @param value Record read through `value.text`.
function Item_Text_Wrapped_Paint(dc,value) return paintText(dc,value,value.text,"draw-wrapped-text") end function
/// Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Text_AutoWrapped_Paint`, returning its result for `dc, value, value.text, "draw-auto-wrapped-text"`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`.
/// @param value Record read through `value.text`.
function Item_Text_AutoWrapped_Paint(dc,value) return paintText(dc,value,value.text,"draw-auto-wrapped-text") end function
/// Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_TextField_Paint`, returning its result for `dc, value, str(pairGet(dc.cvars,value.cvar,"")), "draw-editfield"`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Record read through `value.cvar`.
function Item_TextField_Paint(dc,value) return paintText(dc,value,str(pairGet(dc.cvars,value.cvar,"")),"draw-editfield") end function
/// Calls `mq3.compat.textnumbers.atoi`, `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.paintText` from UI shared `Item_YesNo_Paint`. The final path returns `paintText(dc,value,text,"draw-yesno")`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cvars`.
/// @param value Record read through `value.cvar`.
function Item_YesNo_Paint(dc,value) text="No";if numbers.atoi(str(pairGet(dc.cvars,value.cvar,"0")))!=0 then text="Yes" end if;return paintText(dc,value,text,"draw-yesno") end function
/// Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Multi_Paint`, returning its result for `dc, value, Item_Multi_Setting(dc,value), "draw-multi"`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`.
/// @param value Argument 2, 3 of `mq3.client.ui_shared.paintText`; passed as `value`, `Item_Multi_Setting(dc,value)`.
function Item_Multi_Paint(dc,value) return paintText(dc,value,Item_Multi_Setting(dc,value),"draw-multi") end function
/// Calls `mq3.client.ui_shared.emit`, `mq3.client.ui_shared.Item_Slider_ThumbPosition` from UI shared `Item_Slider_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.cvar`, `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w` and additional values.
function Item_Slider_Paint(dc,value) emit(dc,"renderer","draw-slider",value.cvar,str(Item_Slider_ThumbPosition(dc,value)),0,[value.window.rect.x,value.window.rect.y,value.window.rect.w,value.window.rect.h]);return true end function
/// Adapts `mq3.client.ui_shared.paintText` to UI shared `Item_Bind_Paint`, returning its result for `dc, value, BindingFromName(dc,value.cvar), "draw-bind"`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Forwarded to `mq3.client.ui_shared.paintText`.
/// @param value Record read through `value.cvar`.
function Item_Bind_Paint(dc,value) return paintText(dc,value,BindingFromName(dc,value.cvar),"draw-bind") end function
/// Calls `mq3.client.ui_shared.pairGet`, `mq3.client.ui_shared.emit` from UI shared `Item_Model_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.properties`, `value.window.background`, `value.typeData.modelAngle`, `value.typeData.modelRotation` and additional values.
function Item_Model_Paint(dc,value) model=pairGet(value.properties,"asset_model",value.window.background);emit(dc,"renderer","draw-model",model,str(value.typeData.modelAngle),value.typeData.modelRotation,[value.window.rect.x,value.window.rect.y,value.window.rect.w,value.window.rect.h]);return true end function
/// Calls `mq3.client.ui_shared.emit` from UI shared `Item_Image_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window.background`, `value.window.rect.x`, `value.window.rect.y`, `value.window.rect.w` and additional values.
function Item_Image_Paint(dc,value) emit(dc,"renderer","draw-handle-pic",value.window.background,"item",0,[value.window.rect.x,value.window.rect.y,value.window.rect.w,value.window.rect.h]);return true end function
/// Calls `mq3.client.ui_shared.emit` from UI shared `Item_ListBox_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.special`, `value.typeData.startPos`, `value.typeData.cursorPos`, `value.window.rect.x` and additional values.
function Item_ListBox_Paint(dc,value) emit(dc,"feeder","paint",str(value.special),str(value.typeData.startPos),value.typeData.cursorPos,[value.window.rect.x,value.window.rect.y,value.window.rect.w,value.window.rect.h]);return true end function
/// Calls `mq3.client.ui_shared.emit` from UI shared `Item_OwnerDraw_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.ownerDraw`, `value.text`, `value.ownerDrawFlags`, `value.window.rect.x` and additional values.
function Item_OwnerDraw_Paint(dc,value) emit(dc,"ownerdraw","paint",str(value.ownerDraw),value.text,value.ownerDrawFlags,[value.window.rect.x,value.window.rect.y,value.window.rect.w,value.window.rect.h]);return true end function
/// Evaluates UI shared `moveComponent` and returns `[current,1]`, `[target,1]`, `[current,0]` according to its guard/selection conditions.
/// @param current Value used by `if current==target then return [current,1] end if`.
/// @param target Value used by `if current==target then return [current,1] end if`.
/// @param step Value used by `if current<target then current=current+step`.
function moveComponent(current,target,step) if current==target then return [current,1] end if;if current<target then current=current+step;if current>=target then return [target,1] end if else current=current-step;if current<=target then return [target,1] end if end if;return [current,0] end function
/// Calls `mq3.compat.transcendental.cos`, `mq3.compat.transcendental.sin`, `mq3.client.ui_shared.Item_UpdatePosition` and additional helpers from UI shared `Item_UpdateEffects`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.realtime`.
/// @param value Record read through `value.window`.
function Item_UpdateEffects(dc,value)
  w=value.window
  if (w.flags&WINDOW_ORBITING)!=0 and dc.realtime>w.nextTime then
    w.nextTime=dc.realtime+w.offsetTime;halfW=w.rectClient.w/2.0;halfH=w.rectClient.h/2.0;rx=w.rectClient.x+halfW-w.rectEffects.x;ry=w.rectClient.y+halfH-w.rectEffects.y;angle=3.0*3.14159265358979323846/180.0;c=crt.cos(angle);s=crt.sin(angle);w.rectClient.x=(rx*c-ry*s)+w.rectEffects.x-halfW;w.rectClient.y=(rx*s+ry*c)+w.rectEffects.y-halfH;Item_UpdatePosition(value)
  end if
  if (w.flags&WINDOW_INTRANSITION)!=0 and dc.realtime>w.nextTime then
    w.nextTime=dc.realtime+w.offsetTime;done=0;moved=moveComponent(w.rectClient.x,w.rectEffects.x,w.rectEffects2.x);w.rectClient.x=moved[0];done=done+moved[1];moved=moveComponent(w.rectClient.y,w.rectEffects.y,w.rectEffects2.y);w.rectClient.y=moved[0];done=done+moved[1];moved=moveComponent(w.rectClient.w,w.rectEffects.w,w.rectEffects2.w);w.rectClient.w=moved[0];done=done+moved[1];moved=moveComponent(w.rectClient.h,w.rectEffects.h,w.rectEffects2.h);w.rectClient.h=moved[0];done=done+moved[1];Item_UpdatePosition(value);if done==4 then w.flags=w.flags&(~WINDOW_INTRANSITION) end if
  end if
  return true
end function
/// Calls `mq3.client.ui_shared.Item_UpdateEffects`, `mq3.client.ui_shared.IsVisible`, `mq3.client.ui_shared.Item_EnableShowViaCvar` and additional helpers from UI shared `Item_Paint`. The final path returns `Item_Image_Paint(dc,value)`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window.flags`, `value.parent`, `value.parent.fadeAmount`, `value.parent.fadeClamp` and additional values.
function Item_Paint(dc,value) Item_UpdateEffects(dc,value);if not IsVisible(value.window.flags) or not Item_EnableShowViaCvar(dc,value,1) then return false end if;fadeAmount=0.0;fadeClamp=1.0;fadeCycle=0;if value.parent is not void then fadeAmount=value.parent.fadeAmount;fadeClamp=value.parent.fadeClamp;fadeCycle=value.parent.fadeCycle end if;Window_Paint(dc,value.window,fadeAmount,fadeClamp,fadeCycle);if value.type==ITEM_TYPE_TEXT or value.type==ITEM_TYPE_BUTTON then return Item_Text_Paint(dc,value) end if;if value.type==ITEM_TYPE_EDITFIELD or value.type==ITEM_TYPE_NUMERICFIELD then return Item_TextField_Paint(dc,value) end if;if value.type==ITEM_TYPE_YESNO then return Item_YesNo_Paint(dc,value) end if;if value.type==ITEM_TYPE_MULTI then return Item_Multi_Paint(dc,value) end if;if value.type==ITEM_TYPE_SLIDER then return Item_Slider_Paint(dc,value) end if;if value.type==ITEM_TYPE_BIND then return Item_Bind_Paint(dc,value) end if;if value.type==ITEM_TYPE_MODEL then return Item_Model_Paint(dc,value) end if;if value.type==ITEM_TYPE_LISTBOX then return Item_ListBox_Paint(dc,value) end if;if value.type==ITEM_TYPE_OWNERDRAW then return Item_OwnerDraw_Paint(dc,value) end if;return Item_Image_Paint(dc,value) end function
/// Calls `mq3.client.ui_shared.IsVisible`, `mq3.client.ui_shared.Window_Paint`, `mq3.client.ui_shared.Item_Paint` from UI shared `Menu_Paint`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window.flags`, `value.window`, `value.fadeAmount`, `value.fadeClamp` and additional values.
/// @param forcePaint Value used by `if not forcePaint and not IsVisible(value.window.flags) then return false end if`.
function Menu_Paint(dc,value,forcePaint) if not forcePaint and not IsVisible(value.window.flags) then return false end if;Window_Paint(dc,value.window,value.fadeAmount,value.fadeClamp,value.fadeCycle);for each child in value.items Item_Paint(dc,child) end for;return true end function
/// Calls `mq3.client.ui_shared.Menu_Paint` from UI shared `Menu_PaintAll`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
function Menu_PaintAll(dc) for each value in dc.menus Menu_Paint(dc,value,false) end for;return true end function
/// Calls `mq3.client.ui_shared.Window_CacheContents`, `mq3.client.ui_shared.Item_CacheContents` from UI shared `Menu_CacheContents`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window`, `value.items`.
function Menu_CacheContents(dc,value) Window_CacheContents(dc,value.window);for each child in value.items Item_CacheContents(dc,child) end for;return true end function
/// Calls `mq3.client.ui_shared.Window_CacheContents`, `mq3.client.ui_shared.emit` from UI shared `Item_CacheContents`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.window`, `value.focusSound`.
function Item_CacheContents(dc,value) Window_CacheContents(dc,value.window);if value.focusSound!="" then emit(dc,"audio","register-sound",value.focusSound,"",0,void) end if;return true end function
/// Calls `mq3.client.ui_shared.Menu_CacheContents` from UI shared `Display_CacheAll`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
function Display_CacheAll(dc) for each value in dc.menus Menu_CacheContents(dc,value) end for;return true end function

// Bindings and defaults.
function bindingTable() return [["+scores",K_TAB],["+button2",K_ENTER],["+speed",K_SHIFT],["+forward",K_UPARROW],["+back",K_DOWNARROW],["+moveleft",44],["+moveright",46],["+moveup",K_SPACE],["+movedown",99],["+left",K_LEFTARROW],["+right",K_RIGHTARROW],["+strafe",K_ALT],["+lookup",K_PGDN],["+lookdown",K_DEL],["+mlook",47],["centerview",K_END],["+zoom",-1],["weapon 1",49],["weapon 2",50],["weapon 3",51],["weapon 4",52],["weapon 5",53],["weapon 6",54],["weapon 7",55],["weapon 8",56],["weapon 9",57],["weapon 10",48],["weapon 11",-1],["weapon 12",-1],["weapon 13",-1],["+attack",K_CTRL],["weapprev",91],["weapnext",93],["+button3",K_MOUSE3],["+button4",K_MOUSE4],["prevTeamMember",119],["nextTeamMember",114],["nextOrder",116],["confirmOrder",121],["denyOrder",110],["taskOffense",111],["taskDefense",100],["taskPatrol",112],["taskCamp",99],["taskFollow",102],["taskRetrieve",118],["taskEscort",101],["taskOwnFlag",105],["taskSuicide",107],["tauntKillInsult",K_F1],["tauntPraise",K_F2],["tauntTaunt",K_F3],["tauntDeathInsult",K_F4],["tauntGauntlet",K_F5],["scoresUp",K_KP_PGUP],["scoresDown",K_KP_PGDN],["messagemode",-1],["messagemode2",-1],["messagemode3",-1],["messagemode4",-1]] end function
/// Calls `mq3.client.ui_shared.bindingTable`, `mq3.client.ui_shared.same` from UI shared `BindingIDFromName`. The final path returns `-1`.
/// @param name Name used to select or register the corresponding UI shared resource.
function BindingIDFromName(name) table=bindingTable();for i=0 to len(table)-1 if same(table[i][0],name) then return i end if end for;return -1 end function
/// Calls `mq3.client.ui_shared.pairGet` from UI shared `BindingFromName`. The final path returns `"KEY"+str(key)`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`.
/// @param name Name used to select or register the corresponding UI shared resource.
function BindingFromName(dc,name) key=pairGet(dc.bindings,name,-1);if typeof(key)=="array" then if len(key)==0 or key[0]<0 then return "???" end if;text="KEY"+str(key[0]);if len(key)>1 and key[1]>=0 then text=text+" or KEY"+str(key[1]) end if;return text end if;if key<0 then return "???" end if;return "KEY"+str(key) end function
/// Calls `mq3.client.ui_shared.pairGet` from UI shared `Controls_GetKeyAssignment`. The final path returns `[key,-1]`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`.
/// @param name Name used to select or register the corresponding UI shared resource.
function Controls_GetKeyAssignment(dc,name) key=pairGet(dc.bindings,name,-1);if typeof(key)=="array" then return key end if;return [key,-1] end function
/// Reads `dc.bindings` for UI shared `Controls_GetConfig`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`.
function Controls_GetConfig(dc) return dc.bindings end function
/// Updates `dc.bindings` during UI shared `Controls_SetDefaults`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.bindings`.
function Controls_SetDefaults(dc) dc.bindings=[];for each row in bindingTable() dc.bindings=pairSet(dc.bindings,row[0],[row[1],-1]) end for;return dc.bindings end function
/// Calls `mq3.client.ui_shared.emit` from UI shared `Controls_SetConfig`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.bindings`.
/// @param restart Value used by `if restart then emit(dc,"command","execute","in_restart","append",0,void) end if`.
function Controls_SetConfig(dc,restart) for each row in dc.bindings keys=row[1];if typeof(keys)!="array" then keys=[keys,-1] end if;for each key in keys if key>=0 then emit(dc,"binding","set",row[0],str(key),key,void) end if end for end for;if restart then emit(dc,"command","execute","in_restart","append",0,void) end if;return true end function
/// Reads `dc.keyBindPending` for UI shared `Display_KeyBindPending`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.keyBindPending`.
function Display_KeyBindPending(dc) return dc.keyBindPending end function

// Keyboard, mouse and display capture.
/// @param value Mutable UI shared record/storage; this routine assigns `value.cursorItem`.
function Menu_SetPrevCursorItem(value) if len(value.items)==0 then return void end if;start=value.cursorItem;for count=0 to len(value.items)-1 value.cursorItem=value.cursorItem-1;if value.cursorItem<0 then value.cursorItem=len(value.items)-1 end if;candidate=value.items[value.cursorItem];if IsVisible(candidate.window.flags) and (candidate.window.flags&WINDOW_DECORATION)==0 then return candidate end if end for;value.cursorItem=start;return void end function
/// Updates `value.cursorItem` during UI shared `Menu_SetNextCursorItem`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.cursorItem`.
function Menu_SetNextCursorItem(value) if len(value.items)==0 then return void end if;start=value.cursorItem;for count=0 to len(value.items)-1 value.cursorItem=value.cursorItem+1;if value.cursorItem>=len(value.items) then value.cursorItem=0 end if;candidate=value.items[value.cursorItem];if IsVisible(candidate.window.flags) and (candidate.window.flags&WINDOW_DECORATION)==0 then return candidate end if end for;value.cursorItem=start;return void end function
/// Calls `mq3.client.ui_shared.Menu_GetFocusedItem`, `mq3.client.ui_shared.Item_HandleKey`, `mq3.client.ui_shared.Menu_SetNextCursorItem` and additional helpers from UI shared `Menu_HandleKey`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.cursorx`, `dc.cursory`.
/// @param value Record read through `value.onESC`, `value.window.name`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param down Whether this event presses the key/button; false represents its release.
function Menu_HandleKey(dc,value,key,down) if not down then return false end if;focused=Menu_GetFocusedItem(value);if focused is not void and Item_HandleKey(dc,focused,key,down) then return true end if;if key==K_TAB or key==K_DOWNARROW then nextItem=Menu_SetNextCursorItem(value);if nextItem is not void then Item_SetFocus(dc,nextItem,dc.cursorx,dc.cursory) end if;return true end if;if key==K_UPARROW then nextItem=Menu_SetPrevCursorItem(value);if nextItem is not void then Item_SetFocus(dc,nextItem,dc.cursorx,dc.cursory) end if;return true end if;if key==K_ESCAPE then if value.onESC!="" then dummy=item();dummy.parent=value;Item_RunScript(dc,dummy,value.onESC) else Menus_CloseByName(dc,value.window.name) end if;return true end if;return false end function
/// Calls `mq3.client.ui_shared.Menu_HitTest`, `mq3.client.ui_shared.Item_MouseEnter`, `mq3.client.ui_shared.Item_MouseLeave` and additional helpers from UI shared `Menu_HandleMouseMove`. The final path returns `hit is not void`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.items`.
/// @param x Horizontal coordinate in the coordinate space used by `Menu_HandleMouseMove`.
/// @param y Vertical coordinate in the coordinate space used by `Menu_HandleMouseMove`.
function Menu_HandleMouseMove(dc,value,x,y)
  hit=Menu_HitTest(value,x,y)
  for each child in value.items
    if child==hit then
      if (child.window.flags&WINDOW_MOUSEOVER)==0 then Item_MouseEnter(dc,child,x,y) end if
    else
      if (child.window.flags&WINDOW_MOUSEOVER)!=0 then Item_MouseLeave(dc,child) end if
    end if
  end for
  if hit is not void then Item_SetFocus(dc,hit,x,y) end if
  return hit is not void
end function
/// Calls `mq3.client.ui_shared.Menus_CloseByName` from UI shared `Menus_HandleOOBClick`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.outOfBounds`, `value.window.name`.
/// @param key Accepted for compatibility with `Menus_HandleOOBClick`; the current implementation does not read it.
/// @param down Whether this event presses the key/button; false represents its release.
function Menus_HandleOOBClick(dc,value,key,down) if value.outOfBounds and down then Menus_CloseByName(dc,value.window.name);return true end if;return false end function
/// Calls `mq3.client.ui_shared.IsVisible` from UI shared `Display_VisibleMenuCount`. The final path returns `count`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
function Display_VisibleMenuCount(dc) count=0;for each value in dc.menus if IsVisible(value.window.flags) then count=count+1 end if end for;return count end function
/// Calls `mq3.client.ui_shared.IsVisible`, `mq3.client.ui_shared.Menu_HitTest` from UI shared `Display_CaptureItem`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions. Record read through `dc.menus`.
/// @param x Horizontal coordinate in the coordinate space used by `Display_CaptureItem`.
/// @param y Vertical coordinate in the coordinate space used by `Display_CaptureItem`.
function Display_CaptureItem(dc,x,y) i=len(dc.menus)-1;while i>=0 value=dc.menus[i];if IsVisible(value.window.flags) then hit=Menu_HitTest(value,x,y);if hit is not void then return hit end if end if;i=i-1 end while;return void end function
/// Updates `dc.cursorx`, `dc.cursory` during UI shared `Display_MouseMove`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cursorx`, `dc.cursory`.
/// @param p Accepted for compatibility with `Display_MouseMove`; the current implementation does not read it.
/// @param x Value assigned to `dc.cursorx`.
/// @param y Value assigned to `dc.cursory`.
function Display_MouseMove(dc,p,x,y) dc.cursorx=x;dc.cursory=y;if dc.capture is not void then if dc.capture.type==ITEM_TYPE_SLIDER then Scroll_Slider_ThumbFunc(dc,dc.capture) else if dc.capture.type==ITEM_TYPE_LISTBOX then Scroll_ListBox_ThumbFunc(dc,dc.capture) end if;return true end if;focused=Menu_GetFocused(dc);if focused is not void then return Menu_HandleMouseMove(dc,focused,x,y) end if;return false end function
/// Calls `mq3.client.ui_shared.Display_CaptureItem` from UI shared `Display_CursorType`. The final path returns `CURSOR_SIZER`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param x Horizontal coordinate in the coordinate space used by `Display_CursorType`.
/// @param y Vertical coordinate in the coordinate space used by `Display_CursorType`.
function Display_CursorType(dc,x,y) hit=Display_CaptureItem(dc,x,y);if hit is void then return CURSOR_ARROW end if;if hit.type==ITEM_TYPE_SLIDER or hit.type==ITEM_TYPE_LISTBOX then return CURSOR_SIZER end if;return CURSOR_ARROW end function
/// Updates `dc.cursorx`, `dc.cursory` during UI shared `Display_HandleKey`.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.cursorx`, `dc.cursory`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param down Whether this event presses the key/button; false represents its release.
/// @param x Value assigned to `dc.cursorx`.
/// @param y Value assigned to `dc.cursory`.
function Display_HandleKey(dc,key,down,x,y) dc.cursorx=x;dc.cursory=y;focused=Menu_GetFocused(dc);if focused is void then return false end if;if not Rect_ContainsPoint(focused.window.rect,x,y) and Menus_HandleOOBClick(dc,focused,key,down) then return true end if;return Menu_HandleKey(dc,focused,key,down) end function
/// Calls `mq3.client.ui_shared.Item_ListBox_HandleKey` from UI shared `Menu_ScrollFeeder`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.items`.
/// @param feeder Value used by `for each child in value.items if child.type==ITEM_TYPE_LISTBOX and child.special==feeder then return Item_ListBox_HandleKey(dc,child,key,true,...`.
/// @param down Whether this event presses the key/button; false represents its release.
function Menu_ScrollFeeder(dc,value,feeder,down) key=K_UPARROW;if down then key=K_DOWNARROW end if;for each child in value.items if child.type==ITEM_TYPE_LISTBOX and child.special==feeder then return Item_ListBox_HandleKey(dc,child,key,true,true) end if end for;return false end function
/// Calls `mq3.client.ui_shared.same`, `mq3.client.ui_shared.emit` from UI shared `Menu_SetFeederSelection`.
/// @param dc UI display context containing menu focus, cursor, assets and queued engine actions.
/// @param value Record read through `value.items`.
/// @param feeder Value used by `for each child in value.items if child.type==ITEM_TYPE_LISTBOX and child.special==feeder and (name=="" or same(child.window.name,name)) then c...`.
/// @param index Value assigned to `child.typeData.cursorPos`.
/// @param name Name used to select or register the corresponding UI shared resource.
function Menu_SetFeederSelection(dc,value,feeder,index,name) for each child in value.items if child.type==ITEM_TYPE_LISTBOX and child.special==feeder and (name=="" or same(child.window.name,name)) then child.typeData.cursorPos=index;emit(dc,"feeder","selection",str(feeder),str(index),index,void);return true end if end for;return false end function

// Keyword hash and declarative parsers.
/// @param keyword Value used by `for i=0 to len(bytes(keyword))-1 c=bytes(keyword)[i]`.
function KeywordHash_Key(keyword) hash=0;for i=0 to len(bytes(keyword))-1 c=bytes(keyword)[i];if c>=65 and c<=90 then c=c+32 end if;hash=hash+c*(119+i) end for;return (hash^(hash>>10)^(hash>>20))&511 end function
/// Adapts `mq3.client.ui_shared.pairSet` to UI shared `KeywordHash_Add`, returning its result for `table, key[0], key[1]`.
/// @param table Argument 1 of `mq3.client.ui_shared.pairSet`.
/// @param key Argument 2, 3 of `mq3.client.ui_shared.pairSet`; passed as `key[0]`, `key[1]`.
function KeywordHash_Add(table,key) return pairSet(table,key[0],key[1]) end function
/// Adapts `mq3.client.ui_shared.pairGet` to UI shared `KeywordHash_Find`, returning its result for `table, keyword, void`.
/// @param table Argument 1 of `mq3.client.ui_shared.pairGet`.
/// @param keyword Argument 2 of `mq3.client.ui_shared.pairGet`.
function KeywordHash_Find(table,keyword) return pairGet(table,keyword,void) end function
/// Adapts `mq3.client.ui_shared.itemKeywords` to UI shared `Item_SetupKeywordHash`, returning its result for `no arguments`.
function Item_SetupKeywordHash() return itemKeywords() end function
/// Adapts `mq3.client.ui_shared.menuKeywords` to UI shared `Menu_SetupKeywordHash`, returning its result for `no arguments`.
function Menu_SetupKeywordHash() return menuKeywords() end function
/// Updates `value.properties`, `value.window.name`, `value.window.group`, `value.text` and additional values during UI shared `putItem`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.properties`, `value.window.name`, `value.window.group`, `value.text` and additional values.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param data Value assigned to `value.window.name`, `value.window.group`, `value.text`, `value.type` and additional values.
function putItem(value,key,data) value.properties=pairSet(value.properties,key,data);if key=="name" then value.window.name=data else if key=="group" then value.window.group=data else if key=="text" then value.text=data else if key=="type" then value.type=data else if key=="style" then value.window.style=data else if key=="border" then value.window.border=data else if key=="bordersize" then value.window.borderSize=data else if key=="visible" and data!=0 then value.window.flags=value.window.flags|WINDOW_VISIBLE else if key=="decoration" then value.window.flags=value.window.flags|WINDOW_DECORATION else if key=="ownerdraw" then value.ownerDraw=data else if key=="ownerdrawflag" then value.ownerDrawFlags=value.ownerDrawFlags|data else if key=="align" then value.alignment=data else if key=="textalign" then value.textalignment=data else if key=="textalignx" then value.textalignx=data else if key=="textaligny" then value.textaligny=data else if key=="textscale" then value.textscale=data else if key=="textstyle" then value.textStyle=data else if key=="special" then value.special=data else if key=="cvar" then value.cvar=data else if key=="cvartest" then value.cvarTest=data else if key=="enablecvar" then value.enableCvar=data else if key=="action" then value.action=data else if key=="onfocus" then value.onFocus=data else if key=="leavefocus" then value.leaveFocus=data else if key=="mouseenter" then value.mouseEnter=data else if key=="mouseexit" then value.mouseExit=data else if key=="mouseentertext" then value.mouseEnterText=data else if key=="mouseexittext" then value.mouseExitText=data else if key=="focussound" then value.focusSound=data else if key=="background" then value.window.background=data end if;return true end function
/// Updates `value.window.rectClient`, `value.window.rect`, `value.window.backColor`, `value.window.foreColor` and additional values during UI shared `itemParseKind`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.rectClient`, `value.window.rect`, `value.window.backColor`, `value.window.foreColor` and additional values.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `itemParseKind`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param kind Action/operation identifier used to select the engine service request.
function itemParseKind(value,handle,key,kind)
  if kind=="flag" then return putItem(value,key,1) end if
  if kind=="asset-model" then return ItemParse_asset_model(value,handle) end if
  if kind=="model-origin" then return ItemParse_model_origin(value,handle) end if
  if kind=="model-fovx" then return ItemParse_model_fovx(value,handle) end if
  if kind=="model-fovy" then return ItemParse_model_fovy(value,handle) end if
  if kind=="model-rotation" then return ItemParse_model_rotation(value,handle) end if
  if kind=="model-angle" then return ItemParse_model_angle(value,handle) end if
  if kind=="horizontal" then return ItemParse_horizontalscroll(value,handle) end if
  if kind=="element-width" then return ItemParse_elementwidth(value,handle) end if
  if kind=="element-height" then return ItemParse_elementheight(value,handle) end if
  if kind=="feeder" then return ItemParse_feeder(value,handle) end if
  if kind=="columns" then return ItemParse_columns(value,handle) end if
  if kind=="double-click" then return ItemParse_doubleClick(value,handle) end if
  if kind=="max-chars" then return ItemParse_maxChars(value,handle) end if
  if kind=="max-paint-chars" then return ItemParse_maxPaintChars(value,handle) end if
  if kind=="cvar-float" then return ItemParse_cvarFloat(value,handle) end if
  if kind=="cvar-str-list" then return ItemParse_cvarStrList(value,handle) end if
  if kind=="cvar-float-list" then return ItemParse_cvarFloatList(value,handle) end if
  if kind=="color-range" then return ItemParse_addColorRange(value,handle) end if
  if kind=="ownerdraw-flag" then return ItemParse_ownerdrawFlag(value,handle) end if
  if kind=="enable-cvar" then return ItemParse_enableCvar(value,handle) end if
  if kind=="disable-cvar" then return ItemParse_disableCvar(value,handle) end if
  if kind=="show-cvar" then return ItemParse_showCvar(value,handle) end if
  if kind=="hide-cvar" then return ItemParse_hideCvar(value,handle) end if
  data=void;if kind=="float" then data=PC_Float_Parse(handle) else if kind=="int" then data=PC_Int_Parse(handle) else if kind=="string" then data=PC_String_Parse(handle) else if kind=="script" then data=PC_Script_Parse(handle) else if kind=="rect" then data=PC_Rect_Parse(handle) else if kind=="color" then data=PC_Color_Parse(handle) else data=PC_String_Parse(handle) end if
  if data is void then return PC_SourceError(handle,"expected "+kind+" for "+key) end if
  if key=="rect" then value.window.rectClient=data;value.window.rect=data else if key=="backcolor" then value.window.backColor=data else if key=="forecolor" then value.window.foreColor=data;value.window.flags=value.window.flags|WINDOW_FORECOLORSET else if key=="bordercolor" then value.window.borderColor=data else if key=="outlinecolor" then value.window.outlineColor=data else putItem(value,key,data) end if;return true
end function
/// Provides the item keywords table used by UI shared.
function itemKeywords() return [["name","string"],["text","string"],["group","string"],["focusSound","string"],["asset_model","asset-model"],["asset_shader","string"],["model_origin","model-origin"],["model_fovx","model-fovx"],["model_fovy","model-fovy"],["model_rotation","model-rotation"],["model_angle","model-angle"],["rect","rect"],["style","int"],["decoration","flag"],["notselectable","flag"],["wrapped","flag"],["autowrapped","flag"],["horizontalscroll","horizontal"],["type","int"],["elementwidth","element-width"],["elementheight","element-height"],["feeder","feeder"],["elementtype","int"],["columns","columns"],["border","int"],["bordersize","float"],["visible","int"],["ownerdraw","int"],["align","int"],["textalign","int"],["textalignx","float"],["textaligny","float"],["textscale","float"],["textstyle","int"],["backcolor","color"],["forecolor","color"],["bordercolor","color"],["outlinecolor","color"],["background","string"],["cinematic","string"],["doubleClick","double-click"],["onFocus","script"],["leaveFocus","script"],["mouseEnter","script"],["mouseExit","script"],["mouseEnterText","script"],["mouseExitText","script"],["action","script"],["special","float"],["cvarTest","string"],["cvar","string"],["maxChars","max-chars"],["maxPaintChars","max-paint-chars"],["cvarFloat","cvar-float"],["cvarStrList","cvar-str-list"],["cvarFloatList","cvar-float-list"],["addColorRange","color-range"],["ownerdrawFlag","ownerdraw-flag"],["enableCvar","enable-cvar"],["disableCvar","disable-cvar"],["showCvar","show-cvar"],["hideCvar","hide-cvar"]] end function
/// Parses an itemDef block through the keyword table, validates its type-specific data and records malformed or unknown properties.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `Item_Parse`.
/// @param value Value tested by `not itemParseKind(value,handle,strings.toLowerAscii(keyword),kind)` before the calculation continues.
function Item_Parse(handle,value) if next(handle)!="{" then return PC_SourceError(handle,"expected { after itemDef") end if;keywords=itemKeywords();while true keyword=next(handle);if keyword=="" then return PC_SourceError(handle,"unexpected EOF in itemDef") end if;if keyword=="}" then Item_ValidateTypeData(value);return true end if;kind=KeywordHash_Find(keywords,keyword);if kind is void then PC_SourceWarning(handle,"unknown item keyword "+keyword) else if not itemParseKind(value,handle,strings.toLowerAscii(keyword),kind) then return false end if end while end function
/// Updates `value.properties`, `value.window.name`, `value.fullScreen`, `value.window.style` and additional values during UI shared `putMenu`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.properties`, `value.window.name`, `value.fullScreen`, `value.window.style` and additional values.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param data Value assigned to `value.window.name`, `value.fullScreen`, `value.window.style`, `value.onOpen` and additional values.
function putMenu(value,key,data) value.properties=pairSet(value.properties,key,data);if key=="name" then value.window.name=data else if key=="fullscreen" then value.fullScreen=data!=0 else if key=="style" then value.window.style=data else if key=="visible" and data!=0 then value.window.flags=value.window.flags|WINDOW_VISIBLE else if key=="onopen" then value.onOpen=data else if key=="onclose" then value.onClose=data else if key=="onesc" then value.onESC=data else if key=="soundloop" then value.soundLoop=data else if key=="fadeclamp" then value.fadeClamp=data else if key=="fadeamount" then value.fadeAmount=data else if key=="fadecycle" then value.fadeCycle=data else if key=="ownerdraw" then value.ownerDraw=data else if key=="ownerdrawflag" then value.ownerDrawFlags=value.ownerDrawFlags|data else if key=="popup" then value.popup=true else if key=="outofbounds" then value.outOfBounds=true else if key=="background" then value.window.background=data else if key=="font" then value.font=data end if;return true end function
/// Updates `value.window.rect`, `value.window.backColor`, `value.window.foreColor`, `value.window.borderColor` and additional values during UI shared `menuParseKind`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.window.rect`, `value.window.backColor`, `value.window.foreColor`, `value.window.borderColor` and additional values.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `menuParseKind`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param kind Action/operation identifier used to select the engine service request.
function menuParseKind(value,handle,key,kind) if kind=="flag" then return putMenu(value,key,1) end if;data=void;if kind=="float" then data=PC_Float_Parse(handle) else if kind=="int" then data=PC_Int_Parse(handle) else if kind=="string" then data=PC_String_Parse(handle) else if kind=="script" then data=PC_Script_Parse(handle) else if kind=="rect" then data=PC_Rect_Parse(handle) else if kind=="color" then data=PC_Color_Parse(handle) else data=PC_String_Parse(handle) end if;if data is void then return PC_SourceError(handle,"expected "+kind+" for "+key) end if;if key=="rect" then value.window.rect=data else if key=="backcolor" then value.window.backColor=data else if key=="forecolor" then value.window.foreColor=data else if key=="bordercolor" then value.window.borderColor=data else if key=="focuscolor" then value.focusColor=data else if key=="disablecolor" then value.disableColor=data else if key=="outlinecolor" then value.window.outlineColor=data else if key=="border" then value.window.border=data else if key=="bordersize" then value.window.borderSize=data else putMenu(value,key,data) end if;return true end function
/// Provides the menu keywords table used by UI shared.
function menuKeywords() return [["font","string"],["name","string"],["fullscreen","int"],["rect","rect"],["style","int"],["visible","int"],["onOpen","script"],["onClose","script"],["onESC","script"],["border","int"],["borderSize","float"],["backcolor","color"],["forecolor","color"],["bordercolor","color"],["focuscolor","color"],["disablecolor","color"],["outlinecolor","color"],["background","string"],["cinematic","string"],["ownerdrawFlag","int"],["ownerdraw","int"],["popup","flag"],["outOfBounds","flag"],["soundLoop","string"],["fadeClamp","float"],["fadeAmount","float"],["fadeCycle","int"]] end function
/// Parses a menuDef block and its child items, applying supported properties and finalizing menu positions.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `Menu_Parse`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.items`.
function Menu_Parse(handle,value) if next(handle)!="{" then return PC_SourceError(handle,"expected { after menuDef") end if;keywords=menuKeywords();while true keyword=next(handle);if keyword=="" then return PC_SourceError(handle,"unexpected EOF in menuDef") end if;if keyword=="}" then Menu_PostParse(value);return true end if;if same(keyword,"itemDef") then child=item();child.parent=value;if not Item_Parse(handle,child) then return false end if;if len(value.items)<MAX_MENUITEMS then value.items=value.items+[child] end if else kind=KeywordHash_Find(keywords,keyword);if kind is void then PC_SourceWarning(handle,"unknown menu keyword "+keyword) else if not menuParseKind(value,handle,strings.toLowerAscii(keyword),kind) then return false end if end if end while end function
/// Parses and appends a menu unless MAX_MENUS has been reached or the source is malformed.
/// @param dc Mutable UI shared record/storage; this routine assigns `dc.menus`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `Menu_New`.
function Menu_New(dc,handle) if len(dc.menus)>=MAX_MENUS then return false end if;value=menu();if not Menu_Parse(handle,value) then return false end if;dc.menus=dc.menus+[value];return true end function

// Parse-entry wrappers retain the original public symbol surface.
/// @param value Argument 1 of `mq3.client.ui_shared.itemParseKind`.
/// @param handle Argument 2 of `mq3.client.ui_shared.itemParseKind`.
/// @param key Argument 3 of `mq3.client.ui_shared.itemParseKind`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.ui_shared.itemParseKind`.
function parseItem(value,handle,key,kind) return itemParseKind(value,handle,key,kind) end function
/// Adapts `mq3.client.ui_shared.menuParseKind` to UI shared `parseMenu`, returning its result for `value, handle, key, kind`.
/// @param value Argument 1 of `mq3.client.ui_shared.menuParseKind`.
/// @param handle Argument 2 of `mq3.client.ui_shared.menuParseKind`.
/// @param key Argument 3 of `mq3.client.ui_shared.menuParseKind`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.ui_shared.menuParseKind`.
function parseMenu(value,handle,key,kind) return menuParseKind(value,handle,key,kind) end function

/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_name`, returning its result for `value, handle, "name", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_name(value,handle) return parseItem(value,handle,"name","string") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_focusSound`, returning its result for `value, handle, "focussound", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_focusSound(value,handle) return parseItem(value,handle,"focussound","string") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_text`, returning its result for `value, handle, "text", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_text(value,handle) return parseItem(value,handle,"text","string") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_group`, returning its result for `value, handle, "group", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_group(value,handle) return parseItem(value,handle,"group","string") end function
/// Calls `mq3.client.ui_shared.PC_String_Parse`, `mq3.client.ui_shared.putItem` from UI shared `ItemParse_asset_model`. The final path returns `putItem(value,"asset_model",path)`.
/// @param value Value used by `return putItem(value,"asset_model",path)`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_asset_model`.
function ItemParse_asset_model(value,handle) path=PC_String_Parse(handle);if path is void then return false end if;return putItem(value,"asset_model",path) end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_asset_shader`, returning its result for `value, handle, "background", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_asset_shader(value,handle) return parseItem(value,handle,"background","string") end function
/// Reads the three floating-point model-origin coordinates into the item's preview data.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.modelOrigin`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_origin`.
function ItemParse_model_origin(value,handle) origin=[];for i=0 to 2 component=PC_Float_Parse(handle);if component is void then return false end if;origin=origin+[component] end for;value.typeData.modelOrigin=origin;return true end function
/// Updates `value.typeData.modelFovX` during UI shared `ItemParse_model_fovx`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.modelFovX`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_fovx`.
function ItemParse_model_fovx(value,handle) result=PC_Float_Parse(handle);if result is void then return false end if;value.typeData.modelFovX=result;return true end function
/// Updates `value.typeData.modelFovY` during UI shared `ItemParse_model_fovy`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.modelFovY`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_fovy`.
function ItemParse_model_fovy(value,handle) result=PC_Float_Parse(handle);if result is void then return false end if;value.typeData.modelFovY=result;return true end function
/// Updates `value.typeData.modelRotation` during UI shared `ItemParse_model_rotation`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.modelRotation`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_rotation`.
function ItemParse_model_rotation(value,handle) result=PC_Int_Parse(handle);if result is void then return false end if;value.typeData.modelRotation=result;return true end function
/// Updates `value.typeData.modelAngle` during UI shared `ItemParse_model_angle`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.modelAngle`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_model_angle`.
function ItemParse_model_angle(value,handle) result=PC_Float_Parse(handle);if result is void then return false end if;value.typeData.modelAngle=result;return true end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_rect`, returning its result for `value, handle, "rect", "rect"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_rect(value,handle) return parseItem(value,handle,"rect","rect") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_style`, returning its result for `value, handle, "style", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_style(value,handle) return parseItem(value,handle,"style","int") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_decoration`, returning its result for `value, handle, "decoration", "flag"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_decoration(value,handle) return parseItem(value,handle,"decoration","flag") end function
/// Updates `value.typeData.notselectable` during UI shared `ItemParse_notselectable`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.notselectable`.
/// @param handle Accepted for compatibility with `ItemParse_notselectable`; the current implementation does not read it.
function ItemParse_notselectable(value,handle) value.typeData.notselectable=true;return putItem(value,"notselectable",1) end function
/// Adapts `mq3.client.ui_shared.putItem` to UI shared `ItemParse_wrapped`, returning its result for `value, "wrapped", 1`.
/// @param value Argument 1 of `mq3.client.ui_shared.putItem`.
/// @param handle Accepted for compatibility with `ItemParse_wrapped`; the current implementation does not read it.
function ItemParse_wrapped(value,handle) return putItem(value,"wrapped",1) end function
/// Adapts `mq3.client.ui_shared.putItem` to UI shared `ItemParse_autowrapped`, returning its result for `value, "autowrapped", 1`.
/// @param value Argument 1 of `mq3.client.ui_shared.putItem`.
/// @param handle Accepted for compatibility with `ItemParse_autowrapped`; the current implementation does not read it.
function ItemParse_autowrapped(value,handle) return putItem(value,"autowrapped",1) end function
/// Enables horizontal list-box scrolling and sets the corresponding window flag.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.horizontal`, `value.window.flags`.
/// @param handle Accepted for compatibility with `ItemParse_horizontalscroll`; the current implementation does not read it.
function ItemParse_horizontalscroll(value,handle) value.typeData.horizontal=true;value.window.flags=value.window.flags|WINDOW_HORIZONTAL;return true end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_type`, returning its result for `value, handle, "type", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_type(value,handle) return parseItem(value,handle,"type","int") end function
/// Updates `value.typeData.elementWidth` during UI shared `ItemParse_elementwidth`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.elementWidth`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_elementwidth`.
function ItemParse_elementwidth(value,handle) result=PC_Float_Parse(handle);if result is void then return false end if;value.typeData.elementWidth=result;return true end function
/// Updates `value.typeData.elementHeight` during UI shared `ItemParse_elementheight`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.elementHeight`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_elementheight`.
function ItemParse_elementheight(value,handle) result=PC_Float_Parse(handle);if result is void then return false end if;value.typeData.elementHeight=result;return true end function
/// Updates `value.typeData.feeder`, `value.special` during UI shared `ItemParse_feeder`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.feeder`, `value.special`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_feeder`.
function ItemParse_feeder(value,handle) result=PC_Float_Parse(handle);if result is void then return false end if;value.typeData.feeder=result;value.special=result;return true end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_elementtype`, returning its result for `value, handle, "elementtype", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_elementtype(value,handle) return parseItem(value,handle,"elementtype","int") end function
/// Parses a count followed by list-box column position, width and character-limit triples, stopping on missing values.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.columns`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_columns`.
function ItemParse_columns(value,handle) count=PC_Int_Parse(handle);if count is void then return false end if;value.typeData.columns=[];for i=0 to count-1 position=PC_Int_Parse(handle);width=PC_Int_Parse(handle);maxChars=PC_Int_Parse(handle);if position is void or width is void or maxChars is void then return false end if;value.typeData.columns=value.typeData.columns+[[position,width,maxChars]] end for;return true end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_border`, returning its result for `value, handle, "border", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_border(value,handle) return parseItem(value,handle,"border","int") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_bordersize`, returning its result for `value, handle, "bordersize", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_bordersize(value,handle) return parseItem(value,handle,"bordersize","float") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_visible`, returning its result for `value, handle, "visible", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_visible(value,handle) return parseItem(value,handle,"visible","int") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_ownerdraw`, returning its result for `value, handle, "ownerdraw", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_ownerdraw(value,handle) return parseItem(value,handle,"ownerdraw","int") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_align`, returning its result for `value, handle, "align", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_align(value,handle) return parseItem(value,handle,"align","int") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textalign`, returning its result for `value, handle, "textalign", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_textalign(value,handle) return parseItem(value,handle,"textalign","int") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textalignx`, returning its result for `value, handle, "textalignx", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_textalignx(value,handle) return parseItem(value,handle,"textalignx","float") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textaligny`, returning its result for `value, handle, "textaligny", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_textaligny(value,handle) return parseItem(value,handle,"textaligny","float") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textscale`, returning its result for `value, handle, "textscale", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_textscale(value,handle) return parseItem(value,handle,"textscale","float") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_textstyle`, returning its result for `value, handle, "textstyle", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_textstyle(value,handle) return parseItem(value,handle,"textstyle","int") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_backcolor`, returning its result for `value, handle, "backcolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_backcolor(value,handle) return parseItem(value,handle,"backcolor","color") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_forecolor`, returning its result for `value, handle, "forecolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_forecolor(value,handle) return parseItem(value,handle,"forecolor","color") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_bordercolor`, returning its result for `value, handle, "bordercolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_bordercolor(value,handle) return parseItem(value,handle,"bordercolor","color") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_outlinecolor`, returning its result for `value, handle, "outlinecolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_outlinecolor(value,handle) return parseItem(value,handle,"outlinecolor","color") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_background`, returning its result for `value, handle, "background", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_background(value,handle) return parseItem(value,handle,"background","string") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_cinematic`, returning its result for `value, handle, "cinematic", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_cinematic(value,handle) return parseItem(value,handle,"cinematic","string") end function
/// Updates `value.typeData.doubleClick` during UI shared `ItemParse_doubleClick`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.doubleClick`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_doubleClick`.
function ItemParse_doubleClick(value,handle) result=PC_Script_Parse(handle);if result is void then return false end if;value.typeData.doubleClick=result;return true end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_onFocus`, returning its result for `value, handle, "onfocus", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_onFocus(value,handle) return parseItem(value,handle,"onfocus","script") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_leaveFocus`, returning its result for `value, handle, "leavefocus", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_leaveFocus(value,handle) return parseItem(value,handle,"leavefocus","script") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseEnter`, returning its result for `value, handle, "mouseenter", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_mouseEnter(value,handle) return parseItem(value,handle,"mouseenter","script") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseExit`, returning its result for `value, handle, "mouseexit", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_mouseExit(value,handle) return parseItem(value,handle,"mouseexit","script") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseEnterText`, returning its result for `value, handle, "mouseentertext", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_mouseEnterText(value,handle) return parseItem(value,handle,"mouseentertext","script") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_mouseExitText`, returning its result for `value, handle, "mouseexittext", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_mouseExitText(value,handle) return parseItem(value,handle,"mouseexittext","script") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_action`, returning its result for `value, handle, "action", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_action(value,handle) return parseItem(value,handle,"action","script") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_special`, returning its result for `value, handle, "special", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_special(value,handle) return parseItem(value,handle,"special","float") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_cvarTest`, returning its result for `value, handle, "cvartest", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_cvarTest(value,handle) return parseItem(value,handle,"cvartest","string") end function
/// Adapts `mq3.client.ui_shared.parseItem` to UI shared `ItemParse_cvar`, returning its result for `value, handle, "cvar", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseItem`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseItem`.
function ItemParse_cvar(value,handle) return parseItem(value,handle,"cvar","string") end function
/// Updates `value.typeData.maxChars` during UI shared `ItemParse_maxChars`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.maxChars`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_maxChars`.
function ItemParse_maxChars(value,handle) result=PC_Int_Parse(handle);if result is void then return false end if;value.typeData.maxChars=clamp(result,0,MAX_EDITFIELD);return true end function
/// Updates `value.typeData.maxPaintChars` during UI shared `ItemParse_maxPaintChars`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.maxPaintChars`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_maxPaintChars`.
function ItemParse_maxPaintChars(value,handle) result=PC_Int_Parse(handle);if result is void then return false end if;value.typeData.maxPaintChars=clamp(result,0,MAX_EDITFIELD);return true end function
/// Updates `value.cvar`, `value.typeData.defVal`, `value.typeData.minVal`, `value.typeData.maxVal` during UI shared `ItemParse_cvarFloat`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.cvar`, `value.typeData.defVal`, `value.typeData.minVal`, `value.typeData.maxVal`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_cvarFloat`.
function ItemParse_cvarFloat(value,handle) value.cvar=PC_String_Parse(handle);value.typeData.defVal=PC_Float_Parse(handle);value.typeData.minVal=PC_Float_Parse(handle);value.typeData.maxVal=PC_Float_Parse(handle);return value.cvar is not void and value.typeData.defVal is not void and value.typeData.minVal is not void and value.typeData.maxVal is not void end function
/// Updates `value.typeData.settings`, `value.typeData.values` during UI shared `parseList`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.typeData.settings`, `value.typeData.values`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `parseList`.
/// @param floatValues Value used by `if floatValues then value.typeData.values=value.typeData.values+[numbers.atof(raw)] else value.typeData.values=value.typeData.values+[raw] end...`.
function parseList(value,handle,floatValues) if next(handle)!="{" then return false end if;value.typeData.settings=[];value.typeData.values=[];while true label=next(handle);if label=="" then return false end if;if label=="}" then return true end if;raw=next(handle);if raw=="" then return false end if;value.typeData.settings=value.typeData.settings+[label];if floatValues then value.typeData.values=value.typeData.values+[numbers.atof(raw)] else value.typeData.values=value.typeData.values+[raw] end if end while end function
/// Adapts `mq3.client.ui_shared.parseList` to UI shared `ItemParse_cvarStrList`, returning its result for `value, handle, false`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseList`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseList`.
function ItemParse_cvarStrList(value,handle) return parseList(value,handle,false) end function
/// Adapts `mq3.client.ui_shared.parseList` to UI shared `ItemParse_cvarFloatList`, returning its result for `value, handle, true`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseList`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseList`.
function ItemParse_cvarFloatList(value,handle) return parseList(value,handle,true) end function
/// Updates `value.colorRanges` during UI shared `ItemParse_addColorRange`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.colorRanges`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_addColorRange`.
function ItemParse_addColorRange(value,handle) low=PC_Float_Parse(handle);high=PC_Float_Parse(handle);tint=PC_Color_Parse(handle);if low is void or high is void or tint is void then return false end if;value.colorRanges=value.colorRanges+[[low,high,tint]];return true end function
/// Updates `value.ownerDrawFlags` during UI shared `ItemParse_ownerdrawFlag`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.ownerDrawFlags`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `ItemParse_ownerdrawFlag`.
function ItemParse_ownerdrawFlag(value,handle) parsed=PC_Int_Parse(handle);if parsed is void then return false end if;value.ownerDrawFlags=value.ownerDrawFlags|parsed;return true end function
/// Updates `value.enableCvar`, `value.cvarFlags` during UI shared `parseCvarGate`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.enableCvar`, `value.cvarFlags`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `parseCvarGate`.
/// @param key Key or control identifier used to select the corresponding UI shared entry.
/// @param flag Value used by `value.cvarFlags=value.cvarFlags|flag`.
function parseCvarGate(value,handle,key,flag) text=PC_Script_Parse(handle);if text is void then return false end if;value.enableCvar=text;value.cvarFlags=value.cvarFlags|flag;return putItem(value,key,text) end function
/// Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_enableCvar`, returning its result for `value, handle, "enablecvar", 1`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseCvarGate`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseCvarGate`.
function ItemParse_enableCvar(value,handle) return parseCvarGate(value,handle,"enablecvar",1) end function
/// Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_disableCvar`, returning its result for `value, handle, "disablecvar", 2`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseCvarGate`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseCvarGate`.
function ItemParse_disableCvar(value,handle) return parseCvarGate(value,handle,"disablecvar",2) end function
/// Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_showCvar`, returning its result for `value, handle, "showcvar", 4`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseCvarGate`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseCvarGate`.
function ItemParse_showCvar(value,handle) return parseCvarGate(value,handle,"showcvar",4) end function
/// Adapts `mq3.client.ui_shared.parseCvarGate` to UI shared `ItemParse_hideCvar`, returning its result for `value, handle, "hidecvar", 8`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseCvarGate`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseCvarGate`.
function ItemParse_hideCvar(value,handle) return parseCvarGate(value,handle,"hidecvar",8) end function

/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_font`, returning its result for `value, handle, "font", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_font(value,handle) return parseMenu(value,handle,"font","string") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_name`, returning its result for `value, handle, "name", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_name(value,handle) return parseMenu(value,handle,"name","string") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fullscreen`, returning its result for `value, handle, "fullscreen", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_fullscreen(value,handle) return parseMenu(value,handle,"fullscreen","int") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_rect`, returning its result for `value, handle, "rect", "rect"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_rect(value,handle) return parseMenu(value,handle,"rect","rect") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_style`, returning its result for `value, handle, "style", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_style(value,handle) return parseMenu(value,handle,"style","int") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_visible`, returning its result for `value, handle, "visible", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_visible(value,handle) return parseMenu(value,handle,"visible","int") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_onOpen`, returning its result for `value, handle, "onopen", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_onOpen(value,handle) return parseMenu(value,handle,"onopen","script") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_onClose`, returning its result for `value, handle, "onclose", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_onClose(value,handle) return parseMenu(value,handle,"onclose","script") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_onESC`, returning its result for `value, handle, "onesc", "script"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_onESC(value,handle) return parseMenu(value,handle,"onesc","script") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_border`, returning its result for `value, handle, "border", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_border(value,handle) return parseMenu(value,handle,"border","int") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_borderSize`, returning its result for `value, handle, "bordersize", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_borderSize(value,handle) return parseMenu(value,handle,"bordersize","float") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_backcolor`, returning its result for `value, handle, "backcolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_backcolor(value,handle) return parseMenu(value,handle,"backcolor","color") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_forecolor`, returning its result for `value, handle, "forecolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_forecolor(value,handle) return parseMenu(value,handle,"forecolor","color") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_bordercolor`, returning its result for `value, handle, "bordercolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_bordercolor(value,handle) return parseMenu(value,handle,"bordercolor","color") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_focuscolor`, returning its result for `value, handle, "focuscolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_focuscolor(value,handle) return parseMenu(value,handle,"focuscolor","color") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_disablecolor`, returning its result for `value, handle, "disablecolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_disablecolor(value,handle) return parseMenu(value,handle,"disablecolor","color") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_outlinecolor`, returning its result for `value, handle, "outlinecolor", "color"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_outlinecolor(value,handle) return parseMenu(value,handle,"outlinecolor","color") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_background`, returning its result for `value, handle, "background", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_background(value,handle) return parseMenu(value,handle,"background","string") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_cinematic`, returning its result for `value, handle, "cinematic", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_cinematic(value,handle) return parseMenu(value,handle,"cinematic","string") end function
/// Updates `value.ownerDrawFlags` during UI shared `MenuParse_ownerdrawFlag`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.ownerDrawFlags`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `MenuParse_ownerdrawFlag`.
function MenuParse_ownerdrawFlag(value,handle) parsed=PC_Int_Parse(handle);if parsed is void then return false end if;value.ownerDrawFlags=value.ownerDrawFlags|parsed;return true end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_ownerdraw`, returning its result for `value, handle, "ownerdraw", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_ownerdraw(value,handle) return parseMenu(value,handle,"ownerdraw","int") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_popup`, returning its result for `value, handle, "popup", "flag"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_popup(value,handle) return parseMenu(value,handle,"popup","flag") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_outOfBounds`, returning its result for `value, handle, "outofbounds", "flag"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_outOfBounds(value,handle) return parseMenu(value,handle,"outofbounds","flag") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_soundLoop`, returning its result for `value, handle, "soundloop", "string"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_soundLoop(value,handle) return parseMenu(value,handle,"soundloop","string") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fadeClamp`, returning its result for `value, handle, "fadeclamp", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_fadeClamp(value,handle) return parseMenu(value,handle,"fadeclamp","float") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fadeAmount`, returning its result for `value, handle, "fadeamount", "float"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_fadeAmount(value,handle) return parseMenu(value,handle,"fadeamount","float") end function
/// Adapts `mq3.client.ui_shared.parseMenu` to UI shared `MenuParse_fadeCycle`, returning its result for `value, handle, "fadecycle", "int"`.
/// @param value Argument 1 of `mq3.client.ui_shared.parseMenu`.
/// @param handle Argument 2 of `mq3.client.ui_shared.parseMenu`.
function MenuParse_fadeCycle(value,handle) return parseMenu(value,handle,"fadecycle","int") end function
/// Updates `value.items` during UI shared `MenuParse_itemDef`.
/// @param value Mutable UI shared record/storage; this routine assigns `value.items`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `MenuParse_itemDef`.
function MenuParse_itemDef(value,handle) child=item();child.parent=value;if not Item_Parse(handle,child) then return false end if;if len(value.items)>=MAX_MENUITEMS then return false end if;value.items=value.items+[child];return true end function
