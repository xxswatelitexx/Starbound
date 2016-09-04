function init()
  if storage.liquidLevel == nil then
		storage.liquidLevel = 0
  end
	self.tickTimer = 5
	storage.epochTime = world.time()
end

-----------------------
-- Main Mod
-----------------------
-- liquidType is a JSON value placed inside the object file which is numerically corresponding to the values in the liquid.config
--liquidAmount is a planned value for the maximum storage capacity of the plant
--Every 5 seconds the 3 major functions of the plant is running. 
function update(dt)
	posOrg = entity.position()
	reqLiqType = world.objectConfigParameter(entity.id(), "liquidType", 0)
	reqLiqAmount = world.objectConfigParameter(entity.id(), "liquidAmount", 0)
	self.tickTimer = self.tickTimer - dt
	if self.tickTimer <= 0 then
		self.tickTimer = 5
		removeLiq()
		consumeLiq()
		checkPHealth()
	end
end

function removeLiq()
	world.logInfo("Remove liq Function Activated")
	liqType, liqAmount = world.liquidAt({posOrg[1],posOrg[2]-2})
	world.logInfo(liqType)
	if liqType[1] == reqLiqType and storage.liquidLevel <= 900 then
		world.destroyLiquid({posOrg[1],posOrg[2]-2})
		storage.liquidLevel = storage.liquidLevel + 100
		world.logInfo(tostring(storage.liquidLevel).." Added New Liquid")
	else
		checkPHealth()
	end
end

function consumeLiq()
	world.logInfo("Consume liq Function Activated")
		if storage.epochTime <= world.time() + 30 then
			local calTime = world.time() - storage.epochTime
			storage.liquidLevel = storage.liquidLevel - calTime
			storage.epochTime = world.time()
			world.logInfo(tostring(storage.liquidLevel).." New Liquid Level")
		end
end

function checkPHealth()
	world.logInfo("CheckPhealth Function Activated")
	if storage.liquidLevel <= 0 then 
	world.logInfo(tostring(storage.waterLevel).." water level") 
  entity.smash()
	else return storage.liquidLevel 
	end
end
-----------------------
-- MOD API FUNCTIONS
-----------------------
-- reqPlantInfo - used by other objects to request information on the plant. Returns: Name of Plant (objectName), Liquid Type plant Requires, current stored liquid level.
function reqPlantInfo()
	return world.objectConfigParameter(entity.id(), "objectName", "none"), world.objectConfigParameter(entity.id(), "liquidType", "Liquid Type None"), storage.liquidLevel
end

--sendFluid is used by other objects to directly fill a plants reservoirs. sendFluidType = integer number based on liquids.config and sendLiquidAmount ideally an integer.
--If the fluid type is not the same as the one the plant requires the function will return nil.
--If the fluid amount is more than 1000 unit storage capacity it will return the remaining amount
--If the fluid amount equals less than 1000 units in the plant, it will return 0.

function sendFluid(sendLiquidType, sendLiquidAmount)
	if not sendLiquidType == reqLiqType then
		return nil
	else if (storage.liquidLevel + sendLiquidAmount) >= 1000 then
		storage.liquidLevel = 1000
		return (storage.liquidLevel + sendliquidAmount) - 1000
  else storage.liquidLevel = storage.liquidLevel + sendLiquidAmount 
		return 0
	end
  end
end