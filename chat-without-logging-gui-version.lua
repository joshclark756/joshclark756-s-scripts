--this is a simple gui that fires the saymeesagerequestremote without sending it to roblox logs so you wont get banned with it
-- made for executors that cant run antichatlogger scripts
-- works for textchatservice (newchat) but may still be logged
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MoveableChatGui"
screenGui.Parent = CoreGui

-- Create the main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(0, 255, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Create the text input
local textBox = Instance.new("TextBox")
textBox.Name = "ChatInput"
textBox.Size = UDim2.new(1, -20, 0, 30)
textBox.Position = UDim2.new(0, 10, 0, 10)
textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
textBox.BorderSizePixel = 0
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.PlaceholderText = "Type your message here..."
textBox.ClearTextOnFocus = false
textBox.Parent = mainFrame

-- Create the send button
local sendButton = Instance.new("TextButton")
sendButton.Name = "SendButton"
sendButton.Size = UDim2.new(1, -20, 0, 30)
sendButton.Position = UDim2.new(0, 10, 1, -40)
sendButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
sendButton.BorderSizePixel = 0
sendButton.Font = Enum.Font.SourceSansBold
sendButton.TextSize = 18
sendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sendButton.Text = "Send"
sendButton.Parent = mainFrame

-- Function to send chat message using both systems
local function sendChatMessage()
    local message = textBox.Text
    if message ~= "" then
        
        
        
        -- Try DefaultChatSystemChatEvents (New System)
        pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        end)
        
        -- Try TextChatService (Newer System)
        pcall(function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
        end)
        
        textBox.Text = ""
    end
end

-- Connect the send button
sendButton.MouseButton1Click:Connect(sendChatMessage)

-- Connect the return key press
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendChatMessage()
    end
end)

-- Function to toggle GUI visibility
local function toggleGuiVisibility()
    screenGui.Enabled = not screenGui.Enabled
end

-- Connect the toggle key (Right Control)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        toggleGuiVisibility()
    end
end)

print("Enhanced Moveable GUI Chat Script loaded. Press Right Control to toggle visibility.")
print("This version supports multiple chat systems for broader compatibility.")
