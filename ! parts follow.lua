local char = game.Players.localPlayer.Character
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local bp = Instance.new("BodyPosition")


  for _, v in next, game:GetDescendants() do
       if  v:isA("Part")  and v.Anchored == false and v.Parent ~= char and v.Parent.ClassName ~= "Accessory" then 
 game.RunService.Heartbeat:Connect(function()
               v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
               v.Velocity = Vector3.new(25.70,0,0)
               v.RotVelocity = Vector3.new(9e9,9e9,9e9)
               v.CanCollide = false

 end)
end
end
for _, v in next, game.workspace:GetDescendants() do
if  v:isA("Part")  and v.Anchored == false and v.Parent ~= char and v.Parent.ClassName ~= "Accessory" then 
    local bp = Instance.new("BodyPosition")
bp.Parent = v
bp.Position = char.HumanoidRootPart.Position + Vector3.new(0,5,0)
bind = "t" -- has to be lowercase
mouse.KeyDown:connect(function(key)
if key == bind then do 
    while wait(0) do
        
bp.Position = char.HumanoidRootPart.Position + Vector3.new(0,5,0)
end
end
end
end)
end
end