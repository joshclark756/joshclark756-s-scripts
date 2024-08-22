local Tool = Instance.new("Tool")
Tool.Name = "PartGrabber"
Tool.RequiresHandle = true  -- Changed to true

-- Create a handle for the tool
local handle = Instance.new("Part")
handle.Name = "Handle"
handle.BrickColor = BrickColor.new("Really black")
handle.Material = Enum.Material.Metal
handle.CanCollide = false
handle.Parent = Tool
handle.Transparency = 1


local heldPart = nil

local function onActivated()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    
    if mouse.Target and mouse.Target:IsA("BasePart") and not mouse.Target.Anchored then
        if heldPart then
            -- Drop currently held part
            heldPart.CanCollide = true
            heldPart.CFrame = CFrame.new(mouse.Hit.p)
            heldPart = nil
        else
            -- Pick up new part
            heldPart = mouse.Target
            heldPart.CanCollide = false
        end
    end
end

local function onEquipped()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")
    
    game:GetService("RunService").Heartbeat:Connect(function()
        if heldPart then
            heldPart.CFrame = rightHand.CFrame * CFrame.new(0, 0, 0)  -- Adjusted offset
        end
    end)
end

local function onUnequipped()
    if heldPart then
        heldPart.CanCollide = true
        heldPart = nil
    end
end

Tool.Activated:Connect(onActivated)
Tool.Equipped:Connect(onEquipped)
Tool.Unequipped:Connect(onUnequipped)

-- Give the tool to the player
local player = game.Players.LocalPlayer
if player.Character then
    Tool.Parent = player.Backpack
else
    player.CharacterAdded:Connect(function(character)
        Tool.Parent = player.Backpack
    end)
end