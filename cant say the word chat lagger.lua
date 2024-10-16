-- made by joshclark756
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
local running = false

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Button.Name = "ToggleButton"
Button.Parent = ScreenGui
Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Button.Position = UDim2.new(0.1, 0, 0.1, 0)
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Font = Enum.Font.SourceSans
Button.Text = "Start Script"
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 20.000

local function generateRandomString()
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|;:,.<>?"
    local length = math.random(7, 100)
    local randomString = ""
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        randomString = randomString .. string.sub(chars, randomIndex, randomIndex)
    end
    return randomString
end

local function fireRemotes()
    local booths = {"Booth1", "Booth2", "Booth3", "Booth4", "Booth5", "Booth6"}
    
    for _, booth in ipairs(booths) do
        local remotePath = workspace[booth].ClaimBooth.ChangeText.UpdateSign
        local randomText = generateRandomString()
        
        -- Attempt to fire the remote
        local success, error = pcall(function()
            remotePath:FireServer(randomText)
        end)
        
        if success then
            print("Successfully updated " .. booth .. " with: " .. randomText)
        else
            warn("Failed to update " .. booth .. ": " .. tostring(error))
        end
        
        -- Add a small delay to avoid detection
       
    end
end

local function toggleScript()
    running = not running
    if running then
        Button.Text = "Stop Script"
        Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        while running do
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            fireRemotes()
            task.wait(0)
             -- Wait  before running again
        end
    else
        Button.Text = "Start Script"
        Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
end

Button.MouseButton1Click:Connect(toggleScript)
