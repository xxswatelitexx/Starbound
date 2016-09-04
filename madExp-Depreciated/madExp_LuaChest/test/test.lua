function init(args)
self.timer = 1
end

function update(dt)
	self.timer = self.timer - dt
	if self.timer <= 0 then
		self.timer = 5
		local containerItems = world.containerItems(entity.id())
		local pos = entity.position()
		local modifiedPosition = {pos[1], pos[2]-4}
		
		for slot,item in pairs(containerItems) do
			i = item.name
			j, k = string.find(i, "H_sbno")
			i = string.sub(i,0,j - 1)
			world.spawnItem(i, modifiedPosition, 1)
			world.logInfo(item.count.." ".. item.name .. " is in slot " .. slot)
		end
	end
end