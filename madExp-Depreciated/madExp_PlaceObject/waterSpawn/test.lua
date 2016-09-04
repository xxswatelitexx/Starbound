function init()
entity.setInteractive(entity.configParameter("interactive", true))
end

function onInteraction(args)
	local pos = entity.position()
  local modifiedPosition = {pos[1]-4, pos[2]}
	world.placeObject("poop", modifiedPosition)
end
