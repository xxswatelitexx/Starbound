function init()
  object.setInteractive(true)
  test = config.getParameter("test", "bca")
  test2 = config.getParameter("test2", "bca")
end

function onInteraction(args)
  sb.logInfo ("Has been interacted with")
  sb.logInfo(test[1])
  sb.logInfo(test[2])
  sb.logInfo(test[3])
  sb.logInfo("### LINE BREAK FOR PART 2###")
  sb.logInfo(tostring(test2[1]))
  test2a = test2[2]
  sb.logInfo(tostring(test2a["five"]))
end

function uninit()
  sb.logInfo("Has been removed")
  -- This snippet is just a simply point breaker in time in the log to know when the object was removed. So when replaced we know if the value has changed.
end
