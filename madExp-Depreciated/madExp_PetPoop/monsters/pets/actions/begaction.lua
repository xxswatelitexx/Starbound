begAction = {
}

function begAction.enterWith(args)
  if not args.begTarget then return nil end

  --Make sure the target is valid
  if not world.entityExists(args.begTarget) then return nil end

  return { 
    targetId = args.begTarget,
    approachDistance = entity.configParameter("actionParams.beg.distance", 3),
    runDistance = 5,
    emoteTimer = 0,
    emoteCooldown = entity.configParameter("actionParams.beg.emoteCooldown", 2),
    approachTimer = 5,
    maxApproachTime = 5
  }
end

function begAction.update(dt, stateData)
  if not world.entityExists(stateData.targetId) then return true end

  local targetPosition = world.entityPosition(stateData.targetId)
  local targetDistance = world.magnitude(targetPosition, mcontroller.position())

  local primaryItem = world.entityHandItem(stateData.targetId, "primary")
  local altItem = world.entityHandItem(stateData.targetId, "alt")
  local foodLiking = itemFoodLiking(primaryItem) or itemFoodLiking(altItem)
  if not foodLiking then return true end

  local running = targetDistance > stateData.runDistance

  --Approach the target
  if not approachPoint(dt, targetPosition, stateData.approachDistance, running) then
    stateData.approachTimer = stateData.approachTimer - dt

    if stateData.approachTimer < 0 or self.pathing.stuck then
      return true, entity.configParameter("actionParams.beg.distance", 10)
    end

    return false
  end

  stateData.approachTimer = stateData.maxApproachTime
  --inspect
  setIdleState()
  stateData.emoteTimer = stateData.emoteTimer - dt

  if stateData.emoteTimer < 0 then
    emote("happy")
    stateData.emoteTimer = stateData.emoteTimer + stateData.emoteCooldown
  end


  return false
end
