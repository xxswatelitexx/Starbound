starvingAction = {}

function starvingAction.enterWith(args)
  if not args.starvingAction then return nil end

  return {
    timer = 2,
    didEmote = false
  }
end

function starvingAction.update(dt, stateData)
  entity.setAnimationState("movement", "idle")

  stateData.timer = stateData.timer - dt

  if stateData.timer < 1 and not stateData.didEmote then
    emote("sad")
    stateData.didEmote = true
  elseif stateData.timer < 0 then
    return true, entity.configParameter("actionParams.starving.cooldown", 3)
  else
    return false
  end
end
