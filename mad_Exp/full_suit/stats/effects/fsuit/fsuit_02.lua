function init()
  script.setUpdateDelta(1)
end

function update(dt)
  if status.stat("thead") == 1 and status.stat("tchest") == 1 and status.stat("tleg") == 1 then
    status.addEphemeralEffect("colorblue", effect.duration(), entity.id())
    sb.logInfo("Parts detected")
  else
    status.removeEphemeralEffect("colorblue")
    sb.logInfo("Not all paramters detected")
  end
end

function uninit()
end
