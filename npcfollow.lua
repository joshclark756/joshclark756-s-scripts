--- makes npcs follow you

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local followingEnabled = false

local function makeNPCsFollow()
    local npcs = workspace:GetDescendants()
    for _, npc in ipairs(npcs) do
        if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
            local npcHumanoid = npc.Humanoid
            local npcHRP = npc.HumanoidRootPart
            
            spawn(function()
                while followingEnabled do
                    local distance = (humanoidRootPart.Position - npcHRP.Position).Magnitude
                    if distance > 5 then
                        npcHumanoid:MoveTo(humanoidRootPart.Position)
                    end
                    wait(0.5)
                end
            end)
        end
    end
end

local function onChatted(message)
    message = message:lower()
    if message == "!follow" or message == "follow me" then
        if not followingEnabled then
            followingEnabled = true
            makeNPCsFollow()
            print("NPC following script activated. NPCs should now follow the player.")
        else
            print("NPCs are already following you.")
        end
    elseif message == "!unfollow" or message == "stop following" then
        if followingEnabled then
            followingEnabled = false
            print("NPC following script deactivated. NPCs should stop following the player.")
        else
            print("NPCs are not currently following you.")
        end
    end
end

player.Chatted:Connect(onChatted)

print("NPC following script loaded. Use '!follow' or 'follow me' to activate, and '!unfollow' or 'stop following' to deactivate.")
