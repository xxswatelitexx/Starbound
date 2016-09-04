function init()
  if status.resource("test") <= 1 then 
		value = math.random(0,1)
		spawn(value)
	else if status.resource("test") >= 2 and status.resource("test") <= 5 then 
		value = math.random(2,5)
		spawn(value)
	else
		value = 10
		spawn(value)
	end
	end
end

function spawn (value)
	world.spawnItem("alienfruit", mcontroller.position(), value)
end

function update(dt)
end

function uninit()
end