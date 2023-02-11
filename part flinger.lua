local char = game.Players.localPlayer.Character
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local bp = Instance.new("BodyPosition")
mouse.Button1Down:Connect(function()
    -- Check for Target & Left Shift
    if mouse.Target and uis:IsKeyDown(Enum.KeyCode.LeftControl) then
function KeepOwnership()
 
  
   for _, v in next, game:GetDescendants() do
       if  v and v == mouse.Target  and v.Anchored == false then 
 game.RunService.Heartbeat:Connect(function()
               v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
               v.Velocity = Vector3.new(25.70,0,0)
               v.RotVelocity = Vector3.new(9e9,9e9,9e9)
               v.CanCollide = false
           end)
       end
   end
end
KeepOwnership()
bp.Parent = mouse.Target
bp.Position = bp.Parent.Position
bind = "t" -- has to be lowercase
mouse.KeyDown:connect(function(key)
if key == bind then do 
bp.Position = mouse.Target.Position + Vector3.new(0,math.sin(10/10))
end
end
end)
end
end)
