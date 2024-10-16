local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function enableCollision(character)
    if character and character:IsA("Model") then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local function onCharacterAdded(character)
    enableCollision(character)
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        if player.Character then
            enableCollision(player.Character)
        end
        player.CharacterAdded:Connect(onCharacterAdded)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(onCharacterAdded)
    end
end)

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            enableCollision(player.Character)
        end
    end
end)
print("Client-side player collision by joshclark756 is now running!")
