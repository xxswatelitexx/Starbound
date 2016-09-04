function init()
  --Instantly spawn the pet when first created
  storage.spawnTimer = storage.spawnTimer and 0.5 or 0
  storage.petParams = storage.petParams or {}
  pets = { "petbunny", "petcat", "crasberry", "petorbis", "piglett", "petsnake", "snugget", "petweasel" }	
	if storage.monsterType == nil then 
		local i = randomizer()
		self.monsterType = pets[i]
		storage.monsterType = self.monsterType
	end
  self.spawnOffset = entity.configParameter("spawnOffset", {0, 2})
end

function randomizer()
	math.randomseed(os.time())
	randomNum = math.random(1,8)
	return randomNum
end

function hasPet()
  return self.petId ~= nil
end

function setPet(entityId, params)
  if self.petId == nil or self.petId == entityId then
    self.petId = entityId
    storage.petParams = params
  else
    return false
  end
end

function update(dt)
  if self.petId and not world.entityExists(self.petId) then
    self.petId = nil
  end

  if storage.spawnTimer < 0 and self.petId == nil then
    storage.petParams.level = 1
    self.petId = world.spawnMonster(storage.monsterType, entity.toAbsolutePosition(self.spawnOffset), storage.petParams)
    world.callScriptedEntity(self.petId, "setAnchor", entity.id())
    storage.spawnTimer = 0.5
  else
    storage.spawnTimer = storage.spawnTimer - dt
  end
end