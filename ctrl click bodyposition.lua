local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")

-- Connect
mouse.Button1Down:Connect(function()
    -- Check for Target & Left Shift

    if mouse.Target and uis:IsKeyDown(Enum.KeyCode.LeftControl) then
local bp = Instance.new("BodyPosition")
bp.Parent = player.Character.HumanoidRootPart
bp.Position = mouse.Target.Position
bind = "t" -- has to be lowercase
mouse.KeyDown:connect(function(key)
if key == bind then do 
bp.Position = mouse.Target.Position
end
end
end)
end
end)