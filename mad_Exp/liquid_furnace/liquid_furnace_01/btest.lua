function init()
  object.setInteractive(true)
  objPos = object.position()
  sb.logInfo(objPos[1].." x")
  sb.logInfo(objPos[2].." y")
end

function update()

end

function onInteraction(args)
  sb.logInfo("Object has been interacted with")
  liqTable = world.liquidAt(object.position())
  liqID = config.getParameter(liqTable[1], "money")
  -- world liquid at will return the most quantity liuqid at a location.
  -- Since it returns table the first value is liquid ID and 2nd value is the amount
  -- You will need to give a posistion in order for it to return a value. Either dirctly inputting x,y coordinates or using a function such as shown
  sb.logInfo(tostring(liqTable[1]).. " Liquid ID #")
  sb.logInfo(tostring(liqTable[2]).. " Amount of Liquid")

  if liqTable[2] >= 0.99 then
    sb.logInfo("Passes Liquid Quantity Check")
    world.destroyLiquid(objPos)
    world.spawnItem(liqID, objPos, 1)
  else
    sb.logInfo("Fails Liquid Quantity Check")
  end
end

function uninit()

end
