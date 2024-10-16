-- made by joshclark756
local TextLogger = {}

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "TextLoggerGui"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0.8, 0, 0.5, -150)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderColor3 = Color3.new(0, 1, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Create title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Text Logger"
title.TextColor3 = Color3.new(0, 1, 0)
title.BackgroundTransparency = 1
title.Parent = frame

-- Create search box
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0.8, 0, 0, 25)
searchBox.Position = UDim2.new(0.1, 0, 0, 35)
searchBox.PlaceholderText = "Search..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.new(0, 1, 0)
searchBox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
searchBox.Parent = frame

-- Create log button
local logButton = Instance.new("TextButton")
logButton.Size = UDim2.new(0.8, 0, 0, 25)
logButton.Position = UDim2.new(0.1, 0, 0, 65)
logButton.Text = "Log Text"
logButton.TextColor3 = Color3.new(0, 0, 0)
logButton.BackgroundColor3 = Color3.new(0, 1, 0)
logButton.Parent = frame

-- Create scroll frame for logs
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
scrollFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 5
scrollFrame.Parent = frame

-- Function to log text
function TextLogger:LogText()
    scrollFrame:ClearAllChildren()
    local yPos = 0
    
    local function addTextLabel(str)
        local label = Instance.new("TextButton")
        label.Size = UDim2.new(1, -10, 0, 20)
        label.Position = UDim2.new(0, 5, 0, yPos)
        label.Text = str
        label.TextColor3 = Color3.new(0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = scrollFrame
        yPos = yPos + 25
        
        -- Add click event to copy text
        label.MouseButton1Click:Connect(function()
            setclipboard(str)
        end)
    end
    
    -- Log all TextLabels in the game
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("TextLabel") and v.Text ~= "" then
            addTextLabel(v.Text)
        end
    end
    
    -- Adjust scrolling frame content size
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

-- Function to filter logged text
local function filterText()
    local searchTerm = searchBox.Text:lower()
    for _, v in pairs(scrollFrame:GetChildren()) do
        if v:IsA("TextButton") then
            v.Visible = v.Text:lower():find(searchTerm, 1, true) ~= nil
        end
    end
end

-- Connect log button
logButton.MouseButton1Click:Connect(function()
    TextLogger:LogText()
end)

-- Connect search box
searchBox.Changed:Connect(function(prop)
    if prop == "Text" then
        filterText()
    end
end)

-- Return the logger object
return TextLogger
