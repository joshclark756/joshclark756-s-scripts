-- made by joshclark756
-- to replicate reequip tool when your done
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ToolGripPosSetter"
ScreenGui.Parent = Player.PlayerGui

-- Create Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Make the Frame draggable
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

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Create Arrows (rest of the code remains the same)
local arrowDirections = {"Up", "Down", "Left", "Right", "Forward", "Backward"}
local arrowPositions = {
    Up = UDim2.new(0.5, -25, 0, 10),
    Down = UDim2.new(0.5, -25, 1, -60),
    Left = UDim2.new(0, 10, 0.5, -25),
    Right = UDim2.new(1, -60, 0.5, -25),
    Forward = UDim2.new(0, 10, 0, 10),
    Backward = UDim2.new(1, -60, 1, -60)
}

for _, direction in pairs(arrowDirections) do
    local arrow = Instance.new("TextButton")
    arrow.Size = UDim2.new(0, 50, 0, 50)
    arrow.Position = arrowPositions[direction]
    arrow.Text = direction
    arrow.TextColor3 = Color3.new(1, 1, 1)
    arrow.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    arrow.Parent = Frame
    
    arrow.MouseButton1Click:Connect(function()
        local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Handle") then
            local currentGripPos = tool.GripPos
            local change = Vector3.new(0, 0, 0)
            
            if direction == "Up" then
                change = Vector3.new(0, 0.5, 0)
            elseif direction == "Down" then
                change = Vector3.new(0, -0.5, 0)
            elseif direction == "Left" then
                change = Vector3.new(-0.5, 0, 0)
            elseif direction == "Right" then
                change = Vector3.new(0.5, 0, 0)
            elseif direction == "Forward" then
                change = Vector3.new(0, 0, 0.5)
            elseif direction == "Backward" then
                change = Vector3.new(0, 0, -0.5)
            end
            
            tool.GripPos = currentGripPos + change
        end
    end)
end

-- Create Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.Parent = Frame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)	
