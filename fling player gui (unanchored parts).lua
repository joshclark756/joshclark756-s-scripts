-- Fling Player GUI using Unanchored Parts
-- made by joshclark756
-- must own parts for it to work

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderColor3 = Color3.new(0, 1, 0)
Frame.Parent = ScreenGui

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TextBox.BorderColor3 = Color3.new(0, 1, 0)
TextBox.TextColor3 = Color3.new(0, 1, 0)
TextBox.PlaceholderText = "Enter player name..."
TextBox.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, -20, 0, 30)
Button.Position = UDim2.new(0, 10, 0, 60)
Button.BackgroundColor3 = Color3.new(0, 0.5, 0)
Button.BorderColor3 = Color3.new(0, 1, 0)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Text = "Fling Player"
Button.Parent = Frame

-- Function to find player by name or display name
local function findPlayer(name)
    name = name:lower()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower():find(name) or (player.DisplayName and player.DisplayName:lower():find(name)) then
            return player
        end
    end
    return nil
end

-- Function to get unanchored parts (modified)
local function getUnanchoredParts()
    local parts = {}
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Anchored then
            local isPlayerPart = false
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character and v:IsDescendantOf(player.Character) then
                    isPlayerPart = true
                    break
                end
            end
            if not isPlayerPart and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                table.insert(parts, v)
            end
        end
    end
    return parts
end

-- Store original positions of parts
local originalPositions = {}

-- Fling function
local function flingPlayer(targetPlayer)
    local character = targetPlayer.Character
    if not character then return end
    
    local unanchoredParts = getUnanchoredParts()
    local primaryPart = character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
    
    if not primaryPart then return end
    
    for _, part in ipairs(unanchoredParts) do
        if not originalPositions[part] then
            originalPositions[part] = part.Position
        end
        part.Velocity = Vector3.new(5700, 3478.756)
        part.RotVelocity = Vector3.new(5700, 3478.756)
        part.Position = primaryPart.Position
    end
end

-- Variables for continuous flinging
local isFlingActive = false
local flingLoop

-- Button click event
Button.MouseButton1Click:Connect(function()
    local targetPlayer = findPlayer(TextBox.Text)
    if targetPlayer then
        if not isFlingActive then
            isFlingActive = true
            Button.Text = "Stop Flinging"
            Button.BackgroundColor3 = Color3.new(0.5, 0, 0) -- Red when active
            
            flingLoop = game:GetService("RunService").Heartbeat:Connect(function()
                flingPlayer(targetPlayer)
            end)
        else
            isFlingActive = false
            Button.Text = "Fling Player"
            Button.BackgroundColor3 = Color3.new(0, 0.5, 0) -- Green when inactive
            
            if flingLoop then
                flingLoop:Disconnect()
            end
            
            -- Reset part velocities and positions
            for part, originalPosition in pairs(originalPositions) do
                if part and part.Parent then
                    part.Velocity = Vector3.new(0, 0, 0)
                    part.RotVelocity = Vector3.new(0, 0, 0)
                    part.Position = originalPosition
                end
            end
            
            -- Clear the original positions table
            originalPositions = {}
        end
    else
        print("Player not found")
    end
end)

-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

print("Fling Player GUI loaded.")
