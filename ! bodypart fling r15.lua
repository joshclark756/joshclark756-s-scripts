local bodypart = game.Players.localPlayer.Character.RightUpperArm
local char = game.Players.localPlayer.Character
local player = game.Players.LocalPlayer
local num = 0
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local bp = Instance.new("BodyPosition")
local newhum = Instance.new("Humanoid")
local newhum2 = Instance.new("Humanoid")
local char = game.Players.LocalPlayer.Character
local hum = char.Humanoid
hum.Parent = char.Health
char.Health:Destroy()
newhum.Parent = char
char.HumanoidRootPart:Destroy()
char.Head.Parent = newhum
newhum:Destroy()
for i,v in pairs(char:GetDescendants()) do if v and v:isA("Part") or v:isA("MeshPart") then v.CanCollide = true v.Massless = true 
end
end
wait(2)
char:BreakJoints()
for _, v in next, game:GetDescendants() do
       if  v:isA("Part") or v:isA("MeshPart") and v.Anchored == false  then 
 game.RunService.Heartbeat:Connect(function()
               v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
               v.Velocity = Vector3.new(25.70,0,0)
               v.RotVelocity = Vector3.new(9e9,9e9,9e9)
               v.CanCollide = false

 end)
end
end
bp.Parent = bodypart
bp.Position = bodypart.Position
for i,v in next , game.workspace:GetDescendants() do if v:isA("Part")  and v.Parent ~= char and v.Name == "HumanoidRootPart" then 
    do wait(3)
      local target = v

bind = "t" -- has to be lowercase
mouse.KeyDown:connect(function(key)
if key == bind then do 
task.spawn(function()
   while true do
bp.Position = target.Position +  Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
bodypart.Position = target.Position +  Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
task.wait(.175)
end
end)
end

game:GetService("RunService").Heartbeat:wait()
end
end)
end
end
end