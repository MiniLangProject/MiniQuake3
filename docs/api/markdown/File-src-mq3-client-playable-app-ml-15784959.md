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
- `std/time.ml` as `time` → `../../a7594a0c0299/MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-app-animatedplayertriangles-function-animatedplayertriangles-assets-now-src-mq3-client-playable-app-ml-1384990373"></a>
### animatedPlayerTriangles

```ml
function animatedPlayerTriangles(assets, now)
```

Calls `mq3.format.player_animation.samplePlayer`, `mq3.renderer.player_model_assembly.animation`, `mq3.renderer.player_model_assembly.assemble` and additional helpers from playable app `animatedPlayerTriangles`. The final path returns `triangles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — | Record read through `assets.animation`, `assets.models`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L717)

<a id="function-function-mq3-client-playable-app-appendskintextures-function-appendskintextures-textures-skin-part-src-mq3-client-playable-app-ml-603126326"></a>
### appendSkinTextures

```ml
function appendSkinTextures(textures, skin, part)
```

Calls `mq3.client.playable_app.textureSlotForName`, `mq3.client.playable_app.nextPlayerTextureSlot`, `mq3.client.playable_app.PlayerTexture` from playable app `appendSkinTextures`. The final path returns `textures`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textures` | `dynamic` | — | Value used by `slot=textureSlotForName(textures,binding.imageName)`. |
| `skin` | `dynamic` | — | Record read through `skin.bindings`. |
| `part` | `dynamic` | — | Value used by `textures=textures+[PlayerTexture(part,binding.surface,binding.imageName,binding.image,slot)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L647)

<a id="function-function-mq3-client-playable-app-applyselectedweapon-function-applyselectedweapon-inventorystate-weaponstate-playerstate-itemstate-combatstate-src-mq3-client-playable-app-ml-2101830405"></a>
### applySelectedWeapon

```ml
function applySelectedWeapon(inventoryState, weaponState, playerState, itemState, combatState)
```

Updates `weaponState.ammo`, `playerState.weapon`, `playerState.ammo`, `itemState.stats.weapon` and additional values during playable app `applySelectedWeapon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inventoryState` | `dynamic` | — | Record read through `inventoryState.selectedWeapon`. |
| `weaponState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `weaponState.ammo`. |
| `playerState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `playerState.weapon`, `playerState.ammo`. |
| `itemState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `itemState.stats.weapon`, `itemState.stats.ammo`. |
| `combatState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `combatState.weaponName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L431)

<a id="function-function-mq3-client-playable-app-archivebytes-function-archivebytes-archive-name-src-mq3-client-playable-app-ml-106071433"></a>
### archiveBytes

```ml
function archiveBytes(archive, name)
```

Calls `mq3.format.pk3.read` from playable app `archiveBytes`. The final path returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable app resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L319)

<a id="function-function-mq3-client-playable-app-archivemodel-function-archivemodel-archive-name-maxtriangles-src-mq3-client-playable-app-ml-50455986"></a>
### archiveModel

```ml
function archiveModel(archive, name, maxTriangles)
```

Calls `mq3.format.pk3.read`, `mq3.format.md3.load`, `mq3.format.md3.renderTriangles` from playable app `archiveModel`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable app resource. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L308)

<a id="function-function-mq3-client-playable-app-archiveplayerassets-function-archiveplayerassets-archive-shaderscripts-src-mq3-client-playable-app-ml-1439517895"></a>
### archivePlayerAssets

```ml
function archivePlayerAssets(archive, shaderScripts)
```

Calls `mq3.client.playable_app.archiveBytes`, `mq3.renderer.player_model_assembly.load`, `mq3.format.player_animation.parse` and additional helpers from playable app `archivePlayerAssets`. The final path returns `PlayerModelAssets(modelSet,animation,textures,cache,barrelStates)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `shaderScripts` | `dynamic` | — | Value used by `lowerSkin=try(playerSkins.loadResolved(archive,playerSkins.SARGE_LOWER,shaderScripts))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L659)

<a id="function-function-mq3-client-playable-app-archivesound-function-archivesound-archive-name-src-mq3-client-playable-app-ml-231957685"></a>
### archiveSound

```ml
function archiveSound(archive, name)
```

Calls `mq3.format.pk3.read`, `mq3.audio.wav.decode` from playable app `archiveSound`. The final path returns `sound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable app resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L237)

<a id="function-function-mq3-client-playable-app-captureenemypositions-function-captureenemypositions-targetstate-src-mq3-client-playable-app-ml-1992751466"></a>
### captureEnemyPositions

```ml
function captureEnemyPositions(targetState)
```

Evaluates playable app `captureEnemyPositions` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L164)

<a id="function-function-mq3-client-playable-app-collideenemypositions-function-collideenemypositions-world-targetstate-previous-src-mq3-client-playable-app-ml-1639791781"></a>
### collideEnemyPositions

```ml
function collideEnemyPositions(world, targetState, previous)
```

Calls `mq3.client.playable_enemy_movement.moveTarget` from playable app `collideEnemyPositions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable app helper calls. |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `previous` | `dynamic` | — | Sequence read at `previous[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L186)

<a id="function-function-mq3-client-playable-app-createrendertargets-function-createrendertargets-targetstate-src-mq3-client-playable-app-ml-2026235866"></a>
### createRenderTargets

```ml
function createRenderTargets(targetState)
```

Calls `mq3.client.playable_target_render.target` from playable app `createRenderTargets`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L858)

<a id="function-function-mq3-client-playable-app-detailedplayertextureslot-function-detailedplayertextureslot-assets-triangle-src-mq3-client-playable-app-ml-1182518443"></a>
### detailedPlayerTextureSlot

```ml
function detailedPlayerTextureSlot(assets, triangle)
```

Calls `stringEqualsIgnoreCaseAscii` from playable app `detailedPlayerTextureSlot`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — | Record read through `assets.textures`. |
| `triangle` | `dynamic` | — | Record read through `triangle.imageName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L698)

<a id="function-function-mq3-client-playable-app-digitweapondown-function-digitweapondown-src-mq3-client-playable-app-ml-1540387160"></a>
### digitWeaponDown

```ml
function digitWeaponDown()
```

Calls `mq3.platform.playable_window.keyDown` from playable app `digitWeaponDown`. The final path returns `0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L412)

<a id="function-function-mq3-client-playable-app-drawclippeditemtriangles-function-drawclippeditemtriangles-projection-triangles-lightgrid-src-mq3-client-playable-app-ml-2041707728"></a>
### drawClippedItemTriangles

```ml
function drawClippedItemTriangles(projection, triangles, lightGrid)
```

