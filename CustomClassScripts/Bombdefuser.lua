local abilityCoolDownTime = 30.0
local explsoiveDamTakenMultiplyer = 0.5



ListenToEvent("AbilityKeyPressed_OnClient", function(playerActor)
    if playerActor.CustomClassString == "Bombdefuser" then
        local bombBag = IsLookingAtClass(playerActor, "BombBag", 500)
        if bombBag then
            playerActor:StartAbilityCooldown(abilityCoolDownTime)
            playerActor:AbilitySV()

        end
    end
end)



-- Ability server side
ListenToEvent("AbilitySV", function(playerActor)

    local bombBag = IsLookingAtClass(playerActor, "BombBag", 500)
    if bombBag then
        GetGameState():LuaDestroyActor(bombBag)
    end

end)

ListenToEvent("AbilityALL_OnClient", function(playerActor)
    if(playerActor.CustomClassString == "Bombdefuser") then
        LogMessage("AbilityAllfired")
        ShowUIText("bombInfo", "Bomb destroyed!",0.4,0.2,2,38)
    end
end)

--prevent explosive damage
ListenToEvent("PreReceiveDamage", function(targetActor, sourceActor, damage, damageType, canBeLethal)
    if((targetActor.CustomClassString == "Bombdefuser") and (damageType == 1)) then
        LogMessage("test")
        targetActor.HP = targetActor.HP + (explsoiveDamTakenMultiplyer * damage)
    end


end)