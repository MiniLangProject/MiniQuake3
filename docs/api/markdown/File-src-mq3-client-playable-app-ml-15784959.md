# `src/mq3/client/playable_app.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_app`](Package-mq3-client-playable-app-683846723.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/wav.ml` as `wav` → [src/mq3/audio/wav.ml](File-src-mq3-audio-wav-ml-983927564.md)
- `mq3/client/baseq3_hud.ml` as `baseHud` → [src/mq3/client/baseq3_hud.ml](File-src-mq3-client-baseq3-hud-ml-1439544244.md)
- `mq3/client/baseq3_match_display.ml` as `baseMatchDisplay` → [src/mq3/client/baseq3_match_display.ml](File-src-mq3-client-baseq3-match-display-ml-1367704051.md)
- `mq3/client/cgame_info.ml` as `cgameInfo` → [src/mq3/client/cgame_info.ml](File-src-mq3-client-cgame-info-ml-1413900769.md)
- `mq3/client/playable_ambient_sounds.ml` as `ambientSounds` → [src/mq3/client/playable_ambient_sounds.ml](File-src-mq3-client-playable-ambient-sounds-ml-1265245123.md)
- `mq3/client/playable_combat_view.ml` as `combatView` → [src/mq3/client/playable_combat_view.ml](File-src-mq3-client-playable-combat-view-ml-1357380718.md)
- `mq3/client/playable_effects.ml` as `effects` → [src/mq3/client/playable_effects.ml](File-src-mq3-client-playable-effects-ml-1583408352.md)
- `mq3/client/playable_enemy_ai.ml` as `enemyAi` → [src/mq3/client/playable_enemy_ai.ml](File-src-mq3-client-playable-enemy-ai-ml-948510501.md)
- `mq3/client/playable_enemy_events.ml` as `enemyEvents` → [src/mq3/client/playable_enemy_events.ml](File-src-mq3-client-playable-enemy-events-ml-1483454816.md)
- `mq3/client/playable_enemy_hitscan.ml` as `enemyHitscan` → [src/mq3/client/playable_enemy_hitscan.ml](File-src-mq3-client-playable-enemy-hitscan-ml-260885231.md)
- `mq3/client/playable_enemy_movement.ml` as `enemyMovement` → [src/mq3/client/playable_enemy_movement.ml](File-src-mq3-client-playable-enemy-movement-ml-941250028.md)
- `mq3/client/playable_explosions.ml` as `playableExplosions` → [src/mq3/client/playable_explosions.ml](File-src-mq3-client-playable-explosions-ml-2142049028.md)
- `mq3/client/playable_fps_title.ml` as `fpsTitle` → [src/mq3/client/playable_fps_title.ml](File-src-mq3-client-playable-fps-title-ml-173965588.md)
- `mq3/client/playable_hud.ml` as `hud` → [src/mq3/client/playable_hud.ml](File-src-mq3-client-playable-hud-ml-310363425.md)
- `mq3/client/playable_item_models.ml` as `itemModels` → [src/mq3/client/playable_item_models.ml](File-src-mq3-client-playable-item-models-ml-1740601852.md)
- `mq3/client/playable_items.ml` as `playableItems` → [src/mq3/client/playable_items.ml](File-src-mq3-client-playable-items-ml-142579930.md)
- `mq3/client/playable_marks.ml` as `playableMarks` → [src/mq3/client/playable_marks.ml](File-src-mq3-client-playable-marks-ml-2118417332.md)
- `mq3/client/playable_match.ml` as `playableMatch` → [src/mq3/client/playable_match.ml](File-src-mq3-client-playable-match-ml-1136176865.md)
- `mq3/client/playable_menu.ml` as `menu` → [src/mq3/client/playable_menu.ml](File-src-mq3-client-playable-menu-ml-1211516485.md)
- `mq3/client/playable_movement.ml` as `playableMovement` → [src/mq3/client/playable_movement.ml](File-src-mq3-client-playable-movement-ml-1276157067.md)
- `mq3/client/playable_muzzle_flash.ml` as `muzzleFlash` → [src/mq3/client/playable_muzzle_flash.ml](File-src-mq3-client-playable-muzzle-flash-ml-1875198432.md)
- `mq3/client/playable_player.ml` as `playablePlayer` → [src/mq3/client/playable_player.ml](File-src-mq3-client-playable-player-ml-625035251.md)
- `mq3/client/playable_player_projectiles.ml` as `playerProjectiles` → [src/mq3/client/playable_player_projectiles.ml](File-src-mq3-client-playable-player-projectiles-ml-210819166.md)
- `mq3/client/playable_player_shadows.ml` as `playerShadows` → [src/mq3/client/playable_player_shadows.ml](File-src-mq3-client-playable-player-shadows-ml-274754233.md)
- `mq3/client/playable_projectile_fx.ml` as `projectileFx` → [src/mq3/client/playable_projectile_fx.ml](File-src-mq3-client-playable-projectile-fx-ml-1498990564.md)
- `mq3/client/playable_projectile_models.ml` as `projectileModels` → [src/mq3/client/playable_projectile_models.ml](File-src-mq3-client-playable-projectile-models-ml-57815768.md)
- `mq3/client/playable_projectile_view.ml` as `projectileView` → [src/mq3/client/playable_projectile_view.ml](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)
- `mq3/client/playable_shotgun.ml` as `playableShotgun` → [src/mq3/client/playable_shotgun.ml](File-src-mq3-client-playable-shotgun-ml-2136037152.md)
- `mq3/client/playable_sky.ml` as `playableSky` → [src/mq3/client/playable_sky.ml](File-src-mq3-client-playable-sky-ml-624488737.md)
- `mq3/client/playable_spatial_ambient.ml` as `spatialAmbient` → [src/mq3/client/playable_spatial_ambient.ml](File-src-mq3-client-playable-spatial-ambient-ml-1799232719.md)
- `mq3/client/playable_target_render.ml` as `targetRender` → [src/mq3/client/playable_target_render.ml](File-src-mq3-client-playable-target-render-ml-2094681528.md)
- `mq3/client/playable_targets.ml` as `playableTargets` → [src/mq3/client/playable_targets.ml](File-src-mq3-client-playable-targets-ml-87537228.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/client/playable_viewmodel.ml` as `viewmodel` → [src/mq3/client/playable_viewmodel.ml](File-src-mq3-client-playable-viewmodel-ml-1609227520.md)
- `mq3/client/playable_weapon.ml` as `playableWeapon` → [src/mq3/client/playable_weapon.ml](File-src-mq3-client-playable-weapon-ml-1762261884.md)
- `mq3/client/playable_weapon_barrel.ml` as `weaponBarrel` → [src/mq3/client/playable_weapon_barrel.ml](File-src-mq3-client-playable-weapon-barrel-ml-1354311309.md)
- `mq3/client/playable_weapon_inventory.ml` as `weaponInventory` → [src/mq3/client/playable_weapon_inventory.ml](File-src-mq3-client-playable-weapon-inventory-ml-1741297641.md)
- `mq3/client/playable_weapon_sounds.ml` as `weaponSounds` → [src/mq3/client/playable_weapon_sounds.ml](File-src-mq3-client-playable-weapon-sounds-ml-1233645377.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/format/player_animation.ml` as `playerAnimation` → [src/mq3/format/player_animation.ml](File-src-mq3-format-player-animation-ml-408606289.md)
- `mq3/platform/playable_audio.ml` as `audio` → [src/mq3/platform/playable_audio.ml](File-src-mq3-platform-playable-audio-ml-1415322964.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/bsp_preview.ml` as `preview` → [src/mq3/renderer/bsp_preview.ml](File-src-mq3-renderer-bsp-preview-ml-563591503.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `dynamicLights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)
- `mq3/renderer/playable_fog.ml` as `playableFog` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_light_grid.ml` as `playableLightGrid` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/playable_world_batch.ml` as `playableWorldBatch` → [src/mq3/renderer/playable_world_batch.ml](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)
- `mq3/renderer/player_model_assembly.ml` as `playerAssembly` → [src/mq3/renderer/player_model_assembly.ml](File-src-mq3-renderer-player-model-assembly-ml-170504265.md)
- `mq3/renderer/player_render_cache.ml` as `playerCache` → [src/mq3/renderer/player_render_cache.ml](File-src-mq3-renderer-player-render-cache-ml-273188728.md)
- `mq3/renderer/player_skins.ml` as `playerSkins` → [src/mq3/renderer/player_skins.ml](File-src-mq3-renderer-player-skins-ml-163797353.md)
- `mq3/renderer/world_surface_selection.ml` as `worldSelection` → [src/mq3/renderer/world_surface_selection.ml](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/time.ml` as `time` → `../MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-app-animatedplayertriangles-function-animatedplayertriangles-assets-now-src-mq3-client-playable-app-ml-1384990373"></a>
### animatedPlayerTriangles

```ml
function animatedPlayerTriangles(assets, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L514)

<a id="function-function-mq3-client-playable-app-appendskintextures-function-appendskintextures-textures-skin-part-src-mq3-client-playable-app-ml-603126326"></a>
### appendSkinTextures

```ml
function appendSkinTextures(textures, skin, part)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textures` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L459)

<a id="function-function-mq3-client-playable-app-applyselectedweapon-function-applyselectedweapon-inventorystate-weaponstate-playerstate-itemstate-combatstate-src-mq3-client-playable-app-ml-2101830405"></a>
### applySelectedWeapon

```ml
function applySelectedWeapon(inventoryState, weaponState, playerState, itemState, combatState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventoryState` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |
| `playerState` | `dynamic` | — |  |
| `itemState` | `dynamic` | — |  |
| `combatState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L302)

<a id="function-function-mq3-client-playable-app-archivebytes-function-archivebytes-archive-name-src-mq3-client-playable-app-ml-106071433"></a>
### archiveBytes

```ml
function archiveBytes(archive, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L215)

<a id="function-function-mq3-client-playable-app-archivemodel-function-archivemodel-archive-name-maxtriangles-src-mq3-client-playable-app-ml-50455986"></a>
### archiveModel

```ml
function archiveModel(archive, name, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L207)

<a id="function-function-mq3-client-playable-app-archiveplayerassets-function-archiveplayerassets-archive-shaderscripts-src-mq3-client-playable-app-ml-1439517895"></a>
### archivePlayerAssets

```ml
function archivePlayerAssets(archive, shaderScripts)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `shaderScripts` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L468)

<a id="function-function-mq3-client-playable-app-archivesound-function-archivesound-archive-name-src-mq3-client-playable-app-ml-231957685"></a>
### archiveSound

```ml
function archiveSound(archive, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L153)

<a id="function-function-mq3-client-playable-app-captureenemypositions-function-captureenemypositions-targetstate-src-mq3-client-playable-app-ml-1992751466"></a>
### captureEnemyPositions

```ml
function captureEnemyPositions(targetState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L97)

<a id="function-function-mq3-client-playable-app-collideenemypositions-function-collideenemypositions-world-targetstate-previous-src-mq3-client-playable-app-ml-1639791781"></a>
### collideEnemyPositions

```ml
function collideEnemyPositions(world, targetState, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L112)

<a id="function-function-mq3-client-playable-app-createrendertargets-function-createrendertargets-targetstate-src-mq3-client-playable-app-ml-2026235866"></a>
### createRenderTargets

```ml
function createRenderTargets(targetState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L612)

<a id="function-function-mq3-client-playable-app-detailedplayertextureslot-function-detailedplayertextureslot-assets-triangle-src-mq3-client-playable-app-ml-1182518443"></a>
### detailedPlayerTextureSlot

```ml
function detailedPlayerTextureSlot(assets, triangle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L501)

<a id="function-function-mq3-client-playable-app-digitweapondown-function-digitweapondown-src-mq3-client-playable-app-ml-1540387160"></a>
### digitWeaponDown

```ml
function digitWeaponDown()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L289)

<a id="function-function-mq3-client-playable-app-drawclippeditemtriangles-function-drawclippeditemtriangles-projection-triangles-lightgrid-src-mq3-client-playable-app-ml-2041707728"></a>
### drawClippedItemTriangles

```ml
function drawClippedItemTriangles(projection, triangles, lightGrid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `lightGrid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L383)

<a id="function-function-mq3-client-playable-app-drawitemtriangles-function-drawitemtriangles-projection-triangles-lightgrid-src-mq3-client-playable-app-ml-1351745200"></a>
### drawItemTriangles

```ml
function drawItemTriangles(projection, triangles, lightGrid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `lightGrid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L371)

<a id="function-function-mq3-client-playable-app-drawmodeltriangle-function-drawmodeltriangle-projection-triangle-red-green-blue-lit-sampled-src-mq3-client-playable-app-ml-458220958"></a>
### drawModelTriangle

```ml
function drawModelTriangle(projection, triangle, red, green, blue, lit, sampled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `lit` | `dynamic` | — |  |
| `sampled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L350)

<a id="function-function-mq3-client-playable-app-drawprojectiletriangles-function-drawprojectiletriangles-projection-triangles-lightgrid-src-mq3-client-playable-app-ml-1168234008"></a>
### drawProjectileTriangles

```ml
function drawProjectileTriangles(projection, triangles, lightGrid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `lightGrid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L392)

<a id="function-function-mq3-client-playable-app-drawtargetweapon-function-drawtargetweapon-projection-itemcatalog-modelassets-index-input-lower-upper-root-show-now-lightgrid-src-mq3-client-playable-app-ml-1894653815"></a>
### drawTargetWeapon

```ml
function drawTargetWeapon(projection, itemCatalog, modelAssets, index, input, lower, upper, root, show, now, lightGrid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `input` | `dynamic` | — |  |
| `lower` | `dynamic` | — |  |
| `upper` | `dynamic` | — |  |
| `root` | `dynamic` | — |  |
| `show` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `lightGrid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L534)

<a id="function-function-mq3-client-playable-app-drawtinteditemtriangles-function-drawtinteditemtriangles-projection-triangles-red-green-blue-src-mq3-client-playable-app-ml-1244049584"></a>
### drawTintedItemTriangles

```ml
function drawTintedItemTriangles(projection, triangles, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L428)

<a id="function-function-mq3-client-playable-app-enemyattackmuzzles-function-enemyattackmuzzles-camera-targetstate-modelassets-itemcatalog-enemystate-src-mq3-client-playable-app-ml-1251370192"></a>
### enemyAttackMuzzles

```ml
function enemyAttackMuzzles(camera, targetState, modelAssets, itemCatalog, enemyState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |
| `enemyState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L565)

<a id="function-function-mq3-client-playable-app-fallbackmodellight-function-fallbackmodellight-normal-src-mq3-client-playable-app-ml-1044856901"></a>
### fallbackModelLight

```ml
function fallbackModelLight(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L337)

<a id="function-function-mq3-client-playable-app-field-function-field-fields-key-src-mq3-client-playable-app-ml-492997800"></a>
### field

```ml
function field(fields, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L126)

<a id="function-function-mq3-client-playable-app-firstfreehudtexture-function-firstfreehudtexture-modelassets-itemcatalog-src-mq3-client-playable-app-ml-560772144"></a>
### firstFreeHudTexture

```ml
function firstFreeHudTexture(modelAssets, itemCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L259)

<a id="function-function-mq3-client-playable-app-firstfreemenutexture-function-firstfreemenutexture-modelassets-itemcatalog-basehudcatalog-src-mq3-client-playable-app-ml-1119881569"></a>
### firstFreeMenuTexture

```ml
function firstFreeMenuTexture(modelAssets, itemCatalog, baseHudCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |
| `baseHudCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L265)

<a id="function-function-mq3-client-playable-app-firstfreemodeltexture-function-firstfreemodeltexture-modelassets-src-mq3-client-playable-app-ml-865218468"></a>
### firstFreeModelTexture

```ml
function firstFreeModelTexture(modelAssets)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L253)

<a id="function-function-mq3-client-playable-app-frameloop-function-frameloop-camera-geometry-triangles-worldbatchstate-materialcatalog-fogcatalog-dlightcatalog-markcatalog-markstate-explosioncatalog-worldcache-worldconfig-selectedfaceindexes-materialslots-skytextureflags-dlightreceiveflags-skycatalog-itemcatalog-projectilecatalog-projectilefxstate-hudstate-basehudcatalog-basehudstate-menucatalog-menustate-matchmedia-itemstate-inventorystate-weaponstate-targetstate-rendertargets-modelassets-combatstate-matchstate-playerstate-enemystate-eventstate-playerprojectilestate-controller-fpsstate-viewmodeltracker-viewmodelsettings-viewmodelcatalog-viewmodelanimation-barrelstate-spatialruntime-maxframes-matchsounds-firesound-weaponsoundcatalog-enemyfiresound-enemyimpactsound-pickupsound-jumpsound-painsound-deathsound-src-mq3-client-playable-app-ml-1951504146"></a>
### frameLoop

```ml
function frameLoop(camera, geometry, triangles, worldBatchState, materialCatalog, fogCatalog, dlightCatalog, markCatalog, markState, explosionCatalog, worldCache, worldConfig, selectedFaceIndexes, materialSlots, skyTextureFlags, dlightReceiveFlags, skyCatalog, itemCatalog, projectileCatalog, projectileFxState, hudState, baseHudCatalog, baseHudState, menuCatalog, menuState, matchMedia, itemState, inventoryState, weaponState, targetState, renderTargets, modelAssets, combatState, matchState, playerState, enemyState, eventState, playerProjectileState, controller, fpsState, viewmodelTracker, viewmodelSettings, viewmodelCatalog, viewmodelAnimation, barrelState, spatialRuntime, maxFrames, matchSounds, fireSound, weaponSoundCatalog, enemyFireSound, enemyImpactSound, pickupSound, jumpSound, painSound, deathSound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `geometry` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `worldBatchState` | `dynamic` | — |  |
| `materialCatalog` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `dlightCatalog` | `dynamic` | — |  |
| `markCatalog` | `dynamic` | — |  |
| `markState` | `dynamic` | — |  |
| `explosionCatalog` | `dynamic` | — |  |
| `worldCache` | `dynamic` | — |  |
| `worldConfig` | `dynamic` | — |  |
| `selectedFaceIndexes` | `dynamic` | — |  |
| `materialSlots` | `dynamic` | — |  |
| `skyTextureFlags` | `dynamic` | — |  |
| `dlightReceiveFlags` | `dynamic` | — |  |
| `skyCatalog` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |
| `projectileCatalog` | `dynamic` | — |  |
| `projectileFxState` | `dynamic` | — |  |
| `hudState` | `dynamic` | — |  |
| `baseHudCatalog` | `dynamic` | — |  |
| `baseHudState` | `dynamic` | — |  |
| `menuCatalog` | `dynamic` | — |  |
| `menuState` | `dynamic` | — |  |
| `matchMedia` | `dynamic` | — |  |
| `itemState` | `dynamic` | — |  |
| `inventoryState` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `renderTargets` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `combatState` | `dynamic` | — |  |
| `matchState` | `dynamic` | — |  |
| `playerState` | `dynamic` | — |  |
| `enemyState` | `dynamic` | — |  |
| `eventState` | `dynamic` | — |  |
| `playerProjectileState` | `dynamic` | — |  |
| `controller` | `dynamic` | — |  |
| `fpsState` | `dynamic` | — |  |
| `viewmodelTracker` | `dynamic` | — |  |
| `viewmodelSettings` | `dynamic` | — |  |
| `viewmodelCatalog` | `dynamic` | — |  |
| `viewmodelAnimation` | `dynamic` | — |  |
| `barrelState` | `dynamic` | — |  |
| `spatialRuntime` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `matchSounds` | `dynamic` | — |  |
| `fireSound` | `dynamic` | — |  |
| `weaponSoundCatalog` | `dynamic` | — |  |
| `enemyFireSound` | `dynamic` | — |  |
| `enemyImpactSound` | `dynamic` | — |  |
| `pickupSound` | `dynamic` | — |  |
| `jumpSound` | `dynamic` | — |  |
| `painSound` | `dynamic` | — |  |
| `deathSound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L722)

<a id="function-function-mq3-client-playable-app-gauntlethastarget-function-gauntlethastarget-weaponstate-camera-targetstate-src-mq3-client-playable-app-ml-1589280488"></a>
### gauntletHasTarget

```ml
function gauntletHasTarget(weaponState, camera, targetState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weaponState` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L327)

<a id="constant-constant-mq3-client-playable-app-height-const-height-480-src-mq3-client-playable-app-ml-152321181"></a>
### HEIGHT

```ml
const HEIGHT = 480
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L70)

<a id="constant-constant-mq3-client-playable-app-horizontal-fov-const-horizontal-fov-90-src-mq3-client-playable-app-ml-1919254892"></a>
### HORIZONTAL_FOV

```ml
const HORIZONTAL_FOV = 90.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L71)

<a id="function-function-mq3-client-playable-app-isplayerprojectile-function-isplayerprojectile-classname-src-mq3-client-playable-app-ml-504380939"></a>
### isPlayerProjectile

```ml
function isPlayerProjectile(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L203)

<a id="constant-constant-mq3-client-playable-app-item-pose-interval-const-item-pose-interval-1-src-mq3-client-playable-app-ml-1903574164"></a>
### ITEM_POSE_INTERVAL

```ml
const ITEM_POSE_INTERVAL = 1
```

The optimized indexed-MD3 path keeps stock bob/spin transforms affordable at render cadence instead of visibly stepping the pickup animation.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L87)

<a id="function-function-mq3-client-playable-app-itemclassnames-function-itemclassnames-items-src-mq3-client-playable-app-ml-8280500"></a>
### itemClassnames

```ml
function itemClassnames(items)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L232)

<a id="constant-constant-mq3-client-playable-app-max-detailed-player-models-const-max-detailed-player-models-5-src-mq3-client-playable-app-ml-1085198510"></a>
### MAX_DETAILED_PLAYER_MODELS

```ml
const MAX_DETAILED_PLAYER_MODELS = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L76)

<a id="constant-constant-mq3-client-playable-app-max-item-models-const-max-item-models-48-src-mq3-client-playable-app-ml-1754453139"></a>
### MAX_ITEM_MODELS

```ml
const MAX_ITEM_MODELS = 48
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L79)

<a id="constant-constant-mq3-client-playable-app-max-item-textures-const-max-item-textures-64-src-mq3-client-playable-app-ml-1687092561"></a>
### MAX_ITEM_TEXTURES

```ml
const MAX_ITEM_TEXTURES = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L80)

<a id="constant-constant-mq3-client-playable-app-max-item-triangles-const-max-item-triangles-5000-src-mq3-client-playable-app-ml-703866166"></a>
### MAX_ITEM_TRIANGLES

```ml
const MAX_ITEM_TRIANGLES = 5000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L82)

