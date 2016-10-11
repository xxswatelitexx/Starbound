function init()
  object.setInteractive(true)
end

function update()
end

function onInteraction(args)
test = world.players()
  for i,v in ipairs(test) do
     sb.logInfo(tostring(i))
     sb.logInfo(tostring(v))
     world.sendEntityMessage( v, "queueRadioMessage", "sm1a")
   end
end

function uninit()
  sb.logInfo("Has been removed")
  -- This snippet is just a simply point breaker in time in the log to know when the object was removed. So when replaced we know if the value has changed.
end
