-- cant say the word lagger (https://www.roblox.com/games/10175705301/Cant-Say-the-Word)
-- press e
-- made by joshclark756
-- removes them on your client but not for others to save your own device
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local toolCount = 0
local radius = 5  -- Adjust this value to change the circle size
local rotationSpeed = 0  -- Adjust this value to change rotation speed (likely doesn't replicate)

-- Configuration
local useRemoteFunction = true  -- Set to true to enable remote function
local remoteFunction = game:GetService("Players").LocalPlayer.PlayerGui.Main.Frame.Amogus.Amogus.LocalScript.RemoteEvent1
local autoEquipTools = true  -- Set to true to automatically equip all tools
local toolsToGetFromRemote = 30  -- Variable for the number of tools to get from remote
local disabletoolcollision = true

local function disableToolCollision(tool)
    for _, part in ipairs(tool:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

local function positionTools()
    local tools = {}
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            table.insert(tools, tool)
        end
    end
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            table.insert(tools, tool)
        end
    end
    
    toolCount = #tools
    
    for i, tool in ipairs(tools) do
        local angle = (i / toolCount) * math.pi * 2
        local offsetX = math.cos(angle) * radius
        local offsetZ = math.sin(angle) * radius
        
        tool.Grip = CFrame.new(offsetX, 0, offsetZ) * CFrame.Angles(0, angle, 0)
        
        if disabletoolcollision then
            disableToolCollision(tool)
        end
    end
end

local function rotateTools()
    local elapsed = 0
    RunService.Heartbeat:Connect(function(dt)
        elapsed = elapsed + dt
        local rotation = elapsed * rotationSpeed
        
        for i, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                local angle = ((i - 1) / toolCount) * math.pi * 2 + rotation
                local offsetX = math.cos(angle) * radius
                local offsetZ = math.sin(angle) * radius
                
                tool.Grip = CFrame.new(offsetX, 0, offsetZ) * CFrame.Angles(0, angle, 0)
            end
        end
    end)
end

local function getToolsFromRemote()
    if useRemoteFunction and remoteFunction then
        for i = 1, toolsToGetFromRemote do
            remoteFunction:FireServer()  -- Adjust arguments if needed
            task.wait(0.1) -- Add a small delay to prevent overwhelming the server
        end
        positionTools()  -- Update tool positions after getting new tools
    else
        warn("Remote function is not enabled or not set.")
    end
end

local function useRemotes()
    if useRemoteFunction and remoteFunction then
        remoteFunction:FireServer()
    else
        warn("Remote function is not enabled or not set.")
    end
end

local function onKeyPress(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then  -- Change 'E' to your desired key
        -- Initial positioning
        positionTools()
        
        -- Start rotation
        rotateTools()
        
        -- Update positions when tools are added or removed
        player.Backpack.ChildAdded:Connect(positionTools)
        player.Backpack.ChildRemoved:Connect(positionTools)
        character.ChildAdded:Connect(positionTools)
        character.ChildRemoved:Connect(positionTools)
        
        -- Get tools from remote if enabled
        if useRemoteFunction then
            getToolsFromRemote()
        end
        
        -- Auto-equip tools only once after the script has completed
        if autoEquipTools then
            wait(1)  -- Wait a short time to ensure all operations are complete
            for _, tool in ipairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    if disabletoolcollision then
                        disableToolCollision(tool)
                    end
                    tool.Parent = character
                    wait(0.1)
                    tool:Destroy()
                end
            end
        end
    end
end

UserInputService.InputBegan:Connect(onKeyPress)
