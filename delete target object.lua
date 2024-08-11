-- Script to delete object in front of cursor when 'X' is pressed and recover with 'Z'
-- Use responsibly and at your own risk

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

local deletedObjects = {}

local function getRaycastResult()
    local rayOrigin = camera.CFrame.Position
    local rayDirection = mouse.UnitRay.Direction
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {player.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = workspace:Raycast(rayOrigin, rayDirection * 1000, raycastParams)
    return raycastResult
end

local function deleteObject()
    local raycastResult = getRaycastResult()
    if raycastResult and raycastResult.Instance then
        local object = raycastResult.Instance
        local objectData = {
            Instance = object,
            Parent = object.Parent,
            Properties = {}
        }
        
        -- Store important properties
        for _, prop in ipairs({"Position", "Rotation", "Size", "Anchored", "CanCollide"}) do
            if object[prop] ~= nil then
                objectData.Properties[prop] = object[prop]
            end
        end
        
        table.insert(deletedObjects, objectData)
        object.Parent = nil
    end
end

local function recoverObject()
    if #deletedObjects > 0 then
        local objectData = table.remove(deletedObjects)
        local object = objectData.Instance
        
        -- Restore properties
        for prop, value in pairs(objectData.Properties) do
            object[prop] = value
        end
        
        object.Parent = objectData.Parent
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.X then
            deleteObject()
        elseif input.KeyCode == Enum.KeyCode.Z then
            recoverObject()
        end
    end
end)

print("Script loaded. Press 'X' to delete object, 'Z' to recover.")