<a id="constant-constant-mq3-client-playable-app-max-lines-const-max-lines-0-src-mq3-client-playable-app-ml-1724585825"></a>
### MAX_LINES

```ml
const MAX_LINES = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L72)

<a id="constant-constant-mq3-client-playable-app-max-native-texture-slots-const-max-native-texture-slots-512-src-mq3-client-playable-app-ml-1137846135"></a>
### MAX_NATIVE_TEXTURE_SLOTS

```ml
const MAX_NATIVE_TEXTURE_SLOTS = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L78)

<a id="constant-constant-mq3-client-playable-app-max-projectile-textures-const-max-projectile-textures-8-src-mq3-client-playable-app-ml-515965121"></a>
### MAX_PROJECTILE_TEXTURES

```ml
const MAX_PROJECTILE_TEXTURES = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L88)

<a id="constant-constant-mq3-client-playable-app-max-projectile-triangles-const-max-projectile-triangles-1024-src-mq3-client-playable-app-ml-1779096696"></a>
### MAX_PROJECTILE_TRIANGLES

```ml
const MAX_PROJECTILE_TRIANGLES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L89)

<a id="constant-constant-mq3-client-playable-app-max-target-weapon-triangles-const-max-target-weapon-triangles-512-src-mq3-client-playable-app-ml-53578509"></a>
### MAX_TARGET_WEAPON_TRIANGLES

