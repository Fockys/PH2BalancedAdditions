LogMessage("Loaded repairman.lua")


ListenToEvent("RoundStarted", function()
    local players = GetPlayerChars()
    for i, player in ipairs(players) do
        if player.CustomClassString == "Renovator" then
            LogMessage("Working for " .. GetActorName(player))
        end
    end
end)



ListenToEvent("AbilityKeyPressed_OnClient", function(playerActor)
    if playerActor.CustomClassString == "Repairman" then
        LogMessage("Ability pressed for Repairman")
        playerActor:StartAbilityCooldown(5.0)
    end
end)