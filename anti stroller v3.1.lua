-- made by joshclark756
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local destroyed = {} -- Table to track destroyed strollers

local function destroyStroller(stroller)
    if stroller and stroller.Parent and not destroyed[stroller] then
        -- Check if stroller belongs to local player
        local itemParent = stroller.Parent
        while itemParent do
            if itemParent == LocalPlayer.Character or itemParent == LocalPlayer.Backpack then
                return -- Don't destroy if it belongs to local player
            end
            itemParent = itemParent.Parent
        end
        
        pcall(function()
            destroyed[stroller] = true
            stroller:Destroy()
            print("Destroyed stroller:", stroller.Name)
        end)
    end
end

local function checkItem(item)
    if item:IsA("Tool") and item.Name:lower():find("stroller") then
        destroyStroller(item)
    end
end

-- Monitor backpack changes
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then -- Only monitor other players
        player.Backpack.ChildAdded:Connect(checkItem)
        
        player.CharacterAdded:Connect(function(character)
            for _, item in ipairs(character:GetChildren()) do
                checkItem(item)
            end
            character.ChildAdded:Connect(checkItem)
        end)
    end
end)

-- Monitor workspace changes
workspace.DescendantAdded:Connect(function(item)
    -- Additional check to prevent destroying local player's stroller
    if item:IsA("Tool") and item.Name:lower():find("stroller") then
        local itemParent = item.Parent
        while itemParent do
            if itemParent == LocalPlayer.Character or itemParent == LocalPlayer.Backpack then
                return -- Don't destroy if it belongs to local player
            end
            itemParent = itemParent.Parent
        end
        checkItem(item)
    end
end)

-- Clean reference table periodically
game:GetService("RunService").Heartbeat:Connect(function()
    for stroller in pairs(destroyed) do
        if not stroller.Parent then
            destroyed[stroller] = nil
        end
    end
end)

print("joshclark756's Anti-Stroller Script v3.1 activated!")
