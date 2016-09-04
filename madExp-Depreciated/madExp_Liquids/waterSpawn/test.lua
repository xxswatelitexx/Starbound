function init()
entity.setInteractive(entity.configParameter("interactive", true))
end

function onInteraction(args)
	local pos = entity.position()
  local modifiedPosition = {pos[1], pos[2]-4}
	world.spawnLiquid( modifiedPosition, 1, 100)
end
