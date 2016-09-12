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


function uninit()
end

--function Flashlight:init()
--  self:reset()
--end

--function Flashlight:update(dt, fireMode, shiftHeld)
--  WeaponAbility.update(self, dt, fireMode, shiftHeld)

--  if self.fireMode == "alt" and self.lastFireMode ~= "alt" then
--    self.active = not self.active
--    animator.setLightActive("flashlight", self.active)
--    animator.setLightActive("flashlightSpread", self.active)
--    animator.playSound("flashlight")
--  end
--  self.lastFireMode = fireMode
--end

--function Flashlight:reset()
--  animator.setLightActive("flashlight", false)
--  animator.setLightActive("flashlightSpread", false)
--  self.active = false
--end

--function Flashlight:uninit()
--  self:reset()
--end
