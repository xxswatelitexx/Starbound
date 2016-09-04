function init()
--Sets up the initial variables
	blChance = effect.configParameter("bleedingChance", 30)
	self.stage = { 0.025, 0.05, 0.1 }
	bleeding = status.resource("blStage")
	world.logInfo(tostring(status.resource("blStage")).." Bleeding Stage first check")

--Checks if any wounds have occurred
	if bleeding == 0 then
		status.modifyResource("blStage", 1)
		blChance = set_bleedingChance(blChance)
		bleeding = status.resource("blStage")
	else if bleeding >= 1 and bleeding <= 3 then
		status.modifyResource("blStage", 1)
		bleeding = status.resource("blStage")
	end
end

--Kills status effect if random generator hits 1.
	if blChance <= 1 then 
		effect.expire()
	end

  script.setUpdateDelta(5)
  self.tickTime = 1
  self.tickTimer = self.tickTime
end

-- The init function runs through a random number generation to see if the effect will happen or not.
function set_bleedingChance(blChance)
	math.randomseed(os.time())
	local _i = math.random(1,blChance)
	world.logInfo(tostring(_i).." Bleeding chance 2")
	return _i
end

--Constantly checks if bleeding status modifier has changed by other means
--If blStatus modifier ever becomes 0 while active, the bleeding will expire. 
function update(dt)
	bleeding = status.resource("blStage")	
  self.tickTimer = self.tickTimer - dt
  if bleeding == 0 then
		status.modifyResource("blStage",-bleeding)
		effect.expire()
	else if self.tickTimer <= 0 then
    self.tickTimer = self.tickTime
    status.applySelfDamageRequest({
        damageType = "IgnoresDef",
        damage = math.floor(status.resourceMax("health") * self.stage[bleeding]) + 1,
        damageSourceKind = "burning",
        sourceEntityId = entity.id()
      })
  end
	end
end

-- Checks to see if player has died. If so it heals all wounds.
function uninit()
	if status.resource("health") <= 0 then
  status.modifyResource("blStage",-bleeding)
	end
end