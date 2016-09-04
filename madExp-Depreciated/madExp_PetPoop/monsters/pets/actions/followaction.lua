followAction = {}

function followAction.enterWith(args)
  if not args.followTarget then return nil end

  local startDistance = entity.configParameter("actionParams.follow.startDistance", 6)
  local targetPosition = world.entityPosition(args.followTarget)
  local targetDistance = world.magnitude(targetPosition, mcontroller.position())
  if targetDistance < startDistance or not entity.entityInSight(args.followTarget) then
    return nil
  end

  return { 
    targetId = args.followTarget,
    stopDistance = entity.configParameter("actionParams.follow.stopDistance", 3),
    startDistance = startDistance,
    runDistance = entity.configParameter("actionParams.follow.runDistance", 20),
    curiosityDelta = entity.configParameter("actionParams.follow.curiosityDelta", -5),
    running = false,
    waiting = false,
    boredTimer = entity.configParameter("actionParams.follow.boredTime", 3)
  }
end

function followAction.update(dt, stateData)
  if not world.entityExists(stateData.targetId) then return true end

  local targetPosition = world.entityPosition(stateData.targetId)
  local targetDistance = world.magnitude(targetPosition, mcontroller.position())

  if targetDistance > stateData.runDistance then
    stateData.running = true
  end

  if targetDistance > stateData.startDistance then
    stateData.waiting = false
  end

  if not stateData.waiting and approachPoint(dt, targetPosition, stateData.stopDistance, stateData.running) then
    setIdleState()
    stateData.waiting = true
    stateData.running = false

    stateData.boredTimer = stateData.boredTimer - dt
    if stateData.boredTimer <= 0 or self.pathing.stuck then
      return true, entity.configParameter("actionParams.follow.cooldown", 15)
    end
  end

  status.modifyResource("curiosity", stateData.curiosityDelta * dt)

  if status.resource("curiosity") <= 0 or self.pathing.stuck then
    return true, entity.configParameter("actionParams.follow.cooldown", 15)
  end
end
