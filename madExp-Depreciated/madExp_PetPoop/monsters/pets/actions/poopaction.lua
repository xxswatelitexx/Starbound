poopAction = {
  cooldown = 10
}

function poopAction.enterWith(args)
  if not args.poopAction and not args.poopTarget then return nil end

  if args.poopAction and status.resourcePercentage("poopy") < 1 then
    return nil
  end

  if args.poopTarget and status.resource("poopy") < entity.configParameter("actions.poop.minPoopy", 65) then
    return nil
  end

  return {
    targetId = args.poopTarget,
    poopRate = -20,
    pooping = false
  }
end

function poopAction.enteringState(stateData)
  if stateData.targetId then
    emote("sad")
  else
    emote("sad")
  end
end

function poopAction.update(dt, stateData)
  if not stateData.pooping then
    if not stateData.targetId then
      stateData.pooping = true
      emote("sad")
    else
      if not world.entityExists(stateData.targetId) then return true end
      --Approach the target
      local targetPosition = world.entityPosition(stateData.targetId)
      if not approachPoint(dt, targetPosition, 1.5, false) then
        if self.pathing.stuck then
          return true, entity.configParameter("actionParams.poop.cooldown")
        end
        return false
      end

      local bounds = boundingBox()
      mcontroller.setPosition({targetPosition[1], targetPosition[2] - bounds[2]})
      stateData.pooping = true
    end
  else
    status.modifyResource("poopy", stateData.poopRate * dt)
    if stateData.targetId then
      if not world.entityExists(stateData.targetId) then
        return true, entity.configParameter("actionParams.poop.cooldown", 1)
      end
      entity.setAnimationState("movement", "invisible")
    else
      entity.setAnimationState("movement", "sleep")
    end

    if status.resourcePercentage("poopy") <= 0 then 
      return true, entity.configParameter("actionParams.poop.cooldown", 1)
    else
      return false
    end
  end
end

function poopAction.leavingState(stateData)
  local pos = mcontroller.position()
	local fd = mcontroller.facingDirection()
	local poopSpot = {pos[1]-4, pos[2]}
	world.placeObject("poop", poopSpot)
	emote("happy")
	setIdleState()
end