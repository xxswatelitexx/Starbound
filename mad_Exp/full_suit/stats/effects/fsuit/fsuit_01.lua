function init()
  if status.stat("thead") == 1 and status.stat("tchest") == 1 and status.stat("tleg") == 1 then
    -- So this is pretty straight forward we are checking for added stat values which are set by each part. If all parts are set then the character turns blue.
    --There is one important thing to note though, because this happens in init and not update. The order you put on clothes is important.
    --If you put helmet first then pants and chest you won't turn blue, because it is not constantly checking. If you put on helmet last you will turn blue. 
  effect.setParentDirectives("fade="..config.getParameter("color").."=0.5")
  script.setUpdateDelta(0)
  else
    sb.logInfo("Not all parts detected")
  end
end

function update(dt)
  head = status.stat("thead")
  chest = status.stat("tchest")
  legs = status.stat("tleg")
  sb.logInfo(head .. " Head")
  sb.logInfo(chest .. " Chest")
  sb.logInfo(legs .. " Legs")
end

function uninit()
end
