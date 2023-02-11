local function velocity(part)
   if part:FindFirstChild('BodyPosition') then  
       if not part:FindFirstChild('BodyVelocity') then
       local bv = Instance.new('BodyVelocity', part)
       bv.Velocity = Vector3.new(-26,0,0)
       end
       part.Velocity = Vector3.new(25.70,0,0)
   end
end

local function addbody(part)
   task.spawn(function()
       local b = part

       local BodyPosition = Instance.new("BodyPosition", b)
       BodyPosition.MaxForce = Vector3.new(1/0,1/0,1/0)
       BodyPosition.P = 9e9
       BodyPosition.Position = part.Position

       local BodyGyro = Instance.new("BodyGyro", b)
       BodyGyro.MaxTorque = Vector3.new(1/0,1/0,1/0)
       BodyGyro.P = 9e9
       b.CanCollide = false

       b:BreakJoints()
       while true do
           velocity(b)
           game:GetService("RunService").Heartbeat:wait()
       end
   end)
end  

local function getbody(part)
if part:FindFirstChild('BodyPosition') then
   return part:FindFirstChild('BodyPosition')
   end
end  

local function bringouttools()
   for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
       if v:IsA('Tool') then
           v.Parent = game.Players.LocalPlayer.Character
           addbody(v.Handle)
           v.Handle.BodyPosition.Position = v.Handle.Position + Vector3.new(5,0,0)
       end
   end
end

local function randomplayer()
   local output = {}
   local output2 = {}
   for i,v in pairs(game.Players:GetPlayers()) do
       if v~=nil and v.Character and v ~= game.Players.LocalPlayer and v.Character:FindFirstChild('HumanoidRootPart') and v.Character:FindFirstChild('Humanoid') then
           table.insert(output, v)
       end
   end
   if output ~= output2 then
       return output[math.random(1,#output)].Character.HumanoidRootPart
   else
       return false
   end
end

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
   if v:IsA('Tool') then
       v.Parent = game.Players.LocalPlayer.Character
   end
end

task.wait(0.5)

for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
   if v:IsA('Tool') then
       v.Parent = game.Players.LocalPlayer.Backpack
   end
end
task.wait(0.5)

for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Right Arm" or v.Name == "RightHand" then
   v:Destroy()
end
task.wait()
   if v:IsA("Tool") then
       v.Handle.CanCollide = false
       task.wait()
   end
end

local plr = game.Players.LocalPlayer
local chr = plr.Character
local num = 0
bringouttools()

task.spawn(function()
   while true do
       for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
           if v:IsA("Tool") then
               v.Handle.RotVelocity = Vector3.new(9e9,9e9,9e9)
           end
       end
       game:GetService("RunService").Heartbeat:wait()
   end
end)


task.spawn(function()
    while true do
       for i,v in pairs(chr:GetChildren()) do
           if v:IsA('Tool') and v:FindFirstChild('Handle') and v.Handle:FindFirstChild('BodyPosition') then
               velocity(v.Handle)
           end
       end
       game:GetService("RunService").Heartbeat:wait()
   end
end)

task.spawn(function()
   while true do
   if randomplayer() ~= false then
       for i,v in pairs(chr:GetChildren()) do
           if v:IsA('Tool') and v:FindFirstChild('Handle') and v.Handle:FindFirstChild('BodyPosition') then
               velocity(v.Handle)
               local target = randomplayer()
               local pos = (chr.HumanoidRootPart.Position-target.Position).Magnitude
               if pos < 375 then
                   getbody(v.Handle).Position = target.Position + Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
                   task.wait(.175)
               end
           end
       end
       num += 1
       game:GetService("RunService").Heartbeat:wait()
       end
   end
end)