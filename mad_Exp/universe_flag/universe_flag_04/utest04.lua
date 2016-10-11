function init()
  object.setInteractive(true)
end

function update()
end

function onInteraction(args)
  tpos = world.entityPosition(entity.id())
  for i,v in ipairs(tpos) do
     sb.logInfo(tostring(i) .." Table Spot")
     sb.logInfo(tostring(v).. " Coordinate")
   end
  tBox = world.entityQuery(tpos, 5)
  for i,v in ipairs(tBox) do
     sb.logInfo(tostring(i).. " Table Spot")
     sb.logInfo(tostring(v) .." Entity ID")
    world.sendEntityMessage( v, "queueRadioMessage", "sm1a")
   end
end

function uninit()
  sb.logInfo("Has been removed")
  -- This snippet is just a simply point breaker in time in the log to know when the object was removed. So when replaced we know if the value has changed.
end
