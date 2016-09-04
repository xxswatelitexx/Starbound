function init()
  pos = entity.position()
  if world.material({pos[1],pos[2]-2}, "foreground") == "ironblock" then
  return
	else
	entity.smash()
  end
end

function die()
 world.damageTiles({{pos[1],pos[2]-2}}, "foreground",{pos[1],pos[2]-1}, "plantish", 100, 99)
end