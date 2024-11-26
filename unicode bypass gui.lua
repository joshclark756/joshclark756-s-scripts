-- made by joshclark756
-- lets you swear using combining characters
-- set language to Қазақ Тілі* for better use
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local InputText = Instance.new("TextBox")
local OutputText = Instance.new("TextBox")
local ConvertButton = Instance.new("TextButton")
local ChatButton = Instance.new("TextButton")
local CombiningCharInput = Instance.new("TextBox")
local FakeSpaceInput = Instance.new("TextBox")

-- GUI Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
MainFrame.Size = UDim2.new(0, 400, 0, 350)

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Unicode Gui"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextSize = 18

CombiningCharInput.Name = "CombiningCharInput"
CombiningCharInput.Parent = MainFrame
CombiningCharInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CombiningCharInput.Position = UDim2.new(0.05, 0, 0.15, 0)
CombiningCharInput.Size = UDim2.new(0.4, 0, 0, 30)
CombiningCharInput.Font = Enum.Font.SourceSans
CombiningCharInput.PlaceholderText = "Combining Character"
CombiningCharInput.Text = ""
CombiningCharInput.TextColor3 = Color3.fromRGB(0, 255, 0)
CombiningCharInput.TextSize = 14

FakeSpaceInput.Name = "FakeSpaceInput"
FakeSpaceInput.Parent = MainFrame
FakeSpaceInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FakeSpaceInput.Position = UDim2.new(0.55, 0, 0.15, 0)
FakeSpaceInput.Size = UDim2.new(0.4, 0, 0, 30)
FakeSpaceInput.Font = Enum.Font.SourceSans
FakeSpaceInput.PlaceholderText = "Fake Space Character"
FakeSpaceInput.Text = ""
FakeSpaceInput.TextColor3 = Color3.fromRGB(0, 255, 0)
FakeSpaceInput.TextSize = 14

InputText.Name = "InputText"
InputText.Parent = MainFrame
InputText.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InputText.Position = UDim2.new(0.05, 0, 0.3, 0)
InputText.Size = UDim2.new(0.9, 0, 0, 60)
InputText.Font = Enum.Font.SourceSans
InputText.PlaceholderText = "Enter text to convert..."
InputText.Text = ""
InputText.TextColor3 = Color3.fromRGB(0, 255, 0)
InputText.TextSize = 14
InputText.TextWrapped = true
InputText.ClearTextOnFocus = true

OutputText.Name = "OutputText"
OutputText.Parent = MainFrame
OutputText.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
OutputText.Position = UDim2.new(0.05, 0, 0.55, 0)
OutputText.Size = UDim2.new(0.9, 0, 0, 60)
OutputText.Font = Enum.Font.SourceSans
OutputText.Text = ""
OutputText.TextColor3 = Color3.fromRGB(0, 255, 0)
OutputText.TextSize = 14
OutputText.TextWrapped = true
OutputText.ClearTextOnFocus = false

ConvertButton.Name = "ConvertButton"
ConvertButton.Parent = MainFrame
ConvertButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
ConvertButton.Position = UDim2.new(0.05, 0, 0.85, 0)
ConvertButton.Size = UDim2.new(0.4, 0, 0, 30)
ConvertButton.Font = Enum.Font.SourceSansBold
ConvertButton.Text = "Convert"
ConvertButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ConvertButton.TextSize = 16

ChatButton.Name = "ChatButton"
ChatButton.Parent = MainFrame
ChatButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
ChatButton.Position = UDim2.new(0.55, 0, 0.85, 0)
ChatButton.Size = UDim2.new(0.4, 0, 0, 30)
ChatButton.Font = Enum.Font.SourceSansBold
ChatButton.Text = "Send to Chat"
ChatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatButton.TextSize = 16

-- Cyrillic Conversion Table
local cyrillicTable = {
 
}

-- Conversion Function
local function ConvertText()
    local inputString = InputText.Text
    local combiningChar = CombiningCharInput.Text
    local fakeSpace = FakeSpaceInput.Text
    
    if fakeSpace == "" then
        fakeSpace = ""
    end
    
    local outputString = ""
    for i = 1, #inputString do
        local char = inputString:sub(i, i)
        if char == " " then
            outputString = outputString .. fakeSpace
        else
            outputString = outputString .. (cyrillicTable[char] or char) .. combiningChar
        end
    end
    
    OutputText.Text = outputString
end

ConvertButton.MouseButton1Click:Connect(ConvertText)

-- Chat Function
local function SendToChat()
     -- Try both chat systems
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Legacy chat system
    local DefaultChatSystemChatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if DefaultChatSystemChatEvents then
        local SayMessageRequest = DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
        if SayMessageRequest then
            SayMessageRequest:FireServer(convertedText, "All")
        end
    end
    
    -- New chat system
    local TextChatService = game:GetService("TextChatService")
    if TextChatService then
        TextChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(convertedText)
    end
    OutputText.Text = ""  -- Clear the output text after sending
end

ChatButton.MouseButton1Click:Connect(SendToChat)

-- Send to chat when Enter is pressed in InputText
InputText.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        ConvertText()
        SendToChat()
        InputText.Text = ""  -- Clear the input text after sending
    end
end)

-- Make the MainFrame draggable
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)	
