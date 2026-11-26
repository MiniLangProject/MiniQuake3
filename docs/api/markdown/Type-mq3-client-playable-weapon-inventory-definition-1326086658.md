# `mq3.client.playable_weapon_inventory.Definition`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-inventory-ml-1741297641.md)

<a id="struct-struct-mq3-client-playable-weapon-inventory-definition-struct-definition-src-mq3-client-playable-weapon-inventory-ml-194225043"></a>
## Definition

```ml
struct Definition
```

Stores playable weapon inventory definition record, including `id`, `name`, `classname`, `ammoClassname`, `weaponQuantity`, `ammoQuantity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L33)

## Members

<a id="field-field-mq3-client-playable-weapon-inventory-definition-ammoclassname-ammoclassname-src-mq3-client-playable-weapon-inventory-ml-1732703376"></a>
### ammoClassname

```ml
ammoClassname
```

When constructing this record, `definitions` supplies `"ammo_bullets"` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L41)

<a id="field-field-mq3-client-playable-weapon-inventory-definition-ammoquantity-ammoquantity-src-mq3-client-playable-weapon-inventory-ml-917375750"></a>
### ammoQuantity

```ml
ammoQuantity
```

When constructing this record, `definitions` supplies `50` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L45)

<a id="field-field-mq3-client-playable-weapon-inventory-definition-classname-classname-src-mq3-client-playable-weapon-inventory-ml-872646340"></a>
### classname

```ml
classname
```

Native weapon classname associated with this inventory definition's weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L39)

<a id="field-field-mq3-client-playable-weapon-inventory-definition-id-id-src-mq3-client-playable-weapon-inventory-ml-1410140110"></a>
### id

```ml
id
```

Native item or powerup identifier associated with this definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L35)

<a id="field-field-mq3-client-playable-weapon-inventory-definition-name-name-src-mq3-client-playable-weapon-inventory-ml-1871456798"></a>
### name

```ml
name
```

Virtual resource or definition name used to locate this entry in the client asset catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L37)

<a id="field-field-mq3-client-playable-weapon-inventory-definition-weaponquantity-weaponquantity-src-mq3-client-playable-weapon-inventory-ml-1285336062"></a>
### weaponQuantity

```ml
weaponQuantity
```

When constructing this record, `definitions` supplies `40` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L43)