Calls `mq3.renderer.playable_light_grid.entitySample`, `mq3.client.playable_app.drawModelTriangle` from playable app `drawClippedItemTriangles`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `triangles` | `dynamic` | — | Value used by `for each triangle in triangles`. |
| `lightGrid` | `dynamic` | — | Value used by `if lightGrid!=void and (sampleOrigin==void or sampleOrigin!=triangle.lightOrigin) then sampleOrigin=triangle.lightOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L541)

<a id="function-function-mq3-client-playable-app-drawitemtriangles-function-drawitemtriangles-projection-triangles-lightgrid-src-mq3-client-playable-app-ml-1351745200"></a>
### drawItemTriangles

```ml
function drawItemTriangles(projection, triangles, lightGrid)
```

Calls `mq3.client.playable_viewer.projectPrepared`, `mq3.renderer.playable_light_grid.entitySample`, `mq3.platform.playable_window.drawTriangleColored` and additional helpers from playable app `drawItemTriangles`. The final path returns `len(triangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `triangles` | `dynamic` | — | Sequence whose length/content is inspected by `drawItemTriangles`. |
| `lightGrid` | `dynamic` | — | Value used by `if lightGrid!=void and (sampleOrigin==void or sampleOrigin!=triangle.lightOrigin) then sampleOrigin=triangle.lightOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L525)

<a id="function-function-mq3-client-playable-app-drawmodeltriangle-function-drawmodeltriangle-projection-triangle-red-green-blue-lit-sampled-src-mq3-client-playable-app-ml-458220958"></a>
### drawModelTriangle

```ml
function drawModelTriangle(projection, triangle, red, green, blue, lit, sampled)
```

Calls `mq3.client.playable_viewer.preparedViewPoint`, `mq3.client.playable_app.modelColor`, `mq3.client.playable_viewer.clipNearPolygon` and additional helpers from playable app `drawModelTriangle`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. Record read through `projection.nearDistance`. |
| `triangle` | `dynamic` | — | Record read through `triangle.positions`, `triangle.normals`, `triangle.texCoords`, `triangle.textureSlot`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |
| `lit` | `dynamic` | — | Value used by `if lit then color=modelColor(sampled,triangle.normals[corner]) end if`. |
| `sampled` | `dynamic` | — | Value used by `if lit then color=modelColor(sampled,triangle.normals[corner]) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L500)

<a id="function-function-mq3-client-playable-app-drawprojectiletriangles-function-drawprojectiletriangles-projection-triangles-lightgrid-src-mq3-client-playable-app-ml-1168234008"></a>
### drawProjectileTriangles

```ml
function drawProjectileTriangles(projection, triangles, lightGrid)
```

Calls `mq3.client.playable_viewer.projectPrepared`, `mq3.renderer.playable_light_grid.entitySample`, `mq3.client.playable_app.modelColor` and additional helpers from playable app `drawProjectileTriangles`. The final path returns `len(triangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `triangles` | `dynamic` | — | Sequence whose length/content is inspected by `drawProjectileTriangles`. |
| `lightGrid` | `dynamic` | — | Value used by `if lightGrid!=void and (sampleOrigin==void or sampleOrigin!=triangle.lightOrigin) then sampleOrigin=triangle.lightOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L554)

<a id="function-function-mq3-client-playable-app-drawtargetweapon-function-drawtargetweapon-projection-itemcatalog-modelassets-index-input-lower-upper-root-show-now-lightgrid-src-mq3-client-playable-app-ml-1894653815"></a>
### drawTargetWeapon

```ml
function drawTargetWeapon(projection, itemCatalog, modelAssets, index, input, lower, upper, root, show, now, lightGrid)
```

Updates `modelAssets.barrelStates` during playable app `drawTargetWeapon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. |
| `modelAssets` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `modelAssets.barrelStates`. |
| `index` | `dynamic` | — | Value used by `while index>=len(modelAssets.barrelStates) modelAssets.barrelStates=modelAssets.barrelStates+[weaponBarrel.state()] end while`. |
| `input` | `dynamic` | — | Record read through `input.action`, `input.elapsedMilliseconds`. |
| `lower` | `dynamic` | — | Value used by `transform=targetWeaponTransform(modelAssets,lower,upper,root)`. |
| `upper` | `dynamic` | — | Value used by `transform=targetWeaponTransform(modelAssets,lower,upper,root)`. |
| `root` | `dynamic` | — | Value used by `transform=targetWeaponTransform(modelAssets,lower,upper,root)`. |
| `show` | `dynamic` | — | Value used by `if not show or itemCatalog==void then return 0 end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `lightGrid` | `dynamic` | — | Value used by `drawn=drawItemTriangles(projection,triangles+barrel,lightGrid)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L754)

<a id="function-function-mq3-client-playable-app-drawtinteditemtriangles-function-drawtinteditemtriangles-projection-triangles-red-green-blue-src-mq3-client-playable-app-ml-1244049584"></a>
### drawTintedItemTriangles

```ml
function drawTintedItemTriangles(projection, triangles, red, green, blue)
```

Calls `mq3.client.playable_app.drawModelTriangle` from playable app `drawTintedItemTriangles`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `triangles` | `dynamic` | — | Value used by `for each triangle in triangles`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L601)

<a id="function-function-mq3-client-playable-app-enemyattackmuzzles-function-enemyattackmuzzles-camera-targetstate-modelassets-itemcatalog-enemystate-src-mq3-client-playable-app-ml-1251370192"></a>
### enemyAttackMuzzles

```ml
function enemyAttackMuzzles(camera, targetState, modelAssets, itemCatalog, enemyState)
```

Calls `mq3.format.player_animation.sampleAnimation`, `mq3.client.playable_app.targetWeaponTransform`, `mq3.client.playable_app.targetTransform` and additional helpers from playable app `enemyAttackMuzzles`. The final path returns `muzzle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. Record read through `modelAssets.animation`. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. |
| `enemyState` | `dynamic` | — | Record read through `enemyState.events`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L799)

<a id="function-function-mq3-client-playable-app-fallbackmodellight-function-fallbackmodellight-normal-src-mq3-client-playable-app-ml-1044856901"></a>
### fallbackModelLight

```ml
function fallbackModelLight(normal)
```

Calls `mq3.shared.math.VectorNormalize`, `mq3.shared.math.DotProduct` from playable app `fallbackModelLight`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L476)

<a id="function-function-mq3-client-playable-app-field-function-field-fields-key-src-mq3-client-playable-app-ml-492997800"></a>
### field

```ml
function field(fields, key)
```

Evaluates playable app `field` and returns `pair[1]`, `""` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — | Value used by `for each pair in fields`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable app entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L203)

<a id="function-function-mq3-client-playable-app-firstfreehudtexture-function-firstfreehudtexture-modelassets-itemcatalog-src-mq3-client-playable-app-ml-560772144"></a>
### firstFreeHudTexture

```ml
function firstFreeHudTexture(modelAssets, itemCatalog)
```

