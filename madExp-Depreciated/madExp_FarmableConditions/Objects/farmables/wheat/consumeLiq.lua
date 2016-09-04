--First it makes sure the plant is placed before it even attempts to get its position and data values
--Otherwise it will just spam consistently even when virtual. 
--Now it checks if the object file has a liquidType entry, if not it applies a default 0

--self drink timer is just the amount of time before it drinks.

function init(virtual)
	if not virtual then
		posOrg = entity.position()
		reqLiqType = entity.configParameter("liquidType", 0)
		world.logInfo(tostring(reqLiqType).." Req Liq Type")
	end
	self.drinkTimer = 3
end

--when self drink timer reaches 0 it resets and calls the drink function.
function update(dt)
	self.drinkTimer = self.drinkTimer - dt
	if self.drinkTimer <= 0 then 
		self.drinkTimer = 3
		world.logInfo("Count Down Finished")
		drink()
	end
end


--In the drink function it first checks for water at the position of the object.
--Since I stored the position in posOrg - I can manipulate the x, y coordinate of where to check if I wanted too.
--Next it checks if liqType is Nil or 0 using the inverse not, so if liqType is nill then it breaks the plant
--else if LiqType[1] ( first liquid in the table ) is equal to the liquid type in the object file (based on liquids.config) 
--it removes the liquid infront of the object
--otherwise if it is a different liquid type it will just destroy the object.
function drink()
	liqType, liqAmount = world.liquidAt({posOrg[1],posOrg[2]})
	if not liqType then
		world.logInfo(tostring(liqAmount).." Liq Amount Before Destruction")
		entity.smash()
	else if liqType[1] == reqLiqType then
		world.destroyLiquid({posOrg[1],posOrg[2]})
		world.logInfo("Removed Liquid")
	else
		world.logInfo("Destroy Plant")
		entity.smash()
	end
	end
end

function uninit()
end