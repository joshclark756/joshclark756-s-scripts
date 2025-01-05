local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local LocalPlayer = Players.LocalPlayer

-- Global variable to ensure the script doesn't run multiple times
if _G.scriptIsRunning then return end
_G.scriptIsRunning = true

-- Set the number of random strings to generate on key press
-- Remove the -- to set it to a custom amount
-- local numberOfStrings = 4

-- Ensure numberOfStrings is valid
local numberOfStrings = 8
if type(numberOfStrings) ~= 'number' or numberOfStrings <= 0 then
    numberOfStrings = 8
end

local function generateRandomString()
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local length = math.random(80, 90)
    local randomString = ""
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        randomString = randomString .. string.sub(chars, randomIndex, randomIndex)
    end
    return randomString
end

local function modifyString(randomText)
    local modified = ""
    for char in randomText:gmatch(".") do
        if char ~= " " then
            modified = modified .. char .. ""
        end
    end
    return modified
end

-- Function to broadcast the message
local function broadcastMessage(modified)
    game.Players:Chat("/e " .. modified)
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.R then
        for i = 1, numberOfStrings do
            local randomText = generateRandomString()
            local modified = modifyString(randomText)
            broadcastMessage(modified)
        end
    end
end)

-- Allow other scripts to call the broadcastMessage function
_G.broadcastMessage = broadcastMessage
