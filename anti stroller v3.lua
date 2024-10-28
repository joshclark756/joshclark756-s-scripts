-- made by joshclark756
local destroyed = {} -- Table to track destroyed strollers

local function destroyStroller(stroller)
    if stroller and stroller.Parent and not destroyed[stroller] then
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
game:GetService("Players").PlayerAdded:Connect(function(player)
    player.Backpack.ChildAdded:Connect(checkItem)
    
    player.CharacterAdded:Connect(function(character)
        for _, item in ipairs(character:GetChildren()) do
            checkItem(item)
        end
        character.ChildAdded:Connect(checkItem)
    end)
end)

-- Monitor workspace changes
workspace.DescendantAdded:Connect(checkItem)

-- Clean reference table periodically
game:GetService("RunService").Heartbeat:Connect(function()
    for stroller in pairs(destroyed) do
        if not stroller.Parent then
            destroyed[stroller] = nil
        end
    end
end)

print("joshclark756's Anti-Stroller Script v3.0 activated!")