```ml
const MAX_TARGET_WEAPON_TRIANGLES = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L77)

<a id="constant-constant-mq3-client-playable-app-max-triangles-per-item-const-max-triangles-per-item-512-src-mq3-client-playable-app-ml-1341697715"></a>
### MAX_TRIANGLES_PER_ITEM

```ml
const MAX_TRIANGLES_PER_ITEM = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L83)

<a id="constant-constant-mq3-client-playable-app-max-triangles-per-projectile-const-max-triangles-per-projectile-256-src-mq3-client-playable-app-ml-2052194728"></a>
### MAX_TRIANGLES_PER_PROJECTILE

```ml
const MAX_TRIANGLES_PER_PROJECTILE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L90)

<a id="constant-constant-mq3-client-playable-app-max-viewmodel-triangles-const-max-viewmodel-triangles-2048-src-mq3-client-playable-app-ml-373326581"></a>
### MAX_VIEWMODEL_TRIANGLES

```ml
const MAX_VIEWMODEL_TRIANGLES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L84)

<a id="constant-constant-mq3-client-playable-app-max-visible-items-const-max-visible-items-24-src-mq3-client-playable-app-ml-2036586065"></a>
### MAX_VISIBLE_ITEMS

```ml
const MAX_VISIBLE_ITEMS = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L81)

<a id="function-function-mq3-client-playable-app-modelcolor-function-modelcolor-sampled-normal-src-mq3-client-playable-app-ml-1900989541"></a>
### modelColor

```ml
function modelColor(sampled, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sampled` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L345)

<a id="function-function-mq3-client-playable-app-nextplayertextureslot-function-nextplayertextureslot-textures-src-mq3-client-playable-app-ml-762116828"></a>
### nextPlayerTextureSlot

```ml
function nextPlayerTextureSlot(textures)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textures` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L226)

<a id="function-function-mq3-client-playable-app-pickupmodeltriangles-function-pickupmodeltriangles-camera-catalog-items-now-src-mq3-client-playable-app-ml-943209906"></a>
### pickupModelTriangles

```ml
function pickupModelTriangles(camera, catalog, items, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L408)

<a id="function-function-mq3-client-playable-app-pickupname-function-pickupname-classname-src-mq3-client-playable-app-ml-144514743"></a>
### pickupName

```ml
function pickupName(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L271)

<a id="constant-constant-mq3-client-playable-app-player-texture-first-slot-const-player-texture-first-slot-336-src-mq3-client-playable-app-ml-241961"></a>
### PLAYER_TEXTURE_FIRST_SLOT

```ml
const PLAYER_TEXTURE_FIRST_SLOT = 336
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L74)

