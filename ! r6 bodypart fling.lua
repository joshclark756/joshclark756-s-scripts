local bodypart = "right arm"
local char = game.Players.localPlayer.Character
local player = game.Players.LocalPlayer
local num = 0
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local bp = Instance.new("BodyPosition")
char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) 
task.wait(0)
char.Head.Anchored = true
local rootpart = char.HumanoidRootPart 
char.Parent = workspace
rootpart:Destroy()
char[bodypart].Name = "HumanoidRootPart"
char.HumanoidRootPart.CanCollide = false
char.HumanoidRootPart.Massless = true
wait(1)
function KeepOwnership()
 
  
   for _, v in next, game.Players.localPlayer.Character:GetDescendants() do
       if  v and v:IsA"Part"  and v.Name == "HumanoidRootPart"  then 
 game.RunService.Heartbeat:Connect(function()
               v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
               v.Velocity = Vector3.new(25.70,0,0)
               v.RotVelocity = Vector3.new(9e9,9e9,9e9)
           end)
       end
   end
end
KeepOwnership()
char.HumanoidRootPart.Parent = char
char.Head.Anchored = false
if char.HumanoidRootPart.Massless == true then 
    KeepOwnership()
char.Torso:FindFirstChild("Right Shoulder"):Destroy()
bp.Parent = game.Players.localPlayer.Character.HumanoidRootPart
bp.Position = game.Players.localPlayer.Character.HumanoidRootPart.Position
bind = "t" -- has to be lowercase
mouse.KeyDown:connect(function(key)
     if mouse.target.Parent == workspace then bp.Position = game.Players.localPlayer.Character.Torso.Position
game.Players.localPlayer.Character.HumanoidRootPart.Position = game.Players.localPlayer.Character.Torso.Position
end
    local target = mouse.Target.Parent.HumanoidRootPart or mouse.Target.Parent.Parent.HumanoidRootPart
if key == bind then do 
    task.spawn(function()
   while true do
bp.Position = mouse.target.Position +  Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
game.Players.localPlayer.Character.HumanoidRootPart.Position = target.Position +  Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
task.wait(.175)
end
end)
end

game:GetService("RunService").Heartbeat:wait()
end
end)
end