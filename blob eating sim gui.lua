local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 200)  
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(0, 255, 0)
Frame.Parent = ScreenGui

-- Make the GUI draggable
local isDragging = false
local dragStart
local startPos

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

Frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Blob eating sim gui"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Frame

local TeleportAllButton = Instance.new("TextButton")
TeleportAllButton.Size = UDim2.new(0.9, 0, 0, 30)
TeleportAllButton.Position = UDim2.new(0.05, 0, 0.2, 0)
TeleportAllButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportAllButton.Text = "Teleport All Blobs"
TeleportAllButton.TextColor3 = Color3.fromRGB(0, 255, 0)
TeleportAllButton.Parent = Frame

local TeleportWithDelayButton = Instance.new("TextButton")
TeleportWithDelayButton.Size = UDim2.new(0.9, 0, 0, 30)
TeleportWithDelayButton.Position = UDim2.new(0.05, 0, 0.35, 0)
TeleportWithDelayButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportWithDelayButton.Text = "Teleport With Delay"
TeleportWithDelayButton.TextColor3 = Color3.fromRGB(0, 255, 0)
TeleportWithDelayButton.Parent = Frame

local TeleportPlayersButton = Instance.new("TextButton")
TeleportPlayersButton.Size = UDim2.new(0.9, 0, 0, 30)
TeleportPlayersButton.Position = UDim2.new(0.05, 0, 0.5, 0)
TeleportPlayersButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportPlayersButton.Text = "Teleport Smaller Players"
TeleportPlayersButton.TextColor3 = Color3.fromRGB(0, 255, 0)
TeleportPlayersButton.Parent = Frame

-- New Automode Button
local AutomodeButton = Instance.new("TextButton")
AutomodeButton.Size = UDim2.new(0.9, 0, 0, 30)
AutomodeButton.Position = UDim2.new(0.05, 0, 0.65, 0)
AutomodeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutomodeButton.Text = "Automode: OFF"
AutomodeButton.TextColor3 = Color3.fromRGB(0, 255, 0)
AutomodeButton.Parent = Frame

-- Credits
local Credits = Instance.new("TextLabel")
Credits.Size = UDim2.new(1, 0, 0, 30)
Credits.Position = UDim2.new(0, 0, 0.85, 0)
Credits.BackgroundTransparency = 1
Credits.Text = "Created by joshclark756"
Credits.TextColor3 = Color3.fromRGB(0, 255, 0)
Credits.TextSize = 14
Credits.Font = Enum.Font.SourceSans
Credits.Parent = Frame

-- Functions
local function teleportBlobs(withDelay)
    local blobs = workspace:FindFirstChild("Blobs")
    if blobs then
        for _, blob in ipairs(blobs:GetChildren()) do
            if blob:IsA("BasePart") then
                blob.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                if withDelay then
                    wait(0.1) -- Increased delay for visibility
                end
            end
        end
    else
        print("Blobs folder not found in workspace")
    end
end

local function teleportPlayers()
    local localPlayerSize = localPlayer:FindFirstChild("leaderstats") and localPlayer.leaderstats:FindFirstChild("Size")
    if localPlayerSize then
        local localSize = localPlayerSize.Value
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer then
                local playerSize = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Size")
                if playerSize and playerSize.Value < localSize then
                    local playerCharacter = player.Character
                    if playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart") then
                        playerCharacter.HumanoidRootPart.CFrame = humanoidRootPart.CFrame
                    end
                end
            end
        end
    else
        print("Local player's Size leaderstat not found")
    end
end

-- Automode function
local automodeEnabled = false
local function automode()
    while automodeEnabled do
        local blobs = workspace:FindFirstChild("Blobs")
        if blobs then
            for _, blob in ipairs(blobs:GetChildren()) do
                if blob:IsA("BasePart") then
                    local distance = (blob.Position - humanoidRootPart.Position).Magnitude
                    if distance <= 50 then  -- Teleport blobs within 50 studs
                        blob.CFrame = humanoidRootPart.CFrame
                    end
                end
            end
        end
        wait(0.1)  -- Wait a short time before the next check
    end
end

-- Button Connections
TeleportAllButton.MouseButton1Click:Connect(function()
    teleportBlobs(false)
end)

TeleportWithDelayButton.MouseButton1Click:Connect(function()
    teleportBlobs(true)
end)

TeleportPlayersButton.MouseButton1Click:Connect(teleportPlayers)

AutomodeButton.MouseButton1Click:Connect(function()
    automodeEnabled = not automodeEnabled
    AutomodeButton.Text = automodeEnabled and "Autocollect: ON" or "Autocollect: OFF"
    if automodeEnabled then
        coroutine.wrap(automode)()
    end
end)

-- Keep original keybind
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
        teleportBlobs(false)
    end
end)