<a id="constant-constant-mq3-client-playable-app-player-triangles-per-surface-const-player-triangles-per-surface-8192-src-mq3-client-playable-app-ml-1431231187"></a>
### PLAYER_TRIANGLES_PER_SURFACE

```ml
const PLAYER_TRIANGLES_PER_SURFACE = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L75)

- [mq3.client.playable_app.PlayerModelAssets](Type-mq3-client-playable-app-playermodelassets-1156371250.md) — struct
<a id="function-function-mq3-client-playable-app-playerprojectilesnapshots-function-playerprojectilesnapshots-previous-state-now-src-mq3-client-playable-app-ml-1928999950"></a>
### playerProjectileSnapshots

```ml
function playerProjectileSnapshots(previous, state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L184)

- [mq3.client.playable_app.PlayerSkinSet](Type-mq3-client-playable-app-playerskinset-615689265.md) — struct
- [mq3.client.playable_app.PlayerTexture](Type-mq3-client-playable-app-playertexture-686084825.md) — struct
<a id="function-function-mq3-client-playable-app-playertextureslot-function-playertextureslot-assets-triangle-src-mq3-client-playable-app-ml-1848523435"></a>
### playerTextureSlot

```ml
function playerTextureSlot(assets, triangle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L490)

<a id="function-function-mq3-client-playable-app-projectilesnapshots-function-projectilesnapshots-previous-state-now-src-mq3-client-playable-app-ml-156823640"></a>
### projectileSnapshots

```ml
function projectileSnapshots(previous, state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L165)