Calls `mq3.client.playable_app.firstFreeModelTexture` from playable app `firstFreeHudTexture`. The final path returns `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. Record read through `itemCatalog.textures`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L375)

<a id="function-function-mq3-client-playable-app-firstfreemenutexture-function-firstfreemenutexture-modelassets-itemcatalog-basehudcatalog-src-mq3-client-playable-app-ml-1119881569"></a>
### firstFreeMenuTexture

```ml
function firstFreeMenuTexture(modelAssets, itemCatalog, baseHudCatalog)
```

Calls `mq3.client.playable_app.firstFreeHudTexture` from playable app `firstFreeMenuTexture`. The final path returns `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. |
| `baseHudCatalog` | `dynamic` | — | Record read through `baseHudCatalog.firstTextureSlot`, `baseHudCatalog.textureCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L385)

<a id="function-function-mq3-client-playable-app-firstfreemodeltexture-function-firstfreemodeltexture-modelassets-src-mq3-client-playable-app-ml-865218468"></a>
### firstFreeModelTexture

```ml
function firstFreeModelTexture(modelAssets)
```

Evaluates playable app `firstFreeModelTexture` and returns `slot` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. Record read through `modelAssets.textures`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L366)

<a id="function-function-mq3-client-playable-app-frameloop-function-frameloop-camera-geometry-triangles-worldbatchstate-materialcatalog-fogcatalog-dlightcatalog-markcatalog-markstate-explosioncatalog-worldcache-worldconfig-selectedfaceindexes-materialslots-skytextureflags-dlightreceiveflags-skycatalog-itemcatalog-projectilecatalog-projectilefxstate-hudstate-basehudcatalog-basehudstate-menucatalog-menustate-matchmedia-itemstate-inventorystate-weaponstate-targetstate-rendertargets-modelassets-combatstate-matchstate-playerstate-enemystate-eventstate-playerprojectilestate-controller-fpsstate-viewmodeltracker-viewmodelsettings-viewmodelcatalog-viewmodelanimation-barrelstate-spatialruntime-maxframes-matchsounds-firesound-weaponsoundcatalog-enemyfiresound-enemyimpactsound-pickupsound-jumpsound-painsound-deathsound-src-mq3-client-playable-app-ml-1951504146"></a>
### frameLoop

```ml
function frameLoop(camera, geometry, triangles, worldBatchState, materialCatalog, fogCatalog, dlightCatalog, markCatalog, markState, explosionCatalog, worldCache, worldConfig, selectedFaceIndexes, materialSlots, skyTextureFlags, dlightReceiveFlags, skyCatalog, itemCatalog, projectileCatalog, projectileFxState, hudState, baseHudCatalog, baseHudState, menuCatalog, menuState, matchMedia, itemState, inventoryState, weaponState, targetState, renderTargets, modelAssets, combatState, matchState, playerState, enemyState, eventState, playerProjectileState, controller, fpsState, viewmodelTracker, viewmodelSettings, viewmodelCatalog, viewmodelAnimation, barrelState, spatialRuntime, maxFrames, matchSounds, fireSound, weaponSoundCatalog, enemyFireSound, enemyImpactSound, pickupSound, jumpSound, painSound, deathSound)
```

Updates `controller.motion.origin`, `controller.motion.velocity`, `camera.position`, `camera.yaw` and additional values during playable app `frameLoop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `camera.position`, `camera.yaw`, `camera.pitch`. |
| `geometry` | `dynamic` | — | Value used by `rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,markState,markCatal...`. |
| `triangles` | `dynamic` | — | Value used by `triangles=prepared.renderData`. |
| `worldBatchState` | `dynamic` | — | Value used by `worldBatchState=void`. |
| `materialCatalog` | `dynamic` | — | Value used by `if materialCatalog!=void then worldBatchState=playableWorldBatch.buildMaterials(triangles,materialCatalog,skyTextureFlags)`. |
| `fogCatalog` | `dynamic` | — | Value used by `if materialCatalog!=void and fogCatalog!=void then fogged=playableWorldBatch.attachFog(worldBatchState,triangles,fogCatalog)`. |
| `dlightCatalog` | `dynamic` | — | Value used by `if materialCatalog!=void and dlightCatalog!=void then lit=playableWorldBatch.attachDynamicLights(worldBatchState,triangles,dlightReceiveFlags,...`. |
| `markCatalog` | `dynamic` | — | Value used by `rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,markState,markCatal...`. |
| `markState` | `dynamic` | — | Value used by `markCount=playableMarks.update(markState,projectileEffects,shotEffects,current)`. |
| `explosionCatalog` | `dynamic` | — | Value used by `rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,markState,markCatal...`. |
| `worldCache` | `dynamic` | — | Value used by `prepared=worldSelection.prepareCached(worldCache,camera,worldConfig)`. |
| `worldConfig` | `dynamic` | — | Record read through `worldConfig.runtime`. |
| `selectedFaceIndexes` | `dynamic` | — | Value used by `if not worldSelection.sameFaces(selectedFaceIndexes,prepared.selection.faceIndexes) then`. |
| `materialSlots` | `dynamic` | — | Value used by `else worldBatchState=playableWorldBatch.build(triangles,materialSlots,skyTextureFlags) end if`. |
| `skyTextureFlags` | `dynamic` | — | Value used by `if materialCatalog!=void then worldBatchState=playableWorldBatch.buildMaterials(triangles,materialCatalog,skyTextureFlags)`. |
| `dlightReceiveFlags` | `dynamic` | — | Value used by `if materialCatalog!=void and dlightCatalog!=void then lit=playableWorldBatch.attachDynamicLights(worldBatchState,triangles,dlightReceiveFlags,...`. |
| `skyCatalog` | `dynamic` | — | Value used by `rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,markState,markCatal...`. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. |
| `projectileCatalog` | `dynamic` | — | Value used by `rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,markState,markCatal...`. |
| `projectileFxState` | `dynamic` | — | Value used by `trailCount=projectileFx.update(projectileFxState,projectileEffects,current)`. |
| `hudState` | `dynamic` | — | Value used by `hud.setValues(hudState,itemState.stats.health,itemState.stats.armor,weaponState.ammo)`. |
| `baseHudCatalog` | `dynamic` | — | Value used by `if baseHudCatalog!=void then for each pickup in pickups baseHud.pickup(baseHudState,pickup.classname,pickupName(pickup.classname),current) end...`. |
| `baseHudState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `baseHudState.health`, `baseHudState.armor`, `baseHudState.ammo`, `baseHudState.weapon` and additional values. |
| `menuCatalog` | `dynamic` | — | Value used by `rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,markState,markCatal...`. |
| `menuState` | `dynamic` | — | Value used by `if menuOpen then menuAction=menu.step(menuState,window.keyDown(window.VK_UP),window.keyDown(window.VK_DOWN),enterDown)`. |
| `matchMedia` | `dynamic` | — | Value used by `rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,markState,markCatal...`. |
| `itemState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `itemState.stats.health`, `itemState.stats.armor`, `itemState.stats.ammo`, `itemState.stats.weapon`. |
| `inventoryState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `inventoryState.ammo[inventoryState.selectedWeapon]`. |
| `weaponState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `weaponState.cooldownRemaining`, `weaponState.triggerHeld`, `weaponState.ammo`. |
| `targetState` | `dynamic` | — | Record read through `targetState.score`. |
| `renderTargets` | `dynamic` | — | Value used by `syncRenderTargets(targetState,renderTargets,pelletHit,current)`. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. |
| `combatState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `combatState.weaponName`. |
| `matchState` | `dynamic` | — | Record read through `matchState.phase`. |
| `playerState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `playerState.weapon`, `playerState.ammo`, `playerState.position`, `playerState.yaw` and additional values. |
| `enemyState` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `enemyState.events`. |
| `eventState` | `dynamic` | — | Value used by `enemyInputs=enemyEvents.update(eventState,targetState,enemyState,current)`. |
| `playerProjectileState` | `dynamic` | — | Record read through `playerProjectileState.impacts`. |
| `controller` | `dynamic` | — | Mutable playable app record/storage; this routine assigns `controller.motion.origin`, `controller.motion.velocity`. |
| `fpsState` | `dynamic` | — | Value used by `caption=fpsTitle.frame(fpsState,window.milliseconds())`. |
| `viewmodelTracker` | `dynamic` | — | Value used by `bob=viewmodel.advance(viewmodelTracker,controller.motion.velocity,playableMovement.isGrounded(controller),current)`. |
| `viewmodelSettings` | `dynamic` | — | Value used by `if attachment!=void then viewmodelTransform=viewmodel.frameWeaponTransform(camera,bob,current,-1000,0.0,recoil,viewmodelSettings,attachment,we...`. |
| `viewmodelCatalog` | `dynamic` | — | Value used by `attachment=viewmodel.findAttachment(viewmodelCatalog,viewmodelClassname)`. |
| `viewmodelAnimation` | `dynamic` | — | Value used by `weaponFrame=viewmodel.sampleWeaponAnimation(viewmodelAnimation,weaponState.classname,current,combatState.lastFire)`. |
| `barrelState` | `dynamic` | — | Value used by `viewmodelBarrelAngle=weaponBarrel.advance(barrelState,current,weaponState.triggerHeld and not viewmodelSwitching)`. |
| `spatialRuntime` | `dynamic` | — | Value used by `if spatialRuntime!=void then`. |
| `maxFrames` | `dynamic` | — | Value used by `menuOpen=maxFrames<0`. |
| `matchSounds` | `dynamic` | — | Sequence read at `matchSounds[cue]`. |
| `fireSound` | `dynamic` | — | Value used by `selectedFireSound=fireSound`. |
| `weaponSoundCatalog` | `dynamic` | — | Value used by `if weaponSoundCatalog!=void then candidate=weaponSounds.pickupSound(weaponSoundCatalog,pickups[len(pickups)-1].classname)`. |
| `enemyFireSound` | `dynamic` | — | Value used by `if len(enemyShots)>0 and enemyFireSound!=void then ignored=try(audio.play(enemyFireSound)) end if`. |
| `enemyImpactSound` | `dynamic` | — | Value used by `if enemyShot.worldHit and enemyImpactSound!=void then ignored=try(audio.play(enemyImpactSound)) end if`. |
| `pickupSound` | `dynamic` | — | Value used by `selectedPickupSound=pickupSound`. |
| `jumpSound` | `dynamic` | — | Value used by `if jumped and jumpSound!=void then ignored=try(audio.play(jumpSound)) end if`. |
| `painSound` | `dynamic` | — | Value used by `else if painSound!=void then ignored=try(audio.play(painSound)) end if`. |
| `deathSound` | `dynamic` | — | Value used by `if deathSound!=void then ignored=try(audio.play(deathSound)) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1085)

<a id="function-function-mq3-client-playable-app-gauntlethastarget-function-gauntlethastarget-weaponstate-camera-targetstate-src-mq3-client-playable-app-ml-1589280488"></a>
### gauntletHasTarget

```ml
function gauntletHasTarget(weaponState, camera, targetState)
```

Calls `mq3.client.playable_weapon.muzzlePoint`, `mq3.client.playable_viewer.cameraBasis`, `mq3.client.playable_weapon.shootRay` and additional helpers from playable app `gauntletHasTarget`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weaponState` | `dynamic` | — | Value used by `probe=playableWeapon.shootRay(weaponState,muzzle,basis[0])`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`, `targetState.radius`, `targetState.minZ`, `targetState.maxZ`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L464)

<a id="constant-constant-mq3-client-playable-app-height-const-height-480-src-mq3-client-playable-app-ml-152321181"></a>
### HEIGHT

```ml
const HEIGHT = 480
```

Default render-target height used by the native playable preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L71)

<a id="constant-constant-mq3-client-playable-app-horizontal-fov-const-horizontal-fov-90-src-mq3-client-playable-app-ml-413634250"></a>
### HORIZONTAL_FOV

```ml
const HORIZONTAL_FOV = 90
```

Horizontal preview-camera field of view in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L73)

<a id="function-function-mq3-client-playable-app-isplayerprojectile-function-isplayerprojectile-classname-src-mq3-client-playable-app-ml-504380939"></a>
### isPlayerProjectile

```ml
function isPlayerProjectile(classname)
```

Computes `classname=="weapon_rocketlauncher" or classname=="weapon_plasmagun" or classname=="weapon_grenadelauncher" or classname=="weapon_bfg"` for playable app `isPlayerProjectile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `return classname=="weapon_rocketlauncher" or classname=="weapon_plasmagun" or classname=="weapon_grenadelauncher" or classname=="weapon_bfg"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L300)

<a id="constant-constant-mq3-client-playable-app-item-pose-interval-const-item-pose-interval-1-src-mq3-client-playable-app-ml-1903574164"></a>
### ITEM_POSE_INTERVAL

```ml
const ITEM_POSE_INTERVAL = 1
```

The optimized indexed-MD3 path keeps stock bob/spin transforms affordable at render cadence instead of visibly stepping the pickup animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L107)

<a id="function-function-mq3-client-playable-app-itemclassnames-function-itemclassnames-items-src-mq3-client-playable-app-ml-8280500"></a>
### itemClassnames

```ml
function itemClassnames(items)
```

Calls `mq3.client.playable_weapon_barrel.classnames`, `stringEqualsIgnoreCaseAscii`, `mq3.client.playable_muzzle_flash.classnames` from playable app `itemClassnames`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Value used by `for each value in items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L343)

