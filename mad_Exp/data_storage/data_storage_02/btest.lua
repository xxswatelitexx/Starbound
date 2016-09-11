function init()
  object.setInteractive(true)
end

function update()
  test = config.getParameter("test", "bca")
  sb.logInfo(test)
  --Testing to see if the value was saved or not. If the value was not the log will show bca instead of abc
end

function onInteraction(args)
  sb.logInfo ("Has been interacted with")
  tValue = {test="abc"}
  world.spawnItem(object.name(), entity.position(), 1, tValue)
  object.smash(true)
  --tValue is a table which stores the custom parameters of the object. More parameters can be added by seperating them with a comma
  --When calling world.spawnItem you will notice tValue is added in the end, this spot is reserved for custom parameters
  --To prevent a duplicate item from being made, on smashing. We set object.smash(true) by setting true the item does not drop after removing it. If false the item will drop.
end

function uninit()
  sb.logInfo("Has been removed")
  --This is just a final check.
end