<a id="function-function-mq3-client-playable-app-render-function-render-camera-geometry-worldbatchstate-materialcatalog-skycatalog-itemcatalog-projectilecatalog-projectilefxstate-markstate-markcatalog-explosioncatalog-runtime-pickuptriangles-hudstate-basehudcatalog-basehudstate-menucatalog-menustate-matchmedia-itemstate-playerstate-shoteffects-projectileeffects-rendertargets-visibletargets-modelassets-eventstate-enemystate-weaponstate-combatstate-matchstate-matchview-matchcenter-viewmodeltransform-viewmodelclassname-viewmodelbarrelangle-viewmodelswitching-now-menuopen-src-mq3-client-playable-app-ml-251908520"></a>
### render

```ml
function render(camera, geometry, worldBatchState, materialCatalog, skyCatalog, itemCatalog, projectileCatalog, projectileFxState, markState, markCatalog, explosionCatalog, runtime, pickupTriangles, hudState, baseHudCatalog, baseHudState, menuCatalog, menuState, matchMedia, itemState, playerState, shotEffects, projectileEffects, renderTargets, visibleTargets, modelAssets, eventState, enemyState, weaponState, combatState, matchState, matchView, matchCenter, viewmodelTransform, viewmodelClassname, viewmodelBarrelAngle, viewmodelSwitching, now, menuOpen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `geometry` | `dynamic` | — |  |
| `worldBatchState` | `dynamic` | — |  |
| `materialCatalog` | `dynamic` | — |  |
| `skyCatalog` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |
| `projectileCatalog` | `dynamic` | — |  |
| `projectileFxState` | `dynamic` | — |  |
| `markState` | `dynamic` | — |  |
| `markCatalog` | `dynamic` | — |  |
| `explosionCatalog` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |
| `pickupTriangles` | `dynamic` | — |  |
| `hudState` | `dynamic` | — |  |
| `baseHudCatalog` | `dynamic` | — |  |
| `baseHudState` | `dynamic` | — |  |
| `menuCatalog` | `dynamic` | — |  |
| `menuState` | `dynamic` | — |  |
| `matchMedia` | `dynamic` | — |  |
| `itemState` | `dynamic` | — |  |
| `playerState` | `dynamic` | — |  |
| `shotEffects` | `dynamic` | — |  |
| `projectileEffects` | `dynamic` | — |  |
| `renderTargets` | `dynamic` | — |  |
| `visibleTargets` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `eventState` | `dynamic` | — |  |
| `enemyState` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |
| `combatState` | `dynamic` | — |  |
| `matchState` | `dynamic` | — |  |
| `matchView` | `dynamic` | — |  |
| `matchCenter` | `dynamic` | — |  |
| `viewmodelTransform` | `dynamic` | — |  |
| `viewmodelClassname` | `dynamic` | — |  |
| `viewmodelBarrelAngle` | `dynamic` | — |  |
| `viewmodelSwitching` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `menuOpen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L657)