<a id="constant-constant-mq3-client-playable-app-lightmap-slots-const-lightmap-slots-playableworldbatch-max-bsp-lightmaps-src-mq3-client-playable-app-ml-1946271365"></a>
### LIGHTMAP_SLOTS

```ml
const LIGHTMAP_SLOTS = playableWorldBatch.MAX_BSP_LIGHTMAPS
```

Number of texture slots reserved for the world's BSP lightmaps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L79)

<a id="constant-constant-mq3-client-playable-app-max-detailed-player-models-const-max-detailed-player-models-5-src-mq3-client-playable-app-ml-1085198510"></a>
### MAX_DETAILED_PLAYER_MODELS

```ml
const MAX_DETAILED_PLAYER_MODELS = 5
```

Capacity limit for the detailed player models collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L86)

<a id="constant-constant-mq3-client-playable-app-max-item-models-const-max-item-models-48-src-mq3-client-playable-app-ml-1754453139"></a>
### MAX_ITEM_MODELS

```ml
const MAX_ITEM_MODELS = 48
```

Capacity limit for the item models collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L94)

<a id="constant-constant-mq3-client-playable-app-max-item-textures-const-max-item-textures-64-src-mq3-client-playable-app-ml-1687092561"></a>
### MAX_ITEM_TEXTURES

```ml
const MAX_ITEM_TEXTURES = 64
```

Capacity limit for the item textures collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L96)

<a id="constant-constant-mq3-client-playable-app-max-item-triangles-const-max-item-triangles-5000-src-mq3-client-playable-app-ml-703866166"></a>
### MAX_ITEM_TRIANGLES

```ml
const MAX_ITEM_TRIANGLES = 5000
```

Capacity limit for the item triangles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L100)

<a id="constant-constant-mq3-client-playable-app-max-lines-const-max-lines-0-src-mq3-client-playable-app-ml-1724585825"></a>
### MAX_LINES

```ml
const MAX_LINES = 0
```

Capacity limit for the lines collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L75)

<a id="constant-constant-mq3-client-playable-app-max-native-texture-slots-const-max-native-texture-slots-player-texture-first-slot-176-src-mq3-client-playable-app-ml-834837129"></a>
### MAX_NATIVE_TEXTURE_SLOTS

```ml
const MAX_NATIVE_TEXTURE_SLOTS = PLAYER_TEXTURE_FIRST_SLOT + 176
```

Capacity limit for the native texture slots collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L92)

<a id="constant-constant-mq3-client-playable-app-max-projectile-textures-const-max-projectile-textures-8-src-mq3-client-playable-app-ml-515965121"></a>
### MAX_PROJECTILE_TEXTURES

