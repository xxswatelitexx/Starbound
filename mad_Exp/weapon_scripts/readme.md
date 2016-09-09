In this set of experiments we will look at how to hook certain actions to weapons.

###Experiment 1: status_effect_when_weapon_is_equipped
In this test we use a custom weapon script to give the player the "staffslow" status while wielding the weapon.

In the activeiteom we added:
```JSON
"scripts" : [
  "/items/active/weapons/ranged/gun.lua",
  "/items/active/weapons/scripts/testheavyweapon.lua"
],
```
or:
```JSON
"scripts" : [
  "/items/active/weapons/melee/meleeweapon.lua",
  "/items/active/weapons/scripts/testheavyweapon.lua"
],
```

And into the proper lua file:
```Lua
function init()
  oldInit()
  status.setPersistentEffects("onEquiptStatus", { "staffslow" })
end
...
function uninit()
  oldUnInit()
  status.clearPersistentEffects("onEquiptStatus")
end
```

###Experiment 2: status_effect_on_energy_exaustion
In this test we use a custom weapon script to give the player the "staffslow" status when he/she runs out of energy.
In the activeiteom we added:
```JSON
"scripts" : [
  "/items/active/weapons/ranged/gun.lua",
  "/items/active/weapons/scripts/testdizzyingweapon.lua"
],
```
or:
```JSON
"scripts" : [
  "/items/active/weapons/melee/meleeweapon.lua",
  "/items/active/weapons/scripts/testdizzyingweapon.lua"
],
```

And into the proper lua file:
```Lua
function update(dt, fireMode, shiftHeld)
  local preEnergy = status.resource("energy")

  oldUpdate(dt, fireMode, shiftHeld)

  local postEnergy = status.resource("energy")

  if postEnergy < preEnergy and postEnergy == 0 then
    status.addEphemeralEffect("staffslow", 3.0)
  end
end
```