- [mq3.client.playable_app.RenderRuntime](Type-mq3-client-playable-app-renderruntime-1103072733.md) — struct
<a id="function-function-mq3-client-playable-app-rendertargetmodels-function-rendertargetmodels-camera-projection-rendertargets-modelassets-itemcatalog-eventstate-enemystate-now-lightgrid-src-mq3-client-playable-app-ml-1022884198"></a>
### renderTargetModels

```ml
function renderTargetModels(camera, projection, renderTargets, modelAssets, itemCatalog, eventState, enemyState, now, lightGrid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `renderTargets` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |
| `eventState` | `dynamic` | — |  |
| `enemyState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `lightGrid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L578)

<a id="function-function-mq3-client-playable-app-rendertargetshadows-function-rendertargetshadows-projection-targets-eventstate-enemystate-now-runtime-src-mq3-client-playable-app-ml-1208090429"></a>
### renderTargetShadows

```ml
function renderTargetShadows(projection, targets, eventState, enemyState, now, runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `targets` | `dynamic` | — |  |
| `eventState` | `dynamic` | — |  |
| `enemyState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L650)

<a id="function-function-mq3-client-playable-app-renderviewmodel-function-renderviewmodel-projection-catalog-weaponstate-combatstate-now-transform-weaponclass-barrelangle-showflash-lightgrid-src-mq3-client-playable-app-ml-676274938"></a>
### renderViewModel

```ml
function renderViewModel(projection, catalog, weaponState, combatState, now, transform, weaponClass, barrelAngle, showFlash, lightGrid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |
| `combatState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `transform` | `dynamic` | — |  |
| `weaponClass` | `dynamic` | — |  |
| `barrelAngle` | `dynamic` | — |  |
| `showFlash` | `dynamic` | — |  |
| `lightGrid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L436)

<a id="function-function-mq3-client-playable-app-reserveplayerspawn-function-reserveplayerspawn-targetstate-playerstate-spawnindex-src-mq3-client-playable-app-ml-874209143"></a>
### reservePlayerSpawn

```ml
function reservePlayerSpawn(targetState, playerState, spawnIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `playerState` | `dynamic` | — |  |
| `spawnIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L637)

