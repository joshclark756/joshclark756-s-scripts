-- https://www.roblox.com/games/10175705301/Cant-Say-the-Word
local Players = game:GetService("Players")

-- Function to update booth text
local function updateBoothText(boothNumber, text)
    local booth = workspace["Booth" .. boothNumber]
    if booth and booth:FindFirstChild("ClaimBooth") and booth.ClaimBooth:FindFirstChild("ChangeText") then
        booth.ClaimBooth.ChangeText.UpdateSign:FireServer(text)
    end
end

-- Function to update booths with owner's chat
local function updateBoothsWithOwnerChat()
    for i = 1, 6 do -- Assuming there are 6 booths
        local booth = workspace["Booth" .. i]
        if booth and booth:FindFirstChild("Owner") then
            local ownerName = booth.Owner.Value
            local owner = Players:FindFirstChild(ownerName)
            if owner then
                -- Use the player.Chatted event to get the latest chat
                owner.Chatted:Connect(function(message)
                    updateBoothText(i, message)
                end)
            end
        end
    end
end

-- Set up the initial connection for all current booths
updateBoothsWithOwnerChat()

-- Set up a loop to check for new booths or ownership changes
while true do
    updateBoothsWithOwnerChat()
    wait(5) -- Check every 5 seconds for any changes
end

print("Booth update script is now running. Booths will display their owner's latest chat message in real-time.")
