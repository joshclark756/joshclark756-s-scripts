-- made by joshclark756#7155
-- Variables
local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")
local Client = game.GetService(game, "Players").LocalPlayer

-- Connect
mouse.Button1Down:Connect(function()
    -- Check for Target & Left Shift
    if mouse.Target and uis:IsKeyDown(Enum.KeyCode.LeftControl) then
for i,v in pairs(game:GetDescendants()) do if v.Parent ~= Client.Character and v.Anchored == false then  do
mouse.Target.Velocity = Vector3.new(60, 60, 60) 
end
end
end
end
end)