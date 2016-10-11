function init()
  object.setInteractive(true)
end

function update()
end

function onInteraction(args)
  uflag = world.universeFlags()
  sb.logInfo(#uflag)
  for i,v in ipairs(uflag) do
	   if v == "test01" then
       sb.logInfo("Match Found")
       ntest = { radioMessagesOnPickup = {"test02"} }
       world.spawnItem("newspaper", entity.position(), 1, ntest )
     else
       sb.logInfo("Does not match")
     end
  end
  world.setUniverseFlag("test01")
end

function uninit()
  sb.logInfo("Has been removed")
  -- This snippet is just a simply point breaker in time in the log to know when the object was removed. So when replaced we know if the value has changed.
end
