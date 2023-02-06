--[[
    Method originally discovered by ShownApe#0001 (TeleportServiceLover)
    Mains things to keep in mind:
        -BackendAccoutrementState is a hidden replicated property similar to NetworkIsSleeping.
        -ChildAdded or ChildRemoving needs to be triggered in order to update the character.
]]--
-- fling part by joshclark756#7155

local Configuration = {
    PermDeath = true,
    RemoveMesh = false,
    RemoveHead = true
}

local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Character = Player.Character or assert(tostring(Character) == tostring(Player), "Player character is not valid.") or false

local Torso = Character and Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid")
local RootPart = Humanoid and Humanoid.RootPart

assert((Humanoid and RootPart), "Humanoid and RootPart does not exist.")

if Configuration.PermDeath then
    Player.Character = nil
    Player.Character = Character
    wait(Players.RespawnTime + .05)
    Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
end

-- Reweld to Head Method (Optional)
for _, x in next, Humanoid:GetAccessories() do
    sethiddenproperty(x, "BackendAccoutrementState", 0) -- This part is needed for collision
    local Attachment = x:FindFirstChildWhichIsA("Attachment", true)
    if Attachment then
        Attachment:Destroy()
    end
end

-- Drop Hats
Torso:Destroy()
RootPart:Destroy()
for _, x in next, Character:GetChildren() do
    if x:IsA("BasePart") and not tostring(x):match("Head") then -- Head has to be deleted last
        x:Destroy()
    end
end

if Configuration.RemoveMesh then
    local GetClass = function(x, v)
        return x:FindFirstChildWhichIsA(v, true)
    end
    for _, x in next, Humanoid:GetAccessories() do
        local Mesh = GetClass(x, "SpecialMesh") or GetClass(x, "MeshPart") or GetClass(x, "Mesh")
        if Mesh then
            Mesh:Destroy()
        end
    end
end

if Configuration.RemoveHead then
    local Head = Character:FindFirstChild("Head")
    if Head then
        Head:Destroy()
    end
end
local bodypart = "Handle"
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
bp.Parent = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Accessory")[bodypart]
bp.Position =  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Accessory")[bodypart].Position
for i,v in next , game.workspace:GetDescendants() do if v:isA("Part")  and v.Parent ~= char and v.Name == "HumanoidRootPart" then 
    do wait(3)
      local target = v

bind = "t" -- has to be lowercase
mouse.KeyDown:connect(function(key)
if key == bind then do 
task.spawn(function()
   while true do
bp.Position = target.Position +  Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
 game.Players.LocalPlayer.Character:FindFirstChildOfClass("Accessory")[bodypart].Position = target.Position +  Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
task.wait(.175)
end
end)
end

game:GetService("RunService").Heartbeat:wait()
workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Accessory")[bodypart]
end
end)
end
end
end