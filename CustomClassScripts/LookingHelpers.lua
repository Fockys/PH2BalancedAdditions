function IsLookingAtClass(playerActor, className, distance)
    if not playerActor or not className then
        return nil
    end

    local camera = playerActor.Camera
    if not camera then
        return nil
    end

    local start = camera:GetComponentLocation()
    local rotation = camera:GetComponentRotation()
    local pitch = math.rad(rotation.Pitch)
    local yaw = math.rad(rotation.Yaw)

    local direction = {
        X = math.cos(pitch) * math.cos(yaw),
        Y = math.cos(pitch) * math.sin(yaw),
        Z = math.sin(pitch)
    }

    local finish = {
        X = start.X + direction.X * distance,
        Y = start.Y + direction.Y * distance,
        Z = start.Z + direction.Z * distance
    }

    local hits = LineMultiTrace(start, finish, {playerActor})
    for _, hit in ipairs(hits or {}) do
        if hit.Actor and GetActorClassName(hit.Actor) == className then
            return hit.Actor
        end
    end

    return nil
end
