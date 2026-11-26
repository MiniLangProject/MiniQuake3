# `mq3.client.playable_weapon_inventory.Inventory`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-inventory-ml-1741297641.md)

<a id="struct-struct-mq3-client-playable-weapon-inventory-inventory-struct-inventory-src-mq3-client-playable-weapon-inventory-ml-1754198133"></a>
## Inventory

```ml
struct Inventory
```

Stores playable weapon inventory inventory record, including `ownedBits`, `ammo`, `selectedWeapon`, `spawnCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L49)

## Members

<a id="field-field-mq3-client-playable-weapon-inventory-inventory-ammo-ammo-src-mq3-client-playable-weapon-inventory-ml-1866611403"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L54)

<a id="field-field-mq3-client-playable-weapon-inventory-inventory-ownedbits-ownedbits-src-mq3-client-playable-weapon-inventory-ml-2006079271"></a>
### ownedBits

```ml
ownedBits
```

Weapon-ownership bitset tested with one bit per weapon identifier; respawning installs the default gauntlet and machinegun loadout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L52)

<a id="field-field-mq3-client-playable-weapon-inventory-inventory-selectedweapon-selectedweapon-src-mq3-client-playable-weapon-inventory-ml-1010838485"></a>
### selectedWeapon

```ml
selectedWeapon
```

When constructing this record, `create` supplies `WP_MACHINEGUN` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L56)

<a id="field-field-mq3-client-playable-weapon-inventory-inventory-spawncount-spawncount-src-mq3-client-playable-weapon-inventory-ml-2052235703"></a>
### spawnCount

```ml
spawnCount
```

Number of spawn-loadout resets applied to this weapon inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L58)