```ml
const MAX_PROJECTILE_TEXTURES = 8
```

Capacity limit for the projectile textures collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L109)

<a id="constant-constant-mq3-client-playable-app-max-projectile-triangles-const-max-projectile-triangles-1024-src-mq3-client-playable-app-ml-1779096696"></a>
### MAX_PROJECTILE_TRIANGLES

```ml
const MAX_PROJECTILE_TRIANGLES = 1024
```

Capacity limit for the projectile triangles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L112)

<a id="constant-constant-mq3-client-playable-app-max-target-weapon-triangles-const-max-target-weapon-triangles-512-src-mq3-client-playable-app-ml-53578509"></a>
### MAX_TARGET_WEAPON_TRIANGLES

```ml
const MAX_TARGET_WEAPON_TRIANGLES = 512
```

Capacity limit for the target weapon triangles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L89)

<a id="constant-constant-mq3-client-playable-app-max-triangles-per-item-const-max-triangles-per-item-512-src-mq3-client-playable-app-ml-1341697715"></a>
### MAX_TRIANGLES_PER_ITEM

```ml
const MAX_TRIANGLES_PER_ITEM = 512
```

Capacity limit for the triangles per item collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L102)

<a id="constant-constant-mq3-client-playable-app-max-triangles-per-projectile-const-max-triangles-per-projectile-256-src-mq3-client-playable-app-ml-2052194728"></a>
### MAX_TRIANGLES_PER_PROJECTILE

```ml
const MAX_TRIANGLES_PER_PROJECTILE = 256
```

Capacity limit for the triangles per projectile collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L115)

<a id="constant-constant-mq3-client-playable-app-max-viewmodel-triangles-const-max-viewmodel-triangles-2048-src-mq3-client-playable-app-ml-373326581"></a>
### MAX_VIEWMODEL_TRIANGLES

```ml
const MAX_VIEWMODEL_TRIANGLES = 2048
```

Capacity limit for the viewmodel triangles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L104)

<a id="constant-constant-mq3-client-playable-app-max-visible-items-const-max-visible-items-24-src-mq3-client-playable-app-ml-2036586065"></a>
### MAX_VISIBLE_ITEMS

```ml
const MAX_VISIBLE_ITEMS = 24
```

Capacity limit for the visible items collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L98)

<a id="function-function-mq3-client-playable-app-modelcolor-function-modelcolor-sampled-normal-src-mq3-client-playable-app-ml-1900989541"></a>
### modelColor

```ml
function modelColor(sampled, normal)
```

Calls `mq3.renderer.playable_light_grid.vertexColor`, `mq3.compat.numeric.trunc32`, `mq3.client.playable_app.fallbackModelLight` from playable app `modelColor`. The final path returns `[component,component,component,255]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sampled` | `dynamic` | — | Record read through `sampled.totalFactor`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L487)

<a id="function-function-mq3-client-playable-app-nextplayertextureslot-function-nextplayertextureslot-textures-src-mq3-client-playable-app-ml-762116828"></a>
### nextPlayerTextureSlot

```ml
function nextPlayerTextureSlot(textures)
```

Evaluates playable app `nextPlayerTextureSlot` and returns `slot` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textures` | `dynamic` | — | Value used by `for each texture in textures if texture.slot>=slot then slot=texture.slot+1 end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L335)

<a id="function-function-mq3-client-playable-app-pickupmodeltriangles-function-pickupmodeltriangles-camera-catalog-items-now-src-mq3-client-playable-app-ml-943209906"></a>
### pickupModelTriangles

```ml
function pickupModelTriangles(camera, catalog, items, now)
```

Calls `mq3.client.playable_viewer.projectPoint`, `mq3.client.playable_item_models.find`, `mq3.client.playable_item_models.renderItem` from playable app `pickupModelTriangles`. The final path returns `triangles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `items` | `dynamic` | — | Sequence read at `items[index]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L575)

<a id="function-function-mq3-client-playable-app-pickupname-function-pickupname-classname-src-mq3-client-playable-app-ml-144514743"></a>
### pickupName

```ml
function pickupName(classname)
```

Evaluates playable app `pickupName` and returns `"5 HEALTH"`, `"25 HEALTH"`, `"50 HEALTH"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `if classname=="item_health_small" then return "5 HEALTH" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L393)

<a id="constant-constant-mq3-client-playable-app-player-texture-first-slot-const-player-texture-first-slot-lightmap-slots-272-src-mq3-client-playable-app-ml-431845817"></a>
### PLAYER_TEXTURE_FIRST_SLOT

```ml
const PLAYER_TEXTURE_FIRST_SLOT = LIGHTMAP_SLOTS + 272
```

Texture-cache slot or starting slot reserved for the player rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L81)

<a id="constant-constant-mq3-client-playable-app-player-triangles-per-surface-const-player-triangles-per-surface-8192-src-mq3-client-playable-app-ml-1431231187"></a>
### PLAYER_TRIANGLES_PER_SURFACE

```ml
const PLAYER_TRIANGLES_PER_SURFACE = 8192
```

Maximum triangle budget allocated to one animated player-model surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L83)

- [mq3.client.playable_app.PlayerModelAssets](Type-mq3-client-playable-app-playermodelassets-1156371250.md) — struct
<a id="function-function-mq3-client-playable-app-playerprojectilesnapshots-function-playerprojectilesnapshots-previous-state-now-src-mq3-client-playable-app-ml-1928999950"></a>
### playerProjectileSnapshots

```ml
function playerProjectileSnapshots(previous, state, now)
```

Calls `mq3.client.playable_projectile_view.alive`, `mq3.client.playable_projectile_view.flying`, `mq3.client.playable_app.trailFor` and additional helpers from playable app `playerProjectileSnapshots`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — | Value used by `for each value in previous`. |
| `state` | `dynamic` | — | Record read through `state.trails`, `state.projectiles`, `state.impacts`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L279)

- [mq3.client.playable_app.PlayerSkinSet](Type-mq3-client-playable-app-playerskinset-615689265.md) — struct
- [mq3.client.playable_app.PlayerTexture](Type-mq3-client-playable-app-playertexture-686084825.md) — struct
<a id="function-function-mq3-client-playable-app-playertextureslot-function-playertextureslot-assets-triangle-src-mq3-client-playable-app-ml-1848523435"></a>
### playerTextureSlot

```ml
function playerTextureSlot(assets, triangle)
```

Calls `stringEqualsIgnoreCaseAscii` from playable app `playerTextureSlot`. The final path returns `texture.slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — | Record read through `assets.models.lower`, `assets.models.upper`, `assets.models.head`, `assets.textures`. |
| `triangle` | `dynamic` | — | Record read through `triangle.part`, `triangle.surfaceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L684)

<a id="function-function-mq3-client-playable-app-projectilesnapshots-function-projectilesnapshots-previous-state-now-src-mq3-client-playable-app-ml-156823640"></a>
### projectileSnapshots

```ml
function projectileSnapshots(previous, state, now)
```

Calls `mq3.client.playable_projectile_view.alive`, `mq3.client.playable_projectile_view.flying`, `mq3.client.playable_app.trailFor` and additional helpers from playable app `projectileSnapshots`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — | Value used by `for each value in previous`. |
| `state` | `dynamic` | — | Record read through `state.trails`, `state.projectiles`, `state.impacts`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L256)

