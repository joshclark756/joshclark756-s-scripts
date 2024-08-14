--made by joshclark756 --simple to use
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local toolCount = 0
local radius = 5  -- Adjust this value to change the circle size
local rotationSpeed = 0  -- Adjust this value to change rotation speed (likely dosent replicate)

-- Configuration
local useRemoteFunction = false  -- Set to true to enable remote function
local remoteFunction = nil -- Replace with the actual remote function when enabled
local autoEquipTools = true  -- Set to true to automatically equip all tools
local toolsToGetFromRemote = 0  -- variable for the number of tools to get from remote
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

-- Function to get tools using remote function
local function getToolsFromRemote()
    if useRemoteFunction and remoteFunction then
        for i = 1, toolsToGetFromRemote do
            remoteFunction:FireServer()  -- Adjust arguments if needed
            wait(0.1)  -- Add a small delay to prevent overwhelming the server
        end
        positionTools()  -- Update tool positions after getting new tools
    else
        warn("Remote function is not enabled or not set.")
    end
end

-- New function to use remotes if enabled
local function useRemotes()
    if useRemoteFunction and remoteFunction then
        remoteFunction:FireServer()
    else
        warn("Remote function is not enabled or not set.")
    end
end

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
        end
    end
end