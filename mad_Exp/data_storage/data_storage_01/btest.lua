function init()
  object.setInteractive(true)
end

function update()
  test = config.getParameter("test", "bca")
  --Update is constantly called, so since I need to check if the value is being written into the object. It is kept here.
  --config.getParametery(x, y) works by -  x = the value to look for in the JSON. y = if x does not exist, replace it with so and so value.
  --With that said if the object has never been interacted with, it will show "bca". After interaction the value will always show abc.
end

function onInteraction(args)
  sb.logInfo ("Has been interacted with")
  object.setConfigParameter("test", "abc")
  sb.logInfo(test)
  --object.setConfigParameter(x,y) x = JSON value, y = value to add or replace existing value with.
  --So when the object is interacted the new data will show abc in the log.
end

function uninit()
  sb.logInfo("Has been removed")
  -- This snippet is just a simply point breaker in time in the log to know when the object was removed. So when replaced we know if the value has changed.
end
