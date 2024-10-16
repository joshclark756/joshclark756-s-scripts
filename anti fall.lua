-- Anti-Fall / Anti-Void Script using FallenPartsDestroyHeight
-- Teleports player back to spawn when falling below the map's destruction height
-- made by joshclark756
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function getSpawnLocation()
    local spawnLocation = Workspace:FindFirstChild("SpawnLocation")
    if spawnLocation and spawnLocation:IsA("BasePart") then
        return spawnLocation.CFrame + Vector3.new(0, 3, 0)
    else
        return CFrame.new(0, 5, 0)
    end
end

local function teleportToSpawn()
    character:SetPrimaryPartCFrame(getSpawnLocation())
end

local function checkFalling()
    while true do
        wait(0.1)
        if character and character:FindFirstChild("HumanoidRootPart") then
            local position = character.HumanoidRootPart.Position
            if position.Y <= -300 then
                teleportToSpawn()
            end
        end
    end
end

local function onCharacterAdded(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    spawn(checkFalling)
end

player.CharacterAdded:Connect(onCharacterAdded)
spawn(checkFalling)
