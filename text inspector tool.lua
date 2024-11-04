--click on a object with a textlabel
-- made by joshclark756
local tool = Instance.new("Tool")
tool.Name = "Text Inspector"
tool.RequiresHandle = false

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 2)
handle.BrickColor = BrickColor.new("Bright blue")
handle.CanCollide = false
handle.Transparency = 1
handle.Parent = tool

-- Create UI elements
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.8, 0, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(0, 255, 0)
frame.Visible = false
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Text = "Text Inspector Results"
title.TextSize = 18
title.Parent = frame

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -40)
scrollFrame.Position = UDim2.new(0, 5, 0, 35)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = frame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -25, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Parent = frame

-- Function to find and display TextLabels
local function inspectTextLabels(part)
    frame.Visible = true
    
    -- Clear previous results
    for _, child in pairs(scrollFrame:GetChildren()) do
        child:Destroy()
    end
    
    local yOffset = 5
    
    local function addTextInfo(label, depth)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -10, 0, 40)
        container.Position = UDim2.new(0, 5, 0, yOffset)
        container.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        container.Parent = scrollFrame
        
        local info = Instance.new("TextBox") -- Changed to TextBox for selectability
        info.Size = UDim2.new(1, 0, 1, 0)
        info.BackgroundTransparency = 1
        info.TextColor3 = Color3.fromRGB(0, 255, 0)
        info.TextXAlignment = Enum.TextXAlignment.Left
        info.TextWrapped = true
        info.ClearTextOnFocus = false
        info.TextEditable = false -- Make it read-only but still selectable
        info.Text = string.rep("    ", depth) .. ""  .. "" .. label.Text
        info.Parent = container
        
        yOffset = yOffset + 45
    end
    
    local function scanDescendants(parent, depth)
        for _, child in pairs(parent:GetDescendants()) do
            if child:IsA("TextLabel") then
                addTextInfo(child, depth)
            end
        end
    end
    
    scanDescendants(part, 0)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

-- Tool functionality
tool.Activated:Connect(function()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    
    if mouse.Target then
        inspectTextLabels(mouse.Target)
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Give tool to player when executed
tool.Parent = game.Players.LocalPlayer.Backpack
gui.Parent = game.Players.LocalPlayer.PlayerGui	
