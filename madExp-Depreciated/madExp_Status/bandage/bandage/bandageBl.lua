function init()
  if status.resource("blStage") == 0 then
		world.spawnItem("bandageBl2", mcontroller.position(), 1)
		world.logInfo("Kill Bandage Effect")
		effect.expire()
		else
		status.modifyResource("blStage", -1)
		world.logInfo("Lower Bl Stage")
		world.logInfo(tostring(status.resource("blStage")).." Bl Stage")
		end
end

function update(dt)
  
end

function uninit()
  
end