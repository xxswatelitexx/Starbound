
function update()
trapRadius = world.monsterQuery(entity.posistion(), 4)
	for i, 1 do
		x = trapRadus[i]
		entity.smash(x)
	end
end