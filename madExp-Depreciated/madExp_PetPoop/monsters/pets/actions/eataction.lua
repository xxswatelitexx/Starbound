eatAction = {
}

function eatAction.enterWith(args)
  if not args.eatTarget then return nil end

  if status.resource("hunger") < entity.configParameter("actionParams.eat.minHunger", 40) then
    return nil
  end

  --Make sure the target is valid
  local entityType = world.entityType(args.eatTarget)
  if not world.entityExists(args.eatTarget) or (entityType ~= "itemdrop" and entityType ~= "object") then 
    return nil 
  end

  return { 
    targetId = args.eatTarget,
    approachDistance = entity.configParameter("actionParams.eat.distance", 2),
    runDistance = 5,
    eatTimer = 2,
    approachTimer = 5,
    eating = false
  }
end

function eatAction.update(dt, stateData)
  if not world.entityExists(stateData.targetId) then return true end

  local targetPosition = world.entityPosition(stateData.targetId)
  local targetDistance = world.magnitude(targetPosition, mcontroller.position())

  local running = targetDistance > stateData.runDistance

  --Approach the target
  if not approachPoint(dt, targetPosition, stateData.approachDistance, running) then
    stateData.approachTimer = stateData.approachTimer - dt

    if stateData.approachTimer < 0 or self.pathing.stuck then
      return true, 5
    end

    return false
  end

  if stateData.eating == false then
    entity.setAnimationState("movement", "eat")
    stateData.eating = true
  end

  stateData.eatTimer = stateData.eatTimer - dt

  if stateData.eatTimer < 0 then
    local targetType = world.entityType(stateData.targetId)
    if (targetType == "itemdrop" and eatAction.consumeItemDrop(stateData)) or
       (targetType == "object" and not eatAction.foodInBowl(stateData.targetId)) or
       (targetType == "object" and eatAction.consumeFromObject(stateData)) then
      return true, entity.configParameter("actionParams.eat.cooldown")
    end
  end

  return false
end

function eatAction.consumeItemDrop(stateData)
  local itemDrop = world.takeItemDrop(stateData.targetId)
    if itemDrop then
    local itemName = world.entityName(stateData.targetId)
    local foodLiking = itemFoodLiking(itemName)

    if foodLiking > 50 then
      emote("happy")
    else
      emote("sad")
    end

    status.modifyResource("hunger", -40 * itemDrop.count)
    return true
  end
end

function eatAction.foodInBowl(objectId)
  local item = world.containerItemAt(objectId, 0)
  if item then
    local foodLiking = itemFoodLiking(item.name)
    if foodLiking then
      return foodLiking
    end
  end
  return false
end

function eatAction.consumeFromObject(stateData)
  local foodLiking = eatAction.foodInBowl(stateData.targetId) 
  
  if foodLiking and world.containerConsumeAt(stateData.targetId, 0, 1) then
    if foodLiking > 50 then
      emote("happy")
    else
      emote("sad")
    end

    status.modifyResource("hunger", -40)
    return true
  end

  return false
end