<a id="function-function-mq3-client-playable-app-render-function-render-camera-geometry-worldbatchstate-materialcatalog-skycatalog-itemcatalog-projectilecatalog-projectilefxstate-markstate-markcatalog-explosioncatalog-runtime-pickuptriangles-hudstate-basehudcatalog-basehudstate-menucatalog-menustate-matchmedia-itemstate-playerstate-shoteffects-projectileeffects-rendertargets-visibletargets-modelassets-eventstate-enemystate-weaponstate-combatstate-matchstate-matchview-matchcenter-viewmodeltransform-viewmodelclassname-viewmodelbarrelangle-viewmodelswitching-now-menuopen-src-mq3-client-playable-app-ml-251908520"></a>
### render

```ml
function render(camera, geometry, worldBatchState, materialCatalog, skyCatalog, itemCatalog, projectileCatalog, projectileFxState, markState, markCatalog, explosionCatalog, runtime, pickupTriangles, hudState, baseHudCatalog, baseHudState, menuCatalog, menuState, matchMedia, itemState, playerState, shotEffects, projectileEffects, renderTargets, visibleTargets, modelAssets, eventState, enemyState, weaponState, combatState, matchState, matchView, matchCenter, viewmodelTransform, viewmodelClassname, viewmodelBarrelAngle, viewmodelSwitching, now, menuOpen)
```

