LogMessage("Logging.lua loaded")


ListenToEvent("RoundStarted",function()
    LogMessage("RoundStarted")
end)

ListenToEvent("PreReceiveDamage", function(targetActor, sourceActor, damage, damageType, canBeLethal)
    if( GetActorClassName(targetActor) == "SafeDoor") then
        LogMessage(canBeLethal)
    end
end)