<a id="function-function-mq3-client-playable-app-restoreenemypositions-function-restoreenemypositions-targetstate-previous-src-mq3-client-playable-app-ml-1732109207"></a>
### restoreEnemyPositions

```ml
function restoreEnemyPositions(targetState, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L103)

<a id="function-function-mq3-client-playable-app-run-function-run-map-sound-archive-src-mq3-client-playable-app-ml-1453089955"></a>
### run

```ml
function run(map, sound, archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1244)

<a id="function-function-mq3-client-playable-app-runlimited-function-runlimited-map-maxframes-sound-archive-src-mq3-client-playable-app-ml-1125189227"></a>
### runLimited

```ml
function runLimited(map, maxFrames, sound, archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L943)

<a id="function-function-mq3-client-playable-app-shownativeloading-function-shownativeloading-state-progress-text-src-mq3-client-playable-app-ml-1096467889"></a>
### showNativeLoading

```ml
function showNativeLoading(state, progress, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `progress` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L939)

<a id="function-function-mq3-client-playable-app-smoke-function-smoke-map-frames-src-mq3-client-playable-app-ml-949639806"></a>
### smoke

```ml
function smoke(map, frames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1245)

<a id="function-function-mq3-client-playable-app-smokeassets-function-smokeassets-map-frames-archive-src-mq3-client-playable-app-ml-453580748"></a>
### smokeAssets

```ml
function smokeAssets(map, frames, archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1249)

