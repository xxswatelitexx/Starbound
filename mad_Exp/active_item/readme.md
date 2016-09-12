In these set of experiments I want to see how active items work.
This time I am going to look into making a progressive experiment breaking down each functional aspect.

###Experiment 1 - Simple Arm Movement.
In this first experiment I wanted to see the (some what) minimum required to get the arm to even move around.
Simply having the item by it self will cause your arm to be set in a fixed position unless told to explicitly follow the mouse cursor.

```lua
require "/scripts/util.lua"
require "/scripts/vec2.lua"

function init()
  self.fireOffset = config.getParameter("fireOffset")
end

function update(dt, fireMode, shiftHeld, moves)
  self.aimAngle, self.facingDirection = activeItem.aimAngleAndDirection(self.fireOffset[2], activeItem.ownerAimPosition())
  activeItem.setFacingDirection(self.facingDirection)
  updateAim()
end

function updateAim()
  if self.active then
    activeItem.setArmAngle(aimAngle())
  else
    self.aimAngle, self.aimDirection = activeItem.aimAngleAndDirection(0, activeItem.ownerAimPosition())
    -- self.aimAngle, self.aimDirection = aimAngle or 0, aimDirection or 0
    activeItem.setArmAngle(self.aimAngle)
    activeItem.setFacingDirection(self.aimDirection)
  end
end
```

From some rough testing - this seems to be the core code.

###Experiment 2 - Basic function
Now that the arm moves around we need to deal with making our flashlight functional. Which means dealing with the animation file and lua.
The animation file in most part should be self explanatory as it is pretty bare bones.
For lua we added this segment to update()

```lua
if fireMode == "primary" and self.previousFireMode ~= "primary" then
    self.active = not self.active
    animator.setLightActive("flashlight", self.active)
    animator.setLightActive("flashlightSpread", self.active)
    animator.playSound("flashlight")
    end
    self.lastFireMode = fireMode
  ```  

This checks to see if left click has been pressed then turns on the activators and finally preserves the last state.
Though there are some bugs we will need to deal with in Experiment 3, main one being is it tends to spam the activation, though
the experiment it self is a complete success as it is a fully functional flashlight. 
