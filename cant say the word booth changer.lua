-- made by joshclark756
--https://www.roblox.com/games/10175705301/Cant-Say-the-Word
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local BoothInput = Instance.new("TextBox")
local TextInput = Instance.new("TextBox")
local ChangeButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.Size = UDim2.new(0, 300, 0, 200)

Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Booth Changer"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

BoothInput.Parent = Frame
BoothInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
BoothInput.Position = UDim2.new(0.1, 0, 0.25, 0)
BoothInput.Size = UDim2.new(0.8, 0, 0, 30)
BoothInput.Font = Enum.Font.SourceSans
BoothInput.PlaceholderText = "Enter Booth Number"
BoothInput.Text = ""
BoothInput.TextColor3 = Color3.fromRGB(255, 255, 255)
BoothInput.TextSize = 14

TextInput.Parent = Frame
TextInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextInput.Position = UDim2.new(0.1, 0, 0.5, 0)
TextInput.Size = UDim2.new(0.8, 0, 0, 30)
TextInput.Font = Enum.Font.SourceSans
TextInput.PlaceholderText = "Enter New Booth Text"
TextInput.Text = ""
TextInput.TextColor3 = Color3.fromRGB(255, 255, 255)
TextInput.TextSize = 14

ChangeButton.Parent = Frame
ChangeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
ChangeButton.Position = UDim2.new(0.25, 0, 0.75, 0)
ChangeButton.Size = UDim2.new(0.5, 0, 0, 30)
ChangeButton.Font = Enum.Font.SourceSansBold
ChangeButton.Text = "Change Booth"
ChangeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangeButton.TextSize = 18

local function changeBooth()
    local boothNumber = BoothInput.Text
    local newText = TextInput.Text
    
    if boothNumber ~= "" and newText ~= "" then
        local boothPath = "workspace.Booth" .. boothNumber .. ".ClaimBooth.ChangeText.UpdateSign"
        local success, error = pcall(function()
            local booth = game:GetService("Workspace"):FindFirstChild("Booth" .. boothNumber)
            if booth then
                local changeText = booth:FindFirstChild("ClaimBooth"):FindFirstChild("ChangeText")
                if changeText then
                    local updateSign = changeText:FindFirstChild("UpdateSign")
                    if updateSign and updateSign:IsA("RemoteEvent") then
                        updateSign:FireServer(newText)
                    else
                        warn("UpdateSign RemoteEvent not found")
                    end
                else
                    warn("ChangeText not found")
                end
            else
                warn("Booth not found")
            end
        end)
        
        if not success then
            warn("Error changing booth: " .. tostring(error))
        end
    else
        warn("Please enter both booth number and new text")
    end
end

ChangeButton.MouseButton1Click:Connect(changeBooth)

-- Draggable Frame
local UserInputService = game:GetService("UserInputService")
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