<a id="function-function-mq3-client-playable-app-startpose-function-startpose-map-src-mq3-client-playable-app-ml-1206186748"></a>
### startPose

```ml
function startPose(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L133)

<a id="function-function-mq3-client-playable-app-synchudweaponselection-function-synchudweaponselection-hudstate-inventorystate-now-src-mq3-client-playable-app-ml-695184161"></a>
### syncHudWeaponSelection

```ml
function syncHudWeaponSelection(hudState, inventoryState, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hudState` | `dynamic` | — |  |
| `inventoryState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L314)

<a id="function-function-mq3-client-playable-app-syncrendertargets-function-syncrendertargets-targetstate-rendertargets-combathit-now-src-mq3-client-playable-app-ml-79980475"></a>
### syncRenderTargets

```ml
function syncRenderTargets(targetState, renderTargets, combatHit, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `renderTargets` | `dynamic` | — |  |
| `combatHit` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L618)

<a id="function-function-mq3-client-playable-app-targetmuzzlelights-function-targetmuzzlelights-camera-rendertargets-modelassets-itemcatalog-eventstate-enemystate-now-src-mq3-client-playable-app-ml-662391757"></a>
### targetMuzzleLights

```ml
function targetMuzzleLights(camera, renderTargets, modelAssets, itemCatalog, eventState, enemyState, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `renderTargets` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `itemCatalog` | `dynamic` | — |  |
| `eventState` | `dynamic` | — |  |
| `enemyState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L550)

<a id="function-function-mq3-client-playable-app-targettransform-function-targettransform-target-camera-src-mq3-client-playable-app-ml-1412105482"></a>
### targetTransform

```ml
function targetTransform(target, camera)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L506)

<a id="function-function-mq3-client-playable-app-targetweapontransform-function-targetweapontransform-modelassets-lowersample-uppersample-root-src-mq3-client-playable-app-ml-1451392849"></a>
### targetWeaponTransform

```ml
function targetWeaponTransform(modelAssets, lowerSample, upperSample, root)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — |  |
| `lowerSample` | `dynamic` | — |  |
| `upperSample` | `dynamic` | — |  |
| `root` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L525)

<a id="function-function-mq3-client-playable-app-textureslotforname-function-textureslotforname-textures-name-src-mq3-client-playable-app-ml-1065015509"></a>
### textureSlotForName

```ml
function textureSlotForName(textures, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textures` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L221)

<a id="function-function-mq3-client-playable-app-trailfor-function-trailfor-trails-projectileid-src-mq3-client-playable-app-ml-1686190637"></a>
### trailFor

```ml
function trailFor(trails, projectileId)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trails` | `dynamic` | — |  |
| `projectileId` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L160)

<a id="function-function-mq3-client-playable-app-vertexlight-function-vertexlight-vertex-src-mq3-client-playable-app-ml-2043307020"></a>
### vertexLight

```ml
function vertexLight(vertex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L149)

<a id="function-function-mq3-client-playable-app-visibletargetviews-function-visibletargetviews-enemystate-rendertargets-now-src-mq3-client-playable-app-ml-45553605"></a>
### visibleTargetViews

```ml
function visibleTargetViews(enemyState, renderTargets, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enemyState` | `dynamic` | — |  |
| `renderTargets` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L628)

<a id="constant-constant-mq3-client-playable-app-width-const-width-640-src-mq3-client-playable-app-ml-1512300219"></a>
### WIDTH

```ml
const WIDTH = 640
```

Baseq3's virtual screen and default cg_fov are 640x480 and 90 degrees. Using them directly avoids HUD/aspect distortion and lowers software fill cost.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L69)

<a id="constant-constant-mq3-client-playable-app-world-selection-interval-const-world-selection-interval-15-src-mq3-client-playable-app-ml-1232601541"></a>
### WORLD_SELECTION_INTERVAL

```ml
const WORLD_SELECTION_INTERVAL = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L73)