Calls `mq3.platform.playable_window.beginFrame`, `mq3.client.playable_menu.drawRetailState`, `mq3.client.playable_hud.drawText` and additional helpers from playable app `render`. The final path returns `resetUiState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `geometry` | `dynamic` | — | Record read through `geometry.lines`. |
| `worldBatchState` | `dynamic` | — | Value used by `if materialCatalog!=void then worldDrawn=playableWorldBatch.drawMaterialsLit(worldBatchState,projection,now,sceneLights)`. |
| `materialCatalog` | `dynamic` | — | Value used by `if materialCatalog!=void then worldDrawn=playableWorldBatch.drawMaterialsLit(worldBatchState,projection,now,sceneLights)`. |
| `skyCatalog` | `dynamic` | — | Value used by `if skyCatalog!=void then skyDraw=playableSky.draw(skyCatalog,camera,WIDTH,HEIGHT,now)`. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. |
| `projectileCatalog` | `dynamic` | — | Value used by `if projectileCatalog!=void then`. |
| `projectileFxState` | `dynamic` | — | Value used by `trailCommands=projectileFx.frameCommands(projectileFxState,camera,projectileEffects,now,WIDTH,HEIGHT,HORIZONTAL_FOV,1.0)`. |
| `markState` | `dynamic` | — | Value used by `if markCatalog!=void then markDrawn=playableMarks.draw(markState,markCatalog,projection,now)`. |
| `markCatalog` | `dynamic` | — | Value used by `if markCatalog!=void then markDrawn=playableMarks.draw(markState,markCatalog,projection,now)`. |
| `explosionCatalog` | `dynamic` | — | Value used by `if explosionCatalog!=void then explosionDrawn=playableExplosions.draw(explosionCatalog,projectileEffects,camera,projection,now)`. |
| `runtime` | `dynamic` | — | Record read through `runtime.lightGrid`. |
| `pickupTriangles` | `dynamic` | — | Value used by `itemDraw=drawItemTriangles(projection,pickupTriangles,lightGrid)`. |
| `hudState` | `dynamic` | — | Value used by `hud.draw(hudState,WIDTH,HEIGHT)`. |
| `baseHudCatalog` | `dynamic` | — | Value used by `if baseHudCatalog!=void then`. |
| `baseHudState` | `dynamic` | — | Value used by `drawnHud=baseHud.draw(baseHudCatalog,baseHudState,WIDTH,HEIGHT,now)`. |
| `menuCatalog` | `dynamic` | — | Value used by `menuDraw=menu.drawRetailState(menuCatalog,menuState,WIDTH,HEIGHT,now)`. |
| `menuState` | `dynamic` | — | Value used by `menuDraw=menu.drawRetailState(menuCatalog,menuState,WIDTH,HEIGHT,now)`. |
| `matchMedia` | `dynamic` | — | Value used by `if matchMedia!=void and matchView!=void then`. |
| `itemState` | `dynamic` | — | Accepted for compatibility with `render`; the current implementation does not read it. |
| `playerState` | `dynamic` | — | Accepted for compatibility with `render`; the current implementation does not read it. |
| `shotEffects` | `dynamic` | — | Accepted for compatibility with `render`; the current implementation does not read it. |
| `projectileEffects` | `dynamic` | — | Value used by `sceneLights=projectileFx.worldLights(projectileEffects,now)`. |
| `renderTargets` | `dynamic` | — | Value used by `enemyLights=targetMuzzleLights(camera,renderTargets,modelAssets,itemCatalog,eventState,enemyState,now)`. |
| `visibleTargets` | `dynamic` | — | Accepted for compatibility with `render`; the current implementation does not read it. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. |
| `eventState` | `dynamic` | — | Value used by `enemyLights=targetMuzzleLights(camera,renderTargets,modelAssets,itemCatalog,eventState,enemyState,now)`. |
| `enemyState` | `dynamic` | — | Value used by `enemyLights=targetMuzzleLights(camera,renderTargets,modelAssets,itemCatalog,eventState,enemyState,now)`. |
| `weaponState` | `dynamic` | — | Record read through `weaponState.triggerHeld`. |
| `combatState` | `dynamic` | — | Record read through `combatState.lastFire`, `combatState.score`, `combatState.deaths`. |
| `matchState` | `dynamic` | — | Record read through `matchState.phase`, `matchState.matchStart`. |
| `matchView` | `dynamic` | — | Record read through `matchView.clock`, `matchView.message`. |
| `matchCenter` | `dynamic` | — | Value used by `matchDraw=baseMatchDisplay.draw(matchMedia,WIDTH,HEIGHT,matchState.matchStart,now,showTimer,"FREE FOR ALL",warmupEnd,matchCenter)`. |
| `viewmodelTransform` | `dynamic` | — | Value used by `if not viewmodelSwitching then muzzleLight=muzzleFlash.dynamicLight(itemCatalog,viewmodelClassname,viewmodelTransform,combatState.lastFire,now...`. |
| `viewmodelClassname` | `dynamic` | — | Value used by `if not viewmodelSwitching then muzzleLight=muzzleFlash.dynamicLight(itemCatalog,viewmodelClassname,viewmodelTransform,combatState.lastFire,now...`. |
| `viewmodelBarrelAngle` | `dynamic` | — | Value used by `viewDraw=renderViewModel(projection,itemCatalog,weaponState,combatState,now,viewmodelTransform,viewmodelClassname,viewmodelBarrelAngle,not vie...`. |
| `viewmodelSwitching` | `dynamic` | — | Value used by `if not viewmodelSwitching then muzzleLight=muzzleFlash.dynamicLight(itemCatalog,viewmodelClassname,viewmodelTransform,combatState.lastFire,now...`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `menuOpen` | `dynamic` | — | Value used by `if menuOpen then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L963)

- [mq3.client.playable_app.RenderRuntime](Type-mq3-client-playable-app-renderruntime-1103072733.md) — struct
<a id="function-function-mq3-client-playable-app-rendertargetmodels-function-rendertargetmodels-camera-projection-rendertargets-modelassets-itemcatalog-eventstate-enemystate-now-lightgrid-src-mq3-client-playable-app-ml-1022884198"></a>
### renderTargetModels

```ml
function renderTargetModels(camera, projection, renderTargets, modelAssets, itemCatalog, eventState, enemyState, now, lightGrid)
```

Calls `mq3.renderer.player_render_cache.beginFrame`, `mq3.client.playable_enemy_events.input`, `mq3.format.player_animation.sampleAnimation` and additional helpers from playable app `renderTargetModels`. The final path returns `weaponDraw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. Record read through `camera.position`. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `renderTargets` | `dynamic` | — | Sequence read at `renderTargets[index]`. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. Record read through `modelAssets.cache`, `modelAssets.cache.frameTargets`, `modelAssets.animation`. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. |
| `eventState` | `dynamic` | — | Value used by `if modelAssets==void or eventState==void then return void end if`. |
| `enemyState` | `dynamic` | — | Record read through `enemyState.brains`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `lightGrid` | `dynamic` | — | Value used by `if lightGrid!=void then targetLight=playableLightGrid.entitySample(lightGrid,target.origin) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L822)

<a id="function-function-mq3-client-playable-app-rendertargetshadows-function-rendertargetshadows-projection-targets-eventstate-enemystate-now-runtime-src-mq3-client-playable-app-ml-1208090429"></a>
### renderTargetShadows

```ml
function renderTargetShadows(projection, targets, eventState, enemyState, now, runtime)
```

Calls `mq3.client.playable_enemy_events.input`, `mq3.client.playable_player_shadows.trace`, `mq3.client.playable_player_shadows.draw` from playable app `renderTargetShadows`. The final path returns `playerShadows.draw(values,runtime.shadowCatalog,projection)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `targets` | `dynamic` | — | Sequence read at `targets[index]`. |
| `eventState` | `dynamic` | — | Value used by `input=enemyEvents.input(eventState,index)`. |
| `enemyState` | `dynamic` | — | Record read through `enemyState.brains`. |
| `now` | `dynamic` | — | Accepted for compatibility with `renderTargetShadows`; the current implementation does not read it. |
| `runtime` | `dynamic` | — | Record read through `runtime.shadowCatalog`, `runtime.collisionWorld`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L916)

<a id="function-function-mq3-client-playable-app-renderviewmodel-function-renderviewmodel-projection-catalog-weaponstate-combatstate-now-transform-weaponclass-barrelangle-showflash-lightgrid-src-mq3-client-playable-app-ml-676274938"></a>
### renderViewModel

```ml
function renderViewModel(projection, catalog, weaponState, combatState, now, transform, weaponClass, barrelAngle, showFlash, lightGrid)
```

Calls `mq3.client.playable_item_models.find`, `mq3.client.playable_item_models.renderAsset`, `mq3.platform.playable_multitexture.setState` and additional helpers from playable app `renderViewModel`. The final path returns `drawn+barrelDrawn+flashDrawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. Record read through `projection.nearDistance`. |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `weaponState` | `dynamic` | — | Record read through `weaponState.triggerHeld`. |
| `combatState` | `dynamic` | — | Record read through `combatState.lastFire`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `transform` | `dynamic` | — | Value used by `if transform==void then return 0 end if`. |
| `weaponClass` | `dynamic` | — | Value used by `asset=itemModels.find(catalog,weaponClass)`. |
| `barrelAngle` | `dynamic` | — | Value used by `barrelTriangles=weaponBarrel.render(catalog,weaponClass,transform,barrelAngle,MAX_VIEWMODEL_TRIANGLES)`. |
| `showFlash` | `dynamic` | — | Value used by `if showFlash then`. |
| `lightGrid` | `dynamic` | — | Value used by `drawn=drawClippedItemTriangles(projection,triangles,lightGrid)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L620)

<a id="function-function-mq3-client-playable-app-reserveplayerspawn-function-reserveplayerspawn-targetstate-playerstate-spawnindex-src-mq3-client-playable-app-ml-874209143"></a>
### reservePlayerSpawn

```ml
function reservePlayerSpawn(targetState, playerState, spawnIndex)
```

Evaluates playable app `reservePlayerSpawn` and returns `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `playerState` | `dynamic` | — | Record read through `playerState.spawns`. |
| `spawnIndex` | `dynamic` | — | Value used by `previous=spawnIndex-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L896)

<a id="function-function-mq3-client-playable-app-restoreenemypositions-function-restoreenemypositions-targetstate-previous-src-mq3-client-playable-app-ml-1732109207"></a>
### restoreEnemyPositions

```ml
function restoreEnemyPositions(targetState, previous)
```

Evaluates playable app `restoreEnemyPositions` and returns `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `previous` | `dynamic` | — | Sequence read at `previous[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L173)

<a id="function-function-mq3-client-playable-app-run-function-run-map-sound-archive-src-mq3-client-playable-app-ml-1453089955"></a>
### run

```ml
function run(map, sound, archive)
```

Adapts `mq3.client.playable_app.runLimited` to playable app `run`, returning its result for `map, -1, sound, archive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Argument 1 of `mq3.client.playable_app.runLimited`. |
| `sound` | `dynamic` | — | Argument 3 of `mq3.client.playable_app.runLimited`. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.playable_app.runLimited`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1619)

<a id="function-function-mq3-client-playable-app-runlimited-function-runlimited-map-maxframes-sound-archive-src-mq3-client-playable-app-ml-1125189227"></a>
### runLimited

```ml
function runLimited(map, maxFrames, sound, archive)
```

Calls `mq3.platform.playable_window.open`, `mq3.client.cgame_info.create`, `mq3.client.playable_app.showNativeLoading` and additional helpers from playable app `runLimited`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record read through `map.data`, `map.counts`. |
| `maxFrames` | `dynamic` | — | Value used by `result=try(frameLoop(camera,geometry,triangles,worldBatchState,catalog,fogCatalog,dlightCatalog,markCatalog,markState,explosionCatalog,worldCa...`. |
| `sound` | `dynamic` | — | Sound handle or asset name passed to the audio action. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1315)

<a id="function-function-mq3-client-playable-app-shownativeloading-function-shownativeloading-state-progress-text-src-mq3-client-playable-app-ml-1096467889"></a>
### showNativeLoading

```ml
function showNativeLoading(state, progress, text)
```

Calls `mq3.client.cgame_info.loadingString`, `mq3.platform.playable_window.showLoading` from playable app `showNativeLoading`. The final path returns `window.showLoading(progress,state.infoScreenText)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.infoScreenText`. |
| `progress` | `dynamic` | — | Value used by `return window.showLoading(progress,state.infoScreenText)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `showNativeLoading` in the playable app path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1306)

<a id="function-function-mq3-client-playable-app-smoke-function-smoke-map-frames-src-mq3-client-playable-app-ml-949639806"></a>
### smoke

```ml
function smoke(map, frames)
```

Calls `mq3.client.playable_app.runLimited` from playable app `smoke`. The final path returns `runLimited(map,frames,void,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | map record passed to the playable app helper calls. |
| `frames` | `dynamic` | — | Value used by `if frames<1 or frames>600 then return error(7482,"preview smoke frame count outside range") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1623)

<a id="function-function-mq3-client-playable-app-smokeassets-function-smokeassets-map-frames-archive-src-mq3-client-playable-app-ml-453580748"></a>
### smokeAssets

```ml
function smokeAssets(map, frames, archive)
```

Calls `mq3.client.playable_app.runLimited` from playable app `smokeAssets`. The final path returns `runLimited(map,frames,void,archive)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | map record passed to the playable app helper calls. |
| `frames` | `dynamic` | — | Value used by `if frames<1 or frames>600 then return error(7482,"preview smoke frame count outside range") end if`. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L1631)

<a id="function-function-mq3-client-playable-app-startpose-function-startpose-map-src-mq3-client-playable-app-ml-1206186748"></a>
### startPose

```ml
function startPose(map)
```

Calls `mq3.format.bsp.entities`, `mq3.client.playable_app.field`, `mq3.compat.textnumbers.vector` and additional helpers from playable app `startPose`. The final path returns `[[0.0,0.0,64.0],0.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | map record passed to the playable app helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L212)

<a id="function-function-mq3-client-playable-app-synchudweaponselection-function-synchudweaponselection-hudstate-inventorystate-now-src-mq3-client-playable-app-ml-695184161"></a>
### syncHudWeaponSelection

```ml
function syncHudWeaponSelection(hudState, inventoryState, now)
```

Calls `mq3.client.playable_weapon_inventory.owns`, `mq3.client.playable_weapon_inventory.weaponDefinition`, `mq3.client.playable_weapon_inventory.ammoFor` and additional helpers from playable app `syncHudWeaponSelection`. The final path returns `baseHud.selectWeapons(hudState,weapons,ammo,selected.classname,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hudState` | `dynamic` | — | Value used by `return baseHud.selectWeapons(hudState,weapons,ammo,selected.classname,now)`. |
| `inventoryState` | `dynamic` | — | Record read through `inventoryState.selectedWeapon`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L447)

<a id="function-function-mq3-client-playable-app-syncrendertargets-function-syncrendertargets-targetstate-rendertargets-combathit-now-src-mq3-client-playable-app-ml-79980475"></a>
### syncRenderTargets

```ml
function syncRenderTargets(targetState, renderTargets, combatHit, now)
```

Updates `renderTargets[combatHit.targetIndex].hitFlashUntil` during playable app `syncRenderTargets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `renderTargets` | `dynamic` | — | Mutable sequence; this routine writes `renderTargets[combatHit.targetIndex].hitFlashUntil`. |
| `combatHit` | `dynamic` | — | Record read through `combatHit.targetIndex`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L869)

<a id="function-function-mq3-client-playable-app-targetmuzzlelights-function-targetmuzzlelights-camera-rendertargets-modelassets-itemcatalog-eventstate-enemystate-now-src-mq3-client-playable-app-ml-662391757"></a>
### targetMuzzleLights

```ml
function targetMuzzleLights(camera, renderTargets, modelAssets, itemCatalog, eventState, enemyState, now)
```

Calls `mq3.client.playable_enemy_events.input`, `mq3.format.player_animation.sampleAnimation`, `mq3.client.playable_app.targetWeaponTransform` and additional helpers from playable app `targetMuzzleLights`. The final path returns `light`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `renderTargets` | `dynamic` | — | Sequence read at `renderTargets[index]`. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. Record read through `modelAssets.animation`. |
| `itemCatalog` | `dynamic` | — | Item definitions and associated render resources. |
| `eventState` | `dynamic` | — | Value used by `if modelAssets==void or itemCatalog==void or eventState==void or enemyState==void then return result end if`. |
| `enemyState` | `dynamic` | — | Record read through `enemyState.brains`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L778)

<a id="function-function-mq3-client-playable-app-targettransform-function-targettransform-target-camera-src-mq3-client-playable-app-ml-1412105482"></a>
### targetTransform

```ml
function targetTransform(target, camera)
```

Calls `mq3.shared.math.VectorNormalize`, `mq3.renderer.player_model_assembly.identityTransform` from playable app `targetTransform`. The final path returns `root`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Record read through `target.origin`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. Record read through `camera.position`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L706)

<a id="function-function-mq3-client-playable-app-targetweapontransform-function-targetweapontransform-modelassets-lowersample-uppersample-root-src-mq3-client-playable-app-ml-1451392849"></a>
### targetWeaponTransform

```ml
function targetWeaponTransform(modelAssets, lowerSample, upperSample, root)
```

Calls `mq3.renderer.player_render_cache.keyFor`, `mq3.renderer.player_model_assembly.animation`, `mq3.renderer.player_render_cache.phaseBacklerp` and additional helpers from playable app `targetWeaponTransform`. The final path returns `itemModels.transform(attached.origin,attached.axis,1.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. Record read through `modelAssets.cache`, `modelAssets.models`. |
| `lowerSample` | `dynamic` | — | Value used by `key=playerCache.keyFor(modelAssets.cache,lowerSample,upperSample)`. |
| `upperSample` | `dynamic` | — | Value used by `key=playerCache.keyFor(modelAssets.cache,lowerSample,upperSample)`. |
| `root` | `dynamic` | — | Value used by `assembled=playerAssembly.assemble(modelAssets.models,lower,upper,playerAssembly.animation(0,0,0.0),root)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L733)

<a id="function-function-mq3-client-playable-app-textureslotforname-function-textureslotforname-textures-name-src-mq3-client-playable-app-ml-1065015509"></a>
### textureSlotForName

```ml
function textureSlotForName(textures, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable app `textureSlotForName`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textures` | `dynamic` | — | Value used by `for each texture in textures if stringEqualsIgnoreCaseAscii(texture.imageName,name) then return texture.slot end if end for`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable app resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L328)

<a id="function-function-mq3-client-playable-app-trailfor-function-trailfor-trails-projectileid-src-mq3-client-playable-app-ml-1686190637"></a>
### trailFor

```ml
function trailFor(trails, projectileId)
```

Evaluates playable app `trailFor` and returns `trail`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trails` | `dynamic` | — | Value used by `for each trail in trails if trail.projectileId==projectileId then return trail end if end for`. |
| `projectileId` | `dynamic` | — | Value used by `for each trail in trails if trail.projectileId==projectileId then return trail end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L247)

<a id="function-function-mq3-client-playable-app-vertexlight-function-vertexlight-vertex-src-mq3-client-playable-app-ml-2043307020"></a>
### vertexLight

```ml
function vertexLight(vertex)
```

Computes `(vertex.color[0]+vertex.color[1]+vertex.color[2])/(255.0*3.0)` for playable app `vertexLight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertex` | `dynamic` | — | Record read through `vertex.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L230)

<a id="function-function-mq3-client-playable-app-visibletargetviews-function-visibletargetviews-enemystate-rendertargets-now-src-mq3-client-playable-app-ml-45553605"></a>
### visibleTargetViews

```ml
function visibleTargetViews(enemyState, renderTargets, now)
```

Evaluates playable app `visibleTargetViews` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enemyState` | `dynamic` | — | Record read through `enemyState.brains`. |
| `renderTargets` | `dynamic` | — | Sequence read at `renderTargets[index]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L883)

<a id="constant-constant-mq3-client-playable-app-width-const-width-640-src-mq3-client-playable-app-ml-1512300219"></a>
### WIDTH

```ml
const WIDTH = 640
```

Baseq3's virtual screen and default cg_fov are 640x480 and 90 degrees. Using them directly avoids HUD/aspect distortion and lowers software fill cost.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L69)

<a id="constant-constant-mq3-client-playable-app-world-selection-interval-const-world-selection-interval-15-src-mq3-client-playable-app-ml-1232601541"></a>
### WORLD_SELECTION_INTERVAL

```ml
const WORLD_SELECTION_INTERVAL = 15
```

Number of rendered frames between periodic world-selection updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L77)
